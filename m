Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA0BC9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:36:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7mS-0008UO-KS; Mon, 28 Sep 2026 05:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7mP-0008Rr-QQ
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:36:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7mO-0006gi-4G
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:36:13 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MI3Q546996
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1z+PZJbObkGN/CyEI8Q3Vfa7mpgsIaWhGtuak7+0gPA=; b=b9r0HwnvYToiBRRX
 Zk4kIWKNHEBHTY6tm5OnjdR+kCy97m6mXKc60DgOU6jg3vrY2jT6jU0X0IQ1l7/p
 Ni0umWq9ZZRq3lHmeFF5lTfPR+Bmbr70zqzdtWKXOzlmMnVITQ/ALao9o41qEVjz
 XjWvSjoBDCtSf1mMOlRLzk7vGkomlQdstRnvDCEamzz9kzLo/VtFsMLGTvM1evTD
 BBPgL4abncWDCCTyXPnRku+gaKzrWXGUyRG4QRkdwSokOSi0EfnsrlD+aMlzI4b7
 3vLgLM1mFKMWafs52kJB4GJuQUCjRjoLEV85vU9yQ139OGy7VSK166ZsCR6ILKN8
 RfqNBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49u28-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:36:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93c5d7c4c26so456200085a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588170; x=1791192970; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1z+PZJbObkGN/CyEI8Q3Vfa7mpgsIaWhGtuak7+0gPA=;
 b=GpxlBbuaRkrhjQRDjAjSLE+XffgQIE2o3dW0K0Xey6fLJBTIoVN6OAWaK4tsHgxplN
 B/0VksHKLN3GxFAPsZ0Toa03QjRlbF8NFZXjuATxflQUN5ZWtK7A0nLNcv2koD/eRNO9
 DLTtpYy0C45z2lpTL4QjQmleG7HZ8lDPNrpweqGRNREY20zcvonRD8VmDMf+he57OUGU
 isaZ+brJ/tyOqKr3JUB4BjmKLdv0LwEWBJra5hTCh36azzs9z0TtWN21Ld+K8NK5dDPI
 jorF6ZRUK3Vi7+DMLHvLhxitPIyVl66WJevY6ABwqJR+NtV85vbgoCYWYJmgvysFkKbJ
 SJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588170; x=1791192970;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1z+PZJbObkGN/CyEI8Q3Vfa7mpgsIaWhGtuak7+0gPA=;
 b=WDJtY/iIc6HuehFzHNM0aj6pEKGURX1jD8/xI1obFkUlF2xmXht8bdEHepFQE9Jewv
 pbQHQv6g2/+ESLP/q+nuEjpQ3fVgxG7B56vmiy7MYru+x4DMiUyhtOrLlRnPKHVvNYBz
 ktWfSuX/5gbQrpF3p5Q9uLfbtz9sLWOPX1fuNJe0S+v3y8MRyYN9cK03qbJsAkFk1MSy
 0PBTGNbp2g62XGMNDR16Ilmj697eCCpj32DAOGB4N27PDDV571CxhYi8LviFWBvbsmNT
 PlLX7T+cew9V+gDFdVXWapuAXYR1pc1JH0MiWtIT16Ohw/s5+0yqMUZvdRTm5V/PxTix
 haMg==
X-Gm-Message-State: AFuF++n7Dzg20HzlG60rRPeHzxjJx7/kxpeUXzE82T0F/d03Rq1W/SdN
 10SMO5QfBSQTQLfmE9QZPV6mhoc92NivIAGg7kK3QCf3pBININRtFAaIBHL31716LeEI1kbcNXj
 MkcaBpVLa80j80eCDU5Sl7vH1N0AOBwcAoDINTXKajgXnWVFh1OYJFxw=
X-Gm-Gg: AYBFou2zDLqrTRon+4IQgk36dIEUUhBDlugbLPSLAnxCxfTFwGwYuNst7wykw0HkHrA
 7RzsB+eu6ZLO6JUtt9LvFvUMWPPUuLx6W5SqVz7KTKUpnA0xuVwfe1GR5//ZDYmxuhAPCFCP+f3
 KJgCxw8jAfQJxvjPxkMo90Q5tz1YbPj6uZfXrPphs+mNSFPEZ/IKT24ucMcrvuyIPtoeMUH0dqX
 rvY2LJIF1+O7bG+e4P4ocIlX6v9g1eSqZv901jec7w0KHfRg6gpl+oLdtRdA6kDJOhAC0eA55aW
 XNzlJSSOr+kdPAntA1WFuNi4xHLFBMjWbTvShXsX+hz9ITGQ1dYCL+Cnf87uqEBE0XYtOJhbGOt
 CdYF4+vN3fMFvROKfi3AV0xMhcudkioWIkA==
X-Received: by 2002:a05:620a:2587:b0:93a:2a59:3377 with SMTP id
 af79cd13be357-93c43e0e96amr1947550685a.41.1790588169685; 
 Mon, 28 Sep 2026 02:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2587:b0:93a:2a59:3377 with SMTP id
 af79cd13be357-93c43e0e96amr1947548085a.41.1790588169292; 
 Mon, 28 Sep 2026 02:36:09 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a74538asm25270986f8f.34.2026.09.28.02.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:36:08 -0700 (PDT)
Message-ID: <eaece176-c8bf-47e3-8ef5-4c9be68352af@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] target/arm: Enable FEAT_UINJ for -cpu max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F4L2zyh_TUZFyalAxI96GlyWoES9G1xO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX51XtxiEq5xz0
 C3faBOFTg6TB3p/Vdfor7vvIban/dOzL2y+bicMhxZS/iCip32TwVDosYLIdg1wj0lZ44qMjfX3
 nFLNOTJy/H0aWDQhWpYgupvsUa+ITPLW39TxD991KDvSrecckN1g5WU3BfanIjMpmhhRVGG7Meq
 n7nErg4vbAFC7gBYSYsxZ+DTNn7XAm/vjJ8kleZ9aP2TQ+WhpmGQQ/nUtYOFTKbnPP6eNIEzhSQ
 ykYkRJFaHmb/cRcwpONqBqAlr7J5m+s5FkfkFYTnksdGAvQXGXfbOMnUrsZUqFmqJ/JUYldQUrY
 LPHp4C6G+GVKFHP7vKPQBdtwV1vHLINQ6aRB9EPd18PspUCyrLAwAHbxQ0wh1IyCwwx6pNNjZVA
 QJ+I2H2+i/ro/oKaeBkg/6YGHcMGZWieRZmLynkrcSPXIxelC3mQ/otAq4musDHuM2Tu37GLHPd
 M0o5QxItVOcsIrmv32A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX/fWxdLoFUnRX
 inoijGDd38Kv6zk6l3QhQSsBS3QI5nOVWkM6ih4rtQlxWiDtD7XpXmtP5AzAYV9XWMulowK3aDL
 NTaSY0dQBGpuqpry2wGRsHonid+/2GY=
X-Proofpoint-ORIG-GUID: F4L2zyh_TUZFyalAxI96GlyWoES9G1xO
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba350a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280038
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

On 25/9/26 23:50, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

