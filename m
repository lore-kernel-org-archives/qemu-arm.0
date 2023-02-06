Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4230097ejb;
        Mon, 6 Feb 2023 06:11:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/eAVnKTePB+y4vTbW9MFAr4O2XlAU+gpjkOpWGxoO+3ryTozvPXqrDIB/+iRjcPVgoxk0t
X-Received: by 2002:a05:622a:189d:b0:3b9:cd2a:f13d with SMTP id v29-20020a05622a189d00b003b9cd2af13dmr28813688qtc.59.1675692701288;
        Mon, 06 Feb 2023 06:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675692701; cv=none;
        d=google.com; s=arc-20160816;
        b=V4I6eoK/4rwxcuh2c7CIZpkTLdQ+lPwD+h7rWZlyTh3rzqqBuKudlnqQdzN/0zvpYW
         4c5UQOr88qzLedSaDZWZnojp38N28mEe/jjqEB/70EctT4FazZ3DqsVsm0Er0Wl3Pk6e
         2pOp6MdCQipbXU1qwr00Wq0tAnFx9RvXveO+Hh1nK5u9PWGceuhxbIirasJDJuaBRJqV
         BnxgzQbFhjQSPIu4qh0BkkUmQ2WZ5kKkjM+DXuxIK9NySDJHiZzNG1BlbWvEtdmnS59A
         8NdcSS6yzgZr0DeApeTqoY0f+BzHLRKUr7gu/FL66VhhD5hIxCpHGSNmaeHPJRZo5YCO
         BF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=R/6PxDjMpu/2Zw++Jd22Tn23zYiQZOKZQKl2YBkloAA=;
        b=sZjg3bAYFxt4c6oofqUC4HXpw17KETXiq1n8mdaLZcmo0UtbJlbuVQYQm2dbm1c/V9
         yl7BIROBMcSSZm7yQZcKdwecp4u/iHbdrivzMOgfkSSv8cJ1b332LSD/GxEJeL0NFE0+
         yNo6zsdAaA097QY966PB7/B4DFOWi0gHgzLyWAIO3f8+rwcupH8RJcpCQAjFftSbOAvB
         u9i6MtQHs9mGOPsdZ9nuW2uE8dbV2tYccKMr5NHXBaB69Ha/+VtODpauRZhsVHV1zTv4
         SAubZXybrn+xuLS1j7slICUOgdtxBfXsLvXwo/6VoebExYElngNDvK4ot+zpErwrwOiN
         EEzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=S28wz16x;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=h8ZDu4fb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020ac87fc1000000b003b316a94122si8834189qtk.6.2023.02.06.06.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=S28wz16x;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=h8ZDu4fb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Cz-0006Ar-IB; Mon, 06 Feb 2023 09:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cq-00068N-CT; Mon, 06 Feb 2023 09:10:55 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Co-0002hI-UZ; Mon, 06 Feb 2023 09:10:52 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 759DF60420;
 Mon,  6 Feb 2023 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/6PxDjMpu/2Zw++Jd22Tn23zYiQZOKZQKl2YBkloAA=;
 b=S28wz16xcYpWVw5ZtHMZJ1XYbUrXJQRxkctlj7+qTuWgSIh1Uch14ns3ELcavsyxc1H46T
 YWihhCBqLFbUI7lxDeedXZUpt8UQw/+tCd1CI1ZSMSjF7DfGXHrEYsMBX+wHUXOXBt9STe
 xcKNymCeg+87rRPN5i6cEGuYtzSpHsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/6PxDjMpu/2Zw++Jd22Tn23zYiQZOKZQKl2YBkloAA=;
 b=h8ZDu4fbAJPaUgbcTm3uCotoTjmc76V4S5XQ5n2fcREgctU78upGhqk4Rf5Jc3CjuWwth+
 S8deTqv1Il0sgaCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BD92138E7;
 Mon,  6 Feb 2023 14:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0O/XMGYK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 10/10] hw/arm: Select VGA_PCI for sbsa-ref machine
Date: Mon,  6 Feb 2023 11:08:09 -0300
Message-Id: <20230206140809.26028-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
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
X-TUID: I8WG03ghw23m

The sbsa-ref machine explicitly creates a VGA PCI device, so make sure
vga-pci.c is included in the build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
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

