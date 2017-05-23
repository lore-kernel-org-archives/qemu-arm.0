Received: by 10.25.0.6 with SMTP id 6csp1600203lfa;
        Mon, 22 May 2017 17:21:18 -0700 (PDT)
X-Received: by 10.176.24.167 with SMTP id t39mr14199783uag.79.1495498878711;
        Mon, 22 May 2017 17:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495498878; cv=none;
        d=google.com; s=arc-20160816;
        b=Mjiqpe8eWZ+qensITjQwGmLAGJ3HSvzSgoyfrODRHquxjAIZGd9rB81tjuqWqKXiUc
         GnC0EBye4WdtGTDNyNcLR896tGOc6h9BPfInC1cpvTTOXjVDWVa7sxSGse69ixXoEe47
         oPZmfou5qe3XeourxsFi9wVnPI9Pr9H++/5ucLUh3fjehbHM6jiGpJJ1YlI9r3aIjBAR
         1qsgTdX0bByB5npKg8msyv7UG0JqzdUTbnMzCfrSdSY9o9bjO6JKxNaLaFTF9TUR6W8G
         m9T1GWBE612NeS/beV9/6NoI7oa/xA1gB6YVlnC5nSbMXOMd6yW66od9zhlPlORXnwr7
         0NWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XYTWj1GGol47MvZPW/M4JscVWqiAVoTdnqEgE7g+qzI=;
        b=Z1qSlwALvVvQt6URmGujX11J76Hwl77I/FGXFka51sV0Nne8KpAAVTS4JtUvGhRv7x
         3dI7Ky0WaQz42hR3kaQjgb2LElVotutFBcab+qX++5feF0E2b6GYt99hhSB+u5ZRHocl
         RyKFUQQp7WghIaStelEnhfczclcJya0zJAC5NsiH2HGhO69LsDwzD6AIPAG+7zkhligH
         VrYf7hHdbFLRLYRy3xc+JlUzQKXKpSjirh9KJh2rEbQUqQwO5rf9exI+q47O4iP5G+ou
         2KhAJ2RJ1TiCYQPwO+qhcVebrbWAt1/6oAzEeaLhzulTgyY3DO5+g8xap9w+VUYywXYV
         Nb9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7si8476672ual.202.2017.05.22.17.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 17:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCxZe-0003ab-4i
	for alex.bennee@linaro.org; Mon, 22 May 2017 20:21:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dCxZW-0003aV-8T
	for qemu-arm@nongnu.org; Mon, 22 May 2017 20:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dCxZV-0004IO-BJ
	for qemu-arm@nongnu.org; Mon, 22 May 2017 20:21:10 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dCxZV-0004IF-4z; Mon, 22 May 2017 20:21:09 -0400
Received: by mail-qt0-x244.google.com with SMTP id a46so20302390qte.0;
	Mon, 22 May 2017 17:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XYTWj1GGol47MvZPW/M4JscVWqiAVoTdnqEgE7g+qzI=;
	b=DQ97u20tmeFnJB4kTdldtieWxOSK7iydwSP9PytQHoQNac2Ven+yG4+tMNdc8x/Jkr
	xw2VdyimCtoXu4WlpoOPYFQaoXe8Dnj8Xjt6RC+u/JpbKM953TbON5vmafXDLIfdugR9
	W5hKlPFhhlzibg2Abo308VzP2wRZZx855hphRQTAw6DMg/v03KbkP6Fu0lIQsfepmckU
	yR4OM95yyAOx+7RF6ugUmRnYC0HgyZgWJnuA0b/lV6kpnZ2x/xLQojVjDHQmuriQnnm8
	NVJz3d2e9Zs1uA/gs9d5Sqnsha/J+Ag5S98e2BakOXIjdvLfaKJ3tMTalSsDT8ssMjLO
	yelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XYTWj1GGol47MvZPW/M4JscVWqiAVoTdnqEgE7g+qzI=;
	b=IFRRYllJr3zjivm08rZtjrtoruaGkQa1wgY52515aL4Xvh8coW0ysZR5Eyz5Q/SqN5
	4FXOhGDfqlrskEqdLFUDXhQ6Hd/aHi8jQeSfShR7GXbAQxftBxk0G1Cu7JeUrAbIZ3te
	8M9NgG5tmPRBWlKPGe/KDB9gqQItsK4jjE5iY2IeurNsV4JCkF63R9qp/ZLbldwMtD6G
	hLpwtZuHEHunrX1eTKvcBKUz78fjhZcBRWAe3TOoRtwPG+aLmn3MbcO0l1joGma0JVWa
	B0AbYLvR5kz4V6A38B2KCA5DHVahr3fKT91dAGnZJdH5UIEjklaENvo4FvIOste5qIxs
	i+jw==
X-Gm-Message-State: AODbwcDnx/LkLKurHXafewzkmYiMkcOieff/VuVZn0yxz7L1QD5H0ALD
	b6jRAIaSJgmMJA==
X-Received: by 10.200.49.100 with SMTP id h33mr25429792qtb.52.1495498868331;
	Mon, 22 May 2017 17:21:08 -0700 (PDT)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	t35sm13075147qta.62.2017.05.22.17.21.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 May 2017 17:21:07 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>, qemu-devel@nongnu.org
References: <20170516230159.4195-1-aurelien@aurel32.net>
	<20170516230159.4195-2-aurelien@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <da637469-477b-0999-d495-e8f382ab813b@twiddle.net>
Date: Mon, 22 May 2017 17:21:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170516230159.4195-2-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] target/arm: optimize
 aarch32 rev16
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
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6nAOclUOqEc2

On 05/16/2017 04:01 PM, Aurelien Jarno wrote:
> Use the same mask to avoid having to load two different constants, as
> suggested by Richard Henderson.
> 
> Signed-off-by: Aurelien Jarno<aurelien@aurel32.net>
> ---
>   target/arm/translate.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
