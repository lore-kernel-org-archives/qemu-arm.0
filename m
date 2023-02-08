Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6824851ejb;
        Wed, 8 Feb 2023 11:31:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8B0lbRwyT6O9xB8zB0+WZXSYy2fbm0m+lqkO46QKzqiSlEi9ZUyY+EJLND8HPgqnluW7z7
X-Received: by 2002:ac8:5806:0:b0:3a8:a84:7ffa with SMTP id g6-20020ac85806000000b003a80a847ffamr14781462qtg.57.1675884698426;
        Wed, 08 Feb 2023 11:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675884698; cv=none;
        d=google.com; s=arc-20160816;
        b=CcI6P53918HJTnRhAF0Z1VZm681IUVfptR4tnaFozNDKNe+B+kJSfa8ZFqpeZ9gjBJ
         vWUVK7pLK9VouAJMDjKz5g+Q3Swdv0tEx584C50Qj1o1thad+uVWLcPj6dyZ/e3fv6xC
         tNJneylL8GXlQ1HM380zbWorul9uX6ZEYeDfXikTjO0B2IpqtvQ1v4GJ6uBuB1froOoA
         gDJJTIKby1LYGW5QcpHHRLkeoruYVSKy5t9YPnSzaXyb1X0hW112Ryz9zZLHeUYVowHy
         n+JBB2lm+TvSVrj0Pr3Hqu2W+5CV/wEGQP3fk0KnyG+m/+WqsMg4zOS0oU1vBJtzxopt
         PJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=mAfqu5STQLW35DMfDre2JGCNsJ104sKZIGjzpdV+UzI=;
        b=u5z11YGvEcdqOoc4ax/QdymxGdzWG2ifZnOcn1c27NqP63yJ/DrjTtf42qHG8Tg15D
         d3UK7NKxiOViUwGOkKU121pfBVNwgcskktCP4vNEyB4EBJfyias+8UddIjhcsy0vHJMF
         BUVMP2s0+bLJKl7jyB08EeopR7aDS3aovuUVDohdTH+p11IVNaJHL47BUlVwScvxeUbJ
         snmUKpRpC0HR7AJrr75acAqJGlwUQ7Oa1DxGGpsQ+ixxV1SOGcKel/Z5FNonL1Tb3OhW
         iaq363KIEdyp63X3LLCCzUUKxk0lfgKJdqemt9BWi0yr3Aev16yPULEgpyEJRT3zJz0R
         wquw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=G1VwB2cB;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020ac85cd0000000b003b9a736e00bsi13863764qta.710.2023.02.08.11.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 11:31:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=G1VwB2cB;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq8L-0007DT-Bl; Wed, 08 Feb 2023 14:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq81-00075h-Lp; Wed, 08 Feb 2023 14:29:18 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq7z-0006Kf-2J; Wed, 08 Feb 2023 14:29:12 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9C4921CDD;
 Wed,  8 Feb 2023 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAfqu5STQLW35DMfDre2JGCNsJ104sKZIGjzpdV+UzI=;
 b=G1VwB2cBRSx7Py8YaMpxgcWdmx4eUtdErGuMVQ6MIY9/YkQnCl0YHb7RXVSkTxFEoWujZQ
 6/DcuL0HmqyPV8L4qGqNXw+8oqdkkQxsaW/oU4EtTmXRV0G0OXFnhOOEvfMjZgpdtfBINg
 OYhYiy26uV8/FtgGVJp61gebho9gpBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAfqu5STQLW35DMfDre2JGCNsJ104sKZIGjzpdV+UzI=;
 b=9CZALXvHWh0tFbLRZ90M/lpWmcwrg5SyBem3/h9JQcD2YFXeri6xW0y3Zs5oXKzhHV/6Wp
 sK+CLi13qmD/XNDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5837913425;
 Wed,  8 Feb 2023 19:29:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCWTCAT442NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:29:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 05/10] hw/arm: Select VIRTIO_NET for virt machine
Date: Wed,  8 Feb 2023 16:26:49 -0300
Message-Id: <20230208192654.8854-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208192654.8854-1-farosas@suse.de>
References: <20230208192654.8854-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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
X-TUID: 54+80Uc/6+th

The 'virt' machine uses virtio-net-pci as a fallback when no other
network driver has been selected via command line. Select VIRTIO_NET
and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
(due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
qemu-system-aarch64: Unsupported NIC model: virtio-net-pci

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..8dcc08b7ec 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,8 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
+    select VIRTIO_PCI
+    select VIRTIO_NET
 
 config CHEETAH
     bool
-- 
2.35.3

