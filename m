Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp975113lfc;
        Mon, 9 Mar 2020 03:24:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuDbfk4wA/6U8fpg7zWAMqeefYHWItoT6X5BXetdauubOkO7Ykdpq01oQRd4NOknAzxR0el
X-Received: by 2002:ae9:f707:: with SMTP id s7mr6805493qkg.5.1583749490399;
        Mon, 09 Mar 2020 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583749490; cv=none;
        d=google.com; s=arc-20160816;
        b=zmZdxWIryCH2w7h7XxwChf33rOpSXex0PY8iSfy1vPyS4/6WuAqDpQ/jn8hN5aOES/
         viK1vCRQ3fQWnhqqmr27EUsaaKGHBIwMXv5Fhh0GoBxzchlSmT5pDEpvGY993nmyAGRi
         Ml9KWRgU+UnszNxZMoh7pKKWpksiWANGuvc4PBFEbTrfTZ7DlslhI63uABrnccqs66g8
         p/mPhvU0LCulQgdB79aeAoU1BLvTUUgS8Asfy8paqCrhZMlopOXoccy24t59rheBCcXC
         kQTMhiQxWzLQCbKsRgdjxMpew2sDkvD8lgjlqh5zazPrpaANDAIjjIqmshWftzultde8
         Iu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XgzdoaXT8yLeZom82aUYMFdOH/u5U78Ozh9Q39iwhvI=;
        b=HnJwCfgaWMz+eTo7BM9MhjwVfFrnchmSqZshSZ1zk0OT5Hlf2IyzBU+Y0UOBjGwB89
         WOuQ/0h6EQaD4p1hl2gB0KNMG4O8nfMS2oiNff5vy+k1Zu5DEbmCVuif4cCAjpfopGzw
         2Q1wt+BABYdWdzdP8+Aah7CuaYtoVENLVbfdZRc8Y9U/94rFXT7Wxy91eKBCuBl9E2iq
         zeDioCoZqCjVgo+beEL7T+E88LpkVtIhuHAagDVuWsrjGCEhiO1R5RBkbBXlkjN0oHu/
         LER5t8aIJHPap4KvndV9/d9cPQZljaGBciZQ4Qo7romlkuzwRv5zqhfUzpkuvx+msq9f
         vMFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=UTUqO30T;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id w8si5749988qth.81.2020.03.09.03.24.50;
        Mon, 09 Mar 2020 03:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=UTUqO30T;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1D5204A591;
	Mon,  9 Mar 2020 06:24:50 -0400 (EDT)
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
	with ESMTP id f2Bma5ujR25W; Mon,  9 Mar 2020 06:24:49 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 294DB4A51E;
	Mon,  9 Mar 2020 06:24:49 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 40E014A500
 for <kvmarm@lists.cs.columbia.edu>; Mon,  9 Mar 2020 06:24:47 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWsDwi66GCHx for <kvmarm@lists.cs.columbia.edu>;
 Mon,  9 Mar 2020 06:24:46 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 673CD4A4FC
 for <kvmarm@lists.cs.columbia.edu>; Mon,  9 Mar 2020 06:24:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583749486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
 b=UTUqO30TPKFqz/Znns9sVN+bEOm+a0tJt/Lmp3Bw0QJQf7qsGR0ccEtIwlwrv1wW3gYYdN
 kNaOeM7WqqyIKdUqDjbd7Otiaif4ykYiE22sy/5hKh/osqyGXxBe7IYF9i17XOqN2bjJc3
 /EwL/vyE3sxnLp1FqeW4bKOsfYIGv88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-kn_oEwKnOn2anCLGpUgNTg-1; Mon, 09 Mar 2020 06:24:44 -0400
X-MC-Unique: kn_oEwKnOn2anCLGpUgNTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FDD0800D48;
 Mon,  9 Mar 2020 10:24:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1269587B08;
 Mon,  9 Mar 2020 10:24:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v4 02/13] page_alloc: Introduce get_order()
Date: Mon,  9 Mar 2020 11:24:09 +0100
Message-Id: <20200309102420.24498-3-eric.auger@redhat.com>
In-Reply-To: <20200309102420.24498-1-eric.auger@redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-TUID: t3m1HLSXJqu/

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
