Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756632njj;
        Sat, 3 May 2025 22:31:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXT6i6vf6TIf5vj7k2x6gDe4Km/cXfdTNrsvHps78CEyUTnpCzSaaHBcmJzS/F1P1IkJCVchcpIlZBYlA==@linaro.org
X-Received: by 2002:a17:903:283:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22e1ea584dcmr53990735ad.24.1746336592805;
        Sat, 03 May 2025 22:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336592; cv=none;
        d=google.com; s=arc-20240605;
        b=SnX3Il732yIY5B2OT9p9EWUZlboaABrd8pf/fpg6rJdGm9NO14eB18Pej4+xd/sdCB
         AQMkoD4VLDrH2ZqMxyJwR/bS8T9/DmlbJymO6KRBAVcyZVpKnn/vP4oczZn9kT+PNLVX
         API/eYaqZR4hzgyuISuK2L/h8lqUHIb5sTlHiqgFjcSxmCa1vagaaOeFTGnaweAOs1cS
         ++Mb+VtFhR8n9rYP306rCAKriDVpPyQ/KU8WBcXmfotfkEudhx077PCoOZPCJvLoAFif
         9ohsYm9eYaYPiph9DLLMTtcfK8jTfEylJccvlyq4GtBckZ41mpve7dRjPHzFnn1a8xoa
         zR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Dgq1OA4KuFLS5XceK9ZkHI9zBCVx2Be38qBE8eQ0ZbQ=;
        fh=841q5g2eBB58FbNJhofSyKxzICp6e6DYifrtjRFg8p4=;
        b=L81xrJT0nBByzePv1LVj6alGIjKbM5ABYCPI+oeJYXgT9ZFpPKTyCbTOWwgpN2ArMz
         //aZtZPMH0vGKvjV0v9RNhxrVNmlWNGl8er5CPWrEePeh/kkt/kDsrU21u6pzcpGJJ9x
         /Y3hO8+E1WQLMPSuYYCI1QF/6hFW4MdIemMjRnT+Pv4oWXMLH065pJZqyDinZI/TDmDN
         IZyqGbVMNWFQz4NozPirJYFjP1K4b5LoV8PCU7jzl6qzfKDvYDi5fP+atF5UU0uKR0un
         uzkj/adwA/c9Xs/L0N7IFQTrnkzf8+Wf1X5uxNL5SFi8vO48rSK+XzG2ku+GyoAq1Y/6
         CieA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bv3Qd/qa";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8ba6fsor53496185ad.15.2025.05.03.22.29.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bv3Qd/qa";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336592; x=1746941392; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dgq1OA4KuFLS5XceK9ZkHI9zBCVx2Be38qBE8eQ0ZbQ=;
        b=Bv3Qd/qatqqMZn7eBZkbxtFSO0tngNlpOKQXIX5qW7ni5Mr4K0Tw7CDXzE9CbkvIaP
         Kp+v5Wi7w0zGu6hoHG93U5WoNA46pJYA7Xf5mFJFx/GKaIN92Zs4Gg5GBxa14rjyBB6X
         D8TeN+0tQ3riWrjkEeOpZsKn3vS+fdQHCns4TRgxwFE0505G1o+1B3Orix6CfKHA5ee5
         Cjdyp+D0oY279yNstJ3HOPmZGP+lLbwcR4qaMxN2fHecZlYc064ajfUIh0nWHje2DDQh
         iqraNaQo5d+s064LPSMQ/QEce0NFbyiRcWYNbcJwLpQNrEaci6RctQyNzOgqemW50iFX
         Fu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336592; x=1746941392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dgq1OA4KuFLS5XceK9ZkHI9zBCVx2Be38qBE8eQ0ZbQ=;
        b=r9Dysdh6YwQQ9N/AeqckegwhF6xY61rphmB+GiwcScu6t2nml/WfiLC+e/IBBWpa/9
         VGHSKN/HEgy+vvQ59u0UvcuQz92dzmrvvybayAYtyXBEVcZ681nWQIoqoDHePGxO71hW
         Mvno1xu+5ywxjoyJWotIevSdm5KRRIs+j3sroCKj2FfsCGsh6rgNIv5cvx4p9tw3z6BO
         Je3WcFJ0F5PkI8O2u8JSfdu0/M9I6xGymV9XQZZYKgS5Gw5XZxfGX8HdPhupjPGofncV
         J67qr/LgP+jHA9GspSS1Z81uVDfK7XuGDZ1R0NyN3FGPPt4masSMEsR//o4Fy32AnN42
         FoYA==
X-Forwarded-Encrypted: i=1; AJvYcCWoW3BQ2+QD09vY710WWI4HX0zy7HFB3Sct9naBgB+5PhG+y750BEdhq4DPhDZleICFF1Up2+ejD/S3lg==@linaro.org
X-Gm-Message-State: AOJu0YyUEBnTyMaSVpfteqtFbXgQJCIpgxyKzs9TUTM0dlF3+NTZ88qw
	vg4aA+4KZ3PGmq6YnmzrdW6IYAQQ7JeX2NXsuoQiK6UMtO5ImQhA6jJBPx/Xn0u8+Cic49sLkF3
	yeCfIwA==
X-Gm-Gg: ASbGncvh5kPsZnvfi5aQIlICLAO5qKQ8RUzGZOOJYAQXKI+aR7xIRFL/zjz3C7vL72X
	dMAzfvpdw7muDOvPywH50JuTHPzezoDhuvhQUqSvaRk+U5pTvIpyF6ecbe9zU0LtD71pXZd3beq
	rjrqc5iLajXs+9Z/YAZeyvN1jPskkyrbSJmmrbiN1kfi/moMTNY82uY1s2BcQHmBEkoOuIoIUh/
	0hJ2R0dOdr0IrIg1oH1w8qYTqGWq8pv/o1eVjoKeWBCSRKPcShY5aZwq3IZ6u7PAHVzg2hg6Vgk
	JXx/IyRLl7iKv8vTtPITDSJMttUE37RgVyBpK50J
X-Google-Smtp-Source: AGHT+IH3PkRT437ZbtLEUIz8+9AOsGuVI8JqwVpnwH0hHYHJ1JXGA0CKFFoatJYNym7SpJ/H7Tlzqw==
X-Received: by 2002:a17:902:fc86:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22e1ea7c667mr47948295ad.28.1746336592452;
        Sat, 03 May 2025 22:29:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 37/40] target/arm/machine: remove TARGET_AARCH64 from migration state
Date: Sat,  3 May 2025 22:29:11 -0700
Message-ID: <20250504052914.3525365-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eGs5ytEaqFUF

This exposes two new subsections for arm: vmstate_sve and vmstate_za.
Those sections have a ".needed" callback, which already allow to skip
them when not needed.

vmstate_sve .needed is checking cpu_isar_feature(aa64_sve, cpu).
vmstate_za .needed is checking ZA flag in cpu->env.svcr.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/machine.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index f7956898fa1..868246a98c0 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -241,7 +241,6 @@ static const VMStateDescription vmstate_iwmmxt = {
     }
 };
 
-#ifdef TARGET_AARCH64
 /* The expression ARM_MAX_VQ - 2 is 0 for pure AArch32 build,
  * and ARMPredicateReg is actively empty.  This triggers errors
  * in the expansion of the VMSTATE macros.
@@ -321,7 +320,6 @@ static const VMStateDescription vmstate_za = {
         VMSTATE_END_OF_LIST()
     }
 };
-#endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
 {
@@ -1102,10 +1100,8 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_pmsav7,
         &vmstate_pmsav8,
         &vmstate_m_security,
-#ifdef TARGET_AARCH64
         &vmstate_sve,
         &vmstate_za,
-#endif
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
-- 
2.47.2
