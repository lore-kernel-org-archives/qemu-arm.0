Received: by 10.25.159.19 with SMTP id i19csp881972lfe;
        Fri, 12 Feb 2016 07:19:17 -0800 (PST)
X-Received: by 10.140.240.87 with SMTP id l84mr2699602qhc.69.1455290357237;
        Fri, 12 Feb 2016 07:19:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u108si16208829qge.50.2016.02.12.07.19.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:19:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFV6-0003EE-NX
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:19:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFUY-0002cT-Ci
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 10:18:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFUT-00046a-LG
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 10:18:42 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUFUT-00046O-E7; Fri, 12 Feb 2016 10:18:37 -0500
Received: by mail-pa0-x242.google.com with SMTP id fl4so3924108pad.2;
	Fri, 12 Feb 2016 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1Xdzx5qvBEYM85Tyb6B53XNdhylwmkwTukgfOYdIywE=;
	b=igPI/dpvrTybkUxYkXHYgqnaQgM0wOXhRQx7q+TeB1md5AP4MCJ2fsBuKFOunZAPQs
	lj6ODqIhmfmtht0CA5al/4BKP7m/NK8+3tzVkiCyxjR7VSflT6HI4/6FnTFMv+GthFhM
	9VUsMcBf/njXASHFbCE74b/rbeMmyvMqVaRT0NYyp1P8pj25E8ScEYSQx7+SlUBZ528G
	bDe1j0VuOA9+XE/CRCA24m0GumVYi9vX9w3Nwfsah6GlCWaYZFORMFaMDu0xq1KJMc0V
	tyYjawmslm/dKwJUqKg0GNe2MVhroD1WigBJoote5gVzjmGHVbslf90xvL9lipwmLEL0
	bGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=1Xdzx5qvBEYM85Tyb6B53XNdhylwmkwTukgfOYdIywE=;
	b=T1ehl+WDpSz7yiUTNotmRzovvSH9o42l0olJ4iHBBtyADaz/OUAOf5ZAABYR04jSUk
	RSmipVxJVHup7EyIpiynhVk0FR1xHPFf5GBJ8GlOFIiX81Y3SSS4VKm5+gbH7hSj2qtr
	YTjUFDNiNkrZf/Dkt/Tgpjogw6OMgc3jaMacAPknpOdewwPaA+aOVTK3NmkDKhFbzoeX
	Op3Fn/94qim0r1zc+PXSZ9MIxJCxPoKGtMV1p5FTF+UxBph9rBr9Z1x3oO1H+TUNCo5L
	IQ0A1n9UujEOk90IcbUK74E/a/iJt1v35hoDsW6MGSvzX594J2u6ulHWZ0tpsrDCmH/8
	8VDA==
X-Gm-Message-State: AG10YOQIea7bNSLt2UwdWRGPH9iLI4Jo4u/aLIzZD8vny0AOdXGYU+0HsqrcFd9UJpEZ+g==
X-Received: by 10.66.145.232 with SMTP id sx8mr2898464pab.148.1455290316889;
	Fri, 12 Feb 2016 07:18:36 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	l24sm8479157pfb.73.2016.02.12.07.18.35
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 07:18:36 -0800 (PST)
Date: Fri, 12 Feb 2016 16:16:08 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212151608.GI31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
	<20160212151218.GG31433@toto>
	<CAFEAcA_00+sVTot-q5iHKLDiLbPRFsRTBQNE4Dbswt1haaxwGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_00+sVTot-q5iHKLDiLbPRFsRTBQNE4Dbswt1haaxwGQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 3/4] target-arm: Combine user-only and
 softmmu get/set_r13_banked()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1IMIJ8++CIAv

On Fri, Feb 12, 2016 at 03:15:22PM +0000, Peter Maydell wrote:
> On 12 February 2016 at 15:12, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > On Thu, Feb 11, 2016 at 07:11:48PM +0000, Peter Maydell wrote:
> >> The user-mode versions of get/set_r13_banked() exist just to assert
> >> if they're ever called -- the translate time code should never
> >> emit calls to them because SRS from user mode always UNDEF.
> >> There's no code in the softmmu versions that can't compile in
> >> CONFIG_USER_ONLY, so combine the two functions rather than
> >> having completely split versions under ifdefs.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > Hi Peter,
> >
> > Do we really need the assert?
> > If we keep it, can't we have it for both -user and -softmmu (avoiding the ifdef)?
> 
> I would be happy to entirely drop the assert, yes.

OK, thanks.

With that change:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

