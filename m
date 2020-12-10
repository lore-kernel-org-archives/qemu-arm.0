Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1075892qvk;
        Thu, 10 Dec 2020 05:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzF04cIT6bvT9yv6PKMPwuDVObpgPCUL8TNIfyfjhWU+OwcgmUXKugQ1iDEfNyKkYVnMeIw
X-Received: by 2002:a92:d151:: with SMTP id t17mr9506011ilg.108.1607608345449;
        Thu, 10 Dec 2020 05:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608345; cv=none;
        d=google.com; s=arc-20160816;
        b=C02sQvgiye3jnSy1ezMvHAVfUyu5+mXUjZ25QpKLaFZ2DT/aoKjCAXyEzLAGUrHyy7
         mRbGAi1yV9O0OWl7ydZmMQuo+0tKCAbLMX8OCG+F9+2p56H9DX14+y/+BOH3XcFCdJLt
         V2dfR5YRm1aaOJCZfVwAHRV/wmVC0b1UbmmMoReX4kpapJmTDBGe5MXenQ06JZ0t8PrP
         GOvpApcptHiEFFDaxC/QdoioKMHUrbpZXkXbMchZQQPvJwVAuZb2pPMbIDNT1GgDWakI
         Gv2sMvfaMr1xfWqRLQrOO4ZtsRRqeFGmvuwDIqaN0zTaAjuTpYRXi1lrDXIDDoFk7viU
         0TIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=K/Yso0JMCvkfnEynmDIuRnHbevbaJM9mZp2hfr8WVNA=;
        b=vldlojO6bOCfnpxFBbB59OKEOf5lYWm4o3zT/yu+1u3TQqmBqOd3yE9Ri3zIY83U+z
         3vvssslRh5We70sr36N8SAwB15067YD53zrIDu6r9oyC2FI5ra3FSsz6XetlEqaNjPfT
         lwiIV5k34AHkKxTCtkqGDA8k2faVjN2cEW8EHvw4iW1GuyqxudihCq+u0TwToIDY681e
         6hCbFwAduk0pM5Zc88o8M1GjjNKpyZey1gLIctDKjurTYlNhNy2z3S3akBlGT9Zd2Zaj
         pn6eO3UU+ynBADNGJN1yfUrupui+8Y0q5h19DBUh6NRUzvrzMHLKunR7UHybP+tKXJ/s
         malA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UxzRuB7s;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id p17si4130931ilq.4.2020.12.10.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UxzRuB7s;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49295.87187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLf-0008SA-SJ; Thu, 10 Dec 2020 13:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49295.87187; Thu, 10 Dec 2020 13:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMLf-0008S3-Nw; Thu, 10 Dec 2020 13:51:11 +0000
Received: by outflank-mailman (input) for mailman id 49295;
 Thu, 10 Dec 2020 13:51:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMLe-0008Pb-1s
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:51:10 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c60d29e6-9b24-42e1-9539-30dca2762416;
 Thu, 10 Dec 2020 13:51:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-iPA-pKwJOj-482M4VtH90w-1; Thu, 10 Dec 2020 08:51:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2125107ACE6;
 Thu, 10 Dec 2020 13:51:02 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56CB6E717;
 Thu, 10 Dec 2020 13:50:51 +0000 (UTC)
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
X-Inumbo-ID: c60d29e6-9b24-42e1-9539-30dca2762416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/Yso0JMCvkfnEynmDIuRnHbevbaJM9mZp2hfr8WVNA=;
	b=UxzRuB7sLDu0rMOMLu9BWUnRpJsDH9a5Q6pOoyhh+rq+7lxeIYwdmsbLEOMBWtOiwxxztM
	bIbDO+0gcxn32rFuJyB70+YCFcLdDm2UpMYRq9R78efh0Y9WoHJ0JlOwVK3jUq2HWn/grr
	ZBJJWYrZDI2LWQkEC4DoiSpUoSDHiEI=
X-MC-Unique: iPA-pKwJOj-482M4VtH90w-1
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
Subject: [PATCH v3 12/13] linux-user: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:51 +0400
Message-Id: <20201210134752.780923-13-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3jR+kNEl7r55

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/strace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 11fea14fba..e00275fcb5 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -24,7 +24,6 @@ struct syscallname {
                    abi_long, abi_long, abi_long);
 };
 
-#ifdef __GNUC__
 /*
  * It is possible that target doesn't have syscall that uses
  * following flags but we don't want the compiler to warn
@@ -32,9 +31,6 @@ struct syscallname {
  * functions.  It is ok to keep them while not used.
  */
 #define UNUSED __attribute__ ((unused))
-#else
-#define UNUSED
-#endif
 
 /*
  * Structure used to translate flag values into strings.  This is
-- 
2.29.0

