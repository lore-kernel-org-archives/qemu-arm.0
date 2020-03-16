Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp249890lfe;
        Mon, 16 Mar 2020 09:06:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv62/4AcK76qqBgs1CMUFpjtQQKIW+1B+wsIXLGQ0gFSsKU9yr7NZQSYXP4LtsZprn9Csje
X-Received: by 2002:a25:e792:: with SMTP id e140mr381564ybh.187.1584374819603;
        Mon, 16 Mar 2020 09:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374819; cv=none;
        d=google.com; s=arc-20160816;
        b=scmd4EI+WRG4OBiXFKlPaRiaqc8s9epjigaESiA96OCRl4kpXVb4lfdT5WmeHMKtTc
         Se/qZX5FTu+m7+bNVrCAacgmK3CMuW1/KttAF07D5s635Lb7xy9Ys3ZzlXx+g+C166B/
         AflpHxN0hvFgmQ8aPjdK2UbH+gBkAlYA3eo/9S0xcBEiz80VAkdH9oYwSA+LtGFa9bRD
         Asa99e3IAQI+73uVBXxtK1VPkf5/6IudlDcDjTj+6mss56wBRhmx9a9QuuShnqEovtyV
         jnDcnGHfyFBDMCMuKWerXhdfDOrlWhTP48KBGAlUa1T5eEQxlrwLAA8PP3zonluywCsU
         uUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dGhG21x/brBabH+9g/T50LsdW2AZT9lQa/ZmuQmYRQ4=;
        b=k0G3hVHMv87tArSVyf5KyAeKLEXITFUKHUdjMolBWHH7yeJ92Sm4JvivB8oNoinATf
         sAtjXjYVbppRV5ts8C59N2JEn+tBcOMDB7f7MLVWY5VIUOLccTThnGRef/lgZstvOZek
         KWqmd5ejJXvowLWDn2LH3kQ4QXzb1h/M4xWDgrufi87M5xdiciH+7hwBLW80wcWiw7Mc
         LinrfzFD9vgk+VM51sO7Tcr28ZHwrbUY2OycTGw6Vk3kCNiWNn59Oz1OgQkyQv7st4wG
         AgL8b+8Z1X9PD8iESrRKT7BeZMsZlhbCRWs7cOaDFelvHbVxiV88SWZuSIAgNVjeoOpM
         1WkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WdryLUou;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id s125si132936ybf.131.2020.03.16.09.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WdryLUou;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGhG21x/brBabH+9g/T50LsdW2AZT9lQa/ZmuQmYRQ4=;
	b=WdryLUouN+2Tur+2jPmQfEFpO/ybexozBavfPgSVY1QnPrl+78McH/6BPmtXXLAGJl0hc6
	jP1u9jS6Cd9OcprMJ47FkZ2yIyJ6RqNFfDOIoqUduJmFj9CApOTRHYlMgwOrGZg50QpVJO
	h5kQr9Dvo+oBFe6yYjYON/h2E/tN0Uk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-W40nNKRbP6CIoxq_sEsmWw-1; Mon, 16 Mar 2020 12:06:55 -0400
X-MC-Unique: W40nNKRbP6CIoxq_sEsmWw-1
Received: by mail-wr1-f72.google.com with SMTP id q18so9242522wrw.5
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=va3NBmW9VPeLqbh+njzNv2dIJgLWDq461h5IT9vGT6A=;
        b=n03mfgk7P/xtSmaxZtr/J/JlwOo0oVKA/yLrU1PAtoCuRqfJ6TXlZL7iB7GHI1mJCI
         4i+DDmsbii1Ruzv94r6Qa1afZ/8XNHWx8pK+5hmjSirNuCDxwU1bSh3ikvLA/wQv2KU7
         /gisjhlkjERIlzPZIlnXJFcIFA9Zx0v5bfZQ63zJsSeDTCIeVReI4h9J5FfQVreXHOvc
         7bMGFymA7taGeGb4ZL6ZiOVdxwMDufBpq9nz/U6iy6YqJ3ldqlo4EWMAqpPkz+TogElD
         Ooizdd4uBtK831tu5u9Ljqr2M1ywGIBpOCn57vSo0c+Btlwlcx8R4F/S0gkpcI6LoIyI
         o+AA==
X-Gm-Message-State: ANhLgQ3v/4FhCJbmVNWtteSiPJrU78JU/PkI5RBjRtEpaq8pokPajPf0
	NBEFiVTvJJWaT/X6CB3hHSjhHo6/MVQ5HsM24IxLpu82qXgg6/WNahZvRgEoeVW375lXFj1JcM0
	XbepYw3Se7++yp2pp
X-Received: by 2002:adf:e28b:: with SMTP id v11mr59295wri.229.1584374813952;
        Mon, 16 Mar 2020 09:06:53 -0700 (PDT)
X-Received: by 2002:adf:e28b:: with SMTP id v11mr59285wri.229.1584374813809;
        Mon, 16 Mar 2020 09:06:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id b12sm483914wro.66.2020.03.16.09.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:06:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG accel
Date: Mon, 16 Mar 2020 17:06:18 +0100
Message-Id: <20200316160634.3386-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: q7tevAPQTw0/

Under KVM the 'Data or unified Cache line Clean by VA to PoP'
instruction will trap.

Fixes: 0d57b4999 ("Add support for DC CVAP & DC CVADP ins")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b61ee73d18..924deffd65 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6777,7 +6777,7 @@ static const ARMCPRegInfo rndr_reginfo[] =3D {
     REGINFO_SENTINEL
 };
=20
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
                           uint64_t value)
 {
@@ -6820,9 +6820,9 @@ static const ARMCPRegInfo dcpodp_reg[] =3D {
       .accessfn =3D aa64_cacheop_poc_access, .writefn =3D dccvap_writefn }=
,
     REGINFO_SENTINEL
 };
-#endif /*CONFIG_USER_ONLY*/
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
=20
-#endif
+#endif /* TARGET_AARCH64 */
=20
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo =
*ri,
                                      bool isread)
@@ -7929,7 +7929,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_rndr, cpu)) {
         define_arm_cp_regs(cpu, rndr_reginfo);
     }
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
         define_one_arm_cp_reg(cpu, dcpop_reg);
@@ -7938,8 +7938,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_one_arm_cp_reg(cpu, dcpodp_reg);
         }
     }
-#endif /*CONFIG_USER_ONLY*/
-#endif
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+#endif /* TARGET_AARCH64 */
=20
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
--=20
2.21.1
