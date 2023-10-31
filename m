Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp292259ejb;
        Tue, 31 Oct 2023 06:47:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs2o5SVO6cmwxT3uuPZYYr9KyIcIfS52vvXpVmgH6gSSXQG8h2VDUp4HwolqbT3tJ0sdE2
X-Received: by 2002:a05:6830:4106:b0:6c6:19a6:29bf with SMTP id w6-20020a056830410600b006c619a629bfmr15591432ott.7.1698760023966;
        Tue, 31 Oct 2023 06:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698760023; cv=none;
        d=google.com; s=arc-20160816;
        b=nXDjSibtIjMf3Er3i6xxgpJbzbzwgJFdaZe0HqTiTriy7EyxpBxE2KWbYt0mdCM+Hn
         un8kRXzwjeJ+NRnj//syk5xB2hyRb/KjdKxGj1R+d5/wkzMthogCItZgGrX3+HYyDrjz
         7rK4XfVxSBK/sRrOth95Zo9ExjD12DSsDRwbFY7KK+3YjivBToZBhOKstK3XVay0BGvc
         CXhq52JdVq6IKxXUYC5DjX2uXSeOvmSs8ttjHc1YJojSMGUzfWNs1J++aA7xPVhd5KqU
         Q1lyds9pBBA1h6z5DrJ+Z/HbP9r6qeD05oF7VfotlJV28lhQnShQACsODrNcJW64x/RP
         1Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=96tTRZzTo5lzHBefnnTujQF6PrCnnI8GATKXvxfKeEQ=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=Dihk0WZLkFV7NnxBdngLF1j+vMLrmeYvhp7o6NjbMUY3uZQ1qfM5V9u+Th/c3/zWbK
         V5V/dxv/+v9zcRlhOGp2dTuLT9eIvSOr5OczHXtp+ygkvgHGW1I9tIt9MlAvt1YvWcLb
         AFpIwClAHnPpc13QisCoopm/o5eUyPK7B7Jdhtad7P4IqiWS5dTr9AHIzeQXw7D0gKZa
         uqkW4EzZOX5yBs+NgPUxgMy3/zsoc8DKInfrIhaKcFGuZHQesXOJ+7i7NzN36VwQaag3
         FTDM9cFWpovesbps3bT+ae4AnGCunJ4EctVzieAMCgedUIG10s/zx684fTa23J1GRLa7
         X6mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=seApOCf+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a05622a190f00b00417979ae590si1113553qtc.539.2023.10.31.06.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 06:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=seApOCf+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxp3a-0000uN-SD; Tue, 31 Oct 2023 09:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxp3V-0000t0-O0
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:45:18 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxp3Q-0006dr-3C
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:45:17 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c6b30acacdso43642441fa.2
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698759908; x=1699364708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96tTRZzTo5lzHBefnnTujQF6PrCnnI8GATKXvxfKeEQ=;
 b=seApOCf+fLBoUMLm2cF+gOVGH5czrT0+YX40XMcBRcpmskp4/JUKSUT/CGHVOZmFi9
 CidejBDEED5y4xBaZkV6Gmevnm3dqH0L15b6KZ9lHNODpQJiWytUt5/xDhcU9MP86z4J
 kii92kokw4u+ydHs1J4QBb1Ax4J7wucN39OrVC8e7o+LN4bYEua6JgpjNqXZZwYrcjor
 6iBEwbxE5l2t3KxF9Ri1XRdNs8AVC6AMk/IlamQpJeSR7uUAVO+xJGUMBNO168Ppe503
 g+IowtArj1ThkkMVZEKoQHXNnHU+K6QjSd4NKFMR3bKaZJX4V55rQuxbK65PE7D6V/1e
 m9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759908; x=1699364708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96tTRZzTo5lzHBefnnTujQF6PrCnnI8GATKXvxfKeEQ=;
 b=BdzoXBU0Ep7lWfNzY4s9PXMHZ/gfyL6KDQKVkL+g3b1y33hw04f12WsurNMEvkmpwD
 23F0NcABb91gQsRdgxfOUgbtqNEYpmhOzc71xaNDSiWYQ2fHDdu/u/JLzQy4WaDYqGx3
 NeYBdz1+l1AXT2CVPli3DS35mCrLiXpd0xcTG7Qlc9p6VBXp5PuKX6TzdqK32fSd2GnA
 fgkzJsdNlYZOAfUkHJQ+MQhF3wIOTMnAPnxUUDQ9E6L7VRh134UVfH3S51Rsh9a/PDoZ
 qeaXZNC1Sr9JSqAE/gd44groZ4eeyrN4428SNA2a5XiktkZX137wA1+YQxAuQyO9pdJK
 lK5A==
X-Gm-Message-State: AOJu0YyhUfWZ35EIDpUSedpcnQuuhH3igaMPpFqpYJhBjlI/3w2XXRRf
 lUuaVd/SnhBgmvaoFyf69FMNW1Kn9eCJzPeYyLU=
X-Received: by 2002:a2e:9116:0:b0:2b9:aa4d:3728 with SMTP id
 m22-20020a2e9116000000b002b9aa4d3728mr10180207ljg.29.1698759907741; 
 Tue, 31 Oct 2023 06:45:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a05600c00d800b004068de50c64sm1754989wmm.46.2023.10.31.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:45:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Subject: [PATCH v2 1/3] tests/qtest/bios-tables-test: Allow changes to virt
 SPCR and DBG2
Date: Tue, 31 Oct 2023 13:45:03 +0000
Message-Id: <20231031134505.4110877-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031134505.4110877-1-peter.maydell@linaro.org>
References: <20231031134505.4110877-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: bFCEGfOV6AsT

Allow changes to the virt board SPCR and DBG2 -- we are going to fix
an error in the UART descriptions there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..6673e2c4c13 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/SPCR",
+"tests/data/acpi/virt/DBG2",
-- 
2.34.1

