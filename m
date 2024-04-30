Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3113502ejb;
        Tue, 30 Apr 2024 09:54:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrvVVOPQ8duW/ENaEnedTc5zojTartEX+8JbaBCzqAn40Th6ZBrvdaloTL/oe12kCQIp64yzXDUqTJ5M9UOfh2+suq/bZl
X-Google-Smtp-Source: AGHT+IGjNsleShi0RmdV/c+Ij9UodVTm65N2npd7UhPQUi6IW/z1Y23f/Rn/ghKKGyKc3kHSxghv
X-Received: by 2002:a05:622a:156:b0:43a:c84f:938e with SMTP id v22-20020a05622a015600b0043ac84f938emr10013078qtw.12.1714496069758;
        Tue, 30 Apr 2024 09:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714496069; cv=none;
        d=google.com; s=arc-20160816;
        b=e60vDdw4GNfePXH1RcuPPVy/su3U7e+aN0rvrLtDNJ+ujHEd+EqDAObU2bhw6H5RuO
         aaqPH64fgGBAE9Nx/3uJ1Xf7hnQG+l7q7GQMff//0cPbyhtCUSKNV8/xeXl71+PvXyWo
         sWt0vluxpAk5alyFiYoK7ZbLI710NyXBgm8yhOobsw5uR/W0nQJk8R3Vh+vq3bAKzv5f
         tZ00apciaVyQRdkq+NE4k5f2IpU3W30PUYC9dGglTsvy5z8K7l62eEYG/jbWIGDOnQVr
         VgVHncbANHsf4JYfTQ8hOWAVFR9cK5QnHCesBVXJ1eNym7EKiVzbz9M0kvMC00Opxe5O
         oQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=lCyskhAIpRLBQGrfOTVqz2y+o19Ke66o+fFMq5zx9yA=;
        fh=kZPypYlo8KnTPo+YK6MuaW3fuUhwrYMOQYaAiRshy4I=;
        b=TKUigFt/CZNbQ61uf22/6cQDWu8Eq4RzUrK2Hhz9WggTHr2ZhGOaqv/hCF2lTHljMp
         a4I94NE5aLZsF+kcra3YeelvMHnJ7teawQfIYLdEEtiRxE3f72meUh09V5y/B3MP1UWh
         nie5SJd3FkmRXWBKwBCJwsjfsZpO3hJzmcnMke8tdzBe+f3u0xUSGnaxQwGD23Fy4YSM
         kp79W7iFOKMujRatWTHPTtAjYSYncZbBahYmMLxl8XQnIZQhyAs28MMsT/bzuwtn56kZ
         hKbHNICtqTG9h5QCnsUXAWMGaHeoTS5Xy6pjvlLAQMG8k/qEAQLyNy4fSv9EHrs+gMWK
         Ki+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBdL9Jdy;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h18-20020ac85e12000000b0043c5d50a7dbsi1365614qtx.780.2024.04.30.09.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 09:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBdL9Jdy;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714496069;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCyskhAIpRLBQGrfOTVqz2y+o19Ke66o+fFMq5zx9yA=;
	b=fBdL9JdySXXAp5nC8nM8/jpb+nH5eRL1FVhX0wOi+bicvvTfhQONmlZ8nJ55fDgmv68rnP
	Ut7zHgupyuSbEu4sW9CBBFP3+14+tFw1eOmyeDe2lgUCwxgO7sO24MYqSjTX8lVQ+axsd9
	V3e4ene7Nbc5Apyfmab8xesyB1liVog=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-gorT3wfaNfqapfGCHOp6Og-1; Tue,
 30 Apr 2024 12:54:26 -0400
X-MC-Unique: gorT3wfaNfqapfGCHOp6Og-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DE2929AC013;
	Tue, 30 Apr 2024 16:54:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F5F240C5C2;
	Tue, 30 Apr 2024 16:54:23 +0000 (UTC)
Date: Tue, 30 Apr 2024 17:54:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	devel@lists.libvirt.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
Message-ID: <ZjEiPTfzeELC3qIX@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240430064529.411699-1-thuth@redhat.com>
 <ZjDAGuONZ_Zem3fL@redhat.com>
 <05cab8d3-bda0-4452-92d7-061f4719eba7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05cab8d3-bda0-4452-92d7-061f4719eba7@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-TUID: 62zEL3f+684F

On Tue, Apr 30, 2024 at 12:29:14PM +0200, Thomas Huth wrote:
> On 30/04/2024 11.55, Daniel P. Berrangé wrote:
> > On Tue, Apr 30, 2024 at 08:45:29AM +0200, Thomas Huth wrote:
> > > Old machine types often have bugs or work-arounds that affect our
> > > possibilities to move forward with the QEMU code base (see for example
> > > https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> > > cannot be fixed without breaking live migration with old machine types,
> > > or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> > > commit ea985d235b86). So instead of going through the process of manually
> > > deprecating old machine types again and again, let's rather add an entry
> > > that can stay, which declares that machine types older than 6 years are
> > > considered as deprecated automatically. Six years should be sufficient to
> > > support the release cycles of most Linux distributions.
> > 
> > Reading this again, I think we're mixing two concepts here.
> > 
> > With this 6 year cut off, we're declaring the actual *removal* date,
> > not the deprecation date.
> > 
> > A deprecation is something that happens prior to removal normally,
> > to give people a warning of /future/ removal, as a suggestion
> > that they stop using it.
> > 
> > If we never set the 'deprecation_reason' on a machine type, then
> > unless someone reads this doc, they'll never realize they are on
> > a deprecated machine.
> > 
> > When it comes to machine types, I see deprecation as a way to tell
> > people they should not deploy a /new/ VM on a machine type, only
> > use it for back compat (incoming migration / restore from saved
> > image) with existing deployed VMs.
> > 
> > If we delete a machine on the 6 year anniversary, then users
> > don't want to be deploying /new/ VMs using that on the
> > 5 year anniversary as it only gives a 1 year upgrade window.
> > 
> > So how long far back do we consider it reasonable for a user
> > to deploy a /new/ VM on an old machine type ? 1 year, 2 years,
> > 3 years ?
> > 
> > 
> > How about picking the half way point ?  3 years ?
> > 
> > ie, set deprecation_reason for any machine that is 3 years
> > old, but declare that our deprecation cycle lasts for
> > 3 years, instead of the normal 1 year, when applied to
> > machine types.
> > 
> > This would give a strong hint that users should get off the
> > old machine type, several years before its finally deleted.
> 
> Sounds like a good idea, too! Since I have to drop this patch here anyway,
> could you maybe write such a new patch? (or do you want me to try to
> formulate this?)

Yes, I'll send something for discussion soon.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
