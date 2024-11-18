Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2511209njc;
        Mon, 18 Nov 2024 03:35:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpEcIQKTStEycooC9asCZL5hNDW/tkY83i+SKyCJ5Eznkn4PIgFO8vCpeLKtTvj9mHvC22ljaoXIwjDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHVv8ZzKzUc3uXi5bWaf11O6ooBLW+VRvJ4OErwux0mUXIacR0LmJSYWyILlyWV6Lfj/LYx
X-Received: by 2002:a05:690c:7246:b0:6ea:8cb3:32e6 with SMTP id 00721157ae682-6ee55cbbef0mr101018647b3.33.1731929733223;
        Mon, 18 Nov 2024 03:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731929733; cv=none;
        d=google.com; s=arc-20240605;
        b=Exp60haHU6LHT8Ufwihn1hEMYfbNOZk2BsvZO6aCl2djK7M0bE3MFWCvWbWs6u/5DC
         SyVTHAetSYFQWAyMngcrtly/f6aTt9bVKxACoKlOxKdmPHnEMObP37f2iXpRBNXe1xWa
         iqnKHqD4Fd/N2xEVEmAszJrOqy7SVXlX/GsUjEkV0EjiZpY59Q+4Gv6QK/3OnbWc3jir
         WsS82CwL7gxn+fhfjNtHYwVq6Tl0mejqmDqaoIV71nMsYZO3pn38dSaIY2rpuKpMhLu1
         2YZ7CL3u1GnRNZz7eTeCNimwaR8aAkIpiD84/tl+PBeLM5OSLqXvc11HgtzMk/yRuKzs
         LBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id;
        bh=EVdittT2XGstllSLQTZj/29l4tXGmYDlWNa7MjypwMM=;
        fh=MuVlT0612ll2I0z4FzZHnI/k8kSGkk0mKb/dwqbnNaM=;
        b=j83CopS3UL2W76u+75e5uqQpGSeaCF1Vyj4V9tgg+SfF1HraVF4VdBywImq7nxpn4H
         t3ZpaT/yiz7RpuCryE2JMAz5bdpHD8z2PbNzCEPWt1hRt8XEcgvbaUVC/yx2fAV/gE1M
         JYnNWHQrwo3SsahNzvrAANGJSVQ5QOdCPjssNg5/pHA0+9BMX4BOt6s/YboMG05wfMf2
         yUnKQnQ9NVB7creSUkbVd5kSCHImh2ElPxRZ5tstI7P5kQYI6QhCHYALnqrl5wVvyGwn
         XAQVFz4m63XGiA3NPf08CG4B5/oUlBnxDBFQvzAMrBG5ryq99nSH45wnKJynYRjaahnR
         y40w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aaf4663si101951981cf.476.2024.11.18.03.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 03:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD02I-0001Rb-JA; Mon, 18 Nov 2024 06:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1tD02G-0001Q8-OK
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 06:35:16 -0500
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1tD02E-0001Bm-SM
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 06:35:16 -0500
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1tD029-0001u8-4e; Mon, 18 Nov 2024 12:35:09 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1tD025-001O2W-30;
 Mon, 18 Nov 2024 12:35:05 +0100
Received: from localhost ([127.0.0.1])
 by ptz.office.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1tD025-006914-2b;
 Mon, 18 Nov 2024 12:35:05 +0100
Message-ID: <3bb20561d50f28cb34ec51d64981b9aaf7f95ccd.camel@pengutronix.de>
Subject: Re: [PATCH] docs: aspeed: Reorganize the "Boot options" section
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,  Steven Lee <steven_lee@aspeedtech.com>, Troy
 Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>
Date: Mon, 18 Nov 2024 12:35:05 +0100
In-Reply-To: <20241118090648.187720-1-clg@redhat.com>
References: <20241118090648.187720-1-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-arm@nongnu.org
Received-SPF: pass client-ip=2a0a:edc0:2:b01:1d::104;
 envelope-from=jlu@pengutronix.de; helo=metis.whiteo.stw.pengutronix.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fOV7CdYnflLT

On Mon, 2024-11-18 at 10:06 +0100, C=C3=A9dric Le Goater wrote:
> Add subsubsections for possible boot methods and introduce a new
> section on eMMC boot support for the ast2600-evb and rainier-emmc
> machines, boot partitions assumptions and limitations.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
> =C2=A0docs/system/arm/aspeed.rst | 99 +++++++++++++++++++++++++++++++++--=
---
> =C2=A01 file changed, 86 insertions(+), 13 deletions(-)

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>

