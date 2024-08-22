Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp773146njb;
        Thu, 22 Aug 2024 13:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTxfmH4Evj02eknYswBJ4H3fwhoeTtv9COFmDv64AeLXjIYx6C6X/nzb+yZFeGNln0ceE6cTft3tGyDg==@linaro.org
X-Google-Smtp-Source: AGHT+IGkAW7HeofvRTurlGNIBkCeqXmtOKKyCqAk7anDEeGDnYdJ1cuOK/g035sGdwFPfkimPV2M
X-Received: by 2002:a05:6122:54e:b0:4fc:da8f:c8a8 with SMTP id 71dfb90a1353d-4fd1a512ad7mr116039e0c.1.1724357166123;
        Thu, 22 Aug 2024 13:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724357166; cv=none;
        d=google.com; s=arc-20160816;
        b=N8gadzEQ2p1nxY4MgkXEjo9eulrwj/o58XdpjedL49wVe5IBKkOkvkbcRAsDHpt90O
         JwL7e41BZL/OxqKeDRvPDagQKLr8j+k1d6c1wtKmPkO/zdgTzev9Yl6C+mvdSET9yDAb
         IBdanA6k1it0BN31oK8y34/89hPLgkWOqvI0HO4ydZQalWpuSQf8zV737rqq/iTbA59X
         mBqX0ogYsdw9VXhyzl1ljKWWSR1JqYOG4J728Qu86AA2kdcNew2VXWWFn1hvBlLeb791
         pkARifyx2oy6ifP2Xk3v0krn7rOFUO4kFaPj5M8sZYUNQWeAdpvmH1aJ/3C/spsrx638
         AzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LHjw9TuxbXlkebqSQdiQuYwr40RhVog8KVJbsePag34=;
        fh=Y+hbqojD2XoCHCYdfNj67+oKqfaAg/gzl4Df6oJZPeA=;
        b=bk++EjuiYLkXCUffp7QpBfJ9/YmcbLDG3oK1AMgYbMwSY/2cqJh78MpWiElK9J4IyA
         gDb141x3iHJNr6+G7dD4FI4N/FiVdiCRnNdx4DaxD0rXWsp6wevyOs7jjtVwp/r0hxdl
         v4JGVODjYUPw/ZnpUFda5+CrA8wcOz1grSyMW3AZkPeRGDJ16TnqdN6+BdfeZVTQH9Cs
         KK5PUI6NOtSFKoM4cEq87ieKtIXbiPbPNkh0cwJyBizIFUjshB/5RCR4iy/3qgW4uiFR
         B/Fl52Elhh+CHJYTm5LBBvq4SVItRK6tn8u49hhbg1zjLBZpUUKkO0WIsDYyMo/yRMcm
         xpTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cWQcN3Nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-498e48de498si555149137.316.2024.08.22.13.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 13:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cWQcN3Nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shE4C-0003I6-OS; Thu, 22 Aug 2024 16:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1shE48-0003Gx-Kv
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 16:05:52 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tavip@google.com>) id 1shE46-0006fw-8Z
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 16:05:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bec507f4ddso4863a12.0
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724357145; x=1724961945; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHjw9TuxbXlkebqSQdiQuYwr40RhVog8KVJbsePag34=;
 b=cWQcN3NuOslqR9465K1AKXioANTfkqSYQjz5KHkveJYPTgyb7ri7N3dfLmXhZuEgWD
 VqSuXaKAc0vQc8tAlWRdFPKJp2sfhD2b9ZvIh6Zmi7lAN0GKRK2D+Wht2petH/XpKAPc
 HnltRS0rVFKZ8EEfyctreKOnNGsDZ2kWeN06DXirmP2DYZC/MOc29OWgYm8R3K3TCqj0
 zdLT47PNjJ+QNmbwuHjlvMfdOEUQKXpmVEntmWN4PkpZEE8Xf9Sq71agLIQ83WT1kGkr
 03xjIGNAisiinw/zeNpA4H3UlRXCgn9v+uC9nqFoUvRvXkdnwC89fbYTEobuxklZEDxg
 lDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724357145; x=1724961945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHjw9TuxbXlkebqSQdiQuYwr40RhVog8KVJbsePag34=;
 b=XjUKAA//PlloMQyi7crcKrhhu4+fD/OXJT+zZYCrcTS7jN/+oITGMnmWWwy5yF1bEC
 CF7rr6E7GZPSp4LmIKyBx4BrV8DCAH4XmCO9JXiXhNdClTl4kYYgyWZI5sXRXFYnBtfn
 fMdSntAYtoj6QhvRm+F0JYA+vrcnElX2S/1/dZBZsBaoZPAnTtncb55HwmCRUjgdjzht
 7zpRvuMxyZwzsMj61/Pyj+0lbqxoPiclzWfljwIFimzqw3NQKsqjU6U+kmdCZPMJUUVc
 XE/ZGMOtWSJUPyDXCq/SKTR+VdgahWRLSX9KTZQ/fMUQ3oReYj4y3TG9DWSfwhweBa6A
 dU8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1xeqbbkE3Twil5ZpENx99KyfkMhU8Zt0ZbfW+Jji1tPxR0/8XwAeZwBwpIb4JG6qaSUZ9iFQLrw==@nongnu.org
X-Gm-Message-State: AOJu0YwrGvQ/mRrMPKJujuTY5SuWE+nAz0IFTcbIOw+6o18JUE2mYmQ3
 urIU/09s7b1C60i3bELz6Ktl7ZA4NtyNcFYzyWqHNYTpdELGetnOXrE6IIYFHpOtNQl9jfKwXec
 +zO8QWyPH/BxESxKIDx+0WCcNxZ8KhYH4Sb+C
X-Received: by 2002:a05:6402:40c5:b0:5be:ce7d:ad0d with SMTP id
 4fb4d7f45d1cf-5c086ad8aa2mr51956a12.0.1724357144242; Thu, 22 Aug 2024
 13:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
 <CAFEAcA8gg1u4_HwG9QOHj4RqfHgNLkT5nHLTFNrcaHdgL+zEPQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8gg1u4_HwG9QOHj4RqfHgNLkT5nHLTFNrcaHdgL+zEPQ@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Thu, 22 Aug 2024 13:05:33 -0700
Message-ID: <CAGWr4cQ7rWaCo3q71+EaTQMXf1p-pdxL88s5tg_kzeLNo7DTRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/23] NXP i.MX RT595, ARM SVD and device model
 unit tests
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
 pbonzini@redhat.com, thuth@redhat.com, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=tavip@google.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: C+ARItKv9hUV

On Thu, Aug 22, 2024 at 6:28=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Sat, 17 Aug 2024 at 11:26, Octavian Purdila <tavip@google.com> wrote:
> >
> > This patch set adds support for NXP's RT500 MCU [1] and the RT595
> > EVK[2]. More RT500 device models will be submitted in future patch sets=
.
> >
> > The goal of this first patch set is to provide a minimal set that
> > allows running the NXP MCU SDK hello world example[4].
> >
> > The patch set introduces a (python) tool that generates C header files
> > from ARM SVD files[3]. This significantly reduces the effort to write
> > a new device model by automatically generating: register definitions
> > and layout (including bit fields), register names for easier debugging
> > and tracing, reset register values, register write masks, etc.
> >
> > The generated files are commited and not generated at compile
> > time. Build targets are created so that they can be easily regenerated
> > if needed.
> >
> > It also introduces unit tests for device models. To allow accessing
> > registers from unit tests a system bus mock is created.
> >
> > This can potentially introduce maintainance issues, due to mocks or
> > unit tests getting outdated when code is refactored. However, I think
> > this is not an issue in this case because the APIs we mocked (system
> > bus MMIO access) or directly used (irq APIs, chardev APIs, clock tree
> > APIs) to interact with device models are stable at this
> > point. Anecdotally, our experience seems to confirm this: we only run
> > into one (trivially fixed) breaking upstream change (gpio getting
> > removed from hwcore) in the last three years.
>
> My main issue with the mocking is that it introduces a
> completely different way of testing devices that is
> not the same as what we use for any existing device.
> QEMU already has too many places where there are multiple
> different ways or styles of doing something, so adding a
> new one should be a high bar (e.g. "this lets us test XYZ
> that would be impossible in the old way") and preferably
> also have a transition plan for how we would be
> deprecating and dropping the old way of doing things.
>
> So my inclination here is to say "you said that you could
> do the testing of this device with qtest, so use qtest".

Looks like I missed some things when I looked at it, probably minor or
a matter of preference in the great scheme of things. It might still
be worth mentioning them here.

In patch 19 we are testing exposed clocks and AFAICS there are no
qtest APIs for that. We can probably add a qest API for that though.

In patch 9 we are using internal APIs exposed by the generic flexcom
device to check that device selection works as expected. I don't see
how we can reimplement that with qtest, this is a classic example of
what unit tests can enable vs functional testing.

There are also a few things that are a bit cumbersome to do with
qtest. In patch 13 and 16 we introduce i2c and spi echo test devices
to test i2c/spi transactions. I've noticed that device qtests use an
existing i2c peripheral for tests. We could add the i2c and spi test
devices to qemu and have them enabled by default. Or continue using
existing spi/i2c peripherals for testing spi/i2c controllers for
qtests which I personally don't like because it requires knowledge of
specific peripherals.

That being said, I'll go ahead and switch to qtests, if only to better
understand advantages / disadvantages and separate this patch from the
bigger device unit tests discussion.

> If we were designing a "test devices" framework from
> scratch, using mocks would probably be a strong candidate
> for that design, but we aren't starting from scratch.

I still think that writing device tests as unit tests is better:
 - devices can be tested independently
 - we can test more, including internal behaviour and APIs, error paths, et=
c.
 - enable sanitizers by default for device tests*

I wonder what people think and what would be a path to enable device
unit tests. What would we need to prove, besides converting existing
device qtests to unit tests, which I can certainly help with.

*I was surprised to see that sanitizers are not enabled by default on
unit tests when host dependencies are available, what is preventing
that?
