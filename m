Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94233njb;
        Wed, 7 May 2025 16:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWW8pgvsrc+HclDR0KDzUONvKjLxiGm2iRoyNaY/rL4FAcm+0CYHeXLk7usdFAbZ/ftDHjOkH3PPhFbmg==@linaro.org
X-Received: by 2002:a17:903:94b:b0:22e:450c:ab5f with SMTP id d9443c01a7336-22e5ea69f27mr76221955ad.13.1746661365735;
        Wed, 07 May 2025 16:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661365; cv=none;
        d=google.com; s=arc-20240605;
        b=AN3iug2argC/Yknh3l4iIVR95rPzFXBhsxwudE+d7/VVCbSVMqe8puDPjk0/Pb8VQt
         jttJlEC/gZwjvbWLHirJ+frh1tf1zeQyKB0MAS8d6HWfQgaFRIPVaoCPipc+U7ZJBk00
         EsB2Q/UCr3Fas2zUtulobj9DdWKzmSY3lofWGkyKawqW17z40izBvktR8+5s8/Y66XnF
         nSYaVD+VhjrxVy3sv1E7IrdGGpsDs1E7kXP2YIvHhEoelMKsD/VHhVH3Hzpq2eE3FwH+
         CI2ZgT53Fe4oX32k74xT1tqdLEEzJ9MNOlb1tjt/hx822D077GWRLNwnE3zhHyJQg3+R
         vhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        fh=KDap444/oYblePRYSMaDh3Tf2OObGJ6ZMwcXTFWBxd4=;
        b=XPKFs1rfNFW2uRsPoxOdy6RFOwpR42LBqFXGBpprYj4h3Tf5UfYwazhZg383JvcCg/
         WOsrnQDvtDYW4cpEo6X7WD2N5THjzzJChG6Ihqg3XRlNQmWXz8AAh1MAFKcXS8nrRTWX
         5J5IQ2FqG7vOegDJRRUPbl0kxKlHUmL2Y9ZP9BjFPzIYjPI4CHwbHXaV3LdkFQb5bQc5
         ikaj+oyisJ3f6Bh1ghjWpgwdmtDEGSYmZ6osMzTTBpQMRuHid1GVopb3fUzh47/Ag3nJ
         7Glqyl+6BtbnBJPslnIa6/RpPEGPdmQpHYhOBH55OoXcrzuObFR6yZPmuM6sLconAgAc
         H39Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8nf9fNZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22f9f681311sor1985505ad.4.2025.05.07.16.42.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8nf9fNZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661365; x=1747266165; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=e8nf9fNZu8PBD6B2UUdkRbUiQTtxJB1f0hBLbfP4FHY+/Wb5A2LY1qLxadUJ6SLEQn
         Rexw8VAmCmli92SxQIYmrTI0XIwTxYGve+k18kI/Z4Hm7xChJxN+rTyEB0jbBSb1J8xu
         TaFKlZ3LrpbaaBlB3ZqmorcgLchP9X9l+8puTNC9I3ARE+cOsvbpj5IN202A4I3PAvQu
         BgDnGTVJfn+hdoSminQip94wQdS5FMXnwcNyO6yOYqs7mRazSPXyjsSXufFMtSOU6SMf
         z+NIUDg3UVtLOqZiYk2nPDLRzrs66MjzJ5zMbRSbM2eQjfzvu3+PJVvYnhCNTVURPenz
         RgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661365; x=1747266165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=jksfwEAXwqcddMKdt6Ma2uJdxpBu7rWjSCeVYe/pRp8YlcVAZCFP7+DIG2GuFCF8kO
         lDe7Htw33CVJ6pCqtqHsbHkonJRSfu+xzygWi5LCrQtcfpqDgUVLCewLwFFYW9ezBzWP
         RcHEBnUGzNiE+yxgzlmzaOjwcilgHDGXdzO8Nv4Qcx7ehDt9UJr9486NW6cJpmtg72mN
         Dq9zBt4ca56eAfUiKCRinsf6oVjxsFi3e4r6iZTViqWfp1UP2lORzTw3x8NwErlvfMnG
         5FeJUhQJuS92QySDbhRDT8NzCePiAyFgpTAl72c6ZxzY0ZULB8acHdH2uCvAXiNuTQF4
         EzRw==
X-Forwarded-Encrypted: i=1; AJvYcCW+yVOYpVkoPkAER6D2jp94LkgnylZ004CNVov0ys+E1VXS36q//Fb0dSGUENVXyoFhETENnH2/J6vjUw==@linaro.org
X-Gm-Message-State: AOJu0Yz8pxYOfcocWqH3ZgOEQOfJMyAyGkhjjjrHxkGL+8hZ8a6HIbxF
	AyL959CL7rg+ZvAf93LHAhqzcGaFfjbIiDNhZaE5wRkFNtldMAzKF41GDrMu6963Bw==
X-Gm-Gg: ASbGnctmmZpfCghxxwKKj/9m8I59K2m2jgsqO5moq8Yx5IBQICAdVKIJXMkdQA6PTR4
	XsDzz8UU1ZOdRMB4nVlXSsntv3Vm4uHMjDxyONoCkVIjORvWzX94G8JUTHT52kIB+XD10thbfeo
	Oo7o9uT8w6pfv7iWbKuDh9Q8BCWBKS87E8tA4X3rD9AZBLDWRWnNe9QT5Lo1LDVqR6vNq5h5TBY
	p4Qc96p0La/FDFVCZElwP27LEoeucR1sKH1/+OWI4TQEP+VDN2eZhxaWOkLEHdocPQatFXq1xKU
	tOh/HKfLTL2Ou4bBSmoA48Upiu6lg1yTSBje9usl
X-Google-Smtp-Source: AGHT+IFRElYU/KSdQj6gvksHfb5N/L/kOA91LoLgQhb0WTU6VTAxYcNOCkcgNdJ7NYvydi9yp0l9og==
X-Received: by 2002:a17:903:19c7:b0:220:eade:d77e with SMTP id d9443c01a7336-22e5eddc7c8mr85104195ad.40.1746661365302;
        Wed, 07 May 2025 16:42:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 02/49] include/system/hvf: missing vaddr include
Date: Wed,  7 May 2025 16:41:53 -0700
Message-ID: <20250507234241.957746-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Va6exttGNm5y

On MacOS x86_64:
In file included from ../target/i386/hvf/x86_task.c:13:
/Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
    vaddr pc;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
    vaddr saved_insn;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
                 ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 730f927f034..356fced63e3 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -15,6 +15,7 @@
 
 #include "qemu/accel.h"
 #include "qom/object.h"
+#include "exec/vaddr.h"
 
 #ifdef COMPILING_PER_TARGET
 #include "cpu.h"
-- 
2.47.2
