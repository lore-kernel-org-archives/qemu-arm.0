Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ADBCAC581
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 17:19:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvfW1-0006eP-Gu; Mon, 08 Sep 2025 13:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1uvfVH-0006Bl-Hb
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 13:18:13 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1uvfV8-0005YD-0Y
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 13:18:06 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-560885b40e2so12794e87.0
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757351870; x=1757956670; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7q0yPHx8a6HFJU4nt+BsB9LXwZLZMRDFnEKXGOuW82Y=;
 b=O9lTT+28vsjhfPYON8k/NLMbVANnGGwXWGWZmcb7eD8/fvTOzpDPt7JMuYcvXXCJNV
 g+i9E2N3eb1zZUYimKhKHPJyDG2G9Jg9//bvhlbmG96uKdjU46QDgpr6rWyQCy7sLL15
 PRHUVZ9hIkFhKMo1XGCPpf6arutAtbsY5o4sCjkbAdVCTQkyws5vGmpuimP5N+t3kG4w
 eUjYwrcKC7l0Clw/5hNE31PA6etIwKFuOCADryuLBJpXmOemI1OxYj7GJzPCjUwXYQvT
 6C1UYaOOkIX4403abzGqltPcmaLy9L5Peund8P+hCo/PaCOA1xLOa/z+WkYq2aXtqxR2
 jBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757351870; x=1757956670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7q0yPHx8a6HFJU4nt+BsB9LXwZLZMRDFnEKXGOuW82Y=;
 b=cvVwCF+ESmRzOTRQe8rNAhIR0HZ5vvrLBHB7Hdb7jR0y1jeHipxQR+pvXaIPqMdZb9
 WTT+psoKcwWvHl0D0qyCv9SD4MKZZgYUXzgMQb0IVIORFny1yZu+plyQUEqETzzQVF2Y
 HrSecjhQw7Hq+5iKLaB3ryQPo700yOCNuPdR1h2T18BMT2GjI2JZ9+QD5r+eyEdjefM2
 NXxQI6BV8NmzdgJ7m+O9R5KD/GieF5/1SbQ7zYbcwAlTD+gyR97RPX2p0eJZv6mhcB0V
 CgUFG1rMIgHu7VrMJ/3q6ZuWedL5dFHjyMsszLJYNokCWQy0cem/DMzfASJASupCGX3T
 E3JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQk6IWxyu91uSftLzk4nYtWleVBKNYI3I5fe3nXix5UrBT7tCT0IeJ4I5G0wa7LVwDe6yLAMjMmA==@nongnu.org
X-Gm-Message-State: AOJu0YwCKubFFkOVduUIp15Wgd60sWjixeUeJvC5EPEcQuQ7LKdc5eTD
 QWu95tgVOLiiE+f4qk5r7ERTTpx/9DfdBp2PIZQfh4s8aWmiU3BQw/bwlFM6Aj04PafOZqI/LjM
 ErGFWTQiu/ZZi/0S9edOcHYPH6CxR5SYaCuD8ULQB
X-Gm-Gg: ASbGnctY/aX8vgShmdlKVR9sHJ//sFZwbLSck3g05ramKMBDSnmPgjyo4BVd8McR2uk
 UoX0iGdlJN8Fz91hkxB6gR9vg4p3tQIQ1jGXU1HW4b0kI8yufQ6emWe7SXaT6xILZ6Y98t5r3ct
 i9HzZdeoh8qlqx33v5PLLWmlcLNZaf04LFYLt/0xr+8Kau2eU9F3fGbPbOKM6BpqJBH1V+FKFLm
 wmPk3AdholonoJ3EYkNXWuSZRNHC2u2EMp5i38GI04o3JV7bgVSXZw=
X-Google-Smtp-Source: AGHT+IGa1707ngqK8lE0HOddagXrOexADGlagDzoDWyTnxeGOw0lkb3mCFN2ZjuyNJCstqJQCUJGuAxr1yU6bK6KH+M=
X-Received: by 2002:a05:6512:2394:b0:542:6b39:1d57 with SMTP id
 2adb3069b0e04-56271a9f22emr393921e87.3.1757351869665; Mon, 08 Sep 2025
 10:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250828184939.3140841-1-bhillier@google.com>
 <484d2580-77fc-4fdf-8f02-ef25df08bb7c@linaro.org>
In-Reply-To: <484d2580-77fc-4fdf-8f02-ef25df08bb7c@linaro.org>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 8 Sep 2025 10:17:12 -0700
X-Gm-Features: Ac12FXw3NIYUuW1rXVqO3k36XnEvFYykUNHccJNNZR9NAmx-0sn8CfeyoGXC6XI
Message-ID: <CAMvPwGpjs1HkOCJU3AEyFj+sGepU8q7xynJKT6FryDe5-DnpsA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: add stub for ADM1266 blackbox
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Ben Hillier <bhillier@google.com>, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=titusr@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, 29 Aug 2025 at 09:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Titus,
>
> On 28/8/25 20:49, Ben Hillier wrote:
> > From: Titus Rwantare <titusr@google.com>
> >
> > This patch fixes a bug that causes a kernel panic when calling ADM1266_=
BLACKBOX_INFORMATION.
>
> But you also implement BLACKBOX_CONFIG / READ_BLACKBOX...
>
> > Log Message:
> >
> > adm1266 5-0042: Could not read blackbox!
> > Kernel panic - not syncing: stack-protector: Kernel stack is corrupted =
in: adm1266_nvmem_read+0x168/0x170
> >
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/sensor/adm1266.c | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
> > index 9017ce6116..cd11526c2b 100644
> > --- a/hw/sensor/adm1266.c
> > +++ b/hw/sensor/adm1266.c
> > @@ -75,6 +75,7 @@ typedef struct ADM1266State {
> >   static const uint8_t adm1266_ic_device_id[] =3D {0x03, 0x41, 0x12, 0x=
66};
> >   static const uint8_t adm1266_ic_device_rev[] =3D {0x08, 0x01, 0x08, 0=
x07, 0x0,
> >                                                   0x0, 0x07, 0x41, 0x30=
};
> > +static const uint8_t adm1266_blackbox_info[] =3D {0x04, 0x00, 0x00, 0x=
00, 0x00};
>    {
>      0x04,       /* length */
>      0x00, 0x00, /* latest ID */
>      0x00,       /* latest record logic index */
>      0x00        /* latest record count */
>    };
>
> >
> >   static void adm1266_exit_reset(Object *obj, ResetType type)
> >   {
> > @@ -125,6 +126,17 @@ static uint8_t adm1266_read_byte(PMBusDevice *pmde=
v)
> >           pmbus_send(pmdev, adm1266_ic_device_rev, sizeof(adm1266_ic_de=
vice_rev));
> >           break;
> >
> > +    case ADM1266_BLACKBOX_CONFIG:
> > +        return 0;
>
> I'd was expecting pmbus_send(pmdev, "\0\0", 2) for CYCLIC_RECORD_DISABLED=
.
>
> > +
> > +    case ADM1266_READ_BLACKBOX:
>
> Here I'm confused, as len+data is 65bytes. Is the guest
> reading a stream of 0xff?
>
> > +        return 0;
> > +
> > +    case ADM1266_BLACKBOX_INFORMATION:
> > +        pmbus_send(pmdev, adm1266_blackbox_info,
> > +                   sizeof(adm1266_blackbox_info));
> > +        break;
>
> OK.
>
> >       default:
> >           qemu_log_mask(LOG_UNIMP,
> >                         "%s: reading from unimplemented register: 0x%02=
x\n",
> > @@ -154,6 +166,9 @@ static int adm1266_write_data(PMBusDevice *pmdev, c=
onst uint8_t *buf,
> >           pmbus_receive_block(pmdev, (uint8_t *)s->mfr_rev, sizeof(s->m=
fr_rev));
> >           break;
> >
> > +    case ADM1266_BLACKBOX_CONFIG:
> Do we want to check, if lduw_p(buf) !=3D 0 -> log(UNIMP)?
>
> > +    case ADM1266_READ_BLACKBOX:
>
> Do we want to check, if (buf[0] !=3D 1) -> log(GUEST_ERROR),
> and log(UNIMP) regardless?
>
> > +    case ADM1266_BLACKBOX_INFORMATION:
>
>             log(GUEST_ERROR);
>
> >       case ADM1266_SET_RTC:   /* do nothing */
> >           break;
> >
> Regards,
>
> Phil.

Thanks for the feedback, I wound up implementing more of the blackbox
and implementing a test for it.
-Titus

