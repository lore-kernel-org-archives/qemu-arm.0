Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48938C5DF94
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 09:27:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wynQc-0001wt-8H; Tue, 25 Aug 2026 05:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wynQb-0001wY-1w
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 05:26:45 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wynQY-0001P7-Up
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 05:26:44 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66d06b5f023so2933191d50.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 02:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787650001; cv=none;
 d=google.com; s=arc-20260327;
 b=Iee9jx3T4NYu3j65KB5HQa/CuaLvDzVVgP7BuF8UNfvcj7Ma9IXJ/3Z/KUta9yN+NK
 fYlNkfZLea7Fd7yuTeItWkCw5AC6s0BfLVJ+xYpG/chRee+K4YyEQyMVDnZcx811+DhJ
 biMbR1waUPA/LP3a8avDMoJkRzIADuP7xtA5EvWzOBbK3e9YnEdAOTdcT/eLs38fY8eM
 bcA5PLyDxDk0s0GKlkXY+E575EW7fgL4vaw9/B6WIJXjEgZW/XCgStItF6Ng9VEXE732
 52ejwDK1ptgcQSV0ImjLlMeor8ZaDIlytkvttVomsr5HNY7N5+WzAq6EdME0A2Dw7LbV
 T/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rv4C4op9b/+H/RxL4FDvYBB1nWUocf+3RodK5gCKWeI=;
 fh=spul+1muL+H0pM4NBzUGH1fPOuUXbTbkMGUsWdpic1E=;
 b=lUEVZuc6RKBq/6TIzynFLGFgmaabjxITsx3DQ21r4HURJu7OKuHyCUDpgly67SMJO2
 IGOQyOOz4Al3WNaJlKtS0VCilm1O/bDuzdtR7irbDj6C03nsxT3oai1A+3Hnu0cisewZ
 WOKmxKEhJaiZDbGvbcZ4h7hZ/V4eeQHDHRFvBHRKKbdJQwtSvtDHf3N/GW9CHBhij78f
 MjUilHDTrZ5zLtgrCQVZ/fyHshRqDTcbmPQNWbJRMB/0+CuNJXT/YtYJNam4vBXoNXVH
 svbcDrIpLcaeZWKbKsTwyt+oNYenGHDuRUncAXZWD6FrYBkAi5Gzxcw5T0JGUefZ9Dy0
 LlxA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787650001; x=1788254801; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rv4C4op9b/+H/RxL4FDvYBB1nWUocf+3RodK5gCKWeI=;
 b=nefJIlLy9M4bogJsH2xpyfIJvruhacYbUSCwIQI5KdL/BRnmCDFHnVgDx44GimM1Nv
 Ds3DoxUs+uOt375T5VTB/vP+7CmV93jLgCtbws8HN0o++PAEMRFQkaUmUxF27Eo++jmQ
 Nj9xb7I9EWSrPdmYiLW6kb8d7jctVqEY2I5catn30n/MAkKdZUiFfrGWRrMThy8pKKVJ
 blZKwXAXKEo9ddwcprWZGacGZ4W6kkLXDkoN1A8DTNf8JfvKwSi2yVvNu2vyaSarPzTc
 /33sld0u+dXY6IwX1EeU67jX9ACRKnS1jVMd3jm4AiuDX2Mop96QJ9+E0ccnDoLxRAYA
 BZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787650001; x=1788254801;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rv4C4op9b/+H/RxL4FDvYBB1nWUocf+3RodK5gCKWeI=;
 b=IqRxZN7Ey2j+ylHfaLheSjjq8eYzQhjV0NPETOW1Gq0+pqSXjgOVz4sUWRDX8Jv4a0
 gIV2b2DDcwWRNMZphm2bRF34iu/RhWTB9VukPifgD2uNaRf90qEHnx19ej0cAWyozNwa
 vZXQRT+BBjRWlgD+jX7qMp5sx4GA821eYGWSyqIHJCKCA/Qgp3qNF/o1J6W/oSbDMT8X
 BZz8BEpBU+udmn1x54QIxxq4wI7owY5zxH+6CEvwsP/upvBsmTPpT7213Vt+pLzEcE15
 /aqmGof/vclWe9mxUw/JSuPcvmAAQnvMk9XoSobO/InpfFkd+kg/nY44ApM+P1eqj6Zu
 DLsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUWvaqCeCB1RlccwlK829iaPqhc6tqF5dp2t6QyCVWYP26nWvvKNLcojgDawN4m80yIZ0n3eh36A==@nongnu.org
X-Gm-Message-State: AFuF++mWVu06NBzehgx4kTOsxI+tHD18TaZTsfSXLUV/YCOYa6RYz4MP
 CH8uuTXthcexkcF3/Ib5Fh4vkBjf7/VZS7Kmszu5DcI40oYnvumXH9T5QUwGaYyAqIrU/6qeMOE
 QIsdxO9d/t0Z9x0OOAcOgGLBpHcioPmM3CZkPnOoU4w==
X-Gm-Gg: AR+sD11yB8Dfln7L+maTZMkgdezB0zYePEQ5QZoLIiOESSzLAltx/YdgzjeJPX5Oxsg
 XwBrfH+aKSCPYlum6Mr6KoTgzvMgJGmOWeXsTD1iPgBDebsGfdkSYpYs24GW/hmtrVnYthh202r
 mWejIDOOjiX2+4nEeAbcv9grWFRYYedJ7sSJHbc09bGDORBchhUbLQVCTMZKxmwg51aSOiPc1mX
 6eMARjXZovTN6D+BLVBUMl53hBeFiDvPm0WQ/ELNuXvbaSypoUNVhGJqyjnKhHXzj3AcLwpI8lr
 d/a8xhl7UsBY2dvslIyCkNW0dlLFQBlOIzOfXXh/OLEtRUYdseMe+FtxSH2DOH0koS1xHvgoN/m
 xB5jXIHnMXSfeoi2PmqvfyVY/PcpO
X-Received: by 2002:a05:690e:1449:b0:66d:1131:b81d with SMTP id
 956f58d0204a3-66d1131bc41mr2756351d50.29.1787650001294; Tue, 25 Aug 2026
 02:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154225.863984-1-bin.meng@processmission.com>
 <20260627154225.863984-2-bin.meng@processmission.com>
 <4c1c01709d9e903fbe93fbce5b901ff959a5a01f.camel@alistair23.me>
In-Reply-To: <4c1c01709d9e903fbe93fbce5b901ff959a5a01f.camel@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2026 10:26:29 +0100
X-Gm-Features: AcwNN1WMUESrB3U3h05wX1Kvwv9VRxetZ7MD9KvJUFZHGc8mH5meqMDiXNCiHEM
Message-ID: <CAFEAcA8VtORuoLj4p62vj2dGtsawWmaUWUw4dW6vtxn3g5aG8w@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: xlnx-zcu102: Fix up DTB for direct Linux boot
To: Alistair <alistair@alistair23.me>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 25 Aug 2026 at 05:20, Alistair <alistair@alistair23.me> wrote:
>
> On Sat, 2026-06-27 at 23:42 +0800, Bin Meng wrote:
> > Real-board ZCU102 DTBs describe the UART, SDHCI and GQSPI nodes
> > in terms of ZynqMP PM firmware providers for clocks, resets, power
> > domains and pin control. QEMU does not model those runtime firmware
> > providers, so using such a DTB with -kernel currently requires users
> > to edit the DTB before Linux can probe the boot-critical devices.

> > +    zcu102_fdt_fixup_clocks(fdt, "/axi/serial@ff000000",
> > pss_ref_clk);
> > +    zcu102_fdt_fixup_clocks(fdt, "/axi/serial@ff010000",
> > pss_ref_clk);
> > +    zcu102_fdt_fixup_clocks(fdt, "/axi/mmc@ff170000", pss_ref_clk);
> > +    zcu102_fdt_fixup_clocks(fdt, "/axi/spi@ff0f0000", pss_ref_clk);
>
> I don't think this is something QEMU should be doing. Modifying the DTB
> on the fly just seems very brittle and prone to breakage and confusion.

It is something we do already in some limited cases on other boards where
we don't model all the hardware, for example in imx8mm_evk_modify_dtb()
we nop out some nodes and make some other minor tweaks. I'm not a
huge fan of having to do that but it's a pragmatic thing where we
don't have models of the hardware the kernel is expecting.
This patch does seem to make slightly more extensive edits than that,
though.

thanks
-- PMM

