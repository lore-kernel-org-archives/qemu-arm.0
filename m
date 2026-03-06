Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8502F01814
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:14:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyRFg-0004xj-N3; Fri, 06 Mar 2026 04:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRFf-0004x2-3o
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:13:43 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRFd-0008Hx-Km
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:13:42 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so9421925d50.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772788420; cv=none;
 d=google.com; s=arc-20240605;
 b=X6Jlg4uoGtHKv7wx8NIiqaN9ShlkePKh6SehMcflC9OueUPBD/EtVXV6StfVI3coBY
 wrEn8ZpBepD2EQUAPmegTC64SFjxCu+GNJwrUv0uY1AUhq7d76v5S0kxCwZviE0nJI/M
 U0+BLSOp0/xFcJ4g3TeTb8NJXEXPj++Igh9T4sIf7rVk9DJYzVbbtbUBf+6eGrcQNR6S
 ZJh4+0hfFI0DGtS82WYSckKIsxeCMdwlElKxLR9dQJJd/asaym2v9zOFr0nRaEnSWbez
 Li8I7b5Gj+++FJNG2dJUfdgqxKo3cJMpHvV08CxUwyRONjnO1cQgSiM9W/ueNHk9XOIl
 9CUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+5hNQXNQU++ooqB//AGZRG0XjgG1eUksrOo6LlmjADI=;
 fh=7UvC6VHdf7EXL5f5zpi/5rQBA6eZ2jGOE+K0BVh0PsE=;
 b=Cj9gWUDjwgIsHywYjVbQbOhqr46VQTgLHTIQU+HqIMd6xcvDsRbBNnTdpbhww0yeDj
 LIuRYNXjSvjaM4O1tVB5NLwcWbHJ7jJK96gFrsgmV4xNJu8B2muhjALZE+AZfBSnHJHy
 2FXmvfyi8ZHKnJ4RzTnBxLMCS9+dpeD9ArktjWYw+6Zqi5D8i1C/QrrVmypBtA4kFmeM
 P5QsFmhrb0kVNktnCRefeleBo8wbGJK5j7ooWmLGBdxzBF3gEYW5kzOJwmcvcP10rZwU
 HPJZ5KzqHgAPK9Y5Us0ebT0phQG55MUclu2eGA7J3c/ex2Bf/a/nHAmWh+nrvwzpyqRu
 7k+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772788420; x=1773393220; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+5hNQXNQU++ooqB//AGZRG0XjgG1eUksrOo6LlmjADI=;
 b=GNse3Rg7qhA5o8O0C31QI2+Lmt7JdsYg1WqgFlMwmoXDeENayLKbNBu7t1RhRaV0GD
 k8H8bkpVLy/K97LSLdfrwwfgtoO4JC/lANpiHYuvwC+NTjprTz2mGCV1li1bPiyLr8Hb
 jz9E3+oCVoB6yR5HWfjmNeuYu4LpYTQr4Kx7mqpY0ZSyZNeNhLcexauOI4qtPpaIt1fT
 ZWFUfpwl3M4t3Pkiuhu+JO4T5QraWTLumrn+BryzXyAtwgJbVIDz03I1AO41oNhKk3bh
 9K6/9u0OUiavscDIKI9ChFp/k7JZ5Wvz+wZdXc277vQubQZwQT6CKvSLwrzxqF0/zqi/
 sPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772788420; x=1773393220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5hNQXNQU++ooqB//AGZRG0XjgG1eUksrOo6LlmjADI=;
 b=JG3NLXHIKVKeyTV6SdVZZwhWpd2Uj9GoQLsdZQCDTKpJYK8DA6BoNhXK8UvlfgbsjQ
 uqI4n2tdIRjmKEXKosHp9KYmS0LmXhCGkjekWPp9ybAK3+AxQWw5rFfyY8RqJrqp9Egn
 ij+rrO16pFCcn+wiLqT6nK8Cgy+Mejfr1AxsyhIF6aD0oINmPKtKrgNFc5v4YbplhYTK
 MLEp6ty9dxJcpmwhgdD2T3AoyyUUsZchXjHsAPn0jZsxz6TJw0Y4R1BZImtxbGG75MVh
 j6yuOImjL48h4b5UZ/ZbXVFyrVqyYKyK4zhw4iyoEKHVAa8oLQz0gO3cEvY159f8Xg0l
 Mi0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+W6mAiL0wzMASwx1109ZeS+2gAJZ/b6zcMdckm+BURN84s41GiZe7oOkpGNqF/n4HYEj2y8NwlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxXBJNjuFP7hKIhayxZWCaH9Q8oew70sGMIF3zfKUzHYi/16W/A
 doVmjweWGSo0n4T7ukeeFLPBQK9RUhzEe7ad+1BdQdv8XhNJHCiXeMG/ajdhTqvos1QhsnTXLTD
 QuKlFBUIqQMnnpycawy75pLA9jF6ZqMd9c16hffb7vw==
X-Gm-Gg: ATEYQzy2ZHuWlbIGbfwztUulwRLgX4uwRRUfYli4ZUBk9Uvw/zRSRITf8V5G0+jSZ1v
 qqI/lrUj+rb2IUpOwXecuQfde9Gs0p/O8ol4CFMUEhpHTH79eLbWgGDe7okm4cvDLW0GjY6M4rs
 dvkiX1gbyvCOUuQeK+Nn59HGHpcpPrt3VPJ4z5bNmlEBYrcRjfwCYaqHOOnDAFhi9W54f8QDrBl
 jWF60CjHM3Y51RUcetd+Vz3DB6MKp18Nz0UADdY5zin56LMM1+WsvylRJmIWQbcKTS2qKnMfLme
 15q6+EbQF++F8V6tt9qFxTAOqc3EbrCsSYucjZ93Zivn97M0O/sZcf2mCI31DVuCrUiANC5O3r1
 DNQ==
X-Received: by 2002:a05:690e:1443:b0:64c:ec30:9dd8 with SMTP id
 956f58d0204a3-64d0719c578mr3811846d50.47.1772788420593; Fri, 06 Mar 2026
 01:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20260306083113.74177-1-mohamed@unpredictable.fr>
 <20260306083113.74177-4-mohamed@unpredictable.fr>
In-Reply-To: <20260306083113.74177-4-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:13:28 +0000
X-Gm-Features: AaiRm51OgIje20Ki4-1bFqizkmg70Wlt7bP-H_xWBwZvyvtHUbpVDISXOaWW03A
Message-ID: <CAFEAcA9Y8e75ATpE1+w-dAP60oRwy84+8WyHmD9AYnKUjn7XFw@mail.gmail.com>
Subject: Re: [PATCH v14 03/19] hvf: hvf-all: stop including hvf_arm.h
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 6 Mar 2026 at 08:31, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  accel/hvf/hvf-all.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index 033c677b6f..5f357c6d19 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -18,7 +18,6 @@
>  #include "system/hvf_int.h"
>  #include "hw/core/cpu.h"
>  #include "hw/core/boards.h"
> -#include "target/arm/hvf_arm.h"
>  #include "trace.h"

As an unneeded include and especially one pulling in a target
specific header into a generic source file:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

