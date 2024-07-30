Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2242011njb;
        Tue, 30 Jul 2024 02:08:44 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUTMVXq0qdOxKaizCeiYEenYuKL/o3jPAIHsKOWvnxqm/uxhWYIh6SJMhJ8Yt45AP35wUlBzpIrg0xEg3gcl7+KB5rSpgWl
X-Google-Smtp-Source: AGHT+IEjUO0qEXckKFqVcomBkz7L7XV+2njq0/Pgt1lBuvwAoRqGWCWizlCJRkKAP37jrajBSz4w
X-Received: by 2002:a05:620a:4452:b0:79e:f82a:a219 with SMTP id af79cd13be357-7a1e52f0461mr1289397285a.61.1722330524149;
        Tue, 30 Jul 2024 02:08:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722330524; cv=pass;
        d=google.com; s=arc-20160816;
        b=fD68fnTUev9i92dzIEFMry9trrzz4o5Hdc4gVCKlMtzd82uaDjyNL6cixlmhHGpft/
         gjiCHWcS4ea0riZ9CHizxt/mW7bynCvoRpHLGQSAJ6VG83ICIWGA8iieUryHZc/BCRtn
         vIYWt6SQUPMfiLE3M3F5Mvxxc+7GVJohTUNh3FVO1Us30QK0TM9WP745tqoLDWhmAWcc
         rWhl+e5Y0nsewBfce2o/KnUe4FfT1dL8iekjXdmonJyAZWhmH9w4PhO+SR2LVu3kiJ9J
         FgYmfI9h3X7GBaENeIz8iVfeXwMEjLb5Td+yT6fEDTdOdIqM/o8D68UthoAh5NJ2Tyls
         T8dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:reply-to:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=dz3WJ7004s0uw4V6jW5lI1b/Q0V305/i2liLNDAPEws=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=djH+/Hv85z1fb6/3c9/U4QPHBLVM4HzT2iLSBS4Yyk3I28jBGwXfJW46c3BJ1ESn5u
         +UrVyUviTZIqpxhG1aNzscZuCj19WfEWilqoL+UF84K8/3ffwGxAd3k0JyFPO+mf8aVg
         nqQb/tSRB0F74ByRkhPYzyMZLVZY+G15vrtq+ELvWyFZ5iOtmLid1jyCLBMXm659vb1U
         Zrha2Ulvy9e9hB7+RNgYaHpud0aKNeIAu2i62mPUtRdi/MYVCCVaa/XEPNKOI2M7D5MH
         e+9SeH3uRv/NPSH10fVekthEyXeSI+aApOB5szLhni6/0CTmnoI2o/q3+k3k+nIRuQr8
         2x3g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eLlOhcQI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22650-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22650-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22650-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7a1e0edddc2si965776885a.551.2024.07.30.02.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22650-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eLlOhcQI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22650-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22650-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61E41C23F6B
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 09:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7410B194157;
	Tue, 30 Jul 2024 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLlOhcQI"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E65E190053
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330519; cv=none; b=uF75tNFJX60dOyCs7BTqyVev7uqG6xHhUlPPpqFm2i33EZ42LG4QWp8Ehe1nAl+D3BSrQKA14mClyAWRPYUI8bpGo3n2c8gbz7Ah8xr41HHt7RHlINp5Vjk71c+hfp6mnT86/epq/9Kv5RJLLAPNTyHfujcPJwRU6fVd8r8qOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330519; c=relaxed/simple;
	bh=ze7+C/5k+pR5Lk+lcfaT9umXLryM3NSJF5W+uYgRbCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P55r8bRsamt6WxAILe0W5vpffY09UUTNthgmtF8lrL7IJgFjEdETvjvFG/aAixUf7Upc++egejO2WfzTS+wpYxdQlmyjvGaDs3dMEb08BU6nHU+3NdHLMXEpA71kJUgdgCzqe4r2ELH4qGSwwZUKKoSBYfNy4NCyl78XoMWcziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLlOhcQI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330516;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dz3WJ7004s0uw4V6jW5lI1b/Q0V305/i2liLNDAPEws=;
	b=eLlOhcQI56avB5Tr62cdxVS9Pgnv7lp6G0oxSVS7xSUX6EhN6V/bkR032zBD7QSpthkUfh
	kKdTNVG5tLum5NHDRis5YYCFUMpn4tVK8+KGMP0dHj7BM2qzOoDfvMQ1lrKrpGm+msQv/G
	JZmhEdDCNBJNygepAx9QBW3FWZQTTW4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-3KCAA_zoPcCGMwGNl7XyAA-1; Tue,
 30 Jul 2024 05:08:33 -0400
X-MC-Unique: 3KCAA_zoPcCGMwGNl7XyAA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12B0719560AD;
	Tue, 30 Jul 2024 09:08:29 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E20A319560AE;
	Tue, 30 Jul 2024 09:08:12 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:08:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alex.williamson@redhat.com,
	andrew@codeconstruct.com.au, andrew@daynix.com,
	arei.gonglei@huawei.com, berto@igalia.com,
	borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
	den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
	farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
	idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
	jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com,
	kwolf@redhat.com, leetroy@gmail.com, marcandre.lureau@redhat.com,
	marcel.apfelbaum@gmail.com, michael.roth@amd.com, mst@redhat.com,
	mtosatti@redhat.com, nsg@linux.ibm.com, pasic@linux.ibm.com,
	pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
	philmd@linaro.org, pizhenwei@bytedance.com, pl@dlhnet.de,
	richard.henderson@linaro.org, stefanha@redhat.com,
	steven_lee@aspeedtech.com, thuth@redhat.com,
	vsementsov@yandex-team.ru, wangyanan55@huawei.com,
	yuri.benditovich@daynix.com, zhao1.liu@intel.com,
	qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 09/18] qapi/machine: Rename CpuS390* to S390Cpu, and drop
 'prefix'
Message-ID: <ZqiteS-HiSV5PO4g@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-10-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-10-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: y5rH7CBT1d+7

On Tue, Jul 30, 2024 at 10:10:23AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> CpuS390Entitlement has a 'prefix' to change the generated enumeration
> constants' prefix from CPU_S390_POLARIZATION to S390_CPU_POLARIZATION.
> Rename the type to S390CpuEntitlement, so that 'prefix' is not needed.
> 
> Likewise change CpuS390Polarization to S390CpuPolarization, and
> CpuS390State to S390CpuState.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine-common.json            |  5 ++---
>  qapi/machine-target.json            | 11 +++++------
>  qapi/machine.json                   |  9 ++++-----
>  qapi/pragma.json                    |  6 +++---
>  include/hw/qdev-properties-system.h |  2 +-
>  include/hw/s390x/cpu-topology.h     |  2 +-
>  target/s390x/cpu.h                  |  2 +-
>  hw/core/qdev-properties-system.c    |  6 +++---
>  hw/s390x/cpu-topology.c             |  6 +++---
>  9 files changed, 23 insertions(+), 26 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

