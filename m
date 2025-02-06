Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1490745njb;
        Thu, 6 Feb 2025 04:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWOovEYBzbI+5AVVwrtUffG69PajJxaq69Q4FZu0I2A5GYK3RSeXKlb9ZX37ZDaKbvAbGNp2+1NZCV/7w==@linaro.org
X-Google-Smtp-Source: AGHT+IHHCoEtbTqhzACDsREHKPMBgg3eYTvvfzLradngKIdNmnB2B737VoffTs0UhBRwohJYLaeJ
X-Received: by 2002:a05:6214:194c:b0:6e2:2dd7:1404 with SMTP id 6a1803df08f44-6e42fb0437amr100904606d6.3.1738844006773;
        Thu, 06 Feb 2025 04:13:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738844006; cv=pass;
        d=google.com; s=arc-20240605;
        b=RlA5orZJM/cDCwI9GA6m+c/vD47TZ7Rcw9GxfPZA3qR6CVRvDDJZFd7q9xx/5zMoeZ
         gE/WREFowK2jxAPvM2lAHrALg2wJl6t0v4/46VppsMAxUydX/UoJSl2PepBB6J213E2D
         QyKISaldjA0KMcT15oqZu9qqFB+zxgSbamobT9Zj8QTMQjUZg/Hu33dHylFzQSuj7Voe
         uPMps8sz49j7hn0gXVpht2boeew+s02Me+vSo6H5SzrzFLtR75Pm6eje/M/EzcPbPDSW
         X6/cyxde/+JZEsha8IOGwg1onmO8n+vo3B1HTTG/pvTSdzt3oKfk8GK4ffwPpX00Sy+P
         /eaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=QbaGyGBhUSjBumJijeigRGmqZB/oIS5ICSFxiOZSqrQ=;
        fh=VGcoBDIBh5SXF1goT3YpiVSAdV7TMpyBGZ3UU5sKMH8=;
        b=dsYQ0Vlcp2hBK4KniYmyGlqWMTgiJH5r3bvENVBXcbG4iRHIY/SkRqcexG+bijeyWo
         VqYu3+hTun4D5LPPJDLj5umOBmRt8IF8+20vr3sLo9xqW65CJL6K5maGcSqgQS2zHZVA
         mLmOgGUipYpeC3v29mf75iEsCajvHyraawBYJX19qG6qtfkZBjZ5e53ADoZkHnpkqzOq
         ZsGEsYGsRsPFfIc8MFrPU1lmXQFtGFaUfWMCBZwBfnO9VykD8kFSnDtEmGP5y8PIymTh
         VNAlYPLT7XGrJn2WfY9ot1in1irpukZ6rPhPrsOZb484t/yjdXTQ0wKNLs1bbsJ/4U2I
         TtXg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOhw5yQJ;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37481-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-37481-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-37481-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43e6b3c1asi5691146d6.359.2025.02.06.04.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37481-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOhw5yQJ;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37481-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-37481-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9AD9167F1D
	for <alex.bennee@linaro.org>; Thu,  6 Feb 2025 12:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5011DF24B;
	Thu,  6 Feb 2025 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GOhw5yQJ"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF00D15A848
	for <kvm@vger.kernel.org>; Thu,  6 Feb 2025 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844002; cv=none; b=m7KNNLFQauwk3YV8tXr7KBlSxih2HEpYZINQ/lINW7z69CxOfJPNgts/CwELiHbPmN+yHKceVDbh/FPeX9KPPh4ddpM7flJHW6xk/mqp87ph2OusMSb73qppNY1i7QUxYS2kxnBcOAOIEjuDEDCAeU9YnNNMxEbzMI+oWCP1zP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844002; c=relaxed/simple;
	bh=hDTXFSzPZFuDlHFd9Ob8Nf5fLzH4lL7tA1iWIGbnwGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o+XexmEhDsmg1LVP+eKvSLaHZhlk4TeDwwknaChDyQItEq6Wh92Cm3CjDx7FevuqG2SktXgC0EyZEGZFRQXNDKqzqgKbTthmTMla+AmaxXflglDz8EuUYf+Xxb/OLcerUluKlW3ULZ2yN05uyuKF/1m2QhT16XOwY+xbXlDQQRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GOhw5yQJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738843998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QbaGyGBhUSjBumJijeigRGmqZB/oIS5ICSFxiOZSqrQ=;
	b=GOhw5yQJDCqcQQDW8ktlGgEGAWuSnUnRHH9LCMO0ZWV02OQT9NM3MT5NqPQwN+jyYsQ6OI
	spYgWo8hijwLahAwHZCQNU14A+b0ltC5MV/mFAmc0rH5XtLhskgH86tBssonM3BRMSRgsw
	uLA/SBKuPD8a0ZJidNNGUKHEe+p/6KQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-tBgfEbVwPb-ADGZjCYreww-1; Thu,
 06 Feb 2025 07:13:14 -0500
X-MC-Unique: tBgfEbVwPb-ADGZjCYreww-1
X-Mimecast-MFC-AGG-ID: tBgfEbVwPb-ADGZjCYreww
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B60C1956096;
	Thu,  6 Feb 2025 12:13:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.40])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08A3119560A3;
	Thu,  6 Feb 2025 12:13:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B11F921E6A28; Thu, 06 Feb 2025 13:13:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,
  Michael Roth <michael.roth@amd.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Shaoqin Huang <shahuang@redhat.com>,  Eric
 Auger <eauger@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Laurent Vivier <lvivier@redhat.com>,  Thomas Huth <thuth@redhat.com>,
  Sebastian Ott <sebott@redhat.com>,  Gavin Shan <gshan@redhat.com>,
  qemu-devel@nongnu.org,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  Dapeng Mi <dapeng1.mi@intel.com>,  Yi Lai <yi1.lai@intel.com>
Subject: Re: [RFC v2 1/5] qapi/qom: Introduce kvm-pmu-filter object
In-Reply-To: <Z6SMxlWhHgronott@intel.com> (Zhao Liu's message of "Thu, 6 Feb
	2025 18:19:50 +0800")
References: <20250122090517.294083-1-zhao1.liu@intel.com>
	<20250122090517.294083-2-zhao1.liu@intel.com>
	<871pwc3dyw.fsf@pond.sub.org> <Z6SMxlWhHgronott@intel.com>
Date: Thu, 06 Feb 2025 13:13:07 +0100
Message-ID: <87h657p8z0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: DbqOe0Wlgrg9

Zhao Liu <zhao1.liu@intel.com> writes:

> On Wed, Feb 05, 2025 at 11:03:51AM +0100, Markus Armbruster wrote:
>> Date: Wed, 05 Feb 2025 11:03:51 +0100
>> From: Markus Armbruster <armbru@redhat.com>
>> Subject: Re: [RFC v2 1/5] qapi/qom: Introduce kvm-pmu-filter object
>> 
>> Quick & superficial review for now.
>
> Thanks!
>
>> > diff --git a/qapi/kvm.json b/qapi/kvm.json
>> > new file mode 100644
>> > index 000000000000..d51aeeba7cd8
>> > --- /dev/null
>> > +++ b/qapi/kvm.json
>> > @@ -0,0 +1,116 @@
>> > +# -*- Mode: Python -*-
>> > +# vim: filetype=python
>> > +
>> > +##
>> > +# = KVM based feature API
>> 
>> This is a top-level section.  It ends up between sections "QMP
>> introspection" and "QEMU Object Model (QOM)".  Is this what we want?  Or
>> should it be a sub-section of something?  Or next to something else?
>
> Do you mean it's not in the right place in the qapi-schema.json?
>
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index b1581988e4eb..742818d16e45 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -64,6 +64,7 @@
>  { 'include': 'compat.json' }
>  { 'include': 'control.json' }
>  { 'include': 'introspect.json' }
> +{ 'include': 'kvm.json' }
>  { 'include': 'qom.json' }
>  { 'include': 'qdev.json' }
>  { 'include': 'machine-common.json' }
>
> Because qom.json includes kvm.json, so I have to place it before
> qom.json.
>
> It doesn't have any dependencies itself, so placing it in the previous
> position should be fine, where do you prefer?

Let's ignore how to place it for now, and focus on where we would *like*
to place it.

Is it related to anything other than ObjectType / ObjectOptions in the
QMP reference manual?

I guess qapi/kvm.json is for KVM-specific stuff in general, not just the
KVM PMU filter.  Should we have a section for accelerator-specific
stuff, with subsections for the various accelerators?

[...]

