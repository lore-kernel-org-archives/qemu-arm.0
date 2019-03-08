Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8646980wrx;
        Fri, 8 Mar 2019 09:46:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxIsSyUHV1jAy+u9Jb2BuunLGBw25WCWO9esooVLyYyA5hJtcDQQtYH1ziboVw6NKgtWLZK
X-Received: by 2002:a0d:d4d6:: with SMTP id w205mr15964961ywd.103.1552067173204;
        Fri, 08 Mar 2019 09:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552067173; cv=none;
        d=google.com; s=arc-20160816;
        b=hIBxGkrV4grZkDf1LIZnA6hzAzf4ChiXaojBwpz4DTZRb6YVHwg4uhT/qtBM6W9Bpw
         H4cCL081Gmhjffz3RYMImnoWpqJI0zU5v1W77SZK/H6WBvamrxSO8NrPysaDOk/Kxw+n
         wJXnbwMr02ubFnEzUbA1OSTYaIEfnenTxBRT2FNDs+rJGrohVEejLUDPWtHF+6FMgpo+
         evvE5V39hQNj9l2lE+eSDtR/aSs6KftAOqyHTL2RMaybdh8mRb41alBUQn7J6kf7LG15
         JvowSkNmI9FVs0e963NVbY7aOI4I1JiFQ91X4npvi1rlO+KZY70LHm8PdQSx7BAVlBrc
         HiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=P0f001PH9wtSAoPdiWpJgdyRvWqDR+VcdVM6g2zjCYQ=;
        b=F4C9t+fD46La2DsjauS///NCrB896Z5YxZnLx2oBNOxpr+hqFwHwyfuV1Okw27fBAI
         8DdMQ3vdWJPv/3sh9qxhKkQwP3zO0iAWS5IUNXr1rHI8n65GURllO7dbgchjYUjsChJv
         AUzps5hNK3mWvrT+GfqrLueWWaEaW7n4a5ZMJtaZl6mGpHo8uD2Sv2P97YLxfsMdybXS
         9GSoHTTMbP7F2hjQ7D5v5K+4y/JaoVADJTvIeO9qiKf9DGMa5R1sdWwDHLZs/pVCOEtq
         sxsq9xae/5g0KCtVI8LFDLdkEZxdM0y0uLpoqL4j2CNROiVGMjKFDTdgbT9RvSeCmnk0
         7TKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p192si5137918ywh.50.2019.03.08.09.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 09:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2JZU-0006Q0-Iv
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 12:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h2JYz-0006BU-CN
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1h2JYs-0006A4-U1
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:45:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1h2JYk-0005wZ-Bx; Fri, 08 Mar 2019 12:45:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AC1F3089E68;
	Fri,  8 Mar 2019 17:45:20 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6188A5FCA5;
	Fri,  8 Mar 2019 17:45:12 +0000 (UTC)
Date: Fri, 8 Mar 2019 14:45:11 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190308174511.GE8899@habkost.net>
References: <20190308152511.10882-1-eric.auger@redhat.com>
	<20190308152511.10882-3-eric.auger@redhat.com>
	<20190308174214.GD8899@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190308174214.GD8899@habkost.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 08 Mar 2019 17:45:20 +0000 (UTC)
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
X-TUID: FR8MjsHJAZwF

On Fri, Mar 08, 2019 at 02:42:14PM -0300, Eduardo Habkost wrote:
> On Fri, Mar 08, 2019 at 04:25:11PM +0100, Eric Auger wrote:
> [...]
> > @@ -791,6 +833,28 @@ static void machine_initfn(Object *obj)
> >      ms->mem_merge = true;
> >      ms->enable_graphics = true;
> >  
> > +    if (mc->nvdimm_supported) {
> > +        ObjectClass *oc = OBJECT_CLASS(mc);
> > +
> > +        ms->nvdimms_state = g_new0(NVDIMMState, 1);
> 
> Initializing ms->nvdimms_state inside machine_initfn()
> only if mc->nvdimm_support makes sense.
> 
> But:
> 
> > +        object_class_property_add_bool(oc, "nvdimm",
> > +                                       machine_get_nvdimm, machine_set_nvdimm,
> > +                                       &error_abort);
> > +        object_class_property_set_description(oc, "nvdimm",
> > +                                             "Set on/off to enable/disable "
> > +                                             "NVDIMM instantiation", NULL);
> > +
> > +        object_class_property_add_str(oc, "nvdimm-persistence",
> > +                                      machine_get_nvdimm_persistence,
> > +                                      machine_set_nvdimm_persistence,
> > +                                      &error_abort);
> > +        object_class_property_set_description(oc, "nvdimm-persistence",
> > +                                             "Set NVDIMM persistence"
> > +                                             "Valid values are cpu, mem-ctrl",
> > +                                              NULL);
> 
> Calling object_class_property_add_*() inside instance_init
> defeats the purpose of class properties.  I suggest either using
> object_property_add_*(), or registering these class properties in
> machine_class_base_init().

I just realized that machine_class_base_init() won't work, as
it is called before the subclasses' class_init functions.

The only solutions I see here are using object_property_add*() or
creating a nvdimm_machine_class_init(MachineClass*) helper that
will set mc->nvdimm_supported=true and register the class properties.

-- 
Eduardo
