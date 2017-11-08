Received: by 10.223.150.237 with SMTP id u100csp1772799wrb;
        Wed, 8 Nov 2017 13:52:35 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SGLSk68svWaGws+9YrpSN6DQUJ/l2oHxOnp+JrFQdJXaJApRByvvWjFXSNLeft+hZgNhJG
X-Received: by 10.129.133.129 with SMTP id v123mr1293835ywf.453.1510177954932;
        Wed, 08 Nov 2017 13:52:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510177954; cv=none;
        d=google.com; s=arc-20160816;
        b=DREg2kvaWQb1SlVejShXRxA7mDXL/tZRQhGIBoZ/3Xf7LDOdnXiuJOH8AHnwfNw/w2
         MZSZehoTK2HfcX8hEy9m49igUmuhebBqjxYVM+CiiXcEHJiB3mmY7Jtk+ODdjHZSNZ19
         abXLw2oJM62n6JkDFb6Unvhqw/3pcvy70zTCgOWhe4WSPKCER3HPGMRSNtBPGpMUh+rE
         cgSTz84gFIND9oO3QnCpxtf6jPQALJGmZKWbNGqiS5As1bNPeEPtamTjRPY4JwDr0JEF
         B70+t4vgb4ujztNsoAPmtiO1wyzp7dd5TpZDTZVOMm7AItbqeEpVaU2agLGI4htOYZUW
         vVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ENG8GZNOzkOf8mTmLiRRnJW4MFkS5QzNvI5v7jYn6Qg=;
        b=chisoMtJhl5UC2ISHURSLlvn0VCuP2r1ZBqymOhNQoVP3w83B7eVcE30y1YuKwrjUS
         LoXpBvC367aVf5TAXss+auDSQH7wcNg2a8L0YQhF8aJ0YcOVK9Wpfue9R86Qkij3WkIG
         Dz/8RF/Rvh5qxTGklGQ4ueyBnMal2TMxgxltMEmMELBASLMQeDOEjgd5W3jzmy649H0a
         6dz4k+ICNBtIH9e4AFrkpQD1cvMQaNg+o0Ue0/PfbPZVoIChJZp60Tr6jVJZkPX3dUM3
         AeVTXsegZy9ijTA2aU622P6CR4E7G+FktjYLkZZNhkA1lTFBRcLUJIgyUEo1SGkRzFbX
         DPag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k10si1160567ywa.703.2017.11.08.13.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 13:52:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCYGw-0003x1-CE
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 16:52:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCYGl-0003wh-8r
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 16:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCYGh-00079b-Cc
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 16:52:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51048)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eCYGh-000799-6S; Wed, 08 Nov 2017 16:52:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 389A2C0587F4;
	Wed,  8 Nov 2017 21:52:17 +0000 (UTC)
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19E6E5EDF5;
	Wed,  8 Nov 2017 21:52:13 +0000 (UTC)
Date: Wed, 8 Nov 2017 19:52:12 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20171108215212.GW3111@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106201332.GA2152@flamenco>
	<73e9c472-82da-b293-27cd-ca9e0ff93179@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73e9c472-82da-b293-27cd-ca9e0ff93179@linaro.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 Nov 2017 21:52:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6BjdrTgzcGqe

On Wed, Nov 08, 2017 at 10:29:43PM +0100, Richard Henderson wrote:
> On 11/06/2017 09:13 PM, Emilio G. Cota wrote:
> > Subject: [PATCH] qom: move CPUClass.tcg_initialize to a global
> > 
> > 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
> > introduces a per-CPUClass bool that we check so that the target CPU
> > is initialized for TCG only once. This works well except when
> > we end up creating more than one CPUClass, in which case we end
> > up incorrectly initializing TCG more than once, i.e. once for
> > each CPUClass.
> > 
> > This can be replicated with:
> >   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
> >       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> > In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
> > whereas the "regular" CPUs are prefixed by "cortex-a53-". This
> > results in two CPUClass instances being created.
> > 
> > Fix it by introducing a static variable, so that only the first
> > target CPU being initialized will initialize the target-dependent
> > part of TCG, regardless of CPUClass instances.
> 
> Hah!
> 
> So, I had been thinking of the xylinx ARM + Microblaze case, where we really do
> need two different initializations.  I never imagined that two different ARM
> parts had different CPUClasses.

Is xylinx ARM + Microblaze something that already works (and
would be broken by this patch), or something planned for the
future?

> 
> So I guess it's my initial patch that unified this that's more buggy than not.

We still have the option of reverting the original patch, but (if
it doesn't break anything) this patch looks like a simpler fix
for 2.11 than a full revert.

-- 
Eduardo
