Received: by 10.25.15.197 with SMTP id 66csp1728576lfp;
        Mon, 26 Jun 2017 14:08:05 -0700 (PDT)
X-Received: by 10.55.159.8 with SMTP id i8mr2721809qke.27.1498511285456;
        Mon, 26 Jun 2017 14:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498511285; cv=none;
        d=google.com; s=arc-20160816;
        b=AtQ14x4p33itidR5RVvcWKqQS/WakGl9OKEvSNqpSH3Xi3NOxN1WvnM4m67OhDc0u4
         Lkj4MgfjVBCj1wUtrcDRoqntLLyIT8qTRmJNcEfFTySlphGSFKYTxB2LZOD7GNJhhYYB
         rj4VOZKRAKwC7QcQp1r92eFOzWhRL0DZD8GoxW6kR44MjYlgWDAsy7AGaBWwY4syPqEt
         yDTUtZZfHOklCKdFSyIBBIatO5hHmjip3HNxFb66Wz8Lf3O3rksBix+aVx5bNgy1znOo
         Q8M9pYKQO+QH1GFvefLy+CDv2WfzIfJqZJliR47odKVWgnxGqsICDCNQ2D8uWLxRpDGZ
         kQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=81r4OwjB5XDB6IfwuRKiSZDeni4EatqFnphCkYWUPV8=;
        b=lCed6by1kinkAszuWxA+CPie/i1PBcLoYJSm++OGwFys0Mv1BbCwxmAj4wghew2Ylt
         IWIorih5f0/xB8ClSip74xqh/nPMN5a2hY0ch+eAXJ9ZPYjdIGXuDXtGQ391VuVLQ4PJ
         xlYIRZoSqbJHl3ErNQkyyuqSpJpAmO+VBY/wfGnNhmaZ0L/2OJCxNhorh+eHNml3Tulc
         txWAsWmo/Dy4gWnUfLbcPcK5gY1BpqUlv8OozuvxfTxjDj5SgfTanlo7XwM/iCmqFr4S
         KltuLTGKOTtnh1pWa8bZ/0ClxM9gqAs4vBd0+sdfVUo7Dnj1rEZ6XwfBtPYy93bN05pY
         bq6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=bdjcLi1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si243299qkd.274.2017.06.26.14.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 14:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=bdjcLi1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPbEo-0002Lt-PB
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 17:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dPbEg-0002K0-5Z
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 17:07:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dPbEf-0007C5-DM
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 17:07:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:32972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dPbEa-00078V-7c; Mon, 26 Jun 2017 17:07:48 -0400
Received: by mail-qk0-x243.google.com with SMTP id p21so1706195qke.0;
	Mon, 26 Jun 2017 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=81r4OwjB5XDB6IfwuRKiSZDeni4EatqFnphCkYWUPV8=;
	b=bdjcLi1zQe9HmnvtYEJa2qStq/52YGGTzI7SC4+zU1SblNI/14X9enDujvYtcBtqfn
	fO1qoKU5kpaUNbL0FxNG40FF9Hne7MomUZEQtAyDBnIC+29DiAKkQ6kWWVLJfIzgANvw
	Y954yyS4fgddPdv67PO4YjcnLL306KaiSVtk7P++QhPxl5/y106g9GutlEe0pzvcg0fb
	AbtfpU1FahaW6d8q6bAUDJdW4U9NoofS4wXJz+L/AIrvflp/JGlGIIDYNPr1Tgs9V7oc
	ORgMJYxSlUEyo8pdsDRh/ESeNWBo3IJTL+gDHFZso1h+llqmWK5R62R1TXSzmJniGmnG
	gXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=81r4OwjB5XDB6IfwuRKiSZDeni4EatqFnphCkYWUPV8=;
	b=WUrIeon30vBXsOu+YcBh3ZFRxcnuk8K6iHCRozjq681LiMOQTX0oIRyTNDgpSQ3KIq
	N+E26ivyqezXiBOPC+cLlWjqcqq36k2G2KEjN/C61gQKmlsYR/sAVn+vgu6RDAOM/5dx
	x8gcyDxmVWdwYCvwV3oD2MEUsbRAzi4O8ZT62PGlzDcVvbM1t0cf9YwCrrvNlOIolvI5
	5I/u6EqB9nHElNLR59L5NvtJGaPMsEz8d+UH0G9x/nECHWdRiuBa3FPoN7d+FABgOIxx
	egDvFzOh+VtPidOxwAGEMOVeY0ug4NSd+ghAmqBUlRJjW92A/MxAHukg3ST1Y2FGFXzk
	m7CA==
X-Gm-Message-State: AKS2vOyKacuQEWhgw/AJmBn6evtrEQ3h7Xor/mRikh1PUmBDNKTKloEL
	FHEHSKHVNrO1dA==
X-Received: by 10.55.220.133 with SMTP id v127mr2835952qki.42.1498511266251;
	Mon, 26 Jun 2017 14:07:46 -0700 (PDT)
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net.
	[97.113.165.157]) by smtp.googlemail.com with ESMTPSA id
	h68sm844593qkb.47.2017.06.26.14.07.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 14:07:44 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1497639397-19453-1-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <ee142dc2-9d34-169a-af1e-f24d2e211286@twiddle.net>
Date: Mon, 26 Jun 2017 14:07:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1497639397-19453-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 0/2] cpu_env in gen-icount
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
X-TUID: D3C7nY2SK3yU

On 06/16/2017 11:56 AM, Emilio G. Cota wrote:
> v1: https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg03771.html
> 
> Changes from v1:
> 
> - Use tcg_ctx.tcg_env instead of passing cpu_env around as suggested
>    by Richard.
> - Added Richard's R-b tag to patch 1.

Applied to the tcg queue.


r~

