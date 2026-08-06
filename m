Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A89C5AC7C
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:58:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws2Li-0005J3-8n; Thu, 06 Aug 2026 13:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2Lh-0005Ii-5Z
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:57:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2Lf-0005Ex-MI
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:57:44 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676HPRUI2639756
 for <qemu-arm@nongnu.org>; Thu, 6 Aug 2026 17:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fVMm80MZuOIFfsshSWXb8ISJozWwBNCO58IeqlVamBc=; b=SG4ofUqt1QuT9dp2
 ZZ/HxRPUil8/CcBrwwovwxseb/N5ccH0nSul44VLEqlQHpIcY6slY6rlWBJeXt3D
 Jqsev+CuceLDrmPTxXbPL1hi8lBjbIEguzv+hIxwDUCDkgyPL/YHjpGJ4AkvbBQM
 lDMnGfQWVSd/J1m64+T1BBR09txMV1R2YAWuEQazzTWDNbHPqH/6sg2CiCwHlQvx
 8/L6kbwI3UGso5n9ZKx5j01oapMTr4xrqVH9lf4HsOKZXb3D0lCOFZ4xI9kx2zQ/
 H/zF0rY24gfVewdMPZ49hA4EFgIYh7G8KWkrwjUdxKYU3tqETh/ROzfbn98c4Fkt
 jP9CHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvxnfr56j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 17:57:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c20762d21so28865821cf.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786039062; x=1786643862; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fVMm80MZuOIFfsshSWXb8ISJozWwBNCO58IeqlVamBc=;
 b=UKF/69P0YmDYk3Ns6+2jC+FiKm5nvkIDT//9O2PbFCkKqnZsM/bdxb1fWxhasoh05b
 HFlvEfeqWuJR8O5o5ETwFwi/TqphPNk7+H0V06aO5mikhKc29PyH10D6XqFMUj8RQdDP
 YbsBIgOvhHvAbmIQVJXrRWJO1Kaf37NRt6n1uXlWuCdXMjO9/9KeAhAaup65seFtPisM
 A9k1h1d02Sib8I0vO487XpLVDxHlW3TSykioW+XmOKL3XS/+STqE+fPuYp7ec4RUv+Dp
 u82ihERU6Sf/DHcbmbZYZX1Lw/WQUlyEM51FN0QgHBml8c9vH2PCdZveeiKz3gQOZj2u
 Z0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786039062; x=1786643862;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fVMm80MZuOIFfsshSWXb8ISJozWwBNCO58IeqlVamBc=;
 b=sClYDocMMPOEuORUvarInRLj6zJUYzJ9uMeLJlcWfpPzML+C9lDCW1I04J4tmO2XqC
 rf+ig2hMDaPT3cZ4QR9noZYqwGLelCqH+C/JIvdPhUNAbxmCME5w3c5sWG6SdwDB1H/S
 ZGqwYKTgmAIg6gWcZ657tdxA2ntVA390f6qsQg+LC0N8rJGK3bfTx6d/0VUuPZrN/n6f
 QJHtWHFj9UJ5cEnTKq8a97o7iIzVNl7kzzrCvNCSceaiDqp5Go31es0RvCwR7ezRnoE8
 lndMli5DWYKpUJR9CxJUjLiNH201JIrqKnguToNS1qe1/ferJgr/Jb45GouZxcbYqqqi
 XRJg==
X-Gm-Message-State: AOJu0YzSVG04g7umuvq2C12R3uCOVisgJtdPd4wASlqMQEWsUIz4xDcb
 ZY3jj1J9ir46pCvgJmIGvsrrPqH/CSBCGMrlXiggGY5r7ZdoeVAWGxpHs7z1dMl+DhCCDdj06DW
 qnp3/RoP74uZzDEWiSXtV4DIjzlDwDWmx6uIE0q2QpOOCnT5rTqLuRcQ=
X-Gm-Gg: AR+sD11xpGRVlsDGplONdqU5HrzgI4875zj3D1mdO3PB2YErPzUZ8NEdwQ++KLreI0U
 ra80nYhgaCiIJ+qxIcjjFt8ZQ5PfQqq/o7Pd1wqXAIWZozNQZATR+lPXTe2/yp/h/877BY4DbUx
 KfoRYeWdviXSs1i8LRS3vmV8mjjDZcoYboZkYQroziYnVqg7BWPfVWWYm3gdS15pMrUFoa624vL
 dpLYWjM8/Y7n9uRgFhQ8X0RlD60wUwMJqe2tkEmJs3Z0OZIm37a8EUty9zqCT31oP8GAOk9wRKZ
 mZHySjIzfBS30hb6X3OTujdsNv2UuHg4725RBZ4X93i6H3/kRkFkIYv2U1/6QtCqDq7vb1cHCHH
 Ke5TxOjBoxzB85rNiWBxtP7q0QbkPdCo43Dw=
X-Received: by 2002:a05:622a:148c:b0:52c:dffc:4645 with SMTP id
 d75a77b69052e-52ce5f2ffadmr163775451cf.7.1786039062068; 
 Thu, 06 Aug 2026 10:57:42 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:52c:dffc:4645 with SMTP id
 d75a77b69052e-52ce5f2ffadmr163774861cf.7.1786039061539; 
 Thu, 06 Aug 2026 10:57:41 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49952f2e151sm35754675e9.4.2026.08.06.10.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 10:57:40 -0700 (PDT)
Message-ID: <316c76ac-7d02-4414-ac45-12e44aa2aa74@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] target/arm: Sink aarch64_aa32_a57_init into
 aarch64_max_tcg_initfn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260806163939.328201-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KXvQenemzEb7s6oEmGD4qdc2GhHbxC-E
X-Proofpoint-GUID: KXvQenemzEb7s6oEmGD4qdc2GhHbxC-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX8f1WE6OxBVlX
 ikLictyzBLN5wHTQNYAtNRvQarta5NYzv4gkffElgu9tYqWuf0CxPXL6d724WB4tq56vEPIWXap
 3XxLk5f3FDl/y0FhDdKFKvVO2P8ab9bGIyJRKjPTEOaxXCwar/BIFoqTljK395fMIwvdhMvLBuP
 Y7Jz0451JIs1/LfCAH4NPgY8aJc2ACW9pJpWbvRUwIAz56kjjE+9v81tnmfhmoBkvdv8joFENbf
 LAOR65icVrLo8fgS/8ZWfc0CGD12LGOReGtG6Cv7eydsMO586JxHGiiPQfi5QV8toSKpPsDbkdZ
 JxFngNpXb15xW7zRDndmm21zDIx8ho5r24+hZj3yo58Zlo/p8W4hqwFOh24j37B85z7m3USYGFP
 5PNUmH3lI1udIJNPtPGxbWFwUlZn/g+KcopsiAkUdFk0IzkWg1T7NHrzO+Zai0Y3SUq27wERIn4
 YGO+oQrWoGftbVSO7WA==
X-Authority-Analysis: v=2.4 cv=OqN/DS/t c=1 sm=1 tr=0 ts=6a74cb16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX+NjXuYlteXex
 1gcDoHQ+co7GElBR/DHf+CvePnWxxXQl71UI+lIu1S0uYNT3PnUQuZ0wouhqyZx5bPnpuhvu3pS
 hfw2X4HjvNpLneV8LUZx0L6000RVO0w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060140
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

On 6/8/26 18:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-max.c   | 3 +--
>   target/arm/tcg/cpu64.c | 2 ++
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

