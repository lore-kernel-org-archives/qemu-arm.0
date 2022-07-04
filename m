Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3266309lft;
        Mon, 4 Jul 2022 07:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tufqC4DSr6qWilFkAGmNIjQ8dfUxfbuao54tzwTuI+Odd+WGxU1uBReWsU8eHMdHpG9Tg+
X-Received: by 2002:a81:7053:0:b0:31c:8b04:9483 with SMTP id l80-20020a817053000000b0031c8b049483mr8894245ywc.122.1656944674814;
        Mon, 04 Jul 2022 07:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656944674; cv=none;
        d=google.com; s=arc-20160816;
        b=dXf3gRq9lYovtcX6EUvmBa97i6Gb8PoM+G6+QwCU7vG1eON48fxV9ln+L8SDAyiOCn
         oojSrObFcnJnTrcTS2yr2t31tU6wRtEjglAq9dTKnmG4HWpPxA+IvXAvw6UTJfon5r/J
         X8nFKk/qlUjdGoOVXziT3+1KpQ95+5QhFk2n2L9UHQ2iVZpjkR+fRisLow78VMUUnc32
         mcR7tI2uzYMLDM5lnjj4KmaI7IrMcF4G6pOgTl/R0KQcUCzEsy1uJUgznpSxspuXY3Ze
         sk+uCrlu6PCw30j+EVoeeLspDl6n4CEw3F0xdxclR3A7xslu144wFa9gTUQ+k34hmH6Z
         QXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p6nr2MC1rzWsrMEqs/jeibqhu6OQ4Laugsy4/ZesQ68=;
        b=LWTC33ofT2+12Du/aZDFEVc60D532aRNJViryDzqBNdMmk3OD8dzxlCU+KE2PK+KnI
         PLQoxZ1a4d6fH1L9fqU4fYM/wflZz/GiKi5/LBPB+uq54UwPjLPamTOj5kUhBogDRfJZ
         xd/9yEQ5dTxtGGp/HfM8CkfJeUVG1MlElT60fim14BeO2FC63SCuWC0h2vvBvuqBh1wT
         VIAsOJ523u/d4CEWCtz1q2j2+zHWEhLf8YcuJ9cBfbW4vtP+MblSHmYgd6o1nymQG/bu
         hZjhARLS98IdSn1ZwCgBOuV6+KbNMQ7IfjPfMQCAAYPQV8sVTQ5P7/yJ00yQEzHwJNMw
         wNaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bz9JQpkA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206-20020a2502d7000000b0066e6966a143si46017ybc.582.2022.07.04.07.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bz9JQpkA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8N05-0004jE-6J
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MI7-0008Mr-GV
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:39:07 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MI4-00061w-Pv
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:39:07 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31cac89d8d6so12859427b3.2
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6nr2MC1rzWsrMEqs/jeibqhu6OQ4Laugsy4/ZesQ68=;
 b=Bz9JQpkAQ5Myzsn3g6/qlntD7leW6Z9ZkeGxjE9QvDKnUq+XkCp8uLaxHo6hKxtP85
 KJgix4dUtdaiW6kPx3vbsoJyGvyhthTUnSwTdCljGNzT9CmhuZ/gSzugPDPBW5cFVUWp
 giJVOTyHr8BbnSAIKpLy7fewIdwlblP69YFpns43zf0xSVg+KvOE8mDFesjDK3o/vAFg
 XlEbeoh6mtyAElYFtuQD6VIaJtM/3ZYrK9cd2OB58RQqUpNDC+ckiRVRDnbXnB1sXPqR
 jBzE4y2uoW8tdGPj3cvijIc73Hkhch3BYm+3XKlfROBdQPKI0bSMeNQG8jbWVN7Qy1dc
 7zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6nr2MC1rzWsrMEqs/jeibqhu6OQ4Laugsy4/ZesQ68=;
 b=7G1zVdYFYWQPMQvcsYqxJba7F5z/1x5UmO7lXwVy9QKGB1xv8Qv7uBhrxOBtkm5ecN
 3xxE7JjjM8A2tSY95fXXsNKZQvH+p/ixkRe1x3CnZFq+r3e4XWY3gVSctHQI+hPQkCv4
 zaFVGt/C5Vae4vcT6kzUEtba+D2ykMiZpm/elyXBpHATAU2rg9M0qppsViCX6YARDdMD
 k368wPNb+V6o18R8B+TiJ6L6swp28BZho148Y20kDb/CVys62e7grpswZLK+MBkwvPby
 QnlWCIl8g8g/b27WSOxKA3dkOBkShV920EbrrlrIuL96Gz6+8Knzu8Kd+R8Ybj4klM9G
 mbAw==
X-Gm-Message-State: AJIora8Ir0Cn/LdfwKErZ0pmjxKJoriRfWRqgsQ9a/sagXB6mBB2alEH
 DEklM46RFEyaMXjlZdI+IEFCBKk4UzR63pmNynW9qQ==
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr918158ywb.469.1656941943688; Mon, 04
 Jul 2022 06:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:38:52 +0100
Message-ID: <CAFEAcA-D6GhmGA=Det6PGvXC-sup7pKa3KoBsUHtBkK5e1K_Eg@mail.gmail.com>
Subject: Re: [PATCH 34/40] lasips2: update VMStateDescription for LASIPS2
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oe/76U3VXKWZ

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Since this series has already introduced a migration break for the HPPA B160L
> machine, we can use this opportunity to improve the VMStateDescription for
> the LASIPS2 device.
>
> Add the new int_status field to the VMStateDescription and remodel the ports
> as separate VMSTATE_STRUCT instances.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index e602e3c986..ea7c07a2ba 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -35,15 +35,28 @@
>  #include "qapi/error.h"
>
>
> +static const VMStateDescription vmstate_lasips2_port = {
> +    .name = "lasips2-port",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(control, LASIPS2Port),
> +        VMSTATE_UINT8(buf, LASIPS2Port),
> +        VMSTATE_BOOL(loopback_rbne, LASIPS2Port),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_lasips2 = {
>      .name = "lasips2",
> -    .version_id = 0,
> -    .minimum_version_id = 0,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
> -        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
> -        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
> -        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
> +        VMSTATE_UINT8(int_status, LASIPS2State),
> +        VMSTATE_STRUCT(kbd_port.parent_obj, LASIPS2State, 1,
> +                       vmstate_lasips2_port, LASIPS2Port),
> +        VMSTATE_STRUCT(mouse_port.parent_obj, LASIPS2State, 1,
> +                       vmstate_lasips2_port, LASIPS2Port),
>          VMSTATE_END_OF_LIST()
>      }
>  };

The set of things we were migrating and the set of
things we now migrate don't seem to line up ?

-- PMM
