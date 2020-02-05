Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp316022lfp;
        Wed, 5 Feb 2020 08:36:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqyL2EtikSVkVGUC9cfXfcrPbcCrl0f9lABGjr29m64uZvM8qMKuLW3ivxIbKTiT22OOZbCw
X-Received: by 2002:a37:b8b:: with SMTP id 133mr33783239qkl.418.1580920578205;
        Wed, 05 Feb 2020 08:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580920578; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTOTJ5rCJ0vrrs4QQIcnDroeG9Ss6DMyiU0ZuEPpIVduViAuIQ/m1NDd3etFID22q7
         nB62B0vJba0KbiM2KcHQ7JZE1R53XzMVqFvwJtwkYeo95s6e+EMb+4pt8Y531mL5Cd5k
         C1nZtnWQxAlwCud5kAMBKHzA1LyJDn48bGdQLpK62eK/46X2mOuDj5zXODk482KYtUHe
         lq11YcQj9aNEqISSWlMjmr03KKF5fwMRnr56zjwJKB4dddN/hWMrW3/mKJKo2hQBjJ28
         RcagsEXMLVshKilrAFsklyuLvyukP1Qjb+qYhMBQBloprIqOpg7U4zmNdWCInXrQkINB
         Bh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=jRh4q/Ba/QCpeEew0nFMRFuVZIQDzbCuo4yMPgsxAs8=;
        b=oU4kG9sS+8hGxYQKdXvkZ7RzI3Unrm9qy2GaO5WfinrtnVAus1nUr+wrmAcJ0tOjdI
         shMoBPEZPMgWUGd0nWBp0fgtaNEc+ZtrP0Or4llC+s4obpjUKKAnEOu3XZdSlNGPlCLE
         T6Qn3z6QxRgoeN+zeQYARVmvAu9R+c8qrP+6HvvyPE7cvRB5HrJgLNBVllb+cr9IGYR7
         xsim0MRDDBVeYumrgnjhFXzP0ItY3ULJ1hLO/d9qhIvDpfwXN2YlKa0Nr8pJ2eiyuLLP
         c3er6c0SZCVZhYQjTxryH+KPpCX8kFw4vqJhNLZg6xzytLGN58tTxVesgtg1yVjj0rCM
         REDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BVjj2fmG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si24465qtn.290.2020.02.05.08.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 08:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BVjj2fmG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izNez-0003eO-6X
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 11:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1izNeB-0003cC-Fr
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 11:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1izNeA-00013H-Gc
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 11:35:27 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46908)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1izNe7-0000cz-Pc; Wed, 05 Feb 2020 11:35:23 -0500
Received: by mail-pl1-x641.google.com with SMTP id y8so1075684pll.13;
 Wed, 05 Feb 2020 08:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=jRh4q/Ba/QCpeEew0nFMRFuVZIQDzbCuo4yMPgsxAs8=;
 b=BVjj2fmG9K7mqNhdRARDagKjmwv0HxecaX1LU34Q/haT+XFckst2IsxyxhzEZ9XqQF
 gltlDQJODgho2hCbv0rtkEmYrWVXK2KRAW5Rei6kadiwFQT5FtjPAf1tJHrGpnBGCYv3
 YZRLyFcvHqM7ov1pddcbf42j7MCP/Gx5D7d515GtRVv55R8DpxSW4ah9dbonpyMeDT06
 Do0tBaGa1E41mbyQUrHhEgZEI3r0/YVGBAZZrKSTOYxefotbudWrE1o0o6I712ZNlKRn
 ElnYTiy59wCRXVBBG2BsdLAZJMvogEqVioWup8NLv+mA0+axmlI9FFJjHIHb2+v9jF44
 biSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=jRh4q/Ba/QCpeEew0nFMRFuVZIQDzbCuo4yMPgsxAs8=;
 b=nfz3MV76pkPoqype5YmLz79xqYOXA5bCidZExd4VPqLKafHFUMVmCh73BEx8nW6rpq
 kZulhgC7D2edOWAkaD5ICgV7EzkNhg9pMHD/yzEztg+88HqDh9cJ9tgnTORX61E/0Zik
 8FmwqKbFIyv+B6VzLaeheA492vfw47jr3ta3w6Y2zEAYmbN4VQUmcm+5fSU+Fl0llnwN
 +MwV6/dc4DAudSU/BHMW3HWHTxIhWT5ji/M3+BisDvxBI47zVb1UIn0tIrGdYP2pkGAb
 JcQ9ArsBAUIZ9Ewca72RPnZ9EmaS3+qt5Y5zJloHbxREg53lKjr+t3D1NVJGV8ZhgmdU
 U5sQ==
X-Gm-Message-State: APjAAAVQDOi2NI/ixP7Xj9pZb4wOQpwjJCaf8g1BYVeFratt17kkWv1D
 qlxRRRjuHxty8y7Zn0GJGRQ=
X-Received: by 2002:a17:902:6bc3:: with SMTP id
 m3mr18082067plt.27.1580920522546; 
 Wed, 05 Feb 2020 08:35:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 28sm306578pgl.42.2020.02.05.08.35.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 08:35:21 -0800 (PST)
Date: Wed, 5 Feb 2020 08:35:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/3] m25p80: Convert to support tracing
Message-ID: <20200205163520.GE25403@roeck-us.net>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <615518c7-f4c8-7c08-9096-bcf5f583eeb1@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <615518c7-f4c8-7c08-9096-bcf5f583eeb1@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lgK3S0D/pJFs

On Wed, Feb 05, 2020 at 11:05:04AM +0100, Cédric Le Goater wrote:
> On 2/3/20 7:09 PM, Guenter Roeck wrote:
> > While at it, add some trace messages to help debug problems
> > seen when running the latest Linux kernel.
> 
> In case you resend, It would be nice to printout a flash id in the tracing
> else I have a patch for it on top of yours. It helped me track a squashfs
> corruption on the Aspeed witherspoon-bmc machine which we were after since
> 2017 or so. It seems to be a kernel bug.
> 

I'll send a new version to split patch 2. Not sure I understand what you mean
with the above. If you send me your patch I'll be happy to merge it into mine,
otherwise we can just keep it as follow-ip patch.

Thanks,
Guenter
