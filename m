Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1372560ejc;
        Mon, 15 Apr 2024 10:29:44 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWFgXja6DAbbfFq23LVoZvtCTVDYz29vejPCq8V2LOpj4dZSZn0Qh+k0XyznoPibl7R20ev2lNEXmwVbnBhPGgIbjznam45
X-Google-Smtp-Source: AGHT+IEtOaWu8en9JfUEQLiz1qbS/nNrwILpzdE84HEgbBzhsovGkTnU6TsxidKkCF2doq8hOM6a
X-Received: by 2002:a17:90a:7181:b0:2a2:a9c3:6447 with SMTP id i1-20020a17090a718100b002a2a9c36447mr8670815pjk.21.1713202184296;
        Mon, 15 Apr 2024 10:29:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713202184; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ssc7uOCrDWTPt/tqy+bWruACBPEv5DYm1+ttC7dE5mP+hsFYhAbFuhcG+cZdxuu7fH
         1IXOHQbclAcCG/2wXh+zX85ov5Ag26Ej/lCrMAB127Y1o1vrcqHxnO/+uBOI+4EVU8Xu
         h3Agd78vP/tV1N8OMOTUaw9fTm7Mg7ZvowmBSsF3VhQ/Bpt0zLbSuXuQOgBiZJmjhlSn
         m+ovRw3JY4aUNubAKgKGCdVcVgbvFR1bwQjrbpOHBdwLhKXjJlQW6H/uJOjyeAsnJPLX
         KREX6El4n9iCnpGXjhtVgBgQ03dVaFx70hcwOJrysXO189j5jK/2Z7PP30EW49zNCvop
         vFNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Jcg254LO2l1PxlFadfJBDxirLKjzh+T4Q2nk0YBiGYs=;
        fh=4jw+VptL5gS0ABgMJLbJ5FyRdwU54g1TscK8faLrSxo=;
        b=g+xA5kbrivRRCsni/iUSoJeYwH92z3Y2NfKCYel2JOLq/0jVPsi4Dv4FrogfhsqYzd
         fUCwk63rlEkSlp+33eC0wXP5MHjkXVYbHepn1LGCbfupA3rcW5omPFlhfRJcmEttmj+9
         nlz5vOxwPTah6j7gRojhx//5XtaiATfFUhOo1qrW1Kiw+1kISSeIVK/wpiQaTzFRa+K4
         cMvRgOCZZ1h/GrjXLm/j9l4rE5pfPGN1eUh6c1HwGcgrzJUtrQ+fLueEGYQkLvL9Iau1
         ojIT/sKR0k1Ltwrt/10gnBRJiLNd6xspVBWNM/X/sfyJDRhPFw5XIWbFiNQBvYqzzNR7
         HpTA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFzmbouA;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-14679-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-14679-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-14679-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id bj2-20020a17090b088200b002a528fab31esi9928449pjb.56.2024.04.15.10.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14679-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFzmbouA;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-14679-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-14679-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4FB4282C12
	for <alex.bennee@linaro.org>; Mon, 15 Apr 2024 17:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172D8839F3;
	Mon, 15 Apr 2024 17:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFzmbouA"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF74824BD
	for <kvm@vger.kernel.org>; Mon, 15 Apr 2024 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202180; cv=none; b=PHKMPWhCZUtxamsRevjqEKnd+vUrGxAGXeKEHGqiddRNSCtB+i9bIJnhQCvI1ilI6Jr9byKjfpjjWgMSI/aYX2zNhcgS1KZUtwLEo9/BbGQBWr1bVT8Zd1tUmaB5uIwqIB/gvClr7TfYA1ZUkYrrU+jwyfQrSaxVGSHwPcr3Om8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202180; c=relaxed/simple;
	bh=PUtzAKK4XGFns+uyKdOsLt/oHxKeWqV+9+bXRP1a6Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4Pw7G9SFLZvYqtvnUcYaFYxlnKu2n0ABS9cky6doozFBJ89azmSLuP8NU+NsJFMCa8KqOYNrP212VhEO1epAplDOeG65vK1oc73QWAJlnBJNr+Oa1npJoDLpWreU0jvsqSvLJXc0KvLId+YhfrzCJxwu+HzH4gAKEi/jQ197WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JFzmbouA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713202178;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Jcg254LO2l1PxlFadfJBDxirLKjzh+T4Q2nk0YBiGYs=;
	b=JFzmbouAil25Gb8/jJfBY442NxUpEOFsIEJPzmNncBFHEKT8O/eYma8yD60p83dMalTay5
	QmUQD0Hj8ei+QZf3aZYP1TrvIwkm2S8cjkXGgSkp9XAwsRyuSdhgLwRmCZkIjpYshJS00O
	J5ndomLfnfZEpsTOGAlsGwBe+uN30nk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-dCFN_PqVMxOwqdSj4GB4Ww-1; Mon,
 15 Apr 2024 13:29:33 -0400
X-MC-Unique: dCFN_PqVMxOwqdSj4GB4Ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55D5329AA394;
	Mon, 15 Apr 2024 17:29:32 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36E45C15771;
	Mon, 15 Apr 2024 17:29:31 +0000 (UTC)
Date: Mon, 15 Apr 2024 18:29:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v9] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <Zh1j9b92UGPzr1-a@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240409024940.180107-1-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240409024940.180107-1-shahuang@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: 5Exl4Ta5cLaJ

On Mon, Apr 08, 2024 at 10:49:40PM -0400, Shaoqin Huang wrote:
> The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
> which PMU events are provided to the guest. Add a new option
> `kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
> Without the filter, all PMU events are exposed from host to guest by
> default. The usage of the new sub-option can be found from the updated
> document (docs/system/arm/cpu-features.rst).
> 
> Here is an example which shows how to use the PMU Event Filtering, when
> we launch a guest by use kvm, add such command line:
> 
>   # qemu-system-aarch64 \
>         -accel kvm \
>         -cpu host,kvm-pmu-filter="D:0x11-0x11"

I'm still against implementing this one-off custom parsed syntax
for kvm-pmu-filter values. Once this syntax exists, we're locked
into back-compatibility for multiple releases, and it will make
a conversion to QAPI/JSON harder.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

