Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E5C982F0
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 18:59:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgp27-0001LG-N4; Fri, 16 Jan 2026 13:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp25-0001K9-CH
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:54 -0500
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp23-0000lP-Ss
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:53 -0500
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-2b6b0500e06so2001144eec.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768589930; x=1769194730; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cae0AKU0AXhKRe7liQDqczScNpFcN33Kwt7lSzXYw0=;
 b=Np8FqvN7CuPRfsAEGVeggKT/11HLyXAVEQCogvp85gRElnN3gtCbhQCh47A8LEh5rt
 kELtR5xrICx2ufShrsQZsQA2H2o+rYZmIZVxklWJNhGuwr7pfXne8KEHXIB4yJ9nNeu0
 5lo06dneRGGMsqyPOoUR6ZpV9AKw8yUrENNIqM89ckhndu+HJjjPGnX6pXBgsZ6vIkZK
 A2xv9KJE77efyCUyKjdg/R2vnZAm8+cw43VgXhnH0+iC5Z3Vyu8LuJ+iEiZO1YS8hpRk
 +gyRYZprMsfW7iCWDH09abdItd7ZKu5FxWXas8dGPZN4kRLrXIQuQUdFu/SkTp7UqaSJ
 TJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768589930; x=1769194730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0cae0AKU0AXhKRe7liQDqczScNpFcN33Kwt7lSzXYw0=;
 b=Fv+LjHruCPOCRqdCOcbFXle6QfhO/WYad1/n7Nec6XAWUw+OvqFOxV4cwX438VMc7h
 grkaienWige3QuCUWiZRlbo5bo0ERxzrsArbtZ9ViaT7CHFoWsHwED4a5k1MYqbiKWDK
 oScvSukzRAAapNQ1n8CR0vJ95oaOHQ+85lPwKFNT+pUtXmkYTEQlQJFZSlgnnNp0i+H9
 b+ZLbWMoUEuEzW7IYi35vHaRuEhsnhF+sZq1mzusUZI8tsgEI++wARCA6tV0LB3/sTE8
 jvkw2d6cUVeZVhZ2hl+Ulr7lmxGNSh100h/5srN/E9Ge31wLNnIO7nSXCsxIWjWpPi4y
 RjcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeKxrDGU4fytpGapi12dlkhquGeAXNj4ul+2BrBjRjBEpg2tcLBWqxg9gtYlZPjlNrEKmRs5SFsQ==@nongnu.org
X-Gm-Message-State: AOJu0YzOFW7uNauojN5W0GXvyi0ImUi1d39O1Ntm8gKq3ovKmG8Vi9yq
 WyRsD/62XhEALy7HshwSvNRGCtJnee8oiA0e6E4FR5qS+6xNMnTu+6H2GeR/S5SUvMc=
X-Gm-Gg: AY/fxX7cIcm1cvkrLfA6xzz4qksQM2i7C84jeLIPE4aUheALowwKKOJpPaokpUvn9xn
 Yu5Esp6UTLgUlJBLIDpiSNY6O4NAXSOHYO+NbUbvXB0RN5UHUWpFW1IiQmIB30qAOWJggA8SNVI
 96xRCR62+YjPLSsHAyEj4Q8aq3qRiGRrxB/9NtU3BNIgbZJZVfudPS8LhAXg3paAwp/aByDyuuF
 zpW4xY54hPNBHRI+usnoM0baWPk5MI4NojQZgq6R+nKxr7suPeuzvOsDRLnO3pwpEJopy6d2NTV
 NzMv1S02igjznnPEdNJFKt54K3DSPlqsEvyv3jb4Ckj4etdA+KwTHfKHVbr1/e1yXvM6gwt9h/x
 GtDLG6pYmWFcy1Ig8J5+k7S44gw7hHGY+SnoTk/mbD1FPSO2JwnjE+tRpPFOsIZtoSBILiYyuut
 qEyhBdSwgghxIJUw==
X-Received: by 2002:a05:7301:129a:b0:2ab:9b40:fc78 with SMTP id
 5a478bee46e88-2b6b40f3574mr2511745eec.20.1768589928927; 
 Fri, 16 Jan 2026 10:58:48 -0800 (PST)
Received: from gromero0.. ([191.8.214.17]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6c2de1f29sm1524126eec.15.2026.01.16.10.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 10:58:48 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v4 2/4] target/i386: Add a _MAX sentinel to X86ASIdx enum
Date: Fri, 16 Jan 2026 15:58:12 -0300
Message-Id: <20260116185814.108560-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116185814.108560-1-gustavo.romero@linaro.org>
References: <20260116185814.108560-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dy1-x132d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a sentinel to the X86ASIdx enum so it can be used to compute the
total number of address spaces supported by the arch.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 2bbc977d90..da5161fc1a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2733,6 +2733,7 @@ void cpu_sync_avx_hflag(CPUX86State *env);
 typedef enum X86ASIdx {
     X86ASIdx_MEM = 0,
     X86ASIdx_SMM = 1,
+    X86ASIdx_MAX = X86ASIdx_SMM
 } X86ASIdx;
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


