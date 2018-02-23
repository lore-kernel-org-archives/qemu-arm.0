Received: by 10.28.71.27 with SMTP id u27csp809848wma;
        Fri, 23 Feb 2018 08:49:41 -0800 (PST)
X-Google-Smtp-Source: AG47ELt3vGvsBCCebS7XVZBmr2Lcs0mQ5CdKJkwPWbVIy12xp7k6mYvdSq6Bw466xAl9eOcvH6VZ
X-Received: by 10.200.40.70 with SMTP id 6mr3721286qtr.285.1519404580968;
        Fri, 23 Feb 2018 08:49:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519404580; cv=none;
        d=google.com; s=arc-20160816;
        b=YcZnwncPQZ8JejRWBKIz6NzjhtEyaC/QWGDMrTkEza539QpobUVpz7JuEAGFK6DbfW
         3SXFCSrA0qvcs687E2a7YLCNU5UhytlO7owXDupASlhTE7/44r4IkdOsu28Sqdt0oB5t
         opBqyVf5JpxNH2dVE3CQN+znVXKK+BmdrIAYNgnL0y0wz5Lzo3fZofucVylaz4Qms71O
         b5ajVVuI9SY+boZjuN8YT4Icoyb6z7z1/HqLQeDHjaHD7wrbyNloGi/ltETx6EM5mnD6
         HLCAyW3AzGJvWKS9O1saewdXmeTw0CdYThuQy7A6j/kzlqWerEhfYy/XGOK2wiENu0fS
         XK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:arc-authentication-results;
        bh=dMTHZ54KtXB2KXZvLwSEtiwBKH+2XAT7L/M5ZwkwSEU=;
        b=jd6LvhY+54tBHPGvVvP5/7jzhAPqikSRczCB4FcviAwccivHWrCsnumvO/Y/oXjofk
         g2TVbEJOfN0diSgSFqUfgP5qswQ8dh0qHLhD6A11qScMR2FQmo8OH2TKvddLOIqv/kSz
         bh4AYUToWrxX+mUvg4qolY3iH6jC4fsXu11VgceLs1gbEjP0LxabHEk0r4P+0Q6ELST5
         bNYEdt++irnDRPKCG0+fQ0VKqXlh0PJbfXQ5fULRDCSjaSvACJQnX+z0JNFP2ZPM/Uh3
         zwwn9BqbuCpvtm/9GsDVafW9BIudCw0+FHzy+J69u2spaE7BOMd2WkbN5ogzGwJbAfc9
         /OjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id x50si2702445qtb.386.2018.02.23.08.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 08:49:40 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83F6240201A0;
	Fri, 23 Feb 2018 16:49:40 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3AF19C062;
	Fri, 23 Feb 2018 16:49:39 +0000 (UTC)
Date: Fri, 23 Feb 2018 16:49:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch
 risugen script
Message-ID: <20180223164937.GG31076@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
 <20180223154613.2096-5-alex.bennee@linaro.org>
 <20180223161723.GF31076@redhat.com>
 <878tbjac3d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878tbjac3d.fsf@linaro.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 23 Feb 2018 16:49:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 23 Feb 2018 16:49:40 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: TWG/E75p9mgf

On Fri, Feb 23, 2018 at 04:45:58PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Feb 23, 2018 at 03:46:09PM +0000, Alex Bennée wrote:
> >> This is a simple script for generating all instructions in a given
> >> RISU file. You can split up the batch size by passing a -n N command
> >> line options. For example:
> >>
> >>   ./contrib/generate_all.sh -n 2 hp.risu testcases.armv8.2_hp
> >>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>  contrib/generate_all.sh | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 96 insertions(+)
> >>  create mode 100755 contrib/generate_all.sh
> >>
> >> diff --git a/contrib/generate_all.sh b/contrib/generate_all.sh
> >> new file mode 100755
> >> index 0000000..1e6b847
> >> --- /dev/null
> >> +++ b/contrib/generate_all.sh
> >> @@ -0,0 +1,96 @@
> >> +#!/bin/bash
> >> +#
> >> +# Generate all patterns in a given RISU file
> >> +#
> >> +# Copyright (c) 2017 Linaro Limited
> >> +# All rights reserved. This program and the accompanying materials
> >> +# are made available under the terms of the Eclipse Public License v1.0
> >> +# which accompanies this distribution, and is available at
> >> +# http://www.eclipse.org/legal/epl-v10.html
> >
> > Really ? Why this license not our standard GPLv2+, or BSD if it is wanted
> > to be a public-domain-ish license ?
> 
> I just chose what RISU is licensed under - but there is no reason I
> couldn't make it something else.

If it is going to live in QEMU source tree, then avoiding introducing a new
license is desirable.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
