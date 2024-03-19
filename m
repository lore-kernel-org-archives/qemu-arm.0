Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1376771ejb;
        Tue, 19 Mar 2024 08:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUQ7C1yZGBcCvreoL0Ywfm/X70cUBY+uYVj4FUeunKLqyCkeOXbWenQdOzyGf7DgQRhHya2SlL6vuPZdIxSbzZWIJm5qdXy
X-Google-Smtp-Source: AGHT+IGQovQf7i/JmYpwVe99h2/mmmdR0tJ9YpqxYVjm3TTKeWsUanFVfUsv3gXz9O/6scny5D7e
X-Received: by 2002:a17:902:eb84:b0:1e0:2335:8f5d with SMTP id q4-20020a170902eb8400b001e023358f5dmr7132851plg.64.1710862450042;
        Tue, 19 Mar 2024 08:34:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1710862450; cv=pass;
        d=google.com; s=arc-20160816;
        b=IyrcBAr+M9OChZOoJ/T76Mr/E0xLxMh+6NH+ZUvZSox0re3xbvIXp0iA0eUv5pFDaS
         QiC+S6QvxOswKy7WtGgbsijQUQVui3ftx0+nxs2Ixz/Tr/s/2sF+Z6GSM7lSuzZ9LNwN
         f9hymM0T+M1bbvQ8H+Ei5Lb+vZV1dYwmoV65+u6jFllBG8RCVxvcgGYJpw7KXibp/ntv
         hSAqiPgKNQZ8d90bjqrDkK+/w2/an5LaiuXwLDGibjHGpRQ6OQ7nhjsQsHmMkGHhzyqz
         Jbxoi6k/V0O12FCwH002nqsH9qAzgIhM4D9wQZEgXCGWv5uTy7CarCGxCPFE/2MUZ2mJ
         zmtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=LTv0c9gBsGx2cGoLzFXhFtEOz/PUb4iNz/cutnWVCfY=;
        fh=iuarMY80Wj9V9QrSIyXjgMQ/mVzPeH5DXZsyZrMtanE=;
        b=wU3RrWPCCaN/MJLe7L+HQI6bCJhcrgZNN3YQog9t6z/wlNPrH7mHYZyeN4/NdTqDPH
         zacxOSwTVKai6DN/AGgTLSaVFrmyuG5f9SwzLS58b3cvlvcPHAvRxBynZQiVPUg9NjKA
         kis9iFdPJw/fYQX9Y0PWRMZjYdt0nWoKXJ131DQ8uMFeL2kwh+HalszGTbhAzmkTBz94
         TLaVB+bYWS4RRXtFlfWY41DRFT5ThoUnIAU548urV18jZNzOELA/3miS+m9UkfihQL1t
         rKjh1GeJrL2PYQd6bmyF9NfP0azKL5xYBp7WneaVcSXQcEKd0FjroHIXtZehDqU2lW6A
         Y1tg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YY+tFMXj;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-12156-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-12156-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-12156-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d3-20020a170903230300b001dddbe5ab7csi3579817plh.640.2024.03.19.08.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 08:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-12156-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YY+tFMXj;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-12156-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-12156-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBC6CB215EA
	for <alex.bennee@linaro.org>; Tue, 19 Mar 2024 15:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B9B651BE;
	Tue, 19 Mar 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YY+tFMXj"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5962818
	for <kvm@vger.kernel.org>; Tue, 19 Mar 2024 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710862442; cv=none; b=eUogsePGKSMdDgR5jgo9bI7hLwb3o/JggWSBa4L+1hjWMqeDY1aIR6vSSIAiFUncP12q0aywFVou1TeUfPuFt42p3yqoWz5DpUd1lR8z688+2VFcutwzdTbNgTFxy0spKpSvh9A52eG4oKyYfJRa5RwvXqfmKM6rOh0dKTFSwcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710862442; c=relaxed/simple;
	bh=rrQSAAEQCgctnBTxLRZaF5NpLsX/foa8mFUz552bLlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFL7C8DO2i+XuAQeIFkyP4I/oUd6OlT6jxhhwzVQo6VbGuNw2tifqOLZO0ahP9cSfgSbugbX9WTm99Q0EGp3rTRhbyh8ZDI8QJ0xTc0ETVG88ovunFC5RpqomeiHEVLCwUwU84UBLaCfTF8jdbUJyOn0VSvwdTg4/24lGG2RSG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YY+tFMXj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710862439;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=LTv0c9gBsGx2cGoLzFXhFtEOz/PUb4iNz/cutnWVCfY=;
	b=YY+tFMXjJu1Bae/EA9qG8BfuN6FmiBa2aAoFEtGOpzlWBEOlpH6rV77qsk1Y/obGlKbxc5
	v5beO0zk3uGje5zodSEa8RiIW5gqbibG5kY0s77tBMVnHHiajViOqCJRi/5VfqmGOv5+1d
	8xU1sMts+QKrDr+Z8zCefnu4ReNNe0Y=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-cHXfH-IXM4GpTBHYlzoxHg-1; Tue,
 19 Mar 2024 11:33:51 -0400
X-MC-Unique: cHXfH-IXM4GpTBHYlzoxHg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84F6D1C2CDE6;
	Tue, 19 Mar 2024 15:33:51 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3698F492BD1;
	Tue, 19 Mar 2024 15:33:50 +0000 (UTC)
Date: Tue, 19 Mar 2024 15:33:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v7] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZfmwWKvueeC0KFIM@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240221063431.76992-1-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240221063431.76992-1-shahuang@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-TUID: 4+vDPZbN4TZm

On Wed, Feb 21, 2024 at 01:34:31AM -0500, Shaoqin Huang wrote:

> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index a5fb929243..7c8f6a60ef 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -204,6 +204,29 @@ the list of KVM VCPU features and their descriptions.
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>  
> +``kvm-pmu-filter``
> +  By default kvm-pmu-filter is disabled. This means that by default all pmu
> +  events will be exposed to guest.
> +
> +  KVM implements PMU Event Filtering to prevent a guest from being able to
> +  sample certain events. It depends on the KVM_ARM_VCPU_PMU_V3_FILTER
> +  attribute supported in KVM. It has the following format:
> +
> +  kvm-pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"
> +
> +  The A means "allow" and D means "deny", start is the first event of the
> +  range and the end is the last one. The first registered range defines
> +  the global policy(global ALLOW if the first @action is DENY, global DENY
> +  if the first @action is ALLOW). The start and end only support hexadecimal
> +  format. For example:
> +
> +  kvm-pmu-filter="A:0x11-0x11;A:0x23-0x3a;D:0x30-0x30"
> +
> +  Since the first action is allow, we have a global deny policy. It
> +  will allow event 0x11 (The cycle counter), events 0x23 to 0x3a are
> +  also allowed except the event 0x30 which is denied, and all the other
> +  events are denied.


Can you document whether the policy evaluation stops at the first
matching range, or checks all ranges

ie, if you have

  kvm-pmu-filter="A:0x1-0x9;D=0x7-0x7"

will an input of '0x7' be allowed (because it matches the
first range and stops), or denied (because the second range
overrides the result of the first)



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

