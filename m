Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2500016lfo;
        Tue, 8 Mar 2022 09:04:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpkm6P/Z4Y9I9+V6/Ps/xD7AEVNgRs8+PxMBcAZ4ENV32uk03QorXgkvm384a9yXva1EYL
X-Received: by 2002:a37:5385:0:b0:607:7ded:7333 with SMTP id h127-20020a375385000000b006077ded7333mr10925408qkb.556.1646759073476;
        Tue, 08 Mar 2022 09:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646759073; cv=none;
        d=google.com; s=arc-20160816;
        b=OrSoo+3M0/Ey7FZVdE9sXGLLzZuokJv7skebFtBrEfWG5PJ2W/8+dA/zRtFkVTfixZ
         g5pQ2pvlckY+p6sOMekhEUHS850eq21f5b83X5o6VUeHhpsf/romSmya6uC/nuDz3LBs
         s6lZTqDQRNvYjvLhaiNyKTaymOmRU4Kk6/o4j6Qtham/VSdshITHCjxL2pU5NrNywSFS
         bxgd6tHT/GPn6Cdqywcg2dWmBijr5kL9CFgl22mcJ9NleToPvLPT21lOJ8idzDjKKSQ/
         Tdoxf3eabycKR2V5E8zXyfPQlLetGxTpHAZpS7g3BsSugOjeEVaUYNwQ4zzufKoIzd1y
         TV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FQ3bZOAtaAQt4v/qBsDw+SKfySywZ+qLIDF4n3fssZ4=;
        b=sh9vJg/pULpCzz/WlqjxQ2vJFh3dZI7MRiqSTbk67Dgjeg6kIsTotznCNR+xQYC0Oq
         4znsH6xR9JRDEV2RO9xMI3pd915DWtKmCfuEBwXBZS1wZmf5LzidT/T5o9/VTJSy96nj
         pcJzC/SdxTrFTkxl0hE7iGfEWbP9s+J4QS2J7cgdBc4ckk8OQzJpUCc0HVdk4Hq6a+uF
         FkSVQanp3M4mAQo3tytiphs5HZtatFx4xIkBp3/Zr2+3QtiSf3jjF6N5AG48uNvDFVWZ
         8ZhDgNei1ta3aL53SLXS0Vaw9DLuvB8lxYMaZ3oyV7wkSXCLMUXMMBO7qwf3wTwaCmj8
         mgyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=woWaTLxZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a67b84d000000b0032063885724si1266956vsh.44.2022.03.08.09.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 09:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=woWaTLxZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRdGC-0004Be-Qt
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 12:04:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRdEr-0003Iv-4g
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:03:09 -0500
Received: from [2a00:1450:4864:20::435] (port=38502
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRdEp-0006OT-BB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:03:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id t11so29582665wrm.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQ3bZOAtaAQt4v/qBsDw+SKfySywZ+qLIDF4n3fssZ4=;
 b=woWaTLxZ+Dvd+fgXpH2FSZDTHCflvJwJ+tpSBru3pn5WQv+cm69LNKL/csGB0PwBvL
 vu4ZMHMnDHqrHfgZLeV0uPWwcBJ5PNWaoGG00HmXG2NH31B/y2wnY98aDJzr/XCpGRkH
 hRsYWPH5Lsqvg83OP7W8Ghj9MwLPAqW8pVvm52JNOjYiNgRVrOaC6SvwzFf3B32amuSR
 gIRm3kbssN8Oiwu7in0o+EO5TQCRg1M1xyeaJt+nI+OeECABrdtgWxmcedmsi6DJ97qV
 G3yYrrG/knSnLYsl3MNYOFpq+tnM2qQytzV0USqReAX0Nw0ZZaLsLwiosVUP4cqMD028
 u3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQ3bZOAtaAQt4v/qBsDw+SKfySywZ+qLIDF4n3fssZ4=;
 b=iuKbrKdaut5t1rqqxzVvIo2eHWcfFizO1yeFTa8VWXJ58SDi3ohQ3pRxdaZo+L7T5n
 HYrLEMqOaL3pwUhcKQWttY/bAEYK2qtLy8+Aeu/Ru/bPg/20dJPf4DpYcYnXOvVYYN5a
 Qov/lJh1wdOFuGDUnf71bEfaJThIB82obKsF6b5+/mo57QkPq9sgeF5o2CMBG/r3db7s
 lF1abGjMBaWvNS0Ib+HM6U81qYMD7pBLSXHZey/pYcyd9Cj9b/CS2b3J3vtlVqt10pfU
 z3SSc/Hn3JkIbP95WETOBPY5dkbF6WzhYRHqgL2dp1TDzqL7ML3LTcs1goDiAGvY511n
 1voA==
X-Gm-Message-State: AOAM532ECZl64Otngh9qkA/E6gIFv+jnYSk3FMkHhH2UE3qk4HXzjE7a
 1bDmyrnjfjoCQlOCwf3SxIxRAg==
X-Received: by 2002:a5d:4251:0:b0:203:7346:7f8b with SMTP id
 s17-20020a5d4251000000b0020373467f8bmr1381987wrr.91.1646758985835; 
 Tue, 08 Mar 2022 09:03:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a7bc40d000000b00381890032dfsm2721086wmi.1.2022.03.08.09.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 09:03:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/npcm7xx_clk: Don't leak string in
 npcm7xx_clk_sel_init()
Date: Tue,  8 Mar 2022 17:03:02 +0000
Message-Id: <20220308170302.2582820-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SfQSKYHMA4HG

In npcm7xx_clk_sel_init() we allocate a string with g_strdup_printf().
Use g_autofree so we free it rather than leaking it.

(Detected with the clang leak sanitizer.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/npcm7xx_clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 0b61070c52f..bc2b879feb5 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -612,8 +612,8 @@ static void npcm7xx_clk_sel_init(Object *obj)
     NPCM7xxClockSELState *sel = NPCM7XX_CLOCK_SEL(obj);
 
     for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
-        sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
-                g_strdup_printf("clock-in[%d]", i),
+        g_autofree char *s = g_strdup_printf("clock-in[%d]", i);
+        sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel), s,
                 npcm7xx_clk_update_sel_cb, sel, ClockUpdate);
     }
     sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
-- 
2.25.1

