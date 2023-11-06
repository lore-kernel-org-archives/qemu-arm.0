Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678438eja;
        Mon, 6 Nov 2023 03:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF54NaXfXfknWK71u7QKogg7d0UMNoDQpLYMBInwuzJPaMjlmbUcbKhJzfsGvMyUQHs2qYx
X-Received: by 2002:a05:622a:170f:b0:41c:e027:bd17 with SMTP id h15-20020a05622a170f00b0041ce027bd17mr32210322qtk.3.1699268887486;
        Mon, 06 Nov 2023 03:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268887; cv=none;
        d=google.com; s=arc-20160816;
        b=I/kI8SE54Tzn/TK4ZxbUyP/hSupHLniXOb26C0GBJQpZgN0OfB50uVJBPLehi07wAN
         gX8fgFbmoUiteM/50hPAvjCfIP6Tau32SDMLk5G42NQ80SIXgJxrb4tLIjLxQrSk487X
         bQ8bbnnsvVOhyINgI5kluFZFEEuWd4DPudBgt1O1kLv6firLmdhO2j4VWyV05mjLhsud
         joirKh0bCAc5wbfUkcKsmnrwBTHXM2y4H6Vr1zfUY9lHonh18AmnfzlsvkYDJKefDIbV
         YNDIXmczsIxRCGx8FLUU1dhUrcMPub6ymGavIIkcuAt3c5ZU2/XkaPMX04Fo1Y+L0Aeq
         JQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=pDLz44pMnS6BY17PlhPlXPTDOUKf2M5E2FKcksHeUks=;
        fh=KOGce46xVxY80adwH+7HYjmhGoI2WcTe1iPe5JKSVig=;
        b=dApxFmBV0LTur+1q/XnXPRWHOqKmndugaOiACug7p9QQoBHEz+f/3C0zCiOiapl9OE
         0SsrQc+E37nk0usw6J7RVJq9w2oanan4jC3rmuveGqA/wRebUcfXw/3Pcetg38d/Slyb
         mm61G2/vlO14SDLJRrlS1FC++gS7aZ/gemuXHSmEIc/IxbbY4+/BkoXbvEr5Ni6aAK4m
         M8rqC0kXgcxHAOFuU4ImTkccXn5fFx4jw2Zwruvr5rDtGVkSWH0UyHkMy2frNbtJ9gV9
         WxozAsqxF10Z7nuWBpVOcvRVThyBV593Wm2LvqKQ6UOO/pgQlXcFZPaQOCsBbsYQhNLf
         D6yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2k1mgOn;
       spf=pass (google.com: domain of kvm+bounces-706-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-706-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-706-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id j14-20020ac85c4e000000b0041959d7951fsi5413851qtj.581.2023.11.06.03.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-706-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2k1mgOn;
       spf=pass (google.com: domain of kvm+bounces-706-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-706-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103AF1C20BE5
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C411EB2F;
	Mon,  6 Nov 2023 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2k1mgOn"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291641EB29
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:07:55 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59165C6
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:07:53 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5094727fa67so5758741e87.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268871; x=1699873671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDLz44pMnS6BY17PlhPlXPTDOUKf2M5E2FKcksHeUks=;
        b=K2k1mgOnrFGOSkqX8vuZeNMUc+VoeJLQpSc+AsxYzi7DnLeAYTNtpuxf6f+f9zPMWc
         CfhHOOfQ3NfdefvnDFQbp1yKAsm38+3jnN3oX7Y5vIYDJ4sQSeMJX/yUoBnQNJqwc05f
         CNtTSO78vt834B8vnut/6DbQSbznJ/6qRSVDBId6IQfQlMlookYq6y9w2UVLccffixRf
         WJiToko16SOt9hFcflUpD073AdGm+rw4Et8fPC6LVo9ljQVoKSCCIcbTNnL2kyaXIFlt
         v+S8wZZ/MN5/MZZMdS6P6119xq8vAjJkCsacPUIDvL7kpRgKzeKW0nv78KnLL5B0eHdm
         i+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268871; x=1699873671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDLz44pMnS6BY17PlhPlXPTDOUKf2M5E2FKcksHeUks=;
        b=ES96WkmLGRFMynLNeOLMf0gkCtY9H7gzF0V/B7WsNGV6NjNKD4UkDamRMZV7SN+qdb
         PXL/2J/bHLHA5o5gPFX9QPT5BfknJCatp19xkwKHkCehlkK84X9KPpUEtOu5U7Ypjima
         R9L9w9Bps+/JQbZ16C80rNsT2mfI+4yEEcYuPKwHuVR0ratWnY4aET1+1WVwgwu66Y4r
         olPU8pY0ak5KZ1vsWy3yx4x2jS4GjQi7s5NBf5bq5KLKLbqc/lD3gD2ks03BC0T3TTBo
         ezvDJ0BTTU/7nPrWALU9XbJjqvJzddgG3sDAkl22MFtRKDvypBj3vOVX4/Ln8fuPuvzd
         9J/A==
X-Gm-Message-State: AOJu0YwnU8NpnotAok/15SMqjVOi8E7nn9ZkkovlBm+djoggQeVO9xFl
	AIh2aUzOYJarxVDo/mFo5msYGA==
X-Received: by 2002:ac2:44ae:0:b0:503:38f2:6e1 with SMTP id c14-20020ac244ae000000b0050338f206e1mr18200122lfm.5.1699268871711;
        Mon, 06 Nov 2023 03:07:51 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d6d52000000b0032da4f70756sm9122296wri.5.2023.11.06.03.07.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:07:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gavin Shan <gshan@redhat.com>
Subject: [PULL 37/60] target/alpha: Tidy up alpha_cpu_class_by_name()
Date: Mon,  6 Nov 2023 12:03:09 +0100
Message-ID: <20231106110336.358-38-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: be7Y6HuJBoVJ

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20230908112235.75914-2-philmd@linaro.org>
---
 target/alpha/cpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 51b7d8d1bf..fae2cb6ec7 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
     /* TODO: remove match everything nonsense */
-    /* Default to ev67; no reason not to emulate insns by default. */
-    if (!oc) {
+    if (!oc || object_class_is_abstract(oc)) {
+        /* Default to ev67; no reason not to emulate insns by default. */
         oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
     }
 
-- 
2.41.0

