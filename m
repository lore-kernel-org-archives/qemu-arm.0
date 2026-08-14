Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06352C5CFCF
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Aug 2026 15:36:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wutwt-0002iB-AP; Fri, 14 Aug 2026 11:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wutwr-0002hd-Ty
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 11:35:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wutwp-0007eg-Sa
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 11:35:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67EFC9rv1731364
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 15:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2nAm6u36aZaVy39N39ejt92IrXMa4WBE+9HSOJnckHM=; b=L2YlvNZ8GI0yVHXv
 5qwcP2iVSmohxADtEx0DYHgs708usOFvJW5WMcn24t0Jz4QlOBm7Btp3jQebeKCq
 u9sZ7+BXCKSGMBRcEuAI19H8959NFc3otGQUTWoxN1K6IP2a+aOC465boapICLFx
 U5g+3rvB28mQSN5ZVzLmXq8ZZYGazRaC4hKyrLIi1mooaMNh991S4mQoh6H4YIpu
 nDqYCwp9Uvr4PQ8hbBNdz8Ro5EpZkRmKbl8NLtbseuHvKW8vlRZQgH5WrB3B/Abk
 FaN+lddgKn4GyVRhUNZT5RZHiVEOGYvHpjFABlV545lt8vRZWC0G2OItZVJs9Rwu
 5WAJYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g25f1g4q2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 15:35:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8484f26852dso1044783b3a.1
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786721754; x=1787326554; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2nAm6u36aZaVy39N39ejt92IrXMa4WBE+9HSOJnckHM=;
 b=akzWSX5vYTCOLcYIxWiCm+3cjqNWeyYQLZ5olVULnm5rBCcqIcu0NjkPFTsiAqtjpw
 ozz+Ys3HNsUTgVkOxZuS+ONlhm9F2YZAZ753WN34lD2Wa3o2dwNfymTSHkAckZ91DVVc
 vlSlY4YNqYkFvzGhIqrnAhNHRctsHnjaZpGZF6ZOMYd14OYAX0o8y3LMjFnZ2dsRnlR9
 HzoX/1FhN7f86uDS7v+1LkabEJyEI3htADfSQ1V6Be5s4FWTvImFLtrScea+rTTtEZR7
 vFnHrfgPUdzNIwmaw8S0MCeuDplF+JXyWloX8pKFA4TYjm4U4ok9ts2fzp9e2Wqlx4ES
 8pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786721754; x=1787326554;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2nAm6u36aZaVy39N39ejt92IrXMa4WBE+9HSOJnckHM=;
 b=HcKhXfDb1J9WGEUOm/QCf1QvOmmGEc96+UGWuetgQY4wYk1IsmXGsDsN7tqGCGVpY8
 oXO7aLli8t2m31MBBvSQjDLK/806O7IyjofbW6OwXruuHd8vpSMdkw/Q933GfMDe144e
 uoPKmHSf49g1aHB7dxirJLlEhAJOy4j9SbiX6p2M3oUMAJPN0xtYPalhN6BUjPBN0JHc
 Qx0aTm3+/kgg0VPVtOZ35xt70rMNqjS3p+VgptSIhbfXvI8qKarrlgUe63T/00LqjY31
 4vPq4YM+LCHHKLuADvd4BqnQTMXGe3Gpab0ki0hrlxrLMMRiO7Dy3PwRLP3qlh6Wu6cR
 f/6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRwUqxqZIAJpdbMmv5fTmP/y9FYJDyzL5/QA08qjAEzYVgz9OQpkjxvwF7tV1kk/kp8LamCgQWMw==@nongnu.org
X-Gm-Message-State: AOJu0YyKZV30NJ7etUE4JeYMt6gcmoV7zmZXeEFBh2mUskDlaIw/Q0tC
 8boLkcsUrCUZWzjibehMV2j+Eo+FlveWr6jUcQ+AqG+v7uGwdbu9EPpXONUlC7kxKtF05G6e1h+
 CM7/3pgKexag9h9DzookBpGzw38tgGyL7oKN4jqNghzd1RKqPImwVnAk=
X-Gm-Gg: AR+sD10xah3My8yHzO02XGO0IeFeoZQ9jzvidEtD3ahTLk/nBS81dkbbcGbo0OxsFi5
 Ms3757HpQ2SL6i1nCF+WskR/heZ0AFR8i7nIDHIwF4f1hBz0iG3oYPTB/CFOXMR/YwwkPVst2Rs
 SoTC6Do6mn/lifpdmeBboOUTpFAQQNqJRZFblN52hItNS2rrXP+N6XF2CZSucmGAIUml1RpTxaM
 fQ6pvcL2rENdkqi74sCQ4p75x0FD6PBCtHwCjerxPM//68kMxLKFQQGeXu6MSsUu3kJ3+loXW4l
 H55jDLeqwk6YGkXfqthKM1S12JFl/2oaPXOePpP/m7ZT2wh+YEeWK/8jzYIA1QA9A6svO90lFu0
 QrishCOu6cQde7WkkrhAmPA0Jx4r7+Ny/UHtdwnn4i/qnVdii2DLcmQ+AzeSvkbWEIjqM
X-Received: by 2002:a05:6300:2289:b0:3cb:e8b4:f03b with SMTP id
 adf61e73a8af0-3cc71ca5ad5mr7859192637.17.1786721753430; 
 Fri, 14 Aug 2026 08:35:53 -0700 (PDT)
X-Received: by 2002:a05:6300:2289:b0:3cb:e8b4:f03b with SMTP id
 adf61e73a8af0-3cc71ca5ad5mr7859122637.17.1786721752876; 
 Fri, 14 Aug 2026 08:35:52 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-141387af4adsm9779089c88.1.2026.08.14.08.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 08:35:52 -0700 (PDT)
Message-ID: <3f213c3b-f154-40d2-9791-541cef12def0@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 08:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Restrict arm_do_plugin_vcpu_discon_cb() to TCG
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260814080507.23196-1-philmd@oss.qualcomm.com>
 <dec2a5af-dad2-44c6-8eb5-b87ff9595d7e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dec2a5af-dad2-44c6-8eb5-b87ff9595d7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SILz1PXLV7jtVPoUISN5SBTa3-Ek36RF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfX1szjkpkcPbtb
 xhuCGJoVXo0VVik8E2dzNe419xmPspJeamuqUoeQ4GVUOkDSpHXaF2OkX28gZYqtQZayCBrlB7g
 JJpld6zI9+sdiNxIgQUsuq7NAMhZ4MA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfXy+HTqON42uxK
 CURaK97EaoPPdfrkGuFNbwnbY6XtHm00Iy8hKIgZmOdWtxWgQ71v5sPR/9LnQQhiAwM6W3/h5TA
 W+UiDKKLCRuFWU7pxRR1MFJdEZA7kLTZ8XSWQa+FPqEu511Z71CNbFcfwDhB2jgNeby4zGtxX4O
 Xv1LMVuH5uQlm0smy0nH4AcxVn4SXifif5BIuTGB57AhaMsmGoIaADqUNr71Bq4fDMQqPUAOCOF
 DydzLFqrcX7RjJu/x8mPWZmEV8zLZ3ZMghBpfC0ASkzSx9gBVlJVyctVlvbCWWhrN46pjGYDp2Y
 ba0ma38k4BJLyeISeqmh9xUe86vAv1dpvjaROVi0VXB9L407vv5hBUShfyz0qMvATh+LG1vBQ8v
 USlqXmnVJ9nPhuilR6sf9rZALuYWsyWr9+cNSzQLotrIlQBOBCAqgIf+ARxNuAsHATrQF2tX2OK
 ek6sCyv6p25yZc5grYw==
X-Authority-Analysis: v=2.4 cv=Z7Xc2nRA c=1 sm=1 tr=0 ts=6a7f35da cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3ttgggD-EqvnbrFiBS4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: SILz1PXLV7jtVPoUISN5SBTa3-Ek36RF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140118
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 8/14/2026 8:35 AM, Pierrick Bouvier wrote:
> On 8/14/2026 1:05 AM, Philippe Mathieu-Daudé wrote:
>> So far TCG plugins can only be used when TCG is available.
>> Move the arm_do_plugin_vcpu_discon_cb() call within the
>> 'if tcg_enabled' block and wrap the definition with #ifdef'ry.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>  target/arm/helper.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

I'll let Peter pull this, even if related to plugins, it belongs to
target/arm.

Regards,
Pierrick

