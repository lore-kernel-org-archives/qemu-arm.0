Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp889704wrx;
        Fri, 12 Apr 2019 11:48:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwN5ssFK5HkRr9qb+0BALbOH/GjOjqnJFEU3SrK+YZWK4hL1oL5XNvIBsWPuDLsAjYPWqhN
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr8782831wru.104.1555094894740;
        Fri, 12 Apr 2019 11:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555094894; cv=none;
        d=google.com; s=arc-20160816;
        b=m7kHQIUMTibGBlfJs175uuplkruFUbNjGPf/ZgktgDSEnyiTDELnfQNApsR63EnM48
         Ppf07ld4MXBErxZObAlJO7jFtgJ3htEMSAVxyVtz/ielvenCpGYNFill1iszx3KHGiGl
         VAya8Ls+ktK+M19lvP8C4GpMefziDXNIzM4CYAXB+rU6LTsntmjT67t4yjN41KQo2/ep
         LywmV7xOIBytS+5jySIpyD9/1/Kg2jXcMC23uxufiuAaLolKlBEJJGodRkKhciamTpON
         0hQdvRR4k92sbDWP4lpHMs+21WWuGhGWAr7ntAPXyt52YcpGnYgZcMUrZnatMlteNxrO
         JDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=vLsT3DOxOUT76IhNPuVnKlifOxOqAEOT35ZbS/cUJwA=;
        b=WFrFWZMQe7ybgeuSuZOqNUQwyGCG+UfZTDqySvn+G0YtjB+LSBVSONIfXRjM87tjbP
         A3jMN0R1Os1ZWo21S79UARVpZnZqAl6T4LAIHU6oSxEyjT26GLW9Q5pTlaq081fc+MMc
         vRlBlRRZRZ4+sYEW/g2E5SaiZ/aRQgizJS6DZZroCSoik+i0az/j9R1EcbBdFav8YEEu
         WKEMspj1F4xKt44H7T0WMGiXWrHHJxu6qdueSCloDAssiMKguGSHqmQ4t+302OYs6zXM
         GzUvzHCcKzx4B0u7wEsqfrHga1yrt+AdANgUojQnGErK5Gw2UR0DTPzjCG1kdbXt+RgH
         z9tA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y27si29177082wrd.408.2019.04.12.11.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 11:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hF1Dh-0007Es-O6
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 14:48:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hF1DS-0007ER-3m
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 14:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hF1DQ-00047J-43
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 14:47:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hF1DM-00044x-5G; Fri, 12 Apr 2019 14:47:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 543BA30B0869;
	Fri, 12 Apr 2019 18:47:50 +0000 (UTC)
Received: from localhost (ovpn-116-78.gru2.redhat.com [10.97.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DBBF60603;
	Fri, 12 Apr 2019 18:47:45 +0000 (UTC)
Date: Fri, 12 Apr 2019 15:47:43 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190412184743.GC31999@habkost.net>
References: <20190411102025.22559-1-cohuck@redhat.com>
	<155497852263.12882.17138118894178379111@76452e4e88f2>
	<20190411125655.7feab799.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411125655.7feab799.cohuck@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 12 Apr 2019 18:47:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw: add compat machines
 for 4.1
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
Cc: fam@euphon.net, peter.maydell@linaro.org, mst@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, pasic@linux.ibm.com,
	borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sW8mhaAFm9MH

On Thu, Apr 11, 2019 at 12:56:55PM +0200, Cornelia Huck wrote:
> On Thu, 11 Apr 2019 03:28:46 -0700 (PDT)
> no-reply@patchew.org wrote:
> 
> > === OUTPUT BEGIN ===
> > ERROR: spaces required around that '=' (ctx:WxV)
> > #58: FILE: hw/i386/pc.c:118:
> > +GlobalProperty pc_compat_4_0[] ={};
> >                                 ^
> > 
> > total: 1 errors, 0 warnings, 160 lines checked
> 
> Yeah; trivial to fix by whoever applies this.

Fixed manually after committing.  Thanks!

-- 
Eduardo
