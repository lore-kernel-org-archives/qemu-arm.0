Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2304940wrq;
        Thu, 21 Jun 2018 11:03:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK3H3+wEi716DAC4gqZ/H2WSOtpJTV/bKEf8Nz0kcUBTPHjTEkJup7JSnlxLvbis/7sj12D
X-Received: by 2002:a37:8c87:: with SMTP id o129-v6mr23239746qkd.0.1529604238535;
        Thu, 21 Jun 2018 11:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604238; cv=none;
        d=google.com; s=arc-20160816;
        b=hjsZUxPKTje27VwwCuquG4ao25knvqxi20Jj8TJjGxaBQRcAyImpUm4lv1IxDFnpYB
         H+AktZ8cBVg5swTvA5b+dekaaNHSHzWPHUDGxWIv13Y/lgvXiY4VU777bJRWZRlwotBA
         rsPgZ6WVp6M3lLyIO3wRqItwJ7qE48INJLc7orPSnrq0aYOYTtSalPm5Uv431R0IU/oq
         EEEuZmzyxi7gmSZ0TMNJJPnubRubQa1VF4sIFVkyFSiB/tc36ARqSDJUBLLY7sDRZBgD
         lRjtiSFEGtcdkUd92Ulb9KvkfmZazTyQAhBEKIbhHy4w8Pqoud2/VrRF+57NhpNzEm/Z
         09ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GAPGsT8/sI4OqRnGRqAHkaNZMK3odX7yf/jdm22lTc8=;
        b=hcEkvLZzQQKdcNU4HZQg1XQCyzWrQ60JONnlM13I9NmMND/LPXHuZTtRGzhP0kaFa3
         PRgsN/ClBMkkZOIfFZ8u7TTBFhkT8zsCK0r8N5c3JA2b38wCLaJ+bcumrVvBhbfkUIi+
         f+Awz3iQNfpCjWP/bTn3y4XnscdzSCYpvq2yn7V+ZcNkHgmL108XS2P8gY739bUbzI2G
         /F9Gyv3pTOX3HjiqYtMTqtKQEAbJSbAiRmX7mAiQIrVIrZYHS4kZbhNlhxZKHXx3nPgF
         Ah95ecrXfvltB5rQHyfqEXzGVuMs22NXPPGasqRzrtPFNZKPOxP9kTBsp5xz93k7fNNN
         UopQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dm3tCfBt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si4975347qvn.258.2018.06.21.11.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dm3tCfBt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3w5-0000zU-Vr
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uy-0000UC-H7
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uv-0006UY-FU
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:48 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uv-0006UM-As; Thu, 21 Jun 2018 14:02:45 -0400
Received: by mail-qt0-x244.google.com with SMTP id h5-v6so3641343qtm.13;
	Thu, 21 Jun 2018 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GAPGsT8/sI4OqRnGRqAHkaNZMK3odX7yf/jdm22lTc8=;
	b=Dm3tCfBtHTyM0DY4X8hUSTjuBvlQUhNH/OrYZ499BkNUApU9h3exwEKi0BKmmDkkE0
	4Z9sSbn+TBUZYUsOvlKotwcHLW/gtisSk8Y5LcdfMdYWCas04gBsvvXLaVAuw+bKlKJe
	ekSakc0SR7MVAbiQHL2IJF+aQy4V7ZfpEcx4SzmIfdr4jkk4GgTh5ndb8S601da+TEuI
	UIE6fmtn/JFUUwWuOhW6UuwouTQjx/iXMmZ0ZQ7cu/niq1wsby0mXChrZAGkvsCvqd0R
	7j4Nw9WFgnJ32rnI2K53TqKxVlq6MtK62iqnF1AwER9OC55dI99VeadIAvN9GAP22XP7
	mQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GAPGsT8/sI4OqRnGRqAHkaNZMK3odX7yf/jdm22lTc8=;
	b=uY750lAkNKUuuyXZr12BWu27NW5uf2Nwc9QKxAjJYJAa7MdZyoZzSToO925/22bzNG
	5S/zHzHKAsjuQQeOqyKCXDeT1FlIsve5ZrEhWDUWNsh5HnH6TVDG/48ofbIXMm7laUG/
	v+jydMrpPbXZYjbfu5GKNz+B6veh7hOzXa58RcPZ6nq8d20Zf1nLDXFqo3GhAnCpi0L9
	6vrkDUa7gkpeR1QQSEpXkmntBb5w1pl5yoyQgwcGwt3OLoTGH8gicsMXWb0I4kJb73Ym
	ugHC9/5roIRvaLXFuhWKXsR7sfI14XF8Ucik+3/YamPkJJMiF4b6dCaOPeyLNAaF4XUG
	UkEg==
X-Gm-Message-State: APt69E0hRWe9n/QKibkzAVrfIs1QXoWNrVS4nzYlcM6F0fpCS3bXE3Ca
	CP2zmGoBzUxhZNartiR9MRIEL+S1
X-Received: by 2002:a0c:84e6:: with SMTP id
	m93-v6mr23455263qva.227.1529604164526; 
	Thu, 21 Jun 2018 11:02:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:16 -0300
Message-Id: <20180621180224.8312-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH 03/11] hw/dma/omap_dma: Use
 qemu_log_mask(UNIMP) instead of printf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGA2rgEM2bkt

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/omap_dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index abd18c67ea..ab3a1b0451 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
@@ -1439,8 +1440,9 @@ static int omap_dma_sys_read(struct omap_dma_s *s, int offset,
     case 0x480:	/* DMA_PCh0_SR */
     case 0x482:	/* DMA_PCh1_SR */
     case 0x4c0:	/* DMA_PChD_SR_0 */
-        printf("%s: Physical Channel Status Registers not implemented.\n",
-               __func__);
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Physical Channel Status Registers not implemented\n",
+                      __func__);
         *ret = 0xff;
         break;
 
-- 
2.18.0.rc2

