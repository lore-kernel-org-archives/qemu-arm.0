Received: by 10.25.208.137 with SMTP id h131csp819710lfg;
        Fri, 29 Apr 2016 05:08:22 -0700 (PDT)
X-Received: by 10.28.59.133 with SMTP id i127mr3765360wma.24.1461931692592;
        Fri, 29 Apr 2016 05:08:12 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id th5si17074173wjc.89.2016.04.29.05.08.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x243.google.com with SMTP id w143so4515086wmw.3;
        Fri, 29 Apr 2016 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e9u2M5xrqqnukuPaXmN4zeocEKPjXuFuKmTwI/16FZY=;
        b=k3kO9veGn4NacxAauAvPryuaThPtdp35Ozvn3VK92b+uDnpd0uNHPWoasy76Ke9mV4
         tarhIK4NOyI/nNNL4Yvw1+k4CqluXvtpTOlIz5orc+sf2wTQILqc2stAVlAP77+LYfHU
         i2w/ZO+9569yt3a35aVaR5NPBepiKRZ3/JMcb61iBIT4GsZ8oRMCerfmGULfnd/woBKA
         PFQCGWUwpacVUjIN7mrd+vH6JqGQ5vhJUx8E9eiO1gYzN10bC7K384DaL8CtM8xZjCUD
         y1mbwU2ojaSraYlgoF8gluwvElBSp+y+otiRkhEEs6cNlcG7Dk3tV5TYzwQoPAbb7aDR
         GfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e9u2M5xrqqnukuPaXmN4zeocEKPjXuFuKmTwI/16FZY=;
        b=LryM6C11FQq5mqVLnDPczxgutm/l+zY1KxRUwB8iH9dYyaXlAPuI4d/42e1C0c+/Ey
         YoBI9xm74GLORlb6p9KDMpV87HxkrMeligoMLQAQuz2eB3ALtf+8/sI3wc/t3XaHvbMi
         4sj470nNYwAlsH+ZrFlB1wuJV17m6jwh1+0bF05oUSpvb+4ikA/5J829Ei0KbU42RII/
         KTt5Z2WbcRh/RN8ie4p9fwNJ9z4Mtln+5OqAqlZIxqjtDK+gDW55jPlz5c5CWuCkPuB5
         X5kHer/TcGv9w5DcWcPigfC7oeoKg0ck/NMpSXOvzHv2YWrLw/+Ht2HXrpZIpe4+NeDt
         iNkw==
X-Gm-Message-State: AOPr4FU5NrNXXlubxPqWSPB0kdqarKLDSwfDYZePbDw2XTlokUQNq2+mjFu6Eg2ZX/1EDg==
X-Received: by 10.28.25.67 with SMTP id 64mr3659147wmz.10.1461931692368;
        Fri, 29 Apr 2016 05:08:12 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id gt7sm14512412wjc.1.2016.04.29.05.08.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:11 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 5/7] target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
Date: Fri, 29 Apr 2016 14:08:02 +0200
Message-Id: <1461931684-1867-6-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: YeVfKa7M+/pp

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use extract32 instead of open coding the bit masking when decoding
is_signed and is_extended. This streamlines the decoding with some
of the other ldst variants.

No functional change.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index b13cff7..5c8dddb 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2128,8 +2128,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
             return;
         }
         is_store = (opc == 0);
-        is_signed = opc & (1<<1);
-        is_extended = (size < 3) && (opc & 1);
+        is_signed = extract32(opc, 1, 1);
+        is_extended = (size < 3) && extract32(opc, 0, 1);
     }
 
     switch (idx) {
-- 
2.5.0
