Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp726281lfm;
        Tue, 18 May 2021 12:51:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdKhy6XbjqsUmM+OPLfV1oZFsNpE2f/izhp7uq5zNmYASJIwXGRCUyAwn0xvQUCoAiyvp4
X-Received: by 2002:a05:6638:21a:: with SMTP id e26mr7634431jaq.58.1621367509943;
        Tue, 18 May 2021 12:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621367509; cv=none;
        d=google.com; s=arc-20160816;
        b=erBC51nZRXMUAQN7ez287S1q/wplhq28tS5vg95CRq1nCEwfx0mQ8WqYwl71WTc5Lf
         Y2ii8J5ITXD5zZiHlOE+21iQMjRArOHaV3vl6hk2RP0mOdAvJkc4m3xiuZnJb+NgwjEh
         8KKuyEr1Bmet+2A/W3Sh3OS81FrZnaK+UmJ9yImBA2Ng1k99TVNqmp/9NbhMCOXrbpeC
         uaVHe7Z+zsOPVZPmsskVXR1NEn2in8y57chkJv43RSckmZ9NNWvmuDxKJkbWTGJ+xkTP
         /0OaMmQJ5g8sEzJTFTKRIkQkl/byhhFkeOq4aMQ8mCSF2qCA9WviZ2gJhp8Vw1+/cFuZ
         fxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tyXck7Um18ApdEwm40WF6AqGkeLHXqrGv35AidTpKn4=;
        b=0pVgyV0tEdNSQlXkLqhTl6/YixUOn8Gp5UXjiQRJfyKEy2oDC9ZAQX3C+aPxEe5Ge2
         nZYwt3UyUt6EJrgs3GHx8vZ3Jph0EL8bMy0W2lXTlkmI+2F+tOu7HnW77eDbEASBQyYb
         eMnu8CIponlSWbsRKcBNjFE1Z2opAxKNiz1H2bHMOok34hRlFw+Vwbpou9tIMK1T8JhX
         4PcGUlcbHowV1E2WtIzp9ZWvH5nVa3w4eQyJaD0UgaYP8rPTKLBzQ0vKGwYoCCM3dPMB
         4A6pYqhBH9HArlF7vjvYKMdIfDgG3hDli22g3FnwxnyYajYNq4Zfn65cnPhu8FE9fGFB
         zWJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=UlBeNYrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si8886214ilq.76.2021.05.18.12.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=UlBeNYrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5kr-0000dz-87
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj5kf-0000Xt-Sc
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:51:37 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj5kd-0001Nf-UB
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:51:37 -0400
Received: by mail-ed1-x52f.google.com with SMTP id a25so12624238edr.12
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tyXck7Um18ApdEwm40WF6AqGkeLHXqrGv35AidTpKn4=;
 b=UlBeNYrI2EBscM7Dd8GcWrz5PreA76lKgSWkn6AY1rh9Kq+NXY54Y5Su8EoRWeecFa
 ql7/38owv9nNZlThAQLlg5Vke104safjcWXMjlt8yGiYAGmcvYWYp/2XEEjH//Lr7TQt
 /VUfd6v/0lIzaLGFGf2ALHmJ10aV5DWJVk77WCa7CewoTiu/hL9emNIKRujTHQ46Czyq
 ylhuDnhNesMwOpnMcYwZhR8R1lsxF6klxr20zzrGQ4ss6xdqW8Vp2hyAGVQJCsJQAmXB
 Khb8la0vHVlVMf93wK7xXp8JrNVgurMNt+K1Njz6Adm2vxtcRprC8LK/CyYr8gHMqE35
 JEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tyXck7Um18ApdEwm40WF6AqGkeLHXqrGv35AidTpKn4=;
 b=mrjqIQRXmf2bwzW3dEIFybOiXb0eIemCxeCd0l2aLkSTKLJYFtQWyXgyoMDfRqotv7
 fX9f7rIchU22UZq2w1PdxuZxIcu3OqbEMCinKN43a7pe5JS0nPdRpY2bqxuUsd4V/JSZ
 roBjzBxBXOgXBKOlsUMfRwUUK81x4miyK6WybgihUi90qyQxYz9i1RDNutmjxqfFpZkP
 Trz89KkZ0CuN5Up8tJBsMUkY4P0bbYnX2pU+3FXexedCxcjIaXZAbIosLmDBFa08KHgC
 RaV0q4HVIohakP/PUvSKebxfqoUad8zFVrBR1j85Dt1qeZPsmuYy6JBEZ2lsaelc5YmW
 0VRw==
X-Gm-Message-State: AOAM532k8UhvRLtcfOHs0MnI50eUlAK0LV/uYvhb6wA5In6M4OAwzbW2
 iybg1eqPiemuZJzP7cnbUbCROr0TYrZa6feRDY2aMg==
X-Received: by 2002:a50:aa95:: with SMTP id q21mr8858159edc.329.1621367494238; 
 Tue, 18 May 2021 12:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210518184527.1037888-1-titusr@google.com>
 <20210518194518.GY11196@minyard.net>
In-Reply-To: <20210518194518.GY11196@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 18 May 2021 15:50:57 -0400
Message-ID: <CAMvPwGquxnT7RDOVCeXG1Jdjg1hU+a1-20Pu4c7ufQDytbNHag@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add support for PMBus in QEMU
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Hao Wu <wuhaotsh@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=titusr@google.com; helo=mail-ed1-x52f.google.com
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
X-Mailman-Version: 2.1.23
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
X-TUID: AF28RllYKxKw

I would also like a directory for sensors. There are quite a few of
those incoming. Any objections?

-Titus

On Tue, 18 May 2021 at 15:45, Corey Minyard <cminyard@mvista.com> wrote:
>
> On Tue, May 18, 2021 at 11:45:22AM -0700, Titus Rwantare wrote:
> > Hello,
> >
> > This patch series adds an interface to start supporting PMBus devices i=
n QEMU.
> > I=E2=80=99ve included two PMBus devices: MAX34451 and ADM1272.
>
> I've reviewed all these patches, and beyond my one comment, they look
> good.
>
> I'm not too excited about putting the device files in misc.  I know some
> SMBus sensors are in there, but they really aren't miscellaneous.  They
> are really sensors.  But unless we want to create a sensors directory
> and move things into that, misc will have to do, I guess.
>
> -corey
>
> >
> > PMBus is a variant of SMBus meant for digital management of power suppl=
ies.
> > PMBus adds to the SMBus standard by defining a number of constants and =
commands
> > used by compliant devices. The specification for PMBus can be found at:
> >
> > https://pmbus.org/specification-archives/
> >
> > Currently, the goal for these devices is to emulate basic functionality=
 by
> > reading and writing registers. Timing, and some logical operation is no=
t
> > implemented. This implementation supports nearly all available register=
s for
> > PMBus including:
> >    - Voltage inputs and outputs
> >    - Current inputs and outputs
> >    - Temperature sensors
> >
> > Unimplimented registers get passed through to the device model, and dev=
ice
> > models can opt out of using the standard registers with flags. The incl=
uded
> > devices make use of these fields and illustrate how to interface with t=
he pmbus
> > class.
> >
> > Datasheets for sensors:
> >
> > https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADM=
1272.pdf
> >
> > Since v2:
> > - bump for feedback
> > - removed commented out code
> >
> > Since v1:
> > - addressed Joel's comments
> > - split out tests into their own patches
> >
> > Thanks for reviewing,
> >
> > Titus Rwantare
> >
> > Titus Rwantare (5):
> >   hw/i2c: add support for PMBus
> >   hw/misc: add ADM1272 device
> >   tests/qtest: add tests for ADM1272 device model
> >   hw/misc: add MAX34451 device
> >   tests/qtest: add tests for MAX34451 device model
> >
> >  include/hw/i2c/pmbus_device.h |  506 +++++++++++
> >  hw/i2c/pmbus_device.c         | 1596 +++++++++++++++++++++++++++++++++
> >  hw/misc/adm1272.c             |  543 +++++++++++
> >  hw/misc/max34451.c            |  716 +++++++++++++++
> >  tests/qtest/adm1272-test.c    |  445 +++++++++
> >  tests/qtest/max34451-test.c   |  336 +++++++
> >  hw/arm/Kconfig                |    3 +
> >  hw/i2c/Kconfig                |    4 +
> >  hw/i2c/meson.build            |    1 +
> >  hw/misc/Kconfig               |    8 +
> >  hw/misc/meson.build           |    2 +
> >  tests/qtest/meson.build       |    2 +
> >  12 files changed, 4162 insertions(+)
> >  create mode 100644 include/hw/i2c/pmbus_device.h
> >  create mode 100644 hw/i2c/pmbus_device.c
> >  create mode 100644 hw/misc/adm1272.c
> >  create mode 100644 hw/misc/max34451.c
> >  create mode 100644 tests/qtest/adm1272-test.c
> >  create mode 100644 tests/qtest/max34451-test.c
> >
> > --
> > 2.31.1.751.gd2f1c929bd-goog
> >
