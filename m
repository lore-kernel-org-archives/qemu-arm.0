Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4642732ejb;
        Mon, 6 Feb 2023 14:36:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/VPR8aHsJteaMZYj6jX3VsaJdMvT8lMssWnDHU96iuQtv6axHWj1WQWlh2UxNoW2Hj4nAy
X-Received: by 2002:a05:622a:342:b0:3b8:689f:d8ef with SMTP id r2-20020a05622a034200b003b8689fd8efmr1921584qtw.18.1675723008005;
        Mon, 06 Feb 2023 14:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675723007; cv=none;
        d=google.com; s=arc-20160816;
        b=dI/VMHQuVtyUt0cbqv2rEn83QoetjI34F7xM5HWC4xUcJTz8Ia5zzmsIt0tKqcakI5
         ZOraUPm3AL8pIJCcTUi5e3zBoCTtXSTL+H8Nfw2HXFDrs1vWvRA091iiCHC58/Er40WO
         dHyaZg+OgBQ+VIOJMxo1KJVpAgIWNHF1vRH8aDO3HO3B1ek3uwkeoY+WVrkOEcfUKrkD
         jRXzUNKf+R255bQJ8ahkEJGJloV2d5NvchViDar3FwZkqIICNTy9v50IhYEYQVDmekSx
         wDv3Kxk8w1KRk4LFeWyHSVU8Z6ETloHXoxQNIsJZ+3E30XqHWxWDwlCkBIg0M3fi9yAF
         XDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hkXbL8y61939hNYH0ESs0TMwg7eANZ0/D9elcJnMLJc=;
        b=tluKEX85HGYNkAWMzV9DE4Pv0+X9HlyVT3eYgJ454VxnFF/LmdOIVAOHKkF9xgHVAC
         2A36YRgGCjFAcjTBMmFxSGm+TxTk2kONZXnS8F5t7U4HCcBKTNkx1PDFc4as7zkDv7Wv
         pu9yIKBipPLEjhPmSvebYzEBElKYvrreyAH4EATdUb+P8M7cNfPcZVP2mXrF56B6fO9j
         Kn+TO4AbCj9p4Mb8NKjhRfFoD78pYzQq5SolaSQ4s8oTL1NS/ZqVANMRTpmVrHGpbiK4
         7sJ9gLGq6yi6/ZNM8wz9/SumrCWorl90z5MEx2o9gidBX4DAxcFHl0ATAkBpJZPOqWr2
         K9nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXy245hs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05622a134700b003b84d549ca0si9563906qtk.679.2023.02.06.14.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXy245hs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5P-0001tG-1m; Mon, 06 Feb 2023 17:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5N-0001rE-8E
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5L-0004Uy-Jp
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:41 -0500
Received: by mail-wr1-x431.google.com with SMTP id ba1so7825155wrb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkXbL8y61939hNYH0ESs0TMwg7eANZ0/D9elcJnMLJc=;
 b=kXy245hsMKQfadouVZLsj8GRcGW/9K3Q3+eoLVcx6EYiNkvECEPRdFdZVq/NBdgLkc
 S8y9qE7K7P/jEpLghMETO12yS02us5hJG5R86CCNd8wo5ElsMOqvIIk6a1oaBHkUqBfK
 q+z1lLXlRnKKbTGosaMPTJZB6zd4D0lj6cXR+SN59ev+V8g9nwnkbq3IMs805ldh+svN
 /aLNBPFnR6w2QQQEqwh4DrfV5cFbmqFlvmYhEt/f+ziPUZ7LS6F8LH1AJ0i3MZReJuXQ
 crhNdNeyRyhsRfNQOis7POp10ZqYyB2CRI5GgOe0Ty9udRGDOXtZEC15k9EYTxQMyMgC
 9msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hkXbL8y61939hNYH0ESs0TMwg7eANZ0/D9elcJnMLJc=;
 b=bzrPTIHgSGhp7WMlMIQvJxjCgtHtDpaZJWoNhNXZTcXwOU5Z9OpQ6mZ+EfKWXMv8Zm
 tRg460YGWPa/9J0toAOI1Z+FQgiYdkJW5IDg+gsrIFSqxpxIQbavU9T8bX9RCW8NHAL7
 NJzwCrbHYHqMSbOtMariI6mu9AO4yahTqHHrn7FqVhErMvUuym0EHX75EFWyyzuaFett
 P6tZJ/b4M19V2FiuyhvBLqY/seSjal91gAY31OebnCm4cZLaRkopqvCQRWRW57vJRSpk
 KiFUEb6p0NhAaHcZC2bPuNszBs8zDHW+eaAdynJfb56D3CaUTndIDz24v+PG2Wzxnh3F
 7E4g==
X-Gm-Message-State: AO0yUKX2T2FhnszxZ4RewCMWU4BfmvomRc6Pb+XelgR483zrVyMjdIyd
 Bk2JQ3qNoyK3T7qDqa9LY8SlXjp+fM4yxESd
X-Received: by 2002:a5d:4cc6:0:b0:2c3:d657:e951 with SMTP id
 c6-20020a5d4cc6000000b002c3d657e951mr425799wrt.29.1675722938070; 
 Mon, 06 Feb 2023 14:35:38 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003de77597f16sm12753148wmo.21.2023.02.06.14.35.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/11] target/arm: Avoid resetting CPUARMState::eabi field
Date: Mon,  6 Feb 2023 23:34:57 +0100
Message-Id: <20230206223502.25122-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
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
X-TUID: KyRNNWc7sgPa

Although the 'eabi' field is only used in user emulation where
CPU reset doesn't occur, it doesn't belong to the area to reset.
Move it after the 'end_reset_fields' for consistency.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05b9012cee..1c1e0334f0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -721,11 +721,6 @@ typedef struct CPUArchState {
     ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-    /* For usermode syscall translation.  */
-    bool eabi;
-#endif
-
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
@@ -776,6 +771,10 @@ typedef struct CPUArchState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+#if defined(CONFIG_USER_ONLY)
+    /* For usermode syscall translation.  */
+    bool eabi;
+#endif /* CONFIG_USER_ONLY */
 
 #ifdef TARGET_TAGGED_ADDRESSES
     /* Linux syscall tagged address support */
-- 
2.38.1

