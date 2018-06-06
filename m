Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp962580wrq;
        Wed, 6 Jun 2018 08:27:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL5ed5WJACk9yd+FR1zL0kCVyZQIJw1WVVXZMVwAyu+6ais6w9CrpmRYmPh7XX3laHw0rNI
X-Received: by 2002:ac8:29f2:: with SMTP id 47-v6mr3220348qtt.239.1528298822952;
        Wed, 06 Jun 2018 08:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528298822; cv=none;
        d=google.com; s=arc-20160816;
        b=KzrleKchzmNDTckQXuC2Fj5Qy6BGN1tqrf+2XWTE6h7+W88EsRTW1UjBogrjJOkoUe
         GXMvgvwTGUWPu4Gc14CTAhv5j8m8BuEhkaPzXhxuyXIGw2LICOx/Vz75imhrMLF7R2Ws
         9o6TquJeGNKlbg+zzqlg013xpkNlk3TxQkE+T+crETXXYSKPJG5S4akMGR8XPjZsIYMd
         VZCFz0dz+vdcLXdpRyCDRkwC+cqlSMMfW2ggZPVUwznBd9WPfcQNqUjzKRa1hhUWjEY4
         /RqeRlz+OwZxQXQwS1Zq0FCSgrCvov73P/HJ5mxkPBz4Jy+x6mwaQGQ904Et/106FGTJ
         Di/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=H9Jx3ZsoCrenRU7skyz8KGCY7zDyhcjoy12Hh6vS5mo=;
        b=Oo1nepcbVKmAOguWNc0f8SIWYHjtZ3ysa5gDSxoPjakwddoBHiKNMhWoVliiYarhWl
         LkEyZmZVBcJSA7vn34aVnSPCCbIkowUK6RQUAK1fEJ1Mz2nUO3o0ZVdvueyv6tzhB85F
         aKo6Rtfgd/REZS5BrIbfjMxeZQXu6UxDQcGlh3ZBa5AqG2THGYUwezXOeA9USqeGkzVu
         QxbJ/kPzJkalxYu65f+fqfapKaMXJ2Y8FykslwehRWaIk/cENkKFIN38kBCe/hkHTkXR
         y4Tl+XJe8iT9EZQ+HQIq5vemI0wFaDePfmeGeQ1MK8rbpGwgo4pyG4/MzkLkTmSft/z9
         3cZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=opjsKYtz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10-v6si1370346qti.119.2018.06.06.08.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=opjsKYtz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQaL0-0000b3-BQ
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:27:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFv-0004Wk-Fb
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 11:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFu-0003an-Mg
	for qemu-devel@nongnu.org; Wed, 06 Jun 2018 11:21:47 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:35247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFu-0003aQ-Hw; Wed, 06 Jun 2018 11:21:46 -0400
Received: by mail-qk0-x235.google.com with SMTP id d130-v6so4187635qkc.2;
	Wed, 06 Jun 2018 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H9Jx3ZsoCrenRU7skyz8KGCY7zDyhcjoy12Hh6vS5mo=;
	b=opjsKYtzYAtET5SmaXPfsfxp1YHTOoQMzgEGYsCDdG91o55B9XPjU+6odd642wzOes
	fejafjb6o4mmibRlPLb2bsP6GDll7QYqCpoftAVQ9oCOvYEYOcTaKRJQDxlqk+UD++Nl
	HAVK/N1EgKbbFnOuyMzFJUbPjdEK6CiGD83EVuo6jZj17hzWBIQdlAYyH/MtDYUY0mYz
	dbTwa/JIPqLC/QO3PJ+prBtxgR6Ny6Tj2C1z0G/dyvXPLcbdseRJE3HogYsSeW4pzI1j
	Oe6XTLacZ0zyfhxzVlQeS7T5/rk/35VfJimP6e3xJoHDW0kfGl9WhECNfEj+NVeql07j
	wE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=H9Jx3ZsoCrenRU7skyz8KGCY7zDyhcjoy12Hh6vS5mo=;
	b=UviZrzuqrzfqsKsZg3+Y0n6k2HWP2c/FSWjqZzVMG7iMyStMRVkElPip/az2pzup68
	ztCPa4hLHsabBd+gkrABpsyrJemZWukRWOgRJwLWp8/BBis844wn0j3v78sLRphCK5Py
	bBD1ruxzIFRZsK7qq/FnHIp8kcud+cbA8BLuKh1ck/c8HpIobx2+5a9MLMLt7jPfI36D
	xkEli4Lze/khLbAlGNTR9H2Nlb1Q4xPfwuK2CDCm6c66Dpl7OX8NFuxpJLBLaxVd4Kl+
	lmwrIHc756ChP2EswIZcdS6WV5Sb4BcnqVMR01qELHTBDgchn90bwokVAvLC9UQx+KpR
	WD7w==
X-Gm-Message-State: APt69E17QqWGFJNezjwq3Z8JdOlyBTVp7vUdv5ceSugpaYdGKPgJRPGc
	mN8UEVES0Sr7xdjIszlHLYc=
X-Received: by 2002:a37:6294:: with SMTP id
	w142-v6mr2862311qkb.124.1528298505995; 
	Wed, 06 Jun 2018 08:21:45 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Date: Wed,  6 Jun 2018 12:21:19 -0300
Message-Id: <20180606152128.449-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-devel] [PATCH 02/11] hw/digic: Add trailing '\n' to
 qemu_log() calls
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Canon DIGIC" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LF6Qk9AZNQSR

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/digic-uart.c   | 4 ++--
 hw/timer/digic-timer.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index 6ebcb87a40..ccc75eaa4d 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -60,7 +60,7 @@ static uint64_t digic_uart_read(void *opaque, hwaddr addr,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-uart: read access to unknown register 0x"
-                      TARGET_FMT_plx, addr << 2);
+                      TARGET_FMT_plx "\n", addr << 2);
     }
 
     return ret;
@@ -98,7 +98,7 @@ static void digic_uart_write(void *opaque, hwaddr addr, uint64_t value,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-uart: write access to unknown register 0x"
-                      TARGET_FMT_plx, addr << 2);
+                      TARGET_FMT_plx "\n", addr << 2);
     }
 }
 
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index e1fcf73c3e..4d73077207 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -73,7 +73,7 @@ static uint64_t digic_timer_read(void *opaque, hwaddr offset, unsigned size)
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx, offset);
+                      TARGET_FMT_plx "\n", offset);
     }
 
     return ret;
@@ -109,7 +109,7 @@ static void digic_timer_write(void *opaque, hwaddr offset,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx, offset);
+                      TARGET_FMT_plx "\n", offset);
     }
 }
 
-- 
2.17.1

