Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179885njj;
        Sun, 4 May 2025 18:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFikzLJe4ZRSNMkhDa62+XZ5/QJHlAwaCzw78+shL2qQnWaDOmFl13JadhFQpqU6mkL/B/Ptom5GiSFg==@linaro.org
X-Received: by 2002:a17:902:ea01:b0:223:42ca:10ef with SMTP id d9443c01a7336-22e18c4f091mr101124715ad.43.1746410188875;
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410188; cv=none;
        d=google.com; s=arc-20240605;
        b=eT8DFm8JzMmRtYS08a4L5vyS1v6c6nNo1wz6TBUeLhG/yAZgUyb8O6JVdQsL10JbfR
         HcfgfCK6ZNxYU4BEE9K1LBo4x9Cd8eVSXpHp7oF399YHx4OfllDrvLxrDox6SxKD9k9M
         f7Mm2ciqAjF8Wb6ARLvRM2FxnCo5qGPgDD9J14xhFV8yioLclNilYNzclre0aoPndPxJ
         /dPbLIf7DG8uTsCdK117d4cPKQnYbe7DO1Hi7GG5HD98fuRq/c9Dps23gMz6Z10sTc6E
         mRbYKV7mtAgEqVLIfzJ7dRRtPlwAu17t7/Uy5yTeghOavxXVM/XGnWMktXXeE1e0uZ2f
         m20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yGt1YesVdMfmP76X8zMo/3VD34v2vwkTupFXjn4DlBU=;
        fh=SP2KyConQWxUjJsxPnAStfXYI2KgPuY6h3Kb2FcR6Gc=;
        b=FTodWKu2fSg/g5JRromA2/hv7364pDzHSL/tTXahPhccQ0fg3f05nLveJm55aR4EOB
         1emDlr3sberSEhyxDiH3QCFemf0tNDr0W/KUuKOvLLRndYSQiaJ1PA9+twxCWpBEW3eP
         SE5XbCx9T1yG+5542nXFoKl/3a3EoE3sU+H29UZ8KrQEJI/S6J0y+D7SH4+I3gvSmuG/
         7Cdq3moTrbB1kXaiU8G5Cb3YGezYJX87xqwgHbqcpKvZx9q/RoexTxu1j3jPResuEGzW
         hwLV+UMqkkCX1wTRzvsMv/NGWXm8Bkm1gb+Evv9EGDwERMWfFDW60MNINZ9D7fy2haFQ
         xqaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJb24IWD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7e353sor45559655ad.12.2025.05.04.18.56.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJb24IWD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410188; x=1747014988; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGt1YesVdMfmP76X8zMo/3VD34v2vwkTupFXjn4DlBU=;
        b=DJb24IWDc37dzhnWycnrpmp5XQ1+L9WoKQR0ig1xe6uvzP89fSu7el82730mR70MFZ
         SeiPK6T/pSkmrEo+ogBI37ojmU9Got2W/hh1zI2l8WJs0J9nNfCBswFthIHLxdQWTibI
         1SkkmZBqpZevANncwQ+mxI4z7E87w8ePyXpX9lwOuZSv8nYP4RQT1VqKcxY3MmGolaUy
         yUYLBlQx7gA/kk2XKQFHgITgcTaZRysJnhPzgfaWwMTll1C/hjwvxI6Tuu3Hdveoaqci
         dAXGV6bqPunPS0XhYlaHnB3Wtpq+B+8G0VPiLI62yWLxAGSxHhBUeUoUHR0oYcQl41bb
         Y6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410188; x=1747014988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGt1YesVdMfmP76X8zMo/3VD34v2vwkTupFXjn4DlBU=;
        b=OAZecmHB7DvugwqUje9qBBreWcNDZvedm/VaXmfg9rMeF1bOLp1ixht+V7Q4AOdg37
         D7WvXMrEJ9AHQtDNZOhasnlst7Y3VNVSj62F+jsOLRodcEeigZVnUw+PsGonjgszCZfn
         CWTwF8icKd2Zu7A0bbw0qrX+ICnfledRZ1PaLf0ae8I5MB4Xj4rKUv4Nd3uavyJZKdlY
         PJwvR+4brYGXDxH0LRoZfaS8F/E63zF0hNRH/moqyNI8hGmaeIymqWV7Z3AahhWlsExz
         5S5/9RXhkMEkoXB6YabrMplJ5v+hQq0rrr1gGPRTb7QK4JzFISWzLruHsPdD6CuiDleN
         PU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5yID58G5edE5eJ/nyzzVtd9oMNC8NIjduNBQvF09OjXdHADguWE1CUN/0BzAYy+hc0MHGP7orubKnDQ==@linaro.org
X-Gm-Message-State: AOJu0Ywd+LDYtwXIoohNsEDmW1oBk7O1gMyy5P+QyjJNUc7i4JtjV+0G
	raa6radj9GqQAvBPYCoO7QU4VxW99T5a6qNSFp2YYE9CI7N6J42cAPcT4Abu1giOVA==
X-Gm-Gg: ASbGnctHL4ohZzUwjI5A9nEdONYjokitjalqJ78EkBKfTsG285ZBvSLxS4u/QTv9dRn
	tvV4q7CQxprvREpQqrU5GsALIaiCn1hJy9zsB7Q30eHF6mAcvBJZDYVBQ7U0/CKXz7ePLYdXl++
	3iyiQF2YP8a1XpqeM/vUO2j9ywj1DyAt8jDolB9wosbGQt1Kze3L1nEg8bVKBvMYdnXCviEcezU
	hjTJt2gjsvh8q5GyXZ18lN6nLw+u4mN7dN+sH0IWcgAxwX4kPwvS9WJKf4GCYrNhJUNuJHDmXCL
	L1Jqhiw3+Z70AYJ3oct014MBCp/Iq2rvGidCk8Xk
X-Google-Smtp-Source: AGHT+IFfSDgDcOkgnrJb7vQb4Qf1FWNpsAlqKI0tyW5JpiO/Eoz46KZiZLg87R1U0m/zOjIMxixIKQ==
X-Received: by 2002:a17:90b:548b:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-30a5aec1bdemr12746063a91.24.1746410188524;
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:28 -0700 (PDT)
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
Subject: [PATCH v5 45/48] target/arm/tcg/tlb_helper: compile file twice (system, user)
Date: Sun,  4 May 2025 18:52:20 -0700
Message-ID: <20250505015223.3895275-46-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oQ3coLlyimda

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 3 ++-
 target/arm/tcg/meson.build  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 4e3e96a2af0..feaa6025fc6 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -10,8 +10,9 @@
 #include "internals.h"
 #include "cpu-features.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
 
 /*
  * Returns true if the stage 1 translation regime is using LPAE format page
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index ec087076b8c..9669eab89e3 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(files(
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
-  'tlb_helper.c',
   'vec_helper.c',
   'tlb-insns.c',
   'arith_helper.c',
@@ -65,10 +64,12 @@ arm_common_system_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
+  'tlb_helper.c',
 ))
 arm_user_ss.add(files(
   'crypto_helper.c',
   'hflags.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
+  'tlb_helper.c',
 ))
-- 
2.47.2
