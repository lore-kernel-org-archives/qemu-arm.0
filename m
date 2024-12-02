Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802225njk;
        Mon, 2 Dec 2024 05:14:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeO7GxAdDFov9IcFrE0h4hpzY//CgxoTjDI+BrN7F6QdLwAdgWekQdoeGqEUvD0NjBoZyTXnFSYG/CtQ==@linaro.org
X-Received: by 2002:a05:600c:5490:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-434a9de43cfmr196990055e9.24.1733145272008;
        Mon, 02 Dec 2024 05:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145271; cv=none;
        d=google.com; s=arc-20240605;
        b=JbqSv+vYfOCjUuOKjbwpZpnRsWvmRH4lzWkoR405mjdzpBDf9rZ5zFMX5T+YJ+JaGP
         fseN+wcG7MTNydDC/jZRNrqfH5ZlVoHclsMK5D54Gr7G7Vpg4xsSdl7qCvaLnsyPcx2G
         aAv+jf5UlcsdoZupuCw+PRZwO2BBKJR0MnYz8pJUEk7PUa40BFGuM25kNqBB8VC+AIhh
         NcJqAqk4uwGglzoWk9uyhMsR/BAeILb64uBzfxvnO9mV+3SyIqaSHB5JD+7fg53/gzxx
         mEuWzJRZOEwfhbxpYn4J8/zpslI3eNSk0SA2iv5ck79z2UYjji44RU7SKMjGdKnvtYOM
         xh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=73eMz7OCXkqR25Bej28Tzkpl+eCdRMSro7tB3M4lS/Q=;
        fh=Iv+xp+fJ4mdV46PG3BiF+aUoJsR8uBZ0ofEQJHuSbqU=;
        b=GUTYw62GgLINFj37OazXaK4Ab3R6Z8pJXUCdUhXKAXOLXuu7sloAFddmyWzX/I4eCO
         8L7thzGvYR9z7s69RUPynQ7YPsM0k70TSnYwSPk4UGu4SIiZ7HDNp3s+9yj6/WxoklsK
         Tnbd65Ny6/LQnO4evb/ZnJ5j4nR6cs52RQ+uVyR51iyLZMuhbBrOB8Eo7/IJCgfvVrgw
         JviGHeue7aTn818ud6T9/SYRgO6XSICWsKZTDDDuVgrvIuhDzcorfN+rQ0j3DxilK8eb
         pBssPRme6QxYcSMx2ajpMv+WSSHOhx0ckQT9IBplTbedS1kkb2YBK7Y3nx1kTlENnwt7
         Hl4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iMJa/MJ8";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a2796sor35015375e9.12.2024.12.02.05.14.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iMJa/MJ8";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145271; x=1733750071; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73eMz7OCXkqR25Bej28Tzkpl+eCdRMSro7tB3M4lS/Q=;
        b=iMJa/MJ88rZ37vIOanUqtqx0O/sKoyj6AgYraDq8hoREDWWEMTf2/kXbRZsDf1CchM
         o0ifXNdnURKfpF3z055jA4s8VMoY/IVSuEXsRxaMamURPXphN/BreNU19f+QELVz0Rca
         qf5VUIfTTZ3eKDSaNa3s2JM7+93dwXoL7EfPS7Y3g/8v3z2/IcCduKLr1AqosydcpS0Q
         wS+dPV6n88Vpd+RPhRDHFulLt+1/4mnE5MfRul4jw4gEsHgOShGoiV1TpBEfGEZN8HH6
         lbMXfNRPeIFJDOIcS2kkFTXQ8DozCoZ+hACE4Sl4QPs+NA6K3R2/5jHafkb0ffoKVjKJ
         e7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145271; x=1733750071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73eMz7OCXkqR25Bej28Tzkpl+eCdRMSro7tB3M4lS/Q=;
        b=uaURNRHr8leV3Z33U+JGlcI0pYICtiBSrat/vHipVCPhdRQBo+Uh6KArwWie+E3NEl
         CgSl22mriOx4gegJtgpyUU2gW49t2bFoEsU0eT+suSvJtF+pcrQUiC10vka3F3wWj5x2
         HabcgFq5KzPf0iN4ZHE9BogGOxHjS3EFmFW/0yddoIO1FXeEoc+tBRdl/r3ZYuEUskQe
         e9UP9VCo8frDnQUsTW7SW4wNqiGT+pkL+e84G4SeLwcIK9aJnY4KVXhvGJyL2h6zb5eo
         4XH6YVBMkKOblf364xeeo+aVlzayHoTtRFd0BGUBNNqGYnvDZGAc0xgrdTNRJLVQu0ai
         AHng==
X-Forwarded-Encrypted: i=1; AJvYcCUmyGHcvim6zVkI5smf1zRe/53g1O/+1X4E/F1kiBih83iIur63q/Q+Lj3hy8GQzTJRJOQL1tzgoHVUNg==@linaro.org
X-Gm-Message-State: AOJu0Ywzh37YpZWQjkyeASvKK9k+pCmnMLRl9fo36qs8b8oqg7T3sCoX
	aBNNjhCpi6ZaEsIWWAg7i+Pp9/wiNNzh701LLJZ/EuHrcZ54X6/ApKVLpy6pSbuu9A==
X-Gm-Gg: ASbGncta+mm8PGJqKejXwCzFTpaGK/zeF/ycimD3jO8HkJMBD2Rn7rEoDNW5BUduKPQ
	/VeXaZRcYm4lll2GafJS5jdzAgBTKf/rptETInpsx8iujdncXX4Gew9WWKzhv/jgwGFeidJei9u
	hG+UOe/Y4P1sJFclWD5L2DzD2p5ZD2fTWrcO40x5NsXLZE8hGQAzMQcuBrkq+FwCz670kb+c5WT
	/7v2MLvuijqhnwTgwnnYhp2GTQEB1p1DbYb/S7CYbP1dYlpfeFibB4=
X-Google-Smtp-Source: AGHT+IG2/CSEfYg56kx1cobXlqN2iyYc1dWHh+2d87J+zwUjg8IA98GdHV2ZgCo25GDwnUjwcav3Ig==
X-Received: by 2002:a05:600c:4708:b0:431:157a:986e with SMTP id 5b1f17b1804b1-434a9de43a6mr186298675e9.20.1733145271469;
        Mon, 02 Dec 2024 05:14:31 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 24/54] target/i386: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:17 +0000
Message-Id: <20241202131347.498124-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gnvEqAsh1m3O

Set the Float3NaNPropRule explicitly for i386.  We had no
i386-specific behaviour in the old ifdef ladder, so we were using the
default "prefer a then b then c" fallback; this is actually the
correct per-the-spec handling for i386.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: drop comment saying NaN rule is wrong.
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index a98b4f67ff0..c8bc5b7cfb3 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -180,6 +180,7 @@ void cpu_init_fp_statuses(CPUX86State *env)
      * there are multiple input NaNs athey are selected in the order a, b, c.
      */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->sse_status);
+    set_float_3nan_prop_rule(float_3nan_prop_abc, &env->sse_status);
 }
 
 static inline uint8_t save_exception_flags(CPUX86State *env)
-- 
2.34.1
