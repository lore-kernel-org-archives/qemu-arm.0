Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp2866898wme;
        Sun, 13 May 2018 02:06:39 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpf665VMghGJhbSRXn3mWme5mUV0JRyzj6fggx2W20x4AlkwPa0kgBYpCSViyeKIrAmSqnI
X-Received: by 2002:aed:2785:: with SMTP id a5-v6mr4624073qtd.249.1526202399243;
        Sun, 13 May 2018 02:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526202399; cv=none;
        d=google.com; s=arc-20160816;
        b=eaeXL9RwJ72M8AbR2cn7o6GZNx3vFFgjIBY6FCsn3E1mCHR6NPnqWrk71eIqv/FhYP
         ygLV/B8hOy1JQZp2rPX7WjpQWAoGT8Q1GvVqBUVlWGtavW5yEJ+Ek1yxCzUYbz+rGkuW
         IF36RGDEkAUEOkCtSn83w/JWNmHBHhLEZZbspuvYPLqXybFl9yaMuk3BoiKXFahGM9rg
         LapAcSgNVMT/Z65tse9E1CYPJjCzH+Yt77RBG1old+usOYIX8JNsb9L25hjcvRI9IsvP
         IDSlTZvUsjD80wfWPNMTWOPYGpPYS7jYVDFET2rye6O7OHBkw+ceQ4RhW5lhGurWe1yR
         rhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=by84IM5/Xh5UyF/ep2/UJOwBJ+Df6/3YRZ1lVjvKr5Y=;
        b=Qhvq/1IYnDLb6Dp5tz7FzNHGGiDFqYBAtSdPhU9pcocL1S5O8yArT+p5ctWIeEoxQG
         EreSIokT5V4LFS07sZOSBDi6VZALY2zqsaR5jy56Fyc+Yp7U0WfnDvwV69nECdFQkUqx
         wM0MhB5TOzy3eGbIvzBocT62/CgUtKPmnfTAQ83WYU8Hh3S2W28iqIaKZpa2hizkVLMm
         VQ/X67oEuwv3x5oQzB2bngegGSUpv/NsxiuPGJiM15Z/48c9svcjhLs3lc2+g5AB9HMf
         r2WBqo/7VZSxTJQB3zHNJNy/92tLbGzjy2UQ5uUj3CRND2N1NszTlb1bL39y4/aFTB85
         3cvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k31-v6si2747091qvh.111.2018.05.13.02.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 02:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHmxi-0004IO-QL
	for alex.bennee@linaro.org; Sun, 13 May 2018 05:06:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1fHmxb-0003K7-Bf
	for qemu-arm@nongnu.org; Sun, 13 May 2018 05:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1fHmxY-0003qd-7B
	for qemu-arm@nongnu.org; Sun, 13 May 2018 05:06:31 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:41714
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1fHmxY-0003qL-0m; Sun, 13 May 2018 05:06:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 7BC0FDAC716;
	Sun, 13 May 2018 11:06:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jdN7jQC1xjEU; Sun, 13 May 2018 11:06:23 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id A1286DAC715;
	Sun, 13 May 2018 11:06:23 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 8FD46460013; Sun, 13 May 2018 11:06:23 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Date: Sun, 13 May 2018 11:06:13 +0200
Message-Id: <20180513090613.27960-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro for
 QEMU
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iO6vgFHjq4ij

It now prevents compiler warnings (enabled with -Wimplicit-fallthrough=
or -Wextra) as intended.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I suggest to add and use a similar macro QEMU_FALLTHROUGH()
for the rest of the code and can provide a patch if that's
fine for everyone.

Regards
Stefan

 disas/libvixl/vixl/globals.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
index 61dc9f7f7e..33c4231d91 100644
--- a/disas/libvixl/vixl/globals.h
+++ b/disas/libvixl/vixl/globals.h
@@ -112,6 +112,8 @@ inline void USE(T1, T2, T3, T4) {}
 // C++11(201103L).
 #if __has_warning("-Wimplicit-fallthrough") && __cplusplus >= 201103L
   #define VIXL_FALLTHROUGH() [[clang::fallthrough]] //NOLINT
+#elif defined(__GNUC__)
+  #define VIXL_FALLTHROUGH() __attribute__((fallthrough))
 #else
   #define VIXL_FALLTHROUGH() do {} while (0)
 #endif
-- 
2.11.0

