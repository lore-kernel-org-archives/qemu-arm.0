Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0053DC43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 12:15:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weXMh-0000fX-U6; Tue, 30 Jun 2026 08:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1weXMg-0000ex-6A
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 08:14:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1weXMe-00086H-PU
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 08:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782821695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsgQ05J3IM9pT8gzR6K93v0u7ubw3BDuulLMWVi8m7I=;
 b=SC03wRs4iUcm5g2g3eLGfJ3770/UIRrFkTAX2LVUz0t/FEgo6NiI3aBEd3qvp75rtJnlgR
 kZqW1qaEGqxhRlfs+tv98JNng/9bqLo2w7CdB80KpENAgJuQTTgyjr4ihdiq07A8yLmdVm
 iGO2PIn584Hn7mOm6Ns8g3ygk0KSDR0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-aBF-hJGxOoC8VO2T4an_4g-1; Tue, 30 Jun 2026 08:14:52 -0400
X-MC-Unique: aBF-hJGxOoC8VO2T4an_4g-1
X-Mimecast-MFC-AGG-ID: aBF-hJGxOoC8VO2T4an_4g_1782821691
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-493bc2ce23bso5448165e9.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 05:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782821691; x=1783426491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZsgQ05J3IM9pT8gzR6K93v0u7ubw3BDuulLMWVi8m7I=;
 b=fbjoJw9JioqP+nh8JiTgZhDer+BN5+5Lmeu1lW9+WwpWs74c3oz2lMr26FwkeF+rpw
 KT4vHqh2junA0BPprZmmPJp/LnFVsoRXUuR9IUUqEMslhB5+/Qqv07MGaUIyk08kQMat
 /b/aQJxezmq5llcOuPfpMcnd9ck3N+WmqdUZlGQ3aM7ljwCwlb+p24RS2yHt6hc/Fsg4
 K+DJBUNgPk1B6Ulv6m3c5HjGoNUAcxNJGWjXb+Z54PeSmi+sQivL4JT9HFBIWsO+abEY
 7Iko7TjQSBwLERtcGfNAkixkSGeLpPQ5m7Xy56cRBfrZrY8dICfIpE+Q+SioKlos0pah
 cQag==
X-Forwarded-Encrypted: i=1;
 AFNElJ9lwpWvpHiS+cYthgtlxABH+P4gf1XPMXsn/sIm9bdc5xNaNWAvBHe1RgagGEyxyKFetSUsekcf5g==@nongnu.org
X-Gm-Message-State: AOJu0YzFFtZk715evAc7JjbTdcQ3IKn0ufTB9ONURoQWLPT27nbD5PR3
 HGXF+wwJTYsjPafqGx/ynRPpJMYxFuiH7aQvcTezAA/g1kYEJUTRAxIdLYFnuvUAys/4B9lUagI
 yhGVUGgnGDva+7ubpeBIGz+ZrDrGz19RiS5OazQ/k4Hd+y3xc7H6SjA==
X-Gm-Gg: AfdE7cmeLSpkFeNplwderHCuHNbLCEbWf7FP7NYkoWNHgRHe5lUIWR8WcP8Y9nAdPgs
 63d33AHHF7ONP84Y1dGMHVuiU64aBaxfMhJplYF04/QiPZt3TjsOcjmL2DeX2kX29hXi3MwAlRg
 wiuHDmG/+WXgbAOGVJNMN9p/2mKzpX5gp5XGS5gbLem/Rja8F5kldQwAc8H2JEKJPZZpstx6oR5
 ez165XnJDB3TnyMtevWAjxAecMDvpHcyTrcoYGuOyZ2AX5QzkdmdFJJIRFpbodqHYTw/lytWzix
 /uR2DLdobBr+gkDQ790wIiziliYRWeihD04xoU4eVUKBHrxWRb0AstH0cbooYF3+eCHThTc=
X-Received: by 2002:a05:600c:5391:b0:492:3fc4:bd6b with SMTP id
 5b1f17b1804b1-493b827df5bmr52379025e9.7.1782821691353; 
 Tue, 30 Jun 2026 05:14:51 -0700 (PDT)
X-Received: by 2002:a05:600c:5391:b0:492:3fc4:bd6b with SMTP id
 5b1f17b1804b1-493b827df5bmr52378645e9.7.1782821690961; 
 Tue, 30 Jun 2026 05:14:50 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8cd88e8sm64261165e9.7.2026.06.30.05.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 05:14:50 -0700 (PDT)
Date: Tue, 30 Jun 2026 14:14:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mst@redhat.com, eauger@redhat.com,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 17/17] sbsa-gwdt: limit compare_value to INT64_MAX
Message-ID: <20260630141447.7cc20ba0@imammedo>
In-Reply-To: <CAFEAcA8DzTCP_z9mkHK7QHwMvk8bVb1z7mtN80MsYOZ49ZPx3w@mail.gmail.com>
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-18-imammedo@redhat.com>
 <CAFEAcA8DzTCP_z9mkHK7QHwMvk8bVb1z7mtN80MsYOZ49ZPx3w@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AOikrVgda6E0zVBSY2HBX-aPRLRF4owkmgqcD09dtsQ_1782821691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 29 Jun 2026 15:48:48 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 24 Jun 2026 at 11:29, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > QEMU timer subsystem uses int64_t, so WCV values with bit 63 set
> > overflow and cause the timer to fire immediately. The SBSA spec
> > defines WCV as an unsigned 64-bit compare value, so such values
> > are valid per spec and represent far-future deadlines (however
> > unpractical).
> >
> > Windows in GTDT mode writes WCV in two 32-bit halves while the
> > watchdog is running:
> >
> >  sbsa-gwdt_control_write [0x8]  <- 0xffffffff    # WOR (~4 sec)
> >  sbsa-gwdt_control_write [0x0]  <- 0x1           # WCS enable
> >  sbsa-gwdt_control_write [0x14] <- 0xffffffff    # WCVU (intermediate)
> >  sbsa-gwdt_control_write [0x10] <- 0xa906ca28    # WCVL
> >  sbsa-gwdt_control_write [0x14] <- 0xecb1        # WCVU (final)
> >
> > The intermediate WCVU write (0xffffffff) creates a WCV above
> > INT64_MAX, which overflows QEMU's signed timer and fires
> > immediately =E2=80=94 triggering WS0 =3D> WS1 =3D> reboot before the fi=
nal
> > WCVU write lands.
> >
> > Clamp WCV to INT64_MAX to avoid timer API overflow. =20
>=20
> This bug doesn't exist as described in the current upstream
> version of this device, because we don't use WCVU/WCVL in
> calculating the timeout (only WORU/WORL, which are forced to
> 48 bits wide on write). This suggests that either you have
> introduced it in this series, in which case it would be better
> to not do that, or else that it exists in a different form
> in current upstream, in which case it would be better to
> fix it first in the patchset, so it can be cc:stable for
> backports.

it's masked by missing timer reschedule on WCV update,
that preceding patch #16 fixes.
So yes it's ordering issue.

perhaps it's better split this patches into independed series,
given that the last 14-17 patches are fixing native GWDT
behavior for Windows usecase (which would still not work
due to too large timeouts)
and that it's not directly related to this series (linux uses
normal refresh approach with native gwdt mode), and WDAT mode
peddled by this series work fine with both Windows and Linux.

With the last 4 patches we still need to convince MS to fix large
timeouts on their side to make native gwdt work as expected.


>=20
> thanks
> -- PMM
>=20


