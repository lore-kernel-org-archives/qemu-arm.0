Received: by 10.25.0.23 with SMTP id 23csp1420455lfa;
        Fri, 16 Jun 2017 11:51:16 -0700 (PDT)
X-Received: by 10.55.137.69 with SMTP id l66mr14850388qkd.83.1497639076048;
        Fri, 16 Jun 2017 11:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497639076; cv=none;
        d=google.com; s=arc-20160816;
        b=DCasCGlu5efvnWcerL7e4/ZLmOBerFEDW6wwd8cl8+SCLHEsSZ9BELrvMwNrbDsmI8
         j2ADfPMiv9wI98MqsWUzhz4frOaDMfrbEvnvPQKQUzXDizfuzB3AYwuypGwto1x6rh1z
         d6PMtKagV5rHOJVha5iSj3JUgHxihRos2JGAWfC/0UEktFri5kxJpykXTdvOhPTkTAFA
         9cEL3csiCoedw9CSWQpjayuoiiG1EOXMCfW9Z5J1CKb1jnMmoABI3V2T0IkI2U+yIrMm
         IE0x/ANcHEPYey3r/nnNmqcUN9KSSzTPurMEl9BupP76r9jV5HdSuc4f/Zi0tGnEpm6L
         Cj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=fGXOS8PD37ACv9DSveJ/vecKbtMONJv4JrrddYlQyl8=;
        b=zX3elaYZbVPM44qfNFGsu9L6C/W+Xi1VlZ7wyhJGSQ512fh9xgI8uhiFALP2vyumr6
         9315KKfdV7e1TsiGre4WPfia64RdoY0StIzPMfBPxH8Z/YPKXwjYV22fIhvXyreGIdQE
         qBWMHo9P4603vTF3NmzSj+wnL1rZY1JI6DJ8xYDUavPoHMMWSu9PN0zEMkQudtuI9wH/
         SDMUIBtNK8mOhiOjMf+vs4WzNg7AKHnpEIpAKT4RtMQQwNad518XvnzOLrILhyBcbsCB
         ZHd17bxhR48iG/Yg3w6dyiWZOwFM+W3HDVTIs70Hx9e76f4ApAZSRv6u2pICkq3X/lR5
         IC7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.b=RB3XXg5E;
       dkim=fail header.i=@messagingengine.com header.b=SaiDmNOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s16si2658376qks.85.2017.06.16.11.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 11:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.b=RB3XXg5E;
       dkim=fail header.i=@messagingengine.com header.b=SaiDmNOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLwKv-0002cl-AI
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 14:51:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwKk-0002cM-Uo
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwKh-00032B-Ne
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:51:02 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36943)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1dLwKh-0002zk-6o; Fri, 16 Jun 2017 14:50:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3D75E2070F;
	Fri, 16 Jun 2017 14:50:57 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 16 Jun 2017 14:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=fGXOS8PD37ACv9DSveJ/vecKbtMONJv4JrrddY
	lQyl8=; b=RB3XXg5EoT+2C60+TPWynecQNQccI79gdXlVw+4mtLIXeBR0LwEeUT
	XphiWPPPhK7yqtaqC2wmC77PryMNjNPYGPoIIMGXPYYmZrSzre800Vh5CiZTQyjf
	SdeqtisDDr4XQABVy+nil42/nNBGFyrgWXmsgiJq+tjpJ2x6OWe/E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=fGXOS8PD37ACv9DSve
	J/vecKbtMONJv4JrrddYlQyl8=; b=SaiDmNOgihjzkVWgGaAOi1k9vTiqbGttpo
	3XM4+5mRsC8pZyGBhf5f0CVjLWeUsNRjjN4nJarhEZbhi+BANcRj3OaNlZvNUu8V
	SEDPE3JvVlQJKJq64KLBpqHk0nnCnGKqE6jdTfq5bR+piirFQkm6yWECaxGsc7Zy
	fF4SWlUzcYzcat9LnKIVX/vuHvy22y8CCqAAnCDCsNJ/NKKFuclNiBe3J+86ra0V
	ggn+76se7C/7sagyYGW8GEVshIroGs098HXPcbSJ7zwkOIk8soUUvlT+RFNb9lCh
	0iXoF4jQYV6tjbsGS91RNAmTwLNzTJF7V0Z7Qb2+jEhSm7lT3ioQ==
X-ME-Sender: <xms:kShEWawN-HyYYSbC0rDeZB5oHsLnD2--qNfIhDp_MYGGvbfVKKdHYg>
X-Sasl-enc: 9VfE5RIkvxEKiJvDPWPH0siOnTuqRrf6AiuOvcFV3CcQ 1497639056
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id DF6BD24A29;
	Fri, 16 Jun 2017 14:50:56 -0400 (EDT)
Date: Fri, 16 Jun 2017 14:50:56 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170616185056.GA3055@flamenco>
References: <1497567879-13734-1-git-send-email-cota@braap.org>
	<1497567879-13734-2-git-send-email-cota@braap.org>
	<df6ef6c7-6bb5-a509-5e8e-66757598b11f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df6ef6c7-6bb5-a509-5e8e-66757598b11f@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.27
Subject: Re: [Qemu-arm] [PATCH 2/2] gen-icount: pass cpu_env as a parameter
 to gen_* inlines
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
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VoFf/+utmA86

On Fri, Jun 16, 2017 at 10:32:14 +0200, Paolo Bonzini wrote:
> On 16/06/2017 01:04, Emilio G. Cota wrote:
> >              va = dest_gpr(ctx, ra);
> >              if (ctx->tb->cflags & CF_USE_ICOUNT) {
> > -                gen_io_start();
> > +                gen_io_start(cpu_env);
> >                  gen_helper_load_pcc(va, cpu_env);
> > -                gen_io_end();
> > +                gen_io_start(cpu_env);
> 
> Careful, looks like a cut-and-paste issue here.

Ouch, messed up the regex there -- thanks.

Fixed in the upcoming v2, which doesn't need to go through all this churn
and instead takes the value from tcg_ctx as Richard pointed out.

		E.
