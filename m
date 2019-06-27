Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695704wru;
        Thu, 27 Jun 2019 13:30:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYzvcFQaDlG2HxGLgLZrMJrX7W4CNlshWLVVWojxfLhmCd8EShYRQX9lGnFG4IBdLfO1b7
X-Received: by 2002:ac8:3098:: with SMTP id v24mr4765524qta.47.1561667431234;
        Thu, 27 Jun 2019 13:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667431; cv=none;
        d=google.com; s=arc-20160816;
        b=oKTWZ4tUKTgBSB6yPjy04x+2x/XY7OAXU2oC54GAAflbOkPDbUHEJaZAZjmPDtoR22
         CKbnfWogZTB3rH+TDJ5gorqc3RVtaOFgSNtKCqpeQFA56dS9kBgDZ69hnBgo4O1qfzDy
         n8H0kI+gnr4UEoB5FiEPMjhEPDEgi2BQk9wcQ+KIJceY1DZ1Bdx5ntUW6QUjUpuOAvlD
         7Ut2dbPs/7vEjGeWzu+dDbKfgdCQex2PJHhtx6B/826xnhUgHhNr8Pe8+M7MPbxKwyks
         /4QUAk8YifMf0SvQ1+vJVYnv7Pows2bVDStdjT7apzgYlxUl+o+qWmMbQKJqHp8Wozxb
         RKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MrwoaPNgabZvxy4uLaW+njcjQLB9Z9W3gyUTrIRZaB8=;
        b=Z7kv3DkEBAQDcbUQMFDWe3qc4a/6As5nMgYN5SmpkH/vE8qTjGuOnHZifiO2Q23fye
         pdnlRSJHFSkrDOdrc97U+5zCLkoifl/13CURUIe1sPGsOWRm4/mmoBmqI5loeRwsrefh
         U2H9rmm0xp6GXSLj6RzPLDHDs51gLZYJd/IrORxwwEHD4snJ4eFK++GiCErDkKJoaN8l
         ZTnrFje3W3OGZpRwh9+0CtKMxFE0wdT3z9AAxqJ2oX/fj/jcKnEsfmeysx4cgz38RyOC
         EAi7MVQKEzlKItleNM07lxa8uTevfUv/N2pyHyCCbZmDFikEr8Pfnss+OGMXwWaiLiGx
         sM6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 127si156099qkm.184.2019.06.27.13.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 415853082AED;
	Thu, 27 Jun 2019 20:30:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1071A600CC;
	Thu, 27 Jun 2019 20:30:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 22/28] hw/block/pflash_cfi02: Fix reset command not ignored during erase
Date: Thu, 27 Jun 2019 22:27:13 +0200
Message-Id: <20190627202719.17739-23-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 20:30:30 +0000 (UTC)
X-TUID: 5v2mxtNYFAod

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

When the flash device is performing a chip erase, all commands are
ignored. When it is performing a sector erase, only the erase suspend
command is valid, which is currently not supported.

In particular, the reset command should not cause the device to reset to
read array mode while programming is on going.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-8-stephen.checkoway@oberlin.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 13f76fa71d..39daa95833 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -311,7 +311,8 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0) {
-        if (cmd == 0xF0) {
+        /* Reset does nothing during chip erase and sector erase. */
+        if (cmd == 0xF0 && pfl->cmd != 0x10 && pfl->cmd != 0x30) {
             if (pfl->wcycle == WCYCLE_AUTOSELECT_CFI) {
                 /* Return to autoselect mode. */
                 pfl->wcycle = 3;
-- 
2.20.1
