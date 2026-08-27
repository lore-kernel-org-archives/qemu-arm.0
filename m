Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAAFC61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:19:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzWGy-0006Sl-F4; Thu, 27 Aug 2026 05:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWGw-0006SH-Rd
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:19:46 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzWGv-0006pK-CD
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:19:46 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-836c718715fso20004417b3.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 02:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787822384; cv=none;
 d=google.com; s=arc-20260327;
 b=nG5Cj48k3p21xqAPmDw0PuK0sqAWmdFVuURyxaTCRvPUHePPai9nZqhooCQ/Ebfp46
 KyM5KJHQKo3UPFkwDyyKQ/5udqIo/Ftcg1tq9xOulnZbTH2szBLAr1M8PnWPLcU5iObC
 ZJ+uhhZ9dHdjWiqh+aEtSU1RBmLvkMVaylY8LDYpQKt6xy3IbUwslWsN6f/Bbb6Wsrhu
 MJPpzY8YphjgInUa4lS4gdfwoi5xv7Tc8wmmkNYWnvo+RMbnJdGS5IHB4ALXfPYdVWMo
 qAUclbg714uw09kpuiGxrqqfb/cJo8YKPsguLVx5bCwdNi/6G3eQXwgPCz99u6DycyB2
 Sp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HtBlM6Z6bTfGegu7sb9BhAkdE/aBn0pvhLP8tvsv0vY=;
 fh=P2HKXT9rOKaGdgZGBuyTfQy5rJ3jOe3dtB+12lvL6yg=;
 b=iIrS4iDXrXq7cGJDKnxHk2QRLTN+T8xwEsmOF8wPSGWofjU3PDf9y+j/XOmxOvyBmT
 9FE4nLmSeZs5SoZTsNjBwVEFkOmt+QUFfeA3aUiaAB+eLDAKQaFxQjyOIckXZac0Vw1s
 UEXiNToDsoLQ7bd3OrOdy2K9+0qR78bUx3wII8uX6T31ghZB0TM62eSgEjcUbGoCHrbr
 k7yhLM/getjNMwVSQAHRwsHGxkv7j0xA/Dn2ew/JuJyrsUGRtgPsJXzaypME/AE/22qp
 lI5fYfWDLtz/JsOO4kdjZ6EaC5LDG0IddKA3KsrvuEELao9lxeONdygkYPEB1JV9M70u
 rc8A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787822384; x=1788427184; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HtBlM6Z6bTfGegu7sb9BhAkdE/aBn0pvhLP8tvsv0vY=;
 b=vaSd+ylC6T4XL8g4ktIbpRRCCBWTgoKVOa7PVwODYCHn6Gl7qcRyfvvPedDglwlTA5
 bfnPTGOawUJ3aYOvXdifdKewnM3AjsHYkJ3X3sEm/6+Us8bdX+e8jjk6KOJbvr0R+fT0
 qd6Ly9q0M4zqVLL6RjUOmtZyP3nGFoEXUj7Auz96Fr6ACetGwHX3TGjjFo72CsI1kk+W
 2pAu/y7VZpnddkdSgxXXQs9Hl4EzO8sr7rJp2WQz8PI7EYPxN8FY8gdtI2U8y7Pva7AB
 q/hwUaTgrmOcRJMUbYV78RHSFekfUFUyfaYcMmJ7CGGc1hL+KXANFHwTVCUa+hGmWxGA
 UHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787822384; x=1788427184;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HtBlM6Z6bTfGegu7sb9BhAkdE/aBn0pvhLP8tvsv0vY=;
 b=KG6n4D+Vy1xvu3K7o2j1PeCuTlViDzPVTkx9PwnK/8X0I7usS3nOiMVB9v0UoHhrIv
 WYaOZ1ahdQC+GHlT+37wqi/eMjqoPnOeG+P/jfz8P7yXuZ5ebrY9JUt4VRUFLaKJGWUY
 g2fNjHMDzRnHejOsO9KjoigtIi7g16C+lgwnjnQgpYF0GDwclFu+5tR5LPeoWWeSIY2u
 iLd9ajNs4Vq1nqwmp9niuLDfNoGMaItK9hKAU+X9Zn/+T/kW59ZEnhlhPDqhxzHVCQNk
 tDbIQ75sU1GrRYNp4qDPxxqzTRlZK62uvc+t10N06k8jr4LOeBVX9UaT+hIq0PuvlkKY
 cKuQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTFDPJmaNnFOAITj6jJKbo+4ReRhDyNBLm/NQuRwfy1Z7eeYjyTpN6dxgS4m+ixaD8OjCZ1wZQQA==@nongnu.org
X-Gm-Message-State: AFuF++lFwt+mjPCNypfyxzymekj0miASpdLdyjpxxf8pGpnrqekWSgrv
 MGusZ5oS/RktnvGY0HS17IwwxbQwx1Fb5XA/ribIs3BwMxXKDED2oNTg1+syN3MA6eFfHOMchME
 UaBYQrq0VTouxCpM8Ld6bO3zfN1ObqNOwiPAlR+6DIA==
X-Gm-Gg: AR+sD1376y0ivo3gjHQAiRbMpplwSggQ8biZc2OcuxvMoJxLNWe3VGEj6qYncqiwcCJ
 f6hoOtn0Z911ScLDtt56LRhnRPPoi4tHl+YyYOMZ0tblj6/YI9/VLSDcQWMv8VZTsZQYh36OqA4
 +q3UHpobNswTAaPDkeSQU10dcWexxLcxH+1hWQeA98dgUPyMJQxYpZY3OjBXGIES9KuvMMtfcYr
 ckdb2swczt+jVe4XEEjMSTXfx6NTuuApxNOnSAaKNXhHC9VNXAR4ozX9CSdnK7TKffA6UR7N+lA
 MP9h1goPg+xR5KDvTNUdFPD+o+8yJXaqACZLIlidKmUWMC9mHgHDTmdZOAesNnsNoJNNA6AL3Lr
 TmIzjM9dInJLO85VZJmPLeenVzAgJ
X-Received: by 2002:a05:690c:9c0c:b0:80c:ebd4:762 with SMTP id
 00721157ae682-8573be1e4c0mr61989607b3.7.1787822379833; Thu, 27 Aug 2026
 02:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
In-Reply-To: <20260825040452.1322251-1-stephensportia@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 10:19:28 +0100
X-Gm-Features: AcwNN1XRZThkv23MUPhrrgokKre1Ig6vtj8xgI-faEZYcmow70zlT5AbwWYVdik
Message-ID: <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: stephensportia@gmail.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
>
> From: Portia Stephens <portias@oss.tenstorrent.com>
>
> The ssi_transfer function comments say that it takes a word varying
> between 8-bits and 32-bits. ssi_transfer takes a 32-bit arg to transfer
> but there is no means to indicate the number of bits that should
> actually be transferred. All child classes of SSI_PERIPHERAL class have
> transfer functions that, despite accepting a 32-bit tx, only transfer a
> single byte; m25p80_transfer8(), ssi_sd_transfer(), ssd0323_transfer().
>
> The current implementation depends on the SSI model to know
> what peripheral model will be attached and what transfer size it
> expects which is error prone. If a SSI_PERIPHERAL model was written that
> accepted 32-bit transfers, it could not attach to any existing SSI
> models.

What is the motivation for this change?

As far as I know for the hardware SSI protocol, it is indeed
the case that the SSI controller (and/or the guest software) needs
to know what transfer size the attached device expects: the
controller just transmits (or expects to receive) however many
bits it is programmed for.

> This change updates the the naming of ssi_transfer to ssi_transfer8, as
> well as changes the return value and transmit argument to be 8-bit.

This means that the API will no longer work for a controller
and device that aren't 8-bit. We happen not to have any of those
devices today, but why specifically stop them working?

thanks
-- PMM

