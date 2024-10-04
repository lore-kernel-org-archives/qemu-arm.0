Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp557222njb;
        Fri, 4 Oct 2024 09:22:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcqFj2WI78Go4aNhhHpazy8e9yL7wWlxxvEv99VRe3LeY8ZznZzN1Rtd5oBFGMTsfdqhwaKgPT7BXX9w==@linaro.org
X-Google-Smtp-Source: AGHT+IFz6mhG5qSoqM1h2LXOVuX5NMhsyQ763KcqY/3Zw0fkOZCRkdu4EQ4cy7K4Vr10ci5NZC4h
X-Received: by 2002:a05:620a:25c7:b0:7ac:9c44:dde1 with SMTP id af79cd13be357-7ae6f44c75amr440703385a.28.1728058946598;
        Fri, 04 Oct 2024 09:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728058946; cv=none;
        d=google.com; s=arc-20240605;
        b=NiE2s4fD5GkUAuph4NZ4xK7DjWw7MuoCu/Yy5JH23rcfDUIaJ8nXpFpZioJ/KAFjw7
         0Bt+lfMd3Z0YCRYKNHjKGAW/BIz6qafsAJ5SX8qZNLRWC+2bj3qXQgHX/CSbQhv7qrHs
         YxcptSAZel5fYRZXjTgHbaRdmfzAaDD14Y96WZHhwjiHbWZ5F3lgiGkN8dAEjjy0Jrcw
         Yr/BOFovvzU88l8v/+kVhJ4IZqcbQGQK0CHh1v/+yNnrT3Bsp+grwwfWOIKTFFZgxtBg
         gWpMjjsEY72zaAjuSF8RR/aI/usNUoyGaezjWwIMr8GIyJMEp+A4p3XjwFmgrXT3wxU6
         NIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4OOxOqFJJ2HqgakCTfYbfryttytdC4aA+0dIobma124=;
        fh=QppzF4IH34n8i+tmsHuB1gP9wmOBDEpsxrcTvbT0rTI=;
        b=K4E6WmAg4ZB6ntwi7gtJGjYGUSvvv/esjR1OvVPqI9D86JVeouwbKL/PByqv3ZvqcK
         4f5eXJR9Xu0NQnpLFaPl4jzDoYAE6nd75yRDExbh45MvQNCAav+Kt9hTycyTa9Agfs6m
         z9nzpfsD2Gyz3s2kBUxBgsdlNBDVGK4Msy0W7ibjS3teftLYEoewZySebJRMjl7bx4hm
         2nuvwppkOW99AXWCsjpQdMc5rngFjkEWFj88+ub53fepQAZ2PBdLxR2K3eJuELdT68vU
         oP8/LtCLny6OkbfXcosI9JftoGoeYzKgxT0BB3MI8mCidgO0D8XHeRyqGlmDLN+1aIq+
         5jsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlIFSrh0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6ba09d37si350774585a.395.2024.10.04.09.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PlIFSrh0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swl40-0003nO-J5; Fri, 04 Oct 2024 12:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl3y-0003b3-TR
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:21:55 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl3x-0004IB-E6
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:21:54 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fac63abf63so24933131fa.1
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728058912; x=1728663712; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OOxOqFJJ2HqgakCTfYbfryttytdC4aA+0dIobma124=;
 b=PlIFSrh0yxcgXCr7mZVxqYAKhAT3qUeLGN30iQtSfFphmadQFpOWytjUbPxsrRQWbM
 82pDAMitaOC/fCLMxP7XD9JMwdQL3pBx6hYJzrNtVNxFViaEunDr7W3ZmcziMuhmWrqd
 w1JWpmHJnYSFziEGsXvYQl+sonDZWdQg5G8gyj1sjwL0QrBlKKUqxn3AG7Heb+MNTTPy
 fB6Oxwv8+Jvw7ONBGukuxMj1HkT5e0KEBcEIDUAwj81WDRucOUbL/xFoNR071DEt+jGh
 fGX6tn39k7ts4UBS3XUydKRpAcGuTp7jvNp3ux+cgcIITpYQetcj3VVkbIHSwtqsiYRH
 xGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728058912; x=1728663712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OOxOqFJJ2HqgakCTfYbfryttytdC4aA+0dIobma124=;
 b=Kz1VvRC1IAEuighLPMJLTh1z8GG4W56c9WFw9jUBJ1n+S3QobWVjGpiLCfqLNjbiRG
 quJhZKkdh8vk1qKzSVgFbgIroujNfep5PQ287g1uZliqfJCM/DUXAnkznL+T0xcNshTt
 itbNoXqdLFEyunFzzbUogP+t2Q6vhP8sAkclJkO9e/wU2SYTHLsfhapPX0RysWXkrwLF
 86ZaDR2FBI13wSTG7qybWO+kSCYw209x8IJSZWTUNijC33ZWm78rg1XHChNrcSY4tFYG
 N/srLnd7UfCH2ZKJMJPARb0WbGNH347UoPAAub+66cHu3zytOL3cbuYvHoiDVWUDKSAI
 0JBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4NGTzMmaplNqniW+wPTMx7FoEqG2vBQr+L/PzDYOlP7To8/jnQxvxIIyrJYSUrRZ39bj4l59/qA==@nongnu.org
X-Gm-Message-State: AOJu0YwW/W8mnBp7P8tANwHEUcPITOb+ALQx+2SdeD0khuxYMH+DqGSF
 x/PO9uP1Rg8InW2gFmz23Ngh6fEPTe7cD8V0zLAXdKiaQNmojJ24v5W3v6gYSYEg/mM3e4KXcDf
 Oa9Iai/7n
X-Received: by 2002:a05:651c:1994:b0:2fa:d296:6fbf with SMTP id
 38308e7fff4ca-2faf3c1419fmr17307381fa.1.1728058911540; 
 Fri, 04 Oct 2024 09:21:51 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.208])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b329a7sm146481fa.104.2024.10.04.09.21.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:21:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/8] exec/tswap: Massage target_needs_bswap() definition
Date: Fri,  4 Oct 2024 13:21:11 -0300
Message-ID: <20241004162118.84570-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004162118.84570-1-philmd@linaro.org>
References: <20241004162118.84570-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CVY7RP0Wvc4N

Invert target_needs_bswap() comparison to match the
COMPILING_PER_TARGET definition (2 lines upper).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/tswap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index b7a41913475..ecd4faef015 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -28,7 +28,7 @@ bool target_words_bigendian(void);
 #ifdef COMPILING_PER_TARGET
 #define target_needs_bswap()  (HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN)
 #else
-#define target_needs_bswap()  (target_words_bigendian() != HOST_BIG_ENDIAN)
+#define target_needs_bswap()  (HOST_BIG_ENDIAN != target_words_bigendian())
 #endif /* COMPILING_PER_TARGET */
 
 static inline uint16_t tswap16(uint16_t s)
-- 
2.45.2

