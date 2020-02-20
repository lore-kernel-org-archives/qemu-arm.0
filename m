Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp774846lfg;
        Thu, 20 Feb 2020 08:49:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwraZ8Fyi+/w2PseWKIML0HubachA7AuLAt3UIwUmqJfco+yCF9eSyOvFYh37bIyypJZJQF
X-Received: by 2002:ac8:38e6:: with SMTP id g35mr27861956qtc.120.1582217377479;
        Thu, 20 Feb 2020 08:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582217377; cv=none;
        d=google.com; s=arc-20160816;
        b=OHKe9tNTzXL6cTKy3P6aw7+4hOnHrcXhNJDcBwUpdRoXsuvBdtAPQXsHq6o5tOJ4IO
         TA3TkNQxHgmnxfmH3euJqDwDhOGzXSfn1tLk1kHiOyZwBxLrHXWIItLzOgIHuWWtNERe
         QLEyreW7hTot9DzzNT7jQwgmi+QKneguIg+O/Ad0wamDZYMqcxOeAC+Y9zJynpFfXtjU
         V4s9gq0wfcegpLDF9hnLlGXu0KAatUpB5OvJtprGT8lpgDbL5JZsGUIMOZOdYmDEJLbZ
         ErigRy6ZagahE8v3NReNwE9ZF2eeIqWMICgu2hPictys/Kffs2KHk2gqya6RqWNrh2Xa
         0JHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UBJTtmaVHjCje4IQAZRXqmLtw7W5gnalWAcuadbspgE=;
        b=T4FK/yvUQ/kU6tIlfiSuDZWhfsxjHY46mq1fB8D9Dn0XsE1lDbS/hmtcavM8oDPlyx
         h7AvYoopMIfvPIR9oRQPuuyvINtu2hr+dnbdgZpP3pN/LrurLoba4RmJ3Q5heIRuPPBD
         uITsG9qtpGyke0gGOCMaVh8wgyJqzF5br2hGEgv7ddcvd753UJhHqLTKRvzKrH3NY+Dm
         yNdH1Rg8NjP2pv8BBc9yq/pdW/Z8K7mRp0C7o3hkIFMU3BonvS2hiWtlVLJSPGNFLHKd
         dBpFhg+zX6zk1qdswiZ9/okJjfTCrRuRCIEwn85hieTPRwGi8PQZL4ebrEUSxUj3+7Zw
         hlQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nxQyZ+6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n139si29246qkn.164.2020.02.20.08.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 08:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nxQyZ+6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4p16-0003Fb-Te
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 11:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4p0y-0003Ba-4d
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 11:49:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4p0w-0001ma-TV
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 11:49:27 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4p0w-0001mM-NZ
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 11:49:26 -0500
Received: by mail-oi1-x241.google.com with SMTP id q84so28214120oic.4
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBJTtmaVHjCje4IQAZRXqmLtw7W5gnalWAcuadbspgE=;
 b=nxQyZ+6o/qPkh+vuDtD8NaRxXc/gbxMiU6R6pL1HT7AfKLTlxtChbfgkepof5tv9rI
 UmqPu/ZjTphruIQ2tDvuU3uiGh4Hv6H+kFCMvsgu67kcHem5NLHQIwXZR3/piaYCqy2H
 FpitLqpopfCDhn5uTJXYNEMQiMBiSz3ZnIWaSu14d9uE74+r/K/prwYNmX3cjeih6ov9
 ttnrP1O3yl6Va9mIoVHKnV3HMoeLe0HbcqDAsflZeFEM7S4YkPobiDTiZDG00yGJ6jJJ
 H0HFvDkUE9oQw03lpPoZ+DQpwNQchNE3YWP1uf1lmFJlDvRF/bDuO9bXAttIVqlaNTpf
 yIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBJTtmaVHjCje4IQAZRXqmLtw7W5gnalWAcuadbspgE=;
 b=NLIx+JNkvzmSw9mAY93XyLA5D+CFhgM+3+J/FYlgDlApR+FayZrOG8ZPb0cKT69nqs
 3O8oz79ya3BQXsOZfE05ueNbnxNU4Ivbg9QtUCu3/Ufx/JjO0HNqBgHyd+idEuoQfVOm
 8eG0xGJlP0AfX67QjW4fTSB1cECb6/2NsRVadiiyATnjaf3BABfyMpeGePcpWj8/x7Ir
 fY6JVn32Y9ezK2TjSE1WDtVNx/AW3JPELkWA9vyFSLGhdXviws+w0Geo64Ub5tLgN0yY
 RfiKidJqePdHLgT5d0PDa8I5l6Epc9E9U6RvWSIafcRx4BXkwrpw7dpmbZobs7nzLRmK
 cpVg==
X-Gm-Message-State: APjAAAVRgYQ54y65fIuPEwf2j5pfqgrl+bnVcPzb410GzfWcXI9M6HWl
 PeUb/fRLgxg1lXLOowPr5YMmm2Bna+TYY/aJ2dVu/g==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2664948oie.146.1582217365873; 
 Thu, 20 Feb 2020 08:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20200217032127.46508-1-pannengyuan@huawei.com>
 <20200217032127.46508-2-pannengyuan@huawei.com>
 <20200220165950.3a5ec74a.cohuck@redhat.com>
In-Reply-To: <20200220165950.3a5ec74a.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 16:49:14 +0000
Message-ID: <CAFEAcA8ZcCEWn0xKiRQ8n3_sQQ2r12fwi_5Qrj0POUfW_70V+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] s390x: fix memleaks in cpu_finalize
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pan Nengyuan <pannengyuan@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 mav2-rk.cave-ayland@ilande.co.uk, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 Richard Henderson <rth@twiddle.net>, andrzej zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7W/zDE1zBu8j

On Thu, 20 Feb 2020 at 16:01, Cornelia Huck <cohuck@redhat.com> wrote:
> I may be missing something, but what cleans up the timers if we fail
> further down in this function? I don't think the unrealize callback is
> invoked by the core in case of error?

FWIW I sent a mail to one of these threads a few days ago
where I claimed we did call unrealize if realize fails,
but looking again at the device_set_realized() code I think
I was misreading it. If the device's own 'realize' method
fails, we go to the 'fail' label, which just reports back the
error and doesn't call unrealize. It's only if the device's
'realize' method succeeds and we get a failure in some later
thing like calling 'realize' on the child bus objects that we
will call the device unrealize as part of cleanup.

Apologies for any confusion caused.

thanks
-- PMM
