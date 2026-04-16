Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED315F8A15F
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 11:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDKeX-0005pn-QS; Thu, 16 Apr 2026 07:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeW-0005ov-Sj
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeU-0004Bq-GU
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d572f7437so4952601f8f.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776337973; x=1776942773; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dIwRHPjkoUOpuwfutTAaVi/SU7HQoUZrZq1ccOpXKBs=;
 b=Zf4ThHtiesWHKBUPchSIuUpCciUqKhuTdl5daWIFey4/ry4Gxpz19MBBrhJ3SDRbaV
 choMCtn1FEp/oy7yZDMR2LQ7SgzH5uVQyn3d18jJtG0z6D8hH4vI8gQBLwxAdd1f4GuF
 X/2LxcxVU+4UuGFD8RMGenRx04Bha/DnYyNTa1Yvd4oWMyKRLyijwa3qZKDRk5HOPkoy
 HMauHpJDEyKLiw6O/mrIlZUudzHb4/VnkBimZNSwKOGP5S7GLcuOHjH4oCASqGHIJE8d
 6abfp0fjxJEWfAFGOjjsukQHbtWCG2OBxeW3GRh0HmEWvtHndl0Dk7So0d/5491xwFQ3
 53YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776337973; x=1776942773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dIwRHPjkoUOpuwfutTAaVi/SU7HQoUZrZq1ccOpXKBs=;
 b=rL/r3AFFLrW/iMLv36bcP4d/DUQqgZmLA6LxiyspQF+8drS0GgmPAOQSPoBnIxy4g3
 2ajivaoQ2Rry/pPO7979Jgm5IJXI/3uAP+yitY5/jZ71xNWyJjZp/vm1zQjxOyGhl2Mr
 kLgRHYNJeIzWwY9pUeEoRh9lyWLSbTaOdtTacxvDZp1N8Qz/NSRru/VJq4i6QfJwAtyB
 PHlw+Sv3Tz1Kzgb/ghRMXLh+F2PZrEkZ312X/J7XXdrraAmYIb8W5zIsCtdAPQGfT7hz
 w0oAvifDlRN+iCaWIan+AhSGUCPyCsWYWQ7xVW8JlrNFnWzyucX8NvBn8y02CjcvnF9R
 zZNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9g/rTbrBj1mitbPpXEc5Azc8lOPtSff1Ju4+5OIAWVy9sDQJzfkjytqvFUY8Ko6Xjv5z+QhaUuSA==@nongnu.org
X-Gm-Message-State: AOJu0YzzP3Co7gVJABfsIXrMomRg+GW6AL9ZQ23vD0QyITMI1xo0vuFh
 npp/miLLaumMXFggCiPcLLL2jK2vqT0yLETk3HiGyStpL9VpGsLV4krgqputbwtsGGoJSyvq9Ys
 zuVNt
X-Gm-Gg: AeBDiesf2s+fGwxQ8YFMMWsiWC7yBh7xm6di0BesEzG9WxbF9HO5kcwG8pBpJHyq/uj
 odQU7f68c8+Y4OJbrWMJ5gWcnF/FwQAxLUjti5/At7I5MZfB3UKPEOtqrHfOUtYTogEATG9jIu2
 6Gg3x/3y8uDvq8xSYVjcs/FZhPNsnBXAj85+r74PQbdzcJ2kyPxG0VtSW20bAKTUuFeJXhkAFQu
 pnDlhTYiDN4ePkchiKChMX8hwMthYRmUvZaRex/XLhe/+62UTxN0invEoGQB/+k/lOXWZzzZDnf
 uY7flVRIL2FT1pKEitkIOrgpO4XxBb7Dv59jNctcWN3/y8Wyqe4CjGwH7coUQCfRZOx9/f99mpV
 GuaCuxsoSUvNV4yA4zbqQ4s9HstbqN+N4j3K3Nn5bEJoZw9uJFoKvG2kDB0PWB8NFIW7fqoTcFZ
 1+Jop8VegYxmxnhpYyhU/AyA5/mkvwoMrMlGwILMA1INzugRE=
X-Received: by 2002:a05:6000:2c11:b0:43d:7403:4b65 with SMTP id
 ffacd0b85a97d-43d74034c27mr27184575f8f.6.1776337972724; 
 Thu, 16 Apr 2026 04:12:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:8f74:d82:f9ec:90cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead2decafsm11513078f8f.0.2026.04.16.04.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 04:12:52 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 16 Apr 2026 12:12:38 +0100
Subject: [PATCH 1/3] target/arm/cpu-features.c: Add RMEGDI to AA64MMFR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-jmac-feat_rme_gdi-v1-1-d9fa0781ed58@linaro.org>
References: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
In-Reply-To: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x430.google.com
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

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu-features.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b683c9551a..3f2a9a0c36 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -348,6 +348,7 @@ FIELD(ID_AA64MMFR3, SPEC_FPACC, 60, 4)
 
 FIELD(ID_AA64MMFR4, ASID2, 8, 4)
 FIELD(ID_AA64MMFR4, E2H0, 24, 4)
+FIELD(ID_AA64MMFR4, RMEGDI, 28, 4)
 
 FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
 FIELD(ID_AA64DFR0, TRACEVER, 4, 4)

-- 
2.43.0


