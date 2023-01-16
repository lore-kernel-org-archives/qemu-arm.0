Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1078931ejc;
        Sun, 15 Jan 2023 18:48:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXviHv1mFyn9QlxSAWqCesbcKxpjinDd71wUdFXWTwUCtzc4kYb35iS9Hj+p1i683JVgtE3v
X-Received: by 2002:a05:622a:1452:b0:3b6:2c3b:8c00 with SMTP id v18-20020a05622a145200b003b62c3b8c00mr9679105qtx.66.1673837287775;
        Sun, 15 Jan 2023 18:48:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673837287; cv=none;
        d=google.com; s=arc-20160816;
        b=hkAEOsW6j6OWAsNFAOhh9EgKNMsfql69cxLHscUBhmkxUGyC27mHec+LOJWnm1LxxW
         Xvo6G6Dky9lJR/QWObvwqZp7WtZaDwYDV5DgVdf3Gso0GbvbXDxbfqAz+NQF41wQ05Kf
         Y7G2zS0bgHaYjA/uNFxoC5HbF6gmZGLzqCNpwoznBHlWoa2CdWnCs2xi4pI1XfJjAW59
         2KE9u6Zo6IzH8Kw79yXyGPOpBbqBkqfDPV17SL6kqDcgwk0cL6qs7ZrYGZL+e7+XTU88
         JvXXJxLYMz0TlEcgN31hGe2zefxu4nOOEbms2J/DjYpgx5c8qdvpIXIaO3Uk9byAEZHH
         WkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QbgOcRBfetYVNzzK389z4OfXOGqHNMw7wx8NK+lQGL8=;
        b=xoJ6v2z+UA82t3uD6oA1jhHUI/YKghPDI+3sxri0v4AvP0YvrfaThFpvDh+iH8eqyV
         xFamXNCWpYc4l7nLBwOqrQkAN28EpaFKp1BCVOOmRvF2m7MOZmvfB1XQvJbBAQhCAO5A
         ZL0fPkBYEdybJI6POk37WfBwwEONVD/weZzvyozUwHjdnsHwIVqTPw+Fgp2q8yr1rKkx
         gBG1LrFW6ZBYmyXJsJXKfk21Hoe8WneNqtW6dBRrcjKjLnaewB0WQyp/E1PJNE0EoR/F
         UEnmAuhe1+Gmjx9InRxzDXUHPCMp5K4WIVPojKRg+7TnXF7p58uzKYasREkzvn0z005k
         ut1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gaeer9jF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm12-20020a05622a250c00b003b634217ff8si416560qtb.774.2023.01.15.18.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jan 2023 18:48:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gaeer9jF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHFXS-00072x-Kl; Sun, 15 Jan 2023 21:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFXR-00072B-Bc; Sun, 15 Jan 2023 21:47:57 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFXQ-0000M5-1a; Sun, 15 Jan 2023 21:47:57 -0500
Received: by mail-vs1-xe35.google.com with SMTP id i185so27782362vsc.6;
 Sun, 15 Jan 2023 18:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbgOcRBfetYVNzzK389z4OfXOGqHNMw7wx8NK+lQGL8=;
 b=Gaeer9jF9aNf5hrYMBFhUMK2+mz/in9Mtp9Q1ajkRmiCJtsVoeKiRsg37/LG9Fm2rx
 NjuMXWiImRRmGsa0VA/G2DNzCZ+oEg9bO9W7YkYwc62zadGzzf2eGx0CN0V34lZG09k3
 zlEbwhYI9XtG1oEMQt5XlCXEZ3pMCyEd4DZd1kyMvzwPMoeCCvcAIjxzvi3GVGlBPWAM
 5JA9qun0h/8thpGbfs2UzEwSpgE8LLFnWndSC0aVv0Y2P4EynNeDEfCaU34EYs0dsHnw
 g663Sf0PsJCKEqgr7ojSzoWzTZ6qtu5j9pJ+1l3/iLiz0piYRXSKYjIrrDjkHpmMIfnx
 +pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbgOcRBfetYVNzzK389z4OfXOGqHNMw7wx8NK+lQGL8=;
 b=T+j+0pJDDRbfmjan9SAhc1bW5mq6RlXGx44RrSL49NY8xhqcyQ+TjGJ+Q1U3LXWqxR
 kJn6dAX9YC+JWlQ4DQxxVzONMIOWvXHsLVJCBqv3E5Fj/Pnuq7qQ9y96mavmH7MiX5Jy
 uDrlasxS6UPFPoLJuwUS5+5eUwFcjDtwy2Ih847tp1/Q/7FFGQZSttesgoNCxqewcXsX
 Tz6Yr0WyWQVbO1kTm18m+sndrbCYl4yVS1mM8cXQZLMAd3roPGc6LHY6ix+counLImm+
 0f+VyKj5cQRB7X7LUAZAto6HmYtxDbWD0FEoskXqGJk5xnF+clz0hw+hMfSfjFayqFaQ
 ryTw==
X-Gm-Message-State: AFqh2krG9Ux8J+jrB2N3Rozk3J+C6vv4IIXHNG1CsgSXCPswAp7pIO7j
 EGcAyVQBrzsoJC6jljwgeSLdV++j2hI6R8P8qpvMg80jaUiqkw==
X-Received: by 2002:a05:6102:c4a:b0:3ce:f2da:96a with SMTP id
 y10-20020a0561020c4a00b003cef2da096amr4687008vss.64.1673837273944; Sun, 15
 Jan 2023 18:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20230113200138.52869-1-philmd@linaro.org>
 <20230113200138.52869-4-philmd@linaro.org>
In-Reply-To: <20230113200138.52869-4-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 12:47:27 +1000
Message-ID: <CAKmqyKN6kJKzW3yGSSqQnH4nPwdEJ_XwYiTp+qzvaj=+zuLHmA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/or-irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9DbWplJjlJjd

On Sat, Jan 14, 2023 at 6:03 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Missed during automatic conversion from commit 8063396bf3
> ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/or-irq.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
> index f2f0a27381..131abc2e0c 100644
> --- a/include/hw/or-irq.h
> +++ b/include/hw/or-irq.h
> @@ -37,8 +37,7 @@
>
>  typedef struct OrIRQState qemu_or_irq;
>
> -DECLARE_INSTANCE_CHECKER(qemu_or_irq, OR_IRQ,
> -                         TYPE_OR_IRQ)
> +OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
>
>  struct OrIRQState {
>      DeviceState parent_obj;
> --
> 2.38.1
>
>
