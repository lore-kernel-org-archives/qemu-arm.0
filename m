Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4509272ejc;
        Mon, 27 Feb 2023 03:11:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8SkoregTijugVJgBb5zCArajPAjvqQwkR2KHaUyHTdWa0WFpIZBK05oY/cme6Aa+0QOGhC
X-Received: by 2002:a17:906:d925:b0:8b1:78b6:4b3c with SMTP id rn5-20020a170906d92500b008b178b64b3cmr36709703ejb.73.1677496265506;
        Mon, 27 Feb 2023 03:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677496265; cv=none;
        d=google.com; s=arc-20160816;
        b=XweUPCXX5XIoHOq9GZSiAI+bEZy5u+DgFfYAEFZOWpA5WVMCQFfwBu2bmb1mI6JLXM
         aQkWOru6T6pnzdMEh6k1VjJ8VgW6VzSPoTvOJEifKzTqB6WpyfCxoYg2R6KdkMLJL6gz
         E78XVMMOZKAYQGzIZG6rCjrNgXnmkS1O2jccHjrQcMz+5DtXOeoSKUx4ViPgz/GxLkwq
         7W10awXsjpvz1Cwq/FiPU8P7Yhw3kTzj1Hn9QFFaj8Gtlo3T3VzfxQONHpm/a2if+6Vh
         OeV1Z+hBmr/eENJtdcrVx6nkppkEExMByXW25LmN3D8ecKGnFO1GWi8pOWH6Q9MHNHK3
         nDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KioUJTM1KSsfU9iQtLnRn1SvfePLH+pSeG29+t/WJ4c=;
        b=X7vsF1xYbc+umol1tEq38XSFRxBcVEmyuSTh6SXUAIyrBVgKWAHeFc7HdUsf5T1Hcb
         BWceuEESktnM5q098SXZqXC0CHFhkIMTaaZL8rUSE091CnWr5Dl9I6vgEFeJE77t2krH
         NEs5vKrKrdZ2dZ0/gHkbygWl0qocC4yoiDr2cYAA/6k6H6ufNkPk68IDj3IiMr5SifRw
         oocs265eGoIK/MKG77EFQw4wlaMvsXNhB673AZ7rm6YZAIC5If9uNFisrub60Q38VELD
         X/e7pExCzsYAYLgEVxpqLN2IIaq9gpaFPlTl15ZkLIsQqWGAs3P0mLKaqDqAGYsGWDBO
         5vVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=foGPiIr6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s24-20020a170906c31800b008d2f1fcc60esi7409221ejz.740.2023.02.27.03.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=foGPiIr6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KioUJTM1KSsfU9iQtLnRn1SvfePLH+pSeG29+t/WJ4c=;
	b=foGPiIr6kX+diJGlxiVLlXqr+CVhEjSZywLo57EbubDu1CkSavZz034YU81YT9aiLEcuSm
	MoGg55Di95uZLtfIieoIPeLlvGe/5JumY1lych27hrvUcUdIZrx4yn/qxHTWTcTuRpDXY4
	uVAwJQkgHhfvXU4JS4dUfREfdEMCraY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-DJ-jRS76Mjy4jXphQxQ3Uw-1; Mon, 27 Feb 2023 06:11:01 -0500
X-MC-Unique: DJ-jRS76Mjy4jXphQxQ3Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 996A7101A521;
	Mon, 27 Feb 2023 11:11:00 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 348B440C6EC4;
	Mon, 27 Feb 2023 11:10:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/2] docs/about: Deprecate 32-bit arm hosts and qemu-system-arm
Date: Mon, 27 Feb 2023 12:10:50 +0100
Message-Id: <20230227111050.54083-3-thuth@redhat.com>
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-TUID: YXSKjtDhVH27

qemu-system-aarch64 is a proper superset of qemu-system-arm,
and the latter was mainly still required for 32-bit KVM support.
But this 32-bit KVM arm support has been dropped in the Linux
kernel a couple of years ago already,so we don't really need
qemu-system-arm anymore, thus deprecated it now.

Additionally, it's quite unlikely that anybody is still running
full system emulation on a 32-bit arm host nowadays. All recent
strong arm host machines should support 64-bit now, so we also
deprecate the 32-bit hosts here to finally save some precious
minutes in our CI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 98517f5187..a52e45b570 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -208,6 +208,23 @@ QEMU will soon drop the support for 32-bit x86 host systems and the
 ``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
 superset of ``qemu-system-i386``) on a 64-bit host machine instead.
 
+System emulation on 32-bit arm hosts and ``qemu-system-arm`` (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
+latter was mainly a requirement for running KVM on 32-bit arm hosts, but
+this 32-bit KVM support has been removed some years ago already (see:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
+). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
+future release -- use ``qemu-system-aarch64`` instead.
+
+Since you need a strong host machine for running full system emulation,
+and all recent strong hosts support 64-bit anyway, the QEMU project
+also deprecates the support for running any system emulation on 32-bit
+arm hosts in general. Use 64-bit arm hosts for system emulation instead.
+(Note: "user" mode emulation continuous to be supported on 32-bit arm
+hosts, too)
+
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1
