Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp190523lfq;
        Wed, 16 Sep 2020 19:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb/PS1zArMdv9T8FVvgR7vccGAgdXwuHr//QFV7WjzGDwfGI8pGSGPwxALNA/nC+88lmWu
X-Received: by 2002:a25:4841:: with SMTP id v62mr12296872yba.104.1600310851422;
        Wed, 16 Sep 2020 19:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600310851; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHLYewF6GWcyDUfI+asfLkOgZvv9qrk1veNjvkLd0K47dW5DKwn4StoVMEqS0EvThU
         FPnWekwJq6WrhY2OsWGdRv4AMgnvH1YouSQJXYtPIfi0NvgPeKY4zWz50gEcjMaPPQ6Z
         nudTsUpwbRaniok+6inBytCLgZhLsA2OEX1d1LubZVNPSDatF17L1or62BW5w+0KKcFe
         xZ3NzeH4h8SDkEBuJxEe+4WeOAjWZ0SFaVRInjRPgNAMnhmKrphW4zIHBKSVXNFa94rI
         WLJTZkpZ0uua+TxBeYg/5Qr9PJDJbiaCDENFpfDRSmlS9NCSQsb9udnhe6OPbdDLIdFp
         7G6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=78zHJiEeULje0l5YBCQ95qjmLDHg4lx0S+twWKM3bSM=;
        b=XS1R8W+xVuBiRoU6nVLEwHRvLQXqL0rkc7Ouc+MJxlIm26VbP8bxJJgk0Y/A+GstWF
         oVxmrJh72KjXzVTgabENov+qQN09Qy8Wlw96DYjR0zENn9fAObhNzKDxaIt1cQQASTa8
         5XSO6dEh8nG1F/zZMD9XErvf6TQ6U5SsabYeEJGKN4cFAGtTJIrJqBAYPG+dXBZmm2uW
         Q4+6zdKriYbQLod16IHVINoJjlcswQCtp6FRFtMeX9aJRyj/GltTrNuj+d4RKx/9yXQl
         PF4OzAx9pckyRsmgHUHctvhHGxVKpMTcuyfXcQhHQcb54/uw7l2pJbfGx9/NBwsz/jZK
         KsQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PfvprH9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v202si14949003ybv.429.2020.09.16.19.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 19:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PfvprH9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIjxK-0002j7-Ql
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 22:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIjx8-0002ia-RD
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 22:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIjx5-0006dW-9P
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 22:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600310834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78zHJiEeULje0l5YBCQ95qjmLDHg4lx0S+twWKM3bSM=;
 b=PfvprH9iBtSObikRyK3fvRSy0TB4hlU+VEEMOpwt/dCBHfuD12MI3BTK5fgPnnpIsnynxs
 u2lTchVap6/iKvyymTWJHSiJknNhA1fiDKZlXuwZ/+0gL61QFGqx8NBe12Mvb5w0sJFWSI
 zDGnTcHYBpgN75EGnjj4SdoOXgZGXr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-WOoE--kqMza4_O5moOhj8A-1; Wed, 16 Sep 2020 22:47:10 -0400
X-MC-Unique: WOoE--kqMza4_O5moOhj8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28FBC1074640;
 Thu, 17 Sep 2020 02:47:08 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ED3610021AA;
 Thu, 17 Sep 2020 02:47:03 +0000 (UTC)
Date: Wed, 16 Sep 2020 22:47:02 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] qom: Use DECLARE_INTERFACE_CHECKER macro
Message-ID: <20200917024702.GM7594@habkost.net>
References: <20200916223258.599367-1-ehabkost@redhat.com>
 <20200916223258.599367-3-ehabkost@redhat.com>
 <20200917004434.GF5258@yekko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200917004434.GF5258@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 22:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Daniel P. Berrange" <berrange@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oshqmxvit5EF

On Thu, Sep 17, 2020 at 10:44:34AM +1000, David Gibson wrote:
[...]
> > diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> > index 9adf1e4706..96aa63919a 100644
> > --- a/include/hw/acpi/acpi_dev_interface.h
> > +++ b/include/hw/acpi/acpi_dev_interface.h
> > @@ -21,9 +21,8 @@ typedef enum {
> >  typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
> >  DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
> >                         TYPE_ACPI_DEVICE_IF)
> > -#define ACPI_DEVICE_IF(obj) \
> > -     INTERFACE_CHECK(AcpiDeviceIf, (obj), \
> > -                     TYPE_ACPI_DEVICE_IF)
> > +DECLARE_INTERFACE_CHECKER(AcpiDeviceIf, ACPI_DEVICE_IF,
> > +                          TYPE_ACPI_DEVICE_IF)
> >  
> >  typedef struct AcpiDeviceIf AcpiDeviceIf;

This is broken because the typedef needs to be before
DECLARE_INTERFACE_CHECKER.  I will send v2.

-- 
Eduardo

