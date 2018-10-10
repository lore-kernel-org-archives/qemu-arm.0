Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1073608wrt;
        Wed, 10 Oct 2018 08:03:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61u/Lla8eD46LNniI8ZD/MsZJqHImFpo0nRrwdiZLTlVt0V0Dqkc/ImEgye0Wm218usXMH4
X-Received: by 2002:a37:28c7:: with SMTP id o68-v6mr26390297qko.350.1539183788614;
        Wed, 10 Oct 2018 08:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539183788; cv=none;
        d=google.com; s=arc-20160816;
        b=ujBx8k3C7LuP6/1kCs3KSMiOhw2rblIbwaLKC5MHjWDYkwTiJs8WOAhCuYdeTmIdpi
         n3AO8MTBJSURKYO65MwlJLXnYvOYfTPI5+LeEAQaMYQVTvkkA9nzY6+RAXx0fOuhH+Kk
         TvGSsup2/JUpRQutQB/IlZ3qzo+C5GtWMsyUnJKy/0jXOXDVRN+MfVOtxuX7hzutM3Ll
         ci4WVzzKBsdcfVR1iECaUeiyDAmvRJQBPb16wOMBT/Fgmt7SJaG1pXr3oC9XeN8hgwIL
         U/8R1rNQabvWo3j2Drj6/7fgv0eff3Cq3TLjUAJ1SlTir/rpxA1zqCX7YS3DumYyQ2gE
         NqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=GTo71vPgIspclqTvvFfzPFv/4Ot8kBepGfqX6Z8HIxk=;
        b=Ct8LRUT/s7WvaCU2gJf3LPnLq/TLyVOnhJoTHK489R1K+/6TeYjsuwMsV7r2QqB5aW
         /W0/jSy7N9jx2LXx8YUJMnDtUP/97Ax/ro2RHbyRrH44RcS3UsIcqkZC47JIIz+kDhTw
         hfWqVUBGnSYPm9zDbHro/fcx1J0LAvZnCYfhc1i/pVvYWEWtmA04kYDII0S/PPHyD3P5
         DJUgwWpP6MPmgUUIMp67C7W6rjxcDXKLoVp3YexowceJGoS7tXNOHMe7QIcJsu2+iO3Z
         iOlMk3squcVzCkCpqKxUVq+bRKK0UZWdxAFMj+iX3Tg1dWQepB8/CqF0LQEf7nHbdd2l
         qAcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VdsegMwq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15-v6si6086627qto.106.2018.10.10.08.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 08:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VdsegMwq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAG0y-0000Qq-4r
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 11:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gAG0k-0000Qh-Fi
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 11:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gAG0g-0007tS-07
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 11:02:53 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gAG0f-0007sg-Pp; Wed, 10 Oct 2018 11:02:49 -0400
Received: by mail-pg1-x542.google.com with SMTP id f8-v6so2652184pgq.5;
	Wed, 10 Oct 2018 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=GTo71vPgIspclqTvvFfzPFv/4Ot8kBepGfqX6Z8HIxk=;
	b=VdsegMwq57getGF6wl0hl15j0pGA5OU3bZHXo74IZjMTOhMbSyNoifgT3y4sX8/FXG
	sokcmCei/RdYLU8BEt9BTym3YMLkK1HhzU462GpGxxZk1PQUuV5gZpoDPREzPnhL1Vm1
	ufp6Y38ErrLMg5hrG6KEvr1wN1vxor+etgNSQj3NykIe0/VQTw8n/XQCxzdIRaX0Q0Qu
	q4oGzhuTIt0GLz47/6OP65vXptvb4Zu/PUyT8gdG5vej3oPt6IoLeYyVR7qpHA0PEQXs
	gZcmnz0NeypXRbiPppqptf+xopSPfWSJpgoHGNvNaHhTEqn50eoF+2reNdeb9FCym5Sv
	yNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=GTo71vPgIspclqTvvFfzPFv/4Ot8kBepGfqX6Z8HIxk=;
	b=RZkFXDEO6Z66u1Z/l8z1cMnClAdXk+09tVEX9qz7fUuFWLbVIdHyP+WI2q/Uw9e+Uf
	EeX7/CvaebAagZebusllPUCVk9VebLCHzdMbgeeh/wDojuWpS7+NsktYH4FuhDZ3NTB8
	WDtfDvhuNbeBldB56OmxGzvr8Tjd2/WxFz16cs+u9utUh9+xLOk3sGPpHtO1SiNDHsK7
	YVx1YTZAH6+pd6FQfVshyLw2eSRSI4UKVqESr0N18R8GzQiFf3PGO25R0KVcLG3G4Lbt
	Ha1geGJIDCBs0WxJqzA3vrOH6V2lhAXpAFQ9l0EePghzbplmKaA4AmNb3vPSq19E1Pob
	8amg==
X-Gm-Message-State: ABuFfogrsZMjmE+GZa9cQehdWURaEofI7FXOglV0YSty7e3ZqgSJ0hYK
	4Pu6rHPobvro/PJShFhir6w=
X-Received: by 2002:a62:6143:: with SMTP id
	v64-v6mr29272280pfb.125.1539183768501; 
	Wed, 10 Oct 2018 08:02:48 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66]) by smtp.gmail.com with ESMTPSA id
	d2-v6sm35000376pfd.100.2018.10.10.08.02.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 08:02:47 -0700 (PDT)
Date: Wed, 10 Oct 2018 08:02:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20181010150241.GA4418@roeck-us.net>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
	<a98fbbe0-ead2-b32a-54ee-8aacc08ed7a6@amsat.org>
	<2955b0dc-9730-4d54-5c26-bcb18002373e@roeck-us.net>
	<CAAdtpL6c-_=zHqF1vBHVgM9=DA3PMYu1HX60oCy1DrzZ-LRVmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL6c-_=zHqF1vBHVgM9=DA3PMYu1HX60oCy1DrzZ-LRVmA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Luc Michel <luc.michel@git.antfield.fr>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DIsjaIQc7BJd

On Wed, Oct 10, 2018 at 03:25:22PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Guenter,
> 
> On Tue, Jul 17, 2018 at 6:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 07/16/2018 06:53 PM, Philippe Mathieu-Daudé wrote:
> > > Hi Guenter,
> > >
> > > On 07/15/2018 07:06 PM, Guenter Roeck wrote:
> > >> Add basic support for BCM283x CPRMAN. Provide support for reading and
> > >> writing CPRMAN registers and initialize registers with sensible default
> > >> values. During runtime retain any written values.
> > >>
> > >> Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
> > >> and raspi3 systems.
> > >>
> > >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > >> ---
> > >> I don't seriously expect this patch to get accepted, but I thought
> > >> it might be valuable enough for others to use it when playing with
> > >> raspi2 and raspi3 emulations.
> > >
> > > I've been working on a very similar patch... But due to soft-freeze I
> > > postponed it.
> > >
> >
> > > I don't feel very confident with my local work, as you, it is based on
> > > looking at the Broadcom firmware [1] and how the Linux kernel initialize
> > > the devices. I'll however compare with your work.
> > >
> >
> > I'll be more than happy to drop my patch and go with yours instead.
> > Let's just do that - it looks like it is much more comprehensive.
> 
> Did you make any progress with your work?
> 
My patch works for me, and continue using it. My suggestion above was
for you to finalize your patch and submit it. I did not spend any further
time on it. Sorry for any confusion I may have caused.

> Your patch might be useful to solve the following issue:
> https://bugs.launchpad.net/bugs/1779017

Yes, that was one of the reasons for writing the patch in the first place.

Thanks,
Guenter
