Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6823731ejb;
        Wed, 8 Feb 2023 11:30:16 -0800 (PST)
X-Google-Smtp-Source: AK7set91G0cPFFksuiDgIT9ZBvUd/PFZ4BhlIJGrlV9V/KGHNNXGEVjU/KvmPyyM/5+RqlcBRjPq
X-Received: by 2002:ad4:4eec:0:b0:53c:1d8c:c27c with SMTP id dv12-20020ad44eec000000b0053c1d8cc27cmr5737414qvb.44.1675884615901;
        Wed, 08 Feb 2023 11:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675884615; cv=none;
        d=google.com; s=arc-20160816;
        b=W+CFceNH7ZD2mzDYMfQgjnm35N8kZ63ID0uyoaAwNOcM8iNe8vsUbisJ0/D64gemxh
         2yPoZ/u3r+8me68tqD3npp5t4b2lLvTsmt2z6bgSdZpCAU3XDhGp518wWbpQPsWCY4zz
         SaWcbf+V8ZA5JTt5kfqsJkc72hKBY7haCw36mQhcXxLq+B07rVdn8tu1H3v7VX173PWu
         F4+TmGSfi/nnzDAy0vA4xVbr48GqZm0AX8gfJQaMdPyUeehGpVtsjKPwlKX9R80dAhGM
         CQeEsoTwjF5eD6S5Si6cm2nKqaSqI0b1QVUagyRUF2HoXcvgye3kPTfEtdGbwcG85F9g
         dcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=hmXsIJBCCFD1uyZVrJgp3n0DIvKPYKCCVkKC13NR+ZA=;
        b=nXjqE1fsT39GbOecX+A/scAe+FC0cy6KEYq1fLWRKD24VZISk3Gt6NA32yRVw0J8hB
         Db0dftGfGs9ZZ0z+64J4atBGalycG6oJfxen0TTycyCpWuMDZ3FT+isN29gZQV9VfVZJ
         jz85VmpW6ztUoL8b0I0Pud16sTvKt/uL720VO4M74AXBpKdHqxXZ8N1f5Zdu/e4DDK5k
         9lhcFQI+dP9OxVOHkulG39AUuxg4MCt5IRpC2WDGMfMZwyGHxag4W48/YbGJOkTOqR5S
         ISMHba50829GNPxbwT1AeOiySYdlW56OYQ2w8nN7uIssXh0qGqv5+0Fclp/xT6ReGDcQ
         ughA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="0rZ1g/Ji";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=1qzEVFpS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a0cf04e000000b0056c1b86827csi1910619qvl.16.2023.02.08.11.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 11:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="0rZ1g/Ji";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=1qzEVFpS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPq8G-0007BL-AS; Wed, 08 Feb 2023 14:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq8A-000781-Cv; Wed, 08 Feb 2023 14:29:22 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq88-0006Lb-TU; Wed, 08 Feb 2023 14:29:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3981203DE;
 Wed,  8 Feb 2023 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmXsIJBCCFD1uyZVrJgp3n0DIvKPYKCCVkKC13NR+ZA=;
 b=0rZ1g/Ji9E3R76Nlfee/EFv8l7RFp1dX/PrsIXQSuIwQKMZ8dnCBRsTyhVubToks2wE15I
 MzbhlXfY7K1XzqgSNn6ZFDH1dnIFd7ZbCg+GabP/Teqrts9q9M6lWHvKefC2s8uomk6so4
 xsCSNLEI07bPJ0tk2JHoNNhexRhCAFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmXsIJBCCFD1uyZVrJgp3n0DIvKPYKCCVkKC13NR+ZA=;
 b=1qzEVFpSAVd1yyUThRZ2hK+LUCGqpNGt/7dVpCW3rR9nnMj1AV2+U4MDKjMtxbsgE9iJ1K
 pqttWi+XVDcWAtCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C89613425;
 Wed,  8 Feb 2023 19:29:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6FCEFQ3442NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:29:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 10/10] hw/arm: Select VGA_PCI for sbsa-ref machine
Date: Wed,  8 Feb 2023 16:26:54 -0300
Message-Id: <20230208192654.8854-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208192654.8854-1-farosas@suse.de>
References: <20230208192654.8854-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: RprCtK64G2JW

The sbsa-ref machine explicitly creates a VGA PCI device, so make sure
vga-pci.c is included in the build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5022d519ea..74fceb419d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -234,6 +234,7 @@ config SBSA_REF
     select WDT_SBSA
     select ARM_GICV3_TCG
     select E1000E_PCI_EXPRESS
+    select VGA_PCI
 
 config SABRELITE
     bool
-- 
2.35.3

