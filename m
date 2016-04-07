Received: by 10.25.208.211 with SMTP id h202csp627936lfg;
        Thu, 7 Apr 2016 10:23:11 -0700 (PDT)
X-Received: by 10.28.55.139 with SMTP id e133mr5421488wma.98.1460049791036;
        Thu, 07 Apr 2016 10:23:11 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id dc4si9483467wjc.52.2016.04.07.10.23.10;
        Thu, 07 Apr 2016 10:23:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7A76ABB7A8A;
	Thu,  7 Apr 2016 19:23:10 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=pass (1024-bit key) header.d=braap.org header.i=@braap.org header.b=BvP60lcl;
	dkim=pass (1024-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KCDh0RHI
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -2.718
X-Spam-Level:
X-Spam-Status: No, score=-2.718 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	HK_RANDOM_ENVFROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01]
	autolearn=unavailable autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=braap.org header.b=BvP60lcl;
	dkim=pass (1024-bit key) header.d=messagingengine.com
	header.b=KCDh0RHI
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_QqXavOR_zW; Thu,  7 Apr 2016 19:23:09 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id 01972BB7A75; Thu,  7 Apr 2016 19:23:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B95BABB7A74
	for <mttcg@listserver.greensocs.com>; Thu,  7 Apr 2016 19:23:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXwuhsUyLKZP for <mttcg@listserver.greensocs.com>;
	Thu,  7 Apr 2016 19:23:02 +0200 (CEST)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id 501EB7BA1F
	for <mttcg@greensocs.com>; Thu,  7 Apr 2016 19:23:02 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5DEDB20A52
	for <mttcg@greensocs.com>; Thu,  7 Apr 2016 13:23:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute3.internal (MEProxy); Thu, 07 Apr 2016 13:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=kkrLC
	Ng3wM0C51d9if/P4xq4PcE=; b=BvP60lclKw1UTJVGvQUX3Cb+Veo/ViQtQDm0i
	SIvb2vny309xpimak0I+v+H/VkWIbTSzP9qplZKBiJKA6cAxnAlI9PZh5G3kd1KK
	Dony2gW6d37OzgP0N2GV9EFBGetGttvtmODlp6DF0YnlTVXh0U2IYK/3f+sGtrGN
	ud2Mrg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=kkrLCNg3wM0C51d9if/P4xq4PcE=; b=KCDh0
	RHIxS5ZLJlhJX+xsv6uISRZR1QtvU9wmwci6Nj0vyLZdy40mgC1jQMAe5+2kaHG7
	xn8aZET+0x/3bpVLQ/63ucHjnj4mRIY+ey/SbxquWpRBJzg8kmlGcH9dZm8tVqLM
	2IaB/QW6UU1NKhdAy6CbnOehIS5hbqM7qaSDMY=
X-Sasl-enc: TifjmiIvqpL2AUwS4huvcdujnGyRpz/4kORp7HjzFUil 1460049780
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id BA18AC0001A;
	Thu,  7 Apr 2016 13:23:00 -0400 (EDT)
Date: Thu, 7 Apr 2016 13:23:00 -0400
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	MTTCG Devel <mttcg@greensocs.com>
Subject: Re: [PATCH] tb: consistently use uint32_t for tb->flags
Message-ID: <20160407172300.GA24410@flamenco>
References: <1460049562-23517-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460049562-23517-1-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Reply-To: "Emilio G. Cota" <cota@braap.org>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 117
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
X-TUID: gNhDroBg6yjv

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

Context:
  https://lists.gnu.org/archive/html/qemu-devel/2016-04/msg01110.html

Thanks,

		Emilio
