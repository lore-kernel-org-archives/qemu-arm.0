Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409533ejc;
        Thu, 2 Mar 2023 08:31:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8Xe2v6NgOUPuuShVHH6f48c6MMfAKYJXbm7ZlQlgba489+PGBvr7qL/pr+YikusdUYuP9I
X-Received: by 2002:a67:f897:0:b0:412:a93:ec50 with SMTP id h23-20020a67f897000000b004120a93ec50mr5861970vso.29.1677774685638;
        Thu, 02 Mar 2023 08:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774685; cv=none;
        d=google.com; s=arc-20160816;
        b=G5Ejle2nrUnmyX81puSzDxUZnm/CbXO3QuYhoalK8sZcHa1xJVH3qEE0NDPJ+Z5wAx
         YQY+NsfGetNPnkFa6pZ1dE546LidSh+kXsxu04k26NRzYwo/63iKlZB6jODekaR4hP9L
         2NWpXr2K4a4pktiGueZP6ERwK/tSYFalcs6+FP1l1W4JCk7VM7WCGh0EsoYsUNNuWcc0
         YrU4GTzZFDT/gPOw4LewpEq/H7NeR4muQ+OHHMQP+Kx7I00nUDHSXLZqC5PaUPt1WpQQ
         J8DBTBoR7/JlqcBkZuV//qpwJ7WKHm8yJT4DZvdEAETRZg/405TJqqi8YVjwOSwkMeL6
         iRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1se1EgyXTtHuqpHB7dBmmrL51sYg+NfS/rBJP2j3pQw=;
        b=PgCVeNiY358+E5OQ1DufarcoaunvDU0FSt1Yssg2dmbPg6vgwNxUbFmuMefUleuTqx
         JfT+Iotd9XwTRS/ifQy+Aap9mdg/6CvhwBIYCccQLx9d4P1HlPEW87Dk7aZPixiU77FO
         q7oTl6ik1/NRtSSweX1euI1yyS3bh4uq27CgbMmR6iT1+0d8k20/FNpMu3s/jjJiiAVP
         WiFfAAhgOmWhwo1CdP+tdy1vLm8tfEjDISxNoPn3NMDlabvCDwyNqhJ8f4wgL4pyu6WS
         abz7UvvvVYo++fYvN85K+9crSWRw+b/9Dsk0ycE+nyOzq60ZqRGadP/NrIwtDQFabbIF
         XIrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Etut81HP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w8-20020a67e248000000b003ffa417077fsi4867373vse.613.2023.03.02.08.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 08:31:25 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Etut81HP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1se1EgyXTtHuqpHB7dBmmrL51sYg+NfS/rBJP2j3pQw=;
	b=Etut81HP4wAgWGR1WmSLqU05m5ERBxVJ8tdvkT/xsKHYS9vrnuOJLWnbZ+NkUy1ke5kGoq
	RfhWVYHT4GJcdzWInd3SzX5ImFLaiRBnENKrCzoWszXA/w2J0hmTCDp9TKOxekg/wJrUuD
	U8973dbpM7w84xxGOStHWajTGkCHEmg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-ZxoOLkewNeO0183HdIaMUA-1; Thu, 02 Mar 2023 11:31:22 -0500
X-MC-Unique: ZxoOLkewNeO0183HdIaMUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EF7938012E7;
	Thu,  2 Mar 2023 16:31:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2FE6400EA93;
	Thu,  2 Mar 2023 16:31:18 +0000 (UTC)
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
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 4/6] docs/about/deprecated: Deprecate the qemu-system-arm binary
Date: Thu,  2 Mar 2023 17:31:04 +0100
Message-Id: <20230302163106.465559-5-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: OIW0nPoFLT8b

qemu-system-aarch64 is a proper superset of qemu-system-arm,
and the latter was mainly still required for 32-bit KVM support.
But this 32-bit KVM arm support has been dropped in the Linux
kernel a couple of years ago already, so we don't really need
qemu-system-arm anymore, thus deprecated it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a30aa8dfdf..21ce70b5c9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
 on x86_64 hosts. Thus users are recommended to reconfigure their systems
 to use the ``qemu-system-x86_64`` binary instead.
 
+``qemu-system-arm`` binary (since 8.0)
+''''''''''''''''''''''''''''''''''''''
+
+``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
+latter was mainly a requirement for running KVM on 32-bit arm hosts, but
+this 32-bit KVM support has been removed some years ago already (see:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
+). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
+future release. Use ``qemu-system-aarch64`` instead.
+
 
 System emulator command line arguments
 --------------------------------------
-- 
2.31.1
