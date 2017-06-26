Received: by 10.25.15.197 with SMTP id 66csp1557217lfp;
        Mon, 26 Jun 2017 10:53:13 -0700 (PDT)
X-Received: by 10.55.136.7 with SMTP id k7mr1901176qkd.104.1498499593498;
        Mon, 26 Jun 2017 10:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498499593; cv=none;
        d=google.com; s=arc-20160816;
        b=vt5hjhefm9hgch0umIDfwg+PxoZ6+nSUy7Z24HF78obPOW1D2w3KQu+UjqIpNx3QTE
         9dF9gA461vxUcDUmW1fS3xJyQlgyGDMgGSMjD4Y0VSr2HImwFzOwat1dgWhBdo/jAGUD
         en7qIcZEFF+jsfBD7cQFlDNUrONZTT1OcrzNogY5hBDWpzRVOL/Vo3y/FzRspzd6OJnE
         MY7YNeRSr40PGuablxKgxZxbzEPKRcz21rctCawndFvoI5ygOvriY6/VjWcrarFWQTuO
         Odx6xRjveOBMtqdO2+DZLULLzkpqG4KNMXZw2XysyvtscdpdXb+v1nqdVUucUN+r1QCy
         wTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=wp6SdpbeTnDadwoL0xXowRGte6jRKIGjL8UzfjSq4o4=;
        b=wz11MVciYo6kHYdQxRcoqFNbqguRXCzc5dTPYuLnDqsz7jGqDmzvDSIqCGhDI8iv8o
         GazMlCavuiVX1qogvTdadgPAAVtyu+k6OMb3xoZ/s4ixV3r+oOHJJrf+4UeeIEHbc9sr
         QEy7RT8UFzJvyPz9EzLuDYRjCC+dyun1RYNzcClgIlb0LP36Rvqj7fNTwdua44KNGiKx
         NZrd1e/N5mFWMPkLWzP0voP9Vy9pX1DXKbZk71WWT9kLKIpKig7B4DRNfFNeZvO5SGBf
         AwHHwii9/n0IvsNgBft6zlM+MUXYjhUNPz+Cd3gZbk9q5fU3+kkjPf0ueHneJhvtHzVj
         3D6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=01lhsL/S;
       dkim=pass header.i=@messagingengine.com header.b=cRmeegit;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id l190si588685qkd.240.2017.06.26.10.53.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 10:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=01lhsL/S;
       dkim=pass header.i=@messagingengine.com header.b=cRmeegit;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1F94920813;
	Mon, 26 Jun 2017 13:53:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Mon, 26 Jun 2017 13:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=wp6SdpbeTnDadwo
	L0xXowRGte6jRKIGjL8UzfjSq4o4=; b=01lhsL/SuFu/gcTaGcXkLPHgFWxRC/t
	yw6AQnTdylQPJpj3eo7I3U+sztmSRucJhl8fuy5b1KcZsWMjwIVkV5f0goXZTrLo
	1y0wvrWRzwrSxxiA+l+ndXiWYuGYvyiOHc7XlsEKWsBwjPCKV2tusB+LfromY07y
	5oJzx7GlfY0E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=wp6SdpbeTnDadwoL0xXowRGte6jRKIGjL8UzfjSq4o4=; b=cRmeegit
	jtRPBluCq6iKmYb1MRm0BBzmhFF6nfFigPALQvz2q3mITBkLVxXEHFL0SWcLgXfA
	TJhU5G3iBsn6MnWTI8ve1mVDnC2ijavTy1R6bCYzx1fbj1LyT97fhjsvBmwzL3MO
	re7hhoB8ZrKJ4C/IbTz+iTNLWGu0Nm60Dcbn/jK1n0D/0/ZnCNYdUb5DSlC8N+K4
	MIfmTVxZpPh4+3dq8hVrzx4rLdeqDndLDnE4bmIGnSmU+oaHtlGEFwKqkthnT5Z/
	djDP6oejlMWTomTCMEiCwDEUj5OZ7ngpb9Xg2Jy1jBKKZxZrHXsVZUiNV8ObKiUG
	ToZq/dO6/Kycew==
X-ME-Sender: <xms:CUpRWfVqIEyi0-_fS_zO2baLsxZZG-TqI4aensricbCBH6MotQDVzw>
X-Sasl-enc: rn1dwyrnz6cD4bGWi/hHWDhpATyqGp9RV8S4igUCjXTO 1498499592
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id C2B252458E;
	Mon, 26 Jun 2017 13:53:12 -0400 (EDT)
Date: Mon, 26 Jun 2017 13:53:12 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Yongbok Kim <yongbok.kim@imgtec.com>,	Stafford Horne <shorne@gmail.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [PATCH v9 03/26] cpu-exec: Avoid global variables
 in icount-related functions
Message-ID: <20170626175312.GC17935@flamenco>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
 <149838095039.6497.9448439115949437094.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149838095039.6497.9448439115949437094.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: W4D6CxSb6SUq

On Sun, Jun 25, 2017 at 11:55:50 +0300, Lluís Vilanova wrote:
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
This approach was NACKed by Richard. I suggest you pick up the v2 I sent
which uses tcg_ctx.tcg_env instead, thereby avoiding a lot of churn.

v2 here: https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg03994.html

		E.
