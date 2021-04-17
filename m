Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1150814lfr;
        Sat, 17 Apr 2021 03:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ56ApwxVdzU8wkeN8HKJXou+HQyOf5CLb4UBuCMiWO5dGH9ZAIhWOTdFU5ixA1Tmnko+w
X-Received: by 2002:a6b:e302:: with SMTP id u2mr479597ioc.15.1618655903895;
        Sat, 17 Apr 2021 03:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618655903; cv=none;
        d=google.com; s=arc-20160816;
        b=E5mhLMDSYulFMR2N5y0UTzW/GQ+Yg2wN7M16tVsoxkN0YwlkfppggTvKt4klH2nful
         22GwQ6WIJ2T2K0w02/yVQrHMLbEvaYJc7D6Pn0gieZu1/C0vYz4T+7I3n+BPSNTsUC8X
         nv2Y05op0UzsMGl75HgzByv0vvgaMszExQ7JetknAEtEmInA1DS/mWqWmTwFUh9sx1Gz
         9JmuOoXGLdWOoqL+apr0jACx54fV+lhaU0Suqv4Aomxyyc0bBX2XXgy9K53XoL/GBEN3
         otniS1EDTrdbN5cCQncJgwHh/dBZJv4lpsyfAgsAD/n+sHqFvzz+a/ihRpOXvTlWmegj
         PqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gigBM1s+F8HC4WmipCGGWWK+Zc3mdWdnCe6+x4OghgQ=;
        b=pEe7nYV7dBoscIihHLZv/cBLlHyZSc7y3HmW9yspUMAX/6fb0FS2kAAxBMK+8uqphJ
         7nAkyxqnGeJ8k2IXJ3LeFYkP1SBNgHW0hG4IxQO0MuM1GvhNtzbe7BToPFo4ACXIoN0c
         oo8PskYgO0rTpaZyme9n2MxDDqzjxOHkrdGP1hQ0sAuZtMQEd4pOt6uKsrw6lOKJE+d5
         XtbfkqmpwwtRkWDx0Qi6bpMmwjMCiVk/zS+TDRtXiIx7NpoVLRJTMOt1L9JVYqIh93tA
         TXc4VDEwKOM6wQYqtjk+GknNytICPmDLdAolVCO2sk9qxohSuOt0QysdR6Ps7upks4ld
         fZyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MwueMmS8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si11678639iol.13.2021.04.17.03.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 03:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MwueMmS8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXiLH-0003Ga-7c
	for alex.bennee@linaro.org; Sat, 17 Apr 2021 06:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEd-0002SD-FL; Sat, 17 Apr 2021 06:31:31 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEb-0001Gg-U1; Sat, 17 Apr 2021 06:31:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id y204so14149275wmg.2;
 Sat, 17 Apr 2021 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gigBM1s+F8HC4WmipCGGWWK+Zc3mdWdnCe6+x4OghgQ=;
 b=MwueMmS8oD6spzk9WFw3065ohzOuSqbF7Js6YfDzNUHUDb+LpLdKYoGJH79SASQ5zm
 X4KjvPEBF0ixmvPdDFZQv/Bz9d3Gb9JNnPaEiZBALqvJoWY5y2YeW9u7D8Vx5pnVHzve
 XIGNsp4vnZcilKnGAToxNREVYEDpsUrH+kVGRx5VoW4KTsJVTdwAde63QKb6F0oVoGzh
 k3NzazNFFcsxfBU+cL4+BsYs4PnD+5+GHZag65/X6M2hZBelqfAJ3vLE2uKfQLenE59h
 EOSnyTRTXzQD0RPzu3PyMevn9g7hMuAi9emukm0k1Rok5Qyc9QgAtE+S7kVPXPn+qiKx
 JQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gigBM1s+F8HC4WmipCGGWWK+Zc3mdWdnCe6+x4OghgQ=;
 b=J9SAEY2hRAHbZ7L4jZQlPeDiu4UKVGqsLBY31bfiK365/Rbsd7ysil4wLhnJhJBRyI
 Xo7JcFlr0IIJ/QsrLP68NFZT5w+VcpcGGtVGtP1aVq9iWuyMhUYSl+c8nqscDCch1yDH
 N4hkTAeDeDQWdQm6a7aYU77pK0Sr1OmVYeSgj94Bb4mYpqcXuvyd6C8JzPAZXlTyvPrC
 1EOczevF0CiMSEi1rn3/p1Aazy6Is9I3pb3Sv1D3KoRIKoWKu9xkl2ITV0oXqvjYM34f
 +3Gq50huOJT18TwwXchCHIvDwKTDpn2oVkapUuFGJ0ofU59UaWu+Bi3x/JP1fURx43Fi
 JjVA==
X-Gm-Message-State: AOAM531pM2FuHTMsrzLtVrwnB8sqzfuNPoIcoHkcISvB/GWDicMMZvFS
 lMRkm2KoezS+dkQzySROCx4iyQO+KZs=
X-Received: by 2002:a7b:c098:: with SMTP id r24mr12066647wmh.77.1618655487679; 
 Sat, 17 Apr 2021 03:31:27 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 61sm15406177wrm.52.2021.04.17.03.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] hw/pci-host/raven: Remove temporary assertion 'root
 MR is zero-based'
Date: Sat, 17 Apr 2021 12:30:28 +0200
Message-Id: <20210417103028.601124-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MDp2q+IPb9GJ

Previous commit added a check in memory_region_add_subregion_common()
to ensure AS root MR can't be added as subregion (changing the MR
base address doing so). We can now remove the temporary assert in
the raven model.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index d8c1aaa11f5..3f8508bd467 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -141,16 +141,6 @@ static const MemoryRegionOps raven_intack_ops = {
 static inline hwaddr raven_io_address(PREPPCIState *s,
                                       hwaddr addr)
 {
-    /*
-     * We shouldn't access AddressSpace internals. However this assert
-     * is temporarily used to prove a subtle inconsistency from commit
-     * 1ae1dc5ba24 ("raven: Set a correct PCI I/O memory region") which
-     * expected the PCI I/O root region base address to be 0x80000000.
-     *
-     * We now use an alias memory region as root, which is zero-based.
-     */
-    assert(s->pci_io_as.root->addr == 0);
-
     if (s->contiguous_map == 0) {
         /* 64 KB contiguous space for IOs */
         addr &= 0xFFFF;
-- 
2.26.3

