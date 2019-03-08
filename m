Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8645120wrx;
        Fri, 8 Mar 2019 09:44:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqye8z4tgV2wxb28rCnoJjHuqMBfQjSV0XQLYK7rzDs4b1SiJHhZYaeUTF9fHDmCQsTr53kY
X-Received: by 2002:a0d:d550:: with SMTP id x77mr15517695ywd.157.1552067053365;
        Fri, 08 Mar 2019 09:44:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552067053; cv=none;
        d=google.com; s=arc-20160816;
        b=YVmZxthBiqXpFGsmoN9lpGOXJn/jknOGyx0JE+1qjdaDcMSOtLIyjh5btaZMrF+YbT
         RzolBpiTdHjIVBoPCdVQDTc/llw2/GimW+ESoahz57vDiiO06QYOz7MeQ1EQ8BTsnGWi
         WuTH2a4U6RJdwcDAjPLP5m2FAgZ3Z+b9twYLBfAbIUp4wQRMdEYIUYJKQsFV16NPb+oO
         600ySxW3MRZOfsM9PVRVxBERSIjIyqvwjPDZ4Qszk/4apqy0SZuZxR8ryPeop2CYTK4s
         GHaLm6H02hCAHZCcjB3DPOjxpeZiP6fNAPR0ann5VPKeJXV/z441yqjzC84wym7VM6XR
         kE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=3jS0wWk5crxEMGWOtJjYnEp0dqlqcAGoFEwtxZk3ypE=;
        b=tDD843/QVzTS+ikCe9fIyAKLFF44fAFLO08L2RO/8fF36IUAs9OxdWWKYfHfPbv+68
         FEjAV9JbHgTacY9GeE5ajg+3m8g2WQcuxpWZpsm7fODAB4YcNhKn6D4MATMTVyCCaYB2
         ypS5gYxVSLerYSnaMg1vlzhVweBBeXoU03nf3/7XqLl6lcG8bJHwxb69KEBBm1w5ad0C
         79kT+b4q1d6NPiig3KS2d4dtPxgR/FoezEuhibx5GRIUeL7RKcnRNz+UHiFL9EybIqqp
         O07ZQlN2VOLVzhqT3URuTT/ivLhp/0a66C1pqUAwQtKIisIZ+jzNxlWBTG6eLwxAeCPR
         Lx+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si5128630ybk.287.2019.03.08.09.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 09:44:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2JXY-0004p5-Qz
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 12:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h2JVv-0003fB-23
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:42:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h2JVu-0004BM-B1
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:42:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1h2JVu-00049s-40; Fri, 08 Mar 2019 12:42:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81EBE285B3;
	Fri,  8 Mar 2019 17:42:28 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0A826371;
	Fri,  8 Mar 2019 17:42:21 +0000 (UTC)
Date: Fri, 8 Mar 2019 14:42:14 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190308174214.GD8899@habkost.net>
References: <20190308152511.10882-1-eric.auger@redhat.com>
	<20190308152511.10882-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190308152511.10882-3-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 08 Mar 2019 17:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 2/2] machine: Move nvdimms state into
 struct MachineState
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
Cc: peter.maydell@linaro.org, sbhat@linux.ibm.com, david@redhat.com,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, imammedo@redhat.com, philmd@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8DyeqjfY35MN

On Fri, Mar 08, 2019 at 04:25:11PM +0100, Eric Auger wrote:
[...]
> @@ -791,6 +833,28 @@ static void machine_initfn(Object *obj)
>      ms->mem_merge = true;
>      ms->enable_graphics = true;
>  
> +    if (mc->nvdimm_supported) {
> +        ObjectClass *oc = OBJECT_CLASS(mc);
> +
> +        ms->nvdimms_state = g_new0(NVDIMMState, 1);

Initializing ms->nvdimms_state inside machine_initfn()
only if mc->nvdimm_support makes sense.

But:

> +        object_class_property_add_bool(oc, "nvdimm",
> +                                       machine_get_nvdimm, machine_set_nvdimm,
> +                                       &error_abort);
> +        object_class_property_set_description(oc, "nvdimm",
> +                                             "Set on/off to enable/disable "
> +                                             "NVDIMM instantiation", NULL);
> +
> +        object_class_property_add_str(oc, "nvdimm-persistence",
> +                                      machine_get_nvdimm_persistence,
> +                                      machine_set_nvdimm_persistence,
> +                                      &error_abort);
> +        object_class_property_set_description(oc, "nvdimm-persistence",
> +                                             "Set NVDIMM persistence"
> +                                             "Valid values are cpu, mem-ctrl",
> +                                              NULL);

Calling object_class_property_add_*() inside instance_init
defeats the purpose of class properties.  I suggest either using
object_property_add_*(), or registering these class properties in
machine_class_base_init().


> [...]

-- 
Eduardo
