Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB519F3C250
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 13:19:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzaVY-0000pJ-N7; Mon, 09 Mar 2026 09:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzaV3-0000h3-BA
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:18:30 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzaV0-0001cc-Ef
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:18:20 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64ad79df972so10923268d50.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 06:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773062296; cv=none;
 d=google.com; s=arc-20240605;
 b=dV5U2too/wnnr9u415Pb0dsLQ9O66GoYA2p170H4hsaTtjp+hyDbjIctlLfK1t7lHN
 cJBnCKv8ooNZNs8vDxGoK42OgGQrrF5Ivz4/I1saG/sp0vv9ypWVuzAmkIwG18rdN/K3
 B5d4D4aIm5DjGxKJH20FJJi5VgV2EWXI0fPL7sJRlc2oaZ4+S9HhW1kVVaZyPhe3h2TP
 uB3UG3cozb2fqLeDCtgQN5R2DuYvyXrjg7tcaal4itQT8tP1DScV9mlgcEd8jEok55sv
 9BREDL0XLFe7wWBYJFzkbK/mvgYIpanzTwGWF5A6n+QmOsb1VPOy3HldvvSzYm9rxslh
 t6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SbOWHHVRszG47ZlggvIgxsalaSxoDe3K2iT0UqzdKNk=;
 fh=mGTWdAKPidnpjmns52QqLeEGwEJNvDiLmG3ph24JSxM=;
 b=K/NOPz8/zrqe5qd/RtHOfyjielTQzZCgP31nLXnX/CLh8yig88jKbHRJ6OhttuB9WM
 oZXApHlW7TIhlKG4BOXVJqgZKbqUPAbSlCNzRGZ0cnpEBK7V/PB51YUrBsR45HXiZRfC
 zg0/R6JOE+1gpvyJBIFyBDimeW/s5X00TCf8rBZZ2s9/+xoSq+EHZBODz0KUHKEPJxSh
 LsqkCtcZ8ciV4fCCo3YK9WmsyjTD1YcktnKL+V9PzO5RdLcbDohlPpmhMgKc5jOwSg0+
 YuVYpXg41DOk5Hl8+m77KNrU3C2e1T3JZPolqSFtDBaYOzdL1PVbqg7cRUNaZy8tCsEP
 PCkg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773062296; x=1773667096; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SbOWHHVRszG47ZlggvIgxsalaSxoDe3K2iT0UqzdKNk=;
 b=Cwb7NfEojPIn8QVs0XvLIbonajkpBbyaaXIn7sdnqoDPA4xMHadV/cKmEvjOjpViBY
 D/pZ0mZsxmwDOx93kVNpYJYKGH8jVqhSvU3RyoJS3EYjlZQRT0NAjGJnAmJwW8RF7fYB
 kNS0+CbUyIIq4pNRiW/YJZM9+Z0kpFvQ+uZyMM/QSZVWjpRXvt5YeNlRkk31Eiran9xu
 9cHQjWYhteGt2B3uxe0mvsyHJ27adldl5m5vhTr34R8a+vG8wmeZooQA0dXdsvVCUwCQ
 nQ+WGFcZ7xDK5kapxhVgFjjcsrUozsd/h/139zrXyhOuYPdCPBFBmoUsUOds/R2WMIGh
 WSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773062296; x=1773667096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbOWHHVRszG47ZlggvIgxsalaSxoDe3K2iT0UqzdKNk=;
 b=kXE7wnnanNAyxrM4xA9HJVaWg25rEVvyBJrSJv1iLH6+jlYxJlsDF5gLxF+vvMuBUN
 6IZ/VudNhLGvjeEJVn3EP2sQ7eTfvcuh6tZmNJDN1w/GyVsxGNs1OpkyU/5V0kiD/wGI
 FmRYKoMwbj5B5er30/WoTQaFcuCseYVHJHgudTKr49tYcWAnBIo+Wt/Ew1IThpFsbxQY
 ySyC0QpcEwd91Wh385Srx1cmOtBnQpLjsOFS6QY9Da5st17mvhZ/eS4/n2DulvnH8wiC
 G83ozqoI8e+pjzYZteQmJ0gic+cHZmGEq09GTu+fzOBSPJqRyjJ65vzIoUi/xG1Bmac1
 VftA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD7V9qJDm/zMAvKJddLn6CE7nmtK87darxXBZaNdxolRaUzaQHRSJlxg0fmOE2CnrBqoGn9xinXA==@nongnu.org
X-Gm-Message-State: AOJu0YxR2SiaNoFJcmQ3nwE2cx7BMjuDF6P+LNqFgUNohr/r4b96nJ55
 S1h6Uj91pThs1hQaTedYX+NT1fS38jxoUUUipK5pnfmzcCaGNaUcSPZSlZW2maU36o7WPihr1mV
 iDj4IEektacOS90VWZyI0Edg6n2waexAG7JkqM2urIw==
X-Gm-Gg: ATEYQzwlfN9ZrT5GDhydLwjq4ATXZkhlSlUhiwibmgs0eR/HHFMkHYgHwp3eLZcUAyI
 v3WmgJYX1hOhUy88sY1gaxG3/pTyCpy1kTzM+Ae/1+5q0VErC7WYXQAupEa9N+7vJ443XReICEP
 FHBzVovBoxqXi7fl981smZXF+VyAYaitc/OhR13y2wd2Wa1XGCfqjo5ldWfNMoacUtlt0IbKciO
 KCbuRJ4Pq7YFqct2oMvuaExTIxW6t/xkgOab8CEm0B5vP1LR3ILxOa3MGHW5rUNQtmM/i15JEsR
 JOXqD7KNnDyAeh7gLWORT6rLKdhdefXKVXX6dBXXZs0VwutIw/p8e1bvbnGc0df202E=
X-Received: by 2002:a05:690e:e0f:b0:649:d3e4:43c3 with SMTP id
 956f58d0204a3-64d14361080mr7842730d50.80.1773062296372; Mon, 09 Mar 2026
 06:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_D3A83F7C6433B6B2D6C4513970FD0446D708@qq.com>
In-Reply-To: <tencent_D3A83F7C6433B6B2D6C4513970FD0446D708@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2026 13:18:04 +0000
X-Gm-Features: AaiRm50q7Q3vxVtKecmTYiXAlOIptkbGH5Hqks3SyRoH_sLCNlbL8H-QbInN96o
Message-ID: <CAFEAcA-L0t9rGZuJ2CWPitkBP4qBA9wvFf+xo4KN10EiWHjf=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i.MX6UL LCDIF: add model, build symbol,
 and SoC wiring
To: Yucai Liu <1486344514@qq.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jcd@tribudubois.net, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Tue, 3 Mar 2026 at 14:32, Yucai Liu <1486344514@qq.com> wrote:
>
> Split the original LCDIF change into three patches and address review feedback:
>
> - place the LCDIF device under hw/display and include/hw/display
> - use registerfields.h FIELD() definitions for register bitfields
> - simplify drawing to 32bpp host surfaces
> - add vmstate migration support
> - use SoC child device init/realize flow (object_initialize_child + sysbus_realize)
> - add a dedicated CONFIG_IMX6UL_LCDIF symbol, selected by FSL_IMX6UL
>
> Thanks for the review.
>
> Yucai Liu (3):
>   hw/display: Add i.MX6UL LCDIF device model
>   hw/display: Build i.MX6UL LCDIF via its own config symbol
>   hw/arm/fsl-imx6ul: Wire in the LCDIF device mode

Hi; thanks for these patches. This is just a note to let
you know that I do have them on my to-review queue, but
since they've missed softfreeze for 11.0 it might take me
a little longer to get to them, as I'm going to be
prioritizing 11.0 work.

PS: something seems to have gone wrong with how these emails
got sent: the 3 patch emails have a header
"In-Reply-To: <20260303143157.80437-1-1486344514@qq.com>"
that ought to be pointing to the cover letter, but there's
no email on list with that ID, and instead the cover letter
got sent with
"Message-ID: <tencent_D3A83F7C6433B6B2D6C4513970FD0446D708@qq.com>"

The effect is that for instance patchew doesn't find the patches:
https://patchew.org/QEMU/tencent._5FD3A83F7C6433B6B2D6C4513970FD0446D708@qq.com/

It looks like something in the mail infrastructure you're
using is rewriting message-IDs (e.g. in the cover letter it
has added a note of the original ID as
"X-OQ-MSGID: <20260303143157.80437-1-1486344514@qq.com>")
which is breaking the patchset threading.

thanks
-- PMM

