Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1078797ejc;
        Sun, 15 Jan 2023 18:47:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuryNPq/qQ9H6ef8G2hDmNEN2ioe24/Jm27FWYEAk4B7tc/EkmTPt/nsncbLDGrg4GDNN5Q
X-Received: by 2002:ad4:52e1:0:b0:531:9d43:d8ef with SMTP id p1-20020ad452e1000000b005319d43d8efmr87875210qvu.3.1673837262099;
        Sun, 15 Jan 2023 18:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673837262; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3OT3H3pPy0uJLTVIUGcVgNYsdoYNq/SKzjc9AQyTF+uvA1Y2dUy/CTiF51NcfUHCH
         4AwDNwWYemGMto0+MtXzWwbRG5P0Vv+i03L6ZVpmXXuO6nCbBM0KEzrd3E6JTeoDKUBp
         clAizSGzwXpTwuW0k4I5tigsjjxcfJ2ZXuaBUeXk/npt4cdlEeXDazCahp3BrJRJknPu
         EtceVhYjYk9ulPVpSpcDCbTIJc0ada8D+eAqd5yUjO8ZnibRD+JWgctZ2VKX3vo4sZmh
         CnAgpvrnsFX4dZswIAvtFoik+LKoTTsyvfC37yx3bnsJjM8aHmh3C9KI8YNJfumrkylz
         P/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MJaqPh4F+te3vef378hkTo0gx0Nmo4nEyMDx8Mnoubw=;
        b=fPTeTkmeDlBGIp6sQ0Ynmtd2ckLCzAiUFZ0EFry930KhyPQlyufjO8f1hfHHEmxG6M
         Rxs4LzjoXJpe3V3C6wLj5lYPDj/lZUg6qo7nJvePfWiih/uqiL4OpxgvehmznXHFT27Y
         2zaA7Lxg6bFvODf9VbxHDiHiH0JOAkoXlO1nBFcKfdqfpGpu1/JjOAmqC89RwKWRFAQq
         qGvp3/eHo+HiWi4+ocJ7XSikcSuViZekahG+sxziTnbDcOsJJtp8rMnMYcfJO2mnr/iB
         c1WFNzdKX0SY776rWnebNcA6SpnUV58R6PpRwTMUf3CgB1uwuSijtOI+nQQEEgIXVuPX
         VCeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QYLasaUu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020ad45bcf000000b005341f75e43bsi1458002qvt.353.2023.01.15.18.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jan 2023 18:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QYLasaUu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHFWj-0005hT-Kr; Sun, 15 Jan 2023 21:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFWi-0005gt-JG; Sun, 15 Jan 2023 21:47:12 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFWh-0000Ij-4N; Sun, 15 Jan 2023 21:47:12 -0500
Received: by mail-ua1-x931.google.com with SMTP id j1so6632040uan.1;
 Sun, 15 Jan 2023 18:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJaqPh4F+te3vef378hkTo0gx0Nmo4nEyMDx8Mnoubw=;
 b=QYLasaUu0RQlzY9eTHgsWiSy7TeDmMyb97ntnkAO8ogDUxsFr1koAPbQ9molp1EL2M
 Dzy5g/5yGYVUHW2PxpMqwryYsvIlqzlv34BnlvLUE2I+6ak+yWMoLIXL51NBGl5rclj4
 VrNymWqitZMdIvghEejvOsmB9z3NHxcBP5I74hZn8XPmFSWVyXCI+1bClAh7EeRiN2+M
 JCaYWDxhXl/1efTxm6doUAAfPz9ezVTVxu2snK6CbnNBQpX8l8rAomz6pjOg4X+dlUrG
 OYs/AQKdxx1KdB5Ya7UDglba6VVg0TVNO2Js1yXBahrQ1dU9G4KjA/HLMi5FVHz5ACok
 Eftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJaqPh4F+te3vef378hkTo0gx0Nmo4nEyMDx8Mnoubw=;
 b=pKTK6kSZ+kS3bPvbFv/G29pBr6AQYCGhVUmCW+AfmgM3BsJy00/ihCLypBc+DfabWB
 RSIhmaXzQbYBmtVtheQrz89NOgJWCjAeQKeQKDEzCLM78qyZxHypQlyLMyJW/c/3Bl6k
 z8wQOqKepIL8KTvLY9Q330kjv/OCifgVQr+VLh2wYURTHZDv11b53EWO3DJWgN75ulx9
 7ZkRIQ6iY8fSh2qdyU1mcIP6xO4u6PEZ2RNoOZwkz0PKEtmphBi03KLghd57OovQkMcl
 7gJfiVTXpw+kuwJWivYuQAoJES2v9yc+I0oKwdMCvQBFb6WF7oWN1vtyZid3o5n6z+An
 WCGg==
X-Gm-Message-State: AFqh2koboofAs6DMwyDoVnhfhRJWQ45NbCKggY4/RZ0cls6FKeUG/S7u
 CwVI9pTd7vX266P1P5TpUbkTKZGqt5mr+OobOdM=
X-Received: by 2002:ab0:6182:0:b0:419:2865:3ae7 with SMTP id
 h2-20020ab06182000000b0041928653ae7mr10187954uan.70.1673837229382; Sun, 15
 Jan 2023 18:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20230113200138.52869-1-philmd@linaro.org>
 <20230113200138.52869-3-philmd@linaro.org>
In-Reply-To: <20230113200138.52869-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 12:46:43 +1000
Message-ID: <CAKmqyKOA2pH0UQLmUK4X8iC5HGbhMHitoV+iibcTDWGTpQ5P-w@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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
X-TUID: MrGPs+RMWERt

On Sat, Jan 14, 2023 at 6:03 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> QOM *DECLARE* macros expect a typedef as first argument,
> not a structure. Replace 'struct IRQState' by 'IRQState'
> to avoid when modifying the macros:
>
>   ../hw/core/irq.c:29:1: error: declaration of anonymous struct must be a=
 definition
>   DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
>   ^
>
> Use OBJECT_DECLARE_SIMPLE_TYPE instead of DECLARE_INSTANCE_CHECKER.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/irq.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/core/irq.c b/hw/core/irq.c
> index 3623f711fe..3f14e2dda7 100644
> --- a/hw/core/irq.c
> +++ b/hw/core/irq.c
> @@ -26,8 +26,7 @@
>  #include "hw/irq.h"
>  #include "qom/object.h"
>
> -DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
> -                         TYPE_IRQ)
> +OBJECT_DECLARE_SIMPLE_TYPE(IRQState, IRQ)
>
>  struct IRQState {
>      Object parent_obj;
> @@ -68,7 +67,7 @@ qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, =
void *opaque, int n)
>
>  qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n=
)
>  {
> -    struct IRQState *irq;
> +    IRQState *irq;
>
>      irq =3D IRQ(object_new(TYPE_IRQ));
>      irq->handler =3D handler;
> @@ -94,7 +93,7 @@ void qemu_free_irq(qemu_irq irq)
>
>  static void qemu_notirq(void *opaque, int line, int level)
>  {
> -    struct IRQState *irq =3D opaque;
> +    IRQState *irq =3D opaque;
>
>      irq->handler(irq->opaque, irq->n, !level);
>  }
> @@ -120,7 +119,7 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_ir=
q_handler handler, int n)
>  static const TypeInfo irq_type_info =3D {
>     .name =3D TYPE_IRQ,
>     .parent =3D TYPE_OBJECT,
> -   .instance_size =3D sizeof(struct IRQState),
> +   .instance_size =3D sizeof(IRQState),
>  };
>
>  static void irq_register_types(void)
> --
> 2.38.1
>
>
