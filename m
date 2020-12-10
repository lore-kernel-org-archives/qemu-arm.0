Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1075388qvk;
        Thu, 10 Dec 2020 05:51:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhtlEkrmy94w4jBrSlsuoD8VIgtOUKIyayNI1ne16BcTmcXm65/INJ1M5bKIoOkhENgur9
X-Received: by 2002:a05:6638:25d4:: with SMTP id u20mr8967578jat.54.1607608301656;
        Thu, 10 Dec 2020 05:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608301; cv=none;
        d=google.com; s=arc-20160816;
        b=fffMrfO3FdnICgCnRhz9tI19fHREEk/yGTGRzXgdxUVcYfPWDSKqSkg+fQMjtPKaWA
         GarRsrmM4hKj68zbz+axNU4Ne496oTLSL9Jrndj6bc+s6E1gy96rv6u4B8qHC8q/uOiJ
         DuJB1WiSkH7rjF/F6jJme65fdl/C/FTaNdiq5wPx9AUdpFub6LfFEHjIrU7JlA+dFmHH
         Gle6nHsK/sIsAQqLIfSIaTyMFZBwsUSV0gWyhQBS0W0oCyO5d50k6OZp0rEVeaST45r8
         SHlyLwbPlxuWZm8dwsQzbaeMnBo1b9D8fDwPmouhPS73Tyz40SsbUEVu/TcamkmzWWuc
         AESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=HuW0gR6laAl8ZCFcUIcQZqus2PIG7w04hxhAM9m/fXo=;
        b=U/EssA9BXTf/CvQKD3i14792qKnwUTXSF9VqmaR/yPIJD4x6nDuV+12ijj0ao3Snle
         JK9fndm90ACV9vk5OAx4teeCLeQuaXuhVVZdsmTIKrdWpnoJUm/Rwxff5CLBuZlUL5nX
         UYGQb/FWwfj8WsQaYOJa25yg9E5u2trDJdyZ55Bwvqs/f0AX3IuaLvqsO9y3tzbbeWAz
         I0LfRY7Gof5+GfnyQIs7180HHihHPDhafZUOGAh0DMDZmm5vnIRz9KlluCci789nbwzS
         wTuTJmDSYDDuhDFA5UDtaw8fAdUAuObQW31KQgROB//z39Ut74led25apSy08FXnvsv1
         gI3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OTFLIhzU;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id p4si3975654ilm.113.2020.12.10.05.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OTFLIhzU;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49284.87163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knML9-000853-87; Thu, 10 Dec 2020 13:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49284.87163; Thu, 10 Dec 2020 13:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knML9-00084w-4F; Thu, 10 Dec 2020 13:50:39 +0000
Received: by outflank-mailman (input) for mailman id 49284;
 Thu, 10 Dec 2020 13:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knML7-000836-WA
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:50:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0374b9c9-2f3c-4872-a240-c66cc15a66a3;
 Thu, 10 Dec 2020 13:50:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-SxnkM2ESM9-NbJcLlr6UVw-1; Thu, 10 Dec 2020 08:50:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 637AE100C667;
 Thu, 10 Dec 2020 13:50:33 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B5B460BF1;
 Thu, 10 Dec 2020 13:50:21 +0000 (UTC)
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
X-Inumbo-ID: 0374b9c9-2f3c-4872-a240-c66cc15a66a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HuW0gR6laAl8ZCFcUIcQZqus2PIG7w04hxhAM9m/fXo=;
	b=OTFLIhzUeNoBNDr2sJWR8Gx/iU4GbgALgXcfzxwU72+2RfPu8xSKKLLSsfGrMdtquDu8Nf
	IQgQxI/KfIcHWgra+4I4aoMckyNvxJhcfmPjVlHXXCFKC8Hhij4+VenqJr1q/dNUN6eh84
	cXHJOsNXol76QqTthTWe0zggdya3rXw=
X-MC-Unique: SxnkM2ESM9-NbJcLlr6UVw-1
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
Subject: [PATCH v3 10/13] xen: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:49 +0400
Message-Id: <20201210134752.780923-11-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qH4WzK7mYHra

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 include/hw/xen/interface/io/ring.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
index 5d048b335c..115705f3f4 100644
--- a/include/hw/xen/interface/io/ring.h
+++ b/include/hw/xen/interface/io/ring.h
@@ -206,21 +206,12 @@ typedef struct __name##_back_ring __name##_back_ring_t
 #define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
     ((_r)->sring->rsp_prod - (_r)->rsp_cons)
 
-#ifdef __GNUC__
 #define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
     unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
     unsigned int rsp = RING_SIZE(_r) -                                  \
         ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
     req < rsp ? req : rsp;                                              \
 })
-#else
-/* Same as above, but without the nice GCC ({ ... }) syntax. */
-#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                \
-    ((((_r)->sring->req_prod - (_r)->req_cons) <                        \
-      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        \
-     ((_r)->sring->req_prod - (_r)->req_cons) :                         \
-     (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
-#endif
 
 /* Direct access to individual ring elements, by index. */
 #define RING_GET_REQUEST(_r, _idx)                                      \
-- 
2.29.0

