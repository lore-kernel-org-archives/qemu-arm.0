Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92ECD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:49:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTDg-0000jt-87; Tue, 16 Jun 2026 08:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTDe-0000jd-Ri
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:48:42 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTDa-00037o-UH
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:48:42 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-66058b880e9so4362233d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781614118; cv=none;
 d=google.com; s=arc-20240605;
 b=aFplqXIfLTKnrRISnJGKNlQxDc80TKLapzVI0UM6b5vIGe7izTmKaIG0cLmLgXRURO
 fbAQq+wLHddGzf5y8EkzPg3Dyj2PWnk4x93zyUBJsJUI7yQ38E+F2FkSFw8jyOI3rVaB
 LSMMuEfk7khePuwWWygCzNQ0CLAuVXdOZcKWvZ5enVylykNcxuv1YNKiUpx2QgR48u8v
 bJLgBU0+VjQLad87jgBwaqLVIyyiPo7wRbhW2eyL4cfIvf2GbhHsE40UXP2m2GWMFRWV
 TTucqvlPW0jqAYFugz3fFFGj6/NfRNHq6Nsvxk3mgRh5ya7j89P8QR1K6AoT3tvJoGkJ
 jWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=i1pGzmnI/QvRqZdFy9heN9xomoKs5zp7pPEBsBs0YEY=;
 fh=9QX/j/F2706HIK4cNtK1CggQB/nfXvAmF17aKARoLLk=;
 b=Tyh4mtxfu4jm22rY9IXmiUN8Fh8EgCaXjk0ohY2TXhOpp7FclWhP0+7SarbTnzTYAD
 NLnu3Y8DZsk4wAJeE1gNV3lgjJVmUWYqGuZk0F0pFSP1rcPii4U8qRNvSBKbHMh0Umju
 d/ov09H3IKbr22WPGZ9Va8IUpX2FL8D0hSARAXfnb0G59s1530NkXv4YoJCTHQ3M7N5h
 xYYCFsp08Z4wqVpnlAHLP88nTd1uhGF5o68wK0d2Rj+p9GX5DSJ6Wh1atCwjMWEWO1/b
 cAb+IQSAHKdYX+J1lmbMtV37PtO3ej35zYM8iAcMwlVqDH/1SUpfal7z6ohDTadohWwl
 zNEQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781614118; x=1782218918; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i1pGzmnI/QvRqZdFy9heN9xomoKs5zp7pPEBsBs0YEY=;
 b=U3jquDT+pH+sa4JJY+mm8LwD3rS01t3diW4d1FJxHl9qWGoIhmXe8xQUmwtSHEC34C
 f2lwsICFA76ZFEb4AS5aPOTbRdekR5oTRSM1pM+TXwQS1NBWMpqrh/yeDi54zHAADLqw
 67OPFso19UP93ou40WNGV2CxaUc0b9ZPY6jQd1qhnlaAPvMi1DcdFYx2StbG48sKpfCc
 IXWlkjmjgLusr1nx+zXVJGMXjkJh1mAdh4/DSgHG1k1qi6WHgg/jgbexu6foORJAjiLP
 70C2QX7rjUhKnOv3ZLdsCo6+IbEyBLCIpdxIvStgO0NOs29a4SsZ3PE/bUXZK3WSFth9
 RS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781614118; x=1782218918;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1pGzmnI/QvRqZdFy9heN9xomoKs5zp7pPEBsBs0YEY=;
 b=QHiFSbsOh5+iXqzhNZpzJYLi7XW/2TZOy4OdRI63sDKJbQ99wTcjfz0FHFagyKkLnD
 8/I7ZW4pMLafF8DoieuQ8mKWESiWRNAW5ipz9nHoQB+p7Y7m8nEQ8iEiTVrPpqQeD/lJ
 c8ZEguzKzSja4y4RXLQAXcKUM5a612KGLkwqaQgTynLN1J3yF+A4TWJlHpXlX+s32vcg
 33XMHqoHZH+njS5bNBR3sL/Y6pYuzMlQD7bcPFnk3+PYLCxla6kooJ9tKnPvKnVHrk7E
 LyifJWI1StSBKMDyABT5NHsf7AuoYB/91WJxnirbqKgXdnU8ioGh7NQ3E4mQ7jMg8GsW
 6kjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8saOxFEuupSYSdVqozH8PMUIUYNzNoBhXcfEtTfpUjGpsl9rLPdV2gI3i/Y2aUDgV9H3nfigicmA==@nongnu.org
X-Gm-Message-State: AOJu0Ywf2xCvx4EjSPmp+JPeMMmzUXj0d4MxGCToDrnh3g4dBCKfxM4w
 wcwLC9jU1AusaRXwEhsoQjl2cBN0zs6atb/Ssl8+WFi4rsr6q7muWuNEJxaQHkaxMh6vAEWgim2
 brcp+bqvbFxS2pIOmo5uvagJmE8EPjAaQOcheMWhUHQ==
X-Gm-Gg: Acq92OGd3ivsy5t/Eq+bvPd0Uu1wxyPKxsU1GhNX2iO4/lUIgDrbeHesmPgG9W7GiSX
 W7ymkwf4kLp681VBoaAZLTnq3cOUbKVeaihGDKx4mRGXWe+qqFY47NbrNs9hQJtj3pVrwiCzl4a
 TANQq0M5e4zNR4g4nXC8q6EtEZp6KZxW4ZIiix8CtKxzSfJyA97BZYCbS9aaLZbsgsQi5xB2qgT
 KcIp1vybUwBJ9OAHf7vwetkuha8VKv0ypgNfhW6rDLqg+CzUhItC2y6nBBxw3CRou+Ol9TMXVw/
 +1Fu6y47q+eyqVkiS5JBi8zamegdVvEjJbZgTv/qo1Rid+7Idgs2rIbWHTZLPKqF+tkk28JWy2Z
 F3g==
X-Received: by 2002:a53:d205:0:b0:660:d512:46dc with SMTP id
 956f58d0204a3-66285165c47mr9873321d50.57.1781614117437; Tue, 16 Jun 2026
 05:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-13-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:48:25 +0100
X-Gm-Features: AVVi8CdhsD3hKOMTbhrww1OomvH6v36TU1ngI2CzJg_G3MxBzfMqsEy2NR3XZ6k
Message-ID: <CAFEAcA_JJVwr+56Zw+8RV5MHJHyz5_rmVsgaqnZfJR-xpmcopA@mail.gmail.com>
Subject: Re: [PATCH 12/25] target/arm: Implement Floating-point convert
 (predicated, zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is FCVTX, FCVT and BFCVT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

