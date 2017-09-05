Received: by 10.223.172.38 with SMTP id v35csp1637709wrc;
        Tue, 5 Sep 2017 09:48:41 -0700 (PDT)
X-Received: by 10.55.161.4 with SMTP id k4mr6423931qke.161.1504630121266;
        Tue, 05 Sep 2017 09:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504630121; cv=none;
        d=google.com; s=arc-20160816;
        b=beTBv+R4fyMuq3+K3uoCEsYl/9F0jQ+vTbZRhzbzlii/pCFRanPdyT8ZbZwi+NY/vl
         6mvMdbgdea0aZiJGCArQHBayV0omj9RPVfZwm7pj9oCJlWyvdEza/GnA0ONVTMB6IsX+
         8jZ9aN1b9kFCfzRm6L9sv5I75Ups6q4BHE83z5Pcb9ubWhTf01X6/WFKwMA8LKrfpuF9
         a/+QO2vX8RRo76ofeENjtndro94QNHSQYLExAJxV3BM97em3NmuNKkMsiKzAEFfPGCLE
         ji324LbHazo6oazt/fajn9fNftMCf4wcJBWmuUiWu0FbZb5jRjkfsNbJWSMIv+chwqOx
         lDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=92ni1rc30RW+cyz/ewxipHd5f4167Bo13qMhdOJeXO0=;
        b=ZapegB8+djtCqgC154XGgJUNPZz1TrukIT6xaZGGy3HcoXUotlkw4rVpt810Bz/XQh
         KmlqlBahROnzxa2JxPYKG705WQ/QdcqX8CEGlHZOyIULTvNdBByC5DZqQ2pXJt58iZWB
         QCNFNvBaDSr5M/UCyEATPSnOn7YzTC1BJnM9MLE2+2LYRxUXnTT/Avs5VIv9I/7hiKzP
         x3RDgOl1KK79ty9rF7SmxpVTtwj+EidfTmA4PxuDmgQ57I0JZwBybkZ2M0/hqlBl+QJG
         iwO202tdBGHIvfmAPZ5KGShNsmIwD6J8MPMiJatgS9BhP6ieKewX1r5DNnsoH6mbJwHW
         L0CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FUY2TTyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d51si655713qtb.383.2017.09.05.09.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 09:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FUY2TTyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpH1j-00048Q-1W
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 12:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dpH1W-000460-8e
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dpH1R-000435-QO
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:48:26 -0400
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:35434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dpH1R-00042x-Js
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:48:21 -0400
Received: by mail-pf0-x230.google.com with SMTP id g13so8703340pfm.2
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=92ni1rc30RW+cyz/ewxipHd5f4167Bo13qMhdOJeXO0=;
	b=FUY2TTyBQeWvPmixHctwdHvzFXEMyrEqRaTj7FIpMO2qhfM+eDJk2citfFFxPoLnYG
	ksL/3PPqbgJR6MNzqIfu2XzOPxdrQL1TrPpR9vPJ+Al4wE4+lGOOZOpasW6aJGGoCi6/
	5XKSsJkj5/eOBucGzj3R7RcV6yb1NBe+6iLZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=92ni1rc30RW+cyz/ewxipHd5f4167Bo13qMhdOJeXO0=;
	b=mt7T4NGDEkqHXCjgLy55jnT9Mjr1VY2//b2q7M63zIvbTbsDBl2mVFgJoFzglnk+jr
	DFeDy0M0kjW3XdVOGOZhKqJNqCOVWKhG2iHKjidSgiPrEoA4/F/QhtOLDJv2GjwSQNds
	xBcYw6TT/9RGOoPGievLNjkrCrDG0IjS4z98phBJkngHiQd5WwtBYvyxwkVHtX5fs9MT
	9B/QbDS3G92N5yQg2p/su9IWBS5QtP1WLT7eMDhOKwmbclCfNIfm7uPt+XpWyQNdQJhH
	bQktohQ8junsp++MWAY+q4yBAtNZLKCNkP/XwjwY3dZpoPoLKaRaBeX8SsMRAgVh9ccH
	X1sQ==
X-Gm-Message-State: AHPjjUj47UNaFvt5+HPi5pujnvAw8Jo8ER99SIFBLxJwmlqoOEjIrEbL
	l3JFhAG/Idoz+S4Y
X-Google-Smtp-Source: ADKCNb42B6hJP0Tksg8US2a/ae/5F67pscThqsodjBjvOKt/PZ2Tnl0zDeq6pqyi3YeADS3SR+wqXw==
X-Received: by 10.98.159.137 with SMTP id v9mr438565pfk.49.1504630100416;
	Tue, 05 Sep 2017 09:48:20 -0700 (PDT)
Received: from anchor.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	w90sm2030694pfi.80.2017.09.05.09.48.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 09:48:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-11-git-send-email-peter.maydell@linaro.org>
	<b59d3474-15e4-7f01-d4d7-8ca0fcfef6b5@linaro.org>
	<CAFEAcA_F-oRO0vT4d62G1vat9o0o9exPKfEXw_BykXnXZJEYgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d80ba882-c00a-f10b-b8bc-8f6383e8cb74@linaro.org>
Date: Tue, 5 Sep 2017 09:48:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_F-oRO0vT4d62G1vat9o0o9exPKfEXw_BykXnXZJEYgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS
 region
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mEgcHBRBvkYy

On 09/05/2017 09:26 AM, Peter Maydell wrote:
> We don't map the hole. The container is 0x21000 in size, the normal
> nvic_sysregs region is 0x1000 at offset 0x0 (which will be 0xe000e000
> in the system address space), and the NS alias region
> is 0x1000 at offset 0x20000 (0xe002e000 in the system address space).
> There's nothing mapped in the hole in the container, so accesses
> there will busfault, as they will for other PPB accesses before or
> after the SCSes.

Ok, it's not wrong, but I still don't understand the need for the container.


r~
