Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E4AC624D4
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 00:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1v7N-0002a9-Rg; Wed, 02 Sep 2026 20:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1v7M-0002ZG-1C
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 20:15:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1v7K-00083b-7R
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 20:15:47 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682NHflZ3435168
 for <qemu-arm@nongnu.org>; Thu, 3 Sep 2026 00:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ihIYbwk9MLemaviwg136qnzZ070iXCIt5GZ5ewBPZjE=; b=GFvFdtFFFAR4uVf2
 y27ZvO2p0YmUzxn48yav1mf0g1kdb7HOQiy1BY+eMQ7gfKMgBags2q7zpTbEhmpo
 gJBA1FKaXuSqgml26auhG5O1nw2BxSgfxwUGO3Us1mn8M+XmzBk2vPXjDpjJyjgV
 ZE6lNr3SToQkbBa/CAVKVpeMwiGHyEwCDTSP7ybdICUX4wv6Mf2owwEmVs+hGjNU
 Dyxk9uTYfA6UqCWeJRWSABdxnxpXvLlnTrgBrELi+zD6sD1usZ3pFEP7Mywr9XfH
 byYD14hLpSyxLDxF6oBjaDHU7igp/v+PvvC/TJgwMdkd2OG5/U2j5mC7E2jZT0eV
 KGHf4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy3qxk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 00:15:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-53013dc2330so46943711cf.0
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 17:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788394543; x=1788999343; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ihIYbwk9MLemaviwg136qnzZ070iXCIt5GZ5ewBPZjE=;
 b=GD5RbwdFa+GgpC1ZAuAM/NH9eQo48B3SJEFI/ZGxGiC8alrWkb0RQrizD4Oah1NXoe
 nSCdjWy++xKYjwWt3Jwj143+/QeqDcvW08exw1GjwEPgl+8owCfpP35SckfPMuw/jnVn
 MmxA/PxjOYuHWZ6RmGQ6vLPrudy0iFypYreJMg2t9M70Q7xPvbDu+P1zft7V8jINRIVn
 lNhnSJ03vdjENbuK5wHmtN/C4I2W1uxNoeOa1Tu4oGtLWGc0XfTAI7vAl6peBxFpTbWj
 +TGFr5gcrDUV2IGzpD5LnlwtYzpr02lHwxJW67yuUb5Mwb8eYcF3/arr7xjsL6zeKeV5
 f5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788394543; x=1788999343;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ihIYbwk9MLemaviwg136qnzZ070iXCIt5GZ5ewBPZjE=;
 b=FMdtNIAsRl17QcmfMoDZecc/smvYq+pMte2fYklzB7gPtY7OiClhsfjbOEnHhttAWq
 l25LnNGXribEnBCKlRhOTkCGeJNV93vmBc1vU5uGwu1pBy25l0s3DTeKXQn6ze9a0lUz
 /fJi25ytgXcajMfN2kLGCWpxlYEpdycPnH1qEUFyBAWSsNUCyjenRWvlLDWOuRt5WzFX
 6Y6oMpElqcqusJErdUPi5AtHNG7za/BExNHFQQaEGxXpVDD9FZIbno91Gs0ZYwzJd/hH
 E7gcA8JQJ3+KVzyAzdQVSwf5T3WNFwAkvqRCernwhgo6AZIbRsgGKBXWvP5zeqtlDbmQ
 IQvg==
X-Forwarded-Encrypted: i=1;
 AKwUvByeA/MDfgFXf9qZH+HjleHFQu/e/pkX3Pz7+ZqKXfgXsOjoqdpFI/fkgwsAClZ6dGMdetZwRwroeg==@nongnu.org
X-Gm-Message-State: AFuF++kpBF40COvMSUnTIdM7BvrsMs4GALwtE0Yv6eY2UVIU7w242m9l
 jw1nW0ZPhHvjl2gC1jqvWkxReR2MJk0z/NISWNZGCRdyDhd2/kUEcfaMu2esCZmcz01iV4ZJPf+
 XNNdkBfZr/7ChInc/c8swXejCSj/JW5lHRA2S17iaj7wZRFD6JWFYORk=
X-Gm-Gg: AYBFou1w5/0I6Hian5eMaZUknR+UOjbOmsU9d+Kd1LjVnkJwtbCVvsxASii7sSClBUp
 Ii8MVYS0yXTWnkjIBoSk6Khm2hVjZBLXKfwEf3jDsEG6KaujSOxeHVdjzxRNzJ5yG3sB/jzTGwR
 lv/JhzwimEZ3lm3Q+NciDSEEuPwowJjsuzq7SZN6D33cTSGCY4qPiyKItlv8W/itL1eT9fon4U8
 Mi6PeXInAx9ZrNiMjqHuJtbWJM0f3BjLGlxrFhK2296/TJcvh1dxQ0TdBqSEejy8lJwB+pPQ7Y2
 8lVZPW0D/FgXyuM1pkfDKq7xrN8LZFSAmZLJXPZOt6jhr8RKv3bkdlNIrwO/vbhBlv45gOOpzmD
 cdXI3cKqWdvtLEJFJAi8T0G5ZCcjotiCvUgn8emwwuQ0ByHbjHWG8v3EbgH5gg1I+QcIdzmHnli
 V7hLw7
X-Received: by 2002:a05:622a:4014:b0:530:3387:8cf4 with SMTP id
 d75a77b69052e-53036d17a25mr116478861cf.31.1788394542630; 
 Wed, 02 Sep 2026 17:15:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4014:b0:530:3387:8cf4 with SMTP id
 d75a77b69052e-53036d17a25mr116478051cf.31.1788394542019; 
 Wed, 02 Sep 2026 17:15:42 -0700 (PDT)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net.
 [104.54.226.75]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9ef0e9b1sm30747006d6.43.2026.09.02.17.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 17:15:40 -0700 (PDT)
Message-ID: <64ef65dc-fae0-44e5-ad96-c806e0a6d8d5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 19:15:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] target/hexagon: Move to do_interrupt() (BQL
 acquired internally)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-9-philmd@oss.qualcomm.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260902152044.31291-9-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98bc2f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GUtW-XfJRLY4ZrtkAG8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: e14z72Ptrb-4qz7Vo-iBbxj5mETAFi68
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAwMCBTYWx0ZWRfX1rDX5BeItXNp
 jOWf259r6FOEIOOLaYD5UBzXwNegmIGInW7HsxstVaeLt0KTz9WgW1qcN5T/ATHqziZo8IwDgSi
 U2im5j5vUsDacRjuhAGJ/lEWdeAHJiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAwMCBTYWx0ZWRfXy9Oy65xzinpV
 hJ7RWr9JhIXE8JoxeJnwZDUuQStKL5dvCpLBDr3Ta0CTUQi/PsVPr+8cCxaDZI74+tm03cfoPm+
 CCibQnyHCEwTrjTDBBHMrPxVouX8XKu17iDfDaHTCed0MtUnCGwToaL2RNPuOGep5j50ynTrH/f
 WGeUOiRmrgra3wCckXbpaRjDaZI3efFLHv4uZ0ZpoDsdObhMx/nk86t7wchpe1gpBBsFxxpxdZJ
 PjU9KUfhmHur73EP9enKoFXBWyEf4BprdNooFHfT68tzm76Gs6qHXzrVfY00sWrSyDR8Io48mZs
 6n74VDR8b2ZDo5tIWQ2s3mCPtVWUodgkdaIE/bHCsqg+weoZhq24aAwMQjgIQWvsOO6VTXmFSk4
 qles6JRYL8OXRPmM4BaCJuFHgzAo0fYywdsxfOFnjUjApUvSOAnkvoqdl8e1q59dOG8wKMrldqh
 LJsVd9Tr89IKF5+ZZvA==
X-Proofpoint-ORIG-GUID: e14z72Ptrb-4qz7Vo-iBbxj5mETAFi68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030000
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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


On 9/2/2026 10:20 AM, Philippe Mathieu-Daudé wrote:
> hexagon_cpu_do_interrupt() already acquires the BQL internally,
> so register it as do_interrupt() instead of do_interrupt_locked().
> This reflects the actual locking model used by the target.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


> ---
>   target/hexagon/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index b5dcbfc99db..7067e5b70f7 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -769,7 +769,7 @@ static const TCGCPUOps hexagon_tcg_ops = {
>       .tlb_fill = hexagon_tlb_fill,
>       .do_unaligned_access = hexagon_cpu_do_unaligned_access,
>       .cpu_exec_halt = hexagon_cpu_has_work,
> -    .do_interrupt_locked = hexagon_cpu_do_interrupt,
> +    .do_interrupt = hexagon_cpu_do_interrupt,
>   #endif /* !CONFIG_USER_ONLY */
>   };
>   

