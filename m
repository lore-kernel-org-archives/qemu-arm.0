Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1076088qvk;
        Thu, 10 Dec 2020 05:52:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlpRmWj4vwP9XQ8Pg3VAHGz4FiWPwJU6ILsdVzwuySGppAJOqS+CpAan6Q+g5cxyrQicQw
X-Received: by 2002:a5e:8e07:: with SMTP id a7mr8383139ion.129.1607608362775;
        Thu, 10 Dec 2020 05:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608362; cv=none;
        d=google.com; s=arc-20160816;
        b=NXxgU3x5u6a0Rgxk8lJ3AHCHMuUiGJsvPHff5deCT7GVUs5RYUk8rYZ5WgAu53YWUt
         0DVZ5zhgFoPVj5roFSINmx/jVWR837ENwe7rP1nfMHnTFrtxBPN9zNu1RQl6jsdtTV4f
         pgLjCX+VBmnzpthw0knbH8aTKJxsJRNihZUX+9Cz0ujGUmla2/GsDFqwEMj+7iScPDuW
         yFUqpYGsoYNG4Nm6v2qLIO+4wEZFB5YXqIPgeXT3PHo6QemJjlaWKyi5jiVAoz+hyEyc
         ukg/4hsacd2hHoFL953E57Ftd5PMDGKZOVvohyORVPw8Pdk9MCsZeTJYS9z4Sr7CiFIb
         o09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=RTnJJ5tS3uEIm5t/A/GM2tAIUagEhic34ZpOQ1Fixxo=;
        b=ApFuIxoskUrwAZyFjxYj5TgbeM9AHSnhGnKQYEvCusJKGy633w7CFsR5XlY+X+BCU2
         pU/I5TrGBx+VK/jFv9c5BefIb0mizaHiaatZcVszhhsKZU3/h8iHxZJbQcKGtTbqiyRI
         vOimyfqMb4JjltGT7+nkM6Ed5ZFaF4xYTo9p6qJrAWj+M/k+xya/B13zhp1HOCeu+Py2
         8rDjWgn1vvFgMBjrybmXPs/z4OVXGa2hHVdkcPbicX5qG5S/0R2B1TiftuVbVx3LA/8s
         IRtdft7soKDoV6n+tMeuHJQ0mIkMuhQa7+xNiuzRgR2R7ahByfal/yumCSNEphtdKGVY
         QX8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MzzaiFGi;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id g25si3632396jaq.48.2020.12.10.05.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MzzaiFGi;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49300.87199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLs-00007E-5W; Thu, 10 Dec 2020 13:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49300.87199; Thu, 10 Dec 2020 13:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLs-000071-1j; Thu, 10 Dec 2020 13:51:24 +0000
Received: by outflank-mailman (input) for mailman id 49300;
 Thu, 10 Dec 2020 13:51:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMLq-0008WE-Cf
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:51:22 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ef0ec818-f874-4358-809c-3e5f2609a83f;
 Thu, 10 Dec 2020 13:51:21 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-BuJ90PEsPry3jN9awvrssA-1; Thu, 10 Dec 2020 08:51:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D778100C66B;
 Thu, 10 Dec 2020 13:51:18 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 287FA5C260;
 Thu, 10 Dec 2020 13:51:06 +0000 (UTC)
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
X-Inumbo-ID: ef0ec818-f874-4358-809c-3e5f2609a83f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTnJJ5tS3uEIm5t/A/GM2tAIUagEhic34ZpOQ1Fixxo=;
	b=MzzaiFGiq5q00qM+WC0yYAQIUCamN/FMe+DNajHbr+952OM6aIpt6RrbpxL6W090qVxYLr
	2tIgozo2X4yyzSIuKZKyJNfRt2ACzEUrKcRRkAFlCBd4xiZMQKl26h9+I06HSzcLHiiaLB
	EhtUTVjkPCV/BFWh9HKgBguJfAlHCSM=
X-MC-Unique: BuJ90PEsPry3jN9awvrssA-1
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
Subject: [PATCH v3 13/13] compiler.h: remove QEMU_GNUC_PREREQ
Date: Thu, 10 Dec 2020 17:47:52 +0400
Message-Id: <20201210134752.780923-14-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YU9SgMPOSgGj

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When needed, the G_GNUC_CHECK_VERSION() glib macro can be used instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h    | 11 -----------
 scripts/cocci-macro-file.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 5e6cf2c8e8..1b9e58e82b 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -11,17 +11,6 @@
 #define QEMU_STATIC_ANALYSIS 1
 #endif
 
-/*----------------------------------------------------------------------------
-| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C compiler.
-| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.
-*----------------------------------------------------------------------------*/
-#if defined(__GNUC__) && defined(__GNUC_MINOR__)
-# define QEMU_GNUC_PREREQ(maj, min) \
-         ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-#else
-# define QEMU_GNUC_PREREQ(maj, min) 0
-#endif
-
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index c6bbc05ba3..20eea6b708 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -19,7 +19,6 @@
  */
 
 /* From qemu/compiler.h */
-#define QEMU_GNUC_PREREQ(maj, min) 1
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
-- 
2.29.0

