Received: by 10.103.124.15 with SMTP id x15csp745168vsc;
        Thu, 18 May 2017 11:20:52 -0700 (PDT)
X-Received: by 10.55.18.141 with SMTP id 13mr5602931qks.135.1495131652095;
        Thu, 18 May 2017 11:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495131652; cv=none;
        d=google.com; s=arc-20160816;
        b=W4u4btAer/SXkKLBGLXwYkz57WGniQepvHTudiMoSx/fKDfrdkKMfE5aORirl4tIRt
         Gud+vL4RaeyZRSfNG/S9uwx7Ej/VL3fylNKr9MEppzOiG1EtKqVv5nmRS4okQa95StYR
         kGjNXnbhHv4WWTJTu4CrAbncdkxJy6c0zrtitHPFpEgGbdmC41gAA6cyWCWXXwSbTB6O
         y4UC8Cs5ZMoBozy4X6sRNaeUO3um2jsNbOUsT9y9df7Va1vxsdg3SAp0dtKR1CMgRYWO
         TAHeLyMg3+NpcHf1wzmIkyZqkwDW+NiR1gDVKetSJYWqTPnO52js1KRAe1aHFDD8rsBb
         eEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=AhiTsGI8yz3xsWiJk1pMlhRNfUnRKAUpoDbP52zqS6U=;
        b=h2ZwTmsiscFDQ1Z+ziNQeDOCP2YxMAZPZ564WDAY/kcqWV/mXAKhlF9oFGOBYiQS07
         udG3/hiVrFsK8EWJPHl44cBaLHZMYyN7YulJRIUTUiyPu0IFd40ZxKaXT4835sKJH9IN
         8+My8jyRehl0YXp4hBq57Tex9eqnWcW+ySZ9OVWbyYEDfCDQHu3t6bdTDQpan0RDgwgM
         ZFThZEtnBTtUQFlWB6LCUoZtdHotjsLQAx7up//o8syIdmBJsxUZNvAYYdVNMPDzudUn
         ofSBgrEEgIuC+n+OJzIw95cMyvJZUx0V64n5OEgWPBcsLdeMJ/JGCLLXTa/qwRL+E+Rv
         8s6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v186si6152342qkc.206.2017.05.18.11.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 11:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBQ2d-0006FQ-ME
	for alex.bennee@linaro.org; Thu, 18 May 2017 14:20:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dBQ2Y-0006F2-Fl
	for qemu-arm@nongnu.org; Thu, 18 May 2017 14:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dBQ2U-0008Bm-EX
	for qemu-arm@nongnu.org; Thu, 18 May 2017 14:20:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dBQ2U-0008Bb-8Q; Thu, 18 May 2017 14:20:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 238BC2D9FE0;
	Thu, 18 May 2017 18:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 238BC2D9FE0
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 238BC2D9FE0
Received: from localhost (ovpn-116-71.gru2.redhat.com [10.97.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 714E760BE1;
	Thu, 18 May 2017 18:20:40 +0000 (UTC)
Date: Thu, 18 May 2017 15:20:39 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170518182039.GO4748@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495094971-177754-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 May 2017 18:20:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] numa: silence incomplete mapping warning
 under qtest
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
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLwcJ2RC8mgO

On Thu, May 18, 2017 at 10:09:31AM +0200, Igor Mammedov wrote:
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Where exactly is the test code that triggers those messages and
requires this patch? I would like to document that in the commit
message.

> ---
> CC: Markus Armbruster <armbru@redhat.com>
> 
> ---
>  hw/core/machine.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 2e91aa9..21ebef8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -21,6 +21,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/numa.h"
> +#include "sysemu/qtest.h"
>  
>  static char *machine_get_accel(Object *obj, Error **errp)
>  {
> @@ -732,7 +733,7 @@ static void machine_numa_finish_init(MachineState *machine)
>              }
>          }
>      }
> -    if (s->len) {
> +    if (s->len && !qtest_enabled()) {
>          error_report("warning: CPU(s) not present in any NUMA nodes: %s",
>                       s->str);
>          error_report("warning: All CPU(s) up to maxcpus should be described "
> -- 
> 2.7.4
> 

-- 
Eduardo
