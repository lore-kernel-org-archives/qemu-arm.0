Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp852720wrq;
        Fri, 22 Jun 2018 06:46:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdN4UvzFgiBulz8hLqIGwvBLuJBrbKDncw5ITxT4wtqg9B8hGrwA8XJr4mx9PbfaNPxzM9z
X-Received: by 2002:a0c:f149:: with SMTP id y9-v6mr1416905qvl.111.1529675198018;
        Fri, 22 Jun 2018 06:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675198; cv=none;
        d=google.com; s=arc-20160816;
        b=hN9LWWhETF6tU8ZMr4UHxTaWCdX+f/tCcaO1cSSKgeG+6S2pIYntlvL/hMPMxz6gfT
         U+CX6rk/vx5kxJLpZ4DtXDjH9baRweCjHnqoSnZaMN8UTkh8HOIaZm8kyXD/Pds1R/QL
         sgGgMcNVqykdvJG+fzhFmPiEoiY1nXh4I1ZMuPwTNUCmzdQyhDWY5D7fX1iJ91YW+4uV
         cafuQaz1sOkHSeCg5IC6EBYhHTa44KsUpFM32K041jDiJat7KV+XaLlAqwxf0nFRmTdt
         zWHRoCx0ZotpOYSuFSYM4rbp4iHSiMi2qsm1QimTIJ1ekhyZHXOu4Bg97BCkVSIgLU8l
         fVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=x5A9yyNDN4c6vjUK92tDsD+YIh1STXvsuJSarWOK7Ww=;
        b=TzoVxaht/N8cc+gHEy9P0HnN5AMQ55w2MoClbFgc972b4kq6YhA+GY6dWKjQfk8+/e
         6j5OtZbZXMmDY/mAomqUzTCM8Pmbu6lZ4UgCpZtZCwEbUeCbo83gn/iYOsLNSz61drEr
         5wCyaP3n0hBIQ/Vwm7Akrab31M0EaPdXcA5Cm0mCFSSQVeeaeyO0YkkZbX/Ma0vE55nt
         oy9wDD/vbCUJDJTJ4eq3yYYu75BramF2XypJtyEFo9bxBmEuDDVRx7ottgQHq7dcQhz9
         C4VLib/FxVzySYEJof/yDPGd7jNvs8ENr231848VMJZiPW42gtp2XLRFyqL+oMdVCHnE
         92tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a7m1IoRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19-v6si3977780qkl.205.2018.06.22.06.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a7m1IoRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMOb-0002PI-7C
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ3-0005uN-HS
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ2-0002zP-Om
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:40:53 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMIy-0002s9-1U; Fri, 22 Jun 2018 09:40:48 -0400
Received: by mail-qt0-x242.google.com with SMTP id i18-v6so5893129qtp.12;
	Fri, 22 Jun 2018 06:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x5A9yyNDN4c6vjUK92tDsD+YIh1STXvsuJSarWOK7Ww=;
	b=a7m1IoRjzjo8UA5Rc+0/vgiuA2/tKtHyiM7PbLZjOaI04hfqO5blmc3BsqYC+K4gPc
	NKV3ljaZINrDc9P35f8Eub9Afc/T0rTzp/CZ6Bu3y+IMaA0rMfaSXyDHe0iUGT8GwfoF
	oVsGQBEwTdfiueWiaFbAn1B3JIOJvRAjF7pKzGBBXuy8IDQpDOQxMWritBJ5+BAV/3Ne
	ZwSElchdLklLabJ23P0kkFoBjcxYVrlIRs6evMIoGNB1UB9qXxvLmC22XvTLy/xXmpwv
	6rJgG8EfGk3BrQlm+EFkFwiFW8Ml91MujJ+I1uS3uEIFAVdEt2LP3eYiEV2s05UpcWKv
	m7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=x5A9yyNDN4c6vjUK92tDsD+YIh1STXvsuJSarWOK7Ww=;
	b=MRheI4v/NhQh5NDbkv4nQ4ua7ERwLbVWWdptLRbCDECfELYPN38PCdlEHaSNssYKGj
	K3uu9fnvXXw5x9U4S8Uqt5KNDRWgSZCeWfm0OQCDe4UrepWZ0bizSEvhZI+gQH4i4gq8
	dCeqTlXVmNrMyvyHuFlGpartK6mM2royArci7GUoG7iQK48Q0mNgG/Vsa0QkYyn8jKBg
	lsg/mbjXY0/Dzu66gZqNR6kYkl8HtRzvKzPyexZUc3wEBuNjxUuySHcLZwQyrwdgIyG8
	iowZhCa8LPKkFaAosTr+JuEqeJtLUV7yDcGO2MXHSmvvzDj8xKWtAHcmTlmDKjb0boRg
	5gBg==
X-Gm-Message-State: APt69E3Yg8iQtgBFnDMAy/G5AX2JL9Kuz2axpswDb87jSczGl8FBnjJI
	TkTU0u/CcDoXSeWNRrwocks=
X-Received: by 2002:a0c:f54d:: with SMTP id
	p13-v6mr1403848qvm.149.1529674847431; 
	Fri, 22 Jun 2018 06:40:47 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:23 -0300
Message-Id: <20180622134036.23182-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 01/14] hw/input/pckbd: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6/EZMhK/bX3v

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f33e3fc63d..26aeac2326 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
 #include "hw/i386/pc.h"
@@ -308,7 +309,8 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         /* ignore that */
         break;
     default:
-        fprintf(stderr, "qemu: unsupported keyboard cmd=0x%02x\n", (int)val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "unsupported keyboard cmd=0x%02lx\n", val);
         break;
     }
 }
-- 
2.18.0.rc2

