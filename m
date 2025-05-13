Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp849134njb;
        Tue, 13 May 2025 16:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW12f8NjDGfLtrOBd1skIVnuyYtlb4D6V4s/a9YsXaCqXW04rQ7IoW+8WYBjhZBJVM+DweVNIJuFFE27w==@linaro.org
X-Google-Smtp-Source: AGHT+IEKrDBQOktucOVyTelf2gH7P9wubut136+RvMhSvTWYjOhStOEEYD8JBAejmzNBb34/bpex
X-Received: by 2002:a05:620a:1a0e:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7cd28890f8cmr211101085a.57.1747178445829;
        Tue, 13 May 2025 16:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747178445; cv=none;
        d=google.com; s=arc-20240605;
        b=fCXYaDz3pzIDUtInzcBE3n8pCG1obdR1zzO12+mn1ROj1GAliJbMTm0D4gvQhCdAh/
         ZxCDYwjLaPfaha8Y12A3CQB+YYoEe6AsvG4RyVY4kus37vSUTHWPFrDcPkI7QtGm7v/b
         HEgNKctKMnqY4isWWwN4LHcD1nHpERcxcg0E/LUFSS84gxmz5ANQ/YUC3etg3THTBB0P
         0ihEt2L5AWURxLJbQJqBABzSjKpSpuQYESpzW49cXY/NbvjBVOE9JeneF33o1ef0YjXb
         qlB/yGk1G217SL+GhQjRveHfCHBP1T/zQ/kYd6zwPUZKAgn/vRKFUIxJTPMu0uOB8ejN
         BvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ptnBdOrH3dXuhVdA1Pm0/5wz+jwDYOdOULmTRQstQJ4=;
        fh=uWUSW3+uiVZpqmaiuF0saxcqT9QzgiZ/eGdqQdZFzRI=;
        b=fgZbRzS+2Oo0BmWz+4oTD0oPu8APJSE9fGVW9utYUKr1XcWZMxUC8rU/dI0JtmisWI
         06anFPshkI7fxdkdJw01eLWHNAVFthnFPHdQX8vpmu5OOJP17Qxk1ZniDvq+/woFtuZz
         +DZSIQ4B4XBbrAbTEEPTiAyFiOxoJ2uhC/VxwM0dkj+rBQ68u4INcukATDlprB2F7lRp
         G9fwyekcLn8a+AS030r9Xj7KDPIAXIWUvTWamoB11aYzEci0M1os534YvgxF6zu4Dmlw
         0zmT4SrsZt780oB76EXBi5vkdbK0MIxtV5Z5tGxFu8sJwsKLDmlvaA4RV7i0E5Tq6i1o
         Fq6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwTkIOrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd01021351si1207242185a.593.2025.05.13.16.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 16:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwTkIOrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEyv5-0007Ed-NC; Tue, 13 May 2025 19:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyv4-0007EJ-SS
 for qemu-arm@nongnu.org; Tue, 13 May 2025 19:20:18 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyv2-00067T-68
 for qemu-arm@nongnu.org; Tue, 13 May 2025 19:20:18 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b2093aef78dso6197342a12.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 16:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747178414; x=1747783214; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ptnBdOrH3dXuhVdA1Pm0/5wz+jwDYOdOULmTRQstQJ4=;
 b=nwTkIOrUZMrNyEefbxktyCfXxxj0pcOD5MiyPWlgsCjrs9ATaSBScbBl0vYzgGsZd6
 /EXCReGNeNlK61dpVmaqP3A6DwnnTQPPyGNzzOGftWV4BZD1j6GQ6eIadHo5lEXmaMFd
 MT4eRFAZndlDNIVe6c3ezrpB5aJ8T4Lo1ygRpDzEXqrD84G/srzY2eQa5unRyJrBI3dZ
 +vzjcuN/IaoUzEtrXKsGHQTYlMNTICXIAAioQ+jOPM5PvoH7+fwjuGXYyP/hgoPi0EPQ
 /iQB8wjVxnMRj2WdgApR/ltuaEQc32TfRCgGTbSXxyXIfBNvp1uzF+Xy7E7nHtlt3ru+
 lOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747178414; x=1747783214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ptnBdOrH3dXuhVdA1Pm0/5wz+jwDYOdOULmTRQstQJ4=;
 b=Hyj2BVxoeZF/xn0zxZcoHQm9z/pLY3R5nZyJvxRa0MSI8EDRX+e+4iqHKPujVWB9Hv
 9LMziCfZ0JFrc7Q6R/OFehjumqdyaDy+De0HT/NSNKOe3PA9tdcupjlqdZH8+/8zXxRt
 FW7YuhvSPfEbGwzO7zQG7yilxx247e+42+o4JkQAeFKGIIFLQUx36ad88CNVEN8mJTih
 wSZ0Mgj8XVUZJEIKrJXOXJNujgaTAPDtDj1OqX181y266DwLucBFTMX97lRTwN/Y5mc1
 ktZD8oYoyCuZEdqRJnN2SNx00q86+TM6Fa7uJNNPhvlsdJ4FGmtfzsumiBwvzaujYZHU
 R2Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9rM/BHdL79RqNCAq/h6Ye/tH6QZMKC7CfKXeV/KrE5o3zHJb8F7mZbGVUAFXtyx2DxicNWlnfYw==@nongnu.org
X-Gm-Message-State: AOJu0YxSUm9Hqa+vv01MYdBVmZPneeJRTnlq0vXkj36FLMLqPYKmpy6T
 58jBGI4E6tixDzx7YcfBR24Dp0eLNm0tPRHap7k5mdEyaFz/Vb4UeIRXMEQCxDo=
X-Gm-Gg: ASbGncsxVRhzkdUAipOJ0zd1n067KT7mWvnrkwMu5xkfp9W0t2/Gh5OOwFQqsuAU13J
 qo9smwRVirPJHjzuvCIxrkNJrSbyXGycCEna+4TswXME+t89ENypiengjtj0d499kbULEPhAjxj
 /Wx1rpadlrgL9UqEffk7EWQ5En/LFc8juL7MpRv3m0WTKeUpllVxcLtN3tf6HS4ExV02pEQw8n0
 fmqajMKxC9yygeiuicbZ4oT2qgPcwb3dParoYhFTXlSvcMixxIvUzE4IaWFztbuOqt/1cAF6cur
 OwmWTMPugKP8lKdmK2bsw4T8RV9zQTc/ckwuto1CHvzkLuz4eW9ueAn6pFJsGFGR
X-Received: by 2002:a17:90b:518d:b0:2f2:a664:df20 with SMTP id
 98e67ed59e1d1-30e2e59bfd7mr2339027a91.7.1747178414356; 
 Tue, 13 May 2025 16:20:14 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e3345ffcesm160832a91.29.2025.05.13.16.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 16:20:13 -0700 (PDT)
Message-ID: <d1bf2e99-7320-4a20-a5cb-2e7ce70036b8@linaro.org>
Date: Tue, 13 May 2025 16:20:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] meson.build: Compile hw_common_arch_libs files with
 right header include paths
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>
References: <20250513115637.184940-1-thuth@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250513115637.184940-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CuVcVbG9nsO1

Hi Thomas,

On 5/13/25 4:56 AM, Thomas Huth wrote:
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
>   v2: Change the subject of the patch according to Paolo's suggestion
> 
>   meson.build        | 27 ++++++++++++++++-----------
>   hw/arm/meson.build |  2 +-
>   2 files changed, 17 insertions(+), 12 deletions(-)


Thanks for the patch.
I didn't run into any issue when building for {linux, macos, windows, 
freebsd}, so I assumed it was safe to do things this way and specific 
dependencies could just be listed with associated sources.
It seems like there are cracks in this approach, so adding all the 
dependencies per base arch is a good idea.

Any chance you could base it on this commit [1] (and add it for new 
libraries as well)?

This is going to be pulled very shortly (as part of a wider series), and 
the same fix will be needed.

[1] 20250512180502.2395029-4-pierrick.bouvier@linaro.org

Thanks,
Pierrick
