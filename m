Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD9AFCB61E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:33:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyY75-0007Hz-Pc; Fri, 06 Mar 2026 11:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyY74-0007Fs-IG
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:33:18 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyY73-0002Yu-2g
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:33:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48371119eacso112091665e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772814795; x=1773419595; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9EMMAd/DqWuXItCh+HKPOnk2q8DVffg/N5vlix89U0=;
 b=u8FnmzbN6VyA6kbMZTh0Ovl6lx3qBiCusQbsKVXLJ2hm+Rz6Fw2ONb3xVtOSruew7M
 +nWD5FvsBfejIdPkovVz+yVJOq1pVqZdl0AQpY50WIK7MnaclYxLxTszfyu+U7i3Y5eR
 OO+sZ6tseDjkslljfDIreiWriXyKiRyuEGYjuHv1CZz5VHrvpLd+NIJBOC/XnfQbJbQ5
 UEqBWMLBOUfcotKYuepaVsUVLhrndGR6NYBJXXhc6j7JWzXJpAYUUaUmW8ONEzNFtMAR
 Zi9zxmuXsNqRswM9gMb2fgYfATUB/Hl+F98WG+JpxfQKODrc7Q4uqjqgRb2eO1yqKGny
 g+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772814795; x=1773419595;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9EMMAd/DqWuXItCh+HKPOnk2q8DVffg/N5vlix89U0=;
 b=pP6KGLCz2HrktgzBmz8sZjZVBrdqnnkB9RcgNF84LJypkxbX/8kog4tck47yrtNO0P
 WGoFjvTqHTa1oVgHw+f05Roqcp3GHwJCcrP02z+8B/pvHI2k0dT7ATC1Ut/YyvsaIUoq
 thlhFHzH3Te0hjQHKKX6ciZtewvIKGxhkD+N4CLsGOQvQUF+hQcwfHbEXSfuurx69DK3
 +3PpNkU7y3ndBZrQRwx67BNxUKibONUomEtVfAKaINgquZQxPBzChc5b7Cjo9hRbhGkW
 +Yp0SsHrmu/yqNmjmNvaVgnSvY7UUCJBfn6Z9mlh9b7735e51FfuYGGiT3GPRocqUgRR
 EtLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Bi5qkSP/Nm/dMq167Z/zwVDuUMfxfYr0vPVrhQNW7b0qa1rNWEknP9CV8OOg8MditY0ZcNcYEA==@nongnu.org
X-Gm-Message-State: AOJu0YxTCxQn7wI1/3nCsITnfw1ex43JbG+lb5U3G9YqLll1NHpdR9fG
 4Cnbb29tBrTApYhPEOyGZi0kJxARSrSreNNqeKVvNTDACgXy3ixRXOyC9FWmHmK7IUk=
X-Gm-Gg: ATEYQzyXb/HtoniONVwwXmLriZKlaDZagrdk18Gs+hADcBPNIybGQ60YFmSrAQiKAbs
 kEjiystJfAy5FCwDw4dzjeg/zX/ooSfAccjOPweIQAbw41Ul2MTjwbdt3UXXkkQJgnXv7ZgWo4w
 ILN22SKF1yNPfNqeK52p0MZ6JxxrrVf7JpfZ4HkXrorusRKcH5dl2zQxSEE63O+yoQIMKFd6qEh
 cZv3BwhdXVTBaZ3Op3GLec/3+t0vxJoODGsUcUkJIvclQ+mfn9kJcx1nnI5oaI7k9MXc7QlZwpn
 G3EhPzpFF3ifZ3EyYsx41b1kpOUDooGWXBI4wtKsxgsZX3GUCSdCdrmZDeLmk8k0LU/Dx3lQHIO
 Dcx+2J4C+wcjW/TfDLqBktd9rw/306ADcdXx/GB0VpOil/F7MsAXomwwsHA4aniqthJ+GjRYZT7
 nMGVB+aquFLu/DQgOt/UiaUnxf/0TQtjs9ToofdeCNEq0CAzsgKLP7cQtwyizeLCMzPA==
X-Received: by 2002:a05:600c:1991:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-485269771aemr45251245e9.30.1772814795116; 
 Fri, 06 Mar 2026 08:33:15 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485246ece8bsm31708075e9.4.2026.03.06.08.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 08:33:14 -0800 (PST)
Message-ID: <cf4a92e0-ac38-4ef9-92f4-1c5df9a5d952@linaro.org>
Date: Fri, 6 Mar 2026 17:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/17] hvf: sync registers used at EL2
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20260306161509.79712-1-mohamed@unpredictable.fr>
 <20260306161509.79712-15-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306161509.79712-15-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/3/26 17:15, Mohamed Mediouni wrote:
> When starting up the VM at EL2, more sysregs are available. Sync the state of those.
> 
> In addition, sync the state of the EL1 physical timer when the vGIC is used, even
> if running at EL1. However, no OS running at EL1 is expected to use those registers.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c        | 63 ++++++++++++++++++++++++++++++++-----
>   target/arm/hvf/sysreg.c.inc | 44 ++++++++++++++++++++++++++
>   2 files changed, 100 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

