Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42959njb;
        Mon, 12 May 2025 11:05:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWldS/m7dUxIhFJbBRhX6bf3fZ0t8ImwDECrobIwm8atY6+DJ1XHG5lBgOytMnTGd5/96HiKiP7gAE8g==@linaro.org
X-Received: by 2002:a17:902:f652:b0:223:42ca:10ef with SMTP id d9443c01a7336-22fc91aca36mr232964865ad.43.1747073142491;
        Mon, 12 May 2025 11:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073142; cv=none;
        d=google.com; s=arc-20240605;
        b=EFs1kkZdAr43S3nRWqHOseRva8lhnCwrn5bKQye79RoZwSj6KshtxrtpDplPX0yaT1
         F/UsgrYA5zjzvAm1y+Nu2INGBWKKfCBdGXU+erZiH2N+wu9FbIfLZY8XD0kgFosgGoPm
         uGheRXjP+Bel4vmOBdLXRC/hFbRgSCWUI5vLplwi1rPg0L3IA7xoI2z4t67WXEVDpm/3
         vqkLRWeNFBZe6ujasUNxK9obwzuKrGy6G2QpAhIuKnhfm1n5nhkUR3ei2krJXi38qcsA
         saydJ4oN09sJZE1H+xxi3C35tF+mv2A91ZeQCrR6hZeWdFDlTr9M+cqRHOq3ntuLXY7k
         F3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        fh=bzQ9xOpminr3xkdxb+S48pJYxkVesfEfZX/opJBFzA8=;
        b=B/5JSxUNwbomQqvCIx58EP+caK3q+pwYrTTthXxjMiHphmHpDzZEkbbVsqIiCM1Gat
         FLCrO3ZFOyiqwwDGt/oODx3xNKWoy8h6dveGULLOodU5T2KE1QRH5yF+tPC1zFEUE1KW
         gXX4ylXx+zFJ5ZSs71Tjyz0b5CQwndHE0SxQj9fLzcikxKVDBhteK/kHfemusGsM2Q41
         RUPcOxBZelmtz5bMdDDKX7+wT90lSjCIqQV1yiso+JhZSwOijMa/LHPs9ZZhIljzW4KV
         Lr3MzKl+/UUxMLXl/ZZzBtbpEh58muaqfK7uISFLk3eoM+Tm9gi6Zl7a8TtQUNuD7A2y
         gA+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUu76O2y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc582840asor55210795ad.4.2025.05.12.11.05.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUu76O2y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073142; x=1747677942; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=HUu76O2ylRrjMgtntJrYblMrDLSKkDk5iJMNFSs727rJ2C5zAK4h7FfzTXkRtwtiZw
         /JUZWGCBpol4OYsLO70u3N86PkiemmJUgEEGDgXZ0lKRI66Eyj6xAi3nl7rcHq+41mEz
         Y6Av++ijbNzb5/326eXMlH7dtR/+D8PU6yDh5cMc2G9kL1kxyB/rNHrTSLPJa5lbMseB
         tvHiIfq19XTGMEMs1sHWxYbcuHvk1WkRcnB+Jtx1eKpoTjL1geLGEOzS8BsgDbEIlsCe
         8DHLa22X+n/pT5RmauDNUC1c9vYqYZSqfg6rXkhMV6bpbNU2Vv57DX92mtIBe5WfIhmy
         MERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073142; x=1747677942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=rTo4gnxRuaPv0GDK5+ROwmccjfGGfIzCw67VLkupV3n226xdNl9Ke4SNZQb794NWgh
         YjW0ai5qa6SKdZiOzZINznl431yix6L80HxIDIMlFdFtW7ZFLd7fcmu9rpXFSZsfykce
         YNwjMXLrexIoh9T1xuuDYwg/1jFP3d/l2SCXX4ka/H2q4IHZ+DpVlGHwEZir6pXBirZb
         tX3n2lLzF8NE+c3GdS1JQ91F4FhXXpWfgWYwpfDmaT40XpWNCs4cSciEOtPy9DPhms1m
         d/J+ecd9szZ340YmjXo4t0umDz2iyYqlajezLDmjBKxI8uszO0j0mRslqlxn0dhBOaei
         VYDA==
X-Forwarded-Encrypted: i=1; AJvYcCVP4dn9KWr9FnHG4D7HtLu6BSYTfuAqs+gpP6KxNrG63EGiUVhJc2O9Ho/r0omjQL0Uc4oA8b5GEVsEhQ==@linaro.org
X-Gm-Message-State: AOJu0YwvHoDZw+7sa3MmiSA+Hgm9o8uEuV45fGjJ760OCi9SU6Zya7Cj
	oObgVWQ58hzNnFzE9bnm7V4G0iWjBaD6BDOcrMatTdRg4k7PO5OFnu/E9SXFajc0kA==
X-Gm-Gg: ASbGncvdW2iiWR/uWQBsiyLvHFgajzvdbsEiLefZWwbX0q12semQSJjQFihLSSnFJBV
	XECX+NgKdXOy77+zoANm7mAbKFmangEEY3zk28Ni40F60n99d1BdqgowOhaYckmrlOS08Jprjxa
	GSOuEHyq4cyWxCr+mVqZD2hcINvnEYM8nGMKFam5ErcXzXj2XiyKYzIVZ0XwFfIUiRG53SKeKup
	86sNzz2YmYhl38/B9Zw1tjZEexOYz8anGS7QCDqMpT8FzYEVv6325RJGLd2l0bYPIz6o4iuZ/HY
	m3AtIlGd24tjc5NaF1rmbEzxaz3pdHk/vFPsPH5SerwbxVj0Hqg=
X-Google-Smtp-Source: AGHT+IGDr/hFIV7zSeR1MqUCWj3qYIVaOAhK58NysAKE8oD7L9hcv/5zp8VBN5nkmjJpsYAWjgK61A==
X-Received: by 2002:a17:903:32c1:b0:224:c46:d167 with SMTP id d9443c01a7336-22fc8b51a28mr201435875ad.16.1747073142056;
        Mon, 12 May 2025 11:05:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 34/48] target/arm/machine: reduce migration include to avoid target specific definitions
Date: Mon, 12 May 2025 11:04:48 -0700
Message-ID: <20250512180502.2395029-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FyDdn5C4RQvS

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
