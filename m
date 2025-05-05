Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178811njj;
        Sun, 4 May 2025 18:52:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpTSCRSbRDxPSq0XYfGM78AiJAUuJYCmoOfvUsWE9CEvn17+6F5a+uywueknwxHNAjcyCxENJN8TEhUg==@linaro.org
X-Received: by 2002:a05:6a21:338c:b0:1f5:8655:3287 with SMTP id adf61e73a8af0-20e97dad4d3mr8044924637.40.1746409967663;
        Sun, 04 May 2025 18:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409967; cv=none;
        d=google.com; s=arc-20240605;
        b=blKxp/UPEvUeph9chIK05G6xwAXc6eHc0nn7nULHcHFfqODydj0VpMysD7GyE4KwB2
         hScsreGxYD3AgmRVpD+Z3OMkS72cD1lm87sxO9XTsmZLtiCNsOj0Iwt1ZpCUVlROPgra
         wiNH2zxnB3Q7mYe57IbMrN78GBSmiRFxwihc7wS3zgm+ls7WhhvrL8AnnkXSIU1iiphi
         xrb4cTNab6fPn/BbA06rRNUbpav+XtDzUbecE/bm4rNMfVf6vVSxZG3i10l6EE/y8BNv
         W9obK8rW0S+sl2TFFEEjx4QkH6cszPOf/HA8innmhMzPP9moeEVP3sVWgTkS39Fa9LNp
         LC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oU3hP1IM611C1WkYpOLE6kbCej9Cg8bXJlI25SZwxm4=;
        fh=QNQjTjq7lsstcOeEGZd4TTUHa+N75VQZhcyTxFpp4dI=;
        b=TyBh3rzSK1JzVBzBcmQEOhq/adtzsuH2KFZwymde+en7HTCVy55+rjUKMpdYOoOV9Y
         2mm/S0U8ylb/UYgSk2IXQnfOjPG/KwoQMuAsBTbI2Dp7fVHJ+tz4S2g0n5NrTOlzLV18
         jvQwdWxd2SFPf1YRO6F00YhvqYgo+mS0B7D6b9ElStuite74ZvOW+Lt+9IDYFlPswhKE
         dmNNvqlEwQohVoQNZ6rcb0jar4y2H+/QQWPIYbaNSsDUvdA9c9UNsDwSd2h5l4oURSO8
         5vf0jJly9A1lclmRYkzhU8KkgMKXE/AnmolaPQSf1Mi82PYEfLRaM4FboIyoS+ddVbHt
         Ifkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWW8uank;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0a1aasor7105758b3a.9.2025.05.04.18.52.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWW8uank;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409967; x=1747014767; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU3hP1IM611C1WkYpOLE6kbCej9Cg8bXJlI25SZwxm4=;
        b=WWW8uankA6ZyD1Z5f1wqgajBzPlAe85QGm/1H8/Iqnv+BWb54ZzO2ZDvfykHVTSgOK
         LIRa5yKmOLJzV+EG1t1SzZ1lsI8v22JyAHOHBsn7C6HEZDrNZMVB9XddGCctQoa/uEVr
         qtWgPxwmby+DIwacgV54/SF80TcWgxJNsNtZvM0Qv/4h62E4tQC3avMohoJlqKb/JIKE
         fqvZdsatoUiOOhoOjsyXtdNC29i/p430ZXCLS+7m8rdYXgf9gP9kBV2EDq+mo9RJ9DM+
         YOVLHN+crV6Bp9AubmO9y9yHzZb3U0WDDh81k0fOLWqBFFYcgHSp8gNSrHhJUrDZkmdB
         B90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409967; x=1747014767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oU3hP1IM611C1WkYpOLE6kbCej9Cg8bXJlI25SZwxm4=;
        b=nvWTzEQd+xEpDW5HYJ59BiFMrSknlmCLk+p4091UMa16RRmBOpshHxSILKEoSoyUu5
         nOIRUfW+zeyFE3+2V9LuO7XDgnvWmOAmmP86HActA+1LKM418kHAaCsY/kxUYvqMYC/o
         qNtB6F+Ed9Q0GWbaZ99u1Db5xCVdBJ7amZkZd26aoakvyp5nQETOAz4miX+QCbhAg6op
         qgt3WUcCWZJ6xsrFmkMs4glXIzfdLTLcMJtl5P+Pqw3o+SEIHnZX9dqV1COr4+SrRT41
         RN4GVHkWokS4qsaU5iv6emAiLhgdN/I+cTtqBHCv2dVjuEBIdwi9EArJ3EirpwKZ+VxU
         Y8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWs7LWugNOEDXr9HZuNnwe+zFxJUedTLTLkbXwEgJe9e6jgSWBn1DPYb4jZ1IpJQQC9gtSHQF48VNQWTA==@linaro.org
X-Gm-Message-State: AOJu0Yye7LPinM1HTrL6JTaPPkrXhZrj8w35E4Tl9vIlP+HG+F9XLRxp
	qS84dv8DxWmDgO5aUS6ka9hR+iS1tWWb9hkG0AJUkNiSlBicVjjuH/sC5H+s/9wcXw==
X-Gm-Gg: ASbGncueHBEY2rsmtwrR7job0hLvxx9tPYCJXqex9EfI1/0MbUY1AQRBIcws/0tVoEX
	Ppz0gNy8GSbyryFf9fYeW4zN07nsxCgBona7sKWVSk8AA7TJL/RmlvJE3qpnQQbBwRVwTIHSiVd
	8/fiPkzWVxnZNssmIdg3mmCJGuBtALSTG4YwOz0FL66iWXz35hWtuYtTgCr+koIjY1NkvrXZjdb
	8goxRDH2jtAwyeEBOO6kDFM/yXx2EfWkE0wnr2ozcDs9mq4dDt5uNzYuDi0BXDDhamdbMVzXxzp
	6pSbrI7usxjH/M7oZWPnf2BfXsUeqE84Cogur9qf
X-Google-Smtp-Source: AGHT+IHKmbEWF+VHflNjPvijvEBJAUUzF3e0M7kh8BDmwXSHYHajkN4Dx8oq8wRS2zFmDBQdPm3PdQ==
X-Received: by 2002:a05:6a20:c995:b0:1f5:8153:9407 with SMTP id adf61e73a8af0-20e96ae202cmr7538095637.20.1746409967316;
        Sun, 04 May 2025 18:52:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 21/48] target/arm/helper: restrict include to common helpers
Date: Sun,  4 May 2025 18:51:56 -0700
Message-ID: <20250505015223.3895275-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kWiQrXFdLl6i

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7fb6e886306..10384132090 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "qemu/main-loop.h"
@@ -35,6 +34,9 @@
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 static void switch_mode(CPUARMState *env, int mode);
-- 
2.47.2
