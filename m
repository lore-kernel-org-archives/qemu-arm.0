Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp652615lfm;
        Fri, 26 Jun 2020 10:32:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpP5moK7Yn2ioV+lEv6E5Vn3xfWHWeigRKBgakUAJsVlAor2G32ndRvQggWDDQDbZI7jxL
X-Received: by 2002:a25:4e0a:: with SMTP id c10mr6372371ybb.346.1593192759993;
        Fri, 26 Jun 2020 10:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593192759; cv=none;
        d=google.com; s=arc-20160816;
        b=h4s8RBaEGeHL3EuT8VkB5SS2onCzXSkLdokeh7yF413b0V5T9frdYHoxCT77CyNHAT
         TV1kZQy+jaSTStfSzV+UJRdH2dpjFHSCZ0E20A00Pib8/isH/Qy1VJEkY9Oh8kTWN87O
         LBeyTT11cOnGx6rcnKrn5/FLsP1X5SsE2VBu3a+1YZfUuQQ+yw8i8P7S13UHC0XVZE4p
         Rl7/eIxQIPuE0GBkgZCP1yj/8LF9LZpdVFPhOf2dYWIj4mGb09/3BKoR77Ctyv8J7fMZ
         jq/l5oMPljddxRNLIQL9eeU158Fh/cd2rijZ/kX+GarHps104pE9Br+JMc5qYjUeJ956
         PniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVT4MFE3mhEzGU4xpJZAgxUlBlMkqbFTX1eeNNTZMsE=;
        b=jZ+np/OE5r9kppZQagRm5N1GKSVz22z+W3wNKdx0jms1Y6qcMWsHZO3uVQV/Qa8UK9
         9xWalGTGMPtd0ua9B4SsZDH2F2NBfcnRY6rxD6PF/U9x/aT6YQYa691nli3+Wg3SnX6P
         cFmnkDNwIcSs9Yd9A3m+FzJAFmDdnf+ItcH5eBc2NOMNXzPOlbbRxd4XDQQQ3pr7/vK5
         yBqNu0YSuNN4JM5HFr6YffCQBUzCdHQXsAjGPn4KOjP5QXZhloeO+7FS8Szig705UIxX
         S3idjGeioARZBXX9kJunjoXFpWP/F9PswghoPnB/oVGrrtYsFJSAeGczsJJcJlrh5V0V
         zi+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dHo4vUaJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si23933142ybr.60.2020.06.26.10.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 10:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dHo4vUaJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1josDP-0005Zp-9A
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 13:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1josCg-00058y-1S
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 13:31:54 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1josCe-0006FY-6b
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 13:31:53 -0400
Received: by mail-ot1-x343.google.com with SMTP id n5so9364710otj.1
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 10:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVT4MFE3mhEzGU4xpJZAgxUlBlMkqbFTX1eeNNTZMsE=;
 b=dHo4vUaJQdOL6b2ZcBdVG/cdLz33RPxAmHpZatkKHppweGw5MpCtGDm82ZZSJKD20E
 5HeTl/MR5oMgyVBpdp09WgEfFfefto4CZfVaBxHYWbDvJKj9mViD9ihHHDwYIl4QoTl7
 KeqATUo6sA2Msi6yIsehy8m7qD6YYzxgOZn257lRcBDU68zb6oMDccGMflsgZtbYJBp2
 4/jZA8JQ5jLgnAGFuEebglLcW2Eed7Snkq9UH5X4iLKRdgIcOTEx3/H5TpH74dNNTkUY
 kdt/oQX1Ovrojtdh8IqqF5zlqW0E+SXWw7H18XMAL77gZzj0Hk56KBSrI5szLhILczRc
 by9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVT4MFE3mhEzGU4xpJZAgxUlBlMkqbFTX1eeNNTZMsE=;
 b=WbWxkuXgj/6K3OW06YMY74WlIU0Zh0AsQnbFoHQs40wcJii+X1OK0YHF8XSHjP89dF
 /B2l1NNjHQJZpBLVWtoRVoKJMfA/EbWE+KV96JHOoA/MZSg00AgfeWibEQXOngSmS4EO
 DaXvccKxWIF1yQbJY+JtetrWmAP1bmDs9CoZ+YTsqJlJooSQU8l0s4o5tH9W2RKWRaeo
 qdHfDP4ZQOHS/p4+NBNMmcP+6XiwTwMl5UcTUbERFfgkKgBa21evDYGY9451dHKkz3cY
 KK2cQVuB6g+3gpC1wrtsQ+rJnX1Eju7kCAB3xNawPsSwWl2dx32ZZYL0dKekWngjdJvS
 /sGw==
X-Gm-Message-State: AOAM530Wd8NmyzYKEK3f7W26/lHau3/GTDHGRMAiEmuh7Abs3DUlqL/I
 Nmktp4XwYYWhtHKxvwkJN4iGqoG9iUAQ3BuvRvH3iZlsBKs=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr702069ota.91.1593192710529; 
 Fri, 26 Jun 2020 10:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200625230740.549114-1-keithp@keithp.com>
 <CAFEAcA9ut5CVAgRTP-_BK3WpiDSmitFowZMe549TvgSAjj+Kfg@mail.gmail.com>
 <87imfdixv9.fsf@keithp.com>
In-Reply-To: <87imfdixv9.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 18:31:37 +0100
Message-ID: <CAFEAcA_ZRMpqAhR7BL05a+O_C54fhXZn8-+kC_KUU5n3BpzoCw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add 'virtm' hardware
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pp5E3UT9WZeN

On Fri, 26 Jun 2020 at 17:40, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > So, I'm really dubious about adding more "virtual"
> > not-real-hardware boards. We have "virt" because we
> > absolutely have to have it for KVM purposes; but otherwise
> > "emulate real hardware" gives us a concrete specification
> > of what we're trying to do and tends to lead us into fewer
> > messy swamps than making up virtual platforms does.
>
> It depends on what you're using qemu for. I'm using it for C library
> tests, where I need memory and a processor, plus the ability to make
> semihosting calls and that's it.

You might find the user-mode qemu-arm sufficient for that
kind of thing. I know some gcc tests run that way. You
get a processor, semihosting, and whatever memory your
ELF file's data segment says you have (plus anything
you care to mmap()).

> > For instance, this board model claims to handle the M33
> > but makes no attempt to set up any of the TrustZone
> > related components like the IDAU, so it isn't really
> > a useful platform for that CPU.
>
> It's sufficient for my purposes, if adding those things would make it
> suitable for more people, that'd be awesome.

Sure, but "machine-that-works-for-keith-packard" isn't really
a very clearly-defined concept :-)

> > This is the kind of area where having a real hardware system to check
> > against means we make the right choices about what does or doesn't
> > need to be present.
>
> I have tried every single 32-bit ARM emulation provided by qemu and none
> of them offer enough memory along with the ability to select an
> arbitrary processor. The stellaris code is the closest as it allows
> overriding the CPU type, and I've been able to run most of the C library
> tests using that. However, both boards supported by that code have a
> small fixed memory size, which isn't large enough to run the full test
> suite (the math tests require over 1M of ROM and RAM).

> Instead of creating another virtual platform, should I be working on the
> existing virt code to add cortex-m support?

I think that trying to weld M-profile into the A-profile virt
board is likely to be more confusing than having a separate board.
But I remain unhappy about defining a virtual board at all
if I can avoid it.

thanks
-- PMM
