Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp54652lfm;
        Thu, 25 Jun 2020 20:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMFrolo6BF7rbPEcVM3qwMC5qdxomWn+fXAeWYCLWuk0mq9pNC7Qx/a/IfIXonyufFwyzX
X-Received: by 2002:a25:5094:: with SMTP id e142mr1762463ybb.30.1593143154259;
        Thu, 25 Jun 2020 20:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143154; cv=none;
        d=google.com; s=arc-20160816;
        b=f7IIsS680wMkn7+Uh9cwcdLoeVXsoodf2ObfGDOawIbJVuIsSAXyXdIF5YTW9GlN+2
         cZ5apmMBrtgtBNfsLDyNCd+A7Hl0JObKB9zHQmC7U2Z9ESMrJY80o33CTNpHwUdMRJXb
         ba1FGKIcYv3jitvk4cxpFLP3mLDUIOPI10oXa/4NByl5+YtD0uP9GxDkrucBzTXNRwRD
         IQWeBqcY/YUqfpHiEC0aM8c11qkauJpuosiKbGpM9m2FmQM4F6Hijct875IugbjOxpZo
         4NTIPt9msi9uGdIVsa8GVJ+7kb4gq4EmWZz29qEv5Q8YsPafvXeSsMHO6mFyCPADB6gr
         OALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8SXI3lbgZ0UAYQNgtyM7Qe9sZGMnhZE8cWfw/l5JLCg=;
        b=DHJgJLtaYoG9bVSb/XAlWT/lInHSoJCqPrnsjgHeGrnMCPOL1cghlPTb7TH99NEvRn
         JbVyRdTM6kw00LCwZ7OqDiY3l54QsDuUnXBEPJb5506PzCERfhWIGpHBzbmtlHbX+NqW
         M+vUNa/kuLzgsaoL6hYPucJ1tmxbNwNFf17BQP5732WrO0wmzblB9cQF/9H3697LJDuV
         tN56aDxvuPclANUo1rzjvZajboVPyMj4eRugceTWNXLRs1llwxp4t52T+hOwk1YQrGQJ
         jWT0qvHyu+5G8OqNbUp9jfqDh3Y8J0DvtMrYeyIVGrRkf5ZT+oPkNXoMR4MMnE5gapNm
         jNwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvnyuXDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si23620819ybk.196.2020.06.25.20.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvnyuXDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofJJ-0000dw-Jd
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6f-0001Yw-Sj
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:49 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6e-00029H-9h
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:49 -0400
Received: by mail-pf1-x441.google.com with SMTP id d66so4055547pfd.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8SXI3lbgZ0UAYQNgtyM7Qe9sZGMnhZE8cWfw/l5JLCg=;
 b=RvnyuXDpI+gKZktcyestmDB7I9NQqDabkurOrmxomrmouuZbHMaA5ocFxOB3UhHANY
 qNAQtKf9amHCQUuaZ1iuY39WZ5GlEpfOKRnsYbb0hm4wMiFqFPsJrdDqF59MVvBR18+D
 TfYy8Sv262IQ/ymkMugQIU9b7vubFzs0cUoeZl/cbbKbhazi0yP8VP/hwCzi75+EbsRq
 pvs4CFtW77f5CJgkqoItQPQqPQtqF732F/5yhhxnUcMOvr8ImxeONw7bf8ptAkqhR6Sd
 IefYuSnw5vcPSS/M97+IlkIah2w8Dfriatgqqn3pR5T7C8lLIaK10tR/ObKDBiFAmuJ8
 NIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8SXI3lbgZ0UAYQNgtyM7Qe9sZGMnhZE8cWfw/l5JLCg=;
 b=TJPeJPqxZ0HGxWrQmgGU6dd88i1ySgwVJUXi0xLf3oZ3NfqPepEKmbgVL9LhxvhRjw
 eed0lOPjN1wPP6rFTju2e4jgzq7748S1i+A0tDzk9evOOKxnzmkf4ANUeSozaKSvSK3Q
 ughTjy+nsMI2tCeGzsMM8KrUd6NPJTYz5zdN5QL/4QlSNikb0HkF7eqXfDe8qfA+tbYQ
 0UpKc8hozLsQDFA3ky1bs7sZlM+6X8sqDm5qKUwvE1AiSzqEaoO1DJZv/sbq1dURTp1N
 v6N7L44AqD4r8kh5iXySS2OOHNqkq/PcVFOK5vFndmKbFiJixbLc/bTdjNUHcJAqiO5B
 +ZcQ==
X-Gm-Message-State: AOAM533v9izqyg1zLc7tNvhQ7Sec8n6kXkzaqAs+bJglsuio9+u1/fmE
 mB9be/pV/xH5W6gaJyyIIoxXFw==
X-Received: by 2002:a65:6393:: with SMTP id h19mr911005pgv.278.1593142366938; 
 Thu, 25 Jun 2020 20:32:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 45/46] target/arm: Enable MTE
Date: Thu, 25 Jun 2020 20:31:43 -0700
Message-Id: <20200626033144.790098-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Ea1K7mHScN3

We now implement all of the components of MTE, without actually
supporting any tagged memory.  All MTE instructions will work,
trivially, so we can enable support.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Delay user-only cpu reset bits to the user-only patch set.
v9: Add some commentary (pmm)
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a0c1d8894b..a2f4733eed 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -654,6 +654,11 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        /*
+         * Begin with full support for MTE; will be downgraded to MTE=1
+         * during realize if the board provides no tag memory.
+         */
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1

