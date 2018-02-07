Received: by 10.28.71.27 with SMTP id u27csp633061wma;
        Wed, 7 Feb 2018 04:03:39 -0800 (PST)
X-Google-Smtp-Source: AH8x225DsIac0lrNqBQ26dqbk+i41hbXCMDdR/WjaUD3PisSXbV42OJC1IKORohW79p/vQPBcGbR
X-Received: by 10.37.194.133 with SMTP id s127mr3718814ybf.338.1518005019355;
        Wed, 07 Feb 2018 04:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518005019; cv=none;
        d=google.com; s=arc-20160816;
        b=uTrHC4Fku1mQWM8K6xojNRD2zhe1u+KL2dHzZAjAzyx36fAKdYalOQtwMixP87rj8n
         QX+cizzt3iWpJW4UfqFkw7T2Wfo2jJLFUIau9ldtvZww1a8oesARB+yivo+LD8zj58+Q
         3KU3kskXNj9K3ZpTgfsYvZX0xMizQNzl52346HhqMCbNtFBi61gi7zDI1SqlIPEEyyPJ
         79PVnW8Ea4fZos8nJMHO34+wnYBCB7eoFvLGR4gMhGdUfaKalOtLVNthZbc7cLR1KVHy
         zbRtzBB3DicMDsaVLIawJjQYZHJ6U/wiyvrlcZfM64BhzcZzZfHrg+B/RHytYNjEA1KL
         lMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=oU6M6w4NasMyHvt3BmElAXdIMDIzlJWdfbNOHvhQn0Q=;
        b=Z7lN8HwPDU9rUKedtqtph0tNSX63UHmF/GG6uuX/f/i+R+VaU4ASNdmzE7f5B2DLzQ
         EHJuxjMe7YNP5o0hKtbeZIkXiHptvkEXWrWShPT2vrpUA1GnqpsI7qZPcN7ci42weOha
         6/h0l+nD8I15W/R+2TR6Q68PwAeGLSgEaj4Xb5QYHtRYZ6M1SfoJOe++A+WSee0Xi7xi
         Z65vFmcPnCRsb7lFphBU2WSjx8A2BUQZPK9QiD44WROSCDC61tE8QMPEBcSiEo7xNH/d
         PTnD89NBTpy3vQE5xgcwMaufBDm+iy3RVuiRDgDEskdkPO/VHH0YsBRk5OVthOcv1cyL
         XYjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si233559ybm.210.2018.02.07.04.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 04:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejORu-0007Qc-R6
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 07:03:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejOOx-0005MG-4S
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 07:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejOOw-0000lv-Bb
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 07:00:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejOOp-0000k3-NK; Wed, 07 Feb 2018 07:00:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A303A7AEAF;
	Wed,  7 Feb 2018 12:00:26 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17CD364451;
	Wed,  7 Feb 2018 12:00:25 +0000 (UTC)
Date: Wed, 7 Feb 2018 10:00:24 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180207120024.GI3291@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<20180206223213.GG13301@localhost.localdomain>
	<20180207095225.0400fce9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180207095225.0400fce9@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 07 Feb 2018 12:00:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 00/25] generalize parsing of cpu_model
 (part 4)
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUMQEMklDYki

On Wed, Feb 07, 2018 at 09:52:25AM +0100, Igor Mammedov wrote:
[...]
> > * I suggest testing all CPU models in patch 02/25, but this
> >   shouldn't block the series.  Can be a follow-up patch.
> the goal of the test is that refactoring didn't regress
> 'none' machine after following change in 23/25:
> 
> @@ -24,9 +24,9 @@ static void machine_none_init(MachineState *mch)
>  {
>      CPUState *cpu = NULL;
>  
> -    /* Initialize CPU (if a model has been specified) */
> -    if (mch->cpu_model) {
> -        cpu = cpu_init(mch->cpu_model);
> +    /* Initialize CPU (if user asked for it) */
> +    if (mch->cpu_type) {
> +        cpu = cpu_create(mch->cpu_type);
> 
> for that it's sufficient to probe one cpu model.
> 
> We can do all cpus probing later if there will be need in it,
> but that's not related to this series and would just waste
> 'make check' time if it won't be doing something meaningful
> with probed cpu.

Not making "make check" slow is a good argument, I agree.

Extensive testing like testing all CPU models or all devices
probably should be done in a separate (slower) test set.

-- 
Eduardo
