Received: by 10.28.4.212 with SMTP id 203csp393171wme;
        Thu, 19 Apr 2018 01:30:51 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp5r3EKUNrUIXEJ6/+5iWx7rphjrDnHl4OEU9/51E/A/BHwkbDrXQcNOOmAvfjcbQdaqcZl
X-Received: by 2002:ac8:3788:: with SMTP id d8-v6mr5475119qtc.61.1524126651555;
        Thu, 19 Apr 2018 01:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524126651; cv=none;
        d=google.com; s=arc-20160816;
        b=pOdzOTSEQs/sHCyxd91cEmR51b9MmLbx1dVmWffLPHIsP1oaNzeQf8tLqS6G3Z1aXw
         cKlQTd8KU3C2aloXwFKEwo428QFEuTe5uLZmezB6flWR9j6WtSEREcWCjsJz+FR8hjAS
         vkGjCz5Gio2l1RK7qFEDUXS76UPsoKiIVLhjRpxFwp+6a5b2OPT8k4QrAfwIDrgTKvcj
         TBcHlr3lB+OmRAOzTKxVOVhbNbzn55k0+/Z0HfySLIBfatdcjxiLZhGPug11M/Yo6WG6
         eFfWIWv7aMqwJJ43jssfl4gWdFjpVLF/398pUn8/Opnq8b3q5AAV5AeEzr7gb2hYkeWH
         VGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=/wJLk8QH8zNHm8dK8ljktNSKeqNu01Ce6GEoA7H4XR4=;
        b=b+ynupomwX+ZxEPlRJB2XvfpV9ywPaK/NZqbN/9DIYVWNRKfrey61cC500xmmXaqLD
         KaFAurd5O0kiVqLJCRN5Wr8UDsn/rxRSIH2bzyzSC8murQyVHeTAmAYdZoY4FHLgt4vT
         HZtnjeSCXn5i53LwVMR0D7zLRGEKUsWngHDDMxR0vfVEwL0nCP1SurSvxsqs2w7NDDRb
         35/u6iZGINV5hK2djc9woXU9NQBBOBVdvzORnqNIxS277xbHL9Un8qeESQjdPKHQB4sF
         HGA6+ugESazqVrB2YhozyE7bZBaDX22qu7pWnwH5S1u7r2AZIlepnRmJ2CEm84bknHTT
         mWKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si242067qkc.6.2018.04.19.01.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 01:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f94xv-0005CX-4u
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 04:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f94xg-00059R-Vj
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 04:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f94xb-0003Vu-35
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 04:30:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55276 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f94xa-0003V8-Qs; Thu, 19 Apr 2018 04:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43BE141662E0;
	Thu, 19 Apr 2018 08:30:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16D982166BAE;
	Thu, 19 Apr 2018 08:30:20 +0000 (UTC)
Date: Thu, 19 Apr 2018 10:30:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20180419103019.39f8850a@redhat.com>
In-Reply-To: <20180419041520.GJ2317@umbus.fritz.box>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-3-git-send-email-imammedo@redhat.com>
	<20180419041520.GJ2317@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 19 Apr 2018 08:30:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 19 Apr 2018 08:30:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-2.13 v2 2/5] ppc: e500: switch E500 based
 machines to full machine definition
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
Cc: peter.maydell@linaro.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	qemu-arm@nongnu.org, "open list:e500" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8T+FZaMrrG1X

On Thu, 19 Apr 2018 14:15:20 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Apr 18, 2018 at 04:28:02PM +0200, Igor Mammedov wrote:
> > Convert PPCE500Params to PCCE500MachineClass which it essentially is,
> > and introduce PCCE500MachineState to keep track of E500 specific
> > state instead of adding global variables or extra parameters to
> > functions when we need to keep data beyond machine init
> > (i.e. make it look like typical fully defined machine).
> > 
> > It's pretty shallow conversion instead of currently used trivial
> > DEFINE_MACHINE() macro. It adds extra 60LOC of boilerplate code
> > of full machine definition.
> > 
> > The patch on top[1] will use PCCE500MachineState to keep track of
> > platform_bus device and add E500Plate specific machine class
> > to use HOTPLUG_HANDLER for explicitly initializing dynamic
> > sysbus devices at the time they are added instead of delaying
> > it to machine done time by platform_bus_init_notify() which is
> > being removed.
> > 
> > 1)  <1523551221-11612-3-git-send-email-imammedo@redhat.com>
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>  
> 
> As noted elsewhere, I've already merged this into my ppc-for-2.13
> tree.  However, don't let that stop you from posting and/or queueing
> it elsewhere.  Whoever ends up merging first once 2.13 opens, it
> should be easy to resolve.
Yep, that's been intention, i.e. have whole series on list so
reader won't have to hunt for queued dependencies in different trees.
After all it's trivial to fix merge conflict when path is merged
in several trees.
