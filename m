Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1159201wro;
        Thu, 1 Nov 2018 11:38:33 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cURtr4HF3zU6XNWd1tsIpJ2MLqTtKku0DaImyJN9m/G1Z75a8NGGR30wufTcEQHKELTVKw
X-Received: by 2002:aed:3b36:: with SMTP id p51-v6mr7763322qte.310.1541097513708;
        Thu, 01 Nov 2018 11:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541097513; cv=none;
        d=google.com; s=arc-20160816;
        b=HQO4IUU6xeEdQk01bk6p4f+IlJDuNSJeWXrAzLek0gqiT32YQFUh9z7e1iROvHXmj4
         Wg2X/hhN5Gl76qZLz/Fn8jCmB+eynK3z1TYW2X8SbL71xSUNRnl2A90hq6vX/SMml938
         gLg4Fm3FqJssngOzoVUG5TXta8dQucOPF8SSV9ahbxDiKcSCXysWj6QIYPFVBsTqflaY
         I/+OXbdyWUp+i5m4FuWTmc7zQGMnC+cawaX1c0QS/ME/33JR5gb9MBCQ+WvGDb/K7l65
         kVmpp02I/5gIf43tbi4B/XsAL3ygeNt+MaxGmm4GX5NxHVzGNuW/jPqLgeJ7bcjqp+wO
         dHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=kbo++kmTno7FC9NMTVcGGRsrssypNozEwOXjcHRvfks=;
        b=XQJvZcVAtHXRQroSSntVo3JepaUtDJWCq+MCIkvpOfmIxA5tW2YmCovIGhCU8XAUYj
         MY73sGUiCzLnEnzs5DZdRkbT5vn9ulX5M5LS3r9APemEUh0hzlNaeAIUFd1JQX5onD2x
         dtG06VvumeXdNMeLKOMp439CGYnjGObAwZUWr3Yun27UOP0zzoeLridh7fk2gKRxb9iG
         CaDpcF2ERMhXXd4Rk524zyW4OgVlrVkHOgNq467J9XpCH4imaJLGugtMYizVXqB3WPlh
         IdzLH7srFpdzZMrLLchCRk0MdI0CBB4/GZEVSWh62D2dVmCwKiA/qdpVgZ0bzlhXM4Co
         Qgjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=shlOpatj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c19si3572097qkh.43.2018.11.01.11.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 11:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=shlOpatj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIHrV-0004pX-6P
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 14:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gIHpF-0003Kp-2Z
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 14:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gIHpD-000834-8g
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 14:36:12 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gIHp9-0007zv-5K; Thu, 01 Nov 2018 14:36:09 -0400
Received: by mail-pl1-x644.google.com with SMTP id f10-v6so9361272plr.1;
	Thu, 01 Nov 2018 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=kbo++kmTno7FC9NMTVcGGRsrssypNozEwOXjcHRvfks=;
	b=shlOpatjFWXPT1jMRnnLZjEVP8gw6C+TlYBbJarF49xmDmlwo6MWqUV7Cs3oTskYcz
	xXMsuDZI5ZQNJMlcv/HVJF6BSPMjCbB/dg05tjjOjtwm7B+9XI6TzfvcpCB90TP8N8aV
	dNEDj+yCsYK4fIOFxXLXyJ1RfBcZSUysShhR962VkS1xsTDEefs3pa+xlBOqk/csG564
	0hXsRlS0mmKqNqxwjW1/vZePFxSvrRxQW4ZgEhl0yUgXzKXfJvDQ0SQtvBSri1LdQdAx
	scgZAjG7O5FHLRalOC2RervskBFNDkrL456rY0I/uV67CKqp1G0r7nOcBsxXBRfZcLsw
	PwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=kbo++kmTno7FC9NMTVcGGRsrssypNozEwOXjcHRvfks=;
	b=YxbEBi6NCZWfYyUS1tv0HJhV9y8cqlrIxdYX6R48r3gEvZnRWCoSqLy4V6FDQmCdFb
	ICk/mLHzfrxNv0RTpTddZu5O+TpTEzkPgcg3x03VHEUf7yK3luKdf0hQWAZQ0YNuyHQu
	oHE93AhO+5zhb38sbj9bfCyqZ5jhkcXSqYlP+SFTMIRWGX0uv8QEpniJlFclyKpcKy7I
	xoeSf3y8NBBlK+EeNs4TjX8E9lrwxevNL2rWJXRHI8p8ziL4Z58O9RYp1PVbsnK+X7gt
	AVW4uuBaUCAzoMi2mG1i9kvKoMlD2lI9dCuumajiOZADg1mrhq+rH3dDzCWVmMgyREqX
	iQ8g==
X-Gm-Message-State: AGRZ1gIhEw2SKWmGs6CRkqh6EvvzHhSnaDCpfy+IcXhcTiew041jhEC1
	uP5zB7S3eCXJx71XyLP5Dic=
X-Received: by 2002:a17:902:1008:: with SMTP id
	b8-v6mr8904009pla.337.1541097364285; 
	Thu, 01 Nov 2018 11:36:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	27-v6sm46014325pfm.36.2018.11.01.11.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 11:36:03 -0700 (PDT)
Date: Thu, 1 Nov 2018 11:36:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181101183601.GA26023@roeck-us.net>
References: <20181030193044.25954-1-philmd@redhat.com>
	<CAFEAcA-r=d-s0SS4_VDX1A=viaZkS0SxJW-3mVn6Brrx8QHCew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-r=d-s0SS4_VDX1A=viaZkS0SxJW-3mVn6Brrx8QHCew@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v3] arm: exynos4: Add dma support for
 smdkc210
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DLJAsVl/FnSw

On Thu, Nov 01, 2018 at 05:24:15PM +0000, Peter Maydell wrote:
> On 30 October 2018 at 19:30, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > QEMU already supports pl330. Instantiate it for smdkc210.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I don't suppose anybody has the SoC datasheet to crosscheck
> the irq/address values (and maybe see if it lists any of
> the other pl330 settings) ?
> 

Not me. This was "look into the Linux kernel code and then play
with parameters until it magically starts working".

Guenter
