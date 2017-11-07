Received: by 10.223.150.237 with SMTP id u100csp3633111wrb;
        Tue, 7 Nov 2017 03:01:12 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QMcm8jT27LNOdPzskweq3J6M1XkQoYB0la310PnAM8b40COmMiYFJXGdqdjmmUu9q8fv7G
X-Received: by 10.37.24.6 with SMTP id 6mr5788415yby.344.1510052471950;
        Tue, 07 Nov 2017 03:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510052471; cv=none;
        d=google.com; s=arc-20160816;
        b=FgGmvtcaOZUImepCjfCmBkJLMAynOHKKG8PLQPzLUyr6RcWP4Zzv1rZYq3k0h9tmEC
         mD+FIVlABB4tOMQIzF4lvbAR+jc1PFY2b0gyCpT7i+adMre3EOEq+J9imqIjzhnkH3XK
         tp6tcJh7hBqg2C8xgPtrk7l6ONG6X7o3fZpbXO2YrfXLL68AicJIRL8EEK155Ge+OFAB
         bs+/HEBKxog75oeVwSrz4sa27lzgAYd6YmSQ2CTnpoTQzBTJxMGuBoaJnWaJfaQE/SZA
         p2V9DGe2fR5dMwwXwmSn4z0rz7vJ17bA/6a1j+uGmGvDMnrx8yAYhFUJknUL+0iebSc1
         DY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=4cGKT+GqnreWjqmrWA7qilbjmGiIU+PA1sxSe0mnNCM=;
        b=l1RXsnhdn38lmIeAAcOK8KVJ9ygH0hrVPxyN9XDztMsOCR9lCFe6XSM2oUx6ZuuKeb
         lFXpJSDFiemrYSNLBQ6qSbRNQ1JwsnaMKFvt3ttbK7QRqZjuGwnl68f5pgGHQQYyQv6V
         y6dbUfL+vJFuGTF6WkdylxbJ/HTRZZ/yJOTcb7vQEbYImvWQSg8zXUF8ymDKZ5P2X73L
         yxytEPup6fK/vc0ygmUvjqRbvmxRoCCWhc84S9ivR4Noua4O7qZ6Rxy0M4jYqYSYD4cV
         Ahy9POIh6r41Vxc76Ojp/GqYh3RhL4GEztxNw3pcQKD/e8xpJxO6hywX90pFzjnwceCr
         GAAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=frodwMIf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h65si217206ywf.246.2017.11.07.03.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 03:01:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=frodwMIf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC1d1-0007vZ-EB
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 06:01:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1eC1be-0007Dj-CD
	for qemu-devel@nongnu.org; Tue, 07 Nov 2017 05:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1eC1bZ-00041x-En
	for qemu-devel@nongnu.org; Tue, 07 Nov 2017 05:59:46 -0500
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232]:54008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1eC1bZ-00041H-9T; Tue, 07 Nov 2017 05:59:41 -0500
Received: by mail-pf0-x232.google.com with SMTP id t188so10045900pfd.10;
	Tue, 07 Nov 2017 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=4cGKT+GqnreWjqmrWA7qilbjmGiIU+PA1sxSe0mnNCM=;
	b=frodwMIf4P5Q0FwN8ihJ0qdjtfwpuscyDIzhKAL3Pym8h2HaR+bcr6AQKXRL+u/D3f
	MR/sf6PxVTVCjNS9Jw+V+tLb5QVmMCsDfGjMCYlMlz4V4ACO2fFbVPokz5aOdj2pEmN+
	Pj+Nno92VLoUlh35wqwBwXl+TSjciHCvR3XmYA7yrE0YZnwWJaSmhpYclKzwcpZmLRG5
	uDAWPvkFIIODOK4RtMLic46CLjsSy3vPtFFBH6qNaPoFIQGP0MaC2O8PuUcXkdKqIFMh
	/PIimzxtk1wep76IHLboOCr7e74uhOQpBXQtTcFD/7hSRlcGrSNqY0rDvHBKZRB0uX8Y
	rGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=4cGKT+GqnreWjqmrWA7qilbjmGiIU+PA1sxSe0mnNCM=;
	b=WElaGriTnoRczZP70p1Ql6qnKuEpPAD2ejmBH4pGrtY4Ni/GDIqclQaslG1kxIY0fh
	peXa6vkvGNLasbThgKtAoKG/hwjRHtuVnCfoFnS6hqbM95LKLJXUFghRc9F+8LivU0h5
	FU2Oqf5FGgasGsSUStgmGZ6+bK6jCez3YI66u4f2qPeemPxMTP5+R+hYoIpCwGwVjksD
	TQ8uCPML7mDkOI4DbIFi6p61BXdMjzYsajQrT1VdGhiD27W7M8E74SRTpmCzD30QY9Eh
	udKWb+aSQ6EhPjFI6+A2sdQLDm1mP93BbtJlf67rPhbKTggm4kGBwN57PrQAUMjLKlWy
	9XPw==
X-Gm-Message-State: AMCzsaWkT9FCibbFA0d8Su3LYoBD/9WyDzrBWw30b43mPFbQYmR63Q33
	8W9LeWvIL/iXG1wXG8St6BE=
X-Received: by 10.101.96.1 with SMTP id m1mr18089202pgu.36.1510052379682;
	Tue, 07 Nov 2017 02:59:39 -0800 (PST)
Received: from localhost (g183.61-45-92.ppp.wakwak.ne.jp. [61.45.92.183])
	by smtp.gmail.com with ESMTPSA id
	e18sm2368013pfi.57.2017.11.07.02.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Nov 2017 02:59:39 -0800 (PST)
Date: Tue, 7 Nov 2017 19:59:37 +0900
From: Stafford Horne <shorne@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20171107105937.GM29237@lianli.shorne-pla.net>
References: <20171103202624.5956-1-laurent@vivier.eu>
	<20171103202624.5956-3-laurent@vivier.eu>
	<20171104212011.GK29237@lianli.shorne-pla.net>
	<1356a4f9-86a2-7b18-a67b-93dc6dadec4f@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1356a4f9-86a2-7b18-a67b-93dc6dadec4f@vivier.eu>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::232
Subject: Re: [Qemu-devel] [PATCH 2/4] openrisc: fix float32 and float64
 helper definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c1XTRaCVvfoz

On Sun, Nov 05, 2017 at 03:39:48PM +0100, Laurent Vivier wrote:
> Le 04/11/2017 à 22:20, Stafford Horne a écrit :
> > Hello,
> > 
> > On Fri, Nov 03, 2017 at 09:26:22PM +0100, Laurent Vivier wrote:
> >> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > 
> > There is no commit body here, do we need one?  I can see in your cover letter
> > its mentioned this was revealed after enabling "USE_SOFTFLOAT_STRUCT_TYPES".
> > 
> > However, I'm just being curious why is this an issue?  In softfloat I assume we
> > pack our own floats so having the type that goes into a uint32 register wouldnt
> > make much difference right?
> 
> It's not an issue. It's for consistency. We can store a float32 in an
> uint32_t, but it's better to store float32 in float32 type.

OK, thank you.

> And as said in include/fpu/softfloat.h:
> 
> "Use structures for soft-float types.  This prevents accidentally mixing
>  them with native int/float types."

Thanks, I have not tested this but I trust it should not be an issue.

Acked-by: Stafford Horne <shorne@gmail.com>

-Stafford
