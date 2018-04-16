Received: by 10.28.4.212 with SMTP id 203csp2770797wme;
        Mon, 16 Apr 2018 08:22:23 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49vsorqPRJY8dLHMCwTykx9i6Ox3HarcmOG6Um/YjG8DtsHSejKHeA/RDFfBKf5rc6EIYXA
X-Received: by 10.55.79.81 with SMTP id d78mr16727748qkb.20.1523892143509;
        Mon, 16 Apr 2018 08:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523892143; cv=none;
        d=google.com; s=arc-20160816;
        b=OwBzXM1oTuxMwZELHdzURWaywuQ6i68NJG+WvTdoyJOKcdDTX6kBhLyu3hL+Rs4Nza
         zw3Gz4O+hNF4aQeZtFc6U+EjRY7Pr5HbB2c6kzK/qiwGEaNBYaB4SJwEwUvN3aKHeCen
         wTGM5c2S3sWUvoGWgRrENG4V258kZUJRckOHo0qpd1zGWz6UhbrQLBaHZ7xXtO6TOjX2
         dpEgE9Cmd72p+lpk8qMSBE8fenC6N9Btf424LKBzS6GkhHz78Nsy3zsskOYA8Zu03MSi
         Ycccz/cgCPNXWJz91AMnUQ8YQAA7fyfzresA5Lae31bn8nXzQcwKgVfXZfwNNFP6kRB+
         Z8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=C1evMTu7YZymmrxWkSrxH+IizKH78LtbFDSocA+VRvE=;
        b=eBCzm+cibfHW82DlOx0cY5xPdHARwTKBIlu07VR1P/a5ORNk/Z/hKJtXITM0Wgctyq
         AqSJUn1DMyX5eHFv3vcqP+MndYJgyQjbG/teuyBsA+jfwk4Q7mgdxP4F6Gau5QPQNU15
         dwUZsCj+RIyiVH7T0mVhU3ezyfBuGw5JkpFxBjCPTBCclRL+TdoqoQYimdmfB+hIX7Uw
         RBFRoCutGCBeAD9lTalGu95fCar6/vqHod6y6FTrnovEQFxBopuNFfl4PwsskYieXpK6
         bjISqbUUPAgUu7p7v2Jv8XCsMZQ9rr4p6K7f7W3GFUsGXtMioLBxGfJZFAXFG//Ysbtj
         UpFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ayGiWVe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h89si2408414qtd.212.2018.04.16.08.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 08:22:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ayGiWVe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f85xX-0006ST-0L
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 11:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f85xN-0006R5-Pz
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 11:22:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f85xN-0001Im-0X
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 11:22:13 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:44933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f85xM-0001IX-S2
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 11:22:12 -0400
Received: by mail-oi0-x241.google.com with SMTP id e11-v6so3499655oii.11
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C1evMTu7YZymmrxWkSrxH+IizKH78LtbFDSocA+VRvE=;
	b=ayGiWVe9p8MN7yp9c3buQ6ERMsu6pXNmmctvPpYpubtFDJifMDZODtP+mr5vezFJ9U
	owkX9sucsY9ai3LGn0g7YSA1KGzRlrTulWI4flANqzt5+jyBwZj/XRNdYil9QGLE9vBm
	QoxJ6VUTEJHug3+fPMrXx4pmq63NvO9qSf4Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C1evMTu7YZymmrxWkSrxH+IizKH78LtbFDSocA+VRvE=;
	b=rXIWr1A6CD+11xn4IFPvMe0i6NlVxF8wWi1gnHYWBcHDPosvazXpbSMqH5ULfrR8eh
	vOMy3VcQa3rOKK3wSxpzDp4Ya1WzORb4jky9s9bbF5XmBSPuJ84DYjNnDpwWSi6sri5B
	3sgi3A1CTr7XIk9kwSvybDRcvyW4ycg1ZO/GLJaXr1WG6Al3BvG3mPK5UwHlDJ0VwNpe
	+R6uw3LcnxFjCT0bSfCoLUEWVHh5BtIF+nEo/ZasQ8ndAXfL+s4gKWXYudoT2grGuC6z
	7+DzjJO9gS/hyooBJL8mM4PPBdmQxWA9iYK1qEsrASbJS9pqBuUbPTkzXsj9K729XDoa
	DWVQ==
X-Gm-Message-State: ALQs6tAzXclenAUWOgbRqgvuI8+H1GEe/9RYxmVAufIPiXBvCdchnEON
	yyZc5L9fpS31gyyisnlAV9h1yqONqnIlo2SB0Fk28ahM
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr14221541oig.164.1523892132021; 
	Mon, 16 Apr 2018 08:22:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 08:21:51
	-0700 (PDT)
In-Reply-To: <20180416151923.22588-1-peter.maydell@linaro.org>
References: <20180416151923.22588-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 16:21:51 +0100
Message-ID: <CAFEAcA8yBKOpUL6Qo8ejtvNYqrxisiwwvXwKGcScP_oKcms=cw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [prefix=PATCH for-2.12?] linux-user: check that all
 of AArch64 SVE extended sigframe is writable
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlNIPwNK4vUC

On 16 April 2018 at 16:19, Peter Maydell <peter.maydell@linaro.org> wrote:
> In commit 8c5931de0ac7738809 we added support for SVE extended
> sigframe records.  These mean that the signal frame might now be
> larger than the size of the target_rt_sigframe record, so make sure
> we call lock_user on the entire frame size when we're creating it.
> (The code for restoring the signal frame already correctly handles
> the extended records by locking the 'extra' section separately to the
> main section.)
>
> In particular, this fixes a bug even for non-SVE signal frames,
> because it extends the locked section to cover the
> target_rt_frame_record. Previously this was part of 'struct
> target_rt_sigframe', but in commit e1eecd1d9d4c1ade3 we pulled
> it out into its own struct, and so locking the target_rt_sigframe
> alone doesn't cover it. This bug would mean that we would fail
> to correctly handle the case where a signal was taken with
> SP pointing 16 bytes into an unwritable page, with the page
> immediately below it in memory being writable.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The requirements to trigger the bug sound implausible, except
> that the stack page might be unwritable because we just
> executed some trampoline code from it, so perhaps not so
> unlikely as it first seems? Not sure whether to put into 2.12
> or not...
> ---

I initially thought this was a non-bug with SVE not enabled, but
when I was testing it I realized it enlarged the size of the
region we VERIFY_WRITE even in the normal case, after commit
aac8f55633f4470e.

-- PMM
