Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463945njm;
        Sat, 29 Jun 2024 01:56:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQadit+pdRIK4WlvzmlyJwEhNPYISAfPi0AERNXpg4NFasqCNHpzO0X/auEiOXYcDt6iR1KoEiLnqOxheNtRTX02YsnyHw
X-Received: by 2002:a05:6808:159b:b0:3d2:1da4:af63 with SMTP id 5614622812f47-3d6b4de260amr507077b6e.45.1719651399810;
        Sat, 29 Jun 2024 01:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651399; cv=none;
        d=google.com; s=arc-20160816;
        b=vwW2+uQhDRvaMtwy2TEcm5K62X8jeJOFcvOLS9hxpe6C5OGewqOpsKJg6YwlQV/HeZ
         yrzTQ2oFelUheNr9Lf2j1jQYi1aRNJKlYWgPth5agxc1f8W+ZUJkAE2BEbldgpTFHbw2
         8ntKbrnr4tIWLPcqt8rs2vS70BbM09L/G3z7boOSIcODLq0km6QuXaO4LS32v3FJbsAZ
         V+JWLEmCxsvXPYx1cwXLWkMzec/M8r0BEerplSdm5j9pfLH8AEcHihy+Joo8K/gxKQ8G
         Tosh9LOVu6Z5XMKxZk5uwFLvfWvlt5/xhydGkq8BTzEn2FsswMD5Fq0s/LSJP9xU2BHw
         EQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=Xhtl2nryjT/VmrtOBPaLo9RlgNr9OGF02gemGn9ndhY=;
        fh=94IlsDSeTdTrrnU3vze4uJEidNXiMftWC7C8TLhDEuY=;
        b=FHVKMrOSozS94LxrQ8SFYnDh3/G/GJ765UEh4ro9bi4BKevK8T2GtE9KUvcSNlMCS6
         ECU2ldJk8wea727a0cgvaXW5V82H4GP9DgDkq30d4uaYz6O93P4inlEv+IbIW81aQhvO
         xOH65+dNUahQ5msM71tdWt/e90QOw9jMv3YWMnaZIbzjIEvz5FeKhcDG3p1O+a6i88YG
         6vnXeWV8J77j0lW0RqvHAJJuvUhZ0NMttawrFtDflu9cJ+PYQfvmY++1uef6w6OsfpOB
         Exqb8A/O9vvRxFUccnnV4fmqZPx1kgSz1nJIIsr4c7xznJ7XHgSRRIk8mw7+U4srgaaB
         nl2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=pVI7mWNU;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d567736338sor2234410b6e.5.2024.06.29.01.56.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:39 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=pVI7mWNU;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651399; x=1720256199; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhtl2nryjT/VmrtOBPaLo9RlgNr9OGF02gemGn9ndhY=;
        b=pVI7mWNUiamLm5UHYnH4+NgeihpJ4sMhdxIWTB7OzCRIxyINm3DMDFAbORiagusKJL
         deT2+EbmLXWoOfiSKAD2OorlCNnZyWtzqn2c78UzUjDVbf3aRBvF9F7kTpv6NdehNXnN
         GVg66D24NwDWXce7SNuRCbg9gtm042YsqXG3apmslWA54/ANsnkt2+xoGQgsUtM+pm+E
         LsOt2tGJHV6CxdvF4xsHs0sfy8m5gNi1KxHJFc3jKvMXZ6lY/8UN+sJP8u6KnWjIEAaf
         gl/0Uvv3ej6F8zG+Jf6jkKmGSvjywlE9HaLDLJHNJY3VFzITZx3kz2lA5Uo9/AGKBJFW
         sHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651399; x=1720256199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xhtl2nryjT/VmrtOBPaLo9RlgNr9OGF02gemGn9ndhY=;
        b=QsaH3+x7JSqDZx/XqOwoGetxjBmHWKrVBd9b/9+G3Tjum40L+qKLP5gOc57OSlIlOj
         kZsaLi3AcNvF2QfjY6ltEoDCh94ZML4crP2ap9NYxooXxMzw3DhWTXGYdmVOnnNcl2CM
         yVkJoDd0Ml3hXZHXMn69BhUPLaJ69P0fR9Qm8JwfzT/iFco9O3M5SQzLCE+vRDbaPqkB
         TkcX+lyBXL/rxXB0FlWo1m+PPzaBbS7vgKQb48qJ8zA8diFszd3YNcNNTSNYvcUwsJjU
         wG+dJzd3z4fMhy1Bpoxw/YhbsGzn+k45/fgYQzg97cnbqlwiDVZpqgG1f5JRoqVFe/ie
         lOYw==
X-Forwarded-Encrypted: i=1; AJvYcCVtVa8tcFAo5MdVDj4HXGYQmEpHUu4+zVgq+bIs1pw1rnQzikWKcoR1zgIgqxtT9mmjGadCimwleajbUyoQXl/3cweygwXG
X-Gm-Message-State: AOJu0YwRRPEeuJNp/MDoAXsLePzQ6h6isgj7S9KlQ1/SG7Jde7KXvMIQ
	2oRRcg4PoMvyUgJLlZ6D54Ul7fTrFZUkL/iMYswsuycLtrMBLIO6lKv/lClbAEA=
X-Google-Smtp-Source: AGHT+IHAFkrXQ9ub+a/QkEklFBVX8IhRBK3TFyzQ6+ssk2A2dADGhezaTmscRR67+8Sbwz3LnRex0Q==
X-Received: by 2002:a05:6808:13d5:b0:3d5:296c:5a4f with SMTP id 5614622812f47-3d6b2b23c81mr503824b6e.3.1719651399290;
        Sat, 29 Jun 2024 01:56:39 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70801e53b21sm2961307b3a.19.2024.06.29.01.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:28 +0900
Subject: [PATCH v3 2/7] tests/tcg/aarch64: Specify -Wa,-march=armv9-a+sme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-tcg-v3-2-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: Co/TR6I/oJfO

The availability of -Wa,-march=armv9-a+sme was checked but it was never
used. Use it for SME tests.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/Makefile.target | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 05f98c80c88d..d3e739b566d9 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -72,6 +72,7 @@ endif
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
 AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
+sme-%: CFLAGS += -Wa,-march=armv9-a+sme
 ifneq ($(CROSS_CC_HAS_FNO_INTEGRATED_AS),)
 sme-%: CFLAGS += -fno-integrated-as
 endif

-- 
2.45.2
