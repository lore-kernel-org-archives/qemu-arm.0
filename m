Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1075055qvk;
        Thu, 10 Dec 2020 05:51:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8nKaBBcbHF3wJxkr84KfZY2Bpldm36iOO0CuCst/7S4tVJt1pnL8+TOubIYCTX1VVxXt0
X-Received: by 2002:a02:c7cb:: with SMTP id s11mr8948395jao.94.1607608268482;
        Thu, 10 Dec 2020 05:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608268; cv=none;
        d=google.com; s=arc-20160816;
        b=apnE41LExoIdC4cizyxktidcP5lpPVZxn/6xQ9CDLkt4n9kQTWN9av413m7poZxpb+
         US4jm/fYz+gUR1MBouXEXzqFylaF9LuSLMwqiSblAuZ9rF2qjWI1AFqxBgujwzkwJssf
         phBt+Oc+429qJ605pS5QaY/0a1XSOtFZ6dOx51PfTj7oqVu6oMOP/LsTk+QamXV9OsO5
         Q1We2aytIbQmGfBrxqwo7Euw6Y/KFjE8Ul3j4njh3oXE6yhefSIuMubtsoeCc1fC2wiS
         JUwFJ32OOtr7B/+5U3B7QkpEpDuQ2lsrPBlmOGROeN8AN40Ii9xD8B6vQbhQOe1/i4XI
         Q17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=uC8B/2alqBgSU7hoZ9+H0Qhhp1eKRr97cLOh0lFkCEo=;
        b=lJIVNzp7Euy+AOwhe9ztrItIIT2DU5hjFUiUw8nwNb224dz+UsSdgnylIvU+tUeulM
         b/IhAq3rxZdScvavZaNqTnOLy3bGfSH0W7ZJEo8K3ZR0Xbq+BvPrjraB8waEuekOVftH
         YqLN0mMsOrKtmyP12jSwn6UdUh0zbRzCsaO5D/PeMJkHOVrFkyi3FLzm3uN34w9+Lllc
         5DqaVQE0bzCBM/eDV8DwriYA3hS03X2/6GH0uBkSpcqyKjvdlw2KULN6yhiq/fZXN0KZ
         B5F3kygrIs2EDEI+3PMTbeQ82w3ZJO1b+Ae5megEb5EGqnNO1Td8v/Eg4KgOzpS+XPwq
         gZ7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IOWaDCl4;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id g25si3629248jaq.48.2020.12.10.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:51:08 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IOWaDCl4;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49268.87127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKX-00074Q-Ct; Thu, 10 Dec 2020 13:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49268.87127; Thu, 10 Dec 2020 13:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKX-00074J-95; Thu, 10 Dec 2020 13:50:01 +0000
Received: by outflank-mailman (input) for mailman id 49268;
 Thu, 10 Dec 2020 13:50:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMKW-00073v-Fd
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:50:00 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2a25ce89-4d1c-4c55-9d20-3c7fcb2b3913;
 Thu, 10 Dec 2020 13:49:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-d9qAt3hLPxmeeP3x39eJCw-1; Thu, 10 Dec 2020 08:49:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A7811005504;
 Thu, 10 Dec 2020 13:49:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14C1010021AA;
 Thu, 10 Dec 2020 13:49:43 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2a25ce89-4d1c-4c55-9d20-3c7fcb2b3913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC8B/2alqBgSU7hoZ9+H0Qhhp1eKRr97cLOh0lFkCEo=;
	b=IOWaDCl4oVIs654F2uXzz8cwZ5dpzZcUsd1soPsoC88yNtkm9VRZvwQgyL/ffc2r/xJWgN
	x1KM2s1lELeVbEfLvH4jg4UUeAnKTLX12lPuwBgGmgrW4DMYik7+XbZ2n1SQp9uGMC2apL
	vkd1DZPZ/iCUsRc3l8SuQlk3txdpeDM=
X-MC-Unique: d9qAt3hLPxmeeP3x39eJCw-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 07/13] compiler.h: explicit case for Clang printf attribute
Date: Thu, 10 Dec 2020 17:47:46 +0400
Message-Id: <20201210134752.780923-8-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yv4778XxyxbK

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8, we could thus drop
earlier version checks. Except clang advertizes itself as GCC 4.2.1.

Since clang doesn't support gnu_printf, make that case explicitely and
drop GCC version check.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/compiler.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 226ead6c90..6212295e52 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -99,18 +99,18 @@
 #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
                                    sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
 
-#if defined __GNUC__
-# if !QEMU_GNUC_PREREQ(4, 4)
-   /* gcc versions before 4.4.x don't support gnu_printf, so use printf. */
-#  define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-# else
-   /* Use gnu_printf when supported (qemu uses standard format strings). */
-#  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
-#  if defined(_WIN32)
-    /* Map __printf__ to __gnu_printf__ because we want standard format strings
-     * even when MinGW or GLib include files use __printf__. */
-#   define __printf__ __gnu_printf__
-#  endif
+#if defined(__clang__)
+/* clang doesn't support gnu_printf, so use printf. */
+# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
+#elif defined(__GNUC__)
+/* Use gnu_printf (qemu uses standard format strings). */
+# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
+# if defined(_WIN32)
+/*
+ * Map __printf__ to __gnu_printf__ because we want standard format strings even
+ * when MinGW or GLib include files use __printf__.
+ */
+#  define __printf__ __gnu_printf__
 # endif
 #else
 #define GCC_FMT_ATTR(n, m)
-- 
2.29.0

