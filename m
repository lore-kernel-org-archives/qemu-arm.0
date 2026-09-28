Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3890FC9832F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:35:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7lI-0007tL-9t; Mon, 28 Sep 2026 05:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7lH-0007t0-6R
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:35:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7lF-0006NB-DE
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:35:02 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MZBl806512
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SZE1uZqb6l4pcfeY7sV8HeRL/Nn8ediLKBTfnBltiRc=; b=grhAiCSDAHNqAa69
 6y2y9IsV5O/hPOAF4LRywdRnozIgD8s/ope8u+S2qGOlN9axKYG2QR02/1vVp/zG
 nXkaI3PeZqdXnEt5HKGmSvugHaC68jN93r0Ea/OHcK1grU5QPb56+hAwl3OkHAIx
 bk+Pj0rLSp9nYOrHfPI4Atpd1NR+HzMS0DllzYG7ea7F0sGoSAp8NeYw/xZeHLMd
 vWWYJyDX1TQtXcF/Wlgzke1A9BXfjCXdhlbJHQNIwY3ArlnzEDiPwQICQarbYWke
 +zD7aL/rHu0ubsDVf3jnyOmwZeU0jEehrqrhr/svf742jiEJJgzGvUWs0s2nnu0G
 Am1mog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mrn26-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:35:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934963b2bc0so727082885a.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588100; x=1791192900; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SZE1uZqb6l4pcfeY7sV8HeRL/Nn8ediLKBTfnBltiRc=;
 b=YJEyITDPdsmO2c7DOYqnN8iAV43hrtz4VJU+hQPJicO5DllfMWyEdlV7Q8CyvQRw06
 GLDJilzDM66dNmyLaspzJz9AqXgJ3C3v6MF3SHF6gqxpyGx/y2lCYLLDdl3gNAdc9oHP
 DYZGtUuY9ctLFVg2WmvXSQj04H64xBzKI6OGa2zYGVPL4mcWK7yztbrQG7rMfj0EJtWM
 zC2U+hCsVQQdbzQs2mtWOQ2UeScn+U40HTf8GxkpNsVPh/yCYRY7ouWKy27tDw9TUE9t
 hw7BaPvn5WSVrkr9eE0S9pQs07fnLiWS/Ekw6Fhf0eBXInQTWbtaT+GMdTsZfJUaWnPR
 rqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588100; x=1791192900;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SZE1uZqb6l4pcfeY7sV8HeRL/Nn8ediLKBTfnBltiRc=;
 b=SgGMApVrDGzlXynFpMb+bhgUb+vvQMdhOI25I7PpIjTUKP2LGEiVWYOqd1KvRh3npL
 mX0eTaoRoahW12nYpM/8KVrUzxuu15bycPDblzPAMiaSPS8yg/D5nOIRUdz0f+BMIQrZ
 PxkQY9wb5ejQDbOjSelDs6aWF1vYzz0WIC7l/1UJ+6krX2PDpuhUJLIr4veeoQIZychF
 PLkVip9R27uvDZrTUvzR2OA4GJ+dIv+srUf6BSBqLUJFLL8fQRd3W1UHKm3jqobG2nbb
 Htspl7qzH/j+BeTQ+K3gIAWFneY+KCPJOz1aB9+nU4LV1OnIpylzJil5UAcL0msH/ii1
 d/mw==
X-Gm-Message-State: AFuF++mjA5+i5I9xgTIXjIZjzV83ixtmAY/43c868Kuv2U1XQLwx5R8g
 e6uTjd8/IRoAIOSkX1FPK1WPipsm+Y/pvBz3a7UKRZMIqtKhVGpUGScED+8tYI9dGwcRQ2ivStD
 1Thr9XWltKdzB3ivWLjl/kMUiZ+U4sSlQeEM9r5prtoYGZmihp0J+DbY=
X-Gm-Gg: AYBFou08ERl4pRLhhPYYOP3/mWC/4733B0z/0mSi4fUSK3oGdp6mSp4mrFrPm055ex3
 EvfrLa97b5Rd+zU9r9/NZkAWx6WeVL7EHinDO3iTCT6yfqgWi5yTMU1T6QZ69yFWOAVMnQiVGg0
 RKUoiLsiGot/n2qGqaQ7G80Z1t4tgJEvt2QDS76ILVSRITrODbVmFXK+svhQZGErQGmTW15qPs5
 PWS8q2dUYehsXYQbsragFl8Xb1kIX/or55qggif1s7RN87r3KTPyGfkKDto3IRVJqYZ7L++PqT7
 EGggylTVxGhGuyO1SYSYPUD6PHXmxE49+5nZ0Rh7rSgaIJ37yvGklIjtCZ6qbZotoZjZv50KkUu
 nrpmah6jrNBrvHzo9mqTul0G5b2jQt10Pdw==
X-Received: by 2002:a05:620a:2985:b0:939:fde0:a71b with SMTP id
 af79cd13be357-93c43a4b884mr1914845885a.0.1790588099808; 
 Mon, 28 Sep 2026 02:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:939:fde0:a71b with SMTP id
 af79cd13be357-93c43a4b884mr1914843285a.0.1790588099405; 
 Mon, 28 Sep 2026 02:34:59 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a84221bsm26426947f8f.36.2026.09.28.02.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:34:58 -0700 (PDT)
Message-ID: <8d37e70f-5ff3-49fe-9151-669d0d514796@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] target/arm: Split out check_il
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ncbqtlgs93he-ddx_YzW55Cf0YeDiYw5
X-Proofpoint-GUID: ncbqtlgs93he-ddx_YzW55Cf0YeDiYw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXzw28M0p5UPur
 vhCeb111Eyxf1SCm3fb7sqfTgYRDtKbidXp+HQb5kynqrfPjO0xrxGcH1jD6e+XrbgoeqRsDbI8
 np7YUfJlk2nG+CWijSjnpbacyt2xKRPA0vFjm1/pJ1QjUEti59FuYUERT72aRcEWHp7++z/QyqI
 Aw3oxRC71nDuQRgVIPPI9DFnjI1hhPNkTcuPghwbL+Prw1jia8ah04B7fvOF8X1e0L4rHDN2Ekp
 RaeT0rNnLJf/lpaomMqoUpLe5lVb0Vn6C+ngpTbxXkxxeh4I9r5VPBTQmGR1pT8kdjTgrbwSDp3
 GMOlYyH3pTqQrJRcAN6hUaKd1p10BMp0XgvhCvxhuXpWa6dymJ+6ikjSqvTBXPtdO9+5ZKCFB+h
 ZQSfKp4baQ3L0KIAwyN3buz01kZqD00uTzYeXZMH/geLweS5NuhQMG+05SQDT58AoeZpreS6lHW
 HrUT9H0R38kuPR4m0LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXyFU1ONA5fUMT
 yDlJRN58CiJ5HAd7Z6SBRE7KsHUOriFnI+L0BNtTciRcyMMz0TcP6WWkKUwKttCHZCKYzGqpHKE
 7X+wVl9ccva8ATQCmSX9jvB7Ib5go40=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba34c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038
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

On 25/9/26 23:50, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h     |  1 +
>   target/arm/tcg/translate-a64.c |  7 +------
>   target/arm/tcg/translate.c     | 28 ++++++++++++++++------------
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

