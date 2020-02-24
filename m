Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp580172lfg;
        Mon, 24 Feb 2020 09:29:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYRwzzeyd0ALpo/H7uWScGrq6iLf8iYfxyjaJHSY8PvWAjgsPUmxy/dr/Ux5n/prMHJkxM
X-Received: by 2002:a05:620a:556:: with SMTP id o22mr19896323qko.259.1582565370806;
        Mon, 24 Feb 2020 09:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582565370; cv=none;
        d=google.com; s=arc-20160816;
        b=BBHjnokAg2E4OcVpnnusSUAzBqZw8Q0jtDSCw07uRd19iGAi8ADYeX2Gvks7KH8/Ge
         VdsG7aJXKcYmLZhGATazk8CuInaOmGXxn9MK8la923FzcbEHhGtLcB9l9a7v8jd/97xG
         WUDXE0hVAa2fyiBxIdsVUPEbB3mtmilV7+mdbR4O/BvXtwj6cHoP+dzlSpeGTAQP48o8
         FaM5lrWogn8m96pau7sXXnLH2ohC5cOEVumNb20FXj4gzRphsumW0Bk/ukf0b53u7MDx
         0FT5eJSlJczn2PJ35P65FBjmEamlHyxqLO3ZbJGsrWDziki4kB5PSHZdgfXYE8avELwc
         nRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xt89LcM9ze1qIRUu4N9M7G6GazhAHzUjaeGNd8hA1Qw=;
        b=HwWaP6YkdgSWlhSc+qXfjvue47+Ln1Nqez7DnNnzXw3jItAmq7cfodC33kfVZL8SEf
         DCcVF7qQuUwywDWOeuMJx7S+1m/cFggs8vpxoMf+qB14fiCyBRxIwPVyzeMpKEdo7L1Z
         vIpTf/g07sOzqVZZK79DM/AieVcVQYyAU1H2tjZjaxgKZoBHwVadAu8r0Tn9D+LJcAuP
         j0QVD84cEyikElpbaxwgRDoJCxpJjgqC3VuiUxUsnV1CCMsiRz0rwWxgBpLCN1y5taep
         WZvTkHUEWFaTAcwEoNdOz9SSQ2KeNdzJf2+LqPYppoOPFtDMuK2WldFFhA8Qvmxtx6IS
         hCmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsiggA9y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w198si6368652qka.142.2020.02.24.09.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:29:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsiggA9y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HXu-0007M5-8P
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXH-00075X-Mv
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:28:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXG-0001T5-RD
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:28:51 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6HXG-0001S7-L0
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 12:28:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id g4so5020754wro.13
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 09:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xt89LcM9ze1qIRUu4N9M7G6GazhAHzUjaeGNd8hA1Qw=;
 b=CsiggA9y1aMksChk9cGaaPM3PIN6a+nQmBT0VBtbes4aKoRlUdrVO48kbysSyhlY1D
 QEhA6nf0tJmmr0E+fENB2YPSYx9R3gNeupdlIqh6FSRY2Hc/TGuktSoQuZmdEXc63PJa
 vbpaaPqy390mRPs7rutiU/tRVRmX7NsftJaZon2vUR+cbzyQ5W9eebFILM0nF1ZrLPlq
 TR2T7X+XnyDiCCanMApIrhau7GAMS8ou5MhH1dF8iSLtosUhCsmtf43CK58sxUs62/fR
 uXVrVdOsg7UbZeIO6QEEwI0sL1dkQtLC/lz3RR8YcF2LZreMrFNdEOYcSUM6BGsTG27X
 +1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xt89LcM9ze1qIRUu4N9M7G6GazhAHzUjaeGNd8hA1Qw=;
 b=IdPAqP8SkN/yzj4hcDIsO6+K1zAPcFbusrDWeSbUofWa90lxFzkI8+vk4CriSGgqte
 NJqSi2tsYCBBjN5rLAC91JQhFSAxZc+VPeDysPda0co61SgGdmwmEf7mIY6JDbot+eDB
 ZliU7nl9w5xc2wg2YDqLYNVQesCwKBAE146ZhcQ4nh/F3KCOqhibrNo5PoiQiy0dODzn
 J44bDCes9RdlVlBmkzMBI4wmEnk48NWXpIXZG9pgtA65xTojGMJY/GE2/3dgmr1OfIee
 qMXH5BsMZdHywBqbqzlTR+KsOvVwo8EPllKlhIsld7UzmD3VK7IjkxHSf02ghSjvMNVS
 Wf7Q==
X-Gm-Message-State: APjAAAXsKs5hELoQHyiFq7X65yLyQ5T5bP9T048wKX3XyrhJPRoTVNpM
 wBbBv2zT7+MW7ngHHVZORYVCkA==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr66106225wro.209.1582565329629; 
 Mon, 24 Feb 2020 09:28:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b10sm60652wmj.48.2020.02.24.09.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 09:28:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Fix wrong use of FIELD_EX32 on ID_AA64DFR0
Date: Mon, 24 Feb 2020 17:28:44 +0000
Message-Id: <20200224172846.13053-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224172846.13053-1-peter.maydell@linaro.org>
References: <20200224172846.13053-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: abQdPvxBzUrX

We missed an instance of using FIELD_EX32 on a 64-bit ID
register, in isar_feature_aa64_pmu_8_4(). Fix it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 65171cb30ee..b647d8df916 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3723,8 +3723,8 @@ static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
 {
-    return FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
-        FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
+        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
 /*
-- 
2.20.1

