Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1305494lfm;
        Thu, 16 Jul 2020 02:22:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7/L3197RHf/4r+mlVakz2rKQc8JUiHTWum/7OePep/lfVtDmqJd/koKQRCQwbrZI9JfEX
X-Received: by 2002:a25:f201:: with SMTP id i1mr4467997ybe.522.1594891349640;
        Thu, 16 Jul 2020 02:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594891349; cv=none;
        d=google.com; s=arc-20160816;
        b=aQHhHl4Kv+bXET62V2L5UcGlufA5AJtugaMQkF0rU3YwtaJj7hdAJoXe/P8QHtSaTE
         7tfGpwywpytJdoroVkUTSDoTK3YTNWMOATLMHv8xEsOGt/hx/FdkWqGTe/sSs6dCw4Lm
         +0YWH0iJ/Vb//ZM42NYyiw9o9U9+BSTSNyFKzOVRCpN41PCoCMHY83zdZvG+OXir0bkI
         jo5qRQ22hBrtRVJVT9IXvavyiqRnxJM9bkf2lg1NT81uOTVoW2IYxlqVdGGIHC2o1gT3
         Zi+tppfmGGebHw+lRI1PLk/T1u2TfNbioBOhrfOIXIwny1ev/F5zbGyKwGuKHWP7dlFg
         bnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=ov/BFRbMhT8xKq9/Zj/DmkF0K4AfQTWJGzWHJONYZ+o=;
        b=Pw9E42gSPEB+oE3S/eJOZbPwHTZmkhY+xmDcVapfb4IXbCqgVG0apoztE18y5J6RRv
         jFY3yESv2C9vaRFqVL3uIyY+wNWWhByEZCYytQmVt23MVIP5P0wOMWj5oFtNH7C1elk4
         0PCOrhkTtbEEJt+8adOuAa/+AJQiPkqwYUJ2uxWzbsiLu/t6cLp9VJ57cGw/tRr3kKnR
         J7VW5Di4eWG5jIg/APUbM4uzxSf9oeCvcnigtBoMCmE3nV1umzju4SQnZLyaju3WrS9A
         NAkKEL5CKNVwwuk3iguwpswVmVsKb4TCX0+snzzfrlmbunv6lFxkM1T5cfBugpM+LzkE
         ELJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cdGIma6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si5372420ybl.309.2020.07.16.02.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 02:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cdGIma6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jw061-0002tM-25
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 05:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jw05t-0002sa-92
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 05:22:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46554
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jw05q-0007pR-J6
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 05:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594891336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ov/BFRbMhT8xKq9/Zj/DmkF0K4AfQTWJGzWHJONYZ+o=;
 b=cdGIma6dPXNyhmHQ6Hyoadk/G1n5GbOCQpKO8eGr1UHjjqdeSyjMF95exoU2t2EckvfO4F
 +gN2lZ2GFJ3PTmOch27K4OL5sVEmjz6AGMBbOzSSDNuRsLuNJ5UX5mxE+AQOngPtWZ/tVC
 cO6adcg4nwbPofotK7l/4pkpHfofR/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-dggiA4MLMDq7cXhYu8HtKg-1; Thu, 16 Jul 2020 05:22:13 -0400
X-MC-Unique: dggiA4MLMDq7cXhYu8HtKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FA68064D1;
 Thu, 16 Jul 2020 09:22:11 +0000 (UTC)
Received: from work-vm (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 177F278479;
 Thu, 16 Jul 2020 09:22:02 +0000 (UTC)
Date: Thu, 16 Jul 2020 10:22:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/18] migration/vmstate: Document vmstate_dummy
Message-ID: <20200716092200.GB2687@work-vm>
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200703201911.26573-2-f4bug@amsat.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 04:25:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zfFw/NhPzeqY

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
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

Which does mean it's a unfortunate name I guess for something so
specific.
(It's also very weird having a vmsd defined with no VMSTATE_END_OF_LIST
marker).

Dave

>  extern const VMStateInfo vmstate_info_bool;
>  
> -- 
> 2.21.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

