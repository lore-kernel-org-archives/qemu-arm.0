Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp884478ejc;
        Fri, 3 Mar 2023 02:15:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZPtfIGPTEcwy10FMzSBvJdqw8wl7tgUQMUSLDHIVPNHoWS8HN/Bj0AUbXraCYh+R4sC9Y
X-Received: by 2002:ad4:5cc7:0:b0:57e:ef8c:a83c with SMTP id iu7-20020ad45cc7000000b0057eef8ca83cmr785044qvb.8.1677838506243;
        Fri, 03 Mar 2023 02:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838506; cv=none;
        d=google.com; s=arc-20160816;
        b=YGqH0er2vNsNcNWj6ONqi3CX6X5PA5wU05+O7LZDRhy9QaU7FRye3rKpderqgkTlwa
         NllqUi9+A+iEM7+iUf5I6t9h5IfH8S9wovRjCPodc3AApcLsHB7fC4nj83ORAbtkYBHR
         7bcJnNlBNOpF0YXK/yKgrD8EoDKvrI3TZOPXjWOarZdkpTRvsYlDRvPJNjJSE6/RM3bo
         L6aga8psK/wyjI10ZbupGVZoUe2E2fy5FKlHmiTnQkXiTN2itK2gPNjiH4fhbhn5/Wxb
         WJWGP0r6tQFb4F01LqEhkgUPF6MGkIQnq0Qu93DEq8pJXxsF7oJeuk/O1ksAk5Jf6VOW
         j8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0kdnVnntb5nWcTW1rbFJ9Pn9nJlADeM6A9b2Bf+w7AQ=;
        b=RMpRF0eQby7L8DMgtkPV3C3xHPTuAx1YyxHOjzCHsJ1ISwgKQhLEbgKOAdPQlcpOUJ
         2KN1buO6ZH5kjrfcJL/Z3a+BPb1VMstYwn1Xu2CYB5YUnLUvzC00S3A57tHq3tBQQ8XL
         /yVk8ui+eh3RzHZ45rEncNfhtdELFrlfUUGcKhu8SIhnuelB0ch9nAWS7GgKJ1oKlIz/
         bo3/wL8MTt0C58f5eTEXX5Nw8h10o+Tih6/xWZN4FzMRokxbBKZaaJaJBVfRsF9uW7nf
         vt8KvQmB7CgpnaL2JB2d4ui4P0CVT4ELt91n6V/gAL6Krx0GM23CD6sbuVHUZUPpZ3k3
         UZzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LY8p4x6X;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g186-20020a37b6c3000000b0070655ddd307si1361445qkf.688.2023.03.03.02.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LY8p4x6X;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kdnVnntb5nWcTW1rbFJ9Pn9nJlADeM6A9b2Bf+w7AQ=;
	b=LY8p4x6XVC9uvZK8XlNl3Fjo921xq+VQqLV0kETF5dgI6tj5ip3NjseEfeSwJM2A/20XUp
	A6grFXYNQRJdne8GqEavkatZkurXjzCkbtZDt2DOQ+TFSFOUDDilTQbWcmgXCeNU4fE3CY
	Sp/lI0wm0tu7kimgcGyyUY0yf3rWuAY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-EPilcqYCMHO2VLnDNQ6Uqg-1; Fri, 03 Mar 2023 05:15:02 -0500
X-MC-Unique: EPilcqYCMHO2VLnDNQ6Uqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED471C0514F;
	Fri,  3 Mar 2023 10:15:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00B8F492C14;
	Fri,  3 Mar 2023 10:14:59 +0000 (UTC)
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
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 2/6] docs/about/deprecated: Deprecate the qemu-system-i386 binary
Date: Fri,  3 Mar 2023 11:14:48 +0100
Message-Id: <20230303101452.769367-3-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: KOT7+UCmghIm

Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
binary is a proper superset of the qemu-system-i386 binary. With the
32-bit host support being deprecated, it is now also possible to
deprecate the qemu-system-i386 binary.

With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index f0c1e6b545..a30aa8dfdf 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -34,6 +34,18 @@ deprecating the build option and no longer defend it in CI. The
 ``--enable-gcov`` build option remains for analysis test case
 coverage.
 
+``qemu-system-i386`` binary (since 8.0)
+'''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-system-i386`` binary was mainly useful for running with KVM
+on 32-bit x86 hosts, but most Linux distributions already removed their
+support for 32-bit x86 kernels, so hardly anybody still needs this. The
+``qemu-system-x86_64`` binary is a proper superset and can be used to
+run 32-bit guests by selecting a 32-bit CPU model, including KVM support
+on x86_64 hosts. Thus users are recommended to reconfigure their systems
+to use the ``qemu-system-x86_64`` binary instead.
+
+
 System emulator command line arguments
 --------------------------------------
 
-- 
2.31.1
