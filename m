Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1326139lfm;
        Thu, 16 Jul 2020 02:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkpSO/e50MHvbmMW6A2N/LsWaYdO/6r1ZhQD4sWIRFNNhMg3GQfFFQodGcU0324sOzzF/K
X-Received: by 2002:a25:c00b:: with SMTP id c11mr4812067ybf.430.1594893222645;
        Thu, 16 Jul 2020 02:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594893222; cv=none;
        d=google.com; s=arc-20160816;
        b=jaewlzTqwnluq+2HNEseHI1Cc5/mb2gTfsf1lDHd8Bw4A0cn6Nbjh585IL0+IxCpK+
         tBzgZAkQnach2GVlznthBaLPVm7uD7fkz6lzu9767zZne7/2kSF1FLCCfduom3ZDKQ1c
         XVHtehBgjC3UGI8CWmq2JPJjlZLwFIOHkoGh2PcONT3MTnZuBh3lF9uTdhK/wlSdWAg5
         VjEvD3lq9Guq7BESy3XtH0Z/A9m0qcByTdJz3jDH6y2ZYQ7eW2pRHUbmPsuDiMmRmWE0
         cTr2nItmhn2uQGInvE2SopHqTJZ41LGfhW4+mIhgVfRgwgFi02r4uaa4bFkHE6y8I8XH
         ggWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mogIbW5Vp4Tt8nWB3B80QZOT06yGrcgAieGXxXOOBHo=;
        b=YDV1XJEv0yurh0DAVgzbPEbZw5GdYC+ptt08RNj3CrG7iT4L5x3tWRas8Kf1o0Di+A
         mG/8JKtRTNmkchp/ajBipIdIp4NDDHOobBpNZjmjeEKl7+hMY5R6ucpnyYlt4kpsjqLI
         Ognf6iMn+TTJ4zlFNccvaJ8ts28taCxkJrWCJV6QU0u9F2SseI1J2yvtvnlUcyehZ2Q1
         3FuBQSIJ2CQDz8Q1QT9LIKSsOP3KMyDc0yzXn/48GGep5mW3+UyhZr8z6yzqcqyrAHEz
         tjZ20H5RdygoXyUF4ZCyitu0O6gY1rSvP8Qb16ZhVSmFH3KwHvvQLVGpfnb+fO8msdCP
         F9cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="L/B91BoK";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d130si5707466ybd.483.2020.07.16.02.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 02:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="L/B91BoK";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jw0aE-00034z-1s
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 05:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jw0Z9-0001nf-L3
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:52:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45276
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jw0Z7-0006zm-Vh
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594893152;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mogIbW5Vp4Tt8nWB3B80QZOT06yGrcgAieGXxXOOBHo=;
 b=L/B91BoKWVcj55AN2nUYvaCXiKZOewqYMGAxbeoJxV63MQ7LUjYZuKWGSK/OSDgseMZduC
 BioteX6sR9vgObbBaUqPRzsoC/x05OHl9bZ8gpKwzGyNwxftLuYfMX5WJOkZAVKS5oEYLL
 rytF1Qb1v1xI6u1L885ExwlUoEIA8aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-whbr3DosOqeiLLggog8aBg-1; Thu, 16 Jul 2020 05:52:31 -0400
X-MC-Unique: whbr3DosOqeiLLggog8aBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E74C80183C;
 Thu, 16 Jul 2020 09:52:29 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 204E0106F752;
 Thu, 16 Jul 2020 09:52:21 +0000 (UTC)
Date: Thu, 16 Jul 2020 10:52:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/18] migration/vmstate: Document vmstate_dummy
Message-ID: <20200716095219.GJ227735@redhat.com>
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200703201911.26573-2-f4bug@amsat.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 04:55:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C6awgiRNDdp+

On Fri, Jul 03, 2020 at 10:18:54PM +0200, Philippe Mathieu-Daudé wrote:
> vmstate_dummy is special and restricted to linux-user. See commit
> c71c3e99b8 ("Add a vmstate_dummy struct for CONFIG_USER_ONLY").
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/migration/vmstate.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index f68ed7db13..af7d80cd4e 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -194,7 +194,7 @@ struct VMStateDescription {
>      const VMStateDescription **subsections;
>  };
>  
> -extern const VMStateDescription vmstate_dummy;
> +extern const VMStateDescription vmstate_dummy; /* Exclusively for linux-user */

Originally in the commit mentioned above, this was enforced at build time:

  +#ifdef CONFIG_USER_ONLY
  +extern const VMStateDescription vmstate_dummy;
  +#endif


but this was removed in

  commit 6afc14e92ac81b29c25f097468f7751d5df1b5bc
  Author: Stefan Weil <sw@weilnetz.de>
  Date:   Fri Feb 6 22:43:10 2015 +0100

    migration: Fix warning caused by missing declaration of vmstate_dummy
    
    Warning from the Sparse static analysis tool:
    
    stubs/vmstate.c:4:26: warning:
     symbol 'vmstate_dummy' was not declared. Should it be static?


So if this is really intended to only be used by linux-user, then I
suggest we put CONFIG_USER_ONLY back, and figure out a different
way to address the undeclared symbol problem. I guess the problem
was that stub code is shared both both user/softmmu builds. So
perhaps we need to stub this in linux-user only code, instead of
having it in the main stub library that is common.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

