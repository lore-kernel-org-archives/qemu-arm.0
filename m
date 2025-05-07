Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94909njb;
        Wed, 7 May 2025 16:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNHiWOoa3frQzzp1m2f9mYxUPwe2B9kVIbGecW2mfeaOL8KnvZheAlRknArrWg9wn0+q1+/1Ro6I+0KA==@linaro.org
X-Received: by 2002:a17:902:ec8e:b0:224:a74:28cd with SMTP id d9443c01a7336-22e863c411fmr18203775ad.31.1746661394548;
        Wed, 07 May 2025 16:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661394; cv=none;
        d=google.com; s=arc-20240605;
        b=XSakn+TA/QMYLLRO2s7oIQykqE0Ha/k6Iknnak0FDOkxzLm/VvHC5nAQy/1HdqyRLF
         K7l2lZcjaCJry+vfC/qg9F1Nu44E8o45Nqi0w4sgtF81gwa4LBSK0KL2zxim7MCIsD3p
         eo+uv6gY7S+1e6iNHcX9+H1vjka+L5kthhl0kighF3jJiZfPszd7jaMZJ1fi5b24vt7M
         qEdUm0saO92nDECNT2GBkS+pxWMzl+J2fwy/Pg/SMr17tzvzFCgdNsUgJMMr5WswtXM7
         E9xb1OzVUWKBve3+FdW0qAs5oitwIuagWmHeddazufZ9LPRgarkvb0ghvD5pAuEG6bSo
         PVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        fh=XC3nliOiYpx5BVf41X90nWQMsstwoFCWQdF/A+noGfg=;
        b=AW7CgUaN2S7mBJ8iFlnolqbQN4mkohGs9JkaISoKgqBtUzXkuhq2vsJkMixtL4oEVn
         X2auX67Civ3VIjueKUbJNL4ONhDQfVKSePFIvVmqL+DzyAfmQFkF6LOOkZV2GuAjjlZN
         lwroJ4uvZQ8ORCuCqqJT790qIq9KthUcMXSYjj1yu+d/asI1sBSvJ4am2xpGLZx43uFU
         QjdpPxIq3HtBLvP22bG+SvYDWzXADnu1MMZstKl3hKKq6LECz7u7Wo5Txin3CwfCSEJ9
         e70Q3hazp57N2YmVQjTnUoLWGpGuLk5yZNlrVWxkbZ8zFdQDJac56Dh5TH5h6VJIzrhX
         tFkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ol81NEwk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb27ba3sor102921235ad.8.2025.05.07.16.43.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ol81NEwk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661394; x=1747266194; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=ol81NEwkRF6CDg4I+G22tngACYwWqmYsj2DEU/SvcbRFOFt8vB5FBeiKV0Es+U5kQQ
         IoXnpWKNpKEU650YzDlsvTqFuSjKvMXpfJPVjx48lN0WZm0LIfY0EWBCE2A8WbsMM+X3
         3lJ3hxwcxleN/45YONCSAV0vt85n1wkmAs1dUF9SaeIPPB2joJ0/A56UhP0WLhPAC9HR
         LlH0Hr2mqeBDIcRKMK+cpfjBBU0YK6DpOFj9l6K2cviExPqg25xRMuzdysuL+LNfd1GG
         1Pakvsr5zpWHM4ukclgWdLDNqM2CmkWy51lz9w5PXKJWmA2+KE41/5SJ2lYWSY9CeMrl
         30pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661394; x=1747266194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=gx8m8D1P5cEHLYL9MaS9Tw9Ohki/0we04zJq42mpUToEo0UTzMF09DByJezkDU+7nZ
         rWByQKoyjmDHQVEOQAL9jWTohT/pqcNXq+OepYixkzRiByuCRRiR6uzTMc//NYI9id3I
         FrhV6vxAWQv+2QX0klG3Hkx4Lxu8uQ5EW1UeSmKJuC8voFiOlOEKZntA8RJoSrPnsrcY
         Zl2sFsYxJeSJH1chqK93fhyrVGY1Ud6w15CytT58dV03elcsM4TRSUi7lSfC+FsLoFhj
         LS2OV7tvyp0qZ4+5uUqBLbGoLIF92D9yVUk5HA0pLD8g02NLytaDwGaUJfW8B62h38lw
         yewg==
X-Forwarded-Encrypted: i=1; AJvYcCWqw0aP4hZBjthGYf4g2sQT/ba0L/G+KZxgxAgX3sPQteV9xX8gHuRYak/1nx8q/F6Ld9+ETz9mTvtlJw==@linaro.org
X-Gm-Message-State: AOJu0YyUBaJN5e3aTk4XjSe5On3NJvvmy2lEL49+tWY0NIXbvoEedFH8
	e7VKl3/BMQRh3Oy1tUEfhF/qRoth3MyJuMKe465TFfAIWa5EPQ69MoXf/y352zu9RA==
X-Gm-Gg: ASbGncv704i5RUVFdeT/Ntjuwaw3bIdrtKb24fjiIwV4bUR9gmk/SUBZo+p0gfitAU2
	r6dotGGXK3R0GqxK0YomTiog1TFPom0YYgs8mlEjTVjRpB8QBuRoI+NiB8Ey8yzsmhomMBeLcJS
	LWR/LF0my1FxLAckd7VICjY60UrccQNW9eAgKS7fb+tZVyUYLfk4qb6idfRzHPxZnVYKVDH+zQ2
	RDjkLX0GG5z9RnAFsfGkXGf5y67L5EtLHPUmQwvuiqF2CiEdRcPD+gFmTRbQgDuh9m4X7RIt33R
	JVWpCm75KnBZBUb16hI4VAE8nb0Bt2HZiF0FIpla
X-Google-Smtp-Source: AGHT+IE1Ej9xQIKVi4bEh4Jp4+ngGN9vsmsLRr556ET3roH8UN+f1PsZNybD/JH4J9gY+Vdhv/Zo2g==
X-Received: by 2002:a17:902:d4cc:b0:223:325c:89de with SMTP id d9443c01a7336-22e856138c1mr20161595ad.1.1746661394133;
        Wed, 07 May 2025 16:43:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 36/49] target/arm/machine: remove TARGET_AARCH64 from migration state
Date: Wed,  7 May 2025 16:42:27 -0700
Message-ID: <20250507234241.957746-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tjh7zqtiktYK

This exposes two new subsections for arm: vmstate_sve and vmstate_za.
Those sections have a ".needed" callback, which already allow to skip
them when not needed.

vmstate_sve .needed is checking cpu_isar_feature(aa64_sve, cpu).
vmstate_za .needed is checking ZA flag in cpu->env.svcr.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
