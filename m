Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778374njj;
        Mon, 5 May 2025 16:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWt0lMAMsdzIsjUE7Az7/WgvlC8lvPD2eV0IHCJt8FwEgiZo7y7m2A8V5EpfFmXZAQ6AjH4kcZfDpDZAg==@linaro.org
X-Received: by 2002:a17:902:db0d:b0:224:249f:9723 with SMTP id d9443c01a7336-22e365ace0emr9817135ad.51.1746487251062;
        Mon, 05 May 2025 16:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487251; cv=none;
        d=google.com; s=arc-20240605;
        b=Q+hYC5Ho0OXoHmOWjNz5YPmnYpi9BUje8iWioiJ5AOTeop6H/IS9bPqueJxO6PFzEA
         DBvqQAPu7+cV/QODOnF1AK8OApIFk6nPeOlPN8DIlBQsi6wI23fga4MKup0JvVZ/RaRd
         GCbPtSggbRrtKw5Eus/DbbREjoYwZiSQPIoCDLj1hQkwbZ5BZZ2fU+Y3LWAy/00nHiVr
         dWwq1y+YfWpb02BLkUXq2YYNHBw5Ru33vLApZzbZ6gmQidKHu4VRAMFk3SKH+qsaDtdB
         RRA6nGravqQG1G+s+ejOKyl3RSfg5Lo7anq/KiiLwViARazpyztey1AynNHBofOBA1hS
         IjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        fh=zydE1rWg0yZMdeVqBpjwiuVEd6kosgQHAJgcFK18Jto=;
        b=h/JFLqXbULs2qtCUV3oC522k5+Hxbz4XXxLhuh8WnBoHZYBo+gyVv8SgbY+uFtWlu0
         o1Phps0okAmPFDAoolgAOQyIWVNVjKgQgSdINBSk8awM2wewqLe2/9GPrl73sf8KF9/6
         7pxXlnZkLfNWZEFjeS5EiHLAW0r4ABJ0S57JsfXXt82oCVqbXLhCJYNxcpJyGDPZ7u+x
         LmM9ug1BlXQxUVBPomTCMyH76SSfQWN9oLeHLt8nkef+Lkcl+xsdhacZM4SXgqprk1Dp
         5B5hODT679rPKQoxCNyDG4RF0vgHLXtNGJE8V9B2jyL7K9uDUBlRdn0xPz9pJRkoHVre
         ENbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkapHn5S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba9c20csor61985735ad.0.2025.05.05.16.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkapHn5S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487250; x=1747092050; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=rkapHn5So1SwE/P4NHHSHi9gZFlzwAOq5eQEYMIDZTMjJ19ybjbtp/qtpC3ApBwMjl
         6M6nThL8CYFLy2ygpenmg1yMQq9iy1IUkM59AUUG2hiHrH2/t60VONhg4LXugt0KmQAQ
         X4tysjIzy9s1Ia6PoR1l1eWpgDNavuwVbRbCzdPBlJzvf1A76scj4lD/9rKLGyBC8VfS
         y7K+msWeb8vIrfK1Xc729CIjPDrcEjac2Pbh/qg9Uyt7tr/Vi9LQY7HsZ9NNPnxZrW09
         2U5vuJjyTxRxVx+GHRZwO7TBZLNxpPot+3WSrgHqkO/b3yeFhhA1pAHMnIe6zlfcgZmJ
         s7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487250; x=1747092050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=WVIKm4PbA+kSCSfQv+8ZALNJIcXVIUUNa4eoMhfvV1eYn9wc4QSUo4CqMWKUFViZwQ
         HNos2rZRjWUUYRWTOslA2uY5PPWOxoUrcghDDrPNCYVH+aNKhVqfAUskDTCWURLl7jFn
         FTivbfVRLlZOfPpVldXuAGekn+5TibmThb7wlP91WMwEXqN85B1hm71ofpleQGp13f8t
         o10CRjc/RepX36F6hCexOqfSyH7F2J9uXBI2N5QTjb4XD7llJ9Fq08gF3BerA22pqK2H
         IMfciw29h++WxX3LUWUNVA6WN3BaPX6cd3XeQ8kXLIPLX2mNbIDM4LnUuMSOYOvYrZE/
         hESA==
X-Forwarded-Encrypted: i=1; AJvYcCXWT3zXY6JE19rCwJy0uxOi59Uz1qLx/bAmu643VL8/nhL58/ps8L8SeUpFlQORMafJIDZFWTQ0Eiawsw==@linaro.org
X-Gm-Message-State: AOJu0YzY0iifBJUhF0/1p4kSNf4Z5eZXwKhGboUkDCFMgqkKvYuMpJ1m
	VSoIDvSUxHx5QjfbNqgB87Zi1Hrxv5fFLoUOUtPj4TyiOBICgja3J4+34yGMN9iZfQ==
X-Gm-Gg: ASbGncsQClynP5CHEOe9BJt69Yx5SxKUd0faWRcjEWKYF+Qv9a3RVL9gfkZs+zHnsPd
	uagUMR5S1wSRD3jYwdKIPQ1EgEk8uv/FKXVQXhCMNm5q1r8pFnBj10E1ENE6eDPEmPot/D5YFGJ
	zIxsLSSDBErDrWsgAwDB6dOvcCRIdRFKSdM3xU/02rDKz9+8EXj7hkvct0qtcfZZ4c2ULQVyJGJ
	ljuWoDl4wFLSlXGsgFY++0wn+HvJ48SZ+ix6PX+kzsvQJFdLWqIeM6ePWxxqxqks87H3dxaLJd5
	vOg0XC6WYO3oIfNxK1IO4FU7b1amwAN5ZWnl1kNB
X-Google-Smtp-Source: AGHT+IFVn+o02q7YLHYWbNJDn25BoizahTDh5kkjLLSkKyaYVzM3AQo7VDnS2nKlNPl290g0JQUCiw==
X-Received: by 2002:a17:902:e752:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-22e363b5382mr9664615ad.42.1746487250712;
        Mon, 05 May 2025 16:20:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:50 -0700 (PDT)
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
Subject: [PATCH v6 34/50] target/arm/meson: accelerator files are not needed in user mode
Date: Mon,  5 May 2025 16:19:59 -0700
Message-ID: <20250505232015.130990-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O/96K/FRv5hW

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 151184da71c..29a36fb3c5e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,9 +5,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
-arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c'))
@@ -18,6 +15,8 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
-- 
2.47.2
