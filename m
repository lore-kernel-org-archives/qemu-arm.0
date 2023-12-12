Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864978ejo;
        Tue, 12 Dec 2023 04:35:16 -0800 (PST)
X-Received: by 2002:a17:906:1d12:b0:a1c:e846:61db with SMTP id n18-20020a1709061d1200b00a1ce84661dbmr6469069ejh.49.1702384516538;
        Tue, 12 Dec 2023 04:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384516; cv=none;
        d=google.com; s=arc-20160816;
        b=OINIC38yTh+4Xv+sTV82X84nsbHtYXPK6JPp00cHwGK/4NRzhltZ3t6clJ5FIX2Crf
         rPykbCqDs4H2cDRlwPzLU+X1ztIJSPpsF3R55NCuOkut8lEI0TfilTPo0fOf3jOGdWqU
         ynGoIA64NjqLD7WwvHh9TiuCq/ZTCjELl69WPXfvj4UJqmgfqUGRFW1/5WB91PXHgV6H
         9Z3+PeOpad1KuG4DV+kZtujUpJrY9Fwz+X/RiXk3QsQEdm1BLKqDfBHso3KC5uP+CYnc
         HVLLf+ynWTDu3iIah+yPQ3nHio+nh7CKTRkrd/ivbAjaGX+1AIhoeuqWoGK3bKkKun/C
         PKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=my60g7IAHtC+Xh4NyAr8rtLaKcoTnKLvvJwkWl2gbFo=;
        fh=uaeyFMM36sIsZb6AkIqDR1BECOcykgmj+fGmoTV95c4=;
        b=R/jRbiU9g2YfRjHwp8oe/zovarwpdhdD+WuCfJu3VzP6+3LqeJDONFC2Q8ql0cZGzO
         248Vz3GwOrL4caUNq/RIB8dJBtMzV0hlcrVEnZJeweMPlWdW7jZ3/YHQsjpeisVPOJFp
         YGF8NtF58wKock9JHYt8OYbuL7dBSBTgDN9JDmNAonh8mDOnwnJ/NFYLFbmf6pAdhsXT
         blqbr3pGNNpfy3ip/SdWCovd6uU3HcacsvHudV2RuIXHPNU3+cTd9ZrICxRKopc8adq3
         N5b5iJk/Tl7h/71naAU/EYR/gpN/vWtZsOm3py6VB+PimBLz698jOvJYfeeE2Fq87UdV
         I1Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJQWHviM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my50-20020a1709065a7200b00a190c3283f9sor232751ejc.4.2023.12.12.04.35.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJQWHviM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384516; x=1702989316; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=my60g7IAHtC+Xh4NyAr8rtLaKcoTnKLvvJwkWl2gbFo=;
        b=YJQWHviMEeIJQVF4osfd8w1aTFGhSnK6HspwoG9EPQPhQZaN6w4wePkKBIN7IBHTNT
         fVlg4PqkStpcWFOR6I2LfzOiZWb9ynCz/cGy+6q8ShzKGgPLROyXwrLkkt3oRCYd4D9S
         eL702smZZfPrj/jg0FUT3+eUCJoSPaHBLatoEmxg76kO4e/dSgEWKGF6M5YqXRHyKpYM
         6iS6BKXMVwOywPOTOsx27Ap/yfb8pnmrsvL5qVQC9bN2raC8aC7zAKalC/XaoKWT6wnN
         0Kqknt3DlPBQZaZxdTZKcyOKXleq00K0eBzjGhemJx5L7hAJAmkHyG9rBjobn+/FE7Hx
         T1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384516; x=1702989316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my60g7IAHtC+Xh4NyAr8rtLaKcoTnKLvvJwkWl2gbFo=;
        b=KN62InvHVk+/kwOrUoFJIfQqwz6ON96Y6m5UKkBOdOfexqdx4m78dvai+C8HtTW3wj
         g30ydx95BKcb9GjaY5Zi/Xl4n37fyBsRGqRgbxluZ5AG71zJEWd7BJW9/D0YALJbtaoh
         lPE1gWq4zleEgjfzB8KTg441f6LXxewEbq2SuLhtQ51Zc3GuPkTYpkHylyrjrqaEHa7b
         MG04fv4qe3fFmpspGEW0c2Fh1zsrirGPGwSTMNg9AArE7l6y+8MrscwBR0y9L/8cszWo
         edW+Mo4EHiMuEAoXKQwkEvvoe+0GyCrWnNcnxGm9YdV1eyAZMa0Gtjlrj5IgcpFUFhIV
         /zBA==
X-Gm-Message-State: AOJu0YwMxKdCIt5U5a7ZZvlcNqXVtXULm0YbvimKI4VfDD+U0p8gRJuF
	27zrmEGb0tuAF0NDTV/JAVSYQnXp
X-Google-Smtp-Source: AGHT+IHg6SmT2GhDFp4PTORsgElZmax2WEunLBgmWsjFP5qNYK4wg1Y/VLxqjo9Fr/AZEmMcrounvQ==
X-Received: by 2002:a17:907:6887:b0:a1d:b773:ae8b with SMTP id qy7-20020a170907688700b00a1db773ae8bmr7213392ejc.17.1702384516222;
        Tue, 12 Dec 2023 04:35:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vh9-20020a170907d38900b00a1d18c142eesm6233817ejc.59.2023.12.12.04.35.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 10/23] target/i386: Include missing 'exec/exec-all.h' header
Date: Tue, 12 Dec 2023 13:33:46 +0100
Message-ID: <20231212123401.37493-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Lg4QS97xgn4M

The XRSTOR instruction ends calling tlb_flush(), declared
in "exec/exec-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4430d3d380..3bb018fbae 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
-- 
2.41.0
