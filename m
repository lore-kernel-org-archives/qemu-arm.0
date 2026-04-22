Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3612F9EDC4
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX4k-00060r-Cp; Wed, 22 Apr 2026 08:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4i-0005z5-QL
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4g-0005UR-11
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so3938849f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862380; x=1777467180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUXCf79/aCPWP+oojaJHciitYmV1hJJUoyGLuPcbhOc=;
 b=jHMRUyFsdX4VzurLVquBXj7MaRnWqtfboT+LxS/l5hmDo5irDjH9h/v57ywQMMdXPW
 2Mvg8OjXqS64X0hoUswMsLFfS1IHcJXJTDjw7BrM7YJA61KrsGgmBVk5Ctj5VYtXQoCW
 Z21i4wZLCxWMwt9FBR8Yy1aqBgSmqGHcwvFKaUo4CHmBpxQ/eOUQ6fP+CaCjxhh8xIex
 EgybwgQ/xwcOkJ5PjdXuuUkrBIyqHoj7RvAE/kKns5Q6oWCQzvs8XjBoiXnDAxoSzWLP
 RLPVyCsGPEcOlGI1gMYoeDjDYjn7m9MAbOl12jnH2xgAmoHleuJVGtBpoHzbFvo1c6gw
 EdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862380; x=1777467180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rUXCf79/aCPWP+oojaJHciitYmV1hJJUoyGLuPcbhOc=;
 b=YQv5JiMlLN+4P9Nq/90mG8TXgtY49lp17YY2dX2FE04gpTpxdlYrrdqHF92d+fx67Y
 AV2PQ3TwXLaBwMY/ayHbu/1bO5X23sw/cw3uudnP65B2PkIpQt2OGMjouxWcUfHGdveG
 +Kyi6wJfi9oms+KaoUcct0LaRrZTYyHU3zxfAb62cJ0qp2gO4QCQwTU+xK4ydTVM3cNq
 LbD4OGoSPp3EizdNbw3MssOMAd6gI8qFlayxgQc9UAB9hvAOzqj+6ABoIeUcF/3yaK4c
 1sDPI2lVg9/HnOWvNHzH8CjOo50RDLf7ER1pmcNUdUmcBqXhY4K8xq6uuaJ4yXs0Hdwg
 CAyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wTL+1xwX8zQjo6lLIG6vuH8wE2CWW21n+XH7Vff7pltmpdTS9zul0mGz1dsvRYlmYGqivQEie1g==@nongnu.org
X-Gm-Message-State: AOJu0YyD8V71oVWBMl8MHXaaSM6D/qlqUBd5OqKYaEaa1Q462CkO8K5H
 /yXIbdT+FoXiRP5DB5Fh/OhqJXHxd0mJ5iV+35zIG4+jrNNxEul4eoMYP+wjfO3yUQTyGvK/q/H
 hlZyVADE=
X-Gm-Gg: AeBDievWkWuNTttVNQpUCn7KggOuOXFEfrb57IC2lWNQrISgugSxZoQWPumZ+rjfmGp
 /zVC3vB423wQvx3G65X9ZDuMzJLx0gCDNCJ50da/QXh7lxXm5gPJtag3PnxgH14HFYJ0nCzLMT0
 Lsj+J440VCSM6ODE/DoUlTGNf1WvPDuihrARyDzTDCWCJ3CnbMdlTl/o/0BK19F3PKACvFZ8s4d
 8HjIcQ/myhvMAQN6iqkjvL32Clvq9YSPfzFqSldHmoOf42NBsg9ZaFqUgOIpvNVJLjKmVyVSihi
 BlTLqkhYAW9CEds2ggtZIBDtZDEqe9JrhpaJ1XqEgGswaS12zr/LZXjWKCw5tSwXB5cwlGxj8Pd
 wh2kXnvg5nYODZgCarqbLmaxCgLDcTX/OX4OCkxyN+nEW9ytu+7Uy5jbnyfbaQL34kzl+Tnlpz5
 KkA3ta79nG9yT8D8OD75xVJeHEljJ3ftbY8YMp4gCfnMtW
X-Received: by 2002:a05:6000:1788:b0:43d:1c39:593c with SMTP id
 ffacd0b85a97d-43fe3dfbcb8mr35169488f8f.30.1776862380024; 
 Wed, 22 Apr 2026 05:53:00 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a18csm51870727f8f.20.2026.04.22.05.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:52:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 58FDF60342;
 Wed, 22 Apr 2026 13:52:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 05/32] target/arm: migrate SME trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 13:52:22 +0100
Message-ID: <20260422125250.1303100-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use !is_16bit directly
---
 target/arm/syndrome.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 63c8e66ea91..61053475984 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -384,10 +384,18 @@ static inline uint32_t syn_erettrap(int eret_op)
     return res;
 }
 
+/*
+ * ISS encoding for an exception due to SME functionality
+ */
+FIELD(SME_ISS, SMTC, 0, 2)
+
 static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
 {
-    return (EC_SMETRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL) | etype;
+    uint32_t res = syn_set_ec(0, EC_SMETRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, !is_16bit);
+    res = FIELD_DP32(res, SME_ISS, SMTC, etype);
+
+    return res;
 }
 
 static inline uint32_t syn_pacfail(bool data, int keynumber)
-- 
2.47.3


