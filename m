Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp771701lfm;
        Tue, 18 May 2021 14:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySlS78xYg4xCe2dLnysqAxhGji1JNPBBBQJTzuQM2rhXMP2JIgT1/MQpCW/sOFMxY3yLGg
X-Received: by 2002:a92:c74b:: with SMTP id y11mr6586371ilp.302.1621371611813;
        Tue, 18 May 2021 14:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621371611; cv=none;
        d=google.com; s=arc-20160816;
        b=kO0qGyiuHtZwtWIVh5CEzfd9Z7aSnJMc9ysk6eneOHQ9qX3ogp1IF7Rnmo91Fd3p6l
         eqDKUVV79HKNHHFBPADQ8hyzOFaAVXNDduteuYyawqUxaUm1WDOsdSdR9eJ3D70Aqaet
         sn9RUhli6dYXCRI+jfNWHvMXtD5k8/oiI3bhdKfXIq3oJesk4l0UXxZL/TqigVnU8kKz
         nwMID4dcQ6gneRMWcVYVPGNz1aRdRroMLBq8PZAL+BCl9AubedN7iPpNo4KOTiXQZBzI
         +ahMYwMDxPYtThFELWodt/l9Ye3Mahg9pFdp7TjQFPYGW0tN2GCoxPeq4IvD5xZ2wTm/
         3kBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=6d1nyj0TQvHo/3guT0tFbf7/8qJooXXsl9rN1Yfhdic=;
        b=X9rpKm3K/9/O9h76lT9rn1HvYJRcrlxKrALXU4r/KTzTmbzWX7VXdj65ruM95UxSca
         NIbJRnBYH1Evw3oweOZTfjVbYvnWs+IAtsVSoqqo9eg9+/9AeCrsG4CgIN6DO0RUnBCy
         ftmCtesDU2mB62toR+NXJXe/63W8GlZEaOD6Y5Cv4gWsP6NaaahygKy+N8Knsu/n+vGC
         0rlnpcxdy3DMNlROE0qg4Up+m+MPeIrFlvatdzZAmpAjsYe5EGKgr7ZEuEzlzPiTcGK6
         /Ch39QpZKzOYWzVCaUz/CcfUwzVRlYlpcuQKWaD4+90wlDz+PVTJVe5VQoHUJYklfB+G
         MrLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=zraQEERN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si24764263jaj.66.2021.05.18.14.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 14:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=zraQEERN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj6p1-0002FQ-4f
	for alex.bennee@linaro.org; Tue, 18 May 2021 17:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lj6op-0002Dp-6X
 for qemu-arm@nongnu.org; Tue, 18 May 2021 16:59:59 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lj6ol-0002Td-NZ
 for qemu-arm@nongnu.org; Tue, 18 May 2021 16:59:58 -0400
Received: by mail-oi1-x231.google.com with SMTP id c3so11088371oic.8
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6d1nyj0TQvHo/3guT0tFbf7/8qJooXXsl9rN1Yfhdic=;
 b=zraQEERN8bKLyKT4Llwwq/dSTkEZInTUqOX1u+6q6S+QnprQsq3/6K0U5WRoZbvNlM
 1bI86k8sh9WQdXqKuQnxGTSqekSlTWbYGaFlU7Ffx3So1eU6mT4BvZPSAmuJ3CjgA5gI
 SoeUG37ZIsdn+euXkzlSk6Fa1xhd/6FqQemxfH73T6aaky1yn3jgDytz7EbteskQizHO
 EOxgd7PyLgeWMVaqGwTLKrBzwqJEiQeWJHylSVsBKP2ho7yuYA/FNntQJYfovPRU6drD
 qRAt0keLqqepkZWTg3zGrLTLK3rEE8S57ew6kVl1TgkQ+O1/jSGKnOtwvXYKAvejJsMO
 0EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6d1nyj0TQvHo/3guT0tFbf7/8qJooXXsl9rN1Yfhdic=;
 b=HQF2C29N/BR8/zfRAtPJzSaUvoeBBWToA8N9qqBGxOeSdGqc9Lf74apII+UyoEx69D
 t8iGjbfyNWcUwEkC9fMAXZI4YREGw+NaEk0aBqyW95m3zVdzXFSooJ3usW+6rrs9/+gZ
 5NXtnnk753QD9+5J4UvaMJZpHoCbbnVLNqQCvPjPYvGsB6EH0nzattDGTbvflgJ3V3N3
 xSj2QK68/FS+rJfIKJK8xKDy3A/cWJoqMk6FpaDla9UnN7krGlPe0y9w3eA2n2N8Afmz
 xUC2Xv87qSZeKGHcs3voYtyz1N31xg1cRHosSLysrUCxGQA1iu62GQEf0elU8ULm13eH
 xM7A==
X-Gm-Message-State: AOAM530z3SR2VkB1K8q74xXxsmQT/pZZU5L7IwEGZXhurGXZigtG65iJ
 x/4k23lGrPbu95BzPjMlGOk4kg==
X-Received: by 2002:aca:7501:: with SMTP id q1mr5348956oic.9.1621371593414;
 Tue, 18 May 2021 13:59:53 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by smtp.gmail.com with ESMTPSA id w198sm2117581oie.26.2021.05.18.13.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:59:52 -0700 (PDT)
Date: Tue, 18 May 2021 15:59:51 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v3 0/5] Add support for PMBus in QEMU
Message-ID: <20210518205951.GZ11196@minyard.net>
References: <20210518184527.1037888-1-titusr@google.com>
 <20210518194518.GY11196@minyard.net>
 <CAMvPwGquxnT7RDOVCeXG1Jdjg1hU+a1-20Pu4c7ufQDytbNHag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMvPwGquxnT7RDOVCeXG1Jdjg1hU+a1-20Pu4c7ufQDytbNHag@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: cminyard@mvista.com
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 64fWWPhSeoBI

On Tue, May 18, 2021 at 03:50:57PM -0400, Titus Rwantare wrote:
> I would also like a directory for sensors. There are quite a few of
> those incoming. Any objections?

None from me.  I'll add a patch to move all the sensors from misc into
it, if you like.

-corey

> 
> -Titus
> 
> On Tue, 18 May 2021 at 15:45, Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On Tue, May 18, 2021 at 11:45:22AM -0700, Titus Rwantare wrote:
> > > Hello,
> > >
> > > This patch series adds an interface to start supporting PMBus devices in QEMU.
> > > I’ve included two PMBus devices: MAX34451 and ADM1272.
> >
> > I've reviewed all these patches, and beyond my one comment, they look
> > good.
> >
> > I'm not too excited about putting the device files in misc.  I know some
> > SMBus sensors are in there, but they really aren't miscellaneous.  They
> > are really sensors.  But unless we want to create a sensors directory
> > and move things into that, misc will have to do, I guess.
> >
> > -corey
> >
> > >
> > > PMBus is a variant of SMBus meant for digital management of power supplies.
> > > PMBus adds to the SMBus standard by defining a number of constants and commands
> > > used by compliant devices. The specification for PMBus can be found at:
> > >
> > > https://pmbus.org/specification-archives/
> > >
> > > Currently, the goal for these devices is to emulate basic functionality by
> > > reading and writing registers. Timing, and some logical operation is not
> > > implemented. This implementation supports nearly all available registers for
> > > PMBus including:
> > >    - Voltage inputs and outputs
> > >    - Current inputs and outputs
> > >    - Temperature sensors
> > >
> > > Unimplimented registers get passed through to the device model, and device
> > > models can opt out of using the standard registers with flags. The included
> > > devices make use of these fields and illustrate how to interface with the pmbus
> > > class.
> > >
> > > Datasheets for sensors:
> > >
> > > https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
> > > https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf
> > >
> > > Since v2:
> > > - bump for feedback
> > > - removed commented out code
> > >
> > > Since v1:
> > > - addressed Joel's comments
> > > - split out tests into their own patches
> > >
> > > Thanks for reviewing,
> > >
> > > Titus Rwantare
> > >
> > > Titus Rwantare (5):
> > >   hw/i2c: add support for PMBus
> > >   hw/misc: add ADM1272 device
> > >   tests/qtest: add tests for ADM1272 device model
> > >   hw/misc: add MAX34451 device
> > >   tests/qtest: add tests for MAX34451 device model
> > >
> > >  include/hw/i2c/pmbus_device.h |  506 +++++++++++
> > >  hw/i2c/pmbus_device.c         | 1596 +++++++++++++++++++++++++++++++++
> > >  hw/misc/adm1272.c             |  543 +++++++++++
> > >  hw/misc/max34451.c            |  716 +++++++++++++++
> > >  tests/qtest/adm1272-test.c    |  445 +++++++++
> > >  tests/qtest/max34451-test.c   |  336 +++++++
> > >  hw/arm/Kconfig                |    3 +
> > >  hw/i2c/Kconfig                |    4 +
> > >  hw/i2c/meson.build            |    1 +
> > >  hw/misc/Kconfig               |    8 +
> > >  hw/misc/meson.build           |    2 +
> > >  tests/qtest/meson.build       |    2 +
> > >  12 files changed, 4162 insertions(+)
> > >  create mode 100644 include/hw/i2c/pmbus_device.h
> > >  create mode 100644 hw/i2c/pmbus_device.c
> > >  create mode 100644 hw/misc/adm1272.c
> > >  create mode 100644 hw/misc/max34451.c
> > >  create mode 100644 tests/qtest/adm1272-test.c
> > >  create mode 100644 tests/qtest/max34451-test.c
> > >
> > > --
> > > 2.31.1.751.gd2f1c929bd-goog
> > >
