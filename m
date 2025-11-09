Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A1CCFA1A
	for <qemu-arm@archiver.kernel.org>; Sun,  9 Nov 2025 16:54:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vI8gU-00082P-Md; Sun, 09 Nov 2025 11:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vI8gQ-00080K-DI
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 11:54:31 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vI8gO-0000ju-5H
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 11:54:29 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7866aca9e25so17674017b3.3
 for <qemu-arm@nongnu.org>; Sun, 09 Nov 2025 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762707266; x=1763312066; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7wTOeQOlsftaWq3Z04E6gOlfmQz3sNdvsoiQrNxHbY=;
 b=L+cIkU4sGrPZNUuQpbb8h4E6GJZabvPnBgQX2SwRLr26n85mgLVf8EG9yAnMXIGG6+
 NNBuvyY/NkNcBzjEWbjzIaweWL/lPT3pbu7LXt1tYlzR0WBkwGnzMNQ9qfUihz06QMoj
 sMPmtPZobJ8weGinZAWbqVLYkD7BdCY4t8ncICHQalGU6kImXnW2S6RHleVK3YCEiHxC
 Mg1NNF8Jr7fhsCDfGh+9btdOLCOz4GQNHxgHH9DLmjSMkUoZNE0jBYADtiwEJcj4FCfZ
 fhQ4PBM0zu63aab77LvQ1W5hQTQObFP8jKnzmhLl+jBkHKKVc2yDhBjfbt04abv2KvHX
 O5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762707266; x=1763312066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7wTOeQOlsftaWq3Z04E6gOlfmQz3sNdvsoiQrNxHbY=;
 b=MUDzuIbX4cCHcerAt1ctj2AZ20kl80fxqfEHDGw4qx0xX9wWsh6Xtrj92he+dk6y9V
 d0DX/sOs1RkkXye/qp+bd7z74ej3O0bJloLkuPXjfmCNSH81h15LqDiLfMnyU7HnpGyc
 Ev/TbKAcCB0gma4SyynX/zxSo9XnjWu1VTr5DHfI/W4vQP2Izo/awysOK3m2XFW0e+AP
 ZJCTQq9eKAiExVjZpzD7pz/uH9QNCPH4LUuo6sjV8NXE2u/qJEOzzXf9whwUjihFPRoE
 n6+rRXTB4ZeBUWGRFGVxoU87KU5NDBi7l1HAnvO8HnqoYikoVIwu61u+oEIxoFHzlXPY
 cDTg==
X-Gm-Message-State: AOJu0Yz/FOFJgQhqyGGKG+KFU1yBsxon5NgE2+XzPPawuQBYtc9XMf/C
 N8E0PgW4VsooX8U0oe2EZ5W9wgIXouDyZWaunHOFdA0RQrmhiV3QJmtl4Si8k//+11smCCQ7HNJ
 O8LbfTcCYPXHqFdE8vS6plhmUoC4TlUmqEoIopTHHAg==
X-Gm-Gg: ASbGncucvNdBXnrTE8+UrscGEJ0qu8eSTI1MR65AcDgDxdzhjmaO0W/6WRqmQPmtsZE
 ASCOGoDMX3hw1mzV7n75IXHPQyZCfnpMAguwKZqjOpHQWPlM43nwk2PmXQXUTcth1pgR+FGePL/
 2Hl3V+tf5OE4ARJoqBTiJz7xudk2tfvyXg/+qNOj595k4j+g8WhLypJZ2g/hgCM4LM6SKwIjbU8
 Aod1CNmoaB41XGOGBr3u9OkIdlzZ0DV+KjX29se7scRJtNPZoJJJqIyu3Ylng==
X-Google-Smtp-Source: AGHT+IHw/zL+Zv/2Eiz87PlKkKQ1fQlcUbil5a68zn6R/xjJICpKLgBiISMn5yDntxRNl0jJOTBWVUqQLN1TLHnWZcc=
X-Received: by 2002:a05:690c:c36b:b0:783:cfa0:3b69 with SMTP id
 00721157ae682-787d5354711mr49682287b3.4.1762707266026; Sun, 09 Nov 2025
 08:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20251106145209.1083998-1-peter.maydell@linaro.org>
 <20251106145209.1083998-3-peter.maydell@linaro.org>
 <b708afc7-f894-4035-b6e4-62c6be99895f@linaro.org>
In-Reply-To: <b708afc7-f894-4035-b6e4-62c6be99895f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 9 Nov 2025 16:54:14 +0000
X-Gm-Features: AWmQ_bmbzBv-vKOFIUr9NHLONdu4YvK5C3YnZs6qYWHG7XT_LXhHK9lTe05mnfo
Message-ID: <CAFEAcA90p1YTOU1Wsg2LCg7QaR3hLpH6pxgsuHSqz6V0w+g9yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/display/xlnx_dp: Don't abort for unsupported
 graphics formats
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Sun, 9 Nov 2025 at 13:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi,
>
> On 6/11/25 15:52, Peter Maydell wrote:
> > If the guest writes an invalid or unsupported value to the
> > AV_BUF_FORMAT register, currently we abort().  Instead, log this as
> > either a guest error or an unimplemented error and continue.
> >
> > The existing code treats DP_NL_VID_CB_Y0_CR_Y1 as x8b8g8r8
> > via a "case 0" that does not use the enum constant name for some
> > reason; we leave that alone beyond adding a comment about the
> > weird code.
> >
> > Documentation of this register seems to be at:
> > https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/AV_BUF_FO=
RMAT-DISPLAY_PORT-Register
> >
> > Cc: qemu-stable@nongnu.org
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1415
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/display/xlnx_dp.c | 53 +++++++++++++++++++++++++++++++++++++++----=
-
> >   1 file changed, 48 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> > index c2bf692e7b1..d8119a56292 100644
> > --- a/hw/display/xlnx_dp.c
> > +++ b/hw/display/xlnx_dp.c
> > @@ -665,14 +665,28 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPStat=
e *s)
> >       case DP_GRAPHIC_BGR888:
> >           s->g_plane.format =3D PIXMAN_b8g8r8;
> >           break;
> > +    case DP_GRAPHIC_RGBA5551:
> > +    case DP_GRAPHIC_RGBA4444:
> > +    case DP_GRAPHIC_8BPP:
> > +    case DP_GRAPHIC_4BPP:
> > +    case DP_GRAPHIC_2BPP:
> > +    case DP_GRAPHIC_1BPP:
> > +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented graphic format %u"=
,
> > +                      __func__,
> > +                      s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_=
MASK);
> > +        s->g_plane.format =3D PIXMAN_r8g8b8a8;
> > +        break;
> >       default:
> > -        error_report("%s: unsupported graphic format %u", __func__,
> > -                     s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_M=
ASK);
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid graphic format %u"=
,
> > +                      __func__,
> > +                      s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_=
MASK);
> > +        s->g_plane.format =3D PIXMAN_r8g8b8a8;
> >           abort();
>
> Don't we want to remove this abort() call?

Whoops, yes. (The test case in the bug goes through the LOG_UNIMP
arm rather than the LOG_GUEST_ERROR one, so I didn't spot this.)

-- PMM

