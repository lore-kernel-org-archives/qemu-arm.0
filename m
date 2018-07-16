Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1983375wru;
        Mon, 16 Jul 2018 15:23:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpepbXodMMMsUF5RDYO+2c2YWGUqIaFRi0h2Kt5itgvwELzutM8HVtjTbnjRU7qJLBRZMPwK
X-Received: by 2002:aed:3e82:: with SMTP id n2-v6mr17010065qtf.359.1531779791372;
        Mon, 16 Jul 2018 15:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531779791; cv=none;
        d=google.com; s=arc-20160816;
        b=q3PnuXmGuQNu6HuuVHWL7RfGDmnEnR4+4mkO/iSRJTf4fy3CuYx+4mX25jzoo8/Wzl
         qZVX6ca0rHgrthHwvTuqDm+Oj6shYKdvoBWdi/9fVoVLuJW+JPU2iCB9gDJb7m6TNRdk
         EIJTGbMGqbdZFE07T0Yd5DDTEV6z+IEzDnWli7f3RONl9NK6cPydgPclhfViEGnPzbSn
         fwRbQ3apuyZAriu+CARDJEvK0iu9B5a4gof7epUxZtvI3ESXtyum1PwnlNXkpHPD1FeG
         OvtnW3tXjTrOR9DRhgNHmFA1XcIO5K7t3Kns9o48OGFV9gYn4bIXrQN9lRxaZyPOFPAq
         FxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=ynG2soTi/6XjKrqQmgaTaeb1oNjru8zCaiP4pkJyF9I=;
        b=q+d1rvaD2jp3HkzzaF+TK9nK/IoqXqegIB/qsq8dK9PRtF/K4y5BQwc6UTD0dyNxnu
         IClFE47IrbHxiofVkh04jN5V1vtxK0xdUG++cbowqHbgH1oEEGstH/LCvha8lX/QCkCc
         uia0pNYQmjgU0rs6tuw6/+Zt3eqHnJ/VjIcLWoXW22SiUxnmH02KaLOqpS4KJhjLwJnC
         m/in/sNqdX/Ynb0212x37POwT9Q7hsr3TvTDg4NoHTLW5RMvDH9T+IJeTw+XOw3nwC+5
         f1nDS6LgKcBu3CX9QMAOPA0k3C6fE5nhdYokEU0aUeKXmGd3YAXsiDek0an7d5iQHBZQ
         qGZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="KvTEOJ/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o37-v6si6223739qvh.216.2018.07.16.15.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 15:23:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="KvTEOJ/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBte-0002qX-Tk
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 18:23:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1ffBtR-0002qQ-Fz
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:22:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1ffBtO-0005le-C1
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:22:57 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1ffBtO-0005lG-4s; Mon, 16 Jul 2018 18:22:54 -0400
Received: by mail-pg1-x544.google.com with SMTP id x5-v6so8062663pgp.7;
	Mon, 16 Jul 2018 15:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ynG2soTi/6XjKrqQmgaTaeb1oNjru8zCaiP4pkJyF9I=;
	b=KvTEOJ/Pu06NDPZzIu6btA9Sahg2duUTiWTx3zOcJQLNbIfGg7FNc4yPVRRQem4cCC
	IGjulcKSZabEtJoEfNzXiznebmnTWpATT0X5jgpCRorpV08wPQJc15baGi96ciGe0EKq
	KksOm3ojYi7NOG/U/GwNxGefKsfGwOip+lccV0smf9kb0avAo4Dv+cAnbZhdvaNLB4Tb
	NuQ7g1lYB216sjagCOm3kS+RNne/H73W1Ohil3jau3wnT43abr3kP3S6ydUNjZjS6lcl
	DNKcrkIlypZPvubL3CseiAPruyRFrFyYfy3Bx7ONfKnLoXOM0ya4qXS7ZwmOwiGsUJ6s
	zDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ynG2soTi/6XjKrqQmgaTaeb1oNjru8zCaiP4pkJyF9I=;
	b=ou86Yd9JIKTAIKxjieQq8fwxyy8PdCUWsMrWadmoK7PmsOhBrlkqx8V2vM1p04LK56
	3aPfXhmurXuHTKi2fqrEU0yRiUjWxs60vMslBrraskTXGH9SvuSms8+H/QelXCNsiMUB
	y6iPsobanMrbqIY8kOhrvfiRzQY5aCxNkuz+OEoeqzyaU+EPMpaYJ/nmgSbxAN+vb4lT
	D6bp7oO00fck5xWc1xFjUhnHbcsPk7saFTSNNh7zqfNaNrWboj3R1Ge2t7HyWJ0vWyN2
	AGtCIWxP6I5Ap7eeLlcUGbI8squMbx4YTYGUVRpn9meeJWStEhiGkuz8GBUWsxMDepEH
	PsLQ==
X-Gm-Message-State: AOUpUlGyD2AoEtrUKMhbLqK9jn8NZqg94b0nbRl5pETL8JwXoMEVpeOW
	MnHBGgDJNVNeroOc5kZGfarBxQ==
X-Received: by 2002:a62:b40c:: with SMTP id
	h12-v6mr19970654pfn.18.1531779773092; 
	Mon, 16 Jul 2018 15:22:53 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66]) by smtp.gmail.com with ESMTPSA id
	o3-v6sm29380492pgv.53.2018.07.16.15.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 15:22:52 -0700 (PDT)
Date: Mon, 16 Jul 2018 15:22:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180716222250.GA20320@roeck-us.net>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA9W88G8rd4iMq7qsNd2C2fRiYJ32dVooZLyzY10__5piw@mail.gmail.com>
	<e893ae38-9294-4b54-e950-6632b6b73532@roeck-us.net>
	<CAFEAcA_Vd46APz_czOP+OfB1nkGvGjuf=EPbB57TkkXKWkNxwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Vd46APz_czOP+OfB1nkGvGjuf=EPbB57TkkXKWkNxwQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman
 (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+9M+wzs17JB

On Mon, Jul 16, 2018 at 03:07:13PM +0100, Peter Maydell wrote:
> On 16 July 2018 at 14:51, Guenter Roeck <linux@roeck-us.net> wrote:
> > In this context, I can't get mmc to work with ToT Linux on raspi3.
> >
> > / # mount /dev/mmcblk0 /mnt
> > [   47.099074] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> > interrupt.
> > [   57.339803] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> > interrupt.
> > [   57.390449] mmc0: Problem switching card into high-speed mode!
> > [   67.581559] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> > interrupt.
> > [   67.587832] print_req_error: I/O error, dev mmcblk0, sector 2
> > [   67.588908] Buffer I/O error on dev mmcblk0, logical block 1, lost sync
> > page write
> > [   67.610307] EXT4-fs (mmcblk0): I/O error while writing superblock
> > [   67.620842] EXT4-fs (mmcblk0): mount failed
> > [   77.819114] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> > interrupt.
> > [   88.058917] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> > interrupt.
> > [   98.298937] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> > interrupt.
> > [   98.303554] print_req_error: I/O error, dev mmcblk0, sector 2
> > [   98.306044] Buffer I/O error on dev mmcblk0, logical block 1, lost sync
> > page write
> >
> > Any idea what the problem might be ?
> 
> Same thing again -- no hardware documentation for that sd controller.
> We took our best guess about what the behaviour is supposed to be
> for raising hardware interrupts in commit f3d9fe8f959643 earlier
> this year, but that was (as the commit message notes) pure guesswork
> based largely on what the Linux driver was doing. Somebody would have
> to look at what exactly this version of the kernel is expecting the
> hardware to do and try to reverse-engineer what the model needs to do
> that it isn't currently...
> 

This failed for me with all kernel versions I tried, starting with 4.14.y.

I'll send a patch in a minute. It is just as much guesswork as before,
but AFAICS it does work.

Guenter
