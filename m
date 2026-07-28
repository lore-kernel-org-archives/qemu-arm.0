Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6A3C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:31:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonSG-0003Ok-P1; Tue, 28 Jul 2026 15:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSE-0003M2-Mb
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSD-0001XA-8E
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:06 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so217650a91.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266824; x=1785871624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2LOuBVMlOe80id4VIdSsW07pBBJsvlGWj514CqDOCv8=;
 b=gIaxNUQsYS6dMjR3slJWeGxAZPbdBXojT2vcwNr9Sx1LG8ayLRv+1TSaji9pMmJ1BK
 kIkSehRbIjtx7UoYTfD6g+fpVfkGK08V/OG+/WJXFrQiSehpmKAZJ4JQqDFNjrhr5f8r
 clgLISZW/2QSdKPaKFBH/F9FyrXxn+W1eJCaScShazFnKmg2XKwszh21rSgv3drZxZNY
 qC+lYDpY9OSR9cA7H/Sernfi1wTgKv+pGaOmTag9eH+Kja/yLgxHp4UzzXWhS58fQAMl
 qdV6Rc1VIm2tuzklRiLKNCYwpNZ2YxeWbP/rElUc5bdhdsFw5QOCwWFGshQDUzl9BW3W
 7Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266824; x=1785871624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2LOuBVMlOe80id4VIdSsW07pBBJsvlGWj514CqDOCv8=;
 b=XrBQCY/haEwIvYzJ6/9lowOJUP7XOnvwydxvQgKX6zTtUL103WU976YTJfdQUJkEyE
 MdVni5DPjsVAfV/JO2A2HHla3JcHpalB4jeoinMK8vZb7+197GZQXUxqTSliQVqTYNG8
 kwgJNjBQTcatDfFPOvTTsD6NS4WV4uujPkaURUkywFq/22n2vRuYPSRYt55q1ZMfT3tP
 GEk2K84ULfsK8frhJFvu7XFMRpdsP/mFs++Uk1ydUdvR0zQ2wrYPIAoudvRRwfQNzK6g
 9uD2OrPp9/QS5JU6bi5wOu+PUHTNWqVYiYAIsy16IpSSKnigfC2etwnhk/7EadpcFLuZ
 dTTw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro0rfBA84xPv+K+MAcPSVAogdKqxP+KtYfJWk/2khOK2hWM9mzF/g05FCKOUR8FXKgS5wJaBQ17AA==@nongnu.org
X-Gm-Message-State: AOJu0YyKd3DQGRukfo5cCzB76g+mgiSTfWCkt3WPNBMFR8zMTFOgMaDe
 iC6Bht8BrxDP0cf+eNxtoXSynmOYPbf2tEW9J5KTVy8uq0lKWUJJEu4+u2UblYzUcuE=
X-Gm-Gg: AR+sD13gaqFD+8PzVp60uQGjAnsospwSZpoBPCgwKJzHuT6VkwZPvX2BZ98d3QRMhzZ
 M4JZ0Gjt8tmM4jTDk3o0mXVzx02yoRN5db86bO79YMIzW24b2GdIFxVBGypLy7t15v4NgEQA13K
 m+fARWr7JAI21pr2SJSf40ntaSn7j21DJ8sYPMRnVlCHYoGlmu2shfkrUIvpXzXT8rSqpwg0Dq5
 W5oKES5Qtu8lPCKO8CCaOIQwk8fQvdGn0rfAt35jj7BwfivrgvQmipJdQlwVSGiLQ6zTlPMJeU/
 j2/jr3EQo+Aq4ZUkQKKuhGi6pUQ5Vl+nwcv2TcebBbbIrWExuvQW1k7uEiAvJPIntH4JwgYYwuA
 ZGO3IwwMd1tWF+Z2l3uzffBOuk1os6iFMoAnZ7S2P/OMFavt8m8dKW9AjGn3zES1I18CSaZLMDW
 gDvb0Av2tEVEABtMux7bVI1njw62EH
X-Received: by 2002:a17:90b:1645:b0:38e:6aa7:686f with SMTP id
 98e67ed59e1d1-38f6a465625mr3705387a91.36.1785266823878; 
 Tue, 28 Jul 2026 12:27:03 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:27:03 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 14/24] target/arm/cpu: Don't read Realm registers
Date: Tue, 28 Jul 2026 13:26:20 -0600
Message-ID: <20260728192630.240375-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102c.google.com
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The host cannot access registers of a Realm. Instead of showing all
registers as zero in "info registers", display a message about this
restriction.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 787e4dc7ab23..7679b8758262 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -965,6 +965,11 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     const char *ns_status;
     bool sve;
 
+    if (cpu->kvm_rme) {
+        qemu_fprintf(f, "the CPU registers are confidential to the realm\n");
+        return;
+    }
+
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
         if (i == 31) {
-- 
2.43.0


