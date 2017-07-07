Received: by 10.25.44.15 with SMTP id s15csp288957lfs;
        Fri, 7 Jul 2017 09:19:14 -0700 (PDT)
X-Received: by 10.200.55.65 with SMTP id p1mr65869425qtb.64.1499444354174;
        Fri, 07 Jul 2017 09:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499444354; cv=none;
        d=google.com; s=arc-20160816;
        b=B3WN/em/hocK3FeS5ZKl9MDxCfVw6gfQYLkDWVqje+LMPDmCBLqKGsTnluPof4gjdh
         XCh41fc80vvzeKUCXNL+gQnOHy0yz+XQWFGDA+2qAPfKU1J8zkB1nzdMgXquT4LNUpyW
         Pp0RcVG8UgLOTdlBtU+dr8tA2FoasbQmiimgHEWdINj2/p98IODoAVa9txLVbXzdm9yo
         ux1/1wFqnFva1RxrhCCqwOtWPlAiq4sIVwvzRmIvLz9lNreXPPs1G9lUCAsKeqoYX4AB
         PTnRV/3Fg0DDN+bTFiGNWCyeSw1mDKL0rc/6qFR7+B/Zb/J3MzCtZ6QvqHunGWXnZAFn
         SWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=qqjo638lVM0qQlXFKly+4ku5PJ5ltTSWnxECqbCLyiQ=;
        b=IbeKNy1lffoFcJyCpoStWsb3d5eCFe23+UgyJgwQCI8fzKn9GLXyA12HIboVKjs5mK
         eQCoTD1+O/ZSZkPifaievMMVSZQ86p4Wv6aMeY722BHcX9Cs+BG16ZVht46g07lZuJyj
         zP+K9qCDam9pYyvIRMIhNQFKDEQSczgcDS9pZrDu6H60WLjSoQVHKbgw5Q8ByaTWK59u
         bKDgbLPG8tZ/I10EtV1OFzv1pZFGA28oMhDVJbvoZJiUPB6271gbM2EIBcwRfjx4NJvZ
         GnBJGqswcZYkENcTpAvj9bMX2K1LSmeGXsjcaCoDL5sBYhKeMKRKp0/kvx70Y/qpdIXO
         9orw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=KxwIL+6v;
       dkim=pass header.i=@messagingengine.com header.b=NurXkwIh;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com. [66.111.4.26])
        by mx.google.com with ESMTPS id n31si3695779qtf.28.2017.07.07.09.19.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 09:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) client-ip=66.111.4.26;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=KxwIL+6v;
       dkim=pass header.i=@messagingengine.com header.b=NurXkwIh;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 87304207DA;
	Fri,  7 Jul 2017 12:19:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Fri, 07 Jul 2017 12:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=qqjo638lVM0qQlXFKly+4ku5PJ5ltTSWnxECqb
	CLyiQ=; b=KxwIL+6vFkGY/hrOGnqh+i3eEzG6LQUz/qKdSjYFhGbdfD6NtfLPZI
	/vn+XA//+xJtcPiitrbC9E050Tjc+fWERN9IdFuiaqfQDIvPD/lNONM/KvPLxDy/
	ci9+YKyR2BEUBDLh8tTgQFt/ETC5wCHyiWnl50xkzxSzl29T5GTWM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=qqjo638lVM0qQlXFKl
	y+4ku5PJ5ltTSWnxECqbCLyiQ=; b=NurXkwIhe649BWP6ZaXmZa5o8PFku7mFET
	0sBiEwfu7w8Q5XgUsQfE30V2m1lzWP4JLaCuMI+hlM/MDiefKibPi/DS9gSEnWnK
	FyBIhdPoRRIjwYsSWz5mIUMMrI5vgnjjGCVMQcgouin0kpNtDNAR0wTN4SuE2lTM
	hvdhDb9VHzB7Lgu2VZ8C2Q3U/8jxUXMAnr89/F+qEl+y1xUaV3x8bs4dhrC3wKps
	Y7RdPCwOfk+IgvkPhH8wTRwDP62m5w7nHtsAOMaFNjcGbC7Xw7e7bLNcP3JYo7Gf
	BwLzcuy5LlSJ1lzsXWRDFG5AGF9KuPYeHX5K2XnQK5GaDuu1KbQA==
X-ME-Sender: <xms:gbRfWfeFpRHlNt-LXZk_7MHiECA4R8wddWzhTx7pc0_o7xp_OHgFmA>
X-Sasl-enc: KU6CJcMEKLyTNYWK0U/yfYtimnC46iSPS0sL5X0frLpH 1499444353
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3DF7324426;
	Fri,  7 Jul 2017 12:19:13 -0400 (EDT)
Date: Fri, 7 Jul 2017 12:19:13 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to
 translate_insn
Message-ID: <20170707161913.GA16183@flamenco>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865801156.17063.15618379976159104550.stgit@frigg.lan>
 <244b5aab-8863-3139-f252-09cc02333eda@twiddle.net>
 <87inj4ebqn.fsf@frigg.lan>
 <c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: 2LU+0anRRhCC

On Fri, Jul 07, 2017 at 05:46:19 -1000, Richard Henderson wrote:
> I do wonder if we should provide a generic empty hook, so that a target that
> does not need a particular hook need not define an empty function.  It could
> just put e.g. "translator_noop" into the structure.  Ok, maybe a better name
> than that...

NULL would serve that purpose well. The subsequent "if (hook)" branch
would be essentially free because it'd be trivially predicted.

		E.
