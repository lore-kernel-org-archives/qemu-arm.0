Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E149CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:13:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNw5u-0004YC-N6; Fri, 15 May 2026 13:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw5s-0004XP-4Q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:13:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw5o-0004W8-3a
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:12:59 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FArvc93671801
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Z4G45KNh5mtw3tCQnXrBJ09n+JWxPWHf+JyDhgCO5LU=; b=ZW8vWGgDqGqjEjiJ
 aQ8EyWg7mcPuKzlJuMiEfmCSfM+jHE/O0S/n5LIrhGkQa2I5po8wc+ucdPiNF4Rf
 OVPa4tjuDMlpPjvUM7ynEfx9ENmmrrjYhUFzz7zJgXaD27aLCQ+LW2Lmyvf0f8fP
 aCUk5G5c7o6Bp4n6a5PEx7MPRT1cgLyhzvOZ8xfgV1q9wzCG/xrOFxOvN0D+vsRR
 kIuk3fSbkraALONPeqtQAe6jyyi13r1wz8ndviU8EqBIBqYtrANyc1KPikStFpbZ
 CsQGtLWzyc4fs9Ef8tw+/5iUwfIdfdhiTr9wGZDEQwBh9NaHBueBWeslmbjCJcej
 SpyX1w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s47cd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:12:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2fe1cf409a1so76184eec.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865172; x=1779469972; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z4G45KNh5mtw3tCQnXrBJ09n+JWxPWHf+JyDhgCO5LU=;
 b=acC6PgVeJ9NzqB/j1g5U3TstguREdyQf6H5A+ygdluSnnyaecIgA2ABKUyRXrD3VR+
 yvlXNtXpkabUQnTWUNV7jimbGFT6J7CfNDqTdruYmhnyhIjGH/8Z4XRpZjkpnvBoG1eL
 8QLZZSmJiuP8merhBeEMMq0taKXg0AKiGaMEo+9X/cQQ//CG/1ZjapNTmlEzGo/nmhGe
 vFlAqD6lCJm7RjR1nh+65kHC9qXl2MAhZr77FeGB8UufTCUdwT8MT/SYceZe4UggkCii
 xg/VBD4hUxmJ9MR1kdzzgkU/AomLnNoXezS0NzdWkIkqiRnEUy5nUl/J/vbcQe5PGoCM
 kXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865172; x=1779469972;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4G45KNh5mtw3tCQnXrBJ09n+JWxPWHf+JyDhgCO5LU=;
 b=kCW0tlS6qFqUbg8z6Z+2NMXJb5QUx+4JcOy4awnzW5C53xGVOKqfIXu1w9SJZmEKCS
 L7+t8AoeOhdwgEoiCnz6TOqqhJkP4wZ4NW+cs70lyAgg/Ll/HgADcrRCcNBoR0LzdKpb
 55fr/sdZNpHIixDMZUkfUEi/0HNaEtgz3Tt/CvBQmzkP2f56n0JNJsgb0Hw/s3x3sAnL
 3R+SNwA0zfAER4J+/ZR9kGOdz2tyVeVHNqRAM5O1pcA8RFm+JpuV3g+UfwFeYHBTl6uE
 3x/aagFjOPXKzO96Pnu7x48GiVHr0ZHjXcyD/2w7yHWBBbBudIcNkMElcNECyReojo2O
 lfcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8S/t6BW7Qc4kbT3D9Ig20FgaFA800GAgyz2zhR0VAYDwgY/gi7pGv9TtMJzIlP/v5xmTwudZXvdA==@nongnu.org
X-Gm-Message-State: AOJu0YzzmNs+V4zelV2Iim1caG+Sbqvbotoeiqp2Lql6E72PG64QBraj
 R9JT0x2hIU/ZWInTzHZ2mDa9LUM4CZYhfMkeLhVgG8uuJdTN//N2IO3ZZmIqOodXKtqSAw5qGE1
 MfwAFlzb1INEZGADyZh3BLxn7mIZB0J0XMWz2EjcRrlf2dAoHKaUY5js=
X-Gm-Gg: Acq92OHQY7aVrBm2I2HLZ0m3z7K+rgqC0j24y6W7+rdj5xA+UcOK9K0JWcR6uiPeOTc
 d4inLBlT+CMAr3PojWMFpd2D3CwawpLgahtI05DT62g023V7aTmDR0NDbAoS5VH2ocuiccfC741
 A4k8J49SVDtf18chNlc9i6SdheramhD5PH3SaLudpZ9gZZnqxB+ztKHmI8y9fvN6OrLR94bUi6Y
 XFAfYWAlYKwHeqN8i+HBB70O1vMVQM52EY/KhdISyahRIA406+VkkROBaluHiHumtqd1SfvjJs4
 ogK69MYNzRduRwd0i/8+7KPuzXGDla6hiYa80p+WKoLaLrBKWo3zVSI9M3oJAyahGpIJT07YxtR
 rodQvTKihd9jgmFimmR7pZcptWYxQA08LMApDi6IZ39iAQ2IKQrUXTdITWOKs28N9fOHNo84oAj
 P+4hze/UEA3z9V69pkqbmg5UZP
X-Received: by 2002:a05:7300:7255:b0:2d0:239a:23c9 with SMTP id
 5a478bee46e88-30398677161mr2544233eec.16.1778865172306; 
 Fri, 15 May 2026 10:12:52 -0700 (PDT)
X-Received: by 2002:a05:7300:7255:b0:2d0:239a:23c9 with SMTP id
 5a478bee46e88-30398677161mr2544204eec.16.1778865171735; 
 Fri, 15 May 2026 10:12:51 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30296dcb6adsm8548774eec.15.2026.05.15.10.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:12:51 -0700 (PDT)
Message-ID: <1866da2b-774b-4c55-9ada-dbeff66f2d20@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:12:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/20] target/arm: Re-use common
 aarch64_aa32_a57_init() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-18-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfX/7T2Q15OePR6
 Dz9dSqS4d0lFS3GYNVrpL0LXTN0XFb+7BN3Vg48nVUtUihpiDOsIlDTTqmwgUCasGJh81dIC0FF
 HJ7qPZXv2oRoZ0YgJEmXzAdebTMMhia88zKMZMjW/acfYZeNsznpvuKJEGk809IPIcphMLF4MLa
 +w9avhJpuKIBiRJWI6dNrlbhBZgIUXsWLHjWazE4OoNdTCQz2b2yLCpYtSHb63gFWN2MuurS9cu
 Mv8B4cbuN0zWh2e7vDGR3KZNLcZtSMHegnZC5lUpZG2w6os9CtRUfCRIJB/MTYvtSMIky4iqV+5
 DEF25o2eBeVWcyayDdHspoheNjBM7aTH4FWivAzJE9s4EuFUlXbzEpN1QRdBan0F0yUeC6DfA2L
 Z3fkAla9tAnEjr8ZjaWOYwvPED9hQKKgays9jwpuIItyh+7Q3zxSHueDJQ4LZ3Lwmn7l367HX7E
 Fb2Cg6v8tmgzDi0d8Yw==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a075415 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=yCTr-NPhZduzRAWXByIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DemaHlkv-qifqypA1c_XCuzY7Zft0Lhx
X-Proofpoint-ORIG-GUID: DemaHlkv-qifqypA1c_XCuzY7Zft0Lhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150175
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> Make aarch64_aa32_a57_init() common by exposing its prototype
> and defining it in cpu-max.c. Call it in arm_max_initfn()
> restricted to AArch32.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/internals.h |  1 +
>  target/arm/cpu-max.c   | 74 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu64.c     | 71 ----------------------------------------
>  target/arm/tcg/cpu32.c | 48 ++-------------------------
>  4 files changed, 77 insertions(+), 117 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

