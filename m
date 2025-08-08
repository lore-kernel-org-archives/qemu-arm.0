Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5E8C87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 21:02:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukUEG-0000Q0-QT; Fri, 08 Aug 2025 17:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukUEF-0000P5-3w
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 17:02:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukUED-0005XF-5m
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 17:02:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78294a233so2107123f8f.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754686935; x=1755291735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PEcUvJccWZ7a6pvXxqwMpv2c+4Vbe2O3qQZAPPUX6Mc=;
 b=Wck+r00WM9LMmw1zTSMj+Dy/S09BqMYAsZlJuTre7wC14ORLlSAsG/s9WvMTgsMXIT
 5Wrspu4a3EP71itcIRkRsOiQx/9eV+PwLEIlDCwHjYgU93oBJEv0E/3X9f8Lyj+mLNjl
 qJPlJQFuxlRq7LDrhseez5+H04l/NqV8/OKTu2FkHfIH0c7azapVlxGmeStrtWqZ2H5/
 A7yM33x3aUlkedGkm7dQelOQpPgxByxdk8YZGAxRBKGdUQ7+z6zRF7jAZWtBJLT/UXih
 ovkwTx4Tz/SYowfD9JgHP/wlP7phG/EGsUqogPbR89Z1zNagOwCMQKVs/439XUlYt8l2
 3ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754686935; x=1755291735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PEcUvJccWZ7a6pvXxqwMpv2c+4Vbe2O3qQZAPPUX6Mc=;
 b=d16/GF4skbV4zu7ELnU/7i7moV3oPgTzrTsJF8Uuahg1Qde+TdAi2xRuALgSozIZMs
 tTScBL+FAW3ZpbRZ5Y4aQC8vflXxfe3vFw9qhbyeYFkRW3ZsZFWFoGnXpH44qFPjd+fK
 Q7p0edq9bA+7gqrsz7IkUIwDFgzWfYHbogmsDvZBGNP2UKYxlJJRS/CWGeq8H6wnpGTc
 x4pYiW5rOiAH/Rvb9PZSlU4MHcpf4Ho7edair146hxJQHOO8lwdAzBUejxNg44QnUcP5
 2bpX3goTHVJQcvak0ReevPVH2Q4apKPvgItGRBgH54gCWAFEeqRAZYyyG9SW4THKqZ0N
 a6XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPUt+jnSbXoC6k3vaQwdgyCekpFXTjWLUSqqvzPMc7uJ5Ln+ytm8dFO91CMyYcOW0CIfWvDrFQ5w==@nongnu.org
X-Gm-Message-State: AOJu0YzTW26q2FXSrUkKd/U9qQgJxtwa3kfq9wUdE8USq6Bq6Ys0C7xD
 wZ+ZN5Cd2xCb/3vJUP8EDjj3lC4qHCYWdyfr6Ejwu9jLgCIj+7XzR8UHb9OSJNtyIto=
X-Gm-Gg: ASbGncur4Oh169pxq1i4Tdj5AX8dRoQOrlZVAZZZXlA1m169pdHjL6HXcgy/TguWKat
 0MLFFsucETfs5yOZ4fb5NY+5onxt8zblH9q/cAn4EtpQ4To74Y7Rf6F86QuXxwNLwEeQCsUlBbr
 AyDiIKP4vX15+IhuKF9YZfQcsUWvqSKv1xDjMpUdUjhVnLpRDczCSRafet9juhAomJfcn+h+jN1
 RfKrT3E6Rh4EvfrciS7VHW4hzduaNXvxjQhjdZ4DNSKQquGzzJ/Vh04GysMvw+XOsnaOQOWE0mD
 2Up+KFAL3ZtBWFqrFpiRZwATkBkeTXK7Z7WcuEzR8GNAiJmtOOwc188Lh/CRVfTYBZlQo80AxeC
 +wMAt4tpaQHeFw5Udpty9OuH/503MXTYtphAhcbnleiIyjA5Os2jTyk4z3Q09/CjYHg==
X-Google-Smtp-Source: AGHT+IFBLNQt//4DsqFu+0ozKB4+wf02DQ2xNv33ae42IBT8q/04vKLRrl1lXqhgdLDF6d4sfAoELg==
X-Received: by 2002:a05:6000:2c0c:b0:3b6:46d:fb70 with SMTP id
 ffacd0b85a97d-3b900b50bf5mr3715282f8f.25.1754686935003; 
 Fri, 08 Aug 2025 14:02:15 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bd5a11d3sm143222145e9.0.2025.08.08.14.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 14:02:14 -0700 (PDT)
Message-ID: <42a2cb33-b929-4cfa-b62e-9ef82f938ed3@linaro.org>
Date: Fri, 8 Aug 2025 23:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/18] MAINTAINERS: Add myself as a maintainer for WHPX
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250808065419.47415-1-mohamed@unpredictable.fr>
 <20250808065419.47415-19-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250808065419.47415-19-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 8/8/25 08:54, Mohamed Mediouni wrote:
> And add arm64 files.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   MAINTAINERS | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 070ba2e9cb..0a1f6e620a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -539,11 +539,14 @@ F: accel/stubs/hvf-stub.c
>   F: include/system/hvf.h
>   F: include/system/hvf_int.h
>   
> -WHPX CPUs
> +WHPX
>   M: Sunil Muthuswamy <sunilmut@microsoft.com>
> +M: Mohamed Mediouni <mohamed@unpredictable.fr>
>   S: Supported
>   F: accel/whpx/
>   F: target/i386/whpx/
> +F: target/arm/whpx_arm.h
> +F: target/arm/whpx/

(you might want to have a common section with both of you,
  a x86 one for Sunil and a ARM one for you -- adding there
  L: qemu-arm@nongnu.org)

>   F: accel/stubs/whpx-stub.c
>   F: include/system/whpx.h
>   F: include/system/whpx-accel-ops.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


