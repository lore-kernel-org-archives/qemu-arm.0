Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4139AC61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:00:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVxq-0002er-P3; Thu, 27 Aug 2026 05:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVxp-0002eO-HW
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:00:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVxn-0002mJ-Pp
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:00:01 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R76s1V3227015
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 93Elx8uh+fcEyji4DcGiL3WJC1H4GfPjD0F6hFnUXSI=; b=QC+apwadmbkZ19eO
 5ouR4xaSXrcnqvX5kH54qizhlvwTS0clXwX6nN3cX3RMEMCEBPOpzZcMcmLIV85l
 RBs6w1PS60AtBiX9a0UKBESn9GI/1M6AfKQzg6mxl0EVkFdZXnMcyMEE/nAyCE1q
 CIeLsv4PpjFxl9FaBnzXWrWAC61xhiBmEpRiagl+KvNsvUdKAoTfi/6k2py+kg6S
 aWGUH0uzXegC6G+kUYYP+IocO0SUjjtfCVIfHn99D21w3qX0Lfc1Znv3cpc7cKa5
 AneM7Nx9cu1pOwzKWebiDRtrTm9Paz4To6y1cKc5clKYNEu3hQwUqKuSgEcC0SgH
 bQg91g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfren8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:59:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso15991411cf.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787821198; x=1788425998; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=93Elx8uh+fcEyji4DcGiL3WJC1H4GfPjD0F6hFnUXSI=;
 b=Y4Zu4eJs0IkGIrgWDy0eiE4JCKUsCe7v0s5w7LOKGeQAwV4sJcXKLyeznkovyrtmW9
 BCxOT1oDe4kwyHTyYLLaZTf0Tp1H638zH0MV2D53xzs5CLigha8jQSsGSK+T3/nqo1ZM
 fRpYJlK1yNlhDrgfcD3MHIlG7xAMcooVOAxqOfojD0Jf/bT0pVa0Dp7VBjGDmEYvFBEg
 yNACTgRsRB7PT2aSvW8fNYZWaQNyNDjJRzP9kuzTYwj24zIoaOw8MtSW0tD2qdmYiwDp
 dwlDR0LtwY7vL9dBprAoh9U/zymDm2qdr5RSbQTW0atzbaIPrLFQMA3yQVIgwdFM2yx0
 Ni8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821198; x=1788425998;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=93Elx8uh+fcEyji4DcGiL3WJC1H4GfPjD0F6hFnUXSI=;
 b=D8TfOKHpYspb8zVexBdFc+8d9Mnb3mBbyjP4PQkvuJuthm+9edUUH9cOo6eEXQVJ/u
 LsVB/1XQ6wDJKhHR4CAAIaSXfPz9zdvnduue7URUy5owO39do7CQtRsnAqP0Eab+Gfo+
 sEbibsmWfxyzdKh1JM2EQhrw5ZivaQ3oeednL+RvhWIWt73bEUuA6XrvTURITG4vu08q
 qjtwT3YYg+0izuH2apADFcvN96kDI9CuPYDsHlDIMST21V8vbEMK34Lq8dSO8QOHgfUa
 zQw9t+C8QbY5o5yKnLd8Xn1to0YGoaY6dmC6eP+lxKXYtYeSOubG3hqyX+DExA8szGTM
 q+gQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9ylhfsIVlXi2ghZ1B135YSNme9kFSifXhn2uY+qPNHSPBogzj4ezSu60KujQK3Tipng9JkW9YZQ==@nongnu.org
X-Gm-Message-State: AFuF++ndboTidi1cvm5zEdFcgXt3Sm8ZcVezd171PxX5iZA0eypUpmZb
 4MhP+30p8HQU7vKK4Ce9C+n/Omf0ToRTO3Q47uTkkXftaeNpL2dRllSfK+UH42CI3UkSwmq8H/v
 udhV66muNDvBoAwtvy//Dh4BHocEmRVq+eYTbp7HvlVeVl2sxwCtxdHk=
X-Gm-Gg: AR+sD11HbRGEnqn5SWe7kJ6Bp4iivMuynTohnxe/2bHdFL2Jv/eOTp6UthtrMBQYH5o
 62KnfYu5N8qEPxT26B4yN6TNWeqVLpyXx9DO42S3ffCN3TJaHzOHRFSCkGXm4QqOBC8vA8XPk7p
 eBQLnGWYd2W82d8Qq6ScqIc5fOC8DtWTQ6BsZAGJKJkZokwu+Ud7XdNJVWMTRV6caZcNP9HFwXv
 IU5c88CEVX2RPvNV1ayZuwUwivfpD7lKqAbZm/kt4XJZ4ToKm4FB2V5jJqb481WTQ8N2pogJcjn
 NNuiviapsc0tsW61+6rcIMxBjqE4LfddYQMbp5Qm7JiwjEY/YtuLSIlosxG35BC6R9LdYyHWu59
 0n2+HTo4Bym8Okpho+TeOwFyy0D85xzlWCOOoyhzxPa5q6VOl
X-Received: by 2002:a05:622a:e111:10b0:52f:acf2:110c with SMTP id
 d75a77b69052e-52facf2202fmr8665541cf.3.1787821197757; 
 Thu, 27 Aug 2026 01:59:57 -0700 (PDT)
X-Received: by 2002:a05:622a:e111:10b0:52f:acf2:110c with SMTP id
 d75a77b69052e-52facf2202fmr8665391cf.3.1787821197289; 
 Thu, 27 Aug 2026 01:59:57 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28fe2ecsm7506998f8f.37.2026.08.27.01.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:59:56 -0700 (PDT)
Message-ID: <0c27d481-b005-439c-8eb1-559d4c40029b@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] edk2: drop 32-bit build config (ia32 and arm),
 update aarch64 vars
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260824164751.1700783-1-kraxel@redhat.com>
 <20260824164751.1700783-5-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824164751.1700783-5-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LsEa6w_HDUbT0qzijqVab_5Okw5DziX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MyBTYWx0ZWRfXz/DH8BO0Mfkf
 U9N9cu0U25xaN24/LSmclLLfT1/XvM/tVqstIGeuVPUZ22ONiyh1yIwC0pckR5jFWainRUYpSLx
 G9UOGOEQw+z1ugduOnqbvEX/PNbAKnD6gHiiTu0iOPTj56clcLheZh1xh4TXOfCHeQSn0/9+GOE
 bdKrJejoDh4ccYtZisvOCVa0WLguKmmLh35Hhc3NuUjvOqfmjPziEZa/KXp02tNu+GXTjXVvD6J
 Rl4AD18N9u3m+/LKqCLrU/y+ixZjVclxgPc6TCN8PB9m5a5IfdXb5s5OeD1rlWHClNDpdGNRdsO
 1HB0QmNTZKbJ+stBgTmM4Ugo4AM9CAMlAt5OC9GYO5NGs735rLYmXiDYfJnvJ7uqq3hfTeVLBMU
 xHfFOD07oKTRPPbtN8Ai4T/0X8T/X9ZT8ujmwxpul5kyTozJmvHm2DWWHtc7mDSCpKq6tpsoZ38
 0RedAA/HHaEjtV3VKQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MyBTYWx0ZWRfX3am9uGY7x20M
 lmNsmmjZr/d7RGu2qN0WasAqfpBrsvXQGYR8XpiWD+02s0gAgle4bZHnLSrrsb2YCcfzyP0SNAt
 ulndIzzz0j+mjng+irSsKmeJ7iiTuFw=
X-Proofpoint-GUID: LsEa6w_HDUbT0qzijqVab_5Okw5DziX9
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a8ffc8e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270073
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

On 24/8/26 18:47, Gerd Hoffmann wrote:
> Upstream edk2 has dropped support for 32-bit architectures.
> Remove the build config for these builds.
> 
> Update aarch64 config and test cases, aarch64 used to share
> the 'vars' image with arm.
> 
> Drop references to the 32-bit builds in a number of places.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   tests/functional/aarch64/test_virt_vbsa.py   |  2 +-
>   tests/qtest/bios-tables-test.c               | 34 +++++++--------
>   pc-bios/descriptors/50-edk2-i386-secure.json | 34 ---------------
>   pc-bios/descriptors/60-edk2-aarch64.json     |  2 +-
>   pc-bios/descriptors/60-edk2-arm.json         | 31 --------------
>   pc-bios/descriptors/60-edk2-i386.json        | 33 ---------------
>   pc-bios/descriptors/meson.build              |  3 --
>   pc-bios/meson.build                          |  6 +--
>   roms/edk2-build.config                       | 44 ++------------------
>   9 files changed, 23 insertions(+), 166 deletions(-)
>   delete mode 100644 pc-bios/descriptors/50-edk2-i386-secure.json
>   delete mode 100644 pc-bios/descriptors/60-edk2-arm.json
>   delete mode 100644 pc-bios/descriptors/60-edk2-i386.json

\o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

