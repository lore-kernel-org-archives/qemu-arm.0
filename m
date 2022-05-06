Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1979121lfj;
        Fri, 6 May 2022 11:10:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw96XWozqkbZXIzM9xOm5KT7SgT10qUF7l5EXF1b88PCRaLkGZs999U6mZdpjfu+hFAvkPv
X-Received: by 2002:a37:af07:0:b0:69f:bc3d:d428 with SMTP id y7-20020a37af07000000b0069fbc3dd428mr3198452qke.29.1651860605166;
        Fri, 06 May 2022 11:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860605; cv=none;
        d=google.com; s=arc-20160816;
        b=LuK5ti9ZDugr+S+ITQrLEHk+gT0SGt+gfkFAxg6/8q8ryaLltQzwZP9vId6sCA1PZi
         ocmRM4PjTqu54XEhL8MXZ8uyBZ4AYOJR8BHKLX8nbHvGDa4Hs8nVgbbolfJ05Mqy+z5p
         6G416W6BwO4qQG6cHyl/ts0f6G5pdz2hZb8wTDEnlujooYeIwVYS4NQ4jBt26pn9ZRN6
         zqNn2K4LD+LfqLfL7+nJ3YWi9b6AF+O4DIViP2XWGb6FO378fIVO8nebgT72MFGUS05p
         CUA3ICdhIoIZCoVAg0gA+1JMcdvyphLYlzG2PxnkF9lAwSvLdOTnsKsf/4Q4+xPpHrF/
         0iOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
        b=RSEyocR5a/wIfHCRLcWPAtAEwcpAf3AamyrYnEyFygJzD9r29+kjjxZi4RAXPMG89X
         Xy712YRV7H95jxGCOXXi79Nd6NyL/fRCAgCj1ZyK6BMp2LibkIYlYpTe4PSs8TTaQ6/o
         IeFUPegkwX0od3zitcsid6i7Z3Q1NYgX+qihJeaJ+hcts/S2OBe4luwigA3mb8lR3avc
         WXOZk/cmDUXTyjoVDgxuKINBVTpo3lKymm65qPqPVMK2ssmVXFtvNmWr44JvXlpQC+Lv
         BD4SVHCK0Ncgzk2L3aIqyMEd+tcCN+JOsYTVrJAjxPBUYFKCo75hhdo1Gc8xSKye0/K5
         hc+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuRChkff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de38-20020a05620a372600b0067e4be23a35si2980311qkb.634.2022.05.06.11.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuRChkff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Oy-0001H4-Je
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I7-0005Sl-3Q
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:59 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I5-0003rq-En
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:58 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so5426724oty.3
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=zuRChkffAAnJEbWXGmEPNva4T2icaZo3AiJflLEEAs7zu0rWzGERylXz3unj54Hqyi
 93WmOOc0cTi3kXMyiHT0rp1k5RkuwHdHNkzQ1hWoh697PBiMbcWJOTmdjdeOdxAbAWzz
 iSJNtlejJmGcFySg8EIpaDXrCo4NHwoyC6/ViQj/XXghENjBMIORR9+BA+u8PYu+dVX0
 bBkhoQzSmiw3nH70s5RENB7RLF77c4Te1RiRR6kQd3eOMJiWXR0L5o7UuMtqgpCouvs1
 IR9lU3G4R4gdAwlpW3fp5+TGh35+i60B6LLYagym+PF6rYnyWPEDgjv7rsxIZPy6Ukdu
 1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=AJZDpWY/5SmcvvAbkgmxETCV2h3y2QYc4y8/4NwbDJK1FxqLKIK/vWPI5DS6D89DH3
 aLqppxeF2tuc2Wcvt4VSngGwveWivcGBkKyThbuxhCItXsmlTzWV/zBMIx2JrIPFv7F4
 rVdzhqsvklNUrXW1H7fgKR9n1xboGPHOAHsipB2jXsWpkup9X8jZjtwgNIXD+o2Zfsd4
 wZyt2DlNUXGYLtggkxFyzQsgk9qRz+Kcm+ANxHYCFc0VrH5mV0qziT9ZvyHMVk+7ht6u
 Q4OpytusqLw7OmwMACrZ53lsUOa8Qkudk0N23JwUIMbnwCIgFOqH7FxWEwKiW7cnnSNF
 EU8g==
X-Gm-Message-State: AOAM533nUV/zR9j09ZA1MzpNXW9g5IK85aQlN4ErQf2cc5GMWaXL7KHN
 8+TqApVHXda1GxXOrpUyY4J7sA==
X-Received: by 2002:a05:6830:2f3:b0:605:f29f:502c with SMTP id
 r19-20020a05683002f300b00605f29f502cmr1461363ote.24.1651860176362; 
 Fri, 06 May 2022 11:02:56 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 07/24] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Fri,  6 May 2022 13:02:25 -0500
Message-Id: <20220506180242.216785-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: In+djf563ogI

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.34.1

