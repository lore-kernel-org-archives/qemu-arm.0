Received: by 10.25.0.23 with SMTP id 23csp1080037lfa;
        Thu, 15 Jun 2017 19:54:27 -0700 (PDT)
X-Received: by 10.237.57.137 with SMTP id m9mr10554393qte.45.1497581667454;
        Thu, 15 Jun 2017 19:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497581667; cv=none;
        d=google.com; s=arc-20160816;
        b=aBclsTgnOAuwtdJLMEvAQwwTyxX6MRpJFyPvrQkLyBmV8ERlj1Im8gjdXUPmmqkvdU
         9XF7p8z4xYk8eZPA0WaN1fsBcC/5FGyqrk+BsS1vyd+H2XmAV97pULtn9P1wwyynnLqa
         aE76pQMQCo6xK3xcvOyEy39MQNrzs0TxfCGf9xJDO7LEK92clUbkpd1ZiU3jxuEEX5mi
         PCly3xyej+bKRPvJRFMb7tORjYXkV++TiQ4zuLo2tnBIT2iP9oyFMLq15HX3JAbebY6E
         Dr6Bm5q9ZsDXWQMaA1rLGXleKyjBsLpGaQ5SgMwvlt2eMftUHFZaPO2GML4TaZ6UvUDT
         g29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=0cpI0cfhd4YZE7ROQyyReIPfxwbLkjin+4UC6HWn8OU=;
        b=ssrhDJ4kE+E1VT0jZ9tSp8PSIubEEQjnPx2hEX+ykBAXgiiOOeYiezXLwXYr0cVfjD
         7W3LSaXFyzplp4FahEQhhFcqRTdB7qauSc36pd8mErcoN+DhAP9b2JtRBWlxLEroW3qn
         9AF0u/+Wl5PAHYOYj2hXf4pady7qYwqZVsNXvRA5cL6OSO9YqfzESL/MRY4QG4gmVtZx
         2KBKrPDJi+/CvcVUZqX+yn25tpfHZw0wjgQwWIoUdWAcQiWFBI0hRIqZEcqLFaGgPvSe
         7AXnBTzdjtu89xJs/PxGTzU8IQkAQjdDpDmhdx0MagGxdHGR1lLAC5292Nq529lJPtos
         io7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aIMoQ3C9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n88si933839qtd.390.2017.06.15.19.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Jun 2017 19:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aIMoQ3C9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLhOy-0000Dm-Ox
	for alex.bennee@linaro.org; Thu, 15 Jun 2017 22:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dLhOu-0000CA-9E
	for qemu-arm@nongnu.org; Thu, 15 Jun 2017 22:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dLhOt-0002xE-BC
	for qemu-arm@nongnu.org; Thu, 15 Jun 2017 22:54:20 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dLhOp-0002sI-2D; Thu, 15 Jun 2017 22:54:15 -0400
Received: by mail-qt0-x243.google.com with SMTP id x58so7291612qtc.2;
	Thu, 15 Jun 2017 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0cpI0cfhd4YZE7ROQyyReIPfxwbLkjin+4UC6HWn8OU=;
	b=aIMoQ3C9CXSwX7wOJByc+yUAUnfcNT8fTD9NNCptafo16bSFGyASwx+VT6n7qOtdnV
	dpD27p3gmpJQWgt7pxiO2SRl0I+p95OafCDH6R11NNWGa0oCTyax71b+r5utFG1/KdiK
	BYDqRFDt3pKT6CZgCDx+rJUM/lDhjVbZTjsmneBmBBt5eT3RDpeqqB50/HEmzURtAZew
	Hz/NgZEP0CkhthRcEC9khTooITGqmyFIDTUOag+sjIXZ3Jkj3+RUPQXrfsEfEeRf/nxV
	bokBZ0DMHe8wJX7NEq1w/AZCzuarDnU+yrVW9iC3IhJwA0BRnLz4MQKQDhjXyG7+yIPA
	z/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0cpI0cfhd4YZE7ROQyyReIPfxwbLkjin+4UC6HWn8OU=;
	b=QSyrDcOLYP2sc0r4oaHsz/9S8c+p+x0NWoxkRjsRFln4Xf2p71uM1dKw7ooNLgbdrx
	5Zpqnit53c3Ozw+1bE/1EizXvISaLsBHeXlw0SsOdSsfeIUIewy+TAfAGm3UVWqZaDqP
	YYBXyVJUnlFeiQtSBUd73qxXZ3OC6rnjdCyrHJCAuaqfXpKhXksjhwte6Tq2I+WoDJQn
	y8lR2Q6ctXk3cuk/AGTjOdpYcjuoUQtASaH89Rt/9I1DhiGUhy8h0e3b7kJ3Uzamtd9Z
	kGnZ3BUn693Xm8EenvtMY4M0izvORYhrPAeELORQvzuqXlITlifcE29Efb8bVnUkytht
	t48w==
X-Gm-Message-State: AKS2vOxiWmXcOD79vIx445zW4+rD24mEE0LgeyZGATCOznrtT+Dpg3lf
	GtKEc1Gk1Mu8iQ==
X-Received: by 10.55.19.142 with SMTP id 14mr10278471qkt.78.1497581652990;
	Thu, 15 Jun 2017 19:54:12 -0700 (PDT)
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net.
	[97.113.165.157]) by smtp.googlemail.com with ESMTPSA id
	m14sm333076qki.35.2017.06.15.19.54.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jun 2017 19:54:11 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1497567879-13734-1-git-send-email-cota@braap.org>
	<1497567879-13734-2-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <8a6445d8-ce0f-55d9-b250-71ccb917baaa@twiddle.net>
Date: Thu, 15 Jun 2017 19:54:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1497567879-13734-2-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
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
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rb/SxqD5AHym

On 06/15/2017 04:04 PM, Emilio G. Cota wrote:
> We are relying on cpu_env being defined as a global, yet most
> targets (i.e. all but arm/a64) have it defined as a local variable.
> Luckily all of them use the same "cpu_env" name, but really
> compilation shouldn't break if the name of that local variable
> changed.
> 
> This patch fixes it by explicitly passing cpu_env to the gen_*
> inlines that need it. This change also helps paving the way for
> the upcoming "translation loop common to all targets" work.
> 
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---

Nack.  If you want to make a change, this should be tcg_ctx.tcg_env.


r~
