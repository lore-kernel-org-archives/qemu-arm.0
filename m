Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3558812wrt;
        Mon, 7 Jan 2019 07:20:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7p4g1TciP/U4U7DNkRtM+BiWa9+8Du/6JBIV9HGqF9EeqdCzo1YAmcFhBzB1m8WFi8whpj
X-Received: by 2002:a1c:ae88:: with SMTP id x130mr8496579wme.91.1546874439030;
        Mon, 07 Jan 2019 07:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546874439; cv=none;
        d=google.com; s=arc-20160816;
        b=C39OVaSEClwZYq8TuPqLuiJ5EfMB8VRd294GOO1dWpPL0MnJMiMT1DNgo4gehUzwz8
         KzQfOYO6ic8gx1xMKLiHoWv9gjQDf60r66VPuqJJnSqTKBR2rmKF0g52jNLlZHXsYZiH
         /CEEIAO1uQdflfMfFqaeGxq0SAY4L+tMBMVvs5G2JBqh7J1wyIdyGAExpUbizUdzsNKg
         1P+LHhEuSQK71BYXyLWcPf/3rnT5YdjqxF1QtDDgyrWna32cIizKjA3JClBOyc2exgoN
         6fGCWf1ebMICz/w8qpusL3wXNX/o29FpE8p9QlxLakYmaZ5KSvxswNkZaAss0y9xhC55
         Npcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eo7kJkDOCfhiUTjGUN9XPW1kHgs7UV/QfFXi6cy54LI=;
        b=w6zZjDMmH4wAkzPDypXM9UIGwXy7rF88E8g2fYYmVBxcKQT4e9C1AENSyDcEgD7FOo
         7Q9cRKIsos+2e4zKqOHVoBxCfx9sv75Dgm6TCOGBDMy4QpbyCTANqeIednCEEbzDoAWC
         t0T93vFBCEbjiGooRdpNSYxtTYOLv6/HHfykSdOnWeX1neY/H4PgocFjqJwOiCsQuS8J
         e805YnZO1X9cViVtJ7Kxjdo+nKxWsf9r4XCxtauf0gJskBXN1WrAYLl/+AoS8iGl8hao
         n4IX871YeVtIxDnBazr2LDtH/J6YGmn1R6YWp4SweRW6I0GbuGDwtDTmcX1czIYrd23l
         9dzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G4uqIpin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si36096154wrw.296.2019.01.07.07.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 07:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G4uqIpin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggWhi-0002bb-4T
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 10:20:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggWhJ-0002Zw-RG
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 10:20:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggWhH-0000LD-2c
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 10:20:13 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggWhG-0000F2-Bx
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 10:20:10 -0500
Received: by mail-ot1-x343.google.com with SMTP id a11so585728otr.10
	for <qemu-devel@nongnu.org>; Mon, 07 Jan 2019 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Eo7kJkDOCfhiUTjGUN9XPW1kHgs7UV/QfFXi6cy54LI=;
	b=G4uqIpinkaSGK423iAD+orqWI2naXy8+JMQYa5BUI5k7Macr/ihXl6Pv8Q7xV6HZ2N
	Ybj1cEwa6TtrXXJLHimeo3SanlEk8iIrt4t6v7nRjBL9zv077rSmokEC4+zCnFCCpqf5
	qy2r+tl/QPRV56abKguUb9smRDPCv1dI8oPdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Eo7kJkDOCfhiUTjGUN9XPW1kHgs7UV/QfFXi6cy54LI=;
	b=lSchuCQ5TaehEWEMABRCFe2s4UDQmFuZeHRbP3HMk82+wCuEXNOnqny9pHIU334ouV
	hOoB3lyYWK2yAfGFw9DAgKuHzFnBrID6Mxs9dXUBF5T+Kv+n4k9t8q4ULCPADmWRkVl7
	zBdzQsIYQDzOsRidZjBzHEmD/LPwqR5CXoEF2si0ZIqgdCoouY3eakRiFdLc+rVTPRDA
	NWYzzoFVacoHCQNDrLzznAnshTHiK+aY7TeIbgSp3LpwSQIrCqsTJYoGSyffvJkqVuVb
	6VjHDYPdUpiz+x3b9xcXjBPQwsKa36NS9o0F7yEF/m5Fb8u0ajcs3vzyk8vw97DYT0/W
	8AVA==
X-Gm-Message-State: AJcUukdJVOu/RZJjGJDLuUaAtHGSeN3sLCPUl+506stfyc6wquZDwM3g
	77NtyQATTpxYmLE1OcVYLJdpcnKiWLnZK5OjZrIIYg==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr41570497otq.316.1546874407836; 
	Mon, 07 Jan 2019 07:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20190103091119.9367-1-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jan 2019 15:19:56 +0000
Message-ID: <CAFEAcA-=fApDM-CGhJvXpv6BSp24K7a=fjfxOkUec0AoAMB7rw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 00/11] arm: Core nRF51 Devices and Microbit
 Support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Jim Mussared <jim@groklearning.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K3ECTgzL04eW

On Thu, 3 Jan 2019 at 09:12, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Steffen has been busy so I picked up "[PATCH v5 00/14] arm: nRF51 Devices and
> Microbit Support".  This series includes the core devices needed to boot basic
> guest software on the "microbit" board.
>
> This series includes Steffen's random number generator, GPIO, timer, and a
> stubbed clock.  Also, this series adds the tests/microbit-test.c qtest.
>
> Changes from Steffen's series:
>  * Made timer tickless [Peter]
>  * Dropped non-volatile memory controller.  More work is needed there and I
>    don't want to hold back other devices in this series that are ready for
>    merge.
>  * Rebased and re-tested with make check and real micro:bit programs
>    (requires out-of-tree -kernel and stub TWI device patches)

Applied to target-arm.next, thanks.

-- PMM
