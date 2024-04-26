Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638675ejb;
        Fri, 26 Apr 2024 12:47:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXJlD8P038Px6edM/AkPjlK9l5EQGgc+WPc/gJqtfN6VPcRU60lZ3oAHTmuEcZYiwSvmhiFOU9J6OIhhFCuy1lpoqx7JYD
X-Google-Smtp-Source: AGHT+IEaawBuCS0yEL5Ylc6XchnTyXp/N8DpHOXAwESnNl5T+P4CrWHkfvKry4J3g99rN4cqjgEU
X-Received: by 2002:a05:622a:11ca:b0:43a:4870:3f3 with SMTP id n10-20020a05622a11ca00b0043a487003f3mr4759354qtk.21.1714160831223;
        Fri, 26 Apr 2024 12:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160831; cv=none;
        d=google.com; s=arc-20160816;
        b=N97c3bAkMmRkd95Ikn3KNE4RQ0WUre6+tSCN8hsM7u1EC+rafXrw+504jgBG4MQ/jY
         a182MifyYDCRbKSZSu499mdu5hrnxJWiTTpors5Rirl6ATa74MXtlcbMGTZiiaLycMom
         T+qlkZufd8Dx8h6SyonGLAShYzIrulBHEawe0QvSOjVyl0uczBE2CZelJL7qPL11T9HW
         czJ7aCtU6vDpyU9rh+kQIqCVma0vmPRrMRf8F71l2Smt4ESG22nZAcy9XVORinXfOGpC
         8MCpFM45M6GsWLH/zn0Pva/JR+Y/8Uc3IbcGw/5+xQhi+bEp/zJy7SzW1UqL6gR/WMj9
         CMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P0UDCxOSM6losMm33QUR2Xxw05S6cfuoGa+9agKli+0=;
        fh=5/3pYq1KAvHonxEvUpwdHvaCf4rwzSKbdhOfqjldFeE=;
        b=uJG4FlBoYyxjJaEc2UAheAXCebMGIk42xs57JgpngZzswPodnu/zh0hVvcZMYggoB3
         9LM/ys5AwSWhZTl/Q/Brfrfm8k7lmXk6QMVawV8R7f46izNXS56kmSeI6E9cpE1EA+53
         UmTWpRdRUFLBHLPPvK5RxR1Qj50yOltpkeJIHcV377QbEItYkfVsDf/DRirWqGi1g54r
         2IQW1OpVPa1+9j8oksdgRpkBfKNT/CfKpg/wAabO18T2DiFxAJjqqBSWWJ6W++2Y4vk9
         d22lx6EO7o5//xT0h2OAVTX9KSXTZ31Oxi5j3Qs9OpHpYY3BpIA4CfQ+HOw97sU2Psnp
         zABg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hssJiEDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a05622a191000b00432c27f369fsi21025201qtc.763.2024.04.26.12.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hssJiEDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RUw-0006tO-AE; Fri, 26 Apr 2024 15:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUm-0005fz-Rz
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:33 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUk-0003ls-Pj
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:32 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so30319531fa.3
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160669; x=1714765469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0UDCxOSM6losMm33QUR2Xxw05S6cfuoGa+9agKli+0=;
 b=hssJiEDIznYtgjxnv2AnEtq42xHsqFoFgxpuwgpNzpR3pnfuMwY75//9Cdpkzqxjl1
 Pb7VRJJ2mLkAmavmRO/XesOFuqqPTlpycf6bmo3t4PEbpnaBRsFZACNjxZ5Za3iIaKFz
 Q5aBJGBu6lPd/mIp4zMsS3avvXyQaP4ltArfrGKTcVVVKnCnqOCtE1QLKPvUmlKR4v7F
 KXo68VU295XeBC27YPuG+a2Cs8tcU+ot+5+zFXqXbYyu6vtoVj9KEskeLs567sDESqzl
 Xp7BU+iax2D+7kOVUK6ZzfLilETNsUlvBPN0t3ntKRglauPEBxtNurP3YoH/HiGH5W6E
 BSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160669; x=1714765469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0UDCxOSM6losMm33QUR2Xxw05S6cfuoGa+9agKli+0=;
 b=mjKUQjfKJfMsRqaloctNxbxi/c3wVgA/eugQLqjZ8faZ65bensTl3EjUSXchbQhNqk
 f1Ity9n5UyrzHEMF7DqoY92fKisjmVTR76qYeQjDtKXm2Tj1KvqVdqalp7i31px/+kGj
 fbpUM6x/hTTcNhMTWTqUYt7wmPX0HxFMyR9NpAEDcRRG7HerSrFmdT7Jlk5j9QGBGruv
 rhfoh/Z1dla1E+SXVkwyla/4e3zS+N+u7ZbsNhyblvdF8YJNC2+bnoBXcpdcDb3NA30D
 g36GVgSknB0X/nuvFzLYwwHlLho772H41x/Ro2l8ugxuImdy4RUrxYKWldOdJj49ipdH
 gQ4w==
X-Gm-Message-State: AOJu0YxuuhOR0peACignPg/7TOelNYh/NUzydfR525lIkFiM+zLHihDW
 izrBHtb8zfkJlPCdqBWR57TQYZHmU3wGfsXLIIi3jN+541MSzfy6neulV/arGnVh+x+rT8L+u3A
 Dnrk=
X-Received: by 2002:a2e:950e:0:b0:2db:2397:1055 with SMTP id
 f14-20020a2e950e000000b002db23971055mr2054988ljh.9.1714160668962; 
 Fri, 26 Apr 2024 12:44:28 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 da25-20020a056402177900b005700024ca57sm10440528edb.4.2024.04.26.12.44.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 25/38] exec/cpu-all: Remove unused tswapls() definitions
Date: Fri, 26 Apr 2024 21:41:45 +0200
Message-ID: <20240426194200.43723-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1ch+JKTwEH5c

Last use of tswapls() was removed 2 years ago in commit
aee14c77f4 ("linux-user: Rewrite do_getdents, do_getdents64").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20231212123401.37493-15-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 4de0d5a0d7..7c44ffb3af 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,11 +38,9 @@
 
 #if TARGET_LONG_SIZE == 4
 #define tswapl(s) tswap32(s)
-#define tswapls(s) tswap32s((uint32_t *)(s))
 #define bswaptls(s) bswap32s(s)
 #else
 #define tswapl(s) tswap64(s)
-#define tswapls(s) tswap64s((uint64_t *)(s))
 #define bswaptls(s) bswap64s(s)
 #endif
 
-- 
2.41.0

