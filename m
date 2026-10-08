Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE21BCA600E
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 09:46:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEkhi-0005Vf-6G; Thu, 08 Oct 2026 05:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEkhc-0005OZ-43
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:46:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEkha-0005M0-4g
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:46:15 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6987KBBO2560132
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 09:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9VWcD4DlJyMrWh0Kr2PQPxLbPX4FwfGk2E4HTeT9zw0=; b=ByrTnOfe/R/hNxBp
 zjX0W/Tm/zDcpBYFrFUXXRlZFoG9VeLuVaaZcLJbsEmbRK4bpQLN9ppBHBObrZut
 IOVKXluTL9Iu3QV+Xe0Meq9qo0hW2AjXr5RkR107zyylcHkyvVvHcrBK1Ho5D5MV
 ncLEmAwKZjOsC6Q21KXrXcA9k9fNIg4BBkwterlQRH4hVBorVLzX+laFUeIA7HWz
 wbotC3Al+A9PcaU8pFTBBjsi2ZXMrXpGPdhXvRFBwgMCOr2lJfCaFUGOLDuYnZrn
 oUZYAqlFvDuYi1uW7Y+G0d81AftZs9Hb8iQMFzftxryHnEQnTUX+/ued8wAV34pX
 Z3fOfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe827dm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 09:46:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e46c120dfso557550085a.1
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791452772; x=1792057572; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9VWcD4DlJyMrWh0Kr2PQPxLbPX4FwfGk2E4HTeT9zw0=;
 b=CdZKBPvSyhcmGfizu8X4hrz78UHIz/gJzoQG7FCKFkct+TV9Ji1Zvpp3ko6ZqvPQdd
 maL4aTyMNjokGV03Ij/WAfh0ty4tJBEEYAvDeB5GPqxPh8gpcfrBbMGA1FKielwH9Mrr
 FVggwD6llE2hrpZo9uGvrVl1fT9IcH1SX/putpJIGmkpb79dduQuvvkt+b7hDBbDIqEQ
 1DwtJFpimJa7js0EAkGZU6iVf/wTkBqOl9DMT7sW7WuelcJgJ4plMhzy33oyKCADidHo
 OYYed0WCD2sgFQ72EpwN6/Y6BGNrVjeyARVf5umH1INq8rZJqHQPi8btayrhFz47TYR/
 lnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791452772; x=1792057572;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9VWcD4DlJyMrWh0Kr2PQPxLbPX4FwfGk2E4HTeT9zw0=;
 b=2FaUunvejM6cNuxjoJ4cLh7daXa13oLkg+lYSIqmDEY0BbVL/yzu510zpd/CtdGAdF
 m/OAjda6JvqcP6bIVbxyeq/1+aVUpUMRRPVM20dP0E/C/2DhMXUPHasWQfyuFKTkNUGO
 zReeq5x9/TYAn3lvRDEy6G33pH/cSKso32N8UwXwfiyDeBerzGd7uLMEVaWfJFmD8Lqp
 ekdDlxjmJRn6BYPYnUT8NI6G2k6oVoB+Y6N2UfLo6zYjzSH93r6NvLwrJBELYLowdX5B
 jbRlkpFbwp9RpPi56wK/NVPqVLXHXmXgLQ7t1EtXB4v9zdCWW6LTnkNu31mB8NTvFNFN
 dxcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSdGTGzV/fxE/bfRSajL7BzhbQ9ueoGG2ObLtpvhjbU8IiKeS1EfqXy4+lGM5Pq5O2o08glehUAQ==@nongnu.org
X-Gm-Message-State: AFuF++nVhUyGcHXXAa2dnmw7B+AQkNd4fbEuX8DsZa0SDbhx5Xs7EQVD
 lyzwGfXx7plEbow95iJAH3wAggpLfu001mDhoj0qXFa0284lRPIxHcjA7soMJiJEYS5ZJH2qZOu
 /PtA6sU8oz4JREo+F6iUurdNtUNjFk1+KLIpvb/ajusoKd7GA11zENHw=
X-Gm-Gg: AYBFou2aZ0nf18N02Zr6AMY+xPgGCzUYoXiRKSmM7Pi+8xUbmajxyjuNXZXBZA9C5C9
 47506v7gmIrPzHN0zDX7rj11LJj6/ZtddOGyIf+QMx9zJsoJo9pfsp7aL4854NVwxd2nJ+u+e97
 XiAHvZPmqfrJNa9JY/CnzMI01BfzcfSZhVtLC9r5rzxb2BkPY1b+quTKOW7nmGt7vPURp9JNTxH
 Q2421FtRzvv/Y9bJ5cFH1DhpwPIYuWjZTMoXM7Yyd4U2EHRPTobfsJqXrPo4NhRSwpCdaIAyQ4a
 0Jbrt4Du6ZqT++LiU+FY8+9g2hQedDVLS/UYwSvVVLfAm+KH6UYru7inZMo93C4UnPOXO3PZTZH
 iRdhdoj/4y0Ww1mjBszBknCu999uUpHqzPg==
X-Received: by 2002:a05:620a:1b81:b0:93c:2c15:e513 with SMTP id
 af79cd13be357-93e9b80fbdamr1067957285a.63.1791452771706; 
 Thu, 08 Oct 2026 02:46:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:93c:2c15:e513 with SMTP id
 af79cd13be357-93e9b80fbdamr1067952085a.63.1791452771184; 
 Thu, 08 Oct 2026 02:46:11 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c75b4e3b2sm7596450f8f.57.2026.10.08.02.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 02:46:04 -0700 (PDT)
Message-ID: <3f46a940-cb09-4a81-af91-f614bfb20f03@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] configs/targets: remove target info definitions
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
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
 <pbonzini@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-2-luoyonggang@gmail.com>
 <15ffddbe-c5ef-420a-9eef-3ef96e385d81@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <15ffddbe-c5ef-420a-9eef-3ef96e385d81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfX48XxA5DUEEGS
 BYIi1XEHYFpS9Fcsf8VvBFfdjAY1ApsNwu6sybSSbUGWuYWhABVGH3O5QUACRNzC7k2VdV+KOJm
 7kKUz4t1Z5pVhWXzYl0RjqOLt0a+et2XZy4v1tmWH9n61QEWaFqnnG1yKbvD84Z1RGU9UQ+p/+q
 LpNWldr0qg/zS978/WQkKTfMBV1/oTXgu5qOFiVDh0rUYb/8CVwLfL65g9f4M07/lg0MPAIQng0
 5vLth/HBKzvh2uMlfQD9we6W+5fbyOAdSOeBMo9sbTtE/DQGfP3ofw8Kn588bU19ekclLIL1j+y
 rR+cT1mTyqCn4lIqNASpGpL5L0IP0QtTwl0/dzASBRTuZncdJbWiUQWjAXSUpGSazjN0WttYYIa
 0riEegh+5DMqWe2CYCDIbxIdGF4izfSwjiaXBgTUTRsz2RiSMtBEUQk1EgQ/iFcFeQYZPKmoM7z
 Zu311MQ0H1NmElf+wlg==
X-Proofpoint-GUID: UIXb62jTNupoMp4l0GbGxln2-7xJWkH6
X-Proofpoint-ORIG-GUID: UIXb62jTNupoMp4l0GbGxln2-7xJWkH6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfXwb96q2mIYtKp
 qNJhxIEmsPkD+nJSO08WzD42FBgw91DtWSRUq+9RvV5tog6qmzEXM+SAJrxvUgT98D9OSaL3+tt
 8LS1g0myOL7Krjzy6fsFtB0CYnZXcpM=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac76664 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=16O1BnaKSHOnr7lpPa0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080038
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

On 7/10/26 22:26, Pierrick Bouvier wrote:
> On 10/7/2026 4:47 AM, Yonggang Luo wrote:
>> From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>
>> Now that we remove machine_typename, we don't need to keep duplicated
>> file per target anymore. So we can just rely on target-info-stub.c.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>> ---
>>   MAINTAINERS                       |  1 -
>>   configs/targets/aarch64-softmmu.c | 25 -------------------------
>>   configs/targets/arm-softmmu.c     | 25 -------------------------
>>   configs/targets/meson.build       |  6 ------
>>   configs/targets/riscv32-softmmu.c | 24 ------------------------
>>   configs/targets/riscv64-softmmu.c | 24 ------------------------
>>   meson.build                       |  7 +------
>>   7 files changed, 1 insertion(+), 111 deletions(-)
>>   delete mode 100644 configs/targets/aarch64-softmmu.c
>>   delete mode 100644 configs/targets/arm-softmmu.c
>>   delete mode 100644 configs/targets/meson.build
>>   delete mode 100644 configs/targets/riscv32-softmmu.c
>>   delete mode 100644 configs/targets/riscv64-softmmu.c
>> diff --git a/configs/targets/riscv64-softmmu.c b/configs/targets/riscv64-softmmu.c
>> deleted file mode 100644
>> index 553bd1f75fe..00000000000
>> --- a/configs/targets/riscv64-softmmu.c
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -/*
>> - * QEMU binary/target API (qemu-system-riscv64)
>> - *
>> - *  Copyright (c) rev.ng Labs Srl.
>> - *
>> - * SPDX-License-Identifier: GPL-2.0-or-later
>> - */
>> -
>> -#include "qemu/osdep.h"
>> -#include "qemu/target-info-impl.h"
>> -#include "qemu/target-info-init.h"
>> -#include "target/riscv/cpu-qom.h"
>> -#include "target/riscv/cpu-param.h"
>> -
>> -static const TargetInfo target_info_riscv64_system = {
>> -    .target_name = "riscv64",
>> -    .target_arch = SYS_EMU_TARGET_RISCV64,
>> -    .long_bits = 64,
>> -    .cpu_type = TYPE_RISCV_CPU,
>> -    .endianness = ENDIAN_MODE_LITTLE,
>> -    .page_bits_init = TARGET_PAGE_BITS,
>> -};
>> -
>> -target_info_init(target_info_riscv64_system)
>> diff --git a/meson.build b/meson.build
>> index 828100de816..64d3f7675f7 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3754,7 +3754,6 @@ subdir('dump')
>>   subdir('accel')
>>   
>>   subdir('backends')
>> -subdir('configs/targets')
>>   subdir('disas')
>>   subdir('migration')
>>   subdir('monitor')
>> @@ -4346,11 +4345,7 @@ foreach target : target_dirs
>>       endif
>>     endif
>>   
>> -  if target in config_target_info
>> -    arch_srcs += config_target_info[target]
>> -  else
>> -    arch_srcs += files('target-info-stub.c')
>> -  endif
>> +  arch_srcs += files('target-info-stub.c')
>>   
>>     if target_base_arch in target_arch
>>       t = target_arch[target_base_arch].apply(config_target, strict: false)
> 
> We delayed this patch because initially we thought we might need to add
> other things in this struct (per target). However, it was not proven it
> was needed, thus I'll pull this.

I think because in early prototype I was initializing manually
with a 2-target {&target_info_aarch64, &target_info_microblaze}
explicit set, but this predates target_info_init() which does the
QOM type registration, so today we can simply use a set of QOM
typenames IIUC.

