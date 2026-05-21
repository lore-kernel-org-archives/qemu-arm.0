Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C330CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:24:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4JE-0001d5-NG; Thu, 21 May 2026 10:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4J5-0001S1-0q
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:23:27 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4Iy-0005aC-Qf
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:23:22 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65c6a2158d3so4485883d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373399; cv=none;
 d=google.com; s=arc-20240605;
 b=coRB/3NAJBU5pY4s8GX3xmwsi9m+7D7VOPN/IxemfqX6b2DUfiMHRT92XJIEPB4vJC
 JU0WKGxzNOxS8icm6vuoQiwDfgVWVV2PBYHBGuYsMZM8uWKVr3Xbr93PNcE9nJPbciuP
 Dmn1rn64usNBAQvz9LRnh/p+lPphShR5RonaPUiIRb9ptXkkEH5Gp927Lfrlu21NIYKG
 +s/torXp3s8XU6dFnCMSt8bT+QlytQ7ZH35Q10iKGaxMQ24+O9LHxYwrn9Dz+zRrWIJG
 zLKOo/ihSW2a3H6Akc+ZTIy7XBEa279gBoX76XEB9xP7I4PMmzvhsLXDMk6FPQVRIXCg
 dkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Tx00YSWoNN3QtonE9PblQbU/nys/V09n1+FQnSga8Kg=;
 fh=/z5UCj3hbLVa9d4zBoEtgwwcTyuKOOh6155maXq2nxs=;
 b=M93+A2hZrknEsf2WeN3GtIiMb2qtwd52epQtLyEWOhfFsn7aRzSSoD15SH7eukiUty
 dmIdEJcL47yUFOMuldjzldFIhangLZO1dwcwrdCfxOYESLrruQaNpqK/0SB7DNpUpjHM
 SMQysM6Uja0oBof945o92EiCPk7M8K6hzZnuayI8dDDraq/9ztxsKk3D30+tsb9vS6tS
 +C5A7h8EBInUR2fEOQu6yrb5QzuSZXvAYC/egQRRV8sMdRAs5DJjl39oMZQzXpto0sjA
 cvXTEncAFlSs7JFo+5bIC9OFe1IeWGJJx2rDNnXOuMFNmGp25e8mGX7HVNUVkQdZhSrP
 QufQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779373399; x=1779978199; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tx00YSWoNN3QtonE9PblQbU/nys/V09n1+FQnSga8Kg=;
 b=LnqtjkoZ+jncM8SBQ2ue8TiHowIAledroqY4pev24bKAnZ47uZFpwrR5C+aAubEKLx
 4389+FkWiaP2cW9PDIh0OOErIJv9U7AGvMRsJsxH3H5qUODAvyB01kp2t6jq5dDcfbxC
 5L8uxMPOP1EnLTuuH8sGKp1zGABSUmeAqMU+o3j5fs7+RISUYItRjL3esA8Zbs8LyamI
 K2nzSw9UY8tCZmO/uM7pcoBN8mcYDPfZQZJMpIh22TD0gzDEdrtjqB+cElWRXZbQ1mKo
 dQK66Dvmd1wE/NapXThrXNGzG5ylNliXGZui7AEPUhn4Ds88C+SUjXTF7WgSZyACM4be
 DkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779373399; x=1779978199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tx00YSWoNN3QtonE9PblQbU/nys/V09n1+FQnSga8Kg=;
 b=T1/B2fbVNbscYop1Z85cP3Xi84DwpiDxqqpmsKA8831+YSrvI9MohJCxHG0B4zcXKN
 FmG4KrTiVYZSPFwVnwy3ZM2IfDC+IyUL8xdQs7Aa5xIERArs9AfJ4cgdRTDe3AduSqaN
 RkcSyfJU7L5eMurMEKKM+RzX0j7qErTkVzEXm1qRr3MvzwjjcNW5K8fjyFnQmGSnGs5+
 Nq42scSkQkrIVpGSiV2ptoSIQWmwirvV0UcazuKGQYs67DepNXmIyzSdOxxd9MHKt9vf
 0VMrxtKai9oGiSb0/b6Spm4W0oO7hqgq4I9I3eD4HXd3kthsZYF9YQZzj2uHZ1GCBWJ6
 Ug3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8CwY/WtfP8PI1yB9fUX4cP9MIw8ZQVmA5SgEke/P53OV/J73czMBYhc+qh/3/PM3WrFxsRGq+wMg==@nongnu.org
X-Gm-Message-State: AOJu0Yx4wNDJohUkJFxr5GVZegaiyKhd2NItxhrMLTK2Ve5INxSa/tO0
 IIai+FKe+w5pW9fds8q6BRJDcT/akXkAm1Sh0Sas9fboHbBlt5X2xhcNyyxaGGxSqQDiwKV2Z/F
 WQI46Bm82Z9SBIVNcnjz3j8X4PBzpSejLyAjnjV+e8g==
X-Gm-Gg: Acq92OHBaBuWeh7YJQ7sTJxedXr/HuopDH63bfOk+DL7o6FPCI2MpsS3IgrEN9HY2xU
 vtAoHAU7Nd1/OVRxT9LEa/9J5WR+sMJRYXSntba9xEM7VX/m/Tuqv6g86zJ07LeBGVB2Zy0Z0Ru
 t9l0GxG8c6PTsmqSC+YueFNDRM14+j3VTM3acFB+wRxDY3g3kkcn1im27YL2/ktk0G+Vo139aEs
 0pouSEZCJOqhjKweXbFnupftekinFpor2KTLlyePEWQBGnsEvcT4RWAiem/Lv+nX0VjMktbB4bU
 eKl807Ri/dDqbWCPAYSbrZrLcbPFvyBznLFTjVUX296McwcBpMYoXo/YcszPbWBadCY=
X-Received: by 2002:a53:acda:0:10b0:653:8ef:935 with SMTP id
 956f58d0204a3-65eae22f601mr2046041d50.54.1779373399358; Thu, 21 May 2026
 07:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-16-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:23:07 +0100
X-Gm-Features: AVHnY4LZiB9EmzHWt3A8O2YvdeFvmhc7FKzXIKaX6bJjgb1HwUdI5bUErDsCrQk
Message-ID: <CAFEAcA_96ThP1wcTUtESz6sEa7QWnh-1Fx4o8Ww2XZ0K8kCB7A@mail.gmail.com>
Subject: Re: [PATCH v6 15/64] target/arm: Dump FPMR when present
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 20 May 2026 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

