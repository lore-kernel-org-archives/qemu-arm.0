Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454F7CA5FA5
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:15:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWkN-0007oe-8l; Tue, 29 Sep 2026 08:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWkG-0007hP-Es
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:15:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWkF-0002s4-1U
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:15:40 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCE6b9931782
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HDyUKxMk6fdjXc4X5OTsagT2rKmRNnJMdTJIJSeFuQA=; b=cURpSJFbNX7m4mXd
 PJ470Dw2B86SShvqO9XSwTcuFzLqzw+8F/Ywt2ocpuQNKQ4vT4xqWsl/LAivOhxq
 bJq59lgO0ynkqBz99rwHHSlcIeuoq0lH+uAQ0QlDNJAacig1CWISBO5TQfgIMEjP
 7wV8yioyhPmKqeBFahv2tj902xR+cigweqIHQslbE7kZJRWobscvUAVFkEwuzuLr
 WBNh/JOhnhVO7UZnLDIZXqoEjwCWNJBwK7j2kt7+mQlO3OLPGQEAB+D9q1SGFLDg
 i/z9Qocj/B7cmdAS2mf7B2vE9x3g1pqUvI+Wz5NvP7s4HvHo91Z2yzliEp/8v8tI
 axmNnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxhvxy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:15:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93be1861d2dso689958285a.3
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684137; x=1791288937; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HDyUKxMk6fdjXc4X5OTsagT2rKmRNnJMdTJIJSeFuQA=;
 b=aFdR1NXtl/3+HfhPAq0yAv3jMda4hGVeciz+M210G1WTsBx7pFEh2Vs/zZ2r3gRFNV
 i0hL67VW4TJ4rxwkUyyp4FzYXzEvJEUYWVVuiyQ5UiHWY1Wa0PiE517kYR5kkr7rZ73+
 fj0o8mvWQ8GppEcyLOlIlRVDWHKiUp1ecNmUawGNy0mXE1TVjsGaKZr+uysXv/KB5Stf
 hTMFVAfuzLS+Yz6nYMzoCEFXdJKNEEsxCBt/LMA3RmQhiWWQLNOV13YUhVw6V73/Wo0m
 ehuangk3lQtCnk+MrKnRdWD5/nad3bzMGA4MSwxBEDnK7ZRxde3Z3La0thQ8KmO3L7qk
 a9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684137; x=1791288937;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HDyUKxMk6fdjXc4X5OTsagT2rKmRNnJMdTJIJSeFuQA=;
 b=UZPNnpvQOYIK5+prUe7f95tZPPOgVY4xRpoJ+Y17+SZ0wa9xvajlBJ1cdRchtv1srG
 Cc768xUjLGTJZRfVJWwHhnBJ1LekGYpzSnjD5fKsrpu8WeMdhWbad3K5avi7QdkszjAO
 gzpTRW4xtVEaQ6qwS5SIdhEDa7wnFON6OXrPlcZvF597/Ssp3ziOAs0CR43T5CfEXwyI
 2VGRfClQEccXpyV8jwceoNh4vbDEhpEQyteZXK9rOUCzDeeDjqUWiIm9AoVOLdIarjbF
 L7UnfpwXPuFW4qABTfrkNOYWs9Elny1G/XOWYREo9NkBgyzi/XpIDHyt2nPE5FysbfK2
 yKAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4+LQ+oMD1oeye6AZGkfgw9avUrJ0jgkfRmNznnLmpCtLiKc/q9YjKkBE/5L+6HK1L58LQsQr0rg==@nongnu.org
X-Gm-Message-State: AFuF++kyn9vpwtBpVbni4+aCJsQ7oHhy8WkROS1SxaHctfoRLTmx5nKc
 mpSMqKwu2MyU1oIpfG28fUQpVq46o1OZ+ZW4YONBiZY8eswpmPbhkHd6QQrApmlS/ucMKqq2p68
 Xs3sKVXEBWLbZF1yT9WVr0GuUAQ7aU35LWQm+Uw8gRUO2NjQZm2FyIZJkOrv3bFI=
X-Gm-Gg: AYBFou0hgMk2AIwsnprpGcc/gwBTOKpT5Uhlvmed32NRrBxAOluQuTKSb0F7WaGLALG
 VDRZCZvf2suj3HkghQ7FsQV1aVJ/v9iyZ2YOseIrCVFXvmeagNc8PCgHTO+jmTXYCLeYLrwcqNm
 UrwxcC7KPcB6xSGuW6UW7H3SW035tj+h8byjxfCujJH4km4Ut+n7SHwqXvforuYTjl7S6/ITNF8
 thSaXFxXzuFWZz8sMRZ1YAo0UTMcyzDf3K21KMk7q8Zgl3PaF8CDAaTtInTHkLwcO3jse94sK5C
 4H3TaNn001z0Txd3yRyxRwOTQAChIxIh0glDNSjN1c1oPYLFvQnXMktm/+p1swMHSSGEjEc1OJA
 e6QpYTluCN7paw4LyfijAe4525B7V4ysmWQ==
X-Received: by 2002:a05:620a:404d:b0:912:1206:ddd1 with SMTP id
 af79cd13be357-93c43b8339fmr2537124785a.1.1790684137203; 
 Tue, 29 Sep 2026 05:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:912:1206:ddd1 with SMTP id
 af79cd13be357-93c43b8339fmr2537115985a.1.1790684136462; 
 Tue, 29 Sep 2026 05:15:36 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af50923f0sm3690295f8f.31.2026.09.29.05.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:15:35 -0700 (PDT)
Message-ID: <3dfafd8e-2316-4c38-b87c-9bcce4e06f2a@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/42] docs, tests/functional: Drop redundant CLI
 arguments in imx8m*-evk invocations
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfXyzm0EcQD+6TJ
 OXmPFJjul6skHgWt2vbCSc34Fcge2YKFqIM3yfmbAqI/q7phGd7EEMyMJsRh6wDeP8X76jZL06O
 IHn5hqJV/l9Pu8snRnmc/ITLg9Te2bg=
X-Proofpoint-GUID: W2vDmVta3V2deB721QCp5XemeKL6faI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfXzMY0Dx9PRbrq
 gZs+ufmPRCbAq48goHRl6ZSBENRIjKE5Zr1Z01KlCjYr7OaBwLVLoBrG/bCKLtI7++xJ5GUQEN/
 /qO3udQX0MYi1/PfgVwURT58HfAFdxR8QoWcb8RNJiyGhcdBr+RM8QHXYF+aTG1UI6051QXNZqG
 QrYEyG6C0+1eP/3EUZt5dV26rwvi6F++MSyjYtS6wftBnKlLHoEW7EDghGEZ2KtGb7VkJiqlx0Y
 SQ2zyoCevKWN+g+h2HQ2qtwY1pW3s5uSRRBglQqETh34XWrBpKGT9WF2Nz3iypPKTYQmAWI9dRU
 aDRIy+dY8B3VVuoSz+RRg3az9Tw5ivg2KraWMWVhamoVey+4/ljAkHGXW8vMNoGKhYC23rSIrM1
 1Nth5l1/Ld5cMD/uRM12MtJdOVeN9NkNUtPE2QVS1nOuoYOQW3pgJ88p1arOgWVatAOWjOpIKbP
 aBGgj3FpZnB5EOX3YUQ==
X-Proofpoint-ORIG-GUID: W2vDmVta3V2deB721QCp5XemeKL6faI9
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbabe9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290048
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Both boards provide defaults matching real hardware. No need to ask
> users to repeat these. Also, remove these redundant arguments from the
> functional tests such that the defaults get tested.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/arm/imx8m.rst                   | 2 +-
>   tests/functional/aarch64/test_imx8mm_evk.py | 4 +---
>   tests/functional/aarch64/test_imx8mp_evk.py | 4 +---
>   3 files changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

