Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86EFE85367
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 15:20:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8gJn-00059l-87; Fri, 03 Apr 2026 11:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8gJm-00059U-8h
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 11:20:18 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8gJk-0003gI-DW
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 11:20:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so25775625e9.3
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775229614; x=1775834414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MoKl7MAJVVoQBh3jJHjMhxTrlAT1hvj3U0F3jpD+bug=;
 b=FbDwjCDSbjK8fYQqSadtAarp9WNG7gX1RFBvDOT8durwHAfwGPR/aLw+5I3r7Vuezh
 E2rfoNjJZxHK7qL/IJalnuKmCQgdG2B/OcpO9jlf43EYW6lzHcjGbT7m8+YN8KONKkRJ
 CfXBS4EJkmjA05C6j+Yw1wpJV3ZfezMr4llT3AKEcaCC5rrdpGZ75MGiDR4GKT4W/unr
 A2ZMqt65zUazEv/TtQZl8cYFKpUZgsSNKqM3TFJon0Ot3a5mgkivoWNhCsvlW2AZIXtm
 /nlUOCl4PX61Zvw5o8QtfkJxatduqpJ4bZSXO9l1jHb6PVQNSXJv6FkKga26+IZul7Ob
 jLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775229614; x=1775834414;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MoKl7MAJVVoQBh3jJHjMhxTrlAT1hvj3U0F3jpD+bug=;
 b=ZRfdnV239QWC1/QoW43YU2VQnWOrJaEb9u0jlTQV47VuR2iDN3yw9YExgiu8loTorp
 F+locKLdKQZLSybXcuYZA5TvUn+Jt5vQPCaogw+q/ovp2Ssh8h00sR00re47cUBkomSe
 Ve15ReF1lwsdjyyX1L+Ot7y0invbZ/C+S2nssP31RYddKrADzyq7qrtruderKuo8CKdu
 /MeYX64BB3kNkNejk9wogtSGCp4JOqTIjzjZwYeguPT/bp969d0rp8aeoSR+xU9tDSqh
 GpQMAKZJjpDTq6hejFJBGToTd+fz2Pa/+bgVmXYJngdj6q/ZKcXELu4gn6cu+8ZVNfSq
 q/gg==
X-Gm-Message-State: AOJu0YzQJtHAJVIJ2C8i5YY5x0qkfxJAeaZUY2k1KCgDohwjgX2ltxIu
 Js5yWHGVUniYg86O7rHuAIdD3P6nm6QMQAgaa/WOLKDtXi2F0Zc0LjxtMh73QHnw2kuFkGq0wAA
 H0P5Sijs=
X-Gm-Gg: ATEYQzwW51cQNM8CilGtCmjO62CPZ4syFwQEOFNvpEYiqybNHxo2putTlfodf45NQ0B
 J0YMKL2kR21KSqiWwTSoKmHovxy2f+ygqPw/O6oNoMaX6QcIAXxQ5nunKHDLI587KKRahapISD9
 4UbdU/7Q0CcmgMKVRcHZFqPDiwVYQb4oMgrZuIYSPvyJBBV2RvW7H0k5UJYUUTUL+rhRZ6AcCKy
 UP+aBSYRrP6N0IFmDGcqY1aX83w2qOHeCemdQ+7PolF7/1li3li/nAlooDSf4LuuLo2i8iJRgfJ
 l35iHhfVh9b6fFoYtlILq6E0FaC9PbiFLHq9gp1uDwn80NsYRuEyJNpIJYB98qEyL+lBUcqQVtx
 TYhKsLFhQOT7h9+2Sb2iwpsLNHjnCcHivirhchv+mO/CPtbX3BvhiEPG5k3btKgsehq4UcIR9bf
 zQGAJETUM1knWWN/ghzn9/xAtcGF4ZilwqSZYrquBrFuElTJ4JBNoa24DUqghlJqC+MQ==
X-Received: by 2002:a05:600c:5292:b0:488:966f:70a7 with SMTP id
 5b1f17b1804b1-488996b02f2mr59056445e9.2.1775229614020; 
 Fri, 03 Apr 2026 08:20:14 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93c014sm284836155e9.10.2026.04.03.08.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 08:20:12 -0700 (PDT)
Message-ID: <12644bc4-8713-489f-9ed8-1ee71bf26a3c@linaro.org>
Date: Fri, 3 Apr 2026 17:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/omap_sx1: map CS3 at the correct base
To: zhaoguohan@kylinos.cn, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Beno=C3=AEt_Canet?= <benoit.canet@gmail.com>
References: <20260402071718.130490-1-zhaoguohan@kylinos.cn>
 <20260403014441.38725-1-zhaoguohan@kylinos.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260403014441.38725-1-zhaoguohan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 3/4/26 03:44, zhaoguohan@kylinos.cn wrote:
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
> 
> omap_sx1 wires the "sx1.cs3" region to OMAP_CS2_BASE instead of
> OMAP_CS3_BASE.
> 
> That places both CS2 and CS3 at the same address and leaves the real
> CS3 window unmapped. Point the CS3 region at OMAP_CS3_BASE so the
> static chip-select layout matches the OMAP address definitions.
> 

Fixes: ba1580299d0 ("omap_sx1: convert to memory API")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Note, this got unnoticed for 15 years.

> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
> ---
> v1 -> v2:
> - Resend to qemu-devel@nongnu.org
> - Keep qemu-arm@nongnu.org on Cc as requested by Peter Maydell
> 
>   hw/arm/omap_sx1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

