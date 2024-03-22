Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1285713ejv;
        Fri, 22 Mar 2024 09:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyf7dnnvMXnAnvsxPwCz2ZugK+JSSX+CnW6Uq1eZsa5lTGmGnum/ey9xN0qnZn+MRMi+RDYbi+mj6WU869wcC+5aEUkY4B
X-Received: by 2002:a2e:a209:0:b0:2d6:9178:894 with SMTP id h9-20020a2ea209000000b002d691780894mr1906491ljm.39.1711124096060;
        Fri, 22 Mar 2024 09:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711124096; cv=none;
        d=google.com; s=arc-20160816;
        b=O1ueaXr2Jm8NZThS/TeC6cfwsfJYj40Rdx7LBLu95AX06O50Gg1Av2iAn71LWknYYT
         xF5tiKDJiRmv6b0mN9Bf/uM1LhZgxNUAHNMF6S9M2WXgGVcsBv92oSAZbGn5FvcJgVqD
         CGIl5zuJ45PXsIRKNWTdtMVxxAh47W2FK28yyvP7U83uCAov37XiukFPAnDs8fH+sfaS
         ZdiW1Z2iFr5hugOOXS6fv0s7rBeZz1YprkbkQQUqwwSfw/2JJCcIaI2tGvoX/SziSRkA
         Y537Op2fEPNOgvW1l+yO2gxfGIhlBGyv5LsUDvhytTJUPhzpE+qMTtnlPmvwqoZF21Cj
         r/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nWERvWbaYA8U7fTdf/uiT9QJ6qMAGAYtIIOsHDWn7CE=;
        fh=ai813Cr+8VfkiJJewuHGiSiDwHrmossB8nCDAYAmCsE=;
        b=lpv17kMDFs4odwcdazPf7mz8e2tYCTD+d8PW6I8STIs8K6QdyaRaXDQJLKvNRA0Lsh
         QsodbdLBVevdurBp+I9zGb7/mEwAoNiajsMBeAT3eGdOsbHUXzynqI6qW/Hs2Ux2Dacs
         Utl6g7DKjl9zelOjrAonCyGS/oDphDe5mzHv+otNYPMll76H4ng4pO7KELGiw0Hg+pCS
         WzkkUkmiWuIPPmula42hXyCVOZV2wronkEuTPwNlgZa+LyJU6vyCBSheuJ7nEPvw6A5p
         8D+lD/ApBjeBwozUgYTv3nO8vP6J9w6JYfBKDLu4BbMq+0LGyCxl8Zr9KcbAAzSyhxr6
         hc/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kv+JLFvG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a05651c020800b002d6c0068442sor30106ljn.0.2024.03.22.09.14.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Mar 2024 09:14:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kv+JLFvG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711124095; x=1711728895; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWERvWbaYA8U7fTdf/uiT9QJ6qMAGAYtIIOsHDWn7CE=;
        b=kv+JLFvGQWmmPC7EZpDZJjrIqWIkGbS2mN9TIhgvyco2lnYuWe0AK0K54DOSNbwjjB
         sQOQ7w/qyhXoUn9GBxADs+/EXNyutBxxoisCWvrWTJ1mJY25CsQ5crG8sfAfSgUCXIHP
         TJArXQA/kVCqERauTLADApsgWUsWDihnANDRqt6AP4EdxsM5qFSQ3lIqfkX02jzsh5rs
         ASJWfb4ZOEJat3U3zGZmFGg8lxOMnbwwycvRCo6KGb/XB8sl8XSmLcMd4nN6SiZGPQX8
         T4oeRmKJt528UpqHt774Kb6AKXoBCph/m2YK3HXY1FE9Qmya78Y5Aob1tF9qFBIM2Fjo
         pwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711124095; x=1711728895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWERvWbaYA8U7fTdf/uiT9QJ6qMAGAYtIIOsHDWn7CE=;
        b=de+YIeBx/AToLILmS/ZSW13ghBBun2y7VgQAyL8fJB2WFzqG/y4TJOYprcpsLg5EWi
         nbuR9cC7r2/A/vFMq83m6nSXL3qEiJcHK+HPh445Y5j6l8PiXp8b1fKwCYmljMDej6vN
         pKuvMntRAgfhTg8kT4vR3AaGx6C6z4aZITMg1GRuuB5VSibehN7aSmPQeINPEvKg95xt
         oidIvWp/G0DgbGpDrUJ3/XyOoNcwxDkMh5HhokNzuJMgsvkVzHPhg54UJeHIEQsBgmEd
         uJJ59S7Xniv5KZvWqGXXL1T0rfp+YAma8J/SeIQ6mDx82CdLl+SNgvp240wVCbM4l6+1
         buhw==
X-Forwarded-Encrypted: i=1; AJvYcCVk03y94UXRgvhE/dfne/Cwc054AfrsBLCw7FJ3buSZenjgsxcVpeB241w+3SGhdAX9EQqfmHq4NIp70Goo63I9B4e46CjV
X-Gm-Message-State: AOJu0YywDbZpBUGg5G8PjFNmqeQF/VVYFzrHRk19+9f0BiUcL71Qd8w0
	TYTDrRRTFbCtAtDYXVQnv5tQ4VHBVaXdUlBfPjh6VA8WzvD5MOh1cWX9DbOeFIU69g==
X-Google-Smtp-Source: AGHT+IGFKaVbKf31VATWjTGdq0ZObqLxjTDJ8xODl4fNGzZ922tI8v36pANqcGwSv9NcRuux+xfNmw==
X-Received: by 2002:a2e:97c7:0:b0:2d4:25df:b8eb with SMTP id m7-20020a2e97c7000000b002d425dfb8ebmr2410707ljj.41.1711124095391;
        Fri, 22 Mar 2024 09:14:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.178.251])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b004147cfe50e2sm1824710wmb.2.2024.03.22.09.14.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 Mar 2024 09:14:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 v2 2/3] hw/core: Remove check on NEED_CPU_H in tcg-cpu-ops.h
Date: Fri, 22 Mar 2024 17:14:38 +0100
Message-ID: <20240322161439.6448-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240322161439.6448-1-philmd@linaro.org>
References: <20240322161439.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dwvSpVdRoJNM

Commit fd3f7d24d4 ("include/hw/core: Remove i386 conditional
on fake_user_interrupt") remove the need to check on NEED_CPU_H.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index bf8ff8e3ee..dc1f16a977 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -49,7 +49,6 @@ struct TCGCPUOps {
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
-#ifdef NEED_CPU_H
 #ifdef CONFIG_USER_ONLY
     /**
      * @fake_user_interrupt: Callback for 'fake exception' handling.
@@ -174,8 +173,6 @@ struct TCGCPUOps {
      */
     bool (*need_replay_interrupt)(int interrupt_request);
 #endif /* !CONFIG_USER_ONLY */
-#endif /* NEED_CPU_H */
-
 };
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.41.0
