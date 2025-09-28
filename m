Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C41BCAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun, 28 Sep 2025 23:37:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v30ww-0003PL-TY; Sun, 28 Sep 2025 19:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v30wt-0003M6-5R
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 19:36:59 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v30wf-0006r8-4L
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 19:36:54 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so214492566b.0
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 16:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759102598; x=1759707398; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIDYxo2FOigbwhuw9xpTc9C3BNw4sDCTeBxli+pKHU4=;
 b=P+sYes1jOrx/uq+mEjnt+IqpcRdmWcKl03a9BcKwDw2PpcfJrEJGOqzUQYnbO9+yZp
 qMF+k8982X4dOMR9on9PSZNJhetz4BMrB83+pjj/FQLoORPDiJJmzaHyj0N6DfECqqcn
 r8wJ3rvCX0mbvXdKoHrkjzbXd3gHi3xmfRmh+Vl5fZBsW61W6VeBerT+t4p4HvDzBrs1
 LLhLX5kcCn7gotLM5ffTNc5EAp6woXUZljT09EnHy61oNglgoKMRQnCod0Qr2wJqzOCb
 mlibmQkFhsYKFknW98mJx78hlqkMhy3kFGHflTAmrMI77y5VvgkQf0p5NFFMS0Zv9XhB
 ulKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759102598; x=1759707398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIDYxo2FOigbwhuw9xpTc9C3BNw4sDCTeBxli+pKHU4=;
 b=Tt+GwcIBPf98vYxgOVekdGtKR+3q5+kvBFfc96KVwZ8cWwNhLgP/NobOqZyAzZ1n+x
 etpa1IcxKkToimTKQUN0nZNFsQdsJwLk5xPcSEvxBrWebkVTyEi7JF+4RqRCrBL8mMdm
 RojFLfe2WIF3CtOZmULtD+Iu9sj1TtGWmFatuRxhoRs5/APCsruaEJmoiL9bJLgL0ASx
 hSgqqhcBPdF3//iIvqkNUxK7DKu91Ycz0VOLjUdYyiv+SDPOKXt5BEMenjIyJRLTuJ6C
 v4ZTzI2gEQPiPZx4PbJeqUTMFE8Q6yTiVYrl9PZIuawUUwQFJTSWSMb52fI2DIFrt+JB
 EmPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6a3NpYy8ndYThTZiCjXjLU/mAhw5NU84ZAo4ZtjZX8V39FgaMnAvbfBbInAtU/HrkJH5JNHHO0w==@nongnu.org
X-Gm-Message-State: AOJu0Yzp6X/0O1aFXLB95dpTubFvKZBDeE+JGpP0bseZ7gD5aoWXUrKe
 wT5SsAJ8AeabcsD5T/ye6S9tAdsCHv8ZFvm71/rLxExOYeFNt2BOoSFp74ZRZVUo0uwq3IB00Kw
 GJT5GnwkurF4hKACO0sO8K+JCP2un5kw=
X-Gm-Gg: ASbGncspN3iGt5Uu+Oh5ic2GY9umDPo/06nkUuLRztcjCydAI0PXsrkq62SOrfkV3RY
 HdO+APlQyrt7WvFyH3EtOrEuKsc7KCcVI/rqDC+Zmc2v1acEd5CIS+ZrQquLofewBPUkLlVDF9u
 fnnp3UnVPXu9PC7gh/59MY9l3EK/Nk6kvcmoX5YQGRA5PawcpazyGvqg4YVQczh4GzpLwYDAvMu
 CQNFf39DYufYTjWZDkd62l+OJTUB2TxfAvBL7WkXSinZJSm
X-Google-Smtp-Source: AGHT+IGS6xjUy9NrIjjjuIOlng0TP+PjJKRa9pRJowuYGTcv51U7pfHmAFefffNbfPBJbmPsQeZcLjA9WgTKRjgJWQw=
X-Received: by 2002:a17:907:6d29:b0:b40:52:19c2 with SMTP id
 a640c23a62f3a-b4000521c0fmr6326666b.20.1759102598299; Sun, 28 Sep 2025
 16:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250917114450.175892-1-luc.michel@amd.com>
 <20250917114450.175892-6-luc.michel@amd.com>
In-Reply-To: <20250917114450.175892-6-luc.michel@amd.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 09:36:12 +1000
X-Gm-Features: AS18NWDneHVg80SmJ-GzTzTwXjkOkvtiUAs27YVcERIJZaDU0qaQWhngnGP8_gI
Message-ID: <CAKmqyKO4iLMLtyiRY6cas2Wnn3GM+qcCYJ9SBv7f83RtHM9pSA@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/net/can/xlnx-versal-canfd: remove unused include
 directives
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Sep 17, 2025 at 9:49=E2=80=AFPM Luc Michel <luc.michel@amd.com> wro=
te:
>
> Drop unecessary include directives in xlnx-versal-canfd.c.

unnecessary

>
> Signed-off-by: Luc Michel <luc.michel@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/can/xlnx-versal-canfd.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canf=
d.c
> index 3eb111949f8..343348660b5 100644
> --- a/hw/net/can/xlnx-versal-canfd.c
> +++ b/hw/net/can/xlnx-versal-canfd.c
> @@ -33,16 +33,12 @@
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/register.h"
>  #include "qapi/error.h"
> -#include "qemu/bitops.h"
>  #include "qemu/log.h"
> -#include "qemu/cutils.h"
> -#include "qemu/event_notifier.h"
>  #include "hw/qdev-properties.h"
> -#include "qom/object_interfaces.h"
>  #include "migration/vmstate.h"
>  #include "hw/net/xlnx-versal-canfd.h"
>  #include "trace.h"
>
>  REG32(SOFTWARE_RESET_REGISTER, 0x0)
> --
> 2.50.1
>
>

