Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2026294ejb;
        Fri, 10 Feb 2023 08:40:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8mhNfUfAxs8/mgh0hUr1bt2e8pwi3pqg+NpUInxRsoC85nJHNmrmzSIqXRQaId8LXAQQn3
X-Received: by 2002:a05:6214:f6e:b0:56b:f31a:5bf9 with SMTP id iy14-20020a0562140f6e00b0056bf31a5bf9mr27197489qvb.0.1676047200354;
        Fri, 10 Feb 2023 08:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676047200; cv=none;
        d=google.com; s=arc-20160816;
        b=yBUFGgBnu80+RzT56B3/6IUxcXbUeVxquKpwBkZ6FZRin0sLymBq7VY5BEPQjRxxzx
         J33cGPodJjc/0m5NFes+/LqgW7dsblhyWoqD1FnJ/26l/Zke64Knh7GhEobYXoWEr9RV
         Msot+m1B5OY/qceFzyaSFqu47Cd6iFCaN1u9R4ie3NH9vtW0rJyJ9RgU6D845BVWiLO8
         zoR24qvoYaEf1xh7IDe+2pmVtoHb08x5xv/8yMMBrZWWYzXjnWlsaFpjh1DlQjgauytn
         C3BVj+JyAw0LbkHsndfHqRGQvXiharSb21D/dpbVwgPFc9CbBAANP/ZoVpHSB0G7SmP0
         1H9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m6P8HLBt4ufHIqb717DBvHQgjnd6QfYZ+mBBlnxbNRQ=;
        b=T+kiW8oHInq10wh73FrFNz9GEnaPT/wFalxTftg9U3E/RerZ48vgbwHxREYPJQFbVV
         Amsc6huEWsPaNSFWf5Jpi3MdffDcptvgRGTXu4VhxyjX70iyfshUMieKTtRRzj9Xuy7Z
         Pbr5K9iQvDxdLC3/hFioNgPokkPa5ANadJLWUxrX4QMdODPgmPACW9MhGLWYxaA5HIbo
         8UTFl0F4Ni7v3KZRT+GaNesCX980+jLXN/HWoRU34/HnPE06fagN5T4FW5bCx6H1sLzY
         Pz3zLWjhTCitmuzTyC9KUCjMlfMAiKLXSFlr1yhYPZOd+q4Y1+sA40cGbGvZVXIvS0EU
         VKlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJoB1KSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt21-20020a05620a479500b007056237b460si3889846qkb.56.2023.02.10.08.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 08:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJoB1KSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQWR7-0006eK-B2; Fri, 10 Feb 2023 11:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR6-0006Se-3h
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 11:39:44 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR4-0000Ua-6N
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 11:39:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so5855127wms.0
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6P8HLBt4ufHIqb717DBvHQgjnd6QfYZ+mBBlnxbNRQ=;
 b=VJoB1KSgexIV3gWjsTTMEKj446wJyahxrcZeqJrmrBlKlC8xGv/qJ7QoG1pDASCo4w
 BdUrrn9KkID9LCIto5dfMmwuGrbdKowocC7jt/gncawiFUg7YMXAiutXTFBgS8I/4Vk9
 gE2VTna3Mzk/63Eq9t7Sn80Ij5k2v1mKeu0vd7HU/KDLOAePCYmvc99UnF5onPO5UK0/
 Y3rCzRQzcFbvndn+GHrEQ1RuafMb/8knyPgIZ8F37wznjjF3dmtuNRlchETf/AXtAafr
 ECnz3WaGVt0DGDKf2o7O5nMX6Y2bGWJpqpWNl2JOclPZTcg0H5ZJwkwSzQJmgeMmlx4Z
 Agag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6P8HLBt4ufHIqb717DBvHQgjnd6QfYZ+mBBlnxbNRQ=;
 b=z2MMu9lgNaAeGc/2J0ekc2GusM6LLeYdnrSYJjBnmYg3Ik3do+QD54BZvF+CBBH9Dq
 l6UiEvi6edvDmhPAfbTJwD/I05nvW+r/Ehr0nMuWX+J2LxAX7nk4m5Qr43Ww1Iuj1V0R
 WiLpy19LtpDqjgC8byRTK+tQBfIJCNeHJ5MFUI9zxGy9MQ6WvlBjFuMdVI3h6MoZUS8P
 y6ceyzcotpib6/6M48XpauhgRiIDiLWUj4PbMNqHH7xN4/jyKGArgsJ68sYBX5tU2ARM
 eJ4VoivjTNlVLYQjMj3xltwwNFEPvXQ45sIUAkgdeefEK+n443LSU3asTTs6mLeDq2HQ
 FV2w==
X-Gm-Message-State: AO0yUKVCPMHOhcfGgevLjdOtIrFbQwk6yEB5XF4oD/9mkqrJe075TL0u
 8F+cvIaJcS4ChLGkhDLuxF4fUw==
X-Received: by 2002:a05:600c:4387:b0:3da:b40f:7a55 with SMTP id
 e7-20020a05600c438700b003dab40f7a55mr2585644wmn.6.1676047180517; 
 Fri, 10 Feb 2023 08:39:40 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm6312144wmq.5.2023.02.10.08.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:39:40 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Date: Fri, 10 Feb 2023 16:37:32 +0000
Message-Id: <20230210163731.970130-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210163731.970130-1-jean-philippe@linaro.org>
References: <20230210163731.970130-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NWNzBcLV8ZAk

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set (except for the top byte when TBI is enabled). Fix
the TTB1 check.

Reported-by: Ola Hugosson <ola.hugosson@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 2b8c67b9a1..0a5a60ca1e 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
         /* there is a ttbr0 region and we are in it (high bits all zero) */
         return &cfg->tt[0];
     } else if (cfg->tt[1].tsz &&
-           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
+        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
         /* there is a ttbr1 region and we are in it (high bits all one) */
         return &cfg->tt[1];
     } else if (!cfg->tt[0].tsz) {
-- 
2.39.0

