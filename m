Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2619913njd;
        Tue, 1 Apr 2025 01:24:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9mqsY/bnwkurxyVNVjl3GoXX2Jhy+7015LUVI72lzJ2v7qDmnXHM6QBukbud9ilg6WhYoyMh5hgJn7A==@linaro.org
X-Google-Smtp-Source: AGHT+IG7DHEN35jQ4LmuhkZkMWHb8NhDL2GmEmES0EvN0trMwKkMLWcL5kbytUtc9Ypd+/OYDESq
X-Received: by 2002:a05:620a:248f:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c75bba9e38mr251110585a.18.1743495844081;
        Tue, 01 Apr 2025 01:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743495844; cv=none;
        d=google.com; s=arc-20240605;
        b=Q92oTIToTZbknY4/GqplNSZDPGyzpwLnZQrMu31u4bCpFBCvM96tqOWDVYIjkC0VY0
         tLBgUP6fwlY3lbwO/XnNF6v0RX6GVjJIaGKi045avPjo0B7VBbNWyWfDEHWxvubBFhvu
         rZjZaXPA7ODNjACMWZ8qDoEyKZeBFG4es9J1dTLHCVQLbxQe7yq35tyjPZ7n5QpS0U3L
         aWiuas6+Cw1fqU+Y7gVyK/mL9w1gYTOjrXWZg+cUFauqa5zeNYCSfT3PLs/XzRlz0Nj2
         ITkpGwIVMcvNel5oJBjgE959oiHbmeTZfQszhVrJSDkyDu++WiSmagqzKeMByyKdsc9i
         /Y1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ylIunMeCxHiz8JsEXS7LHxNFF61jnoLiN5fA8StwwDI=;
        fh=cL6z3S/MBWeYGMKM/NZUXXzTVwa8f5wEOcLKrYz0HX8=;
        b=Ag3F4wdeIb5IQ/Tu9ENExLCQMC+ft84yWIyuIix+5d52y85QhX3onZmmRBmLQ7LdNY
         hSQ9A6Wz279exQ69ooipsXq21mllg7MyhYnF9hTAAuKnXyrv8vuD+RCDc7Y/JjFt+OoX
         Hx3Zui1vXIYML936LoENWhgMwwEj1uis7jyqvoqbiLobYIXaUx4854X658t+ow89YOjf
         Zvxk+GaW9uAiWn+pzMmdYF7z/ofSMloOMwav9LYbmo1freQeZMFuxFY4evubzA47ZKs6
         Q6aVQEKc3MjztBvoMigGNwg+cXnOOIlq7TEviIWVBVqzXbGYOkEVSvpR2od3uQH8nwgi
         6uUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uro2/847";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f77b574asi843774385a.517.2025.04.01.01.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Apr 2025 01:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uro2/847";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzWuP-0006Zz-6Z; Tue, 01 Apr 2025 04:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzWuC-0006Vm-1R
 for qemu-arm@nongnu.org; Tue, 01 Apr 2025 04:23:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzWuA-0008JC-6F
 for qemu-arm@nongnu.org; Tue, 01 Apr 2025 04:23:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso23803375e9.3
 for <qemu-arm@nongnu.org>; Tue, 01 Apr 2025 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743495804; x=1744100604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ylIunMeCxHiz8JsEXS7LHxNFF61jnoLiN5fA8StwwDI=;
 b=uro2/847A7iG/nwR38DSfBhaFTw+dPD5e4dYqQ8xNLVNq//6K2XBVHNH809dFZRvaf
 REgx8oiGptakanwvB4gbEHwTMJT3A7q9msGXuYdF6V9SiZ5doJGneurU2uC8zYrbpOck
 bGUr7OhIu/5vFGAUGX7+6rkwP2QjFwDijwo1f1G3qoTsW8X4Zse8irZMqXqhqQ5lmWpF
 kJnv2258WA7TGkfblqjtvD05jWBir48Xx7Ch4i9W8q75laQ6bYaA7e5pv+CeQNLoATud
 Bjdb0TNdghek7ujBKr31mImWh7NitFjs9OBtFb/8aK6qM3xqXHcienGHP9xwjdWAESih
 szgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743495804; x=1744100604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ylIunMeCxHiz8JsEXS7LHxNFF61jnoLiN5fA8StwwDI=;
 b=tBI7CIH9ZLEPpWIHZvk+VJjV1v1rC1UcGMOFOunWoAEBvjz00ZAenYLrQsiRhXZPPp
 wR2fRGrZUjQSC+nIfMpYvBk2RuIbKUf9Hdp+CnLkjC0y1rQPJI7RhfjTpDTgjheJ/bMN
 cgNMSZNLLUCDcfpKEnZ3vm/zSAUU7hipJHUz3Gkf22X+4WuvhRuO43pJf+CEZzW/kUtp
 Hg//XoezlNxYXqrK2yuFjO7SyT5W5vrNmwXaTXDXCwBiP4zbeX7xZ679YHMyXPnnVBys
 dxvRweFLELDcBfapWp90cIvvMhZwSvBbP6cqLL4USGeGDwe/b2GI/TWwwxCDsk9LzMtx
 Oa/w==
X-Gm-Message-State: AOJu0YwTpeY67QvC1585WVtBz4ycXIB7aekYoFQFG4jcJ1pKAfvgFgNA
 KawWa3kWlLBHaobnvKwH3taClpYmjbSboeCKIYfDK0TmfO8FPAmoOcHAmNrcvtw=
X-Gm-Gg: ASbGncvWx9ebhm6NA50KoOaxhFKjPX4Uw1IMpfnDLLNC0dBSm9oHSZgzJTWjNcLKMst
 nge3rekS2EayufI41qe/vOMdBu6PUE8T+TQ677GzOyEra4Gv6vSB/RKKH4mxgrs9bjlGe24MV8G
 dXwx/jBr8aalf3L9+fBqqmUOZUNFSuuHnqBfN1AuFpH2wjgH4tSLRbJJb1l+i3m+AvzI4yVztWN
 BVmoxgHV8DGUfaDWEh3isCWkTc3+mmg3gwOYWn6wqQBNLvqLNhAtyN7j/RukvWpXnVXL4bPCpDk
 fdZSzu15S2lS17SxBMz4GPq6fZOcoUiCnl4PpFAB2qPsN5nldjRxzZtmv5tsOuJJjhyTIRDB/Ss
 Qv3qVGsJTmr7sVDTLfmyFMECjCokzIQ==
X-Received: by 2002:a05:600c:1c1c:b0:43c:fd72:f028 with SMTP id
 5b1f17b1804b1-43db62b5d7emr93832195e9.29.1743495803836; 
 Tue, 01 Apr 2025 01:23:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314b6dbsm194799905e9.36.2025.04.01.01.23.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Apr 2025 01:23:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/arm: Update comment around cpu_untagged_addr()
Date: Tue,  1 Apr 2025 10:23:22 +0200
Message-ID: <20250401082322.33283-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nPVGsIyag4LL

Since commit f9ba56a03c2 ("user: Introduce 'user/guest-host.h' header")
cpu_untagged_addr() is only needed in "user/guest-host.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1a0faed3ad..f679e515df3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3239,7 +3239,7 @@ extern const uint64_t pred_esz_masks[5];
  * linux syscall TIF_TAGGED_ADDR setting, not TBI in general.
  *
  * There should be a better place to put this, but we need this in
- * include/exec/cpu_ldst.h, and not some place linux-user specific.
+ * include/user/guest-host.h, and not some place linux-user specific.
  */
 static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
 {
-- 
2.47.1

