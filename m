Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp492457ejh;
        Thu, 25 Aug 2022 16:20:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR79P7j1NJuaEGkHKssBGc9e2DaR+d+tSj3zM+gjSKVN5o7fXNTnawa/AeOJMtxCOY74oFcU
X-Received: by 2002:ac8:5791:0:b0:343:e0c8:b48d with SMTP id v17-20020ac85791000000b00343e0c8b48dmr5681276qta.103.1661469633385;
        Thu, 25 Aug 2022 16:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661469633; cv=none;
        d=google.com; s=arc-20160816;
        b=QrKCjV8IrFs7D+GzvpmPSmdbeX5aJIEGKQxyvoBmo9LHcZrl2ED8V+TykfGxwerDp4
         JImr8z4q07AREb53saelwyD0Q/E5JGlNpZgHIWKh8U3k6wTqJb5V0B0qUg2GivwagbxY
         pFx5XfGzYC+si0dqNT5QZJJja58rGdedkNnUY1rw6YzgLOc8N2VN2XgQ6E+mPJswxA0w
         M2qUWAR6L5069Z87yz5m2E1gc7eivK6shJV93CBvqhNxiTnNxYuHnaQ+HooVeU+7qeOe
         0Uky/762SwKjh3LyPU+uJYktpBo8POHSQOea7K+m9i5veAGFXvSsPYpNrYYiHPtm16TK
         jr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:organization
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=coxUvJgYvb5DHASWOXqmsJjGXFF8Y8wNhH2q4MbPKD8=;
        b=AQoOgfLV8Q7T45x6NyUGi8rFwpzIk0AAKFDYKcC1ZqMaAEFzZQNe0gQfA+z+3YQzul
         EzdNDkk6RVHB2bSv3td9LQ4BEPVXg5mCmTqLs2FemkcgjEXAu6I+o+S+v1Bxtf14KUdN
         /vpgoTxrGRcjRh86KcODJrNrGcImbHj/RZmSvpvQix/IZlQfeWalan9lfi3Lxoawte0Z
         gQ3mBvqT2alm6gC/XFtEZO9PEt0IGq3YIR8qxklPru5c9GVFrPRUsYHLr0vKI6uzf9Hm
         jx3ApQmNSaDPqmq8Pt+eiD6NpHKpPvlUZWpI+l3sphdkSSH4tc7x9rjaUIAoG968rzYS
         Y4Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=FXAyuthu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a05620a454f00b006b552103d24si642523qkp.106.2022.08.25.16.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 16:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=FXAyuthu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gnu.org
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRM9I-0003ev-UH
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 19:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRM9A-0003eg-6h; Thu, 25 Aug 2022 19:20:24 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:60434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRM98-0004rl-9S; Thu, 25 Aug 2022 19:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=coxUvJgYvb5DHASWOXqmsJjGXFF8Y8wNhH2q4MbPKD8=; b=FXAyuthukzGBlG0cLn60
 Cjii8rIfzIGfs73DBU3KvbcWHUyutGhac+ZgVRsc4SJrkp40EITq7YAVw8ySFbAisSgJWRqU7iY8B
 Y6w8xY00ziAAV+F+3f+AWkkXoO43zOe9dwnfN/vTF65LMXVUeTe3im+4d5IyXF7pPkDTUkFI/iIvS
 WGmvEH9ODBomnxZQE0usETukEYjzj/qnSc3cqae62J/k1aACqYG4J3ltlRtNED/DZK4lZ0ECWgurh
 7MyF030rPUak1dJAHpugSLHrcUvZiYrizecNtcParEJE5bIPX8Z/yYM6h4rSV5FKdpjMUCbSeBDcF
 xi0ZUgHTFKWygg==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=42954 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRM92-00038x-Jz; Thu, 25 Aug 2022 19:20:21 -0400
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@gnu.org>) id 1oRM8z-0030cS-2h;
 Fri, 26 Aug 2022 01:20:13 +0200
Date: Fri, 26 Aug 2022 01:20:13 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org,
 garnermic@fb.com, patrick@stwcx.xyz, zhdaniel@fb.com
Subject: Re: slirp: Can I get IPv6-only DHCP working?
Message-ID: <20220825232013.43g4iieyqxrckkna@begin>
References: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
 <20220825225610.oio5h5bflp4gmaph@begin>
 <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q6rv5Vn9S/Qr

Peter Delevoryas, le jeu. 25 août 2022 16:15:26 -0700, a ecrit:
> On Fri, Aug 26, 2022 at 12:56:10AM +0200, Samuel Thibault wrote:
> > Peter Delevoryas, le jeu. 25 août 2022 15:38:53 -0700, a ecrit:
> > > It seems like there's support for an IPv6 dns proxy, and there's literally a
> > > file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
> > > whatever is necessary for TFTP network boot I guess.
> > 
> > For which DNS support is welcome :)
> > 
> > > Maybe there's no support then?
> > 
> > It seems there is:
> > 
> >     if (ri.want_dns) {
> >         *resp++ = OPTION_DNS_SERVERS >> 8; /* option-code high byte */
> >         *resp++ = OPTION_DNS_SERVERS; /* option-code low byte */
> >         *resp++ = 0; /* option-len high byte */
> >         *resp++ = 16; /* option-len low byte */
> >         memcpy(resp, &slirp->vnameserver_addr6, 16);
> >         resp += 16;
> >     }
> 
> Well, that's great, but actually I just care about whether slirp supports DHCPv6
> address requests. Sorry if I didn't explain that properly.

Ah. It doesn't seem to indeed.

> since the DHCPv6 hook "dhcpv6_input" is already there, maybe I can
> just get something going through there?

Probably.

Samuel
