Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3668100lfq;
        Tue, 22 Feb 2022 09:06:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo9TvZl4n7mkEbyj2w76DadYuAGGlopHPtwCxdRcpmBn5eG0vVZ4RYqm+3MPjV+TDVt8yh
X-Received: by 2002:a37:640b:0:b0:607:39a5:5933 with SMTP id y11-20020a37640b000000b0060739a55933mr15336548qkb.637.1645549572950;
        Tue, 22 Feb 2022 09:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645549572; cv=none;
        d=google.com; s=arc-20160816;
        b=rGUPdLYnL7spCxBT0utK2DsN+n8Xj6ilHxxG9bIaABXv7qiva3NSgORwBdZlS9KsjH
         yTyog0JmlmUnwwvwd0bZISK2W6ImY9pMg7omeJpIWNPtU73fqSySkFfA2bk0ns5UAuGp
         /zKLQZjKPCogJIjio9Kq2Eq7tlNdI8kYDN9I3UrIKeAAjBIfu1ZpF+bk1O/9cpCy7OYZ
         1DXj6rMd8fa46mCfvkdWx9DLUthxb6T5EI10wJaeVLuweaLjN6ehnrBGndXawciL26Rq
         DzDC/eGO39yMWRIbxro2r8UYeaeZAQ2l69Sx6/SQEiT/W5yqHdwUnLiKQDAUgmFxWJ7c
         RfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=xc6UK3xd3nqGvIL5Ugb6vFwMBuaH91xAcbcTlecIp0I=;
        b=wyDQDLi+sNjINYmhv/5YelaKcIFl26RwcXv1FcU0uImiM1CilVn+0HHnes3bTCg6EE
         a34pR4bgxM/0slZ3oGIt/N1NZP9ilBBlkPeo5BVBpDJbpuhwcH3VnyUEPrViEZbUSdti
         yBdzW1EvvCpB0v5zesqjoa8Nu8aWf/gc3UfpIs3G9SU0AXOGi7vZSQLXY0iZEXY16Ztu
         uaYvoS0LR/6sFTSDD+1h3i9+rqjx1lN28JiP0jJbvnl8a5efm6T0m/LJrBedD9Zu1ziY
         nlAP2p0V/hCqkmM6EnvyiZUy1/UcZoJYiH4h5nux0dzJILfL6uBTvChBmnCnk0GtJCF2
         4QBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nOg2uMwx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si137742qvc.246.2022.02.22.09.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 09:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nOg2uMwx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMYc8-0001S8-FY
	for alex.bennee@linaro.org; Tue, 22 Feb 2022 12:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nMYbw-00015X-EN; Tue, 22 Feb 2022 12:06:00 -0500
Received: from [2607:f8b0:4864:20::72b] (port=43845
 helo=mail-qk1-x72b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nMYbu-0005Bw-Jz; Tue, 22 Feb 2022 12:06:00 -0500
Received: by mail-qk1-x72b.google.com with SMTP id z66so349400qke.10;
 Tue, 22 Feb 2022 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=xc6UK3xd3nqGvIL5Ugb6vFwMBuaH91xAcbcTlecIp0I=;
 b=nOg2uMwxzyGwKLrOndqKUGTU9/d8n4eEdcC7QCrG6WT/o+S4VeUN2bfrmaX0mwnWA+
 zn6Q2MFbd8NsfwA65CI1buMMTY+tUpO3I3ezojm1oY4xAKfWNiqaTnZRDctBNaGe5/Ba
 GHd5VCnJxRcYVb2f+IWRP5YchhfCwjJYchcvL/LUWtkgZDh57QlKuwGwQJo6DCY81YnN
 zOwOd8M/MmF71ulxO87ym/vBPnNxYl1xV2QIIg5+ZG7/kYbxPRf1S1lvG3P1M7Fqagwc
 ofDiegSHIhxZuoGhnr0NWcSGviWgN0wLUiwV9vs1KP6uFENMeGuoBypB6NtY2mlJPQhF
 mw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=xc6UK3xd3nqGvIL5Ugb6vFwMBuaH91xAcbcTlecIp0I=;
 b=NVgBs0x5lbcTXACcq0NSJ/zJExHuwnMOvLzPRM7t2XAlJjAwN4WtDQXC8fjSBQEHtn
 oaN61jIo6LhKmbzVScu9lXLEWVbaE3eSRbFUydZGIdrVZWW4MSwN9KVwKMBQ0ESQMPzT
 sqIbdMcGDndiVKYaUspa9xpDGAxXu2PYvUp8a9/yJSXUOPGX9+oZBuSDm9OqFAIQCF5e
 k0sV6OcOictahNtM+MFYfEGmanY8EcyTlJ1bslNT4+GoDIHnM/us7OJuXktZUYzQLpom
 Dh5l4HUyyGPnlQmB53eqN8syMPhs3rLAVXjVlqRDq6yWSP+8hlMHeVQJPSOfd0TCyoJW
 5PPQ==
X-Gm-Message-State: AOAM531MLWgnZqc7lT/zluMGGLWBaRVJv5sscyYP5//CM67xybnNLF6/
 /PUgoDH1R7KDJ3vOwfLD/g==
X-Received: by 2002:a05:620a:887:b0:62c:f00a:b2eb with SMTP id
 b7-20020a05620a088700b0062cf00ab2ebmr11741305qka.336.1645549556718; 
 Tue, 22 Feb 2022 09:05:56 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id h21sm102556qtm.23.2022.02.22.09.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:05:56 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:989e:5aa0:e8e6:e813])
 by serve.minyard.net (Postfix) with ESMTPSA id 497BC1800B7;
 Tue, 22 Feb 2022 17:05:55 +0000 (UTC)
Date: Tue, 22 Feb 2022 11:05:54 -0600
From: Corey Minyard <minyard@acm.org>
To: Chris Rauer <crauer@google.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
Message-ID: <20220222170554.GT2091156@minyard.net>
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
 <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
 <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
 <fff08204-2cd4-0f35-b23d-85a0eeb3ffd2@amsat.org>
 <CAFtMCFWivLhcVD4nPJov=nQb=sOXTtxJ-WeWz91nhtLpJL8fUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFtMCFWivLhcVD4nPJov=nQb=sOXTtxJ-WeWz91nhtLpJL8fUA@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=tcminyard@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 Patrick Venture <venture@google.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 imammedo@redhat.com, Enrico Weigelt <info@metux.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qEBYBkJLkEYy

On Mon, Feb 21, 2022 at 09:47:27AM -0800, Chris Rauer wrote:
> Hi Phil,
> 
> > What about using virtio-gpio & bitbang I2C?
> >
> > - virtio-gpio
> > https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@metux.net/
> >
> > - bitbang I2C already in: hw/i2c/bitbang_i2c.c
> Sorry for the delay.
> 
> That looks like it might be doable with a bit more work creating the ACPI
> entries for the bitbang I2C.  This definitely seems more appropriate on the
> ARM_VIRT platform instead of putting a specific controller in.

I would think the efficiency of this would be horrible.

> 
> For my uses, I will have to stick with the designware controller since it
> matches the system I'm emulating a little more closely.  We can hold back
> the designware stuff until another SoC platform is interested in using this
> controller (since it seems like it is a common one).  Hopefully someone
> will find another use for the controller patches someday.

I should have chimed in sooner.

The i.MX i2c device has ACPI and OF support, I believe, and it's already
available in qemu.  I don't think the Intel smbus device would work.

The designware one is a pretty common and general one, it's a little
suprising that it hasn't already been done on qemu.  I would be ok with
this but Peter has the big picture here.

-corey

> 
> Thanks again for looking at our patches.
> 
> -Chris
> 
> 
> On Wed, Jan 26, 2022 at 3:42 PM Philippe Mathieu-Daudé <f4bug@amsat.org>
> wrote:
> 
> > +Enrico Weigelt
> >
> > On 26/1/22 19:03, Peter Maydell wrote:
> > > On Wed, 26 Jan 2022 at 17:12, Chris Rauer <crauer@google.com> wrote:
> > >>
> > >>> I need to see a pretty strong justification for why we should be
> > >>> adding new kinds of devices to the virt machine,
> > >>
> > >> The designware i2c controller is a very common controller on many
> > >>   ARM SoCs.  It has device tree bindings and ACPI bindings which
> > >> makes it ideal for this platform.
> > >
> > > No, I mean, why do we need an i2c controller on the virt
> > > board at all ?
> > >
> > >>> Forgot to mention, but my prefered approach for providing
> > >>> an i2c controller on the virt board would be to have a
> > >>> PCI i2c controller: that way users who do need it can plug it
> > >>> in with a -device command line option, and users who don't
> > >>> need it never have to worry about it.
> > >
> > >>> (We seem to have an ICH9-SMB PCI device already; I have no idea if
> > it's suitable.)
> > >> I didn't find that device suitable because it is part of the Intel
> > >> Southbridge, which may have some Intel platform quirks, and
> > >> we don't need all the things in that IO hub.
> > >
> > > That's a pity. Is there a different PCI I2C controller we could model ?
> >
> > What about using virtio-gpio & bitbang I2C?
> >
> > - virtio-gpio
> > https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@metux.net/
> >
> > - bitbang I2C already in: hw/i2c/bitbang_i2c.c
> >
> > Regards,
> >
> > Phil.
> >
