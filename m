Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779757njj;
        Mon, 5 May 2025 16:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBB9PuIQcOvcMF41+gwvCzV04rZ2AaXspivwwXvTmh5TW5ysYH6hsBVwZdQMIECJnYxwy+5poPZR0NPA==@linaro.org
X-Received: by 2002:a17:902:ce91:b0:224:ff0:4360 with SMTP id d9443c01a7336-22e366b10f6mr13090885ad.53.1746487449514;
        Mon, 05 May 2025 16:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487449; cv=none;
        d=google.com; s=arc-20240605;
        b=fJao2SDWmxGN4qG6kISmZuwS5DfQJc0xYdotvkGeLNjsM6yJPEPrLlIHdR/iceQMF8
         aj7OiemXSnbNxCSzeNpOyF7m/iW+waHUnBgFCfIYZU/1oSKC+SlaFLGn2sEMWAKGaY1u
         U0C/y3lamRSFcOpZAwPe+yK/yFUniSbZMjO67jFNi6SMVX+T7Qyr56+XxMoq80GqU29Q
         DpcmOnrd54ySbOvrYxXYilT0QWHtEo+XHbnG/y9cj9q0B5hvXXZJRQkxaSUpHWdZRtLp
         jx9+bSoJrDFt9PxCblG6W0cnjrgX63weHd0j4u4MPGzZM/VYDAmy+S0Ek2VsNiVx0fhJ
         /eFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FePGOnuFMFKSpyGOLnQnHaWTz9W0KMamhZVlYN31tfM=;
        fh=ovCrvmgdoEJUtvLWzB+Pb6xB6yAODMJqArYAOWjPbHg=;
        b=HGrZG7W13UQFbyMsgFrOyKPi1OEKZhWsdyct9DK7VukgIeyUk4b6DUxDkPJ6iih0vx
         6DoxAhfyXmDE/xUbdvGAnKFE40Cv3Fy+7wU5AXafdUvZgnt7fxQKYpWmjIZyBNIgDlgj
         EgVKnwRKOWWD0i3iYjxCin3LsAabChP4YdUpm7aVV9KUB7mmtVvhm7gjIsSB/VYKwzDj
         R3tWlId3QVbJykF5i8TyQQbuLBxoCHox8ah0VeoS4umlx2oqjmpnLmVx7nDHjXnl/hUj
         /rv8Bp8W6qh+hklmY8D/7yWumMTYm71/7dHTVm7Dagh9HvaH8udjunSmxQnmYkNURTeF
         6Sfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giEowHFC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19411sor68788565ad.3.2025.05.05.16.24.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giEowHFC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487449; x=1747092249; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FePGOnuFMFKSpyGOLnQnHaWTz9W0KMamhZVlYN31tfM=;
        b=giEowHFCX0BgwZhQbLYjBrtFsJebKr6dATbZl3I0shB/+Ra3FOaS5QrbvohafLd9GK
         3ZeOpkF19pNTnz6kJnZfvYjPjBHMzt7cTVXSZ/vtkL+gZTwYRAUT0axWqZqEJ3DmdEGo
         dVOAkJYt5wGP7MsIY7Ptt2/q1biRiWt1G63vP3yOCZaopceH0Zq11uG9CqsdmyBrNVWm
         TowsSsfZtc2JvTTBTT/36vAX6pBVoBE8CyPeIM/+DLQTDwW6vk7/l7xySxbFS8y0cGay
         OQoeeyiyAkB/O3pNk5yVN/XSSsyx+pGgRew8G8F8AbJv5VKt1X2RyFcUXJ3Lz+e7z1W+
         z+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487449; x=1747092249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FePGOnuFMFKSpyGOLnQnHaWTz9W0KMamhZVlYN31tfM=;
        b=T6+32Q9dMLTTYJHsWGf1dn6qHXnl49jKo5oyrUmuu7rYRVGwXLU6CMEmgG2n6TuZlZ
         qhb5c1y4FPA/4AnYb8ut/lwR07oEa0BOJmWVaZra1RLZ9DgSBaEdcrpYZiYzPZU3O1Qi
         YxzALMOD9np4bTHi+g6lAadFor/3mD7BHZrBP7YkhQeo3IAsrRFWkoPnanPibWTHf9+W
         XxtgKxi8Hnd2ipTk5vyO8Y4fEFq/VuNqrfbw7NYcrseZXgoymEY2lJEJcNvNB2z6CvCf
         tdyVnIqUuD3ee3EPCFKFCypGGJ5GDX1qP1xkjS5zWUJ3mb7IWxPCeS/zQsLDUZhEg0vA
         jRfA==
X-Forwarded-Encrypted: i=1; AJvYcCXewARk2JB1Sr6SRZRxYeB9K8FmJ2WzfObRcwI6jKUvaCaDQLYPhpL0rx2CrFas6LV7fsEJcWT/cOCwfg==@linaro.org
X-Gm-Message-State: AOJu0Yw23ETn6Qlz28ScvLQqYdPEiC1oLUlSZdC2jrALvPtc/em0wrJL
	Bp0fJlBBz+fHHFh2gi0oTDa87phjooxtR4pX3gGgb/OV60lCXMWhvCfwY4oDJfj+RQ==
X-Gm-Gg: ASbGncsRLnxDBs5rpuQf746zfOxpSQ8BfVs+lvK74JNeTc+S58Hh09XHR68V4Ov7pYi
	uE+yDQ2xhIegK5jvSNtnXvM19FMuN3ZyAGi21Hlf9TUDnMx43H8a5B7x1gDegReRRyJqO/n50Nc
	WWrwm1TSk3BxxiplnLomDF5lbwKHX7B20ATgFnEvp1HW3YLLBorFFrRsvTgn+T7tZVuAiWaOxCz
	lJXm/q+0E33u7/dh1tugm2ltCDxEbOb9Ve3OpD8NHx9Ymh0JrK88ZKMAd0Gq4FU4P7PBgpztjVp
	h0+EbF/RiLkDsZMPisfGeY0ZoXmkVhaBXiYBSS02grePIzJwSpA=
X-Google-Smtp-Source: AGHT+IG4fx0CvaAjKNBoHndxnHIoiD3HJu4nruhwtm92fod++gF3qwZx+wAOg50uRK5w+IBGupV2nA==
X-Received: by 2002:a17:902:d4c2:b0:22e:2cf7:c677 with SMTP id d9443c01a7336-22e364b6de0mr10842955ad.47.1746487449067;
        Mon, 05 May 2025 16:24:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:08 -0700 (PDT)
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
Subject: [PATCH v6 41/50] target/arm/tcg/vec_internal: use forward declaration for CPUARMState
Date: Mon,  5 May 2025 16:20:06 -0700
Message-ID: <20250505232015.130990-42-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CPB5dBOgb2KV

Needed so this header can be included without requiring cpu.h.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/vec_internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 6b93b5aeb94..c02f9c37f83 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -22,6 +22,8 @@
 
 #include "fpu/softfloat.h"
 
+typedef struct CPUArchState CPUARMState;
+
 /*
  * Note that vector data is stored in host-endian 64-bit chunks,
  * so addressing units smaller than that needs a host-endian fixup.
-- 
2.47.2
