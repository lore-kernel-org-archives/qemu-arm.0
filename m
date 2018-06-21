Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2279281wrq;
        Thu, 21 Jun 2018 10:36:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKZbK7F0o2CeE3BWfTLIVl9bpYHqzoEfi0Et0+TDV0Pp7sRHzE6wYy/5XeEELl/DVVFWzMi
X-Received: by 2002:ac8:2db3:: with SMTP id p48-v6mr24939523qta.345.1529602616715;
        Thu, 21 Jun 2018 10:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529602616; cv=none;
        d=google.com; s=arc-20160816;
        b=YWT+RCaS/h7X72AzlP1/vY4tEJ6TniZ8brXlgG25ukVbKwY2G74Fhm8UrzMvTUuNRP
         DUy8gRGe0lYcpkvl/J/YM0T8+CDENtAfvci4f55DcwhjxGTkvIdkwV7htsFU3/7hotP0
         pa5QoWuN4IlJBUlCXzzMyIgVP+pkrqQuLADTEaa03GqXQHEpxixWxtXaNFJtiR1VMO+b
         /pXhsILUPBtyVyVQptB7VVRgF7DKNyeS/OrDGoz/04ILDw86EzgCxrFO3VcCT65ZfOL/
         /9YZ5IB6mpY6iemyb71W2cheudQUVvlzn8399AIt7gikxJfjVmGA8CcBiRXVN6CP62s7
         BYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dAGvimUHj8i54umH7c4ck5t1ysicwOLXz6VvcrwBBVo=;
        b=GddirzKaiA1iscUnuNp4brwmi7FjAPV/zfhyrdaLnBI0wQAp5cTvpx57tUVJLv6n9c
         C3cq8oZG61lx10aBTyKFJ6H3fS4YvZ4GGaILr/+VNxTalz/LcKNhm+SvUz9MjPUMtM9R
         UcBNx9OQ0h25L0sY+U+j/Vvcvc5VwgRZhyCgtPw3+0yZ/YhXStptVa+HD/PeYUdfXA5M
         FBig8sCXlaUnxQEOGSzqf2wjTQHPNK1R3lwXdrSCdjzYuLnBTV0TNZvJcbtGETIkxcvm
         k98OPHG/bu9fLTm9aOGy+r4QvXzpxSmS1sT0jmvhtaEOhDFUfKKYLROwa0QpCpoUq2n1
         McPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3dng0iw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a125-v6si5277400qkb.287.2018.06.21.10.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 10:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3dng0iw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3Vw-0000sa-4e
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 13:36:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fW3Vn-0000rL-Jr
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 13:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fW3Vm-0004Nr-HN
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 13:36:47 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:46428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fW3Vl-0004NA-QQ
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 13:36:46 -0400
Received: by mail-pf0-x235.google.com with SMTP id q1-v6so1864139pff.13
	for <qemu-arm@nongnu.org>; Thu, 21 Jun 2018 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dAGvimUHj8i54umH7c4ck5t1ysicwOLXz6VvcrwBBVo=;
	b=a3dng0iwajn81tYrivszbJwfLRCggA4jVOIOOmZ+uQ8sgblEQzwWV8X3N9v9e3UWnX
	so36Y8C++rWMYjpPTonROLhcq9g727K1sPaz+0Zr7RzY9sKecjqPp9WKlxsw/f2TiSdd
	cn8DXkvqP6fdOrmvieuSyyFRreKASXWi0ZGyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dAGvimUHj8i54umH7c4ck5t1ysicwOLXz6VvcrwBBVo=;
	b=UqY4hw2nC7jNAo9lBFCs3tEO7IFevoUlNsLyo1/txq1qT1glSd5Qkp5k036XLlAW3J
	ZZnI2Uv91nr6fKh47h0YbW1KqHXkrv+vEg5UHEJN2kT12KL1wR7MzoAWDegPZDN1dRw6
	yVrSJ+ncVDiD0c0IeU1whu4fyCdBIJirTbvr1EUXsn3kK40jwIvGIKZ29hGEKJHElzrm
	uYPSkW5SMA984kSXZ/XhabGjBjyjMw1R38k7z4v9DIGp/fgf01wWcWslJCS2Z1tlUId6
	7MbgeISbV9egJ6kPvNKCRRKtK0W3ypGR8nES2dIy+yYfV8TrGFytHCviGjjhZs6och3D
	edVg==
X-Gm-Message-State: APt69E2M6UWLO1Y6TRB7ky7WytYARVBAiRI1OMleI51xI0z4TtV/Unz6
	EVa/R9iq+IO9KO60SIu1axayt1zm9kw=
X-Received: by 2002:a63:8b44:: with SMTP id
	j65-v6mr23985916pge.203.1529602604780; 
	Thu, 21 Jun 2018 10:36:44 -0700 (PDT)
Received: from cloudburst.twiddle.net (mta-98-147-121-51.hawaii.rr.com.
	[98.147.121.51]) by smtp.gmail.com with ESMTPSA id
	e192-v6sm9642897pfg.187.2018.06.21.10.36.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jun 2018 10:36:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 21 Jun 2018 07:36:35 -1000
Message-Id: <20180621173635.21537-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621173635.21537-1-richard.henderson@linaro.org>
References: <20180621173635.21537-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: [Qemu-arm] [PATCH 2/2] linux-user: Use pthread_rwlock_t for
 mmap_rd/wrlock
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
Cc: cota@braap.org, laurent@vivier.eu, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rk+IwyoVznon

Change the implementation of these functions to use an actual
reader/writer lock, allowing multiple simultaneous readers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c | 52 ++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 71b6bed5e2..2dc133515a 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -24,52 +24,62 @@
 
 //#define DEBUG_MMAP
 
-static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
-static __thread int mmap_lock_count;
-
-static void mmap_lock_internal(void)
-{
-    if (mmap_lock_count++ == 0) {
-        pthread_mutex_lock(&mmap_mutex);
-    }
-}
+static pthread_rwlock_t mmap_rwlock = PTHREAD_RWLOCK_INITIALIZER;
+/* Bit 0 indicates reading; bit 1 indicates writing; bits 2+ are count-1.  */
+static __thread int mmap_lock_held;
 
 void mmap_rdlock(void)
 {
-    mmap_lock_internal();
+    if (likely(mmap_lock_held == 0)) {
+        pthread_rwlock_rdlock(&mmap_rwlock);
+        mmap_lock_held = 1;
+    } else {
+        /* can read-lock when write-lock held */
+        mmap_lock_held += 4;
+    }
 }
 
 void mmap_wrlock(void)
 {
-    mmap_lock_internal();
+    if (likely(mmap_lock_held == 0)) {
+        pthread_rwlock_rdlock(&mmap_rwlock);
+        mmap_lock_held = 2;
+    } else {
+        /* cannot upgrade a read-lock to a write-lock */
+        assert((mmap_lock_held & 1) == 0);
+        mmap_lock_held += 4;
+    }
 }
 
 void mmap_unlock(void)
 {
-    if (--mmap_lock_count == 0) {
-        pthread_mutex_unlock(&mmap_mutex);
+    assert(mmap_lock_held > 0);
+    mmap_lock_held -= 4;
+    if (mmap_lock_held < 0) {
+        mmap_lock_held = 0;
+        pthread_rwlock_unlock(&mmap_rwlock);
     }
 }
 
 bool have_mmap_lock(void)
 {
-    return mmap_lock_count > 0 ? true : false;
+    return mmap_lock_held != 0;
 }
 
 /* Grab lock to make sure things are in a consistent state after fork().  */
 void mmap_fork_start(void)
 {
-    if (mmap_lock_count)
-        abort();
-    pthread_mutex_lock(&mmap_mutex);
+    assert(mmap_lock_held == 0);
+    pthread_rwlock_wrlock(&mmap_rwlock);
 }
 
 void mmap_fork_end(int child)
 {
-    if (child)
-        pthread_mutex_init(&mmap_mutex, NULL);
-    else
-        pthread_mutex_unlock(&mmap_mutex);
+    if (child) {
+        pthread_rwlock_init(&mmap_rwlock, NULL);
+    } else {
+        pthread_rwlock_unlock(&mmap_rwlock);
+    }
 }
 
 /* NOTE: all the constants are the HOST ones, but addresses are target. */
-- 
2.17.1

