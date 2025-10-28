Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77F6CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 13:06:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDjOp-0007ym-P1; Tue, 28 Oct 2025 09:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vDjOn-0007y5-MM
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:06:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vDjOh-0000qE-QE
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:06:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso48600175e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761656754; x=1762261554; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mXfbEpAvx+wk43Zo4ZCte1quumNYK7zO7MKx3CFVRdM=;
 b=URJEBm5ePsSOvxdcaxJCTxqEkeE/YTKjhyhFEQkV5uKk39b2+22R853DqHJCw4PrBZ
 Sl81mfiWTAzdfxJTv1rneLWL5i86LQSAiVVXOQYqji8Gl72djxujj0ozYpQCiKeYL//5
 yVpB7kzExRBrOU95PZWau018RIkCprtNq4U5UdTGMsQbVtea1BvhZMDjZ2w9+SuKEMkZ
 zCRa936k94nU+jujv1HZvTjJJLFk9o+dM3L131Y41QKlRuvGUzf5xAtj/9Ba79rjyW5Q
 kwmvDrud07HwM908d0eU0PJWi51XN4bDXr/E9OIaezxUcSJ9ojHqdP8YFO41ajNNfCO/
 M1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761656754; x=1762261554;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mXfbEpAvx+wk43Zo4ZCte1quumNYK7zO7MKx3CFVRdM=;
 b=LBX7PI4/79F7v/8OsohHx3onzilB0BNiGwPyLuwInuJI1r+2LWLYfwsakODePAWunp
 fr4pEYyjROjJ6zS7NFTV5asMPyBYoZqCE+uq6F35Ul3YF35Z3uqBCGYxtH2h+ZRbHMXf
 gXRvnIc0tRuXA41+zGe26aodhlEwEfpWNZVnh4wHkQ82QAcpo2EwwzDaAFClAYL0DHUx
 esJWuMuqxes5tUVVJRZv9WIpAAsoynqFuAuHhY+SzSrqJ9pcS+qSacpDA4mxDI5FGY84
 TSxbdxxXBQCY5IA7E6m6QIh0dF1319uxVteAh08yc0MwJe8aXqxlD9EmgVUPIhwYq2xn
 DD9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYAiHPXuXS0ZBjs4YddIYkQGEmz3PFId3RClwQmGBMC2r9nK1g4+tE9FwRtQbqJzsJywtyOrhtNQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxnwdl9h5tng4CwbNQMJ6THchE3r4RDrVs/WCsQybl2pI+6zyJv
 rDvIWkunfRUFkFogpg5notLtwAsT51A7uy9oifJ07xKnlY9AH/dpEzHYlUO8y5/LN0U=
X-Gm-Gg: ASbGncsbS8jzkHcSZHOBhJjoNdJKBOkmhX8dyOKDhXlXq3ymGt+RGYvbhW34jRrijuv
 bwO/uHcH4gleZ1FZ3FffaZu33t02xhfE/SmA1HWlrrs2J48nYXofnQwlYI8sjVcle5vhnLOjS8s
 NwbZ/N82UElyBkKoYa5m8AkCRJNNhh0jHhNlyMRAR/lPcoCDCzI9nDz9T5jAiMmY4I3MfbWvRu6
 ayNHDIHM6Jg8ua0xlrlizUgfw1M2ECb7kAo5JV6Y5V3UbpLSxMhHKsKvHdd9uvaQaXOXZ9jveZp
 mSHoY2l2vHdKk1oqv0C0f8We6fpQfU+awi9eNfr8Jv0As4SWfIkiWjMBPYraCqppdfEDdTWraC7
 amPjyPwkHg4KeXEwlYELvT4J+E3JJO13mZssvcQKdH3pNJ8nivr75PhttgjJBL6QfyS32NMtZg2
 6jVZlzVnAo3q7CtReGuDqGLw4F79nLUG5lg22ijhoYe/vI/5Ze9JxxLo/ZMrM8CtRBCA==
X-Google-Smtp-Source: AGHT+IE3ezY5Zvg5wIu7N7jFU/gtpj8cMQjB7HnyFKiSttcFlWRyhSha5DjqnxAbGVzwyt8KcdssfQ==
X-Received: by 2002:a05:600c:548f:b0:46e:1fb7:a1b3 with SMTP id
 5b1f17b1804b1-47717e512dbmr25594555e9.23.1761656754202; 
 Tue, 28 Oct 2025 06:05:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6?
 ([2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca979sm20826224f8f.14.2025.10.28.06.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 06:05:53 -0700 (PDT)
Message-ID: <df404447-bed8-41cb-9514-fc581ef0824f@linaro.org>
Date: Tue, 28 Oct 2025 14:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/imx8mp-evk: Add KVM support
To: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Phil_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-3-shentey@gmail.com>
 <CAFEAcA9Rvvymu7oS0pPx00v9SdXzwr27vy1VmnZmwQ7ayZK+yQ@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9Rvvymu7oS0pPx00v9SdXzwr27vy1VmnZmwQ7ayZK+yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2025-10-28 13:46, Peter Maydell wrote:
> On Sun, 29 Jun 2025 at 21:49, Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> Allows the imx8mp-evk machine to be run with KVM acceleration as a guest.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   docs/system/arm/imx8mp-evk.rst |  7 +++++++
>>   hw/arm/fsl-imx8mp.c            | 33 ++++++++++++++++++++++++++++-----
>>   hw/arm/imx8mp-evk.c            | 11 +++++++++++
>>   hw/arm/Kconfig                 |  3 ++-
>>   hw/arm/meson.build             |  2 +-
>>   5 files changed, 49 insertions(+), 7 deletions(-)
>>
>> diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
>> index b2f7d29ade..1399820163 100644
>> --- a/docs/system/arm/imx8mp-evk.rst
>> +++ b/docs/system/arm/imx8mp-evk.rst
>> @@ -60,3 +60,10 @@ Now that everything is prepared the machine can be started as follows:
>>         -dtb imx8mp-evk.dtb \
>>         -append "root=/dev/mmcblk2p2" \
>>         -drive file=sdcard.img,if=sd,bus=2,format=raw,id=mmcblk2
>> +
>> +
>> +KVM Virtualization
>> +------------------
>> +
>> +To enable hardware-assisted acceleration via KVM, append
>> +``-accel kvm -cpu host`` to the command line.
> 
> Coming back to this now we've resolved the "does this put
> things inside our security-promises that we don't want"
> question...
> 
> I think we should be a bit clearer in the documentation
> about what tradeoffs the user is making here when they select
> KVM. Specifically:
> 
>   * we should note that this is intended only to improve
>     performance, and is not covered by QEMU's security policy
>   * we should say that you will not get a Cortex-A53, so any
>     guest code with tight dependencies on the host CPU type
>     might not work correctly
>   * we should say that the guest will only be able to run
>     at EL1, and (unlike TCG) there is no EL2 or EL3
> 
>> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
>> index 866f4d1d74..7e61392abb 100644
>> --- a/hw/arm/fsl-imx8mp.c
>> +++ b/hw/arm/fsl-imx8mp.c
>> @@ -12,11 +12,13 @@
>>   #include "system/address-spaces.h"
>>   #include "hw/arm/bsa.h"
>>   #include "hw/arm/fsl-imx8mp.h"
>> -#include "hw/intc/arm_gicv3.h"
> 
> Why does this include get removed ?
> 
>>   #include "hw/misc/unimp.h"
>>   #include "hw/boards.h"
>> +#include "system/kvm.h"
>>   #include "system/system.h"
>> +#include "target/arm/cpu.h"
>>   #include "target/arm/cpu-qom.h"
>> +#include "target/arm/kvm_arm.h"
>>   #include "qapi/error.h"
>>   #include "qobject/qlist.h"
> 
>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index d90be8f4c9..a4212a6ab2 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -59,7 +59,7 @@ arm_common_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
>>   arm_common_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
>>   arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
>>   arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
>> -arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>> +arm_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
>>   arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>>   arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>>   arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
> 
> Philippe, Pierrick: is it OK that this moves the
> fsl-imx8p.c file from arm_common to arm_ss, or is there
> a preferable way to do this from a single-binary point
> of view?
>

Looking at original patch, this is needed because an ifdef CONFIG_KVM is 
introduced.

  static void imx8mp_evk_machine_init(MachineClass *mc)
  {
+    static const char *const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a53"),
+#ifdef CONFIG_KVM
+        ARM_CPU_TYPE_NAME("host"),
+#endif /* CONFIG_KVM */
+        NULL
+    };
+

This is not needed, and valid_cpu_types array can be dynamically 
created, adding "host" only if kvm_enabled().

See this patch for reference:
https://lore.kernel.org/qemu-devel/20251021210144.58108-4-philmd@linaro.org/

> thanks
> -- PMM

Pierrick

