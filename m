Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp622308lfq;
        Wed, 13 Jan 2021 09:26:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDC496HSdFZwVWmw5Bwc25Pzn45OfLRfRjk5SHmrSF2JjYl4PPBemr5P7f5ChBwjPAJinZ
X-Received: by 2002:a25:4843:: with SMTP id v64mr4509465yba.24.1610558812871;
        Wed, 13 Jan 2021 09:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610558812; cv=none;
        d=google.com; s=arc-20160816;
        b=SsS+pH723wQXY+ybuRbYRy+/FLx9N7nifQ/dQrSHhp78n0jRBGERgCPa7/0ZCEUer0
         rN8Svgpbt+URXV1SNwaPPEQ9lMlGpowrB7SnYRu5o5Jdzdtgt++U00iUSzL+2G82SGAo
         3RiECFk4841aplWa9t3UYnodu5mHx2K0wz92/o/pJb35S2uYfwS6gl/kr4KqSkVWOwX7
         Znwi4FMrsovKo34chbmrGG0ZxiFzYBFrsruu2X1qQ7dpmnkBa5HAc74zhpfEgYJvd7BG
         44Ii8x2UjAfnk/tyqEgEIK6a8xqB0i3CRpzcdOVNpPqIOlvHSfxmYCJ/mgXw9WNzzX7S
         iJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=usrEFBYIAmEVHDsTWIk9Dyh2ylL3MFnazze4ohg6L4U=;
        b=VKCg+w6iKo4sXiGvTo41psZG9hTMWt+ZEku39cZRjSdbys1TjKQH8B/rk+p28TSvGB
         zbNKkkc7F45GJw5bjkTRGo758CU7Een+QW8N2VKLU1pHvE0DISOGLWfXVVGfLVzgpDqg
         Pa6+l0+EMuQw9tYU1uZMohTKYKb4+VqVGzYhB6fmre5zzK49OIRFhcZ2NdpIt3H59sPo
         CVB+z6KG/V7gI/4ekq106DX+Pj4l8plU6Nvyfmcx5D4hu30xz8JX/68D9ZZe5u9WtDFd
         uK5/YXyHNy8gvlY8E7/ubRtlvYIOavolS3ZQynsUQMGl23+jDk7HA3blPopwtsKSlsIH
         ZIuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n+uHkJVJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si2482551ybm.316.2021.01.13.09.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 09:26:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n+uHkJVJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzjv2-00005Z-7f
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 12:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtT-0008OH-Tn; Wed, 13 Jan 2021 12:25:15 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtS-000615-EV; Wed, 13 Jan 2021 12:25:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id r4so2322142wmh.5;
 Wed, 13 Jan 2021 09:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usrEFBYIAmEVHDsTWIk9Dyh2ylL3MFnazze4ohg6L4U=;
 b=n+uHkJVJ6i1JqI7gFzbPdWDu+Gn1CcBZWSKXZ5DOTJ1tjmIRSKgzh0QpZSY52pIMoS
 ya6tE0zpVGf9pYrBpM0V0gdY1hX3kdEEoswJi+UruZDj3KiM8COI3b2Cm+30zvTR1BjZ
 FdxVsiNedQOcHVP9Ar4qTOB3aEe7Ir+xc6wBRyu/nMFcVdqgDfTE03lT5MUILJXR20Nk
 EUnQu7A68Ae4Nb5iP2ZsRqhG8xh78+LEyCFLZF3j4qCJh56hI3SGnzKtTctLMDtVECfi
 1AnBloHq2TlxGjNp3TKAZZUUOGp22B/CKFTdpb40d8wMSeXWG9N+qMQ/h+/6zl4OMqI0
 oVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=usrEFBYIAmEVHDsTWIk9Dyh2ylL3MFnazze4ohg6L4U=;
 b=MW8YCBMiXivJMZAo6BzYrDd1hVPVbdZ9N5zYW8tg+k8WGXZqbpgchF47K5bGVdR+U4
 izVsVyPL+FIWWITLeYWb/Uw8X48h92Cc6GfxOZE0VBn+5U7vO0scQH4w9P3GmNrKiUvh
 T9lf0Ea/ip3D45kgY811D/SY8R9bGC+mIylPtjaUs8GOlR2nuiK2D0wF9JnOzn+tTVY1
 na3XcP0JgHWYYngWvPujFhAgF6wlaRdzY2tXccfOAOUEJJKdZZpMRIbdqMIs7pbSVXBC
 Wmqw07asWKwKAV3YokzKsGas8Dk9wKShX8wmhedlb+VPdDJ9K8QjpwT9UTbtnK4LxoEo
 bE8g==
X-Gm-Message-State: AOAM533GpR6Xb6i9APVnu7+p+/vkPMfcUjHA7EQ2KYJmTwyxtI51iAPc
 FKNyDPVc70IexY25dQ2cFycX4a/xypc=
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr281162wme.184.1610558711983; 
 Wed, 13 Jan 2021 09:25:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o23sm4912400wro.57.2021.01.13.09.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] tcg/arm: Replace goto statement by fall through comment
Date: Wed, 13 Jan 2021 18:24:55 +0100
Message-Id: <20210113172459.2481060-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-riscv@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4TMU2wYxDB79

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/arm/tcg-target.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 59bd196994f..0ffb2b13d14 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1947,10 +1947,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ctz_i32:
         tcg_out_dat_reg(s, COND_AL, INSN_RBIT, TCG_REG_TMP, 0, a1, 0);
         a1 = TCG_REG_TMP;
-        goto do_clz;
-
+        /* Fall through.  */
     case INDEX_op_clz_i32:
-    do_clz:
         c = c2;
         if (c && a2 == 32) {
             tcg_out_dat_reg(s, COND_AL, INSN_CLZ, a0, 0, a1, 0);
-- 
2.26.2

