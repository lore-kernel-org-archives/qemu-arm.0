Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22908njm;
        Mon, 28 Apr 2025 22:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkVfNzFe/W81Bu/8P3QQcFY3g3A/0CB+BtngM8GKD2vNHQuZhgSr6mNa7hy26FQNoFmFcpE3OZc7lW2A==@linaro.org
X-Received: by 2002:a17:903:1b68:b0:223:6657:5001 with SMTP id d9443c01a7336-22dc6a6c809mr170564435ad.40.1745902818678;
        Mon, 28 Apr 2025 22:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902818; cv=none;
        d=google.com; s=arc-20240605;
        b=E0v3qnTKj+X4OWbAOU+uUT03BmlbOZ/Pc9s8A29ibyLX/6qMhaIzIAirz626Pm5ebh
         vnrnClCrwYF3pBzELaxlBxgUI7Soje3gPDsI4FMNS87zyYv2BuZExRcsfp+R3wtt9jRd
         mYZrIZdeH7hqihA5v5byM1sxQP2VUEUUx2cPKuzHgKzKducgHLA71+23lQXUUfI7q5Dz
         DnTpDs3HN+SqUrYRmJZiO5p+iQUGw5jfRFrzlg+lVGOBg1XVHMZAu6u597iWfwiFilO8
         ee3AxUygpJkx/1VfuM/VHL9jM+VMD7Rx9pz/u9fDjPlgUCJsmY6Fb73Yao7BkNuE4tg9
         176A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J1+mpgNwQQblB514w6gW7TOdOsjY6yGJh5E66/u+eSU=;
        fh=Y44FpEcKqZvZdoXIy/CqltHguMyncGiiyqbPuVpZVp0=;
        b=FbmgJb2Wv7DBL3vDsxXWowRu1IUHeGiZ/1AOkQx1Z/p+gFlhtJaX7d41ACz05opVfp
         bqFdyRtXilOdu5MfZF5DqkE/tfpqmNll6fqCRvIoUK4h3QwqhHa34CJEYZSUAE6tgTvE
         Al1Z5dmlve892xNr1EkZEegJI4SY0F4kC0fbODMRPMWzCidX1uwoTAxqifWPkPTk6cyB
         8COn7TDPaH6WGmBVBiHr4i8Mwo0t1xeATXPvld9YQKH42dYhW/1vn+UlHu9+9m2a4Ss6
         TfEtNQNawnlVAlzRcamUc2uLL+k9MBVAsETiHFno8moOWaxwabTc5+17qQS5tH8QMXDk
         4p9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HitOFpks;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db522b55dsor70580125ad.15.2025.04.28.22.00.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HitOFpks;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902818; x=1746507618; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1+mpgNwQQblB514w6gW7TOdOsjY6yGJh5E66/u+eSU=;
        b=HitOFpks/SasAXLGGAoGigQxEE5Q1eyE/w/I9Tsr2u6sw8uexJZe/vNWG+2vTOhOm9
         prldgDYwt5uNWPJPKhGzYPO9CZk1l2jBc0N2gzDV6cxSesOfFTTJIO3L5TdqjY5m8VR9
         hb/OM7pcBUUQHRgKNS78J9JaoVYNpwVXODV0gX7b/GJ4PZiWLgRKmEEZ4VueZ4A8Xdkg
         d9k2w2UKmbnE+3k64RtHjPJRrUH4kW43f5NG1iQr/h2M/Zi+1jN7o4/CLkYb0uN8SqYm
         5i8tUINZzrKbtUB7evvFwFaFRzmft2iOcEsKFc8NdliBDInN+T7h51UPB1uSXwcS5/CJ
         AHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902818; x=1746507618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1+mpgNwQQblB514w6gW7TOdOsjY6yGJh5E66/u+eSU=;
        b=aFBjhJYhRvCng/Q3rTEJW0J86swdcwdEgsq1aFHED8dATS9AKut7p2O1IpMexVXNsi
         S3+/1UEh+dCZQCRTMnhK3Eael8suq+nroDiyqHCRYj5KXNLjW7KoMO6CxApzUelYgWW9
         dPvgzsndunLo5V560t/fh4W9E3ipc7vwhbP6dVJQl3IV7CyV5TScLoIUWONvlkrTAd48
         T7ng25AyDwxBZYnQINCf9bDTViHB2zjDaxmGeB2PMkjOa/4OMPleZ4D9kvRE+J2fNzYF
         MAsI+0sxaU7ibuYYmxsYlpy4ZCfhKco16o7sbWV+usUXgrWdXk5AwL3kAotIT4Qx5I9U
         j5HA==
X-Forwarded-Encrypted: i=1; AJvYcCVZeedtK0tJ0NIfWGRCp+CEhmXFSye+KL08ZV/d5xAyC4v+2mez+RhC3T47hRuBYUbFY8efkYRQJePTCA==@linaro.org
X-Gm-Message-State: AOJu0YzZ/lhyz1qBbkfw0xgwS2f4F9vc9nh/o+Dmv2SzTrW2NDC4+VNJ
	V8Kjqob4RAzFQvmxruWzAoocuc34ikeGg18idf09tXxeDuR2n0x5joHSvZeC768Cng==
X-Gm-Gg: ASbGncuTS+Hd0+ThuZiHlwBhZYGVzw148+eNDkk/W//wZuLxM/4BnKaBG0+kmBP2CfA
	OXYMVoRcGXypjAYqv+HxgRDK3AaHpIuUAMONC5glIvtMJR2wZ9a6ULdKhWLqz8uYqnSEkDQVoSj
	mtUe2GyvOziJ61T9nV9JxQdz+8Q0vZMcAExAOilBoUGhMzSLOXKprLSRbfH5uNOg/0UtDt3X/ze
	ZPUrZSfD1hQFRkrqImKCE/BSUK3p4uFGnHW+Y13HHr/XfAWzo+69SeEAd62zEN4/evUJh4DZ3x2
	sC0tLr41H/ZD4OaR2Rwl6Oq0GCgegCCNBZX3E9RI
X-Google-Smtp-Source: AGHT+IERHWhMGoawkxhND2r6sOYx5Beqk5TQos+njQ8aQ63QB1/yRMYJ7tUQDCBZu8a/05Bc1162dQ==
X-Received: by 2002:a17:902:d4d1:b0:224:76f:9e59 with SMTP id d9443c01a7336-22dc69f3b0fmr169007685ad.10.1745902818246;
        Mon, 28 Apr 2025 22:00:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 02/13] include/system/hvf: missing vaddr include
Date: Mon, 28 Apr 2025 21:59:59 -0700
Message-ID: <20250429050010.971128-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: S57kwBO5+LrN

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
