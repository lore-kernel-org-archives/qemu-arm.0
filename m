Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1877043njc;
        Wed, 11 Jun 2025 01:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9CdS7nsnb6td/0Oz8GDKWuSFrv2jOpnoJ4qNjQApBbna/f3qm8xjJgyufwSv17LTeWQtaAZk3F1/yDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHCISPLxPhfLGGilL2gY66EzmKh/lGDRQ6Ys5Z4AapY2BbJBFW7JJ4VqNF6RZGfxtlNDism
X-Received: by 2002:a05:6214:2686:b0:6fa:a625:be55 with SMTP id 6a1803df08f44-6fb2c3eb73amr40364296d6.15.1749631563052;
        Wed, 11 Jun 2025 01:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749631563; cv=none;
        d=google.com; s=arc-20240605;
        b=LZQFlaUxmqbyFVmOseDL56bVJtkjDiZ8wagaZO04I+m8L1Lr05IGg1gBI/L2eiJD/4
         SChFMkNwbSu+qJLazWjgsvGwvYphtwlNyRkdPNUTNzKUj68FK5/MmSePCZLSkxFfEYPk
         ev9mMw7rzGhjdNqbCKYeWUwXCmghHGMvKs4d0TEj52B2DMDCKJjq5xohLSf56hB88E4P
         6cAAXFmRG2FjnI4wNdsPu34Faa7qGBXN+ocsc1ZZqFb94ucW3HQeH2OR9e9EPZ1O3+rB
         mRFxvRYMyCxRAjQAwc0AxrQxbyGiXh2J+xW5CqDaxn5TChnCSJSwOJMTXL+Oj8H9Zp/m
         1E/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CCvSwDazl0yZNflEfMBMdisXrcmFHujU47NPjIfN5Pk=;
        fh=vjqH01zeJIiBbzB8qTekSH6k8xez6I1arcOolm1xdzs=;
        b=HiatpOEPX9+ZLZ3k5HrYrrqVR6Qt35BT92mWMfqxJM6SPJ69E+iK56vtAJpfdw92q5
         CwaZkjVmErPMJDBAOxAso1x5X4KzbmfGmxNAXcgZrQ+U8E0GSnkRLiwOCeYCQ2mjYkDK
         Wsywd2dlMjmN3MKkfsl8zTQmrfWEAlRgHD3mb1pHA1e63gvFfVhcBG+lSgqQx25xXkiM
         FIBEJB/WLhimMy3HZbf3OOz6DPE4sM0IvdAUuaj2LsQZusPUm7qAehHjMY3vhwbnABIW
         g3Lk59mG/cmvTxg7p4eSlPliIth6Q3f9rQdIoDdOwbDkhAvhIkFYY4fMqeDK7LHUJO+K
         XktQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d1x9ZqQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2fe55si115777616d6.436.2025.06.11.01.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 01:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d1x9ZqQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPH5f-00075L-GF; Wed, 11 Jun 2025 04:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uPH5d-000711-Tv
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 04:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uPH5b-0004rg-VX
 for qemu-arm@nongnu.org; Wed, 11 Jun 2025 04:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749631543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CCvSwDazl0yZNflEfMBMdisXrcmFHujU47NPjIfN5Pk=;
 b=d1x9ZqQ8w16dhU/I09nbZyWqPAXFlgc0UG/ZJ7OY47GBrSJ11om6YUnsFZZGX5rDuH/Ztb
 amIzgKfhLd0r/TIdzoCeaHAdnXrb+d2UgdsuTMuOe5gYtnpQEkhknqbuLLwPoV9pWnG7Ae
 mQR0BJOR8YvJXR6wCd92aUZTcQ6cbHc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-Tf1HfSliMRGEKK3quNuCFA-1; Wed,
 11 Jun 2025 04:45:38 -0400
X-MC-Unique: Tf1HfSliMRGEKK3quNuCFA-1
X-Mimecast-MFC-AGG-ID: Tf1HfSliMRGEKK3quNuCFA_1749631537
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7E1E81800286; Wed, 11 Jun 2025 08:45:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.140])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 545F21956087; Wed, 11 Jun 2025 08:45:30 +0000 (UTC)
Date: Wed, 11 Jun 2025 09:45:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 4/5] configure: Add dtc option
Message-ID: <aElCJnmjrB-X9M-n@redhat.com>
References: <20250610204131.2862-1-shentey@gmail.com>
 <20250610204131.2862-5-shentey@gmail.com>
 <cdfc561e-23a9-607a-d9a8-70e07e73e0fd@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cdfc561e-23a9-607a-d9a8-70e07e73e0fd@eik.bme.hu>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gr2jQXdhWX1y

On Wed, Jun 11, 2025 at 02:37:08AM +0200, BALATON Zoltan wrote:
> On Tue, 10 Jun 2025, Bernhard Beschow wrote:
> > The next patch will make dtc mandatory for boards with a bundled DTB, causing
> > these boards to be omitted when dtc is missing. Allow packagers to force the
> > build of those boards by providing an option.
> 
> I don't like this. This might result in some machines missing from some
> distros if they don't notice this and forget to update their packages and
> these are machines I care about.

"Someone might not notice & screw up" is pretty much an argument for
not doing anything at all. We publish release notes to alert distros
to these kind of changes which is a reasonable effort on our part.
Distros need to play their part by reading them and adapting to the
changes. They can also compare the available options with new and
old QEMU to identify any new build features they need to handle when
updating.

>                                  Also what guarantees that we don't get bugs
> by compiling the device tree with different dtc versions which might
> generate different binaries? The binaries we have now are known to work and
> don't take much space so keeping them for convenience might be simpler. If
> it worked so far why change it now?

Ultimately the DTC project has responsibility to not cause regressions
in new releases they issue, as is the case for any 3rd party dep that
we rely on.

We have CI jobs that can run on different distros. If we have coverage
of the boards in functional test suite that provides a way to validate the
operation with differing DTC versions as a sanity check.

Distributing pre-built binaries in source release tarballs is a long
standing issue with QEMU's releases. If we can eliminate the pre-bbuilt
DTB and only ship the source that is a good thing IMHO.

> If this was using dtc from the submodule when not using system libfdt then
> at least it would not result in dropped machines and we had a known working
> dtc to compile with. Why isn't that used when we already have it for libfdt?

Are there any platforms that we target which still lack dtc ? The
submodule was there to plug gaps in distro support long ago, but
if every distro has dtc available the submodule is redundant.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

