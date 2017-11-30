Received: by 10.223.159.82 with SMTP id f18csp390125wrg;
        Thu, 30 Nov 2017 00:53:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMap6aS5GQiPCFt4dYs0v5z6cWKRRLhmS6BksamdZYBFPKLaUWizkfeUbnvs77tbneay0q47
X-Received: by 10.129.193.65 with SMTP id e1mr945727ywl.371.1512032011145;
        Thu, 30 Nov 2017 00:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032011; cv=none;
        d=google.com; s=arc-20160816;
        b=RjdrwTPSmXPBTQ1OGEM9BOmsFqsCKcK1zEqd9R987HpOZTCAKBgr4auNkyOstzdm0m
         n8KfzZ6WRgtlS5C1BSe/o2tRUW2KXo7PQTDgSDmYNCOQq+RWcpKU4QRuQLnuBJQX6vOd
         sZTJYEFz9uHu0Kl0Ki8fJZhOT6ql43l1wKAL2x/AdwnWvOTCmBEBYpUwPrQmVyA9iOMl
         m7tAzDh7dW8u8VoHdXedvPgfjQMF0CIxllcfZ+U7Qfo5rfES9uGnYgGy1kmak0Z9Qgmc
         EsJKgiJf4mkOhGsndX0aDHqt/9PUXfqBL4+Q1MSBXXdBImIGPcUVI3TPiCMivgT3656m
         Unjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hCCle3YUfpCzvi9bPn+euN/+PjJ+ZnRyc1RIRWNhq1o=;
        b=cVGo6K8IY+LOfP1PX8i1l1m89FOuuL2jTuCR4S4XaSe8n/y7GqGrbRVlkRz4V8QGBj
         +7eGRK1cqQZ85pzKRc3oDaKIYiiSsfpUX6U3qw5fJQywlUaNMVf3zeidnRDzVxQtvIqQ
         dvjYdkeX7f5UG0vjO5ThOurN0wFovdJ2S3KczY35PZ3Uz5d2gEPE8XgQUwFyxX8/1B14
         5IDSZ75MyAmp3oQO7okKZCieVwN+rPX+O8XzFDlKKD57OcCZglrrkBRe3/qcA5TlpkYk
         OSx+4YLkkHiX79JkQMCKEF59HrbkgC67d0sfXyep3tXby5H9Ks0pK0ZciGrFlEoyhJLv
         1D8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e191si713259ybh.466.2017.11.30.00.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKb4-0005Am-IA
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:53:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKar-0005A2-DS
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKap-0006de-UD
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKap-0006dE-Ni; Thu, 30 Nov 2017 03:53:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAABFC04AC41;
	Thu, 30 Nov 2017 08:53:14 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D239E5D6A5;
	Thu, 30 Nov 2017 08:53:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:02 +0100
Message-Id: <1512031988-32490-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 30 Nov 2017 08:53:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.12 1/7] tests/boot-serial-test: Make sure
 that we check the timeout regularly
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
Cc: Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a2la9+jT1LHB

If the guest continuesly writes characters to the UART, we never leave
the inner while loop and thus never check whether we've reached the
timeout value. So if we fail to find the expected string in the UART
output, the test just hangs and never finishs. Use a counter to regularly
break out of the while loop to check the timeout.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/boot-serial-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index c935d69..fa4183d 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -43,12 +43,13 @@ static testdef_t tests[] = {
 static void check_guest_output(const testdef_t *test, int fd)
 {
     bool output_ok = false;
-    int i, nbr, pos = 0;
+    int i, nbr, pos = 0, ccnt;
     char ch;
 
     /* Poll serial output... Wait at most 60 seconds */
     for (i = 0; i < 6000; ++i) {
-        while ((nbr = read(fd, &ch, 1)) == 1) {
+        ccnt = 0;
+        while ((nbr = read(fd, &ch, 1)) == 1 && ccnt++ < 512) {
             if (ch == test->expect[pos]) {
                 pos += 1;
                 if (test->expect[pos] == '\0') {
-- 
1.8.3.1

