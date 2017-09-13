Received: by 10.223.172.38 with SMTP id v35csp1005616wrc;
        Wed, 13 Sep 2017 05:48:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBH47pPTmceTieYA1MQvZY73du1S/2JSr43snPv3ZF5mxL62ve96pd8WVh1aktPfANzw1C2
X-Received: by 10.200.35.21 with SMTP id a21mr17613049qta.215.1505306930556;
        Wed, 13 Sep 2017 05:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505306930; cv=none;
        d=google.com; s=arc-20160816;
        b=erGVtp9S6RteaBcaW9gay0C3EiWuFjxsu8Jf+y8PVbF9ZOLo7ygYsPpf8l3zx649VX
         dtYb7cBIhUf9qJsZGuCnXScRC5O+kXMbUgZgJnn+I+5OkOYF6MJaStWaiJSNmCY9DhwQ
         6/TirxuNjpmdaaJVf9eD3i4AinAMCadaojlqF8glCd3zYpj7+Y6FrONjalXRlJhv6yM3
         M7F1oIwy1vC+3MgGZWdLCwJESl523jFdgk5Od9LAMDEUq7H5cM2GdRCmrf8qo4TWRqla
         y1d/3f1T8CC9svs01PZBcBz8WtAWLVACTbBdSWERST3yRvVIZhYcDb1NFNl+lsy050zS
         2BNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=HutsO9tkTmZps9oee7ur0LqOY09F8VUc0Z1Q7iqBIHs=;
        b=QE0kgiV3iMu9zMYGNo9LHy7wAND7hCXE3SCHCkYylp+pvi3ZPplvn6qfLjS93VxOnm
         7HDawSvlFe1xOzqEBmn2rPrUgGOnrmFW56oU57ROd4hkpXH6dLLGKqm9ITjuZs6N7aPm
         vua0DZbfZ/ESGZELeNcKpM2ulmRFw7hMKW4b0F14ueP3f7GMxFZ6xa4JS0TdfYawxsOG
         FM35T2ybLKzdL0xEi+hVLRbJnsTtwOA2b+/XMoKL8c2V0B1tyiNojAezOmb3nxBQ71lQ
         9dD3vVQh8/qV66tAAKuBUfHJ49jisZcjNfGwTkf49FnIPAgKDbH7U4SNwMPvhgwNDJdN
         tdOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l38si15002836qtk.138.2017.09.13.05.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 05:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds760-000790-7m
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 08:48:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds75m-00077L-H9
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds75i-00043c-Ei
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:48:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ds75i-00042d-7U; Wed, 13 Sep 2017 08:48:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 303025F7A6;
	Wed, 13 Sep 2017 12:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 303025F7A6
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B6EE6179F;
	Wed, 13 Sep 2017 12:48:27 +0000 (UTC)
Date: Wed, 13 Sep 2017 14:48:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20170913144825.48cad531.cohuck@redhat.com>
In-Reply-To: <20170913124456.GB2096@work-vm>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box>
	<20170913124456.GB2096@work-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 13 Sep 2017 12:48:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AfiSIPX6OB5f

On Wed, 13 Sep 2017 13:44:57 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:  
> > > Running QEMU with
> > >     qemu-system-ppc64 -M none -nographic -m 256
> > > and executing
> > >     dump-guest-memory /dev/null 0 8192
> > > results in segfault
> > > 
> > > Fix by checking if we have CPU, and exit with
> > > error if there is no CPU:
> > > 
> > >     (qemu) dump-guest-memory /dev/null
> > >     this feature or command is not currently supported
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>  
> > 
> > Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
> > of the series though.  
> 
> I can take the whole set through HMP.

If you do so, you should probably take "dump: do not dump non-existent
guest memory" as well.
