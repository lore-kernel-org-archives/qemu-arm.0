Received: by 10.223.150.237 with SMTP id u100csp1519157wrb;
        Wed, 8 Nov 2017 09:11:12 -0800 (PST)
X-Google-Smtp-Source: ABhQp+ThDc3YPRarQNbJWk2nNWI3P/f5LPVvY5oaI4koHCuzqya/m8BRIHuSUimrcFqqVijaBhhv
X-Received: by 10.129.65.5 with SMTP id o5mr864631ywa.476.1510161072361;
        Wed, 08 Nov 2017 09:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510161072; cv=none;
        d=google.com; s=arc-20160816;
        b=GFBXQbe6MnB9KJAAhYjcDmAjXOqnCmrpFYQ00ozRoTlH6MjVIIa6ExzLkUSSsN3ELq
         l+2yJiF2nNn+GGVqgfmvpzfC97VfmQCg8/U4+ZOzcL04bQ/3f0WO2aqbJ6pVuLz0ynsM
         rvjsA8utnoTJbH+IHh9t53hev3Lis9un6eu6sZ0wiAa12zo08xXDkQhcc/csFigApMpG
         r4WCaiYEzPFY8GvunRlkX/7gR/AoPjWiPBG404r78rCzisJ9aIHAW9vvMse1iLVUGQY0
         4pj1wwNz8fM7ccrfDqPbJU6ypuzTX4d9bp7GFbJAxudEFk83jtNOhvJxXFdlPKtSFa1L
         M9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=6MVgHGi3rK+63A/aQ7ffy56wLonkhLJQ52yJVuWl9ls=;
        b=uA3hIeSGK05gCPVkNaxVN1/YhXHtc1xz4M/+ky70HnXPXM7wicBXAfY8VIWmU74Qy+
         Z62dHZQN7IqkScb+cMK6PCDu22nkYOOt73BZl+Zt6+kSOK3IXXS0FwFpmPJQ8DQzhuVg
         BPQw8sGaCeMfzSsPb8pfo0PjgrjCZfrJdsUQLTbhdn1JYbPm+A+EjS14yPuH4cKsQKLq
         pXl9FGTDs8xFGsHd9JsUSLcPSYG+3RQV1RY/JpxDub01CRB53G8s3ETMMG//ewqN6rMM
         NCfj+PHVUdSWSL/rcpQDSpwRHQ7RP1ya5Qv8PkdRRH+w108L2W1yxXS87DfCB3+R84bV
         pG0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lat12HJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r128si1028655yba.2.2017.11.08.09.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 09:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lat12HJG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCTsd-0007yF-QN
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 12:11:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1eCTnV-000442-UU
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 12:06:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1eCTnR-0005DG-UA
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 12:05:53 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:47743)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1eCTnR-0005Bv-Jz; Wed, 08 Nov 2017 12:05:49 -0500
Received: by mail-lf0-x241.google.com with SMTP id f125so3893132lff.4;
	Wed, 08 Nov 2017 09:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6MVgHGi3rK+63A/aQ7ffy56wLonkhLJQ52yJVuWl9ls=;
	b=Lat12HJGZzrGVi+y9kyBQxExrznkZbJ9FYuIBWry4US1vg/5ZeYCIjxjskD7P80ith
	TCAbOZ17nFAjgSHFY0xAqVILIf/AiGzVUdJG5M6Jc5pW79oDZ9mmFD7Oz0d9BReh15wM
	T4XmFI5X8FNKwEt/nMfBiGPxA2m1jHEru+5NYdyTPsuK6kgR4nBwu3IGG9RzHgvKZZvX
	Vt/XzCGsx+A3N8SBGA+JpNPySPa9+o32H8tKr8+wpAM1appkAlll9LCrbE0L8wKz8ZfV
	RBW9xjIGwkXQGoK5RR9T9u/8UL59jq7X94qOtELU3fWoL9Lhawi8W5wWEnMl2E6fJ70N
	uaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6MVgHGi3rK+63A/aQ7ffy56wLonkhLJQ52yJVuWl9ls=;
	b=VNB32RN8ER0gYhuV2inV6EISIR8/f48f/V15jZyMqS1EZXOI9hVTsYh6NOGGqbnqis
	6wh8tTs523c2gt4QtW1Q4HHFO/GLOpnTRmP+sdnYVBQA9yDxyjhzaPWwjnB8UEPtwBJp
	CRiLBcTXNlzrY4GXuRUe1BWswaT1WzRok4hLMr7uw7T6or70XzjeNY4l2wKuFzDV23yt
	oD0DoH9meTp7nn8qkl4/dSa25vSp8AFkpaORTNzy8M8Py6k5qINPN7aA9PUViLvkz8iq
	0q2zLMczps7bMzvkYZoZYy3Mu+9oDw71VlJ/T5zCxFm3esmZ/tgiV9MBWcT63h2kB/J5
	Z8iw==
X-Gm-Message-State: AJaThX6n3s/w3ZzoPGQLQN4xMP/uGHPT89O902+ND09bV/415va8wsEt
	yCYQpL0zQXiZgBC8Skil8qE=
X-Received: by 10.46.57.25 with SMTP id g25mr557699lja.36.1510160747753;
	Wed, 08 Nov 2017 09:05:47 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id w16sm891580lje.17.2017.11.08.09.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 09:05:46 -0800 (PST)
Date: Wed, 8 Nov 2017 18:05:45 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20171108170545.GF5553@toto>
References: <1509719814-6191-1-git-send-email-peter.maydell@linaro.org>
	<alpine.DEB.2.10.1711031035500.8975@sstabellini-ThinkPad-X260>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1711031035500.8975@sstabellini-ThinkPad-X260>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: check regime,
 not current state, for ATS write PAR format
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Julien Grall <julien.grall@linaro.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Go1cHV5kHK8b

On Fri, Nov 03, 2017 at 10:36:37AM -0700, Stefano Stabellini wrote:
> On Fri, 3 Nov 2017, Peter Maydell wrote:
> > In do_ats_write(), rather than using extended_addresses_enabled() to
> > decide whether the value we get back from get_phys_addr() is a 64-bit
> > format PAR or a 32-bit one, use arm_s1_regime_using_lpae_format().
> > 
> > This is not really the correct answer, because the PAR format
> > depends on the AT instruction being used, not just on the
> > translation regime. However getting this correct requires a
> > significant refactoring, so that get_phys_addr() returns raw
> > information about the fault which the caller can then assemble
> > into a suitable FSR/PAR/syndrome for its purposes, rather than
> > get_phys_addr() returning a pre-formatted FSR.
> > 
> > However this change at least improves the situation by making
> > the PAR work correctly for address translation operations done
> > at AArch64 EL2 on the EL2 translation regime. In particular,
> > this is necessary for Xen to be able to run in our emulation,
> > so this seems like a safer interim fix given that we are in freeze.
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Hi,

This looks like an OK workaround for the moment:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar

> 
> 
> > ---
> > I guess I should have a go at the "correct answer" I sketch
> > above, but no promises about when I'll get time for that :-(
> > 
> >  target/arm/helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 96113fe..37af750 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -2162,7 +2162,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
> >  
> >      ret = get_phys_addr(env, value, access_type, mmu_idx,
> >                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
> > -    if (extended_addresses_enabled(env)) {
> > +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
> >          /* fsr is a DFSR/IFSR value for the long descriptor
> >           * translation table format, but with WnR always clear.
> >           * Convert it to a 64-bit PAR.
> > -- 
> > 2.7.4
> > 
> > 
