Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3853442ejx;
        Tue, 15 Nov 2022 10:31:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Rfu/fhcDJij8bKD72fkA+DDE+jxscRpk6Ovhp28RUQhOYgneBTkKAZKBl3PS+HGrn87uI
X-Received: by 2002:a37:9a11:0:b0:6f9:da7f:84cf with SMTP id c17-20020a379a11000000b006f9da7f84cfmr16670522qke.618.1668537063739;
        Tue, 15 Nov 2022 10:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668537063; cv=none;
        d=google.com; s=arc-20160816;
        b=o95adtsdGphASI95NgiBhyZPgozHXqm5iZUhtnqUDtpU/BJD308llU3VqaaMhttPn7
         3tcoO3UY6PJvH9oFmzQDm7zxoCBCnsXGiod5+BsEMJY7VLd+WQmMPMFYYLzt3uoqOW5q
         rBd3g3zjhId20eRAoA3HUg8hN9awGCLw2ipD+FSAk2sdNjg0gRpI+vsVKjB1+N/cI8DR
         AvrS/JZkVvm9xyKR7CMkzIbJfTQTC7mmQgV4F7g0v9nJoH9U6E7eSXBAw7b3+YwutYlE
         UCO/QcApZFo450b7CG19C9aob657YvUDxZBiIZOtYl4n0FchHwjW7ASnVvsdgtNIxWbd
         LlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=u5NwgeGgF6KrNcGUFbMahPesFkm4VF2snU+c4Fl9C4U=;
        b=FtP1Fjns3HY0jPM78Uas/FLS79gSQYeX3+oGWNyBjgr2jnuiAnD4ntYdzpGDVgNO7T
         vy9zOEQpBaovDUipHJ+DCNLlQznE18bJvGU3QL4VxhFswZSgu3Z88Z/rNJbOvbrQFJ+t
         10SwOZKyuPCw8jUfc7Jj28J+BsVShV6a9p5qGS9SPPdfefGgxukV4dmbvYzS6i8D+2ET
         WF91NpLpDPQQP+pvmRtDNqATGRoveQ/Y+9H42K8KkHFoKjoCx3ZSzm3VxD5ZLm5qfQlF
         1To29scX+Pt3sz5HKIgIH6og9WCJQAENvG0ss7l4kkGzsWt1Wytu8nPtZD++MS1Rt6W4
         zwKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm2 header.b=P36qQ0oB;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=mjjsWBsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi27-20020a05620a319b00b006eecc1446edsi8263179qkb.115.2022.11.15.10.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 10:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm2 header.b=P36qQ0oB;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=mjjsWBsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ov0hs-0001tE-B8; Tue, 15 Nov 2022 13:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ov0hr-0001t1-HE; Tue, 15 Nov 2022 13:30:47 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ov0hp-00053Y-F5; Tue, 15 Nov 2022 13:30:47 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B62023200995;
 Tue, 15 Nov 2022 13:30:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 13:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668537041; x=1668623441; bh=u5NwgeGgF6
 KrNcGUFbMahPesFkm4VF2snU+c4Fl9C4U=; b=P36qQ0oB27P0G61sU7bNRaMpKP
 ohv0AomluCvYcV1606VpOpR4JxAGDZgRO5LAvwlu8oUF1XVFUprt/NtYn8OU9YPk
 jJ5cWsMQjKzySLMPqunfs0mDCgp1Orwy/a4kdQqU06NzuBBOVHgpeFJZSe+J7pa8
 mJ2/+PtH1QfGb0WoiGw3SK7bElD1XW77vOi1Gq6rDtwao1ZMdRKHUsyOiu7I2esA
 r841OVsFzqMO8n+StjeDw4nH5FZvrMSZBs1QDXyjW5h8MPzmLTk1rMazKY4TF03n
 uP6OHV9TFvYLn28CVoQHaocwuNF7khIcZYkPol1sLIBvHke9VaVcE1tdiD7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668537041; x=1668623441; bh=u5NwgeGgF6KrNcGUFbMahPesFkm4
 VF2snU+c4Fl9C4U=; b=mjjsWBsRgusDffHx7Wjc/aUUOXesEBPf33XEIaonTY8+
 icHU+WXKtRbAW5pYc8k6p+NZVNZ9kbhcUUSNN7krgnioKwX60N36fTeMQKHhigTU
 OONujjrg2nyRD58IMvHjjjJCadidRV+VWT5Q6quXV9yUZN417Rfm/yqYBSi724Jh
 3bk6KLkN5mm+JnbqHBJouUB2+G8U9bV4EPaewtyocPbUFdU6tz5/xK9wanxCTAGN
 jSvacgqS/MvwpamZzKPF1EaH2oEndKymMaHym4XaKwAQq3rodtilX4cEtiT1RXfJ
 oYwAhsthn9CXkWHB+kEILyODwYQi5gqb1KSxw9cDdw==
X-ME-Sender: <xms:0NpzY8xIKRzbRY4TKQqvk2HNTyUr__3aCwbInePH6OZzXEWrAYJnnQ>
 <xme:0NpzYwRjAWHkAAHAuwToNGeRRk76GR2MoG5fhpobg4eOGa7u1Kd9p3hBjlthvAnTg
 8RrZPwsjiEgBIjwdJo>
X-ME-Received: <xmr:0NpzY-UYnUPE4FrHHdNN-qVMvQ7uSXGhttIBHFMKaEOCKCEuGYCwB3SXFJCoBJv2vWYM0fBgC4_G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepfeetudffgfeuieeutdeghedtveetfeeuieeigedvuedugefgjeekffefhfev
 gfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:0NpzY6jDQLwnS3ZKBO-aRjwaxlBUZz9Eqenwl7tVmLiIK5GEe7SC4A>
 <xmx:0NpzY-ACgKLKzbouVpPBOocF2uE6Nzq9wfC2e9NLfDyTcQTQBp4P1Q>
 <xmx:0NpzY7IVfZrbvSzTS52tev9Yu9eLNg1yuhzT7fLgkNHMW2eFCwdwDQ>
 <xmx:0dpzYw156qBBN3Dw4INQ1T1JLJyATO8uxWrV_K5F203COX8Hav39Xg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 13:30:39 -0500 (EST)
Date: Tue, 15 Nov 2022 10:30:38 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, patrick@stwcx.xyz,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Message-ID: <Y3PaznQgV800nX6K@pdel-fedora-MJ0HJWH9>
References: <20221114190823.1888691-1-peter@pjd.dev>
 <CAFEAcA9itEDTrznX1KRVEza__Dch95aBpPzbdTJ0-tuxwiHtoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9itEDTrznX1KRVEza__Dch95aBpPzbdTJ0-tuxwiHtoQ@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HsxZqsPnBykq

On Tue, Nov 15, 2022 at 10:48:40AM +0000, Peter Maydell wrote:
> On Mon, 14 Nov 2022 at 19:08, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > I've been using this patch for a long time so that I don't have to use
> > dd to zero-extend stuff all the time. It's just doing what people are
> > doing already, right? I hope it's not controversial.
> 
> We just had a thread about this kind of thing for one of the
> riscv boards (although there the attempted approach was to
> change the size of the flash device to match the provided
> file, rather than changing the file to match the flash device):
> https://lore.kernel.org/qemu-devel/20221107130217.2243815-1-sunilvl@ventanamicro.com/

Thanks for linking this!

> 
> The short summary is (a) yes, it's controversial and
> (b) if we do something for this we need to have a standard
> approach that we do on all boards, not "some boards do
> some weird magic in different ways from everything else"...

I see, that's ok, I'll investigate option (b) then.

Thanks,
Peter

> 
> thanks
> -- PMM
