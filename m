Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5110318wrt;
        Sun, 20 Jan 2019 06:51:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7QjC6FFJARd9DUjaoVDBnEc2wBXso2IojWUsFK6jPZz0EjUfsz30BzoRVJ4nHGcHbQPfwa
X-Received: by 2002:adf:f703:: with SMTP id r3mr23743901wrp.93.1547995871650;
        Sun, 20 Jan 2019 06:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547995871; cv=none;
        d=google.com; s=arc-20160816;
        b=GCrahEivhkevavpvEhgvQgQcavboB1B9/ZttDOs98GZnAgnsMwCgMuK7rLyqogNyJf
         msofkcFZewGVQ0tjcbsvmoxGo6876ynt671ZEu4rHX0Pg/H5aFH93Ia9AnVSk/JuI0Mn
         Q/zsUpaOzJVIb894SBZ2hlUth+isBnfdu9g59AzIfjFy90pp486z4yoajfPSD4xyKfwI
         N5aDgTTwsHF0dN4NZP1kEzA6dIxJwSBKewyAPeLhljdixhUspJ9l6wvKVs0WAgdpDzlZ
         K+wWdyNTdGl3Wpn3Pl0J95/DOwzeri0Rw/3DzQlufwm5olAJVUiEMjOEJVlIrNC1aUyM
         BrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=N4nKt9Bud20mwkkhmKBDwXT4iofxplv4A1mcAPiVyTM=;
        b=uR48iyZOMQ9e74eXE4Ja9ca4wJiGgqNIk+c1yUi11j8fU1JQQb8UY3+N15VEADuLKt
         ccYN7p5KChwX+cJJq18A/8EZNzl9ZcBLFPdw3jvSRi9o8E8+d8SwT7QZzjidmH9JVuWJ
         ZiIFsOD+AcLX4wca0L0W2Ojov4+kq6+6yW8Ho+iI6Wp0zKHJXqnsWhLv3Y+DjbPir1hK
         /CXVjWypPlXxE3dhi46cYrQUw0Tw4kUpDRBU0pk1dR/OiwYuy2MIChp6ywErv2AJa0aL
         bDlaZNJiyMC+6KmcUFM1y2buGqMcTKFdGSKdwbofUokOcfS9ttq9OgWvTaySC1zCkcn7
         M1jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stacksmashing-net.20150623.gappssmtp.com header.s=20150623 header.b=0KxkvFeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m185si30951885wmd.125.2019.01.20.06.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Jan 2019 06:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stacksmashing-net.20150623.gappssmtp.com header.s=20150623 header.b=0KxkvFeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glERI-0001Fx-IK
	for alex.bennee@linaro.org; Sun, 20 Jan 2019 09:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.roth@leveldown.de>) id 1glEDJ-0003Xk-OE
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:36:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.roth@leveldown.de>) id 1glEDI-0003MI-FO
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:36:41 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <thomas.roth@leveldown.de>)
	id 1glEDI-0003EN-55
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:36:40 -0500
Received: by mail-oi1-x241.google.com with SMTP id a77so12608031oii.5
	for <qemu-arm@nongnu.org>; Sun, 20 Jan 2019 06:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stacksmashing-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=N4nKt9Bud20mwkkhmKBDwXT4iofxplv4A1mcAPiVyTM=;
	b=0KxkvFeE6QiOIYItEBo4FNSE1cKGFTjCueq7o86pLHkBvZfWTWHP21tCpfkR1uNm8G
	ZiOMPjj74cGla8wGQNQQlcUEK5NN4hic2TEbcTV/os6kwJmAhwYY/6sTW1I1bxtO6/pr
	91PqP/g/MMUS7wzDUK0TUd7CsuwxJQV5pGDa6GjaKdVeL6uV/wdyDzsvX2fFO8NvJlo3
	hkrP8tWIvyrLUS7u2aIGPrlT043Md2H+uNv093tR94iiRGR2NP+dk4RvC9K7sy96vG+U
	Z0Uc7PiYqpIpI8nDDpvL4UpE6tJD4Zas3/I0CtiHgLQ2gNwwH4Jv7Yb/Srbmvke9jV+3
	qy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=N4nKt9Bud20mwkkhmKBDwXT4iofxplv4A1mcAPiVyTM=;
	b=Spc2UoRu86OZgzYsf9ppD3QJl69DaeJNfn89DOxLPQJjsSY3MJ80AFtUcV0mKrsxfU
	HkA20BRyPz5OYlnUinpe9uoz/PXerULrXFytx6BU+jM/Lv1qVbJAmCYEeOZnTv3xDYHN
	sbXLfdFe0WqFAcarmBTni4qw90WbSyKUOevFdleaDIwQ1A3qp7wyqBGdtSqFDPVqISji
	Bx0FYFIgNBQDM6pv59Z5oYTgTmOQ0hU82Vbe1hbWFSR2FAgmx3wo91R7el0R4cQbWcRm
	pMqSXUSbuDp6y+lR84sqj69wcWbmHiLNkKFdOMcQ0e60RU01atey/4lcBx6BfN0Cdp02
	2FBw==
X-Gm-Message-State: AJcUukfr9f+w9spj3gZx2dK3HCzw8u6s4maT4Rj7XYuVINelg5Q/EjBN
	R6KAe5lPUSlMWrMBmDg5+5XqiO/qsG+qljqO/4DI7WWbyuc=
X-Received: by 2002:aca:4489:: with SMTP id r131mr3420003oia.296.1547994987930;
	Sun, 20 Jan 2019 06:36:27 -0800 (PST)
MIME-Version: 1.0
From: Thomas Roth <code@stacksmashing.net>
Date: Sun, 20 Jan 2019 15:36:16 +0100
Message-ID: <CAGGekkuc+-tvp5RJP7CM+Jy_hJF7eiRHZ96132sb=hPPCappKg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-Mailman-Approved-At: Sun, 20 Jan 2019 09:50:53 -0500
Subject: [Qemu-arm] [PATCH] target/arm: v8m: Ensure IDAU is respected if SAU
 is disabled
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jsogQgP6F1bs

The current behavior of v8m_security_lookup in helper.c only checks whether the
IDAU specifies a higher security if the SAU is enabled. If SAU.ALLNS is set to
1, this will lead to addresses being treated as non-secure, even though the
IDAU indicates that they must be secure.

This patch changes the behavior to also check the IDAU if the SAU is currently
disabled.

Signed-off-by: Thomas Roth <code@stacksmashing.net>
---
 target/arm/helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f00c141ef9..34fe7f21bf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10479,17 +10479,17 @@ static void v8m_security_lookup(CPUARMState
*env, uint32_t address,
                 }
             }
         }
+        break;
+    }

-        /* The IDAU will override the SAU lookup results if it specifies
-         * higher security than the SAU does.
-         */
-        if (!idau_ns) {
-            if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
-                sattrs->ns = false;
-                sattrs->nsc = idau_nsc;
-            }
+    /* The IDAU will override the SAU lookup results if it specifies
+     * higher security than the SAU does.
+     */
+    if (!idau_ns) {
+        if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
+            sattrs->ns = false;
+            sattrs->nsc = idau_nsc;
         }
-        break;
     }
 }

-- 
2.17.2
