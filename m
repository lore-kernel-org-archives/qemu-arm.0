Received: by 10.159.53.12 with SMTP id o12csp2172411uao;
        Tue, 19 Apr 2016 16:21:56 -0700 (PDT)
X-Received: by 10.28.189.10 with SMTP id n10mr27945638wmf.101.1461108116811;
        Tue, 19 Apr 2016 16:21:56 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id gi8si2695650wjc.158.2016.04.19.16.21.56;
        Tue, 19 Apr 2016 16:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 247592C0049;
	Wed, 20 Apr 2016 01:21:56 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=pass (1024-bit key) header.d=braap.org header.i=@braap.org header.b=oDVrI3nB;
	dkim=pass (1024-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bGpZ6o11
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -2.718
X-Spam-Level:
X-Spam-Status: No, score=-2.718 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	HK_RANDOM_ENVFROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01]
	autolearn=unavailable autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=braap.org header.b=oDVrI3nB;
	dkim=pass (1024-bit key) header.d=messagingengine.com
	header.b=bGpZ6o11
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIGwERnWjjLZ; Wed, 20 Apr 2016 01:21:55 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id 0C1EF2C004A; Wed, 20 Apr 2016 01:21:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 164C92C0049
	for <mttcg@listserver.greensocs.com>; Wed, 20 Apr 2016 01:21:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv9ALOpSm-Vw for <mttcg@listserver.greensocs.com>;
	Wed, 20 Apr 2016 01:21:49 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id 0727A19440C
	for <mttcg@greensocs.com>; Wed, 20 Apr 2016 01:21:47 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9BDA921127
	for <mttcg@greensocs.com>; Tue, 19 Apr 2016 19:21:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 19 Apr 2016 19:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ffcfR
	1IuOgl80+4J44DE2LIZkdY=; b=oDVrI3nBVgvQQ/xzw+zq1RuVeAb2Ka5mW2FBU
	FAzeP2pdeJ3r5YMkfPsmsLS6VNTlth/gmfJycA7hKAmfhEXsLg+Gaxeu8ACWCeBf
	uYcnbByW27EQQ8ya0CGqQ0WvPgNuzjVjeMXE5GHwW3LyCxg4C9vpkDwMFImUf1Bm
	/tU5CY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=ffcfR1IuOgl80+4J44DE2LIZkdY=; b=bGpZ6
	o11yaIfIoS0mVIeLGdv6kJSLEFtMiECEBzcKnznRlLH23EgUlUSTReMZV4A8ZxEh
	a+3RYv979mqociIGe+cqbZHH4Xoz0hwJ9m+xzftkWhFqe83e22NOoq6UITd7/o9K
	zOdx0qxuLZLpiHHb00vB+buoxCM7ERDhl/0QXY=
X-Sasl-enc: ekHYQwLAgwDAmvGSQwhOv+fnYoSFSWVhYMtmAASJh7/F 1461108106
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4D35C6802E3;
	Tue, 19 Apr 2016 19:21:46 -0400 (EDT)
Date: Tue, 19 Apr 2016 19:21:45 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	MTTCG Devel <mttcg@greensocs.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] tb: consistently use uint32_t for tb->flags
Message-ID: <20160419232145.GA19286@flamenco>
References: <1460049562-23517-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460049562-23517-1-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Reply-To: "Emilio G. Cota" <cota@braap.org>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 222
Errors-to: mttcg-owner@listserver.greensocs.com
Precedence: list
Precedence: bulk
Sender: mttcg-request@listserver.greensocs.com
X-no-archive: yes
List-Id: <mttcg.listserver.greensocs.com>
List-Help: <mailto:sympa@listserver.greensocs.com?subject=help>
List-Subscribe: <mailto:sympa@listserver.greensocs.com?subject=subscribe%20mttcg>
List-Unsubscribe: <mailto:sympa@listserver.greensocs.com?subject=unsubscribe%20mttcg>
List-Post: <mailto:mttcg@listserver.greensocs.com>
List-Owner: <mailto:mttcg-request@listserver.greensocs.com>
List-Archive: <http://listserver.greensocs.com/wws/arc/mttcg>
X-TUID: FgYIdaQIkW7U

On Thu, Apr 07, 2016 at 13:19:22 -0400, Emilio G. Cota wrote:
> We are inconsistent with the type of tb->flags: usage varies loosely
> between int and uint64_t. Settle to uint32_t everywhere, which is
> superior to both: at least one target (aarch64) uses the most significant
> bit in the u32, and uint64_t is wasteful.
> 
> Compile-tested for all targets.
> 
> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Suggested-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Has this patch been queued by anyone? If not, should I resend after
2.6 is released?

Thanks,

		Emilio
