Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD07C43602
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 05:08:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whKWT-00078M-T3; Wed, 08 Jul 2026 01:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whKWR-000785-2b
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 01:08:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whKWP-0005PM-4C
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 01:08:34 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66842RLM1509183
 for <qemu-arm@nongnu.org>; Wed, 8 Jul 2026 05:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XgR4wtmwP7w1QnHwTnQyNfbdL7Tc1aCAgLTf8gtHK7s=; b=NaaaaLRw7K1ISHTK
 HS90Qjx2eSpnq0cekODczZeutGr1t5T+c+IDQo6vVVwYQ8sthniRCiwvn0yROv1r
 57VZNtPb3mZaccDHbHFxBZh1H3CfJ1/zprKs5cjFCGHhNL5286WjEj8JYHeLo6QH
 yVJCwfAVvrFXPbSoMcjQ/wElFjG6T12LvisrL3W1Z8mjHpCUt9IX3RYaPM5JqfWq
 ywpxBptqwFriZBCCjqwOsdDTpFZuUvGA0Z2NjxBJZ6eLEx6iiCRFu/r/xDJ6AO0p
 ZzRpy8c2VH97NuoqZRPZ4OamEArmeRLIf9fnf0CKaJx0QLZwD3LUtSkdW4tLqyl0
 Utelng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be58x7s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 05:08:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8db414c7so3849051cf.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783487310; x=1784092110; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XgR4wtmwP7w1QnHwTnQyNfbdL7Tc1aCAgLTf8gtHK7s=;
 b=UQZPT/+cuXjIfxVmafnum7DHJmnr5YzoNjMWiRJoosvZ3Yo/4uE1ajNcCoM4M1BwrF
 ZLlxCKruKQhjv9jbUjQw5npWfAhJ0qULBgJIqu4Auv5FKKZzltC0socxXPOQuoUNz3MX
 cj4RRZfLyw3YrN7CSxf0P65i4nvX+oQhN99lIPs5FQvQzxcHqADC8p6439r4fc/iBWn0
 K3I0ulD5empgfxIf3NT/bT8PMZHHXO22Y71mZLELRpPfn74YaLh8d35WAe5xWXn2RBqJ
 su2KxlibK44s8Hxcnb/Kl/0iz0Blyz1nJWhcKNS9hBZwMw/VaT6JnhProM5nVSzq/8KW
 XuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783487310; x=1784092110;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XgR4wtmwP7w1QnHwTnQyNfbdL7Tc1aCAgLTf8gtHK7s=;
 b=OfUJHaqlKqVos6zKLP+GD2wVi2Y6oUzU47ZQMTKPPCqPuj1hiDHtAof8cGv8hWfq3Q
 058svwbMofHTAPjipj7CmQ2j2ZYCx/3Z9Vg1/tm5nlqDMmS+g0A8wtDedXIzi+fH2uHv
 esty8DvzrfbGevQCJsy8U2lNkcSetlZauPVOBFtuzyhfMngJyQGFgFxoWVbiNwpW05h9
 t9QwuprC2o9xXCVqLgF5fBqUQG/nctVYdME3sDN1yLfmf0Cj8g1VVHHcWNgA87X+2L+n
 6MqysOU0Ul5sFklygIPG8brJ4KyBC+U1kXH0lpjFsK+Fo88bWguo9s8TaAsV1So6A1/i
 /s7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVp4WOeaFVdqOyxmLEzzqydKvnq2M5vJadw4uou9aoKXYEkAGHtaeGmbiOfgf9KpFeO4syB/BzxA==@nongnu.org
X-Gm-Message-State: AOJu0YzrNc4pnxrR919Hp7NpLaz3TJtrxBdIL9cyfeOIeP/sPy4fditG
 hhVtb/WtUMbJTVHvCOcY7izFyXRQcEaMDl3tO1EGytGkP3vg9lx1odYm0zwyaYqr6EWTO7dMEQo
 mUgOBUc9N2kRr+w1i+HcNSAfx3Bo8TpBzP6XUaBEur6JytE3t+yqqMk4=
X-Gm-Gg: AfdE7cnvQRmESyuyPFVMvSDi8Hjd2OrFmT7glss7f0Ts+G7Gr8MtylzMSnNi4AroCrG
 OtiqgdNk13aUtAbYQjKpUg4Y/QncWrSuF5YQZ1giJJv4T7Tjr/i01MEs08P0Y/Ro0kPlyYO98s0
 q3JziZE8UtZ8OkJGvLkPUszaK0EKK0XE3Q7YptfvawCAgDkmyR/4/GjOTadwBUQjWhHbSdAz8hC
 RvFuWLnlaMYWLUFN+bz/+XLSNhMwvGUE1f/s4ypXqZvaZPhko+y2fBXNQXwq+H4BFJILHy9vwtr
 XCiOIxSfzziyDTTc0eAFjIXOQR7tZfAOCL027iBQOuCoxMSA6eTK9j8zHEdfCbhy9gkWUYm5nyd
 dGolP8P2MjWHYC/JNZT8CfxPnnelyOVo=
X-Received: by 2002:a05:622a:258c:b0:51c:c67:2042 with SMTP id
 d75a77b69052e-51c8b49aabbmr9682741cf.53.1783487309589; 
 Tue, 07 Jul 2026 22:08:29 -0700 (PDT)
X-Received: by 2002:a05:622a:258c:b0:51c:c67:2042 with SMTP id
 d75a77b69052e-51c8b49aabbmr9682551cf.53.1783487309181; 
 Tue, 07 Jul 2026 22:08:29 -0700 (PDT)
Received: from [192.168.69.209] ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e54a067dsm27608265e9.0.2026.07.07.22.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 22:08:28 -0700 (PDT)
Message-ID: <a1a9ca36-7742-4c4c-bec5-4de5fe92bb7d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 07:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 02/25] target/arm/kvm: Return immediately on error in
 kvm_arch_init()
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-3-mathieu.poirier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707224306.1202330-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4ddb4e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA0NiBTYWx0ZWRfX/jKMG9+dey8D
 7jR7k3KmQTK2QfpGcBJwFTy94BoizX+saceOAwEMYA45tsgnxKViLkAM/6Zo7Vt27KAM6NMvNb+
 PHKHyJ6OCl4n5iYMRquGK3FvI18q41g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA0NiBTYWx0ZWRfXw+qFxKEChoZv
 xLIyzAjuZ5LGPDuJqXCn9MHup2nzRfamuIHELVfHHN/geGKuhSQZBYxNzH4Wg1KwEjtRPr9HjJA
 BEwB1/leugTlEkDy/AJvP3O5RFQx5/CXRV9hhEQuk6j1qU+wByVv/ILmUJWWT9KprO7dAJCRMDA
 6Euk5p3s75ZJeHPuT0LlI27ZivB/geZTwDC/aMVrI/fKRmLCISXLG1aVk/aFtXe51SUsBYX5eY3
 GlbVkctqZo3nQseKHAXdrCOQK7TaGWm/I0LehvLGlN6NR4lRrQsie3E9b/vQRptzoF4eoKaogwO
 XP6Kc77riEtWnKRjOrPognV+6K5YVxl0MrVuLAv/NnG6YTDJRLDwa25hOypK/aoiMpd2jtlt+uQ
 3/qRNNTXV3rhwcvxiL7mWX5Iu1BL15gxEILjo6eH9vSmb0QLWNXNV//meDJHU5ZQDDTknFW/UeA
 Yub/sqdt422nT4Ask4w==
X-Proofpoint-ORIG-GUID: 55VCEdFeXHjwI5WdDSBpiFpW-SY8Aiog
X-Proofpoint-GUID: 55VCEdFeXHjwI5WdDSBpiFpW-SY8Aiog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080046
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/7/26 00:42, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Returning an error to kvm_init() is fatal anyway, no need to continue
> the initialization.
> 
> Leave the `ret` variable in the function scope because it will be reused
> when adding RME support.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/kvm.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

