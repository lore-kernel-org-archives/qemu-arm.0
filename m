Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688618njb;
        Tue, 13 May 2025 10:48:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBj5uKEScxHEZp+/8KY3CYgpui41X0pUgUXiFxEgz4spIV3L/KLMnTFvajcVYqMc029PrRWHhLHT/xRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHM/+iaaDxfR64M/GLTxyyPBWSpmtJsj7+qUFNWjQ3msnPos9IxM6CA5+Ywfcwu5WuwlO+s
X-Received: by 2002:a05:620a:460b:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7cd2887821emr69528585a.45.1747158526652;
        Tue, 13 May 2025 10:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158526; cv=none;
        d=google.com; s=arc-20240605;
        b=ZD2Lt2R+C4yTZdDhQ5Q8kIo7+ybY/Kd4NcN+Hx09n3c+gNJ+5xQPXy3PDlzEmkkB8L
         n3oOr9WlF4aicrYTYH8ouELB4NdS6Lm7oSJvbqPHeZQuQcemcziIcQ9djg32h7+EtmPx
         FDihSU2swxLfMBJUNCWo8Duq2MEDhCHvpCDvl2JRpJCgT3Gcyf36wttCk3F0S6hptfhU
         5JYxVjKO8FuDh3KS5K/geSgUoQRc9QZMhrvVAleM8phqTwi82dmtI6FElwKXiQJT9EqO
         LrjkeTvLh6DVN/LZa8rh0kB4JtzKDwW0rWs/+yhLKcLp0qRifaYxcbvgSO9Ubr6YhYSS
         JScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fZ+iRFzlsz++4RFD9fl5KNYh6wELAyZ06jqDq2TXAd8=;
        fh=oAG6HIcuSPumOYs2ef0NYEkSLIm7D6VhhjfDQzOYEY4=;
        b=WwlXNSb6hskrHgWvmsyXSzT2qsJgrzJz1zVvI/B9rf8F2XQ+Ux3NTgQMtOqXo2Ra0T
         F0GQqyE7fbYO9llHf4FrEEKB1s26Ag4BhNFaNk6hrtab6Yd8ADerLexXpTIZDXjmHYUa
         S73g6CwZ+G/VuVOXLK3QLWxTR9HXmKshfO1+jMtMH9jsBPzSSk6yyIMEXzQY1YtKDeJL
         QPq0NvpGSGA27tTkyrBmN5tEO0hIVcT/IcSbtDUiHrREnFKUGZE0NjlXBhtEz9nzuEKm
         GcLFuVX64bhQT0pSJkG6YO0USvt7V8njP2ZCfEkYTAmXYBWRBjztGCBI9UdiRSb2tmu6
         GD1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxDLEpMI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f521casi1101520085a.8.2025.05.13.10.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxDLEpMI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEtjY-0007nt-U5; Tue, 13 May 2025 13:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbe-0008ML-25
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:39:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbc-000399-Kv
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:39:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a0b6aa08e5so39435f8f.1
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747157991; x=1747762791; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZ+iRFzlsz++4RFD9fl5KNYh6wELAyZ06jqDq2TXAd8=;
 b=lxDLEpMId/WwWYWmtwN0ALnWCGjktA76umZDnrHyiO9iauuztAjA1/rGgw/FMICDTc
 1Vjm0fcu2jRmt0LFE0FfpytqlfG3MY6r2MSx9S7X/75exOLCOnsr/73mbyeltuEPKYKL
 UvARxRrUnNcV/VGhXsTYj+4S2u3Nd16OdYdT8zZGHzBYOJFqrwXdpyMVYpdTnXb9DwxY
 1UTXvnaB0VZ6NLsfmZQdZByLC3ObdMOykqZOP0dH9YLY1TR12eAE7KfnL//+UNEuM3jw
 Q7T78g51MY8E+REOWmcKAF6EQ8oZpl3O9xuG9aB+ls7AzLzNaXImOxhqYXuj+baMiFp6
 R5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747157991; x=1747762791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZ+iRFzlsz++4RFD9fl5KNYh6wELAyZ06jqDq2TXAd8=;
 b=uk/ftjrBsD/hww53tz+p25G2ncmeTp3guH84Jr8g9KoW93QoBufdq5UZXvSb7MLZ9T
 y7N3UsZc87lBA1qw7z0tnRAr8FIVpltdTdOiim12rt5wS4EpuN1bcNSt5w1NN3gvRJfA
 He/ufB7fZz8lSbJ1oFfwxL+t/6/7uylj1G/3if7ccnrV+wsYrGQ8R1wAk1k0OpS/57WQ
 FOv3Z0MWauatYNQiLIcmbKbxA6X4PePk5HygV0ofIjryjz+OUb33PYb/0tqF7hti62Pm
 kYjzer8M93YZ5A2TjrSUOjS5DGZlAEobP5Uvr1mj8qqf3R7AJ8V9j0R/Sngl28u0r/n8
 gsAw==
X-Gm-Message-State: AOJu0Yy0z7A3eEBL1PULzfOL+ydELY3XuPaF7YHAkuLli6lwRvs6EwMl
 lKl6jnj+3w7tCjk6ykW1MvJv+09K5I4V4T0ePiknLXcaztcJhuOMYG+aTa0dXS3Hqul4Gmg3gtT
 czlM=
X-Gm-Gg: ASbGncujjkAKybeaOSvTYzciCB/2WPi6MgEXhJOc7zc2vyAH4pUysOmVIz+zR+5oIOW
 PHxlLF6DFFa81jtYRy7h/hoTMD33wHqTROV5qavb+gdocNwNCuV9inkgND368KLPfLt3qNnWujT
 oxGQZ/T9n2kKOeIndC/vBTKu+Awdg7SVnzVVage1iQ54TRnCFXnXLC5APkUnjri0VxvMw1KdmXe
 mrgC+QcEwjr23h+OxD5fUnABuSqsH4nJKoyb/V84RDtEm/WX0P0u2Sf6S+xiqUqDxCqZf+Tjd3Q
 gDxuG9qXVhGRHe+2MP2hzqOz3Q145/HKUMuFG1Czj4u2r5f4DEfUENldp3WLDaRBECaFYoaqS55
 OzX9+JFU9GPqWfK50HU6t/jKu8AiO
X-Received: by 2002:a05:6000:4283:b0:3a0:8524:b480 with SMTP id
 ffacd0b85a97d-3a340d15a00mr3980462f8f.2.1747157990807; 
 Tue, 13 May 2025 10:39:50 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2ab2sm16803819f8f.46.2025.05.13.10.39.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:39:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/19] target/arm/cpregs: Include missing 'target/arm/cpu.h'
 header
Date: Tue, 13 May 2025 18:39:13 +0100
Message-ID: <20250513173928.77376-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4ayIwKB/9rEF

CPReadFn type definitions use the CPUARMState type, itself
declared in "cpu.h". Include this file in order to avoid when
refactoring headers:

  ../target/arm/cpregs.h:241:27: error: unknown type name 'CPUARMState'
  typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
                            ^

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 2183de8eda6..c1a7ae37356 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -23,6 +23,7 @@
 
 #include "hw/registerfields.h"
 #include "target/arm/kvm-consts.h"
+#include "cpu.h"
 
 /*
  * ARMCPRegInfo type field bits:
-- 
2.47.1

