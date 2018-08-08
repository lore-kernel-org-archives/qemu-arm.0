Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp723115wru;
        Wed, 8 Aug 2018 06:46:27 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzxPGfNABzl0joVgxMa3JcWYr9EjYNPJYq0IUpvIA6ajyrXBmXff2Fqhm3S2EISzT9HGIpQ
X-Received: by 2002:a0c:dd86:: with SMTP id v6-v6mr2516377qvk.148.1533735987830;
        Wed, 08 Aug 2018 06:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533735987; cv=none;
        d=google.com; s=arc-20160816;
        b=QMbIFFO3EJ0zMYkg8vzj6uiFBnj0TGt/9VeQC4UMnJQkPj4pIEbyaIWsjdNyr8oYI+
         CfeE5COFRsQB59V4PWc0IGaU0oCZ1pkou9OLr1O+ZPKJWS4YewjWkezliJDQokr80J68
         6RKvuTDHGX96Ekpmp5Jux/B2sBtoP4F42biGDlyEtQZnmi6upUYKQ8pYQrg3GaYaXcCQ
         QGcP1bsLq4obkXuxs+xTl1MBB7eAwIQYCcmCv1oXdCPryjJAGFIPfjNKCtbUFERDpJbV
         e1MOdPkEgH2ZwxkVKXyvIX0IdLGJVvD91kvM8o8NL/xYJNIaMp6n3z73PlEgesXwnHlt
         8vAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:arc-authentication-results;
        bh=r0DFZfQfIam/docf9eEwSs9OlQjBuzlnD7Ij330jS+A=;
        b=zjfu/YtkgOjVzX4rJ6+LC5MQb/66dSi6NNmx+ezOytxzMHXAP0WW6uguQqW8K6jIa5
         lNDk8YMdMCxQRynW5go+G3+SZ22Ca5+0WRzENwbtwPbJDVkC4oPWZqq46vdeCNhv8Pog
         SHQvmleLD5ewGzIP0ZWxn7JCk1QH7MlpNpeHLm0iTAEqmJIs4ya1BlsgRsPqjPe1SdMw
         gCGBvfGWOo7853px1jGEihn7739+SXUkw2K/H0y5L4pBn32ngdtWje5+UqA4qeWiqUyt
         DJySifYnb6pkTTMzASZItzUevMGkVl8B68kv6i60uqAsWofvIhSUnOE6uc1gx6i6uEKf
         Sbyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s48-v6si1094347qte.277.2018.08.08.06.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 06:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnOnD-0001SV-0V
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 09:46:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1fnOmp-0001LP-PS
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 09:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1fnOmo-0004ZZ-U4
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 09:46:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1fnOmk-0004Xr-D4; Wed, 08 Aug 2018 09:45:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id b22-v6so1631744lfa.3;
	Wed, 08 Aug 2018 06:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r0DFZfQfIam/docf9eEwSs9OlQjBuzlnD7Ij330jS+A=;
	b=hbN/bp4CVyuunda31KUT8UuuxQWbanGkZiRLtttP+UDnhfLnIOsOVKBVJ5DrKZECM/
	JIT/ZzEeiRdwNcqlkf7VTBL+I/rcBvM2cweyc0gXREKQ9Q9+7Knc+S4bFXBkTe7mXKmc
	Y3nZA0P6iEGQNp9jHpjVfchP1H2E4Vmkmtl81VPdE3zPenYtYCqNIz+MkvW8tpOXRGP4
	s5ST72dFdxyipP4fFHG+cw7wrJJ3JYZ7UaYHOweJ3hf5c2kADswdGBArOrZCwh3QPXD9
	F9n4/o7nEBsm0y9rI0yZa0sxH5QO5SSjOdqlufJMsfmzpMF6hQWdgxJqYYDU4QoOAf2Q
	a8WA==
X-Gm-Message-State: AOUpUlHZUvvxrnFVkHPFi9c6lzeJXNVbrlpY5+s+b+o/iPsbNm2hUG9g
	YmESLxkT52n2WBNAVafsVlMZmayFrBo+BYOX9fQ=
X-Received: by 2002:a19:ea5c:: with SMTP id
	i89-v6mr2026652lfh.19.1533735956850; 
	Wed, 08 Aug 2018 06:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-5-geert+renesas@glider.be>
	<e52bfdab-5c23-a617-8bef-0c17ab831ec1@redhat.com>
	<CAMuHMdUuHcoZxFVFivBwD3LveeE8yQ+AnaWFr76kATG+rCzd=w@mail.gmail.com>
	<9305142a-8b88-8beb-dd95-02dd84881aa8@redhat.com>
	<CAMuHMdVFT5PuXGVuT7wobJd_m1X8SvY+XohJWNtB7b-59JXKhQ@mail.gmail.com>
	<ea6551f6-517b-4f51-4a50-72430efaad41@redhat.com>
In-Reply-To: <ea6551f6-517b-4f51-4a50-72430efaad41@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Aug 2018 15:45:44 +0200
Message-ID: <CAMuHMdWG3WWU7mve9P_kupj=O-OJZF8V1xkoh1XEEpDu0vNStA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.167.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/4] hw/arm/sysbus-fdt: Add
 support for instantiating generic devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jVBWCdewHP+v

Hi Eric,

On Wed, Aug 8, 2018 at 3:16 PM Auger Eric <eric.auger@redhat.com> wrote:
> On 08/08/2018 02:59 PM, Geert Uytterhoeven wrote:
> > On Tue, Aug 7, 2018 at 7:21 PM Auger Eric <eric.auger@redhat.com> wrote:
> >> On 08/07/2018 05:32 PM, Geert Uytterhoeven wrote:
> >>> On Tue, Aug 7, 2018 at 4:19 PM Auger Eric <eric.auger@redhat.com> wrote:
> >>>> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> >>>>> Add a fallback for instantiating generic devices without a type-specific
> >>>>> or compatible-specific instantation method.  This will be used when no
> >>>>> other match is found.
> >>>>>
> >>>>> The generic instantation method creates a device node with "reg" and
> >>>>> (optional) "interrupts" properties, and copies the "compatible"
> >>>>> property and other optional properties from the host.

[...]

> Wouldn't it make sense to try getting 1-3 upstream separately as this
> last patch seems more controversial and independent?

I agree. I will rework and resubmit after my holidays.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
