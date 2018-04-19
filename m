Received: by 10.28.4.212 with SMTP id 203csp374517wme;
        Thu, 19 Apr 2018 01:05:51 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+xyV6nfcpTYhx+eHM/D7Gx1QIbzJLGsWmMfZP7Dqw+EnHAVDFA4STrL3v7epCnu2ldQwDi
X-Received: by 2002:ac8:2ae9:: with SMTP id c38-v6mr5325548qta.150.1524125151820;
        Thu, 19 Apr 2018 01:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524125151; cv=none;
        d=google.com; s=arc-20160816;
        b=0zJqczm0Axj3/4mwrEneZO0GY/14OyZKTq2NJo9jgz456L+alqE0dUdAxmS3ALvOO4
         beL3LXTdht5VAirZbfzg4i7SCqsJUux09yx0kasoQejXmj3searruSLgnAvmF1JtaHTx
         edPiir4uzPpKw5GXnmRfaZftrle8lmwgPi6bP57ZMXeQWhQDuhjMlg43Rcg7En1gJhTV
         +pZVdNiPj8rCY6q8EbVXreHaBbViOc/Mi/dF2bdX4GpKemFYjSzHq4IYsnDxHJhAUS1F
         XroR1LghaDHczmcUCFJjwi5wt8lRK50dOa+BC2C6MU5XbCAEMi4DDVCkQlEfCxg87TfS
         +t5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=r2FseiojLazSAWcXQMT64tgHUAOzD9yTCg88mqlmHL4=;
        b=KcbS7VtJUaQGAAvwwXU1PCjJGAXt6KyjapP+Xk+Xq6UnNT0FQVv6bpQy18FU4fSblA
         5R71vHulz1TuVh1n15oR+/UeBcCncb7p0W/4g7v87sg9xMFJ/LSbs6f7L9pobW0H3aTT
         hmO6sr756FOXhFWyuzSlzrppyPmXryKrJPpdMswBRdzGTm/Bj/RrUNThF0j32QCzvF9u
         Pego49lnnDJejsPL1Mr7dH7rnET4PUsk5Jl2UlGAhnRCAHWU2hx70KJg+am6DPmdLHPe
         +mSUNrs7FRBW5xcERuGQIwLzqo84oAYC6DB+akrw8BC4hg2EiApysVRdBSgq4ay9+HpX
         ErgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s72si1117030qka.307.2018.04.19.01.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 01:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f94Zj-0003Vk-D2
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 04:05:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f94XX-00027e-KU
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 04:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f94Wf-0001qk-Is
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 04:03:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39526 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f94Wf-0001qK-DA; Thu, 19 Apr 2018 04:02:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A7B481A88A6;
	Thu, 19 Apr 2018 08:02:37 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49A672166BAE;
	Thu, 19 Apr 2018 08:02:32 +0000 (UTC)
Date: Thu, 19 Apr 2018 10:02:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180419100231.68536026@redhat.com>
In-Reply-To: <20180418145603.GN29865@localhost.localdomain>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-4-git-send-email-imammedo@redhat.com>
	<20180418145603.GN29865@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 08:02:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 08:02:37 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.13 v2 3/5] pc: simplify
 MachineClass::get_hotplug_handler handling
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger@redhat.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wa4TRJIwB9mj

On Wed, 18 Apr 2018 11:56:03 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Apr 18, 2018 at 04:28:03PM +0200, Igor Mammedov wrote:
> > By default MachineClass::get_hotplug_handler is NULL and concrete board
> > should set it to it's own handler.
> > Considering there isn't any default handler, drop saving empty
> > MachineClass::get_hotplug_handler in child class and make PC code
> > consistent with spapr/s390x boards.
> > 
> > We can bring this back when actual usecase surfaces and do it
> > consistently across boards that use get_hotplug_handler().
> > 
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> 
> [...]
> > @@ -2344,7 +2341,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
> >      HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> >      NMIClass *nc = NMI_CLASS(oc);
> >  
> > -    pcmc->get_hotplug_handler = mc->get_hotplug_handler;  
> 
> What about assert(!mc->get_hotplug_handler) just before
> overwriting it?
I'll make it patch on top of series to make sure that
every board that sets get_hotplug_handler will do it
consistently.

