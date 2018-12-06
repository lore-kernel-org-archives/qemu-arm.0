Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10580214wrt;
        Thu, 6 Dec 2018 04:49:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XEabACLnS2v5+kh7kaR2w7kirf6zrU4tXJJFYoxLaB5gHsLsZpd0ChWdx5BSD9NXEN32j0
X-Received: by 2002:a37:bc44:: with SMTP id m65mr25501611qkf.52.1544100549210;
        Thu, 06 Dec 2018 04:49:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544100549; cv=none;
        d=google.com; s=arc-20160816;
        b=C+id2USclZbmBhEAYLawHDmZf56nPEK9ZLmsNc9vjExqo6PHyxohhNtV/oMWj4WmUu
         isBrf0p/FUF3dz4odKFv5LTUrkorsDsfpu86VAAQGFo6v60a0RohlWcE3bCLefWO5mti
         3I9xyUxqzGpK9olHNo6TNETxD9Zgkl8rdakHpD43whMYRl+OS3akq3Vz5aecXGF8OKic
         0ITfcXTQ5vzxCMFeqD9V/gaZES5TEkQTPMRYmyLnsqEsBznR7QGghxDIQAEAYbqZlnJP
         DP2u4jgsnTbYKgjHmUEA+D/28XfECDTnzeHd4tCtA4Z5qWDQB7vc3RbaFpe2IwLCHJ10
         O7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=KlieW0r0bhUzpYJeJuNdzZkJyi4MQG/+FFXnIywqlao=;
        b=KOV9Eatmq1VP4Eycqd2C69rHGTVk+KOOth+jo7Amc6k6PuqsTaEpELF1lTSq5NInZZ
         yTWd/wMbBAdbYpJAhRPhSiBCT9lrEg6Ab3RrZTBhfNqZId5Tc6YOirfsn7O90gKkAQcp
         Wui284lR7yj54XmsXiGSFizjv5CP7wfAv0JQgzlj3OHCx+x3NwcstKX9jyoGsOp6OIvz
         d81vleeORpDFf9DPAl8RR2mNG4AGdxLHy5wus1l35+7MjTZrXzytM31qVqttUz0R6mJK
         iYer35F1fJrDd/O1BF1HaiIVWbZwLFtoNlTEhef2GxthMsUPzQJbHnHuFqpFIWkFEoKX
         QQzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b1si161184qtr.173.2018.12.06.04.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 04:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUt5Y-0005DY-Na
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 07:49:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUt5P-0005DR-Nz
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 07:49:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUt5P-0001Va-1X
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 07:48:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUt5O-0001V5-R7; Thu, 06 Dec 2018 07:48:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90456307DAA3;
	Thu,  6 Dec 2018 12:48:57 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E743860E3F;
	Thu,  6 Dec 2018 12:48:52 +0000 (UTC)
Date: Thu, 6 Dec 2018 10:48:51 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20181206124851.GV18284@habkost.net>
References: <20181205205827.19387-1-ehabkost@redhat.com>
	<20181205205827.19387-5-ehabkost@redhat.com>
	<20181205223035.GH768@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205223035.GH768@umbus.fritz.box>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 06 Dec 2018 12:48:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.0 4/5] spapr: Delete instance_options
 functions
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OyXREsjd8IlZ

On Thu, Dec 06, 2018 at 09:30:35AM +1100, David Gibson wrote:
> On Wed, Dec 05, 2018 at 06:58:26PM -0200, Eduardo Habkost wrote:
> > Now that all instance_options functions for spapr are empty,
> > delete them.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

Thanks!

> 
> Do you want me to stage the ppc patches in my ppc-for-4.0 tree, or
> would you prefer to keep your series together to go in via your tree?

I wouldn't mind to get this queued through the ppc tree, but
maybe it will be easier to get them through the machine tree
because of the dependency on the 4.0 machine-type patch.

-- 
Eduardo
