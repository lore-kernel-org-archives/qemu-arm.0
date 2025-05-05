Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778396njj;
        Mon, 5 May 2025 16:20:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSG9m7dECLggmsfHuZJ8rzIABMWR5YEaG0JZjuzefq4QUIXTfbzUZXyojEPh+O5MrBvkqrurRTBBzpEw==@linaro.org
X-Received: by 2002:a17:902:ce88:b0:22e:17e4:efd9 with SMTP id d9443c01a7336-22e363b1c1cmr11933025ad.43.1746487252805;
        Mon, 05 May 2025 16:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487252; cv=none;
        d=google.com; s=arc-20240605;
        b=DPuQLbmV8YkyfwMIh9/obLSRWy1u5cM3Uts5x3x33bR6xLMpF5OfiaWe4eLsKUu8I/
         PeUJCfQZW8qHEZT1b3BX4WqPoL6iwg+KcCnaWEb26+emVQhxNxvJqr0aQ0KI/Q/vUwaV
         UizAcCqk8Pf7Zt17q1YH0rGRkPE7HYSRspzp5mVM09gLSI7dI4CJXkgXLHm7QgKEcelH
         5ABiYf707QhqMsjmzW8neWdAA9zIPVXA6o2xfS4E9YM6gQImPiS+Wh8n978bfV7zCouC
         lHkH9VIUBbfWVDZeMa/6CwZsbijgtt5kmhH0IveIAlQ5tDQoIILyyh9L8TsMUex3J3nD
         CBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        fh=Gn4FXM/AEF51WYrs/cGzGE/fx/yz6ohpErQwkbLP9YU=;
        b=IiuPqj9k9+MeUd6xTpJPyEcM7US91GKQE0G5AvU126ZvJezR30dJj4V8NHgS2vCph0
         cVWt2A3CQFfaBNO+ROF91LqzFngYIwQftZWug6dXPHBQAa/kzg+fvwUNT2CR7QDkKAsR
         cntOpZ+YJz83OKEf34D1Cf8L9cp1ruqZyhkdDCeFF6/pG3SfmcVcOIxYt6gzKCRUigRu
         S9W6cbBqst9++4oLmkt3yhJD/oi8d1TOjupw5ulr9Dr6w2SDX89V533xM8l38h4IVqv7
         WGeviXkPdlSYjb7rPAf0V52K7PAS6JTJWQ1cy6kHIEZOdRI5Ct6x4D+PB89mk2G+YYx2
         Gccg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kCQTVIma;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19364sor77236355ad.4.2025.05.05.16.20.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kCQTVIma;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487252; x=1747092052; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=kCQTVIma7AaUt0oCjABWAv/RlDhdW0B65VkGgglqvrGN/QfAa8cJT1QjijAXYbL56z
         ab68sbbLtTPWG3hoKdopKyGsXsLKsBflftVJLcU2k2MEg69PqSRkm+PAE2ESj/CmNfVf
         Q6FlZExzhMeKs4eQjtH0cYls5IZSCMBU666l+pBsX6uPF1GwfjWzgHsf0vLTMit4se2w
         BzRcKyFgloilOuBmFmqu/v6rhPhSumrmmmZ0LqKAaQP+lebWu1E2FpgAllf2/Kd4dXBk
         ZZy3P53Xpjgk3WWTEaXvCJe35KWAADfBDaUF5cDjV1fhdg4Oxh9LL4sgDJFPq6rYHlVa
         B91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487252; x=1747092052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=ksUD024eye1E53xiKwa0K24dYE2rvR2Xt7ss9DD4pWd29dg/9O1erXBlcrVbfyVFOv
         VABtsuqXARIIo/gK7d5JI5JjIoYEC1tnLbS1LqGshdLlRNri3uzGNEuZROfWB8WrJTlE
         suISKVhoapvQNONu1m2Dl9oIU6P6XaGPhyMg5zgjpZuEeUZ9L620Ti22xxn4fUJE0/85
         1v/SFmzl7DkdW26a9bXRJn2C4BT6/kw2tjo58tBwj/6gkExTgfPVPw9za825XacClc2s
         9F9MR3oPKPZod2FK6E5RxQ4YufMuHiIcUodtLJsIoCL+UbesiK6DUEdwl4oraXwY/YDd
         NXEA==
X-Forwarded-Encrypted: i=1; AJvYcCXmrmDJlzOi9TqJ/8nQXDwDEQcn2A7tGzKLdRamAcPBM4GdNuGrMBON5irdsXHcDSO6qZzseOxC6UcYSg==@linaro.org
X-Gm-Message-State: AOJu0YzSjSCRtjiWZu4GIQ3X8BuqlSyetmFclroinXdtUzdI6fuDtT6W
	scqH0LFeKOJWsXXOV30bk5zh3fxSJR5M0ztdnANXtRRW+oTK6K8haMLXeiYJ94LN3w==
X-Gm-Gg: ASbGnct1wfguDqJd0XSAu8OM5GzSWEbQ7qO0qQF+aKpBZ7GbxK/cxFTitAVDi+tF7P4
	V+33sWyr7LjvJ2CwPt3vc6LGTrlfQPSLHbtenTORXynhWtVq4+sHm3d+OZAffAdNNA/BMPPlcHk
	Vh2g0ZYu+oOkvV/jiJRJfmgABrK/DwFG3kTNl9l1g0Is4od7X1DgGLrqGqpEUxBk4vt0XhoLXdn
	Ld2XMYuyYq/sWTgOszLRti0TF0tcI6ZeKFkpMgKXYUTFxOksSx13w9tv96eXJ/MOFnxDQEBx+z3
	DdwVv2hkP4V8RcKFjBeySRu6OKYajY0DN3KeYfcS
X-Google-Smtp-Source: AGHT+IFKCrJfIDo/31BgGwDwgpaARmni7MMqsmZbFLEssmnSeYuJ1cHa2Ln0JoRRYGFqfKT1x0RIAQ==
X-Received: by 2002:a17:903:1ce:b0:220:faa2:c911 with SMTP id d9443c01a7336-22e35fdf665mr13176195ad.14.1746487252440;
        Mon, 05 May 2025 16:20:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:52 -0700 (PDT)
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
Subject: [PATCH v6 36/50] target/arm/machine: reduce migration include to avoid target specific definitions
Date: Mon,  5 May 2025 16:20:01 -0700
Message-ID: <20250505232015.130990-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NHZs8on0lwDu

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 978249fb71b..f7956898fa1 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -6,7 +6,8 @@
 #include "kvm_arm.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "migration/cpu.h"
+#include "migration/qemu-file-types.h"
+#include "migration/vmstate.h"
 #include "target/arm/gtimer.h"
 
 static bool vfp_needed(void *opaque)
-- 
2.47.2
