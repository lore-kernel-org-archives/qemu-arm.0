Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396946njc;
        Mon, 24 Mar 2025 21:59:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn8kpTUV9r6wa8ywxApDkWoBSz/HEpkt2/nviUSkp7LHZu2ka1UCUVxeHAUFGIjS5LlWR35dJ28yWbGg==@linaro.org
X-Received: by 2002:a17:902:d4ca:b0:223:4537:65b1 with SMTP id d9443c01a7336-22780e10a22mr230535835ad.36.1742878766789;
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878766; cv=none;
        d=google.com; s=arc-20240605;
        b=RlP21YLk3tEi4S+rsnrQRzGST+L+e94S/aJ8uJV3R/SZlQ9CuUbJgz3CP51Us+4PR9
         BYVD9ELjX3lH4mQmHc0kMb84pXAM9fVnA07mMT/lP/yu/olk/0UOaeiZJ85tmiwHk64D
         yMe0ge2Um43UfH0Pe2DysKMtWbIKafn+1F0M5iwbUqAAxsyq7q9mqYmKyQB8O422f1zB
         z8WyMcHqhbXRJ866DDfj9TZooqUtQGPTSviViAP6JRKXMrHF2ywPiSahd2OC7eb9gb04
         K5i8kwlasJRAeCXoaRD+H4eyXf51Lfnzh2NpDKakzhj6m4qgT+x9+/p3f1rCIUBuxlrm
         r97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RQiP5GUFkFFVY7PDaY5zaedRYxLQ4TsTpg+RlxTtlvE=;
        fh=Vu4kE15X8jp01D4mZ3EIA6urel9dEzSdOqBMfXuciB0=;
        b=C2cA5hFJVrrgIuX/ugMRw5KDmJIbZTl8tByQqdTPtplhFgmsBFD1aNuIgPf1sUG3Dk
         OahjBUro3Mw1suOfUDh+smYy7zIUDs/7m+/lEldrnQ8zH5xFCAJEIHEVCkdwewpy/zNY
         2qefK/+4kVZxDxcoOUaiA4PxW5tEDmUwR6aOecLQBNnHHkkJQHvixJmfW3SX68ZYqfmE
         hihP+WQrO4as7wO97Gmg8hK+RmBr9czlySBR6FaDFsVRX3frZAvjYuyB8JpjsghtOpZ1
         Ux6e4+243afE1R5UEa+q5IeUXvkymfC1PB12ldcalYDwDLzDxKvuViJDNU2VeTdKEyD7
         vmEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKWm4b2x;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f8f3ccsor55575255ad.16.2025.03.24.21.59.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKWm4b2x;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878766; x=1743483566; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQiP5GUFkFFVY7PDaY5zaedRYxLQ4TsTpg+RlxTtlvE=;
        b=JKWm4b2x5VVEmjQO0vh4abj+tZAvhvyub/oIJ4tSXPzugcqHz3hPmvZdvWcNEMGz0q
         Njhev6a7YENbbN7O4FbZ4aVUXNA6e/jMZuMVWgnI5Hq5DogixKJhtBxJvxSbWHLF0hN6
         Pan1B8xb/TFY4pzpUwtXeiUXwWXgrBiv9GjT4rY8h0WKTrlDpqLwqRTHUMukbZ8afJkN
         qZLoL45mtbz1kfV9KW51GpByoS/GmJdCaPo1/xs5UoyS9gWcivE2HbMtL5idQP9WXkH9
         VoJ31XRVRS6j7eyKsnN51sDbLGH4TMNvMaj8abVWfSXYzePpAoO1KDNysnRlpf72bU3J
         klJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878766; x=1743483566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQiP5GUFkFFVY7PDaY5zaedRYxLQ4TsTpg+RlxTtlvE=;
        b=b+ovBK0qlv3pcqJ0c+ZR5+paW/C6AE9J9DeP0OiTG93LDEDH371EXzTaOKtE1Fpxqd
         glw71JZ+7nyyhyCHTs72cCP9eqMYieHOdmSY2bmdL1vQrkYHVKM1u4SjFkUiiwOpxUAp
         6DM5LyuVd6wOd1MJZ3Iy27s42YNr5LfNL6Pq2NIaOM+c/RMbbk8R+Qg7nPENNZYkKJD4
         RrD228uoRJI6RH0KLCytDxLKVi4ZpBlpuRpBM6aJ9MIcPbJeFhbnWsv8FqNXdVvb9HS/
         6zaQ8IUyycb/Ls0q4tQOM4NB7hmMxGYX0L7xQQku2sn6rMvoLURN++O5wOGo93UFUCiI
         dv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6rxOuUxyb2lO13n6OYSanO0FohH68bSCS04TsPJgHBN9oJpQaHeWU9SzBlXoLawiFIY8QyS2A8BQHIQ==@linaro.org
X-Gm-Message-State: AOJu0Yw87hgoi/WW4BoMi9ecJcacg8kCuFUZSoTcgdB3cgl/6pyLCUed
	Ruqb2r1V03VyGyh60tAqZlNFxKnMbDm8tJUh+42z/12jj+7lnRujSNp6veDvEh4TiQ==
X-Gm-Gg: ASbGncs6/Clz2nXQ75PdBHUI0NzLlGZtEXl5EoAZCKxWIm3MpzWLXXkgt/EWPaL9edG
	MFMg6539kyvxzf5La9SqsNCR2DIumC1bCvpxYqh4W4Xp63tK4eM+AVchoBCgzExLN5X5BEBxxMF
	FWAWEerVanPEQmIKKhBlRY40kMiawfUtag0kIBJCDToFtU3ECFq7yHa+6QOBsb01nP7/jfe750Y
	e/sDObZ3UNaSoA50mhRXsdyoMzMOTkv/s3RE4zeJEBt94ll39x/Q7Inz0t53Cc1Ro9bHeO8SYlh
	t1aeGOSQ3n+2OUcpXeHN4ccfvQCc9y0VBDfU1IOn/Qlk
X-Google-Smtp-Source: AGHT+IGQVuU0IksPtjKkLrUXDMm+LhK2vYe+xFJfkgcp4bXwqJ47SOrxeScwDJQAOrOoSkVIRFVAow==
X-Received: by 2002:a17:902:e74d:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22780e10df0mr235483485ad.39.1742878766217;
        Mon, 24 Mar 2025 21:59:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 05/29] exec/cpu-all: remove exec/page-protection include
Date: Mon, 24 Mar 2025 21:58:50 -0700
Message-Id: <20250325045915.994760-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mkQShry22tpn

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index eb029b65552..4a2cac1252d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -19,7 +19,6 @@
 #ifndef CPU_ALL_H
 #define CPU_ALL_H
 
-#include "exec/page-protection.h"
 #include "exec/cpu-common.h"
 #include "exec/cpu-interrupt.h"
 #include "exec/tswap.h"
-- 
2.39.5
