Received: by 10.28.91.67 with SMTP id p64csp802459wmb;
        Fri, 9 Mar 2018 05:39:25 -0800 (PST)
X-Google-Smtp-Source: AG47ELvAsj0gobru+uJoCgfqFaDVumlbj+SFI1Ft1dvskJVlIxiNhq89B9i889fVVirst/VLhE7O
X-Received: by 2002:a25:9b88:: with SMTP id v8-v6mr1415744ybo.339.1520602765778;
        Fri, 09 Mar 2018 05:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520602765; cv=none;
        d=google.com; s=arc-20160816;
        b=j2zBCsW3MptqvOHflzDknSg7vcMmPCPIgizVdTgSrCWCdrbUb5Vdbv4RLcX01obcMe
         qWW+7/kusmYBKrLi77Nw5MAaWiMsGWfOgUKkKpwBFbbuFOLQCPX3+/rVJShnQatl4Im5
         NaX0UcuAeOTM1muU3Hr0CImRrS/9uxQ3nCzUjeFidSGOZuiaSTQ0Now0p4FcM7ggeVKD
         1rxdlNnYIJK0I/M79+TscMUHhusbw8qOgw8NbASBZNNdMP6cNZy9J4wN4ZntI7ksiG4V
         sCfY/UabP+nRQfzNxxPwvzCuMAVpa8iIcpEOTh9+pHswowtQgBOQWoNfKqZsmZ2/aW6U
         BaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eDciF17GZndltfGMlx6FHvejajvWEKbLr6ZF8bMxzBg=;
        b=r4wSeJwC3ve0CMT1a2xpiz9btRrK4Q9+WNt9IjlvG7iQZQ+jNrGPbEK/7jT79dO4vK
         VSwkdbOk+Znw+vlTT8DS4AaKEnYnLxL/zoLb8ULdB+moYUqMwxGk+gnrhL8i32L2xlof
         O7qIcgA0HPnD0ZyM32uz1mAPGUan8km0Q/B8pHwv/H9BkNZ7ST/STPKQG1VtWu6h8IKK
         cIbrJL9PiD+e02W9By7h2MN/gOM6imsDsp4DRiW39yg+SFjQLMG96eSjeQ3VNh+jYYQI
         BUSq0QXMh4nmewVP4ClUt+uZF/kRlmNVsqc7EeIO/Bq36R9+xdvJunNdezMK3ZrHy0dh
         Bz4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pz3cSGPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x201si174771ywx.781.2018.03.09.05.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 05:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pz3cSGPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euIF3-00061I-8A
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 08:39:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euIDv-0005ED-MD
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:38:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1euIDu-0000KW-Jk
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:38:15 -0500
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:33267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1euIDu-0000KC-DQ
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 08:38:14 -0500
Received: by mail-oi0-x229.google.com with SMTP id e9so6979572oii.0
	for <qemu-arm@nongnu.org>; Fri, 09 Mar 2018 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eDciF17GZndltfGMlx6FHvejajvWEKbLr6ZF8bMxzBg=;
	b=Pz3cSGPzErmak/AXSdn+SyVlYISaQAWAKTtzZi2vbVEJg39L5yFb5zY1PqOVinwRfC
	2y1J3P6p4O90T1Dq0B7UOGDG37ERxMxn2EYd7ey7vev2D/1tWSUFZOohZUHf93nS1isd
	S0QXiZ1xQNTrufLcGLpIqknuTZNhpaaWwsO+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eDciF17GZndltfGMlx6FHvejajvWEKbLr6ZF8bMxzBg=;
	b=BAezXR1VDhwaRjBJXkbsdUIPDgZhpdpPQcGnef/1R3UgyzpgP3U+iuqCzy1wW3/1oO
	f2fbSHYt8s9iPdbArPbfE1u9eeMwzXQEUWMJr+5XBTmGfgPi1y0+Tdjt/gicDY52IzhL
	XZDj2fHYCDoNS5ABGwY4OcoljMXiIiwxxCRqXZ5UrdChfQI65fJhqVeVTfo3CKBuFRSP
	R3jVilIszC7CqEOH2pQPv71edjDosk1wMT0hq4/H8GIcKNT1QtDJKICl/LVDynCCaCQ9
	WH+PnJ4yMpoyKtJ/XFwTLYPQzArd6WbsH7sCKkscCFNgsPAXQTf52VFBlDkv/lZjja6w
	ziBA==
X-Gm-Message-State: APf1xPB2M3/fg7lNc+iT+RWhxeJeEI0h40BVMRpEkhv0vuUps7220D2d
	SMoagHYh1Wb6Kq4y/noNU+WC5csbd7xiF11Si0m5qA==
X-Received: by 10.202.95.68 with SMTP id t65mr19911682oib.102.1520602693585;
	Fri, 09 Mar 2018 05:38:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Fri, 9 Mar 2018 05:37:53 -0800 (PST)
In-Reply-To: <d8fbbd0d-3e15-92b2-9e26-fb0103abe65f@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA871Ju5cV8EYiXEg65Rofh=Pn2=2h8wy4-QXj-wUzoj+g@mail.gmail.com>
	<d8fbbd0d-3e15-92b2-9e26-fb0103abe65f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Mar 2018 13:37:53 +0000
Message-ID: <CAFEAcA-XzeLWfb5tjHYF=3LQbeMge2yaEYRPqeMLn72u0xJ+kg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [PATCH v9 04/14] hw/arm/smmuv3: Skeleton
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zxduPFoDzybc

On 9 March 2018 at 13:19, Auger Eric <eric.auger@redhat.com> wrote:
> On 08/03/18 15:27, Peter Maydell wrote:
>> Consider specifically catching 8-byte accesses to non-64-bit registers?
>> This is CONSTRAINED UNPREDICTABLE (see spec section 6.2), and "one
>> of the registers is read/written and other half is RAZ/WI" is permitted
>> behaviour, but it does mean you need to be a little careful about not
>> letting the top 32 bits of val become non-zero for the 32-bit register
>> codepaths. Logging bad 64-bit accesses as LOG_GUEST_ERROR and making
>> them RAZ/WI might be nicer for guest software developers.
>
> I moved to ops with attrs and if a 64-bit access is attempted on
> something not a 64b reg base, I return an error + log a guest error.

Ah, you probably don't want to return MEMTX_ERROR, because that
becomes a guest CPU external-abort exception. An abort is listed
as one of the permitted constrained-unpredictable behaviours for
bad 64-bit accesses, but there is a note that "strongly recommends"
not to abort for cases where the registers might be used by software
associated with lower exception levels. Rather than trying to decide
which registers do or don't get to return MEMTX_ERROR, it's probably
easier just to RAZ/WI and return MEMTX_OK.

(We had to fix a bug like this in the gicv3 in commits f1945632b43e3
and 0cf09852015e when we started making MEMTX_ERROR generate aborts,
though in that case the spec is more definite that abort is not a
permitted behaviour.)

thanks
-- PMM
