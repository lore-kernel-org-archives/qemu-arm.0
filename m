Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp400547njb;
        Tue, 13 May 2025 02:54:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXq3YCB5h7jJWllLI7y5HBsxY1KRjOypq7rrEqBsmfqb0N99A8YOPU9P6SUVGhHesBzBbhR45WnjM6AQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH3PoG+9MTHyP1jNk8zjLp5nt2klUv408OtiVWO8lGoXrXGZw9m+j3EIwp/GLqL/bOG5x/F
X-Received: by 2002:a05:620a:298e:b0:7cc:aedc:d0c1 with SMTP id af79cd13be357-7cd010f4077mr2518044885a.5.1747130040618;
        Tue, 13 May 2025 02:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130040; cv=none;
        d=google.com; s=arc-20240605;
        b=PnEY7xcVNxk50VpVweIhlZpspQm5kMeNSLnFvtj/HkxiH+C+8UG7p+YMqV70cE52Uk
         QsE0yKtRJl/2NPNcWOxCA8Zpkjo1jcX8H+5yJxSROL1j0vj1nH2llLlQV6+Ynfc3TJSX
         6lsMvtfBmNE6m4PMSpbdkjbZ4EX+UsNh1IeUd5Fi1pfftjdV10q9LEH7A2TuxEdD5h0B
         GaUDKM7FWqsexWqlSwruvFAqBfu965xKYdDgTFBHgQpvP5SY0XBvhYTceRlB6NNXtOi6
         gWu+NyXiPP8H8Daeb0M9nrhlvKiXnLYuTEgwY4m/4ViWb81DYcsGJd/o6hs5ERfczenX
         7lXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uegRBGm39O320n5AE4KfodvzaUeh9Gf3K56Wk7L20XU=;
        fh=/z928XFyTixEGt+7zhYmk+yCfkg/sooF0VqKN8ANkyQ=;
        b=UdVyd0eXKWybbB0lUOkT5dTeaf8O1x7M6FvIk5xjPaGPOmoLj/OGviwJPVR/I0K+az
         9rolAHwtrG3jwDcCziC1XvfE8fBnmQnBq9l6uX6v9vHBrwZJEa6bUYwxz/9lARXx+3Jq
         3/ez0x5dXCl+O96rHOFgn5s+OMAvkPH78v0UeGppZzP1KuY35DHWg9cYLv/R+nMjbekv
         G7wEt6/UnOjUYIRn63sCvP7CJR9qIdthbGegGZlep+fvaW80Rt1zWs9yQfv41RVdQBlm
         LZrb9OTzuW23LF9NBtL0hgx+3CjRa7TS7h8EVgySt9rr0/Xh8iisGYVHh4e+0a7l/pUm
         B12g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cQvtaf1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a58de8si108714976d6.418.2025.05.13.02.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 02:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cQvtaf1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEmKR-0004B0-8q; Tue, 13 May 2025 05:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEmKP-00045a-GV
 for qemu-arm@nongnu.org; Tue, 13 May 2025 05:53:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEmKM-000652-CC
 for qemu-arm@nongnu.org; Tue, 13 May 2025 05:53:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a1fb17a9beso2289670f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747130012; x=1747734812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uegRBGm39O320n5AE4KfodvzaUeh9Gf3K56Wk7L20XU=;
 b=cQvtaf1NyVvMIlROfRTYRaCJ8SeyTlpeheO5oMVL9jLCmqA6p+Yknk/0j3Ay+6s2Rv
 UWxv5z+qNqNZv6VSfThym+9rd/10419LNF97tPlRvLE/5zMo5P4zl3BFmpt8pjB/UnE4
 IQi4bKAhqjE8sG6H/pBlqz4M3k206ROV3KGvn67ansozsT1L4f5YXBfy7KDPL3qK+MjU
 NQ5VBaZZgFwZyBa1eD/xyxzz7oSCU+EIvOdfHtKr3jmFBuHRI7ccvCv/5w6Y5mEqa9R9
 02TJ+HB97BESVXLP3tbnzghg5Hb7+wVi3I5Wz0k8iFU6nFT3PQlhMU8/tqsBivLA3g5I
 8Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747130012; x=1747734812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uegRBGm39O320n5AE4KfodvzaUeh9Gf3K56Wk7L20XU=;
 b=QKpJSanl2aBoatYGXX5gfTAsPVSkQtNk8y4ouoIp7ATIc5fzOcfI2j4EoAKRjSgWsc
 GRhSPI5gTIK132YvyXbRu9myOsrnMJbMQ23XYVhaLgSedvoEl4zJGTYEfaQdU+ZgB8fb
 XthA8sz8JdTtViuyrJCr6px6wezm1rdcFwrhuhoW7IJTF37DBbHmGrKUSk+/AM3Kua8d
 97sdQJSFXuKbsvSFaisb3iUrf76jx2tseF06e9mK5CrACga0QPNC3HemQNkJREn5rpif
 Wy1aXB71gdzcKUgOz6m7OohuziS3HxTeSW9Y42ROxWZTP22EB62sqPRzYNQIbb0jr1jp
 WuuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUQx5nz4Mi+J5OMJF6qwu3zF22rGptqNN0Asam6cV/8z6qr8TKg8aTQ3T6DU3Bhc66gjt6O3ss4Q==@nongnu.org
X-Gm-Message-State: AOJu0YwQmuiuPUt9qyFYxfOek35RtjrGNVxOxfqoWmUNo2cJjBjs4Wlr
 kV93lVHrZD+a4b1fteMfGEy3cW8R1HvZb/LX6oIgxiZtnd+VKG/vV4YTXJx3274=
X-Gm-Gg: ASbGncv2ECKLZ7Tq1huLQlTkQ53Es8DO2nzIKUQl/K0PHeCS1ADuuH08UWL/m/bqei1
 fh4h1ipP8D330G5AxeF3VV7JjQbaVdU05BOTNCHFepcTTHk1rJP0EQGYvqVdnRwUJW79j+4Tfu/
 LUoz3/pvMxylEOkrZ3AQAo5hBNcKAujMsnJDwlv7yQI/Fm8PeLwFusnNH7fQEfvAkR/EOGDem4R
 45u09NI5VOwmIvDXJEi9SnzrjEPmb9Hi8fp5jxBUDs5+s8OhxJslOL4mH3igDQ4IvxJ60O33eYP
 wbACpRA9PN/jmD9eH0FrKLH0h0hWmxTtYro0mt/aVNOpORRMskjb8YNEbvMSH+HMQe21DfjMN0Z
 DNZnZQJa58nklpjNslF3bHJ8=
X-Received: by 2002:a05:6000:18a5:b0:38d:d701:419c with SMTP id
 ffacd0b85a97d-3a1f6482ba5mr13962597f8f.41.1747130012128; 
 Tue, 13 May 2025 02:53:32 -0700 (PDT)
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2f4sm15544504f8f.78.2025.05.13.02.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 02:53:31 -0700 (PDT)
Message-ID: <2f16acd5-ac5d-47a0-9eee-4af2d17a1288@linaro.org>
Date: Tue, 13 May 2025 10:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meson.build: Compile common_ss files with right system
 header include paths
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20250513083343.148497-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250513083343.148497-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 16ONTaswjHKL

Cc'ing Pierrick for 6f4e8a92bbd.

On 13/5/25 10:33, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Since commit 6f4e8a92bbd ("hw/arm: make most of the compilation units
> common"), compilation of some arm machines (like musicpal) fails on
> certain host systems like OpenBSD 7.6/7.7 since headers like <epoxy/gl.h>
> don't reside in /usr/include and we currently don't add the right
> CFLAGS for the common files to include the additional header search
> paths. Add a loop similar to what we already did in commit 727bb5b477e6
> to fix it.
> 
> With this fix applied, we can now also drop the explicit dependency
> on pixman for the arm musicpal machine.
> 
> Fixes: 6f4e8a92bbd ("hw/arm: make most of the compilation units common")
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [thuth: Add commit message + changes in hw/arm/meson.build]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build        | 27 ++++++++++++++++-----------
>   hw/arm/meson.build |  2 +-
>   2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 5ac64075be7..7131aa2b21d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3228,6 +3228,7 @@ config_devices_mak_list = []
>   config_devices_h = {}
>   config_target_h = {}
>   config_target_mak = {}
> +config_base_arch_mak = {}
>   
>   disassemblers = {
>     'alpha' : ['CONFIG_ALPHA_DIS'],
> @@ -3419,6 +3420,11 @@ foreach target : target_dirs
>       config_all_devices += config_devices
>     endif
>     config_target_mak += {target: config_target}
> +
> +  # build a merged config for all targets with the same TARGET_BASE_ARCH
> +  target_base_arch = config_target['TARGET_BASE_ARCH']
> +  config_base_arch = config_base_arch_mak.get(target_base_arch, {}) + config_target
> +  config_base_arch_mak += {target_base_arch: config_base_arch}
>   endforeach
>   target_dirs = actual_target_dirs
>   
> @@ -4099,28 +4105,27 @@ common_all = static_library('common',
>   
>   # construct common libraries per base architecture
>   hw_common_arch_libs = {}
> -foreach target : target_dirs
> -  config_target = config_target_mak[target]
> -  target_base_arch = config_target['TARGET_BASE_ARCH']
> +foreach target_base_arch, config_base_arch : config_base_arch_mak
> +  if target_base_arch in hw_common_arch
> +    base_arch_hw = hw_common_arch[target_base_arch].apply(config_base_arch, strict: false)
> +    base_arch_common = common_ss.apply(config_base_arch, strict: false)
>   
> -  # check if already generated
> -  if target_base_arch in hw_common_arch_libs
> -    continue
> -  endif
> +    lib_deps = base_arch_hw.dependencies()
> +    foreach dep : base_arch_common.dependencies()
> +      lib_deps += dep.partial_dependency(compile_args: true, includes: true)
> +    endforeach
>   
> -  if target_base_arch in hw_common_arch
>       target_inc = [include_directories('target' / target_base_arch)]
> -    src = hw_common_arch[target_base_arch]
>       lib = static_library(
>         'hw_' + target_base_arch,
>         build_by_default: false,
> -      sources: src.all_sources() + genh,
> +      sources: base_arch_hw.sources() + genh,
>         include_directories: common_user_inc + target_inc,
>         implicit_include_directories: false,
>         # prevent common code to access cpu compile time
>         # definition, but still allow access to cpu.h
>         c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
> -      dependencies: src.all_dependencies())
> +      dependencies: lib_deps)
>       hw_common_arch_libs += {target_base_arch: lib}
>     endif
>   endforeach
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 5098795f61d..8e3bf495dbf 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -8,7 +8,7 @@ arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
>   arm_common_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
>   arm_common_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
>   arm_common_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
> -arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, files('musicpal.c')])
> +arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
>   arm_common_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
>   arm_common_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
>   arm_common_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))

