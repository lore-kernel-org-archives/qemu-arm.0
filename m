Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1020345njb;
        Mon, 9 Sep 2024 11:16:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVF04YzNuvfyfuspwSORPrMhcBoscu5RIzSyGpD7SfImcezlYc5uWBBGD15aAVX0BxmHuy1UhDsNlApnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHtWDadBMbr+sLOT0yhqp3Kk4KIJtKkq43K4FoMiQKBvacdgTBYnHgckTSweURPddk3yfsY
X-Received: by 2002:a05:6830:7009:b0:709:4cde:cd6b with SMTP id 46e09a7af769-710d83a8fcemr6825488a34.9.1725905813601;
        Mon, 09 Sep 2024 11:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725905813; cv=none;
        d=google.com; s=arc-20240605;
        b=UWymnc5OZvdTF2TOvAP9eI3u8ZBuGabGInfyxWMLCgMlMbEjItsgwGQOvcRcdqMdDX
         Mn0xewDEvWnO+9j1QLCo6R26J5RXfh/BHY4KKOhgg7SA61KKwYqp4D867egVt9OEBBeo
         m1gcCEW/7n6fzsKU7Tc+n+rjZr0jfzZa/yEvmDoW2gCtFoxmSVGnwdnHB94lrUl3+OEI
         rLQFw0tOJX+vYrQeofOmgCbGHoSMud9ayREnCtGpQSaN46nHDbM/eySeKmSYUkHwRBPT
         UW3Qfg+HfZKw/p7Z3Do7QGpWMmW3TVXjJz0Jv65VgwVYJBGAktWt2JYtqFTDFQe4yTPj
         uurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VDcXcsdeFEjrXienQpg6mBkczDT4wivM5vmM2cMi1Kk=;
        fh=Nh/1SMnE252Q79uUYskv4qsqVI5jCZFQdXGkReC+wqc=;
        b=coIkmD8i8lH51jZJhY+9kdKs32/vtYPPsrxEYtFcuvg3bH7uglR/XpFU7KUrjPg01r
         lEAqMIfibW24WujWT1AgLei/yZ8zVKm2RPiK2vPjJ6eB1kLssMiQKjJDcvx1ltWov5R4
         CXWqad+CnULhnbCi7vYPNqcwxX+MtTH3bm0yqrbi9ILfStsqLnkR7d9KGtZLdFyH5+fm
         /9qy2Jyy21KeyLpCDuGIDBQ0gnC3isZaxYPmK7Rws286dLSMnAmzHhH1LFPSBZF7/NY1
         VR0mSKCexfX9+NxEJQxQGy4ZGz93jUnHH2uR/gAkulOJaGGrroOrpVzoQ0jbkScxI/Yp
         UBIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i6Qew7dD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-502f9b1a71csi22122e0c.143.2024.09.09.11.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 11:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i6Qew7dD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sniw7-0002VM-Ma; Mon, 09 Sep 2024 14:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snivz-0001x1-JC
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 14:16:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snivw-0002oH-0C
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 14:16:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso5796079a12.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725905773; x=1726510573; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDcXcsdeFEjrXienQpg6mBkczDT4wivM5vmM2cMi1Kk=;
 b=i6Qew7dDg5N5H3RJ2sw6WLh2ssZgKUNPCwxtHC4Yu2lT0DnJvCis0iVVd34FIOBffE
 zk5fFYuBd9wVsCJhRm165FhD21++3G/YLNzKHHbVLccYIwKjcOvB5LtvQTZACqtLOW1K
 iNUPHbY3ZUV+9o1SZ/BQH/vb8FO0oVQe7bG4BtTp2QodcLUsg/tCOy0jM9oadtQsMCF6
 lTzgeBW1Yktje6MlGkubYohkweuIKCUTC9O1ZbNaAMdP1lRf6q3i1SKe/W+3Fg60T+MM
 55cpkkNgvjoHnnsGL7/AAos4vUgj5yvRwJ/16VYlAb7nUCpQ1arPq9fJOesPVOdh4Jxl
 4z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725905773; x=1726510573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDcXcsdeFEjrXienQpg6mBkczDT4wivM5vmM2cMi1Kk=;
 b=lKIVzlblP1I5NKkkejgSm9VtUDQRPxViazbkzYCsclaLGL9M1vqaFlGvra9o1wmDxX
 on7MxKgcr6QN17UTkPuDrzKC+bypNp0CFlUgbFyU1/UZFwaxB3lxSZkiLaQaxfLUx+Ag
 gGtJxoKzs81+OtuJETo5flhTYxaJ6AqWWV84+IdM0JvnC+tqCfnEwZrCUY0Jd4gy8vET
 Un9XCRnKrn7q8v5MD3LgTVLFKoVVLRH2xaByHyzddRC2O2aWoZERc6bp4L5riBjFDwj2
 vr4N/4g7xzXqlDsje4e1SdmmMCMNzgab3t0h//ja+9OW1D61BtQe+AUJmuys70ap2Yr5
 tSNw==
X-Gm-Message-State: AOJu0Yyi7fRjrKjeqLxXECFElGEi5msvyjIaMaM7W2WU2p1uPEKgEvDK
 ULfQ9jWdWbXE96sljS+5hTeDMQIRGe/pl1m+pJZ+AovN5ShaeFgtGW/VXNOuAF1LUry0Y/rPA8G
 oZkn8/T9ShewuCSaE3fsGMScYDNRexKXkM5JO5g==
X-Received: by 2002:a05:6402:3903:b0:5be:fdc0:e704 with SMTP id
 4fb4d7f45d1cf-5c3dc79323dmr7951048a12.10.1725905772817; Mon, 09 Sep 2024
 11:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <fabedae0-d748-4a9d-b802-14d15f3cd44a@linaro.org>
 <CAFEAcA9z9Mf52pOVCHv_Y1hvPPWt7Me5CDcxYS_cXvj7OFDuSw@mail.gmail.com>
 <3d622822-b4a9-49b1-950e-8f33b6532d8f@linaro.org>
In-Reply-To: <3d622822-b4a9-49b1-950e-8f33b6532d8f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Sep 2024 19:16:01 +0100
Message-ID: <CAFEAcA-osC-uuC+6+vskYVSEXfqmzbEFUFfgFAwxzQkju1i9Sw@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: awvqmi5b3J9U

On Mon, 9 Sept 2024 at 18:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 9/9/24 15:44, Peter Maydell wrote:
> > On Mon, 9 Sept 2024 at 14:41, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Hi,
> >>
> >> On 3/9/24 18:06, Peter Maydell wrote:
> >>> This patchset removes the various Arm machines which we deprecated
> >>> for the 9.0 release and are therefore allowed to remove for the 9.2
> >>> release:
> >>>    akita, borzoi, cheetah, connex, mainstone, n800, n810,
> >>>    spitz, terrier, tosa, verdex, z2
> >>
> >>> The series includes removal of some code which while not strictly
> >>> specific to these machines was in practice used only by them:
> >>>    * the OneNAND flash memory device
> >>>    * the PCMCIA subsystem
> >>>    * the MUSB USB2.0 OTG USB controller chip (hcd-musb)
> >>
> >>> thanks
> >>> -- PMM
> >>>
> >>> Peter Maydell (53):
> >>>     hw/input: Drop ADS7846 device
> >>>     hw/adc: Remove MAX111X device
> >>>     hw/gpio: Remove MAX7310 device
> >>>     hw/input: Remove tsc2005 touchscreen controller
> >>>     hw/input: Remove tsc210x device
> >>>     hw/rtc: Remove twl92230 device
> >>>     hw/input: Remove lm832x device
> >>>     hw/usb: Remove tusb6010 USB controller
> >>>     hw/usb: Remove MUSB USB host controller
> >>
> >> Some of these devices are user-creatable and only rely on a bus
> >> (not a particular removed machine), so could potentially be used
> >> on other maintained machines which expose a similar bus.
> >
> > Which ones in particular? Almost all of them are sysbus.
> > At least one of them that I looked at (lm832x) is an I2C
> > device but it also requires the board to wire up a GPIO line
> > and to call a specific C function to inject key events, so it's
> > not actually generally usable.
> >
> >> We don't have in-tree (tests/) examples, but I wonder if it is OK
> >> to remove them without first explicitly deprecating them in
> >> docs/about/deprecated.rst. I wouldn't surprise users when 9.2 is
> >> release. Maybe this isn't an issue, but I prefer to mention it
> >> now to be sure.
> >
> > I think this is unlikely to be a problem, but if you have
> > a specific device you think might be a problem we can
> > look at whether it seems likely (e.g. whether a web search
> > turns up users using it in odd ways).
>
> I don't have specific example and am happy to remove these
> legacy devices.
>
> I'm wondering more generically about removing user-creatable &
> on-bus devices, when explicit use is removed (deprecated board
> removed), but we can still use them elsewhere. IMHO for clarity
> in the future we should list them in deprecated.rst along with
> some lines like "this device is explicitly used by the FOO machine which
> is being deprecated; if you want to keep them, provide test cases".

Yes, I think that would be a good idea going forward. I didn't
realise in this case that some of the boards used devices that
were i2c or whatever and at least nominally usable elsewhere.

-- PMM
