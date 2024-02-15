Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp564232ejb;
        Thu, 15 Feb 2024 05:28:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXubbvvQbVNt9beHn9XBY3EgRU845mKYklTFfHWW1JbtmHf1utRKBi34y8JpMH4HRo/7ShTPlzWXZ7sD2UWr/RoETu2F6sd
X-Google-Smtp-Source: AGHT+IG9P57fBiHM022jdYQsXXi0vAcf/I0zBaOVO2a0dRK40zVNBTfKWJ/a7Xbbrnias95KTSUj
X-Received: by 2002:ac8:59c7:0:b0:42d:c76e:ccfa with SMTP id f7-20020ac859c7000000b0042dc76eccfamr2501843qtf.24.1708003683392;
        Thu, 15 Feb 2024 05:28:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708003683; cv=none;
        d=google.com; s=arc-20160816;
        b=r2NHII1bcy0axtnlhifTS+wpndj8E1bTb5hegdZ5jieY0DwWETC2W4pBMT6Vtfak7O
         Ns68/HFarSTCzaMDRvWkVyZ2i3qEWx7YV1advGrJA2t9xZxTM9xYXAoDkdjAMYRfbCch
         1kOssrjzyCwI9UJslA/o/J4XvWsRb+FvFaRxlL3vJelRXxXm+FTzylMFTEySdYk2uvYk
         Prni2ofLNJeVaQSYehapSnaDaq6OAoRO6jSq5cXYLAWa8KdM2YbXiSfZrqEOvdyKP+R+
         YeYe9yqDPRtYTg/L5cmsPqkjTigz27xZ0v20PoCA0x7VLGoRS4e5n4tuR2XOrCPZp8xx
         XJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=mdYToYuDmh6OlwRD6Ej97k/1spumBy4m+atUuj+qy98=;
        fh=5mO6DatcWqUAYbtQnyrDkozVNvrl3Si66CByb2cSP4g=;
        b=n0CEviqq4kSAklAGkO1yvZuIoYbx79ikLgkAwpx42n4mYDRddP8HA1Z8QIjl2VTNsp
         BQeU3JldqzW4HMmha+IFreeSjjwjLtXbmjeEBL7krrsmV40y6ZVhMdPnwtFAOZ/KhaMc
         Gw65MSxVVteW0NnlploTjMUJ37cy+F6iw2IBeqKSQ96ysP+OTE8inL56oaifNbcrjvOX
         Kc1I280KWERu6z+PBSKfwv68k/YJRTqWEuOk95z9XEyIe9I4zLWMi311XeXZdeJpWJu7
         hZ0/Ni4+i1/Vq+lWqIgkiQ+bqi8PPGgipQTyhtw8r5MWfrxhupzEim77eXE/HKBJ8Ru9
         x/IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kemnade.info header.s=20220719 header.b=vKwC6cNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020a05622a030100b0042dad4475c7si1472719qtw.174.2024.02.15.05.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 05:28:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kemnade.info header.s=20220719 header.b=vKwC6cNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rabmG-0003Vz-85; Thu, 15 Feb 2024 08:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andreas@kemnade.info>)
 id 1raX9V-0002E7-UG; Thu, 15 Feb 2024 03:31:30 -0500
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andreas@kemnade.info>)
 id 1raX9U-0005lr-Af; Thu, 15 Feb 2024 03:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mdYToYuDmh6OlwRD6Ej97k/1spumBy4m+atUuj+qy98=; b=vKwC6cNZjEDmW0ViWp1hf3tqE9
 yo6U1M34Lj0sObd4osD1B7ykNVCDPgSw1bBmtIYRWlZcAhsxD4pgW/Mdf+p2vb6oEGb/7UwNj7sqs
 AJ2n6XTA7bPq164DfJpODrHHMuLwi4gwJaYLOLMAENs9TCTIxo08ySygVsDKeeZ26XxlaKo1UJmID
 NYtVT5GjUemWScsjCzCyfwUN7WdVg/ftxexJiFvP2tA2K9UBAWBRkoIpz0nx/gb5KXXrZkBUBmEKM
 B1ag33DesNwkdZse+VTfAZzwKerIhD46b22JpcIdkDlrmt8NErdiz4twj2s2CaOu+sLSBl+LGPF/D
 V5YG4V8g==;
Received: from p2003010777002c001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:107:7700:2c00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1raX9I-009SKj-Ee; Thu, 15 Feb 2024 09:31:16 +0100
Date: Thu, 15 Feb 2024 09:31:13 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Dmitry Baryshkov" <dbaryshkov@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, paul.eggleton@linux.intel.com, "Andrea Adami"
 <andrea.adami@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>, "Peter
 Maydell" <peter.maydell@linaro.org>, "QEMU Developers"
 <qemu-devel@nongnu.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "Marcin Juszkiewicz" <marcin.juszkiewicz@linaro.org>, "Aaro Koskinen"
 <aaro.koskinen@iki.fi>, "Janusz Krzysztofik" <jmkrzyszt@gmail.com>, "Tony
 Lindgren" <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "Daniel Mack" <daniel@zonque.org>, "Robert Jarzmik"
 <robert.jarzmik@free.fr>, "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Stefan Lehner" <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <20240215093113.5c58cabe@aktux>
In-Reply-To: <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <CACRpkdbmJe8ZE7N0p_utWucyw+3mp1Qrb0bQEKcJPmwNFtVA_g@mail.gmail.com>
 <CALT56yOT_U9jVkhTP=zZu-32B4pta5zaJocn9695N7ari4cFyQ@mail.gmail.com>
 <be4038e1-a578-4439-a9bf-e936484c64cc@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a02:c205:3004:2154::1;
 envelope-from=andreas@kemnade.info; helo=mail.andi.de1.cc
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Feb 2024 08:27:41 -0500
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
X-TUID: ieTTHSEABGn9

On Wed, 14 Feb 2024 23:42:58 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Wed, Feb 14, 2024, at 13:26, Dmitry Baryshkov wrote:
> > On Tue, 13 Feb 2024 at 23:22, Linus Walleij <linus.walleij@linaro.org> =
wrote: =20
> >> On Tue, Feb 13, 2024 at 9:12=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote: =20
> >> > On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote: =20
> >> > > On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote: =20
> >>
> >> Andrea Adami and Dmitry Eremin-Solenikov did the work in 2017 to
> >> modernize it a bit, and Russell helped out. I was under the impression
> >> that they only used real hardware though! =20
> >
> > I used both Qemu and actual hardware (having collie, poodle, tosa and
> > c860 that was easy).
> >
> > The biggest issue with Zaurus PDAs was that supporting interesting
> > parts of the platform (PCMCIA, companion chips) required almost
> > rebootstrapping of the corresponding drivers.
> > E.g. I had a separate driver for the LoCoMo chip which worked properly
> > with the DT systems.
> > PCMCIA was a huuuge trouble and it didn't play well at all. The driver
> > must be rewritten to use the component framework. =20
>=20
> If we want to actually go there, I think the best option for PCMCIA
> support is likely to replace the entire "soc_common" pcmcia driver
> with a simple drivers/pata/ storage driver and no support for
> other cards. There was a driver until commit 38943cbd25a2
> ("ata: remove palmld pata driver") that could serve as an
> template.
>=20
hmm, main usage for PCMCIA/CF in those devices was often something else,
not storage, at least on the IPAQ h2200. Wondering wether that road is
actually good. When I was mainly using those devices, I was not good in
mainlining things.
I loved that daylight-visible display.

Regards,
Andreas=20
