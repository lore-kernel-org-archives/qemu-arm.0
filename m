Received: by 10.25.227.6 with SMTP id a6csp4913520lfh;
        Thu, 29 Jun 2017 16:09:20 -0700 (PDT)
X-Received: by 10.237.37.52 with SMTP id v49mr21922091qtc.97.1498777760317;
        Thu, 29 Jun 2017 16:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498777760; cv=none;
        d=google.com; s=arc-20160816;
        b=XMam6Xd3RQx9FTywYiRhzKmGkY6MefFZAnwj442EMDQgrpUAcTIGy/h3uEXBPGjis3
         3atZm3u/uymcmi32a2XPMIwgERiokqYok/Oe3BK3nxNYo/OR4nE7iTVmd0iZl5O5huFx
         57KNDhYlJ8GdgEwDa5ZrXrfPY9OvBuNII7G2jvztullMU7zDkxoqGw0T5ITbs0P+A5wd
         nH+ksrZYlnZ2W0K9uOk9H5cmfcxOU/AnbzA1BP08fN13tUe/8PYTE5miqLk/ugaLrS2r
         ZZop/yFdqdTpUeW1rKbn+YqtHYJVutjzCk35qa5kXxs22qM6EvLmK8j3fse9Z5eOnAxJ
         BqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=W8MhjVswECYj7tAqGlvpT354ZTXnScPxrFaKZB6kfdc=;
        b=d97Z840GhYGztBZKyikkDa4QqyMg1GjqRqG7MpOuKHJYK0tkJmYhFtTm+Xu5hGsPFn
         6I7JqP/kGWbkecOqk/KiBE0RQ0DQQ9+q7o2kxBFa0gRNswk3z56K/X0qjm7G/C83A9H7
         O7OR25jDMYsgAVgUgeduiFAeWMhI7uKNxZSPLRzEj+is5zejS3S2F95v7Bxg5DByXy/J
         6kvvSawAR98qsmWhDU3TBEnrHkEdMe2Pm3y7/Yx6QTZU/utXi1UmUkGal1nzmF1yEfZ+
         fLtObZupcmqQS4JIYVjVmtYG44VjlmZBHZN0qJtvNtJ5VyZZHuJ824Iq/erz2NbYmzoq
         Jvew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=WPKuRhZM;
       dkim=pass header.i=@messagingengine.com header.b=KjNiU4Yn;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com. [66.111.4.29])
        by mx.google.com with ESMTPS id o187si5351372qkf.157.2017.06.29.16.09.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Jun 2017 16:09:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) client-ip=66.111.4.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=WPKuRhZM;
       dkim=pass header.i=@messagingengine.com header.b=KjNiU4Yn;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C597F20CEF;
	Thu, 29 Jun 2017 19:09:19 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Thu, 29 Jun 2017 19:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=W8MhjVswECYj7tA
	qGlvpT354ZTXnScPxrFaKZB6kfdc=; b=WPKuRhZMufVnILDg6XXkiev6lg/IL/V
	omBC3uribUxl1dduv6x9BmObFGBLB+xLTqfmGrwY2spYtWzWnKIvTmNO+aWhtTIM
	1lexza0D9U1GSZOhe3YtGBouqJ30uXAUNJB88wAYYHp6sDIVKTdMsPScp0PbBmW7
	GWq1qpudednE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=W8MhjVswECYj7tAqGlvpT354ZTXnScPxrFaKZB6kfdc=; b=KjNiU4Yn
	6MaisLbYDG89YAwqPuTujlTFJQDz+7gJ6wf0MAIE0/YUvAqKARGTjEyz+rjWZoeb
	hZl/e9H4/C2Ct4aF7oQvdbrCflvDmugpYNDEtOR49GEUtPyJs/MgoAZAkrJLhp69
	WqfUt36yujQp3oA4lU+mTzQLW050QgKyKj6leqlZmPfz8QgwpLvyD8IrGoRYm4Ze
	u3SzVVrQ0TM9zGLni1RcWCYbSUhGZTERMiew0CqtSXd4F/YiqZs81p7WNJ85dMbw
	GuEuDyLex+rwcvDrteo0kxBUIDgCdmQyqPoFj6+vghvM395hOHYCRPzLhJybzS9l
	iSQ789B0eBxF9w==
X-ME-Sender: <xms:n4hVWXBezbcHXxu8BLpx9cT-8GejFvSzOjOOgqIXJxqaYMvfJPVEfA>
X-Sasl-enc: fzogkw+BEEbz9NmI6E2Astnqg7rh6phZw7nzpqoYGCi1 1498777759
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7D85E7E51B;
	Thu, 29 Jun 2017 19:09:19 -0400 (EDT)
Date: Thu, 29 Jun 2017 19:09:19 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <laurent@vivier.eu>, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
	Alexander Graf <agraf@suse.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v11 03/29] target: [tcg] Use a generic enum for DISAS_
 values
Message-ID: <20170629230919.GC13979@flamenco>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865292643.17063.14495945233139782748.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149865292643.17063.14495945233139782748.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: oCZSlYfK6bSA

On Wed, Jun 28, 2017 at 15:28:46 +0300, Lluís Vilanova wrote:
> Used later. An enum makes expected values explicit and bounds the value space of
> switches.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.
