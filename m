Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778132njj;
        Mon, 5 May 2025 16:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyLor/cGrcgvqNIrjWnyxhilQPOsOalWvzzCpMdvUvu8+GlS0pf600CfNGSLxeLcowMzRMm3x1Pm+uDQ==@linaro.org
X-Received: by 2002:a17:903:2b03:b0:224:194c:694c with SMTP id d9443c01a7336-22e1ea9fca9mr146117225ad.28.1746487222959;
        Mon, 05 May 2025 16:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487222; cv=none;
        d=google.com; s=arc-20240605;
        b=h+8SdD0OzpyIhuKPiEF9ampsjhsnL/GVxMLkCmEX0+ENhvYQjjEdmlkglrOtlGm0DE
         gmkbaoQIF98KXwS7bUHC0042X6xlJXGN/geEjwcoUJIGqRoa5dXAFWhgcDsjDvaMpR8I
         mZy4Xw9u34bPf6BYZ1z3c29cwzbpQfLrCHlJ1AoS/hXXaghYv/3q0ST1h4irv/Vqw65p
         0D7wx4ptnj5STXs8e/KoXoOx8GDMqphrsYdZg2PA+33X68aHJCkubCwfmZGdsEtFHL/O
         EnRgGoabBRkhg0aaYXUonTyV28PYw1gpJ3bTkxeXrF9IffxG8Ux2B0b8/2GB7fpww3Rd
         YeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        fh=rw6ytyYNzszAwAcyvgGbKxgBrvvT0dgXRb/vyx1J+es=;
        b=coh+Kn97dca59EvxareW/Th+yxDMV7OwmR99szhAmuK/oa1MO9IO8ehEeXc4Uct2uH
         gRHhhmSl4Vk5Me6qbqhSNvpCJDDqO9DrUGEQdNBj7cFUn1iFnFnGRNisn/8bVGDMgRK4
         z2baXWSqjPX5cNNmpyAJmG3BDWEfXgLqVWGTN4hvEj0+4xQsNVa3e5FZ4MXV274BSmqP
         l55LUqfwDQGe/DNPx1LPw7bUEASr8+slZdGNe6DpZti3K3tETWMHi8UCyeXxYgDCbCuW
         VM8mcdiUdNyPnzxD2CYN/vJlGeGaMzKVhY77xigqbyoNwC6BruMbb4RKexpokaybQ38/
         1K4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GybXkgRO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb34430sor57752535ad.9.2025.05.05.16.20.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GybXkgRO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487222; x=1747092022; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=GybXkgROQCxlMlZ3MKv5IcIisXs+w9lREkXHOW8eO5tiMcy2YCrHH7yUofnXgxKoUD
         /809Vk0rwJHhpacdczW0f03mCe08uaTtTivRCNOA2TEHap1fogS7n5G5FJUWC8PHkwut
         tEbKNSEJ2Ml+vh/P0+bs18b2Sm6q3QKIQDcC7XvQwwODWJFI/7Kk+74az577iJkMThO4
         8lYDWqLEHhQt9RRcJONdPliqXAucyBaFPgfLBWWTAWxxwGIs64YflajKWlLrWTtTntS/
         7pPR1wZa2w5I2PYRQN6MxEKqwdjUxXH0U/nvX3KpUlN5tB/0xop+JU4ye2D15qeQfMJj
         eUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487222; x=1747092022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=dcEoACVqvlaSnEauDnyeHTGdzhOxDxNdENDL/sTdDe7Jkw6FeFGzStPq/NrjSSZQvr
         24iDRGo9vYZir3iEKckIDew9M7ebEQBPO5KuYOo2McYRzTc0BGAk4XvWIRkOxTgEEoLH
         Pbb85BGuPK+eqKP1keEoyHL6gaLXx2+FTt0Q3TGIPyMal/3NkKXw/Y3HsKjpByRbK6R0
         CDnCCKegWky9fl1dNhJ3TIxrGkp0b8Z/4BfMbkjQQJhwdoBNWfjLgqNQtrXxfqGNBTf/
         8VL5H5/EWg8S+q9Ji7vauc7k4wOp7tCKEDzXmPbzPY39Z59NmeJum7EbrNJ1p+J3/vAP
         OxKw==
X-Forwarded-Encrypted: i=1; AJvYcCW41BW7Y/PvLfBdrm//oNxEBUFJ0U9GlA6ezh2j/0B30Kgz7hcKpeqdfi+4Ot6GabFfL8WqtjdKyMdotw==@linaro.org
X-Gm-Message-State: AOJu0Yx4wURGqveiwaOyO2BvIzrs7r9Ge3fD83ohjpmJNVvssdDXj9V1
	Hh+A54uWC+TpNkMO+Htl65Ic0WrtF5CA5dmAcdaujsKl0ynxRA1at6SSSJcwO6fcFw==
X-Gm-Gg: ASbGncv1DnCTpD+pCFPp5XWsZVPeiy24sxA0HJYgU4mrQhxSJOXVHJyB2F+gnFvH/UH
	3NgeUYu4VFYZCTDupuBUv5CAI6R2IZK7aFiPV3NyivaO//biwPegmazF4dDHWkptyNg+4iH4AaZ
	wpYPrfhn4bjt14hlp3+v1k2OKqeoRdkxhUyKcaepyjsxZhuWzBQESdKbWWIz4iqQQLnSk+Ucr/I
	8wKn1S+H+8plAKDGsaOa4yGAx1xAbOh5Cbxma0siJyShAcuEyAhep5R3tYOZuKP5yp0xkS1zhTh
	KksLks8v9JjYtAwe+W/+wMSNJ7DWGbCtE6oyCdW0
X-Google-Smtp-Source: AGHT+IEkGA7F23dh8r0tL3IOEwmD1EC+JY8O4ZS7CbJfLPw/hDppOvggFCwGVG9SRLWdvxy/22v8Xg==
X-Received: by 2002:a17:902:ce12:b0:224:2717:7992 with SMTP id d9443c01a7336-22e1eae4d3emr132746025ad.33.1746487222470;
        Mon, 05 May 2025 16:20:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 02/50] include/system/hvf: missing vaddr include
Date: Mon,  5 May 2025 16:19:27 -0700
Message-ID: <20250505232015.130990-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /B0tL7u5CREJ

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
