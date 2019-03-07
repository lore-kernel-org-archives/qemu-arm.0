Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7102645wrx;
        Thu, 7 Mar 2019 04:49:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiXy9uM0kZ0Dz3IS3qZ0vEWrxp9z4RgFduOsCgprqJybVk4Zd4H49nCdEwSvAkb5Xin2n+
X-Received: by 2002:a0d:ecc8:: with SMTP id v191mr9916570ywe.511.1551962982274;
        Thu, 07 Mar 2019 04:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551962982; cv=none;
        d=google.com; s=arc-20160816;
        b=rfiwxmCfRoklrjBYwJKL15eIdD83ESholVf2uQnAIHHunyKjuvoKjTt/ilkIf0FDf/
         CZEIQfoisalot+wTQzPPAgQw/0Z2VQeSQ313Lp4xrA+Htv281HmWOM6WEhmjpLs39rNb
         gaFbJNGNkQa7NUgwTgHSeehQJibuRqxlfhzPYsBrn1lt1VLdVfpyi0Orpmej9WY3y9QV
         DCgkbNSYDubII67I16p0ngpstKwubPsG3RwGJhcl2VTa/H7JzBhyIP79DTbO+NbK/bfw
         i1p+AlQhRi/aUAd6h8UvGwrzxwK4zBjVjLaLDRRhCaTGBMUKhR1RcY1KzGGBt7GrRveF
         np/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=aL+6amcG1zNsT59EeqLJEqbV2Dcm30Et9zMZ/8jq0Ek=;
        b=FSDU6LNOMhL8PiB8UWczQY/g4AC/uzOq0qwNJhDd2PQT1MfcRonSPaes3T+h5PWyC1
         DLOlVXytwqr8q1m9rRhIojxOwF9JrcMV6CT0mZEH9vUDhlt3lIkdJKrhdxvsSW9ujL6J
         MWpVZeXB6++i7kH2FhYcboY2WdZlnOEsDc/6gc7VcT3XUw5r7y/gsHhV+pNdBIkZEJks
         jqtmPzxDyz6skaAlRWIJqvxjA6u5FIP4IfXMWHoR09qiWVZrLkVq8J3atJbxXm7/cFul
         m9ZU8zhqPmebFI7dqJwA7flpg8DWqwulkpAwikZwWTArwjpznUTNNf48NOyExkJUv63K
         qTcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si2419785ybc.393.2019.03.07.04.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 04:49:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1sSz-00067R-Pf
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 07:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h1sO0-0002xJ-3F
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 07:44:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h1sNz-0000In-8P
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 07:44:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1h1sNx-0000DT-0l; Thu, 07 Mar 2019 07:44:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC9B630EBE76;
	Thu,  7 Mar 2019 12:44:27 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63E6A5D9E2;
	Thu,  7 Mar 2019 12:44:21 +0000 (UTC)
Date: Thu, 7 Mar 2019 09:44:19 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190307124419.GA8899@habkost.net>
References: <20190307090639.8261-1-eric.auger@redhat.com>
	<20190307104859.248a7608@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190307104859.248a7608@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 07 Mar 2019 12:44:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] machine: Move acpi_nvdimm_state into
 struct MachineState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sbhat@linux.ibm.com, david@redhat.com,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UUnUxqdTtog

On Thu, Mar 07, 2019 at 10:48:59AM +0100, Igor Mammedov wrote:
[...]
> > +static void machine_set_nvdimm_persistence(Object *obj, const char *value,
> > +                                               Error **errp)
> > +{
> > +    MachineState *ms = MACHINE(obj);
> > +    AcpiNVDIMMState *nvdimms_state = &ms->nvdimms_state;
> > +
> > +    if (strcmp(value, "cpu") == 0)
> > +        nvdimms_state->persistence = 3;
> we probably should use QAPI enum magic to handle description to value conversion
> but I don't know how to (CCed Markus).

QEMU is not very consistent in this.  I have found at least 3
different methods for registering enum properties:

1) qdev PropertyInfo using set_enum/get_enum.  Examples:
   DEFINE_PROP_ON_OFF_AUTO, DEFINE_PROP_LOSTTICKPOLICY.
2) object_property_add() + visit_type_...().  Examples:
   machine_set_kernel_irqchip(), pc_machine_set_vmport(),
   pc_machine_set_smm().
3) object_property_add_add_enum() and object_class_property_add_enum().  Examples:
   qauthz_list_prop_set_policy(), host_memory_backend_set_policy(),
   qcrypto_secret_prop_set_format(), netfilter_set_direction().

> But since it's just moving existing code, it do not insist and it could be
> done on top later on.

Agreed, but I think we should at least add a TODO comment
indicating the code is not a good example to be followed.

-- 
Eduardo
