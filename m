Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5627BFCB602
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 15:48:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vytsR-0000at-Oj; Sat, 07 Mar 2026 10:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytsP-0000WG-EQ
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:47:38 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytsN-00035V-O8
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:47:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so3460685e9.3
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 07:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772898454; x=1773503254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uy6fsAjaiBkjdLFTyZXeR9dcuL3818n40UIdo/e1MZY=;
 b=bm0y/9vSwSLGrqEIAnq2bNpiaS5yvNdrmyM7mlZAyKawuIOdFGK45SvcoTnDXN0K9E
 BhK+Urr8CMehOyh+wMRpbxkT1FdHiTuuVX5riYFhxE+oSxpTYOG1RgZzqOAZTgWjOTbQ
 OGfyn2OQfXeWyuvvudWyFWs3Mah+00hd7tcCtPLDIlaVGU3eInwKKRZtcfx1MyingYZo
 uhpMQwavECKl1AbS7RJLSB31fGIC0t3OJ5zFBI3pdONAHzGrrGq614NUg9Ejg7RMNhOd
 /UzMqztBxPRXNhmUrk3RkVwFePIbhoZEr9gZxkFXezZOh19qw6F+zybzg6gKRAodl24G
 +d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772898454; x=1773503254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uy6fsAjaiBkjdLFTyZXeR9dcuL3818n40UIdo/e1MZY=;
 b=etgh4Z/0dHPWYde0UHy8kmDS5zfJToKQ3eVWB7wjSg4hTfKR78I8BWBwzNFfEkqybM
 ltDXw1ILmUWKZ66HIRPFSoq6G5nRDxhNCQ7WGicyz3/NN4gh3EyllfGgvwpIjD0N6eWQ
 gnSoNEYKM7z9LMjKdL0VUxlbRtUOcQ4ZL9bShZGUDidd4PkC4QH0ZKZcPI9nWqy5A/Ga
 Mbs6hPnke8SBVAF0YUeIb0BEill7AxTwOdvfqRUGNhA/7ZpTFq0hFQBUdrc9rxBICR9b
 y/mcGxkw/k3vsxVcNHq824cPSgMxnPKTYYZMLuEf2JEIVDxDz1Y81s2BTx3UkY4vJqVH
 9jPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXY7FLSNT/ICQmeFUCZbcHhcIcK8WD3O//hm8DNwxUmxhAuwJzsPZI7UUu0PsRO8oe7VRKs+cUdQ==@nongnu.org
X-Gm-Message-State: AOJu0YymbCMfhzeJAoELTNYfwq4NfY1uKY+Pj9bm+YOl7u4Nv5JjXSYV
 xaWvdojAclp2kuZq+MuaJ16eKuGbaJaLXbFDGpbJa95tkjCAlKM6evuUw3/HWtksQUI=
X-Gm-Gg: ATEYQzyQ/tSzaG/WIN3igkbODNvM1v+yWBzhv+yjcLojT2JVbdE50qhA6yrOK9UFqyG
 1nEItAcPn7l1+/l0/eezQlIyH7fR9nb13RHiJx3aEBZ2p7lfXDJvqbXSwdkwPAR20K3luLcvjcN
 vUnOdRUL2NzsfeH8MIyXW1IkwmLRSPDB2Yiz1+ztZQzfXvqtQWZ9oyGrc9rFiopO84luz53pgjh
 D1+sWMYdMw4nsdtfNw6pKQgt1jO+JsQQbhxi4TuD6sVrGc2Lx7JbNf0g1DdHZ2VXNDpEjPzREB6
 tlZhuPct/ZpMW0DtAStSmSFbRFb9xEnrhxUXNX4MVB3TmGsmmpZzKupR25Cu1ZHUL3QrRonq2Sd
 +xnKxrYi3ubXk0oKFItREtFl5/XwBY05Gd39h26ZVlqoTuGAn9xm1GApHgbqujg0NDgn/coI+aT
 BFY7aAKL0kH/KwcvvzmL3GZYDSUN0yk1E1MLeUgsMgr1sq8bbzRxWCssY8Ec3Hc7SQ+Q==
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr86833165e9.34.1772898454124; 
 Sat, 07 Mar 2026 07:47:34 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb4257csm315377545e9.15.2026.03.07.07.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 07:47:33 -0800 (PST)
Message-ID: <20cf8186-1a0c-4141-b381-401c4372ea24@linaro.org>
Date: Sat, 7 Mar 2026 16:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 04/13] target/arm: hvf: instantiate GIC early
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
References: <20260307153143.76893-1-mohamed@unpredictable.fr>
 <20260307153143.76893-5-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260307153143.76893-5-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 7/3/26 16:31, Mohamed Mediouni wrote:
> While figuring out a better spot for it, put it in hv_arch_vm_create().
> 
> After hv_vcpu_create is documented as too late, and deferring
> vCPU initialization isn't enough either.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

