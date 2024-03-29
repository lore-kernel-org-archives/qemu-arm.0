Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1872169ejv;
        Fri, 29 Mar 2024 08:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjO4GkWjHja0ROqpauwN9EjXqCRJ/ZSh+PL4KIhZ8k5WKGZAeBmjt1kokXZtDACzqzyUJof5uAqbTUxrFBYmYQLSdLN9fB
X-Google-Smtp-Source: AGHT+IHxTWTbDJRctNjWCw7g51zi6PYwrlihnVllnVwV27I6sIn7jTKlXpiDuYbUDMzMYgN376r7
X-Received: by 2002:a25:9b05:0:b0:dcd:2f89:6aac with SMTP id y5-20020a259b05000000b00dcd2f896aacmr2279656ybn.10.1711724545372;
        Fri, 29 Mar 2024 08:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711724545; cv=none;
        d=google.com; s=arc-20160816;
        b=Kv9QVBeHMvqD9yXULMZIYMSzgA/H1PLQ8eSX095kiIYIXAvePWkjpEj6fTmr3/cFGW
         S7JwbGfuOiTHfnldOzwkWa0OGHbzUaHW5sLr5pDgP6d0+Jyx6wFaKfEWfWG7UxiyOGP6
         ieWyX3sttnpZGFCpkbW43Rf8id8e6W137NeIhGREfSZsdeOFqvCKqfic5VmI4p7YWVtp
         jx7zKeVYxN8tx2uYbj26XBc0pQLpe0qLob7jLzU4cuGQG8bsH+WM8rkPbX5csA09E/81
         ncJYlM6Esh02Zhz2OO+ylQtFKDrqvl+L3yj7sSJbZ9EVPxTsI6FiEpPx2+1db67Bi+vJ
         Culw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3JWsUApzBe/yU9PQWWAVMof614cOiCLUxZ5SkbW/Fy4=;
        fh=rkh+zGJ5FHZPI2EclbCZS0ohQsNngcugsEClosAmshU=;
        b=vwepeT0c58jOE1nzQfm2wKV0xUKaux/e5Y86c1EMzh4INn1ZdfyLnFn9nmQvyephJI
         6yYOSQ3/JAbavGo/DUH1fZxWxksSqusLKvGVvTR4eG0jjhqErRpc4PgRr1NTsuqdM86l
         JpjSI66auUnKz9DkrSQAIgfANTJkex4jCS4rSjcNRVd5rkh/6AUufcMfU9WquYuni0zD
         +hS/iwOdLkCkc4gPt1yr32pII8EBcLZIMqCLBlsa5BZZKZQKQNIescjeNviU4yjAq318
         iK6cyGj4NTRJW1WY/6s5oNmOPnw+F0wCz9JB8xvWKsXHJSk8MNwy6ZJSaJ8X76Clr66D
         l6KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqcAivub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a63-20020a25a1c5000000b00dcdafdaf1e2si1394215ybi.424.2024.03.29.08.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2024 08:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IqcAivub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqDkE-0008R7-RT; Fri, 29 Mar 2024 11:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rqDkD-0008QW-Qe
 for qemu-arm@nongnu.org; Fri, 29 Mar 2024 11:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rqDkA-0002fS-2w
 for qemu-arm@nongnu.org; Fri, 29 Mar 2024 11:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711724529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3JWsUApzBe/yU9PQWWAVMof614cOiCLUxZ5SkbW/Fy4=;
 b=IqcAivubjb37zueZWSG+MwmuiUXdhz3T+airSFs9lj3vjYDD7ELxtlH97R/vmJG2HlHmC6
 CVqgU5yEct/du6D6AChoZaKb6RyZ0XN6KgMpSIeVTvxFBGXbLW6jRi6W33rIHIuFjw0jEX
 /KbdVyy9rlc9B9MNkJRb5pcELWoI30k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-h0vDhlnVOeqYbcAwUyoXyg-1; Fri, 29 Mar 2024 11:02:02 -0400
X-MC-Unique: h0vDhlnVOeqYbcAwUyoXyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC2F3101CC67;
 Fri, 29 Mar 2024 15:02:01 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92A732166B31;
 Fri, 29 Mar 2024 15:02:00 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] raspi4b: Reduce RAM to 1Gb on 32-bit hosts
Date: Fri, 29 Mar 2024 16:01:54 +0100
Message-ID: <20240329150155.357043-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qk4fVvcCWD5v

Change the board revision number and RAM size to 1Gb on 32-bit hosts.
On these systems, RAM has a 2047 MB limit and this breaks the tests.

Fixes: 7785e8ea2204 ("hw/arm: Introduce Raspberry PI 4 machine")
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/raspi4b.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index cb1b1f2f147e8685a1dba6f137335ea0bc89bca5..85877880fc706d216de04ff1e081d66e6080ebac 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -112,7 +112,11 @@ static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
+#if HOST_LONG_BITS == 32
+    rmc->board_rev = 0xa03111; /* Revision 1.1, 1 Gb RAM */
+#else
     rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
+#endif
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->init = raspi4b_machine_init;
 }
-- 
2.44.0

