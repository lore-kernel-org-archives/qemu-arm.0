Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1278666ejb;
        Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtaTPOvXGv5NmXEIik5OfnrTtcwGWJMjXrvoJ8heMX8+0RRXTiLQZKZhesgThOD9275HjJ5us7PUYzQoenogCB6cIFVNAV
X-Google-Smtp-Source: AGHT+IGMhOIhRkB2bGcul9pYUz/UnnU8lzCs4NjPnknegH1azt9DGtYV6El5N/9zu7wNgHyDBgPK
X-Received: by 2002:a05:620a:280a:b0:790:7957:df37 with SMTP id f10-20020a05620a280a00b007907957df37mr6071376qkp.47.1714043012038;
        Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043012; cv=none;
        d=google.com; s=arc-20160816;
        b=lc4BMjtCu8FY8zY78M5wzuQ+LYbcM6GDPtkuK2uGU/gBK/Bu651As+BOgRKXC1XHkH
         Yqm4QkQDkOf6xujRB16D8nG2lCqR5qDYLuo6BUR1JGMdhEizBF3MguyvCk/CZTZQ1GsL
         UHZ3+8rKfuSZ5PgVYdh5H5d3UtLILIZZPwQyVnDs15PSBggukgzQ1RRPsGn0RETqlePC
         Shq1JiXCYk3wybEnlFAkRG63vWbRTeXINnYUdeBIb8B//tu0mCxcM2Hv7yhgyz0fXmZy
         E9Pl0HxWmAz2nQZQKlCoVR5M5mhiFcnWQ70jCxiTJ5HbpXZk9T7QB+Wn1yTcitl0dz/v
         5VbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b/DaGtvlqhC1nG0WRRs696RzTAGLW5V48G1JnVnt1qc=;
        fh=SC1VWNlmOU6T4wZZeIRjIrDX7us2VF3hCRcA/+s+NF4=;
        b=G+gYPe57PXhPETS3mP6o+amtY7WMNwGES20vyWPPusgUqoaqtYE7v9qzUETaMA9Gy+
         tcM4HUonWBD85HCkESJVNaP3j/02dNfX4BOJ4vYFoUC2nFERSVuwfJ/BEaB6lv9danQ0
         e+7v+osg8P/iBg9r1dhoi+u6s71O7g5+c9UaZhuVWh1TbMx1B95JvZwt/yCQPdsnIXOZ
         bo7lJvzp2xkp6YZeAJL/1DO3sRX1RpCPorUZWQ2OR7unzddzAenvLxxV+KDWpgk9Mylw
         O3OxsBa1CCYpzbhLE6dULCGlHaqVv72Ji95jaW2xWA5gO4Wjzeh6Dg17r5qGzINWy34T
         l9KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPv3t9Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wi10-20020a05620a570a00b0078ec44f70bdsi16952618qkn.279.2024.04.25.04.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPv3t9Hq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwsJ-000866-HW; Thu, 25 Apr 2024 07:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzws5-0007s1-OM
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzws3-0008Er-JE
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41b5aed246dso1964235e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042950; x=1714647750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/DaGtvlqhC1nG0WRRs696RzTAGLW5V48G1JnVnt1qc=;
 b=HPv3t9Hqe967O72AVD+JU7j5FR6tOpNogcNXAnw2sQIF/F41YwSs6qm3jElWYaRUre
 CTHGO2l8ngaCQT8uk/OxFdA0vfnCY++KAOgVwaQ+gasAEDz87M+3Quf4BS13/I6rfz0D
 7E3zi+AYrx54SiLhObbb3cFdFAYRUPKPRTZsP9l7bM9j1EAA7BfWnkNGTjiW7Ztbef5c
 ulz4oNwAS5Ss0XXtFlM06M7iEJYIiF2J+b7z0pVefya961S4YVXVqO/7EMHFn+viLzwD
 1UrAM2+yEJelE9hcVzlLWxJoRhEyymQ0JtQtA49c9EAmvqmhCpoNI/gDS1Jv+8u8g7A9
 mQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042950; x=1714647750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/DaGtvlqhC1nG0WRRs696RzTAGLW5V48G1JnVnt1qc=;
 b=T68kGLJe8TxblPpvwTKFIb9+JZ3rToIv+E+G7agk1LCPBxrFKszjFEG0rD7zJYZuSd
 Do3NVoga2yqPzSA8Vad5hGsUBOjmOm6xu+Zqo+bYMu6BozQ/hm8D+dvb8n/ewY5PfyE4
 jPXQcaYojyCjvT5/IfqYzxNWmnpcYHFDP1AGLwsuTj8JNCN70QidSYMiz7+2jlt8DkUP
 vf9NjsjUyXj0V93gJ7NMJAQi23pi7FCpDW6wkTcrukxS7kleNBTuKF5Qs8WKZkFDIDj4
 cC3LySQNCRVUELoDqNmuQaAa1K3FLP4Yp3JKOuKBtIi7B26PPG/cBuK+W7Pzq0+rLuRL
 MEvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/zhZ29DeLEgnZBGOGv7FNvCXh4REFaLaJGxG2zmBwwBQ2YA86z1IXX2cej+hXiobiaqPYl88KZGlrKlORWWh5bKy6
X-Gm-Message-State: AOJu0YwL4bJrX0BCUeqSSGi7SUf/lzFyUE2R9l3fK/loePPmiuK2F0uL
 sZDc1NYx0/LfR5Jv9euTYnPPn0FlPYPcfd5HM/a2uzqb7HONBEfLf77WlbUbXRE=
X-Received: by 2002:a05:600c:4f03:b0:418:ed13:315e with SMTP id
 l3-20020a05600c4f0300b00418ed13315emr3752068wmq.2.1714042949561; 
 Thu, 25 Apr 2024 04:02:29 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b00418db9e4228sm27280045wmg.29.2024.04.25.04.02.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:02:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 05/22] hw/core: Remove check on NEED_CPU_H in tcg-cpu-ops.h
Date: Thu, 25 Apr 2024 13:01:38 +0200
Message-ID: <20240425110157.20328-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: ckpksIoq7bW3

Commit fd3f7d24d4 ("include/hw/core: Remove i386 conditional
on fake_user_interrupt") remove the need to check on NEED_CPU_H.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240321154838.95771-3-philmd@linaro.org>
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

