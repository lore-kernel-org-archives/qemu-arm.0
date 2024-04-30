Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2732431ejb;
        Mon, 29 Apr 2024 23:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHb/r9cul3QTRSQGbC4znCBSOLNpXyKRGnMkkbKx6mgcCc256R65iIWYtYOox3gB7YGv/OtL9lGe8KF+jv8Dhyf023kS3m
X-Google-Smtp-Source: AGHT+IFkvNklXcpTJbLS7cYUXnttjAoldhRZckoWuFrF3Dx03d4/aV1lLWAmhbDOQzndcF5R1Ypx
X-Received: by 2002:a05:620a:f11:b0:78f:179e:9fd1 with SMTP id v17-20020a05620a0f1100b0078f179e9fd1mr12600918qkl.37.1714459538093;
        Mon, 29 Apr 2024 23:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714459538; cv=none;
        d=google.com; s=arc-20160816;
        b=H/gD9JNF3ZkqkzFTK9s6lpK7O5Ca+kLNG+9ULgatGk6kQ+gl6ivh3/3W4WT149bI6C
         uZwmbm1XiAJVBUCOCWwAGpdCU3atM6RuTtSj6Dvk14VgdK5Csg7tkx+VFa/4igia0niv
         21KSTqGDB4eFFeomFEX/fg1TBX9nAL39VT3u6qlgg4ts9GePVmyNcTEjZ4QaxiA0UJWU
         vEWe/K7N5QVQXDEHbeLBVnEMzKV0o6QTpLqCOV4TieR5Fc/fuGzhz58OdCCY7U5UDzVx
         xRa2YRrkBjUEHrsGa7G+ELxPiQI4GnS3Swv6CMOm3Sh2nKM0NUWQB8IW0QZRkfmd/SOY
         3juQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=iwgGsWCndrhEfGDCpQF2tQ24jDruM2CXUo07bzIqmx8=;
        fh=PIVChikm/BARnEK+G3GN2Hox+dh8y9sDkKxOGBRkGJc=;
        b=W2PKcoBCrU9R/09sFyWVjjHj7Pvg9O7OqqAXM29LJMTJMF4Ct4jzEJc/bMFwTWR0DA
         btand9wOrvm95GUtIjSDIMvxdlRw+amOyd+UcQhlNHKJnSFKIlRQEEjLTK3ErNqzwZUN
         JMYiJEuitFyjaU/B8ZjVrGRzru/CU3l3B3TCmddfC3XuqjpLtrRZkM/GxZsFjHfCeQJP
         1MCrHC5kNE0mMd6RhS4POfaGfu1PxSIw9kyHKivFTLKUgCtUFuGJ3ytSV6hWS+itZUcf
         7R5s06zHZGZC4MV+YxfNdt/C5lGsseNPglnCuDIl0+V7oFaIQ9cswYAv0HIqkZoIrxms
         TaJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f9PXbG8w;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u22-20020a05620a455600b007925f88b720si132064qkp.275.2024.04.29.23.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f9PXbG8w;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714459537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iwgGsWCndrhEfGDCpQF2tQ24jDruM2CXUo07bzIqmx8=;
	b=f9PXbG8w/diQPsGHyHQqcj8aD9iR1ovHYq9YqsAzs7OxFi5NDFVeZ8douq3gXxwjRZ49nV
	MTl8rWnlhjCtn9GdUfIis9g5tp5Y5vgfq0y+DAyPuEb4hnuKQsHaJLJqF4eLeQkI43/u3Z
	wR0K6WHFnq5NmK671vu9lg83f9tjug0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-F6XcohnJPeSEoPwK4_U9Iw-1; Tue, 30 Apr 2024 02:45:33 -0400
X-MC-Unique: F6XcohnJPeSEoPwK4_U9Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEA1D1049C9A;
	Tue, 30 Apr 2024 06:45:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0352EC683;
	Tue, 30 Apr 2024 06:45:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: devel@lists.libvirt.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH] docs/about: Automatically deprecate versioned machine types older than 6 years
Date: Tue, 30 Apr 2024 08:45:29 +0200
Message-ID: <20240430064529.411699-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-TUID: LBFGk5/wZSxE

Old machine types often have bugs or work-arounds that affect our
possibilities to move forward with the QEMU code base (see for example
https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
cannot be fixed without breaking live migration with old machine types,
or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
commit ea985d235b86). So instead of going through the process of manually
deprecating old machine types again and again, let's rather add an entry
that can stay, which declares that machine types older than 6 years are
considered as deprecated automatically. Six years should be sufficient to
support the release cycles of most Linux distributions.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6d595de3b6..fe69e2d44c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone noticing.
 System emulator machines
 ------------------------
 
+Versioned machine types older than 6 years
+''''''''''''''''''''''''''''''''''''''''''
+
+Starting with the release of QEMU 10.0, versioned machine types older than
+6 years will automatically be considered as deprecated and might be due to
+removal without furthor notice. For example, this affects machine types like
+pc-i440fx-X.Y, pc-q35-X.Y, pseries-X.Y, s390-ccw-virtio-X.Y or virt-X.Y where
+X is the major number and Y is the minor number of the old QEMU version.
+If you are still using machine types from QEMU versions older than 6 years,
+please update your setting to use a newer versioned machine type instead.
+
 Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.44.0
