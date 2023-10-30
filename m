Received: by 2002:a05:7022:1119:b0:6e:5a56:ff6c with SMTP id ou25csp1635403dlb;
        Mon, 30 Oct 2023 10:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH69+HnFdN5NdnkMoOMBQt8fTCdchOPCkzB6Q0nghJeATgZW5qGWGDNdC4lhodj9WzS+/A9
X-Received: by 2002:ad4:5ae5:0:b0:670:f530:47ee with SMTP id c5-20020ad45ae5000000b00670f53047eemr11460105qvh.34.1698687650910;
        Mon, 30 Oct 2023 10:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698687650; cv=none;
        d=google.com; s=arc-20160816;
        b=FKlzOGCNR+QJutnJXPJaelTsfbyti7knSSOaD/YuYP0l9/3PgCuixxugHMFwc2s9yU
         Kdhr7A3z6dlowb2P97MapZKGgq6U5ieXwt4R3w+aCdhZcNTOqHOfeimZw72fpxTjE/qu
         0oLwwAyyOron9iBQIJ5/BtvQQE2zyqWvXHWWdWjY+S9xEbDKH/IFaoJf2gU1WwdcEjuy
         sa1mEIrzxnILnixmniIQy2fImIqu77YtQJ9x0kNOaKIb8BK4KWe83NoQr05sU9Wi+J3H
         nG6MxsX6GwdunTcIPjEHUlGc7eYLPcSE7fvfKVNtiozBJoxmiBPX+Ia40YBsxpGx23As
         IXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HofzvborK1LcpkVXYwmCC38RZdUw8ez62hByMjO3pQ4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=A3HY54B7UZNJ09qjhqckqtzmyLevnv1eloH0Ro2L5ZHcxjkPXUvBItM2vZRlRX/rG5
         +epCEpRdgXlUpE64/anXvEZhL8NU+x3hmbl1mnl/NElJv2nmb/biZQP9FoDQ0PPHAjoS
         Mx2bueoiK78Cts2CXuC6AMW6gRWoKELp4S29NNFpvK6Cz1wGMsjIZ89qi4T2kvt/MWsv
         BrQGcrDPfLByCQQoCdnRjwCO7+aZ9WX0mx9r+BQxmUUaB5+6cQO7SsaA6bPxoD8KqPMW
         T8sEIzGXK+DD5J7OcwPRsk/O6jslqffgNoHl9QUO9kGcOCiaKKSy81Tm3YHfTeg2hZJI
         2XsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BDgxgwf/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a0562140d6f00b0066d04196c41si6390549qvs.143.2023.10.30.10.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 10:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BDgxgwf/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxWFF-0000UF-8A; Mon, 30 Oct 2023 13:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxWFD-0000T8-Pj
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 13:40:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxWFB-0000Gk-Nq
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 13:40:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4084095722aso37078125e9.1
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698687603; x=1699292403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HofzvborK1LcpkVXYwmCC38RZdUw8ez62hByMjO3pQ4=;
 b=BDgxgwf/19Ta4XSeiUK77mdv5w2Q5NOAzrlPNt6hM2e7EjBQ1kvPI1iV9BkYDG1MCJ
 FO+tylecoiLzSm6aHzfxa8UyQ9dOb+NQOx6vRfOd2yiSV47Z4vzQ4Heu7oZU4d9YtH1n
 H9nN804m53YWv6y03SO7sAatkZZpRCC8NYX9S8eHobOFb8s2RBBiQ+7KjaP8HYt0O3DN
 h2weXTZnV3pYPzjUWLTF4PP8ZaPPfkBQBCr0dzENOq25OLnWTEowx6ZcKMWRR0nEIxWt
 +DGtzdC9zi750qu4doXSstec6qUWiO2PbxULkZCZ3SNcKZLZeN+QcT2J2cCeHVCZRr/c
 g62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687603; x=1699292403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HofzvborK1LcpkVXYwmCC38RZdUw8ez62hByMjO3pQ4=;
 b=PbAuC+xC/WPH1son3rm49I5m+NB4zjK60Ojb6yn6u8gJsfAPd1yzN9Sbc/z15lP/eJ
 XhvMxD284nLFujMxvCnqW4f56DKPWzt/EK+Gt3xOhEYZ/LcC+WJRMmWm9kHXHTX4A+3w
 0e83j0jepG8QWRaVY3y2RfpsKAoJYQMVH3NEfJ2RT0hgTBJ5f/iiNAmBQu33Qg69RYc2
 0SLRXJulUCL+1cV/iHnaFA5STclLVIQ+uDOZTVGyIMNb+8Ys4zoaaeV46VaO2i3zrNwI
 vkG7CT2LemEJHW/nUS6/6wo/+ryk7IVthFu4M1yOLq8VbH2ygizNWwv3WhiFlpLWJ+Qm
 ouEQ==
X-Gm-Message-State: AOJu0YxNwknhPkxEvAUCGVY0Nc3SEVmcygD8YR88YfQmctYWZbTsFQl0
 kzBxl64FXXmTauydBWIf/5dhNw==
X-Received: by 2002:a05:6000:1ac7:b0:31f:fa61:961d with SMTP id
 i7-20020a0560001ac700b0031ffa61961dmr8282487wry.63.1698687603570; 
 Mon, 30 Oct 2023 10:40:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0032f7d1e2c7csm5912914wri.95.2023.10.30.10.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 10:40:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Enable FEAT_MOPS insns in user-mode emulation
Date: Mon, 30 Oct 2023 17:39:58 +0000
Message-Id: <20231030174000.3792225-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030174000.3792225-1-peter.maydell@linaro.org>
References: <20231030174000.3792225-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HMhWLZZoGSvW

In user-mode emulation, we need to set the SCTLR_EL1.MSCEn
bit to avoid all the FEAT_MOPS insns UNDEFing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index aa4e006f21a..cdb37ce5512 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -295,6 +295,8 @@ static void arm_cpu_reset_hold(Object *obj)
         env->cp15.sctlr_el[1] |= SCTLR_TSCXT;
         /* Disable access to Debug Communication Channel (DCC). */
         env->cp15.mdscr_el1 |= 1 << 12;
+        /* Enable FEAT_MOPS */
+        env->cp15.sctlr_el[1] |= SCTLR_MSCEN;
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.34.1

