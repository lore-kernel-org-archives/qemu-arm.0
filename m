Received: by 10.28.71.27 with SMTP id u27csp1309572wma;
        Thu, 1 Feb 2018 09:32:59 -0800 (PST)
X-Google-Smtp-Source: AH8x226S9LebQleW1YMtKJwRa7s9+TB92nTH6hSsn+TtFsLXrNvFYjtjes0drAP8GU54/nOpWVRV
X-Received: by 10.129.228.4 with SMTP id r4mr25841255ywl.301.1517506379354;
        Thu, 01 Feb 2018 09:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517506379; cv=none;
        d=google.com; s=arc-20160816;
        b=j/pMRLx1K9tlujKiIYjI7dbnF9l1UDKeXWRRD9MTWUUx1jE4wwm06UKMz6lalCOYV5
         khBQdFhkgstXWvTQ3LgsleBhGNBX81C7flepiSo4a+Z1+r3nnlldYUVUr2vo23yX1Mbm
         /E9cM8EShi8Yyyz8YzrhYMHpRcZU7c5njyztuSvLi4UF6yk68cqbGwgAFqgopKQOv4ta
         rXY7Rqo0dYfOuXa4uXaTZbIhow+i3Np5UWi+BEXKl73dbqMToDMXWmbpF0K6L8+dSVBd
         ITQ64Z5wCYMyua9GFypgb1Vwn+UobaQh28Btvfy30KIA9bJbcN/seyikjysY2BWS7lEc
         YTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xNiquYsX5AfE1uhAewtEJFI0QTpVHfc1V4ljwOqxzVU=;
        b=Uv3/A5EHIojs0tJzT0A+LwXgRyUHL0sMU7zLfj+zYBTk97xc53/iMcHDMgCmmUeseh
         4RCy6Iq5VjGWcjvj1/Hi8zSef+sNDDV+mmcuLiAreSVpmC22xoJXt6up+j0ULQDVRPZg
         HcgHZVyw66tHeTexPvTKFgzP9S7MWW/8Z6zaDBeaCIM3FYHM7Y8iPGwGgGov56duYCQR
         PfDAYOZEXs71yobdu8poPO7KE3a8FOs+8a+eH4pEpy0XVBm0wtfelrazJtiMnDWRGBZO
         7VimXoYIDE1pISDaD7f0/UMnJF+Pp55pLbQNVzDiy+6Cc7/VapW2/HQ1lsRcgkSnt1X3
         IGEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8si17380ywl.346.2018.02.01.09.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Feb 2018 09:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehIjK-0006E6-PI
	for alex.bennee@linaro.org; Thu, 01 Feb 2018 12:32:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIgK-0003mf-Nj
	for qemu-devel@nongnu.org; Thu, 01 Feb 2018 12:29:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIgJ-0005rz-RR
	for qemu-devel@nongnu.org; Thu, 01 Feb 2018 12:29:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ehIgD-0005mV-Jq; Thu, 01 Feb 2018 12:29:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA4D12C9D46;
	Thu,  1 Feb 2018 17:29:44 +0000 (UTC)
Received: from amd-seattle-09.khw.lab.eng.bos.redhat.com
	(amd-seattle-09.khw.lab.eng.bos.redhat.com [10.16.184.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D10E5D9CC;
	Thu,  1 Feb 2018 17:29:34 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Feb 2018 12:28:10 -0500
Message-Id: <1517506091-10396-3-git-send-email-wei@redhat.com>
In-Reply-To: <1517506091-10396-1-git-send-email-wei@redhat.com>
References: <1517506091-10396-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 01 Feb 2018 17:29:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] tests: Enable drive_del-test on arm/aarch64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L5CPnaje/3HR

Signed-off-by: Wei Huang <wei@redhat.com>
---
 tests/Makefile.include | 2 ++
 tests/drive_del-test.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ebdb151..e28277c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -365,9 +365,11 @@ gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
 check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
+check-qtest-arm-y += tests/drive_del-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
+check-qtest-aarch64-y += tests/drive_del-test$(EXESUF)
 
 check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
 
diff --git a/tests/drive_del-test.c b/tests/drive_del-test.c
index c9ac997..2e39442 100644
--- a/tests/drive_del-test.c
+++ b/tests/drive_del-test.c
@@ -123,7 +123,8 @@ int main(int argc, char **argv)
     /* TODO I guess any arch with a hot-pluggable virtio bus would do */
     if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64") ||
         !strcmp(arch, "ppc") || !strcmp(arch, "ppc64") ||
-        !strcmp(arch, "s390x")) {
+        !strcmp(arch, "s390x") || !strcmp(arch, "arm") ||
+        !strcmp(arch, "aarch64")) {
         qtest_add_func("/drive_del/after_failed_device_add",
                        test_after_failed_device_add);
         qtest_add_func("/blockdev/drive_del_device_del",
-- 
1.8.3.1

