Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4509237ejc;
        Mon, 27 Feb 2023 03:11:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8vyeVOLJtVaTQcIox+8BSS2YHmGzbfReykwAChYZ3yR9Tw/BkE5fi8tgouXVa3JifSQLNX
X-Received: by 2002:a17:907:d87:b0:8bf:2458:a82a with SMTP id go7-20020a1709070d8700b008bf2458a82amr41710725ejc.75.1677496262838;
        Mon, 27 Feb 2023 03:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677496262; cv=none;
        d=google.com; s=arc-20160816;
        b=DG4WJMJwsS0snWx/NP+bfCHj3Sl2fVmNGZie40+IyVBapadVHlsPcA5EvMtAOfXmY8
         f9BnvYRUnHQeDFsL0tD6C6HmN+J9qCdKbcS2R3NMJQXUyggo0VEDIb65rgF2TI45Wqo+
         toNCb8ZsumKoltWfoS5VLpyFVZi/78PWn/+PhWBZzSqMlTQeKEBRcTyWQ3kbLkfdDE5k
         ZK6vyzlADRk6MA7z5vG1APEDrlOS9wnhkhAj6rFNcMk/+s2j3VLbbdp/AeM9Uq0VgETf
         KC4JMkG7nkJGb7VsYIz5w5J+P2PYq6BVtwp5LTL58GSXJ7CxWazyQ8BPiT28UKJYRLGe
         NiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wU7XSs59OHmkrBANt2Ig03ayelNixYK5a46ZpJhqPYA=;
        b=R8Yzxim5V/WuYTQ4L12puKSDmIot4HLN+EyDbXI78b5WuYd6JbYoG9ZTS6TPl476CD
         C8bA1WWoA1T7W7Q2B0QKXT35WpPwlW3X7U+EwYw5gPophsurvVvR31RYJVC9HQWUcgUM
         MXtApJcc2sBzrPnv3D9fQI4ZdGn0xCHU0p7GHKSmPSey8YOlGqI4CbBUL9VTDuvsTu3F
         NvAh7bMZKGN/dpGt1LesOtWDjwP4lFHvIEt2yenrwz4uOoaGCyQD/H4GPGHBQPRVti9u
         MBlaQoat6iK+ZLWMkWcaFCDtIiipSJh4ZNEQ6IDEpSM0C/nUl35IRzS7WeKrtaocMDCK
         k3Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Odrd57fu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id md11-20020a170906ae8b00b008f1ce937165si8406090ejb.613.2023.02.27.03.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Odrd57fu;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wU7XSs59OHmkrBANt2Ig03ayelNixYK5a46ZpJhqPYA=;
	b=Odrd57fuhDhIUT+pE6rvXYS1iiIxWCo/up6d7W1Loz5Ox3uQhcHZ0cgReVd0G5t0RAK3+u
	PpyzGZvVV2sod3ps344yQOUg1A2n3MTcEZbLguZxy40OI+0CB+MoAC1JjLZgMOjVNPVLCa
	6GDWT5753fMd+UZaGYdIhz+mLcpjzkg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-gGMehePCNs6EjNRatlKlsA-1; Mon, 27 Feb 2023 06:10:58 -0500
X-MC-Unique: gGMehePCNs6EjNRatlKlsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E28DB3C10682;
	Mon, 27 Feb 2023 11:10:57 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FFFB40C6EC4;
	Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
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
Subject: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and qemu-system-i386
Date: Mon, 27 Feb 2023 12:10:49 +0100
Message-Id: <20230227111050.54083-2-thuth@redhat.com>
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-TUID: zFIRlA2jLT4Y

Hardly anybody still uses 32-bit x86 hosts today, so we should
start deprecating them to finally have less test efforts.
With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..98517f5187 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Testing 32-bit x86 host OS support takes a lot of precious time during the
+QEMU contiguous integration tests, and considering that most OS vendors
+stopped shipping 32-bit variants of their x86 OS distributions and most
+x86 hardware from the past >10 years is capable of 64-bit, keeping the
+32-bit support alive is an inadequate burden for the QEMU project. Thus
+QEMU will soon drop the support for 32-bit x86 host systems and the
+``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
+superset of ``qemu-system-i386``) on a 64-bit host machine instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1
