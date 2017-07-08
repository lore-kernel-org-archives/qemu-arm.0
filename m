Received: by 10.25.44.15 with SMTP id s15csp806127lfs;
        Fri, 7 Jul 2017 19:51:10 -0700 (PDT)
X-Received: by 10.55.165.200 with SMTP id o191mr71017310qke.47.1499482270712;
        Fri, 07 Jul 2017 19:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499482270; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUrID3nqsUwqFB6mRQQJc7LYPKbSobqCUKQwufc7cmEE2noYQG01C4P4r5gn20U0pA
         JLqMpyugfcA6bf2VvzRVmROr5bVZXH0w1DoiLMRjAOe23tLKAIR9IFW3z90Qi7RhNhiW
         QC70yX3VSGhzDqgUbwLisvAIj/vx+NjuHb1FlVeaMlHY6537WrkN9WtfcJErTSwxlU5L
         13eRotb1ySIWGGgVapM2JvdevhSQPwZtpttOEFtYFep/qI95Q33+L57ZU5bgcEa+aURx
         9R2Y+4sZjmEZO+ISmfK1dKDUwwwIw8eh/d7eXSa0r1DRAwG/8Mo/gbKQMFwUrOCu/1qt
         9TJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BHq3V6wgsHmxbKumrTk0927GbDnWp342NVcNICOr4+M=;
        b=Y1gijWiI80yzVIT+wo1fpTDcCs9OOqP+c606P1G6poWXPLoX24gM1mnc5U4B7mDs0X
         cBDUm1VuKiGbwyeqZZFZk95KxZvveY/Sk6YEM4j8nQOsl00qbtdIOhJZ7RpMIWojypDU
         exs5OYb7ng+Ok6ctux/04ng4B6+PYR/dzgNZGV5hZSz5cymBxLFAEJSaZwDzZFWgEpg4
         CJcqCJl9S2Mvlf9gQi9ciRuOihIPJxkglU738ImOP8ZfuTL6BD14QOkyxD0ybndw38fW
         ftqQVR9iDIhYpdstOeJDdcM8csUmLRgtIZmjp2nC0Q94E4N7rhX4GPT4PFONDlL3hX3z
         ysrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=pRjLOHue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si5169850qkk.191.2017.07.07.19.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 19:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=pRjLOHue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTfpr-0001Vq-WF
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 22:51:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfph-0001Su-4j
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 22:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpg-0004yv-Bh
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 22:50:57 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33295)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dTfpe-0004xM-7x; Fri, 07 Jul 2017 22:50:54 -0400
Received: by mail-qk0-x244.google.com with SMTP id p21so6558356qke.0;
	Fri, 07 Jul 2017 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BHq3V6wgsHmxbKumrTk0927GbDnWp342NVcNICOr4+M=;
	b=pRjLOHuesPhQ/syuSWajWtChdAID5lfv6N35L+WSU8DTvUlfghVBSHViXKi9eHu7oX
	Afqyhl+7yx10EJBvcg7GY/b+7eDcoAbuoxGpwyN7VTXTx8/o3MPytZEauX8ejCkXwhle
	PyNfEa75eM+gu5rPARQTTJa8NQMVwCuZfUfpmqAu+xVxq6C1iRruOBGrRZmqLCKRtU1L
	xQ//Ly1A8qMJTOv3QlMJHjXvD8YB+/7olGEE72e/krbILDXlefCjDmIYFTTR8yX2n15J
	Ql/ZBKwQHPaXnBQR9CFciG28lFPPvF6BlL1o78YXTw1ex1yv2435j+hQOWGqckrrYWXK
	98xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=BHq3V6wgsHmxbKumrTk0927GbDnWp342NVcNICOr4+M=;
	b=fCuAr3bIEUMRFQX2acnqR1XKZ2OopCx4pjvexK6/Do9Wz9gCC0do6tZbAxMFBO8B7o
	ZDJ1YVHdM70tNgcC+TZXIas+iB3JVau3c+ZT7Z2o26o3hG8XoAeXFF8WRz1Pb+d8kU81
	iihJnTKSh1zuWtj/rROxx77IX3IZIxWno3duNXWO/5/9k4MjimQlqBZr++Vt7OLlKXPR
	RmP/qANVRNE1C6uoegEg2pHVvQTwQqC8gxzWR1x1hmJvAYmJYvLf4g1CIEhr7tXbTJt1
	ICPANU2mNpW0KcMe/4Q4PjmkrGNNKz4kD8KTas577yq3fCXqWYq7CPrmqVZGgmVV/wUR
	givg==
X-Gm-Message-State: AKS2vOwbqO+NoiK3cGV39JuHHZo1r8f5vyMwczEenqrs7JVuSApbMkBC
	yMz8oU8twLAYkZsJNsU=
X-Received: by 10.55.5.135 with SMTP id 129mr72239118qkf.184.1499482253421;
	Fri, 07 Jul 2017 19:50:53 -0700 (PDT)
Received: from bigtime.twiddle.net.com (rrcs-66-91-136-156.west.biz.rr.com.
	[66.91.136.156]) by smtp.gmail.com with ESMTPSA id
	q90sm3793925qki.11.2017.07.07.19.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jul 2017 19:50:52 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jul 2017 16:50:28 -1000
Message-Id: <20170708025030.15845-2-rth@twiddle.net>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170708025030.15845-1-rth@twiddle.net>
References: <20170708025030.15845-1-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH 1/3] tcg: Fix off-by-one in assert in
 page_set_flags
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: aurelien@aurel32.net, riku.voipio@iki.fi, laurent@vivier.eu,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZ30+vqsKsaL

Most of the users of page_set_flags offset (page, page + len) as
the end points.  One might consider this an error, since the other
users do supply an endpoint as the last byte of the region.

However, the first thing that page_set_flags does is round end UP
to the start of the next page.  Which means computing page + len - 1
is in the end pointless.  Therefore, accept this usage and do not
assert when given the exact size of the vm as the endpoint.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index dfb9f0d..57578a4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2068,7 +2068,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
        guest address space.  If this assert fires, it probably indicates
        a missing call to h2g_valid.  */
 #if TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS
-    assert(end < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
+    assert(end <= ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
 #endif
     assert(start < end);
     assert_memory_lock();
-- 
2.9.4

