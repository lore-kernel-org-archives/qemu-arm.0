Received: by 10.25.44.15 with SMTP id s15csp427275lfs;
        Fri, 21 Jul 2017 02:28:05 -0700 (PDT)
X-Received: by 10.200.46.140 with SMTP id h12mr9111562qta.305.1500629285514;
        Fri, 21 Jul 2017 02:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500629285; cv=none;
        d=google.com; s=arc-20160816;
        b=gdQPQnZ4gIOLsViXcjarkc36q2tlnRjhuOlDRn2GJx4BnBd77I3cltjYBej+TyuXV9
         Iqx6iFbneJoK6dmgMdRvSgqDnYaopGzLyWeNnRTeMiXI1GjdzVQMMVJkefFskL5wy3ig
         HKpy8bInG5+8AR2RVLhQtRrRE4jVcLstQva79hEIMQno23sV40OoOEbO0XLFBpcZ9FoL
         i11VCWacYrVN0689kvWg4O4GuFYSUGjaNlc5x/FI2PMljuho+9gBuHxZYrQkPMIBGqV8
         pW23cnanGhmUYxFYl+LWvWc6Fxa3MH6Mc8kQS3GucQEgsEah8Rlq/Ki2Xk4GPy1pB9yR
         JXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=T+Mqqs4xajjMG/kMyNh5QGt4Ms+Z+d4ATPeUXrdXn8c=;
        b=0AR/nzaxvBkPHcCqhZB8W26Z81dWH+qszKCdJyleAZbMb5cJqxwdgjvBkwOqtwgqYG
         D+YQxH68kpbWjN4BaRhPCbDs9K6at3DQv0tLG/3WhkN9oEzegSCTdwEAUr+2Z1F36lGc
         hxQB1vx9vT2kOb98aE+pDM56Tptrrl7blEXml2Ts1C1j/mw4x7OaZsLt8EVW5/Vqyj2L
         2FlXMpl104dopMQ8waQCVqbGCWY/jyxgyv/wfO0gZAT+AWeRwxSgNHV+SxhXQ3wtxnVW
         n1DwKwtSEYYWAFwAKhox9U3R71Ydotwtbo3f+J+WNGtmXA23NXO7Iwzo+B7LR3IdU82y
         Jb4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d41si3774219qkh.107.2017.07.21.02.28.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A8E22C1539;
	Fri, 21 Jul 2017 09:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3A8E22C1539
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=berrange@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3A8E22C1539
Received: from redhat.com (ovpn-117-176.ams2.redhat.com [10.36.117.176])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9462A80E0F;
	Fri, 21 Jul 2017 09:28:01 +0000 (UTC)
Date: Fri, 21 Jul 2017 10:27:58 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix
 all files
Message-ID: <20170721092758.GF17693@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-4-alex.bennee@linaro.org>
 <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net>
 <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com>
 <87ziby6udk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ziby6udk.fsf@linaro.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 21 Jul 2017 09:28:04 +0000 (UTC)
X-TUID: wcIq82Qc0WL0

On Fri, Jul 21, 2017 at 09:56:23AM +0100, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
> > On 20.07.2017 20:59, Richard Henderson wrote:
> >> On 07/20/2017 05:04 AM, Alex Bennée wrote:
> >>> This is a massive but mechanical patch, the result of:
> >>>
> >>>    (cd fpu/softfloat3c; and find . | xargs dos2unix)
> >>>    (cd include/fpu/softfloat3c; and dos2unix *)
> >>>
> >>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> >>> ---
> >>
> >> Really shouldn't this have been part of the import?
> >
> > +1
> > It's only a whitespace change, so please squash it in the previous patch
> > instead. (You could mention this in the patch description that line
> > endings have been changed to unix mode)
> 
> Sure - I just wanted to be clear of the steps I took should I want to do
> it from scratch again.
> 
> One thing playing in my mind against moving to SoftFloat3c is the
> inscrutability of the upstream. It's nice there has been a new release
> with new features but there isn't a source repository or as far as I can
> tell a development list. It is basically as far as I can tell a one man
> project albeit backed by academic funding.

This is no worse than the situation we already have with SoftFloat 2
though is it. IOW, as long as we fully move from v2 -> v3 eventually
(to avoid maintaining both indefinitely) we're no worse off from the
community POV. At least v3 has the possibility to be become more
community driven in future, where as v2 is essentially now a obsolete
version.

> That said the license change in 3 does mean it would be a lot easier to
> incorporate fixes and updates if and when upstream release new versions.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
