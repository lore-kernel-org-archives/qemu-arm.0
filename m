Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2065068lfi;
        Thu, 2 Apr 2020 07:53:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypJMmBIRB2fQoFBddvT5AJIjVHMw3wC1pbf3Zv4lWtTtH8qcXDSmfCxPwbOWs9we2taCUUYW
X-Received: by 2002:ac8:1aed:: with SMTP id h42mr3337256qtk.43.1585839187298;
        Thu, 02 Apr 2020 07:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585839187; cv=none;
        d=google.com; s=arc-20160816;
        b=jaNKxzFWtTspG5Ch1tRTXNdTAeSVywNm3mBcRvD3Ly6wEnQ6dPyfgRxdcL3zAxpHQX
         UApIxDeCcb0VjL2lcmMgvPelhqZS9pwgHWhblK4JqkEgwyccD/PmXZUt9VIaRWKopbie
         dSTYDvPflUkVKBE5wkNM5t2NMhIxq6Sfrw5lio/xyni/0BrUEUnecVaU3Y2RaS/jNgfg
         Zp3oDwsD7XQwWrVPemCVVBij0c/nFUMT0r5blK8sCcIsKzDOKbV52nIDVEky3wxteYGO
         uJUQ5PIvJl7TSynBjxFPGUV6xb+He025+VZRUbUPIzoXnq5TPTI3iIaaLT/DdU/pX3Vg
         i15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XgzdoaXT8yLeZom82aUYMFdOH/u5U78Ozh9Q39iwhvI=;
        b=bT9BSlUd4PLB8y56/ovpyJ/KDyu+fDl8PSO1arhPcPhWUehv2U+kP0qyh6dUN2iSkg
         Fz4k59jQCsZz9ayon+ohL7w/yPTeWo7NL4JgVOeLZ0oooxRfsKbUBXfqQBGefu8FWh4a
         naLPfT1omRBn7JC1Tx7mdto7urRohjMd8fyyniY7mt8wO6IV+L72m1HMQ8PhnAVoa2p7
         wEGlr1pxaHAda1selEPUBRF3LcMpeHiOxF7ITKEhMC3XNw6aak0fcLl3NWU4JmjODmaf
         cw8grHOZ2f/+mg34/MkMb/saP2qBy3LE041Fo/COh5kuDpnGJJe5UrJVLHg12JvoE2vt
         XsEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="T/Qmo1W2";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id p3si3596487qta.180.2020.04.02.07.53.06;
        Thu, 02 Apr 2020 07:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="T/Qmo1W2";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CF1134B16B;
	Thu,  2 Apr 2020 10:53:06 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxxINjLQpEtb; Thu,  2 Apr 2020 10:53:05 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B60484B0FF;
	Thu,  2 Apr 2020 10:53:05 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 2F7894B0FF
 for <kvmarm@lists.cs.columbia.edu>; Thu,  2 Apr 2020 10:53:05 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYeGmLJU3pp1 for <kvmarm@lists.cs.columbia.edu>;
 Thu,  2 Apr 2020 10:53:04 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 55E1B4A4BE
 for <kvmarm@lists.cs.columbia.edu>; Thu,  2 Apr 2020 10:53:04 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585839184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
 b=T/Qmo1W2dgmGZMOba0wlWwk90D+vWmwTOkrzEfNR9ceONnoq5pTytJQBpNjyDEaOfLXTcu
 NcWCIt76HFp7U+Smckq54JT/Y8W6DMSQYahMk6MeNzweaJTvgFdkC5WK+XOA0SZaDQKnQH
 b9zMPA6mAZdLGMySWmtePuEiHyFyvKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-5QyVT9ZHPAKQZ97M2o1qqw-1; Thu, 02 Apr 2020 10:53:02 -0400
X-MC-Unique: 5QyVT9ZHPAKQZ97M2o1qqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA5A8024DC;
 Thu,  2 Apr 2020 14:53:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 675655DA7C;
 Thu,  2 Apr 2020 14:52:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v8 02/13] page_alloc: Introduce get_order()
Date: Thu,  2 Apr 2020 16:52:16 +0200
Message-Id: <20200402145227.20109-3-eric.auger@redhat.com>
In-Reply-To: <20200402145227.20109-1-eric.auger@redhat.com>
References: <20200402145227.20109-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: andre.przywara@arm.com, thuth@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: n+Z0BUZVPE41

Compute the power of 2 order of a size. Use it in
page_memalign. Other users are looming.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/alloc_page.c | 7 ++++++-
 lib/alloc_page.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/alloc_page.c b/lib/alloc_page.c
index ed23638..7c8461a 100644
--- a/lib/alloc_page.c
+++ b/lib/alloc_page.c
@@ -155,7 +155,7 @@ static void *page_memalign(size_t alignment, size_t size)
 	if (!size)
 		return NULL;
 
-	order = is_power_of_2(n) ? fls(n) : fls(n) + 1;
+	order = get_order(n);
 
 	return alloc_pages(order);
 }
@@ -175,3 +175,8 @@ void page_alloc_ops_enable(void)
 {
 	alloc_ops = &page_alloc_ops;
 }
+
+int get_order(size_t size)
+{
+	return is_power_of_2(size) ? fls(size) : fls(size) + 1;
+}
diff --git a/lib/alloc_page.h b/lib/alloc_page.h
index 739a91d..e6a51d2 100644
--- a/lib/alloc_page.h
+++ b/lib/alloc_page.h
@@ -15,5 +15,6 @@ void *alloc_pages(unsigned long order);
 void free_page(void *page);
 void free_pages(void *mem, unsigned long size);
 void free_pages_by_order(void *mem, unsigned long order);
+int get_order(size_t size);
 
 #endif
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
