Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6637413wrp;
        Mon, 30 Sep 2019 02:25:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkGmKhiii6C+gvSm23oqdn8rXSVhdS2A2PW+6UmePGTVd4KKD2fk4kSMgV+cQTVx3p15a/
X-Received: by 2002:a6b:f703:: with SMTP id k3mr19326381iog.20.1569835547235;
        Mon, 30 Sep 2019 02:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569835547; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlVj86o/he0I890Zw2PCTefDsiu8wwW7P79PF/fdsmjFqHjFVXLxRMj+D8TfbLivrF
         rR/05lEsEmWKmLrr8NiFxOfjGhtkcfec64KXla7t/KR4XdOXiYZ7o7Gn1xb0OanJR0sW
         4vGdBlBsP/Gp3f9b8uB8KpEAVaW3wyEzpbShMvXX+KN8iVsttaJnl30v9ACT40MboOuV
         De6XlcjRvlAb6fWArw5Ihtwp8PkyOuODwbZQbsZKP9VCHu5fVvkRNWlbhgTfu/ij5t0t
         AcJCnoshpCcjFNO+arKXO9e2Pxc/y8ceakWAJHXmlGBk6W/Nm6gpBwSfYK8FaiPMfsT/
         vhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date;
        bh=9Ewd8IA30ffoYJt++xgOb9dOONwidjSFZoKdUTHc32k=;
        b=GaXtJhYag2ARQygZpt4vMPEXbVzgGnz4iJ2msbBYDwBahISSf9QDcPHfRSyvtLK2CO
         aI9KmMBii+hqBYck8kdVIO6C+NR4VlCF6xAOjhKDopqT2309TOel/wS7S500e9FaqdKY
         nhg8J6PWGrfOKZnJcbOcAgXKtjoxlcaDERsBVOswd3mKZ6a0HSXXecOvbhHjam7Vo4zx
         AiuUD2TzL70zWQmFTjI5FCyTyBRoXv7sXdr2haAYzY2VRisS7WmgPIjFdN1C26TUSOBe
         TiMIVao5UuUQiQOSJN9mdkq8BT3Sw6gPgryAuFUJuX6kJNuacpbXt9F9yH/M2DMBVna3
         iVPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v127si15858100jaa.19.2019.09.30.02.25.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 02:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B85818CB8F9;
	Mon, 30 Sep 2019 09:25:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C73D01001B33;
	Mon, 30 Sep 2019 09:25:44 +0000 (UTC)
Date: Mon, 30 Sep 2019 10:25:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-discuss <qemu-discuss@nongnu.org>,
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
Message-ID: <20190930092519.GB11996@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Mon, 30 Sep 2019 09:25:46 +0000 (UTC)
X-TUID: Fpj/3Ts7u68s

On Thu, Sep 26, 2019 at 10:11:05AM -0700, Richard Henderson wrote:
> On 9/26/19 12:50 AM, Peter Maydell wrote:
> > On Thu, 26 Sep 2019 at 00:31, Alex Bennée <alex.bennee@linaro.org> wrote:
> >>
> >> The 32 bit hosts are already a second class citizen especially with
> >> support for running 64 bit guests under TCG. We are also limited by
> >> testing as actual working 32 bit machines are getting quite rare in
> >> developers personal menageries. For TCG supporting newer types like
> >> Int128 is a lot harder with 32 bit calling conventions compared to
> >> their larger bit sized cousins. Fundamentally address space is the
> >> most useful thing for the translator to have even for a 32 bit guest a
> >> 32 bit host is quite constrained.
> >>
> >> As far as I'm aware 32 bit KVM users are even less numerous. Even
> >> ILP32 doesn't make much sense given the address space QEMU needs to
> >> manage.
> > 
> > For KVM we should wait until the kernel chooses to drop support,
> > I think.
> 
> Agreed.  I think this discussion should be more about TCG.
> 
> >> @@ -745,19 +744,22 @@ case "$cpu" in
> >>    ;;
> >>    armv*b|armv*l|arm)
> >>      cpu="arm"
> >> -    supported_cpu="yes"
> >>    ;;
> > 
> > I'll leave others to voice opinions about their architectures,
> > but I still have 32-bit arm in my test set for builds, and
> > I'm pretty sure we have users (raspi users, for a start).
> 
> I'd really like to know what raspi users might be using qemu for.  Depending on
> that answer, perhaps it would be sufficient for arm32 tcg to only support
> 32-bit guests.

I asked on the Fedora development lists for feedback on the idea of
dropping QEMU 32-bit host support

  https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/TPAVIC6YANGP2NK4RUOP7OCIOIFIOV3A/

The response was rather underwhealming to say the least, with only one
person explicitly expressing a desire for QEMU to keep 32-bit host
support for armv7l.

The main interesting thing I learnt was that even with 64-bit Raspberry
Pi hardware, it can be desirable to run 32-bit Raspberry Pi supporting
distro, supposedly for performance benefits.

> For context, the discussion that Alex and I were having was about int128_t, and
> how to support that directly in tcg (especially to/from helpers), and how that
> might be vastly easier if we didn't have to consider 32-bit hosts.

I know nothing about TCG internals, but Is it viable to implement int128_t
support only in 64-bit host, leaving 32-bit hosts without it ? Or is this
really a blocking item that is holding back 64-bit host features.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
