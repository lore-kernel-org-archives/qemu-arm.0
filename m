Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCADCA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 20:27:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEYEH-0001TS-Ve; Wed, 07 Oct 2026 16:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYEF-0001Sg-1j
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:27:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYEC-0003R9-7D
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:27:06 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697JNqAU1650947
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 20:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h59Ts/p/wMMqbb0DmVBe23sg47yJvcAXxGAB99IKbXc=; b=OV6sDZ12q6p2b39x
 7Ku/qz/wdxwHHws1sbx2x12TZ9lin+IEXHXs2HAamXDHCIYnDAwjME+/v7Pli5mL
 aOtUVb9uSKsG1Mm5+ik/hyEvcLpHpbytbYzhIK/V33wtghYjPxwptnGKSQX22Vad
 0SEwutxXSJR32HUb3rPoeV2R9yRt1yZ8yhj0rNy1QEVgA+ll8Z9l28Px+7RiiKIy
 JynCbNhzV1ZE/CkIdPICFHWzQD/iCLw/q2wtZB8SKdxWYPkKJRFXdTkgRYwAG5J2
 S8b4ElbRq3j+uE6LIxWNxEOThtqGrSQ91ppehbGp6XMVTCgbRV3Lg+M1Ia7VYfnb
 XGrR/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc5bbkd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 20:27:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30f1b904861so5777877eec.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 13:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791404822; x=1792009622; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h59Ts/p/wMMqbb0DmVBe23sg47yJvcAXxGAB99IKbXc=;
 b=CZrk7MGoXdizuo666WtntT//xHo4B4NZasc0+HbQsTynhNkS58AAvbV0HUeNHeHPq5
 ku3YHelEfsqajvXPOfK+pf54RSSFZm2/jOvrv0NMdmcShFzk0kc8sRzFJpltzX3pRTWH
 DtMDxFg8WVq+hunBVAu+K2eRwz6QXAIWJ2xakTr2kl2xDQ4NYAyFWpVODSUnrzHPRcPH
 3XctmYM3qclhwwp91DW2SwdePxLrivVOTk7EMYeY47Ct1cG1Ssuiz84IdIqscWQaj47S
 ZEzoEQhlgyHaF47X2bDTcE2Ym0sflc1FJHXYraVYy8LsEb4AH84ScoxQZ96OzNIJo+lS
 +J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791404822; x=1792009622;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h59Ts/p/wMMqbb0DmVBe23sg47yJvcAXxGAB99IKbXc=;
 b=Y9C10UcImWaqfhvQhJirra2TzAKK2osYSLg+oCrG07cPBlc8Py6Ju1lODv8En5t/F/
 DLmEj835ulHQL75sqkj0uogPD794tOtxYWkRSJE890TZg3Xx5Ich5dS9GcduhQxgqqJ4
 BZHCXv8rgZPkicj1M2v91DKdJl+qfCq+sV/UoHxvt/uz2EeOtsqbgknGFWzDDp9YLfSR
 zaPTEBVNSnq6DwmP/L0R6yZHX4faPL/yIl0JyNYCjiu6sz+SUiootmCUgK9juZ4P9wkH
 lD2LpvOmOW38BxmsuS1G3xNY9kgWc0w45f/uMWPsFQBcnu/mNwj4RWpFL8qeqG4YBa4j
 rWLA==
X-Forwarded-Encrypted: i=1;
 AKwUvByyh+2PtczadE0XUT6e3mhE2gX85v1tG/KR5Pm14wEZbChWr0u90RB5R7uDFqQc717eTRAsgBl9/g==@nongnu.org
X-Gm-Message-State: AFq9FYJe1U3JT3ZzlVcqzgOOpTSBog3MJ+6/MEhNO79RBQXdaGY/z+7w
 oAjtBJyRwDf4o4P7JLfKr4fnrrNREdBm1NlpatAQf+Tp4T31AitcmnAIp48gQhIdxAYEUjLB8TK
 xTl9E1d6j28ZIhqN6FJLBpc7eEinF6R66S0Je7XyyLl4FoB1qz5sXyY0=
X-Gm-Gg: AYBFou1V5N5xBmoYI6df3kXTamfBLpQQQk3FeSt8jUUs/cOQ/Rju60eBxpZMulx+Q/l
 zKx88D9iX33FSJiQ2IaZSt4JAhM520X68OVa0p85dvYXfyvM8n5wrRbJS474P72DgCXkEkUZ78C
 RRCrOilzvMEYA/YKVnkmXwXk1sy27OtmTGFWrizAN6xwCZCsYKFjkegPMf3YQeRfvHni+MyGcba
 zRkSmoITw6nUNqHpvKWQt5bBbaLDrNB6nuqT304TGrkgZUZmKfGv6YFFOWKgi7KoUkaaDfOD88Y
 8x5hEqiChTyNI9t4/e+t62ubIJyZBfQxeA9aiN9v8rphZfLbIn6rwWk6fjgNs5EUD8Vc6mg8t/Z
 U167fUBHugGStJsH7u2jagkWfMer1jxrcPLg1/B0HYaD18EpmOXE4NtY+yjwxB+p4twwXTA==
X-Received: by 2002:a05:7301:4882:b0:34b:f279:2c29 with SMTP id
 5a478bee46e88-3515dd058eemr3997381eec.13.1791404821358; 
 Wed, 07 Oct 2026 13:27:01 -0700 (PDT)
X-Received: by 2002:a05:7301:4882:b0:34b:f279:2c29 with SMTP id
 5a478bee46e88-3515dd058eemr3997294eec.13.1791404820210; 
 Wed, 07 Oct 2026 13:27:00 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-351735e316fsm1936806eec.11.2026.10.07.13.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 13:26:59 -0700 (PDT)
Message-ID: <15ffddbe-c5ef-420a-9eef-3ef96e385d81@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:26:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] configs/targets: remove target info definitions
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007115253.328-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX0x/5usNV5BNA
 /IWw1EGcvi/k+Alu/AyPHjhH7td5od1+LcTvDvkkvLOWZoVnNK0V8AeSDUUFTvgtXLnhY+1eaLI
 befAaejTXhtedc71iwiFURRxxwcmiVA=
X-Proofpoint-GUID: 4gXsP9wfj-3UNpDi8piHoI-nJPXWdhLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX0YwfDGjOg9Jz
 gXlefnollWuFp7hItI2m/P+YB51GQDua1H0lDEu0UExyFOJcODThuQ5EW3ZkSyP6XtvE+zgK4/8
 f4Zu7+xdyTZ0jxfy09C0nBmbmn2ZO39GzqixCZPQduluSBawQVmLJWt+GUnAFxkQAYCWaKo54zQ
 IWlqxDfGIE8ijZ+1Fy5YjC3FrhSGq+whOrjR7TfuDQVdWzwVd9c5/BdGNDbnKp7w2oOoXnQYp+U
 CB1SWpznh5WLjVBE+zHH/jbdLkXgwh5+km6BTdx2K/T+cM2ZvyGIOyXk+ZTb8JYywcjtBXPQCXz
 kNSErlpAO4tmxgSA5Ht1Xn7OHrKqo5yoVgFFAX7zm9L4UYGqwS9zPdzdJfLjrAFYtky/PW/g6OK
 kT/Uu4b9ycEgnTrRHU7sxE/kWxN5zz+QSJ7s5qLU4x0Mkij49o7pdbzvmYlnB+OcSOeAiErETXK
 Qy695SB4DEkcOUltVjA==
X-Proofpoint-ORIG-GUID: 4gXsP9wfj-3UNpDi8piHoI-nJPXWdhLr
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac6ab16 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Hw4NnLk0O3TVtCU2cgYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070081
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

On 10/7/2026 4:47 AM, Yonggang Luo wrote:
> From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> 
> Now that we remove machine_typename, we don't need to keep duplicated
> file per target anymore. So we can just rely on target-info-stub.c.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  MAINTAINERS                       |  1 -
>  configs/targets/aarch64-softmmu.c | 25 -------------------------
>  configs/targets/arm-softmmu.c     | 25 -------------------------
>  configs/targets/meson.build       |  6 ------
>  configs/targets/riscv32-softmmu.c | 24 ------------------------
>  configs/targets/riscv64-softmmu.c | 24 ------------------------
>  meson.build                       |  7 +------
>  7 files changed, 1 insertion(+), 111 deletions(-)
>  delete mode 100644 configs/targets/aarch64-softmmu.c
>  delete mode 100644 configs/targets/arm-softmmu.c
>  delete mode 100644 configs/targets/meson.build
>  delete mode 100644 configs/targets/riscv32-softmmu.c
>  delete mode 100644 configs/targets/riscv64-softmmu.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1312bbd1bd8..cfe39dc2883 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2148,7 +2148,6 @@ M: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>  S: Supported
>  F: include/qemu/target-info*.h
>  F: target-info*.c
> -F: configs/targets/*.c
>  F: tests/unit/test-multi-targets.c
>  
>  Xtensa Machines
> diff --git a/configs/targets/aarch64-softmmu.c b/configs/targets/aarch64-softmmu.c
> deleted file mode 100644
> index fdebdcc3582..00000000000
> --- a/configs/targets/aarch64-softmmu.c
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * QEMU binary/target API (qemu-system-aarch64)
> - *
> - *  Copyright (c) Linaro
> - *
> - * SPDX-License-Identifier: GPL-2.0-or-later
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu/target-info-impl.h"
> -#include "qemu/target-info-init.h"
> -#include "target/arm/cpu-qom.h"
> -#include "target/arm/cpu-param.h"
> -
> -static const TargetInfo target_info_aarch64_system = {
> -    .target_name = "aarch64",
> -    .target_arch = SYS_EMU_TARGET_AARCH64,
> -    .long_bits = 64,
> -    .cpu_type = TYPE_ARM_CPU,
> -    .endianness = ENDIAN_MODE_LITTLE,
> -    .page_bits_vary = true,
> -    .page_bits_init = TARGET_PAGE_BITS_LEGACY,
> -};
> -
> -target_info_init(target_info_aarch64_system)
> diff --git a/configs/targets/arm-softmmu.c b/configs/targets/arm-softmmu.c
> deleted file mode 100644
> index 2b98f65a0f8..00000000000
> --- a/configs/targets/arm-softmmu.c
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * QEMU binary/target API (qemu-system-arm)
> - *
> - *  Copyright (c) Linaro
> - *
> - * SPDX-License-Identifier: GPL-2.0-or-later
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu/target-info-impl.h"
> -#include "qemu/target-info-init.h"
> -#include "target/arm/cpu-qom.h"
> -#include "target/arm/cpu-param.h"
> -
> -static const TargetInfo target_info_arm_system = {
> -    .target_name = "arm",
> -    .target_arch = SYS_EMU_TARGET_ARM,
> -    .long_bits = 32,
> -    .cpu_type = TYPE_ARM_CPU,
> -    .endianness = ENDIAN_MODE_LITTLE,
> -    .page_bits_vary = true,
> -    .page_bits_init = TARGET_PAGE_BITS_LEGACY,
> -};
> -
> -target_info_init(target_info_arm_system)
> diff --git a/configs/targets/meson.build b/configs/targets/meson.build
> deleted file mode 100644
> index 2ab4d27eaf5..00000000000
> --- a/configs/targets/meson.build
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -foreach target : [
> -      'arm-softmmu', 'aarch64-softmmu',
> -      'riscv32-softmmu', 'riscv64-softmmu'
> -  ]
> -  config_target_info += {target : files(target + '.c')}
> -endforeach
> diff --git a/configs/targets/riscv32-softmmu.c b/configs/targets/riscv32-softmmu.c
> deleted file mode 100644
> index 0829ab84de5..00000000000
> --- a/configs/targets/riscv32-softmmu.c
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/*
> - * QEMU binary/target API (qemu-system-riscv32)
> - *
> - *  Copyright (c) rev.ng Labs Srl.
> - *
> - * SPDX-License-Identifier: GPL-2.0-or-later
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu/target-info-impl.h"
> -#include "qemu/target-info-init.h"
> -#include "target/riscv/cpu-qom.h"
> -#include "target/riscv/cpu-param.h"
> -
> -static const TargetInfo target_info_riscv32_system = {
> -    .target_name = "riscv32",
> -    .target_arch = SYS_EMU_TARGET_RISCV32,
> -    .long_bits = 32,
> -    .cpu_type = TYPE_RISCV_CPU,
> -    .endianness = ENDIAN_MODE_LITTLE,
> -    .page_bits_init = TARGET_PAGE_BITS,
> -};
> -
> -target_info_init(target_info_riscv32_system)
> diff --git a/configs/targets/riscv64-softmmu.c b/configs/targets/riscv64-softmmu.c
> deleted file mode 100644
> index 553bd1f75fe..00000000000
> --- a/configs/targets/riscv64-softmmu.c
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/*
> - * QEMU binary/target API (qemu-system-riscv64)
> - *
> - *  Copyright (c) rev.ng Labs Srl.
> - *
> - * SPDX-License-Identifier: GPL-2.0-or-later
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu/target-info-impl.h"
> -#include "qemu/target-info-init.h"
> -#include "target/riscv/cpu-qom.h"
> -#include "target/riscv/cpu-param.h"
> -
> -static const TargetInfo target_info_riscv64_system = {
> -    .target_name = "riscv64",
> -    .target_arch = SYS_EMU_TARGET_RISCV64,
> -    .long_bits = 64,
> -    .cpu_type = TYPE_RISCV_CPU,
> -    .endianness = ENDIAN_MODE_LITTLE,
> -    .page_bits_init = TARGET_PAGE_BITS,
> -};
> -
> -target_info_init(target_info_riscv64_system)
> diff --git a/meson.build b/meson.build
> index 828100de816..64d3f7675f7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3754,7 +3754,6 @@ subdir('dump')
>  subdir('accel')
>  
>  subdir('backends')
> -subdir('configs/targets')
>  subdir('disas')
>  subdir('migration')
>  subdir('monitor')
> @@ -4346,11 +4345,7 @@ foreach target : target_dirs
>      endif
>    endif
>  
> -  if target in config_target_info
> -    arch_srcs += config_target_info[target]
> -  else
> -    arch_srcs += files('target-info-stub.c')
> -  endif
> +  arch_srcs += files('target-info-stub.c')
>  
>    if target_base_arch in target_arch
>      t = target_arch[target_base_arch].apply(config_target, strict: false)

We delayed this patch because initially we thought we might need to add
other things in this struct (per target). However, it was not proven it
was needed, thus I'll pull this.

Thanks,
Pierrick

