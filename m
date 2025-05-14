Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1272033njb;
        Wed, 14 May 2025 08:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1hn7Ch0SHr2pfUSnyx5M4BLlFus/SAlxwDXgYEozG/eLsbcxXCG+ZxUGHBAoAqcD5ArDPJkOfTz7YgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF+EvPiB+rkYKIO29Qp6XT5WUdkD+Q0kLVW+3pvhQuQYQI6bEYE0vhnhQgc23wItvqV3Wjn
X-Received: by 2002:a05:620a:3188:b0:7c5:5fa0:45f6 with SMTP id af79cd13be357-7cd2889123amr520154785a.50.1747236391412;
        Wed, 14 May 2025 08:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747236391; cv=none;
        d=google.com; s=arc-20240605;
        b=Ju6BeT7F7sJ2twGaV+2hFw7GMKaxMZFkVX2npWDTPVQ6q+1Kz0xzitfhAWgtHu3bUp
         t0im61NXy+TBK8rmKK4MU5L07xxEG3dqAHqwFLPqai+6yYDVbGTgmToTbrthdsR5HT9R
         WXP5ME6uGQnnNboAQEjMN7D0fq81tmBCG/UVfiJhiIDaAsmXrOgQcaKFl8UFrVGZ5JXB
         RS6Fq+LT/vePnQFnNp3S+Gnu6En++mBRfKAYoJpwlUeBqrCounx5Csgu1TCdfc22kEUY
         QX9AAX+NeeICm5DUeiCA7tYznsojET066d9sydyLEJC4W8KU5JT+xR14GuaTW3iTQggJ
         hwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=YvXcEYB8GmnfSL56FqDCdhwjR6lZVlguKBnz4DxzyG8=;
        fh=iM9GwfGv21/blqyxO272EqVSEyp03V2YmKTOh+3dT00=;
        b=LnKVkyuHXtcjyk5tA/7rlfNDiSC2HN2JtBVvBYEl9S2rfgpSeAVjgBTWYU4CQj4UAo
         APSEUW2u0/dwQKKnracrwtA1hKQntxSMbQ1DgYKRp9GJrLnz+vUkxlDJ3ww7QXMQxW4U
         xXj6/jPlNo204NWulHIN7Uq3VUhnl1K9uRHhcZ7FCh0EYBlnqWVfExpVmTfXwbkQ1IYO
         c6k1yuHEEKiR027bZEmqgXwxXBDo07YkGA86GnGjO0Hcn10OijND58RISRseLUTc6IsJ
         E1pwHYWVgFC8ZvvkfJfxvRreX7hewFLcm78rTM9jb5bjwKDCvMl7XxgI5uPnK3zURtYN
         fePQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZIThQdiC;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fed898si1381812885a.498.2025.05.14.08.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZIThQdiC;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747236391;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvXcEYB8GmnfSL56FqDCdhwjR6lZVlguKBnz4DxzyG8=;
	b=ZIThQdiCRYFa/SNl+JV0sJWymUQBLNx8ZFIKodqgTglYL6I6COQCXzndjfnN9IIU7vod7w
	w1YPyEHOEjVfO4j+p5YyDOto74DH0cldFzQ1KNxYXZdv57LM0pe6xbyhS7AXMXxljlKM43
	OkVgfz+8wOFBsKY2m0n7D9xqwZmaaA4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-0QcoPX4xOl6EmAV5GTXP4w-1; Wed,
 14 May 2025 11:26:29 -0400
X-MC-Unique: 0QcoPX4xOl6EmAV5GTXP4w-1
X-Mimecast-MFC-AGG-ID: 0QcoPX4xOl6EmAV5GTXP4w_1747236387
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 52C1A180056F;
	Wed, 14 May 2025 15:26:26 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 763141955BC0;
	Wed, 14 May 2025 15:26:20 +0000 (UTC)
Date: Wed, 14 May 2025 16:26:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v6 12/14] arm/cpu: Add sysreg generation scripts
Message-ID: <aCS2GbNCzQ3jc2ka@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250506085234.855779-1-cohuck@redhat.com>
 <20250506085234.855779-13-cohuck@redhat.com>
 <aCNwKBDtJES0GX3q@redhat.com>
 <87ecwrckfc.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ecwrckfc.fsf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: PvyU9ck+iJ9O

On Wed, May 14, 2025 at 04:54:15PM +0200, Cornelia Huck wrote:
> On Tue, May 13 2025, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Tue, May 06, 2025 at 10:52:32AM +0200, Cornelia Huck wrote:
> >> From: Eric Auger <eric.auger@redhat.com>
> >> 
> >> Introduce scripts that automate the generation of system register
> >> definitions from a given linux source tree arch/arm64/tools/sysreg.
> >> 
> >> Invocation of
> >> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> >> in scripts directory generates target/arm/cpu-sysregs.h.inc
> >> containing defines for all system registers.
> >> 
> >> [CH: update to handle current kernel sysregs structure, and to emit
> >>      the re-worked register structures; cpu properties will be added
> >>      later]
> >> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>  scripts/gen-cpu-sysregs-header.awk    | 35 +++++++++++++++++++++++++++
> >>  scripts/update-aarch64-sysreg-code.sh | 25 +++++++++++++++++++
> >>  2 files changed, 60 insertions(+)
> >>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
> >>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
> >> 
> >> diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
> >> new file mode 100755
> >> index 000000000000..b6b207e3c0fd
> >> --- /dev/null
> >> +++ b/scripts/gen-cpu-sysregs-header.awk
> >> @@ -0,0 +1,35 @@
> >> +#!/bin/awk -f
> >> +# SPDX-License-Identifier: GPL-2.0
> >
> > Invalid license name here - hopefully checkpatch.pl is warning
> > about this.
> 
> It might not check .awk scripts?

The existence of SPDX tags is only checked for .c, .h,
.py, .pl, .sh, .json & .inc

The validation of license names is checked unconditionally any time
the SPDX-License-Identifier tag is seen.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
