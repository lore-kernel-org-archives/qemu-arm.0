Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4126114lfq;
        Wed, 20 Jan 2021 02:57:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkWr/UFIjsXfaZjJpxqnX1h/FJ0KM7gWfUSZBPKq0OB6Fn0xp/+9L5Q3jz7kMpJXEqz1UD
X-Received: by 2002:a25:16c5:: with SMTP id 188mr12828570ybw.62.1611140257422;
        Wed, 20 Jan 2021 02:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611140257; cv=none;
        d=google.com; s=arc-20160816;
        b=AfCgFtojRDQNS2ElRLPIIpya7AwelnZdTUGru4U1ZPwNH2wvP801yviLbQCRE7h4tZ
         yTpX3sP+G7Cqc4gYFNP5BB6cn4rm/M0Ik6YHFsfSzVhBDyMWinL/7oUlnjwmNbIvWRQy
         PBZyOwdumF+Ehjr+Snse3SA6KHP0lgxdN3lTYEncs6j6iLCdZWZr89Hyrr8FVvikBd6P
         otxoFQiC6NN1fWd1gt7uANNCZeWNJOMdcJijkD15ZpAhD5DWX06sxdCaQLZK1vE6tA2R
         RMMe8/mWQnjLlwkT438OJcse7QqLKlGXE8VZYz39WdCsagQmInej2Rlsjwm2eIhVmk/K
         bUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=/qKCCA/3iCpuxx0scrjQLEBEMtqxzk7AZYVm5lfhvnc=;
        b=vXxlf1N1b1FGSvfHJCib3m35ayVJnROwi3RT55q8LkIBqIbv3sGLtEG2paFL+HrN4B
         jtLC3yGQs1mZ7nwAUF670ZrMTyBbX63W53Kve6sfRR/Gdb7LwfSUF/3IFb8SML5oH2zb
         Xg+RvWun/6dSG2mr46uGfgYSGk0xscY58A4TjTvmgN4oBqsHWG/izu+SMAxDgK0hM7NL
         6wdsud7fm/dB2tYZfmt9CCPJB3jOgrTHPuba8DRY44HO1Rh1/SKKemdhb5dTjNhVbYjR
         5IRbjT+aasXv9OE3PnSARWgu4R2ZCOh3yqcMYGNy3UizV9XWr5ivX5KPTP9P3kei7zrL
         Dksw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bjJT0UzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v69si1609640ybi.344.2021.01.20.02.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 02:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bjJT0UzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2BBA-0006vC-RO
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 05:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2BAc-0006sY-01
 for qemu-arm@nongnu.org; Wed, 20 Jan 2021 05:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2BAY-0002MJ-Tr
 for qemu-arm@nongnu.org; Wed, 20 Jan 2021 05:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611140217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qKCCA/3iCpuxx0scrjQLEBEMtqxzk7AZYVm5lfhvnc=;
 b=bjJT0UzH88h7JK87qRfjq6ccJGTmfEQee2hkqW6xowURdxQbDf3Md3+bQzRgLo7yKdw2Sl
 lpV9W6vgHwuhLqrm1mTbvOYxs+APXL3u3ZLJ0ikA9bTTe6mcbqHjt7kCMj9WWpeqGWa2KO
 rtkVgCJFljbl3OBm92uEZFLoqqC3Cf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-XV0LmhzPNpiBFFGW_iosUw-1; Wed, 20 Jan 2021 05:56:56 -0500
X-MC-Unique: XV0LmhzPNpiBFFGW_iosUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A24F107ACE3;
 Wed, 20 Jan 2021 10:56:54 +0000 (UTC)
Received: from work-vm (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95C9160C6A;
 Wed, 20 Jan 2021 10:56:46 +0000 (UTC)
Date: Wed, 20 Jan 2021 10:56:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 19/20] stubs/vmstate: Add VMSTATE_END_OF_LIST to
 vmstate_user_mode_cpu_dummy
Message-ID: <20210120105643.GC2930@work-vm>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-20-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210117192446.23753-20-f4bug@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yxW/ed5VtD4G

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> Add a name and end marker to the vmstate_user_mode_cpu_dummy variable.
> 
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  stubs/vmstate.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/stubs/vmstate.c b/stubs/vmstate.c
> index f561f9f39bd..1d0e03e233b 100644
> --- a/stubs/vmstate.c
> +++ b/stubs/vmstate.c
> @@ -2,7 +2,12 @@
>  #include "migration/vmstate.h"
>  
>  #if defined(CONFIG_USER_ONLY)
> -const VMStateDescription vmstate_user_mode_cpu_dummy = {};
> +const VMStateDescription vmstate_user_mode_cpu_dummy = {
> +    .name = "cpu_common_user",
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
>  #endif
>  
>  const VMStateDescription vmstate_no_state_to_migrate = {
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

