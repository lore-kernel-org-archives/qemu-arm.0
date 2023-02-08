Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6824252ejb;
        Wed, 8 Feb 2023 11:30:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+W6dyDacZ3rsa3rbNWtXv94SAUVs6PambjeNUuzMZ7eoYtiiqxYS75T8Z6/W72mHwhGDOk
X-Received: by 2002:ad4:5dc2:0:b0:56b:f0a4:7b77 with SMTP id m2-20020ad45dc2000000b0056bf0a47b77mr14511723qvh.6.1675884656522;
        Wed, 08 Feb 2023 11:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675884656; cv=none;
        d=google.com; s=arc-20160816;
        b=oJwWlio+8Z/a+GlSON+KTxumZXA5WivtMdNPR8DqWIK7aRsgCPym82Iz4evkQj8qZ2
         BtDvF9EfqiaNmRT0zntFgykA6TM6fv9MywODTqV8oOJ8dh02dFCwRBBozb65iQhrgMAG
         4lSrxcJDHdpEuDPA+JidXp/XI/1wkx+t9B3d/bI3xnVX9dKAxZ/s+vsqOBMFheEgW/ax
         J6p8DXDt7jL+PjelRiqMrHF2H++7IOCT/a/xYzqzxTvDHEQ3VoYfnh+NPxlWz5JLoSwq
         cjhG0178ijFhvC9S5vxK4+ZRB1S8IljW3zRNX4luq5W62Y4Q6A8kprz1QCZOOQWs9yO3
         ky1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=xIVbur1IZE6BJ0m76NSETLcCVlAKX1rvdfdJLRTJ3rU=;
        b=A97tSewkTu9gnhWVo8v5+RlBw4xk/h0V3F2XZFMz//I1t3l7Zf+OIpgwj8pnY6k6/x
         uYEQfPcqZdx0T7ywS9O8aLGLD4GdSqBNvZegCfEmUtjW/tmDP2ZvfILbRYXG9fcIOr35
         SuxzbJdUexAQu71i9S6UQpcEdm50iFbMrBR5vR8jFayip77TOimccTZnrlw57O+hnboP
         MH/TUarvkYrS60xnNRylQL4bdLIdj1XBxYWpjcL5ZGzVAt+X/ttbYbwm+xzaFTbUvn90
         AFAoy0jIbAWz3xybPjlI57Ot0oTM2WLYOOPt4EUfBM4z6vs1Q3Rt3hfR4gxggiDrue8b
         qSpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z9IPxdTx;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=kXqo1bSN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a0cf007000000b00568c5e3a0cfsi13327674qvk.125.2023.02.08.11.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 11:30:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z9IPxdTx;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=kXqo1bSN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq8E-00078o-Hc; Wed, 08 Feb 2023 14:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq88-00076i-RO; Wed, 08 Feb 2023 14:29:20 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq85-0006LF-DD; Wed, 08 Feb 2023 14:29:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49A81203D8;
 Wed,  8 Feb 2023 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIVbur1IZE6BJ0m76NSETLcCVlAKX1rvdfdJLRTJ3rU=;
 b=z9IPxdTxpH4niUknzvtD5jQz88k2HU8EQl590fqxPiN9uwPm1Bv4+RJ0kFRcOgd79FJaev
 LIVGNONUb0AdX5jTW+0Jj5j5zXeXsU+TT1yfjoNRfM08szsSnbHwZBLP8FqeLpDmmKKBXv
 AykKNgvRngk/pbW5wQZGx66N4mD7o7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884555;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIVbur1IZE6BJ0m76NSETLcCVlAKX1rvdfdJLRTJ3rU=;
 b=kXqo1bSNPbuQy/6BnYrPaZkeROblb8vjmc7LwWheu41MuAnCUGig3KV2eeDUJhxxCVYcbQ
 RWCGCf8pOlcevOCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E425113425;
 Wed,  8 Feb 2023 19:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uPvQKgn442NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:29:13 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 08/10] hw/arm: Select GICV3_TCG for sbsa-ref machine
Date: Wed,  8 Feb 2023 16:26:52 -0300
Message-Id: <20230208192654.8854-9-farosas@suse.de>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: znMThhrZIzkL

This machine hardcodes the creation of the interrupt controller, so
make sure the dependency is explicitly described in the Kconfig.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 552e3d04ee..823f8b11f1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -232,6 +232,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select ARM_GICV3_TCG
 
 config SABRELITE
     bool
-- 
2.35.3

