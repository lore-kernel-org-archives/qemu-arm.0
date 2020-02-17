Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5072267lfp;
        Mon, 17 Feb 2020 05:30:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7kl9u1ZKWK8kXt4J8HjqCpDJd/yH/v9KNm4g1dZEqEo2pQ9pqdiyY11s69SzkvNsTeDwa
X-Received: by 2002:a0c:cd8e:: with SMTP id v14mr12518262qvm.182.1581946243262;
        Mon, 17 Feb 2020 05:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581946243; cv=none;
        d=google.com; s=arc-20160816;
        b=zARZn+XYZnF1sVlxbppDtI7K1a/iF7W4qYeCdXdUnJuuXpJaWzn/pw8+MfbpWsQIG6
         D5oRy/HkeG22akXP2t4hNcV24Re2Puzmy/ycexI4+MaYL/GxMrCAq+nhhCAd1gDO5cNO
         WViplIKtDjEBFiZZ8KGaBRoiJReHrvBKZ8W6tJOeA4UZFlUHR6s37nr/fN/rLkNpTp4I
         ophbWdswoZQ7cYpBx2hfkzqMdQ3oJXYqn+RuEZ5lLYMrvfytk0dJPITdQKLv3BQsvxwd
         gVnnbHABKmlbUslFfVHNKQLhTq9M74uZxiEhA7cAO+piSwCjgJLDccvR2hZRasHiyNQW
         +5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=X+VUpOyrP1K99lWKDQzsDNVHm6OjkjeFpNl83oieryk=;
        b=opCGXnlm0mFn855w4q7qA4v2Yv/AX0VQDUbaRCVKfJLnEF0pcHBWucX83lR76miEmE
         TY5MplH3mJVQNel7/iY8CvSIPSqEzIhtPG0y+T5uS9qALQgBL14cF+wmelG57uPxbqXp
         /GWppCCmsJckk6MG6txcgK8FOYEqj1Yt5zjI+Y9VjBDToPHwwetkpSQ87cw9SMAcvPLK
         Yqtc7ehV9azE2yK8Xoy45QicDQJVQy5ta5RW5xQIClf/eZGOyio/ElaY1aq+orfIt1eR
         Qe8rwfrntgCdrv5hIEsxfQ5KCDep7BieOdzzhSlji0HNNf4vbZx9j+38oPKs/LY/tfWI
         sB4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MbrhbUoM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si221751qtn.324.2020.02.17.05.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 05:30:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MbrhbUoM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3gTy-0007Bu-LK
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 08:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gSl-00069H-3a
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:29:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gSk-0001jL-6V
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 08:29:27 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3gSk-0001it-16; Mon, 17 Feb 2020 08:29:26 -0500
Received: by mail-wm1-x341.google.com with SMTP id a6so18488697wme.2;
 Mon, 17 Feb 2020 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+VUpOyrP1K99lWKDQzsDNVHm6OjkjeFpNl83oieryk=;
 b=MbrhbUoMSP03+fIiB0nFu8tl2W9xI4yB/SEQx4Gxnwi+gMjztbgMU6pAwhZPh3MKCS
 izaUyZrLKa2FOXxtp7e/6ixZArXZ52GQGoGSFIYhEVJwCvKS2ZkYK75BXp+GyH34Qcbj
 o75bbb4sVfSP2j0on/waKXKumt10pLzVSrZx5WiU1pJRlE0y7pUHPmQFi1xoRdwNxdjW
 PFD2Qq01vUtFxTpuPgKprQH463uhPAbF08n8ULOCKEMRdbUn+FoXPX7zaV9Au+eS70ZC
 u+gelUStzBdJ3tLO+LAmoJLFB0IVus3FVwJqsWvyTP+oF+/y179u2ouvdYDw1YBUz1Ta
 jBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X+VUpOyrP1K99lWKDQzsDNVHm6OjkjeFpNl83oieryk=;
 b=XiHYzztid578VG95Pwyl6/f2+f/rQma3DqC2XyoTEu8PURWt/QG6yR7eOtfVYTdhBG
 PBouNrJEqNmMQ6KyKVPRlGQqHLoaGQNLM/Lp1oejCV6air67QdQsTYXBr1wvIK3farYU
 Ouv6Y6vdXpNDih0OKYCzrcWd4KinwMAi1X+0BXCoDfexYHYN/7drp3G0NB/yGy31EEau
 t0kFEA+FRxJqvpvzSIxxUjDKkTXCnmZhEjmAspA3oAcbWCa6RbAkrixWAHAmMrA5lzvC
 He6gsYu04Fwl3SS3fY2fZHpmGRm4kaKdQxNEZRbIsPIOTw/rrMpyF/yg6DJ0UxTg/86v
 dygg==
X-Gm-Message-State: APjAAAW2CQQsmvjLdYzbpyVml+s7PwQ/a/zDOkuaMBLegyns1GlOD+St
 P69IuWEW+z0d7WvBB7chDv5PS8IsDGc=
X-Received: by 2002:a1c:a4c3:: with SMTP id n186mr22367859wme.25.1581946164404; 
 Mon, 17 Feb 2020 05:29:24 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm578945wmk.31.2020.02.17.05.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 05:29:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt
 Clear' register
Date: Mon, 17 Feb 2020 14:29:22 +0100
Message-Id: <20200217132922.24607-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yeOkyn68xjyc

Fix warning reported by Clang static code analyzer:

    CC      hw/misc/iotkit-secctl.o
  hw/misc/iotkit-secctl.c:343:9: warning: Value stored to 'value' is never read
          value &= 0x00f000f3;
          ^        ~~~~~~~~~~

Fixes: b3717c23e1c
Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: AND the register... (pm215)
v2: Corrected bitwise-not precedence (pm215)
---
 hw/misc/iotkit-secctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 609869821a..9fdb82056a 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -340,7 +340,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         qemu_set_irq(s->sec_resp_cfg, s->secrespcfg);
         break;
     case A_SECPPCINTCLR:
-        value &= 0x00f000f3;
+        s->secppcintstat &= ~(value & 0x00f000f3);
         foreach_ppc(s, iotkit_secctl_ppc_update_irq_clear);
         break;
     case A_SECPPCINTEN:
-- 
2.21.1

