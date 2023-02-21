Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2812339ejb;
        Mon, 20 Feb 2023 18:22:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8Er7ZxGhwKCdg7g9sgPXhJduPtFp07mkUyHSpoP4cuk8z6slUKNTKu361nb5RUeo8ZvdY7
X-Received: by 2002:a05:6214:1d29:b0:56e:9d24:bd08 with SMTP id f9-20020a0562141d2900b0056e9d24bd08mr3953051qvd.2.1676946147785;
        Mon, 20 Feb 2023 18:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946147; cv=none;
        d=google.com; s=arc-20160816;
        b=IoCt2IYYy6ks5p4GE6bXGgwuMK5jK5HNYpif7foqdi9hWvVhjbc5Xwb3jO8Yq2QJ5Z
         CJuICzB6XigTEyKS2Ttn06VNzj1MrcTBJjLMkZUrmciLtPmwiEDGqp9S7PxAECqs0nD6
         FUL03ryxTwg1bf8wyp71XKg/Ge4WKgWvfcSbHRqGkg2NlxCNdGMj8TpCHNOk0wrPn6Ih
         ajBfb5MRLjA/ac6c2nLEntKcVBXl2AOU5f2co+pPunRV+ud8byHR81o6KerHJOZ2tNIt
         LXjutejPGqGhEJHH31b3fify44opNMPyA81WMmWV6x+ANO81bEXgkeE+rT5Gdo4+qBJs
         tRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
        b=qD8d6ATD5W7sBLLcfyDPbBzzGNpIyrOJWWx1JKcUgXjb5oyEyBMRYyOBbZLr6zCwAa
         RXro8s7R9WCD2YLjdAGuyLghgHWPXUPDIMoNa0SAotK6Qb9yqqei9RlJkn615PAI48UH
         WbaFF9/7BhAvptRp0apdo5H5/NHD/Pi6bLzxeCPks6XE8CeTIUv4n0Z5XfahTeIkI32q
         vIP0lXwb9KG67LFbcBXao9mTJuna1gBjdPh46WksV55SUDZ67gUBjxvSNrzgpVAUWQF2
         XPuqc/crw0TyA0RaUeCYb69RJwgsWDGOkkhNLruiRRXNT0bAljVN0kGNdh7Wda74sLeN
         /sKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Knk1M/Jd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a0cdc84000000b0056eb33de335si9023844qvk.308.2023.02.20.18.22.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Knk1M/Jd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGc-0001jF-3h; Mon, 20 Feb 2023 21:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGG-0001d1-O0
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:08 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGE-0008En-Vq
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:08 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 ei9-20020a17090ae54900b002349a303ca5so3220227pjb.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=Knk1M/Jd7wuSWsJ+ikRciTVUjGiojB8MLfIppiI52SRw1FEw+Iq3geY9c3psmc8ADo
 xgw4z975tkLnuT2ADIltw4uTMIYK7fVpwrOS7TISy7gCjBynAjXwmtACo0fwnn4byQP7
 fSWLxl31ixs/HzUck+z+gqpTuFJ+STXgfnvKrq2DDg8NcJObepYpTQ19BRFfSB5/vin0
 VYllOBo92AVu92dy6PMpn31eKfIw3PSemmsUgK3xbOW/x3/LQdsVSxO1p1Ci+U6hlJDu
 hIV92TA/DW/eR9rgIe48yZrmtKf0ZvPAFhtLqVYJZnoHCSjzwPLfBknom1eHuCg10uMt
 1o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=wjlKVCC3yBXyigxEojsmDbzhzsr1aYhWNwuAfx2UTJ/U9DnsVgiYoLb8VKA/wKxkJN
 2+XI23DufT3VvxFiQIxhiLnAUb6ECVrrUtBv0mWJATjOmUIFsLMfdlRMbpYkMBfUpoAx
 hIaZIeb+HQij6j4IXqB5jQghzDrUKPxeKdxsV7WymH1/zrsdGjlSKRUoaPA1ENgcY+yB
 meVnYOnINlgSH1VoBbKpiITTAjBROfYfC9w4ev4ZoKhT8ICsX1o4gXBNq7/ObCE0D1cS
 VQwAajmH/U8UNAmUO8CCZq6UryUaDjbpLqvpxBYVNq6bjXeP51Iz+C/YVuMmyXl6ynVj
 FwJA==
X-Gm-Message-State: AO0yUKU0gdgf1QkKNsHyqY6cKw/sngedCjXUl9GooMEIEelh5b5ZumcU
 iFtoEDK9tbmySy/AbQKJuClwxY0IFINSdbw8yYk=
X-Received: by 2002:a17:902:ce81:b0:19a:a650:ac55 with SMTP id
 f1-20020a170902ce8100b0019aa650ac55mr4788618plg.23.1676946005572; 
 Mon, 20 Feb 2023 18:20:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/14] target/arm: Fix svep width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 20 Feb 2023 16:19:44 -1000
Message-Id: <20230221021951.453601-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: ZvO2QigSE1nA

Define svep based on the size of the predicates,
not the primary vector registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 895e19f084..d0e1305f6f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1

