Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2835748ejb;
        Tue, 30 Apr 2024 03:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWslqMPe2QnYcXp9O3ljTe0awbvmCnZFZdnkRgtQeym8feSjlEqGhbgLtbvnKZeBDKSgbwdKmAZGSswwG5x5FxVhcO6Yxp
X-Google-Smtp-Source: AGHT+IF7Rl1HRb0+39FawPBK/pGk0now8fbInXfWTn42/uTMy1GCeH70plV/gdhlrrIddTJSOY5A
X-Received: by 2002:a05:6214:258b:b0:6a0:c8c3:7e2e with SMTP id fq11-20020a056214258b00b006a0c8c37e2emr2586760qvb.1.1714472478240;
        Tue, 30 Apr 2024 03:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714472478; cv=none;
        d=google.com; s=arc-20160816;
        b=uCBoAM+JZyTZs7/MnZDoI0Xv1hp0jffX6uFZi7/sxIzwc7NdhxjBMeszqQP12eg0gA
         bLSw7Qiq49vgBLmA/4l+URmeyRraV1+QHkwigxltc7D38bqjc8YEV6agmtH+vDZE/J0s
         5Er5qz9jcU5vjssx1+WklZvu+31/xQ5CeY45BnuPAQ+NWAI172E5LsbnL4pWZLN5nqAu
         S9vtySPHtAGMvcOaW+FXbpXciwvwWIdWyWEv7zTVfAFnQctYt4RIlEk9arfnMnGEpnK5
         pqK4tu204yXjVF8QwJVFUx3Aobttp16vnWTx+c2BQKbbGrYgcudXYWhWSnN+KelD/vP+
         gxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:to:from:date:dkim-signature;
        bh=U4lKWZzDWugm1dHWAmR/3vEfsQYmA3iVl1bRbOmmAsI=;
        fh=JEjqrgGFCPhqOi03J5uxzpKG7b+7vJNXZwSUMDbM7X4=;
        b=uW6yVDVeFJPJMFsesbHeYmld3BAEVwlyDnDCVFrjT2WhsLyh9dv5AvYQn/w/jY62xX
         XXnIU+27QWn9KD5c45qLtfLDAclqwuVy8FpfTuucuiuuI1x2RuwTrrUFO3tm8VDv877d
         XNE/5/MxzvC//+N/J9sYda/T5TZMe/z9kIXhz0C26w8FCZJnGeO8r3ZoxOQ8L3QW5qnw
         PsUdz+MjFElir/XtSc8cPD5qdWTqIQFujDrOt7/Nud3KOQPnfxF/wWtA8rgMTqoQlsfd
         JM9G2YHt5i4QNITRQucEwi14LYFntfseeaLJHbtsXnTmd6yXzy9P+6cxpEAWnWsEpeLh
         8wZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFI7MSOW;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fo5-20020ad45f05000000b0069b5a4e6c7bsi29361113qvb.439.2024.04.30.03.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFI7MSOW;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714472477;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4lKWZzDWugm1dHWAmR/3vEfsQYmA3iVl1bRbOmmAsI=;
	b=JFI7MSOWH9jG/ES8S1xvua7cSL3LrCsxzrgDoBuMcOGtLMwBFn6quso5mjEZvF2zy2Dpoz
	y43BOVc3WugwJS8x4tBwWmWGpSN5/YBuUAo2wf7fOdZ1NAAEayzL42DAMosdXYicDS3Kmv
	zzEO2oc38IUQCTXj0PI/vnB3rj2+jzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-jlJx2V0qNMq6cZzOXoqiNg-1; Tue, 30 Apr 2024 06:21:12 -0400
X-MC-Unique: jlJx2V0qNMq6cZzOXoqiNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 724FA88E922;
	Tue, 30 Apr 2024 10:21:11 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A51871C060D0;
	Tue, 30 Apr 2024 10:21:09 +0000 (UTC)
Date: Tue, 30 Apr 2024 11:21:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, devel@lists.libvirt.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
Message-ID: <ZjDGE9CT-cX1iiGB@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240430064529.411699-1-thuth@redhat.com>
 <ZjDAGuONZ_Zem3fL@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjDAGuONZ_Zem3fL@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: ILE5hgVx7DAS

On Tue, Apr 30, 2024 at 10:55:38AM +0100, Daniel P. Berrangé wrote:
> On Tue, Apr 30, 2024 at 08:45:29AM +0200, Thomas Huth wrote:
> > Old machine types often have bugs or work-arounds that affect our
> > possibilities to move forward with the QEMU code base (see for example
> > https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> > cannot be fixed without breaking live migration with old machine types,
> > or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> > commit ea985d235b86). So instead of going through the process of manually
> > deprecating old machine types again and again, let's rather add an entry
> > that can stay, which declares that machine types older than 6 years are
> > considered as deprecated automatically. Six years should be sufficient to
> > support the release cycles of most Linux distributions.
> 
> Reading this again, I think we're mixing two concepts here.
> 
> With this 6 year cut off, we're declaring the actual *removal* date,
> not the deprecation date.
> 
> A deprecation is something that happens prior to removal normally,
> to give people a warning of /future/ removal, as a suggestion
> that they stop using it.
> 
> If we never set the 'deprecation_reason' on a machine type, then
> unless someone reads this doc, they'll never realize they are on
> a deprecated machine.
> 
> When it comes to machine types, I see deprecation as a way to tell
> people they should not deploy a /new/ VM on a machine type, only
> use it for back compat (incoming migration / restore from saved
> image) with existing deployed VMs.
> 
> If we delete a machine on the 6 year anniversary, then users
> don't want to be deploying /new/ VMs using that on the
> 5 year anniversary as it only gives a 1 year upgrade window.
> 
> So how long far back do we consider it reasonable for a user
> to deploy a /new/ VM on an old machine type ? 1 year, 2 years,
> 3 years ?
> 
> 
> How about picking the half way point ?  3 years ?
> 
> ie, set deprecation_reason for any machine that is 3 years
> old, but declare that our deprecation cycle lasts for
> 3 years, instead of the normal 1 year, when applied to
> machine types.
> 
> This would give a strong hint that users should get off the
> old machine type, several years before its finally deleted.

The m68k/arm archs have a nice macro for defining versions
that exposes major/minor directly. That would let us
automatically set the deprecation flag after 3 years,
avoiding manually writing patches for each release:

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c93c0c0a6..e40209f60a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -101,6 +101,11 @@ static void arm_virt_compat_set(MachineClass *mc)
                      arm_virt_compat_len);
 }
 
+#define MACHINE_IS_DEPRECATED(major, minor) \
+    ((QEMU_VERSION_MAJOR - major) > 3 || \
+     ((QEMU_VERSION_MAJOR - major) == 3 &&      \
+      (QEMU_VERSION_MINOR - minor) > 0))
+
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
                                                     void *data) \
@@ -109,6 +114,9 @@ static void arm_virt_compat_set(MachineClass *mc)
         arm_virt_compat_set(mc); \
         virt_machine_##major##_##minor##_options(mc); \
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
+        if (MACHINE_IS_DEPRECATED(major, minor)) { \
+            mc->deprecation_reason = "machine virt-" # major "." # minor " is not recommended for newly deployed VMs"; \
+        }                                                               \
         if (latest) { \
             mc->alias = "virt"; \
         } \

we could easily change other arches to enable the same thing.

Then all we need do manually is the actual deletion. We would make
it a BUILD_BUG_ON after say 20 releases to force us to remember the
actual deletion at the 6 year point, without creating an immediate
build fail in that exact 18th release cycle.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
