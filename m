Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5901646lfm;
        Wed, 26 May 2021 17:22:04 -0700 (PDT)
X-Received: by 2002:ac8:4756:: with SMTP id k22mr754613qtp.193.1622074924464;
        Wed, 26 May 2021 17:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622074924; cv=none;
        d=google.com; s=arc-20160816;
        b=XBFy8XC8wHJJLXTavWfvqLyL5qrPAWrDcNmTTPwciPHCafUCVY0MRwf6aE1suy0NIY
         5MIl5TzPtYmdIwUMIROL1LXLzw+oeyDZizOM0EpOjeXz3Od4kpQpErG9xO72rYr75fwM
         Rqf03Tc2VP06kOzKCNeTMWmJaGdLb9SaVK3NWSr+bbXQ2nZEtTsDCPsWWeTKeSTZycWJ
         K23Gps9U58kkwgx4fWWp6OdGBDtdUin6bcuLaH+LAfrXytbQS88ohR5x5ApFCH87NyT0
         ggvlockE/nLJxHe6dJCJ3b8mPi4/0WhSlsOl35RpMgEnkLTaCioK91GaPqqNJ8JVyJRn
         a04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id:dkim-signature;
        bh=uzZtHedp+cQlPLEdc8eg88u7IPR+/vapgBQQs+sWLuQ=;
        b=dUysNb3V8NkC+AfclXdAmPV5uhE/hvCdGB5xDfSLp/NBT6e2ByBKjQ+BYkd0OTU+XV
         dbJzclW7ztIPTnClVwpK/fumy9nu+bVGYSPaRulPoEu1OSckqDxEvTTdJ3n+xMA2Ojs6
         k7Mir9WPQvT3cG9HZFJonF80trxKoPzXvQy6GrHwCaBaSJzNo5ZTS6QrywmW6jLXk+Cd
         Jqe2QI/ybiZPyCmkFHJjsHXQazkui8oM9Z1BYamY8ZcSZKpI3H4F8xPuT+I8hXKMUVAY
         PEHlWEv+3+G0AFerSGYvloI/bk0YXiNtOokpTHJkzgc9FZhP6wTyMuhdCw2xQ0qsIfKW
         htIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Os5C+3fT;
       spf=pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=shashi.mallela@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <shashi.mallela@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 82sor340448qkk.18.2021.05.26.17.22.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 May 2021 17:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Os5C+3fT;
       spf=pass (google.com: domain of shashi.mallela@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=shashi.mallela@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzZtHedp+cQlPLEdc8eg88u7IPR+/vapgBQQs+sWLuQ=;
        b=Os5C+3fTEN+0zGFHoPFbIeWRYnOuylPlai1+beDbXKfMRPjs4R8E5mocf4Sk1unFJM
         K5sWhnb/XaWQgx7PvhXLJIUPr+bQ/B5Mt8T+N88eGRBCv8OL11H4ZAw0mdSJ3wcNxqqN
         U41YrVuBZ3T1Z2hPpZ+m5Ajsd/Im4hWDNVagdi7Bc2RoHWf/A/qEMj+5OY3A9iRgjcm3
         xHA82/5kTN34QV3qH00TvSSClfGMKCmZPUVRcR/ECRCH/b1nYEV/VMK+mgMSBS5Yxv2h
         ChndRZJJtyu9roqsLi66Y76c++3v/DY4DpaCZisVa0y6LhIY3eYlBsgnbSHkeTud5HHZ
         f1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzZtHedp+cQlPLEdc8eg88u7IPR+/vapgBQQs+sWLuQ=;
        b=amDTCV62Omaj7Z4Trm0xg1GO43CVl9dC/0wXUax6ANqZfJGHeaQFs0Mfk3bEbSIt30
         dzIi9Mw/vSxtG5fvKGY+kO35NOVRA0qM/oUSAX3iaZBKVEPPBemTn7n+uolgGAH7HIZO
         KeHGCgNC4DPkX98GLGSayR1x0jC3P5exi5UFxHoPeDlh/YtxxukfTZZxLzgPaygLtIaA
         1FGus91e/+ZK64sYrlbnleVP2dW9pBC1xoxFrzjxqlzY2JIQ4nc4Rc9xORuE0SrDsGuS
         8zUAGG+nhFvpd6f3Q+aJaEmT2Z3PwVrTK9se1Rn+RTfJwS4+Q+vNHhlGzED0J5zsT3g8
         SSVQ==
X-Gm-Message-State: AOAM5329K0sWWxXVn9ejDV73ZfIkGb0HXKrwpAuTqlxVY4BCFwyaFIKH
	YvsM6UDCn68jvk+ia+k0ZeZoz1jX/um0kSRQ
X-Google-Smtp-Source: ABdhPJw7oEKyIALBBjj/hLgZm6uNGFts1WX4dwTSr8XkUvpF8ZBIP8zsO/WuPHJQKE6avIkZBc1OCA==
X-Received: by 2002:a37:f502:: with SMTP id l2mr771618qkk.195.1622074924039;
        Wed, 26 May 2021 17:22:04 -0700 (PDT)
Return-Path: <shashi.mallela@linaro.org>
Received: from localhost.localdomain (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
        by smtp.gmail.com with ESMTPSA id 90sm410371qtg.9.2021.05.26.17.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 17:22:03 -0700 (PDT)
Message-ID: <add9e05d69d51cc89950bc4dfddc955957a6c31f.camel@linaro.org>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
From: shashi.mallela@linaro.org
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 26 May 2021 20:22:02 -0400
In-Reply-To: <87czte38p5.fsf@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
	 <87fsya3a7b.fsf@linaro.org> <87czte38p5.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eu7T8DV/zEiG

Have identified the cause of slow down and redesigned the code to scan
LPI pending table and config table right after lpi pending state
changes(SET/RESET) through gicv3_redist_update_lpi() call to determine
the highest priority lpi among the active lpis and save the details.The
high priority interrupt determination logic in redistributor now uses
the saved high priority lpi details (alongside other interrupt types) 
instead of calling gicv3_redist_update_lpi() everytime(as in current
design).This significantly reduces the call overhead associated with
address_space_read of lpi config and pending tables.Testing with this
new design showed no boot delays.
Will share changes in next patch version v4.

Thanks
Shashi


On Tue, 2021-05-25 at 20:30 +0100, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Shashi Mallela <shashi.mallela@linaro.org> writes:
> > 
> > > This patchset implements qemu device model for enabling physical
> > > LPI support and ITS functionality in GIC as per GICv3
> > > specification.
> > > Both flat table and 2 level tables are implemented.The ITS
> > > commands
> > > for adding/deleting ITS table entries,trigerring LPI interrupts
> > > are
> > > implemented.Translated LPI interrupt ids are processed by
> > > redistributor
> > > to determine priority and set pending state appropriately before
> > > forwarding the same to cpu interface.
> > > The ITS feature support has been added to sbsa-ref platform as
> > > well as
> > > virt platform,wherein the emulated functionality co-exists with
> > > kvm
> > > kernel functionality.
> > 
> > So I'm definitely seeing a slow down in one of my testcases but it
> > doesn't seem to be HW access related. Via:
> > 
> <snip>
> > So I ran with the hotblocks plugin:
> > 
> >   ./qemu-system-aarch64 -cpu max,pauth-impdef=on -machine
> > type=virt,virtualization=on,gic-version=3 -display none -serial
> > mon:stdio -kernel
> > ~/lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image
> > -append "console=ttyAMA0" -m 4096 -smp 1 -plugin
> > contrib/plugins/libhotblocks.so -d plugin -D hotblocks.log
> > 
> >   collected 130606 entries in the hash table
> >   pc, tcount, icount, ecount
> >   0xffffffc010627fd0, 4, 10, 3998721 - memcpy
> >   0xffffffc010628288, 2, 6, 3984790 - memset
> >   0xffffffc01062832c, 3, 4, 1812870 - memset
> >   0xffffffc0100a8df8, 4, 4, 1743432 - __my_cpu_offset
> >   0xffffffc01015c394, 2, 4, 1304617 - __my_cpu_offset
> >   0xffffffc010093348, 3, 3, 1228845 - decay_load
> >   0xffffffc010093354, 3, 3, 1228447 - decay_load
> >   0xffffffc01009338c, 3, 2, 1228447 - decay_load
> >   0xffffffc01009336c, 3, 7, 1180051 - decay_load
> >   0xffffffc010631300, 3, 4, 1114347 - __radix_tree_lookup
> >   0xffffffc0106312c8, 3, 12, 1114337 - __radix_tree_lookup
> >   0xffffffc0106312f8, 3, 2, 1114337 - 
> >   0xffffffc010132aec, 3, 4, 1080983
> >   0xffffffc010132afc, 3, 12, 1080983
> >   0xffffffc010132b30, 3, 2, 1080983
> >   0x000000004084b58c, 1, 1, 1052116
> >   0x000000004084b590, 1, 7, 1052116
> >   0x000000004084b57c, 1, 4, 1051127
> >   0xffffffc01001a118, 2, 6, 1049119
> >   0xffffffc01001a944, 2, 2, 1048689
> > 
> > So whatever is holding it up is because it's heavily spamming core
> > functions.
> 
> Well given I've seen it hit gic_handle_irq > 1000 times already while
> in
> the "PCI: CLS 0 bytes, default 64" phase of the kernel boot makes me
> think the IRQs are just re-asserting themselves and firing
> continuously.
> 
> Indeed -d trace:gicv3_redist_set_irq shows a lot of:
> 
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 0
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 1
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 0
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 1
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 0
>   gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level
> changed to 1
> 
