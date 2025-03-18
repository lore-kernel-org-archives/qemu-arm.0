Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694575njb;
        Mon, 17 Mar 2025 21:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUezj1G9QY26DGx1hxOr2olVblYb4mRtCKVplNy3+Eg+NelWD7Ob+bP1MKLGMzFSpaoZAsZDEb3GUfwvA==@linaro.org
X-Received: by 2002:a05:6a00:1950:b0:736:53bc:f1ab with SMTP id d2e1a72fcca58-737223b908dmr18185249b3a.12.1742273494450;
        Mon, 17 Mar 2025 21:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273494; cv=none;
        d=google.com; s=arc-20240605;
        b=P//0sKJqu0G+PJcRJX5Dg+BaRkSrZlA7VL4W1JCl8gpHJ+qWso9iWs5nYPodHUmOYy
         KbCFQhnj+oowboC1ONxNQ9S8788R9bZRK0AX5Pdic3E47xr6sJMUPzwz7K75J2EJeL9S
         YWJAYXCfMr9TarmRHmUWW7stfGvTesigm0wC0nLcShep5dcDIPzKK3T7JI/MkaSyA/vW
         Kbo3jZ6tbPSlVwsH0Ky/NwUUmdKZMblV8fXEHUtbvQ9ugFhheIw/zV7OBnVUeKOOzgjy
         qBvsX0SNfCZzO+AjSQ2Qh73OjpRBx3oOGvEt86X587+JfCqrivQeyNQkNb2U4rjziTGN
         RGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qcqbwr1tVieUFzv+VyvLW43sytu+qG57UDVEiNckHsM=;
        fh=XkOa7HZAbl772HwbK5c00feuSmDxjUApEZ4HtRHqsK4=;
        b=lo7+Hw90Au7ZDVRu8y1ODRASOfknhYUSz+ypc2kr61Cc25TBPEF6CQq4I0vrFvUuIt
         UYWdVGldQY2eBlu/FvqJ7eDVLLzLqxE4RWhijaeZUVPGridP2mnn6sMYE/IYXRUmgoGV
         iqQKZO/lGOwqkJkm0P9piPAlqZnDIr5YjuFjBdj+4KsFxRdPKHAj9MawkNs03FmFslLI
         GUYtJPLA0k7TRlRrOTtlufZ3+RacDldbB+dr52QkptMaIewfV/Mxsc9UqQ+mYV4nV75A
         781eyBfbmB7DLRmHUyNPevYIKFJI7N+l34DiGUNTa+ZQaEIo2BaaaYtMD5sLQHFdeKBe
         IWDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMCxba1Z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73712bcf73asor4905594b3a.5.2025.03.17.21.51.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMCxba1Z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273494; x=1742878294; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcqbwr1tVieUFzv+VyvLW43sytu+qG57UDVEiNckHsM=;
        b=XMCxba1ZFX9M/iqJZ74+2VvmqDIpaHbIAffTaqLZ5ajsUx3EN8f4shjlytTNjtkzYb
         rAWNh/UrTHOaQK5FsOJUmrcb4XYboi405mkL+lxnpS9k57JarxYFk2Y8/DMof0f7VX5t
         QvKsr8eF8X/TEjMGHP5Nj9vGVzKU40qOOBpW/HaFF/YtiVJoFI57r3Pr6KYJsiYSHO0o
         ZsS2kmXlvIsO0JN8vRC0OGphDJ6/Qmo9Ir8p6BQxOcbz8NSgbzptDBGxwsmSsbsjuwx+
         20jMJ6TIRZ5qtm4Pn6xQv+KWeCn1PhzO0437agxCB7W8v6qe/nIOjB8d/ggL0PTUz2Z9
         LuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273494; x=1742878294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcqbwr1tVieUFzv+VyvLW43sytu+qG57UDVEiNckHsM=;
        b=ZdmvRXccTbocBtCbmjMfLFstVis2yip+5jcPn+KyiRopxARGPVUZacjfUP+lWvXkjI
         Rm41epwFeHXOagOciJAftTJEu6WWqOgmRTansN5/LHnKzIwGVJj9jlRDoA7zOM+uOR+T
         PuNX5Sc3eMf0eolqPbpVBormyxJDp1et76y86iQG5hi7btXovci3Yp4eHhLkaRqGkrCY
         wVKJ643Xi8nRtlBVcAuTyuE5fycXbJXqW43+h6x3HRGkm1O1IxWRhcghSbefS8x33pjD
         kJrpPyqN7Bf1AlEQMqoK2pf9uflmkvPrfgJRlC9LK7Spy8q1cIOTO5cAF4mhKO/v+M4C
         JbXg==
X-Forwarded-Encrypted: i=1; AJvYcCVT6lTs3Vmu9bxqVPf3dyKPWDMyylKN73mJeEUyk4S+m5NN769uVmgEnrN7TG2ZmQtdZW7+WsLSdlyG3w==@linaro.org
X-Gm-Message-State: AOJu0YztR7dncCWtcvHzkVcteyii6VwatOOvevUeECwMHB4QNX7J1LMT
	0fposX1MnrCj7GAGaNMrKkXLkQdUWGZ+7jVpzX5DM1Xm8tQN0ndo21hb4mNYACKWKw==
X-Gm-Gg: ASbGnct0I+69bJEU4oPJnk8pcDEeyboVBuVL+vocpTLPQFBKAjSQq3avHzbezsBeBAn
	toRhRHsRkHdn4Xj4qjH3HkGXdPDTZ4yDyBo4ukSh4EGsFYKzHevMDOB3T5NFT0V8/LjC/s++sph
	5HPrSgASl/0C0BUZ+U72+W+Pae6Ab8zDICbxmTN4eb7SeHC+SPudnKOJXxePCW8n2j++nzGUhQs
	Z5EoM9eXziLd0nS1ra+/d1qV9ja7d/SMYZHMQJNEJKPjPVcNGEtbCkwiEp6EVyjcuEtHgRUXVBs
	Ijwlom7i4yTvZC5/A7LKgD5EfQi5YEQ669UBi8SxdGfW
X-Google-Smtp-Source: AGHT+IFfMoeTTqls6zY+hsXszh3yHhLtBiG+rzEGqdr9nPsWVicrdsS6kI4KP9BQloEuNsUFe9nCuw==
X-Received: by 2002:a05:6a20:d81b:b0:1f5:6c94:2cce with SMTP id adf61e73a8af0-1f5c12cd664mr22674037637.30.1742273494052;
        Mon, 17 Mar 2025 21:51:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 01/13] exec/cpu-all: restrict BSWAP_NEEDED to target specific code
Date: Mon, 17 Mar 2025 21:51:13 -0700
Message-Id: <20250318045125.759259-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yMPP+tScrU6/

This identifier is already poisoned, so it can't be used from common
code anyway.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 902ca1f3c7b..6dd71eb0de9 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -34,8 +34,10 @@
  * TARGET_BIG_ENDIAN : same for the target cpu
  */
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-#define BSWAP_NEEDED
+#ifdef COMPILING_PER_TARGET
+# if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
+#  define BSWAP_NEEDED
+# endif
 #endif
 
 /* page related stuff */
-- 
2.39.5
