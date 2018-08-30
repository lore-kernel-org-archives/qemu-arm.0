Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1535886wrd;
        Thu, 30 Aug 2018 01:31:21 -0700 (PDT)
X-Received: by 2002:a1c:3545:: with SMTP id c66-v6mr1110541wma.120.1535617881329;
        Thu, 30 Aug 2018 01:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535617881; cv=none;
        d=google.com; s=arc-20160816;
        b=aNEfqbir01pAMwBe8dG7B9p79Ip4kdjGzYA3dLmCplPXimmw4Qd31t1Sw7+0g1jARn
         wp+L6FOWxhXHfMyR1Lih7EDP8EMv3sq3NOJGC1PTxCA0SkRqfQxvdyssgIf+z2hNilMg
         M1rX1OYXXpCd329VhEsi41MBH7C4aeL1WY0urvhBOREi/pB+q0D+9f1FjLm1Easm8OC2
         +2on+SZumJI2RZKIY99shMKTzm3+Fr2xL2qxLzuGrN64exHw4Ou6ZyqGpimgQ0tmUMLJ
         Mnx4aZypc9+J6B5Os9i6hm79MD4OJb0QhGEoMdkBAfnayrNVNl7QoUFPT1ayxp5G/lF1
         zGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=tx2qkqPUEFcdZHlQi99ifnIDfBqmaM+Q37gdJSFzF3c=;
        b=EpzzhBbvfBkP4iyGrj78I3lLUclp0u5R2tZWYaNCB+KFc6NAIoLkQxWmLX2/rZQBBQ
         i5NQs4ZpaMwnul1YfrU577hN7XrmuHKPwuYlTrDMEp8hLZK8v6ZjyZPQRx0o50zRyA8V
         V8Tx8Jck0utfAFQA9xL1mzrJWyGBE7uw2iXNrTvOv12tvy/SvUqMATv1T0Ck/LWpJ75W
         J5yBfv4U1EVHEdv8+pHJhlRQt7pnOPWFHdrPMwi3rj1qHj6BIsdrMgYu5Ws4FW0fYOLT
         sqtuf5BfzJXtZcZviFFhD1FRe6R47u9WSqA0mmuKwP8qA9vHJM1TgyLPSfFrln7Svep2
         qpcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvW2pRBk;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <leif.lindholm@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h14-v6sor264163wme.32.2018.08.30.01.31.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 01:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvW2pRBk;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tx2qkqPUEFcdZHlQi99ifnIDfBqmaM+Q37gdJSFzF3c=;
        b=kvW2pRBkybmxUeoOAKffo4rd87S3GcGzmanrgjGy2f82rrlNcGES1kautKOaYUa5Xj
         geRXuxGY+c1m7c1o15XVmh3zG2PGE6V3Jmj0L9m5QKfBSgD9vVBloaX3KT3yzwWSSLtc
         d7Ylwc97ABbliuIdqU6Y3LhXKsQb8lxrBnUj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tx2qkqPUEFcdZHlQi99ifnIDfBqmaM+Q37gdJSFzF3c=;
        b=WoHDeHpuYuWjAmGMFm5FUlVCtBGESh/ka1Qfqm4VyioZSmcziAiW1X+/pNnEhv+6G2
         HForudDm5XgQq6IhlIvsF4Bg17ozaqNAhH7qRhifne55MX2+nOQADCn8TpFMLg93ZTj7
         c3Ju12gP8027T3hULt1rZSk/EcT4QpPolRwrbuT0MQRtMANZEPxbqMq7G4Tnk4r9RODA
         fgQolzm3cQSPBHXJXm1YYCJq6psM519YjWZ4p4F1XWrObBYZfA4XPW0M7Lw1J0NqgS7a
         kmBExO0T7/0sbyVl9nD9auAl9wzdi/Z4AmY8PU5XiSQt/oDEv4D8qfooUnUpRfEeL5pU
         Vy1A==
X-Gm-Message-State: APzg51AoBHU11P7z6WJNopx/UhmWnxN3F8jdmFlSD9sfEMeZX0xUwy9v
	ApLCrEDk8JR8gYEf5ppdX6cg76t9
X-Google-Smtp-Source: ANB0VdZfM72U5ly+PKjmU5Df6gcpIq9Eoo7ki/+QrCsvgqcdABZcoUV1qXFKOCOvHjcphxnRZA1Amg==
X-Received: by 2002:a1c:91cd:: with SMTP id t196-v6mr340447wmd.100.1535617881056;
        Thu, 30 Aug 2018 01:31:21 -0700 (PDT)
Return-Path: <leif.lindholm@linaro.org>
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id q16-v6sm4765012wrn.41.2018.08.30.01.31.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Aug 2018 01:31:19 -0700 (PDT)
Date: Thu, 30 Aug 2018 09:31:18 +0100
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
 <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: QwgCuriIG7EN

On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
> >> Yes, I am working on the v3, with main changes:
> >>  - machine name "sbsa-ref" (good name?)
> >>  - a separate file sbsa-ref.c
> >>  - don't touch the acpi c file, acpi will be supplied by uefi
> >
> > I agree with the above three bullets.
> >
> >>  - only necessary dt node, no other peripheral dt nodes
> >
> > I'm not sure what DT nodes are necessary. After discussing the
> > ACPI tables, and that firmware would supply them, I thought we
> > also agreed firmware would supply the DTB.
>
> Yes, firmware supply ACPI to load OS.
> But for DT, It is said that UEFI still needs some DT nodes, at least
> for memory size. I am trying to figure out which DT nodes are
> mandatory too, it is better we don't have any DT nodes left.
> 
> @Ard, @Leif, is there any possibility to remove all the DT nodes?
> On real hardware, how does UEFI find the memory size and CPU number?

Usually by asking some form of SCP/PMU.
So until we have rock-solid multi-cpu-instance (making terms up here,
there may be a proper name already?) support upstream, we need to take
shortcuts.

Using DT in the same way as we do for mach-virt when booting the OS
with ACPI seems the most logical choice to me.

The best alternative I can think of would be extending fw_cfg, but
that would then be lost effort once (if) we get to the abovementioned
situation, whereas the DT route comes for free.

/
    Leif
