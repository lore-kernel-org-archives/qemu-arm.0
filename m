Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4396828lff;
        Mon, 9 Dec 2019 05:46:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsdQrvSOUF7qhc/mtaR8IayGstzM1pD93OZVkwMPNhI5JvjCzitEjXoOCkGkxYO7o3hmLk
X-Received: by 2002:ac8:65ce:: with SMTP id t14mr25002172qto.72.1575899162570;
        Mon, 09 Dec 2019 05:46:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575899162; cv=none;
        d=google.com; s=arc-20160816;
        b=noH9srer5U2uFKYBfDLiPYrVYQu2AJeNLpOVE/k8lP1Bvw/B0Cb6Q9x9scQteJx3iS
         JekU1afIxwNxVNzL/H5fdnYJZ/efg0YtikcKUxKluReRXTzp/8UdQlhYpY09LEeIzsmV
         T1fFsaY1eI2Nyo9y4+EAHX/flAm0nzEYjVLs+kVi19INqVv9q3bnhFPedBEeyfzgCBk3
         SI03VRzEMCkcqT0fMEpLOaEtWVLr5P7/ONV4QhGIfLEjyf/s3I06r30vKDt+Sfb7ypSU
         f00j2IuJFF2cdyUqHAlxFaX6OSWypZG+2YbIV6asL2pdYleN6ZFdv4UttMp02BfQYEtn
         hBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=gxSwZyfeXxijSS52FpvVEEVrVieTj0X+VbLn4u/MPlA=;
        b=gY10j/57eE1OgdOm7xnZ2Yk5dJsZRmRWdpdgpl30avkNj+fjTHIbaycGLGlGI+oDpS
         c3HRUwXDbXWpa7+a5gBSFVtEO9mOGl9BsH8NCF/tcZ2YoKwirdv3bk9FCI1GccavJg5w
         G1z27NQBv8RMnkdyaD1MiY5r9h/N6qvFl2Ts7dQuqL/uRdxGilhGskqij8dPGaSHKl5v
         a93HbGmoA00WVw0UF1GOk48FutGLs0dg6YoTw3JGmlzB/pitKin6VrunJMJaqztOYnTq
         UuqFApWNYyob7pehj9ptol2RE9SMMYRl1s/LeuWwY6gBWl8loe6F0+z3FzfB9j0zx/qm
         MqyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cPvCuArR;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id o45si14244066qtk.333.2019.12.09.05.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 05:46:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cPvCuArR;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575899162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gxSwZyfeXxijSS52FpvVEEVrVieTj0X+VbLn4u/MPlA=;
	b=cPvCuArRulQSABAb1qbQ2T/tlyjogvfP9ESsqav4Ayx0L8gJejSqNGLoXNfzzToXCd/f1y
	jPjeY3FMDdNDaSFDXIq93Whq4I3xLEgcbIXQAJHNqQapGjVwWfs+5TtJbi3D/D474Bznyf
	1bcHOtwy4HORrRMnY8clbSnxA1wOou0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-2wA0zExYMlaUMLVu6bu2QQ-1; Mon, 09 Dec 2019 08:46:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D11B5801E74;
	Mon,  9 Dec 2019 13:45:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-146.brq.redhat.com [10.40.205.146])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345A81001938;
	Mon,  9 Dec 2019 13:45:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] target/arm: Display helpful message when hflags mismatch
Date: Mon,  9 Dec 2019 14:45:52 +0100
Message-Id: <20191209134552.27733-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 2wA0zExYMlaUMLVu6bu2QQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +Rj/zXjNzrV8

Instead of crashing in a confuse way, give some hint to the user
about why we aborted. He might report the issue without having
to use a debugger.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0bf8f53d4b..6bfb62672b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11348,6 +11348,20 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, =
int el)
     env->hflags =3D rebuild_hflags_a64(env, el, fp_el, mmu_idx);
 }
=20
+static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
+{
+#ifdef CONFIG_DEBUG_TCG
+    uint32_t env_flags_current =3D env->hflags;
+    uint32_t env_flags_rebuilt =3D rebuild_hflags_internal(env);
+
+    if (unlikely(env_flags_current !=3D env_flags_rebuilt)) {
+        fprintf(stderr, "TCG hflags mismatch (current:0x%08x rebuilt:0x%08=
x)\n",
+                env_flags_current, env_flags_rebuilt);
+        abort();
+    }
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -11355,9 +11369,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_=
ulong *pc,
     uint32_t pstate_for_ss;
=20
     *cs_base =3D 0;
-#ifdef CONFIG_DEBUG_TCG
-    assert(flags =3D=3D rebuild_hflags_internal(env));
-#endif
+    assert_hflags_rebuild_correctly(env);
=20
     if (FIELD_EX32(flags, TBFLAG_ANY, AARCH64_STATE)) {
         *pc =3D env->pc;
--=20
2.21.0
