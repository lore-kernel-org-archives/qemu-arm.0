Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004289njm;
        Sun, 30 Jun 2024 12:00:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtcBLj9foGuHQBz3V4m/LO75yzAZXrveP7f4NT/HbWPCRRRXwGilQeeADsMF1BZ4VUUVcstfZjtjCxNzJq0HUxuT/+jwwQ
X-Received: by 2002:a17:90a:e2c4:b0:2c9:361c:67be with SMTP id 98e67ed59e1d1-2c93d711319mr3306800a91.17.1719774057984;
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774057; cv=none;
        d=google.com; s=arc-20160816;
        b=EgfzXbxFNkpH1cw10J6gNivQXAd982i3TUc6loxCytij8AXRNP7sndrLSv8xg9jtJW
         E0Nhwp4mjjh09/koM6cqngAGrNpvgKKrhOV8D7Yn9I+u5NIiUAwGBsnn4Zaz1IQ5Dpfv
         Wm6rilojx1zMpFLIO3dV36p66Ea/e2RV+BQBIU2qMHSJ21zJ1QQkYt9W9y/Ci//raRml
         Vc/XBRGN9ckd8rd7X7LKp+Arpr0/2bbcUVQuL45z0YQG+6gPJBX3/TBdX/NqQQTgdmar
         C/zafv0J3CSVNra5wCBbcxiB+yNjWBcczdtaXy+IFSuo2GinLTGKes2s1ZGIPBQYexDx
         XXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jSW9RBr/uXKbMiOwje1wrfrlZqFBsh4is9koj+Xbztg=;
        fh=UzDRBAcIX4QJkvTmm/d/3ylnKcETf6h6XvZTXdOqfe4=;
        b=DZ887o6Vba9XnQMk4hlFLRiZhi4hzneOGXtVvpjWIC10kiwRKJAB86REpjMe3/wemH
         bYeOW+2ACNlfsktqQZEipNgKIzp53MLF4dymiBjK9+YHxnJZhyYjFoxHDYccPyuPcFa9
         2bwJ0gJW49AFcyQLXFrydcx9tqml5bxDeE9Uyfp0gCfAcdEwQPYUC84ViL9+smuvLg0K
         r3bLz7GtWpxDuuduKK86OCiW4cmm2BOcN7k/9X53JOjeiTp0XqmYIddHg3cHehE4LdH/
         3//X9AaY6792Kkypbo4f5S8OSeHVIyKRhu7lYc1RkYWzDr+9Vx+CqwlUucAsrxEJvMfF
         TZsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GK45FEch;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c92d075f2esor2346903a91.0.2024.06.30.12.00.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GK45FEch;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774057; x=1720378857; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSW9RBr/uXKbMiOwje1wrfrlZqFBsh4is9koj+Xbztg=;
        b=GK45FEchwYUD/MxCADUvP2Cpc82XesBYq8Jr2sR7ctziHCAsNKdM5isuEFwJlB2o8n
         SV9gIcFGuzw9DxZoT/Aanwlyy+bKuOcaWFugfQA9BtNbIa01iK+jCBnCF5fa9CGtVM4E
         RrgbI6FR413ZJJCqv92aAcfmQy4NbHcLfJnG5WQd1rrmaSgzz+oZgl7vNkWuWgZo50dw
         9aenRsVlk890OtUgMHd3xae1EjGLPAr/WFSsZVxqROjI5HAY1gLM8B7x0KkW150uJSGD
         d7gFxH+lZsRYTipZI0t7tl1IKpF2cgMyO0aRH7Tj08YaDLQ+TLfo8XK4SAPI4UAURZrq
         V3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774057; x=1720378857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSW9RBr/uXKbMiOwje1wrfrlZqFBsh4is9koj+Xbztg=;
        b=WTx+BaP7sG4NUrsFdyDBsowmAo2jZ9sQpAPLErCzMn/LWAFDKjvLRPXMr9vnU2eQzv
         z+GYsjkr0SP4HnNzD6582FmH8jtIbOkLkKP+ARbtsfWU1I6O3xljRyBkztJoESW2rkaa
         4+j+0asgC9i2bZHVN23El1my1q9CAF3Fjvea6ktCLUVnHrKPgVJ5FnEzzt4oP7Q05t9v
         RwHv6c1Kgmksn9UaqG53PmlxwmmRJEJlyA5fS0YELglZyAM6ulBP3y4WdB67Lj1Z6+Nr
         aSfHnSOSQ5ffIFwz6WC+roa49+XUCUUOLjzGJiN9S4/kjnfZ6ujKOo+K44idcr06lQdl
         mWXw==
X-Forwarded-Encrypted: i=1; AJvYcCUXX6k1ffVsmOL8eJv16/GnpJPMjpWFzHDiLZNLYmMTzSmSx6zfAsfsY6nmhZh2fKqKIIZ4q7ApxisQF+aHFuYSh2kd26QK
X-Gm-Message-State: AOJu0YxGINGICNHHyNJogx7bnRkzEIKQOCl2eznyAkW3PYQVe/Kdfi4v
	RV5pF4+3i0Boddqr7dqOntlbxYV1lsF+tWdFCpgP2OC+avwrPIFA4S7X7k3XSk41/g==
X-Google-Smtp-Source: AGHT+IGa3x/hA6JujaBuuvCzR3T8ldB2DGnYskd7N90qqB8m+DEmuxHJHxVf5u7cDTvBeIUAQ4OleQ==
X-Received: by 2002:a17:90a:e286:b0:2c7:c914:69 with SMTP id 98e67ed59e1d1-2c93d78e298mr3261403a91.43.1719774057367;
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 05/14] tests/tcg/aarch64: Fix irg operand type
Date: Sun, 30 Jun 2024 12:00:41 -0700
Message-Id: <20240630190050.160642-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Psjkv4yiTQ7P

From: Akihiko Odaki <akihiko.odaki@daynix.com>

irg expects 64-bit integers. Passing a 32-bit integer results in
compilation failure with clang version 18.1.6.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240627-tcg-v2-4-1690a813348e@daynix.com>
---
 tests/tcg/aarch64/mte-1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
index 88dcd617ad..146cad4a04 100644
--- a/tests/tcg/aarch64/mte-1.c
+++ b/tests/tcg/aarch64/mte-1.c
@@ -15,7 +15,7 @@ int main(int ac, char **av)
     enable_mte(PR_MTE_TCF_NONE);
     p0 = alloc_mte_mem(sizeof(*p0));
 
-    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1));
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1l));
     assert(p1 != p0);
     asm("subp %0,%1,%2" : "=r"(c) : "r"(p0), "r"(p1));
     assert(c == 0);
-- 
2.34.1
