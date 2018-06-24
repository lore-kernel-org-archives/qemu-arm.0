Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2445782wrq;
        Sat, 23 Jun 2018 21:07:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcK4kTuuZ3H16yO+w7qiYPuHwV1p0nYannKB385tCPnvMyKtTzBJivHI25A9krupj6KAZFj
X-Received: by 2002:ac8:3ac5:: with SMTP id x63-v6mr6812193qte.345.1529813260439;
        Sat, 23 Jun 2018 21:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813260; cv=none;
        d=google.com; s=arc-20160816;
        b=gZ427AkL46FhAp5x1zLKMVctGvRRhecJbTPXWZtk7T7cGrqpJlPdlaXMupHl5EGBA5
         nTMzvEi6oVLEn62SwZYiwM/tYgRLv5DNkB6nj6LG7UNhKheaY4R9rKiTOXbXUv8VMaBj
         j/2+eB7nmUsHTMRMsZRuC8RLWeDbxABz9Tcy2vx0MxCMd5w9IHBvKQsWdALsNuoGD8xy
         E+rUF0KYF0gi9juIRUhrZUNq9Pq17kClj3QGiDbANAVgTxrrEl2i48yrjgJHr2kp0Htg
         3QzMQumZZW3lNUgK24UmWNWK6kr/DCPIUz6eAQXs3+/IDMoN3+Gh4UOlWxc2fsxKrDJc
         F0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BXZ3TltxLVi5ZCRN6XIGUwCl7iIEoMwsENofQGK5k44=;
        b=H+mVgPg4pizeWn+Wz1crFfXPZClTxT4V7nBv35SvF8YEmZpgh09Y7i8MJmCM/6J/Td
         9IP1ZlCygl6/Ixkf25kkzxB1APd8nhkHwm69mFKtqKU4kmshC4Tg6u2zuRimUh9j1DFg
         DHev6wsF9aKBcGgNREhXeSOJHihfANHDT8LJ92rfMTgRW0hDHdPPH8fmTlaVzX8LGQes
         N6AUH+RabSSZszcXm3D4ofgr0IQ1fg6VWAXVkecSWbuImyBlRa5Rr7NSENM0skZ4fMt4
         FtybyT8foXFgPxioc0exnnDEhMwFzh2ndoqtCqzUY+0DQS/YiS9+sG94VgHMGlGmaF63
         6gSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UPKsU0Yt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h10-v6si407065qkj.300.2018.06.23.21.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UPKsU0Yt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwJP-0004Yz-QX
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:07:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIM-0003lJ-EH
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIL-0003lA-HG
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:34 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIG-0003hF-FV; Sun, 24 Jun 2018 00:06:28 -0400
Received: by mail-qk0-x244.google.com with SMTP id b66-v6so348412qkj.1;
	Sat, 23 Jun 2018 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BXZ3TltxLVi5ZCRN6XIGUwCl7iIEoMwsENofQGK5k44=;
	b=UPKsU0YtaS2DkihuPbLpkfFWJ4rPwMuMw3k1g69eiwbCmb16JtsPu2szWtneWOcvcp
	vGhsD9SusZaXpo9byh0X0TolBWEsKID6uJDlKER1QAbPOjNbzSjo759xE0gtg+k+VjIU
	qIbszbsWNEKrzthVPrfGv6b2u+KDMadvos/A3czl1Gm8G5dkciNXtuyJny3mCVck8T6x
	qQ09eu3IZ3QUmQWnpM8hjscsX2UBDLUpmA71fTtgfbSO+ZxIZMRdHonoBULYhaq4RqM3
	+wRF8jU69EnJrtuyAX8kaAf3KQ+OMTbXxi8nrkVixZStZUTAgx6tSoa6djlHM9yy8OqV
	9SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BXZ3TltxLVi5ZCRN6XIGUwCl7iIEoMwsENofQGK5k44=;
	b=te1NsdSzVx6mLSefMjqtMYKC9CQAwB9/g73nDf9wM40OehFfR2oKromEDXy6HE1Hw2
	t0exm3WQJe0/TvNVr7LQxOFr5ajw+/PaYRuTCgeOSu63Qq6HL83rHYgmI17geP2XSmc7
	3P5pjiSF4r8wcp7qGhzjoIIg19hrDOAVcdwlT7GO3MxkD2tG29WswVWPN8gf2yCogtSb
	NM7Rai3IFV/88orzYvI2sxB0d/MwTUycKvrqB7BWXb5MnLoxME7ZGQGvDKRvJq3J1U49
	KSSODpYFUlNZhtEusEoTTQp9vibVwUqCEKSkpYrfGEZ/FrxNhA7CyP00fdCIZ1P96+AU
	JOcw==
X-Gm-Message-State: APt69E2Y9TeQ633pE3Eo7NKBo+RdvoKsh5OS2Oop5OH8Lr/PeWWoEUjY
	7mF9uX/0lK2dbcATfmwa58g=
X-Received: by 2002:a37:9a95:: with SMTP id
	c143-v6mr6538756qke.378.1529813188026; 
	Sat, 23 Jun 2018 21:06:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:05:54 -0300
Message-Id: <20180624040609.17572-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v3 01/16] hw/input/pckbd: Use
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
X-TUID: Z8ldG29uCFNz

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f33e3fc63d..07c8801387 100644
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
+                      "unsupported keyboard cmd=0x%02" PRIx64 "\n", val);
         break;
     }
 }
-- 
2.18.0

