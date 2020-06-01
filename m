Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3157700lfc;
        Mon, 1 Jun 2020 07:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT4CAjLlEmqu+kQqPOdUH1Xmnb2bX/UmJXP05TQ0EWQRlsZOKjxzQmMXkg987QTFgGTWVh
X-Received: by 2002:a25:9b87:: with SMTP id v7mr32813178ybo.416.1591021905262;
        Mon, 01 Jun 2020 07:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591021905; cv=none;
        d=google.com; s=arc-20160816;
        b=gbnMV5mKJ9lYMfSADk4S+8NZgDtpTPw9TKeUt7UaQ3xtO0ZMltNj5bpZAWyDCEqYND
         Ux3sDlTl/z2lc39I5GKd5Th9EHGsEOPJ9SgqQG/DjyjM2XQassNtWbbXNVgTbb13BRDA
         QpJ9oNrbpyVfYySJyryTBsiKeXqXZfIX9FckOUmHF9AMeQXlg9AAvqA81ikn3kDeznZy
         Mpj47qDScniJDdHflczYU8lJ7vGfMifOuxwy9ykGcupIKfJInUq/FIE5ThcUNi//KoXp
         HXStyDDn76IWUMND6Qv/pK9KnK9TkNAhZ0CsNOxWhJKYIOlpmNANRMqQEeVc0cOriOWR
         eWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HzSo+FKM+7hllBEEZUwDzngvpJfgcJMgoiFq36o0B8U=;
        b=y7dFpLkT9svzl1w5WNKgqemeg0/k8IpEMd03tCCiJQiyj/yHikJEUn1KVYYI7fwwDm
         m038q4yVixg0UaxyTbvI19pHPakN7fW+B5ac0o72Zj/k0kJMnvTXa6CnM0W7/i1wxsOm
         is/HWLQAOMe9diNOijZztd1jtupbhvDFRli6FlLwJwpMVlZrxf9SzFdxWDaSboMg0eif
         tGRBME38L9Z8J2vgl8qXO+4Z6epoayv7JGZRlMF0XHRXZxXDonuDr2jato5ApEDrZrMO
         cjWjiRX41xccF2BIuzRBqWa9WbVjxO8jHA8CuQRcw6cU4ygh+K6wLOUCMHAI9Yu2MPHN
         lRxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XTbutdDK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si4449865ybg.90.2020.06.01.07.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 07:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XTbutdDK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflTc-0004yz-H5
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 10:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRZ-0002KI-Gs; Mon, 01 Jun 2020 10:29:37 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRY-0002aQ-T1; Mon, 01 Jun 2020 10:29:37 -0400
Received: by mail-wm1-x342.google.com with SMTP id r15so11562473wmh.5;
 Mon, 01 Jun 2020 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HzSo+FKM+7hllBEEZUwDzngvpJfgcJMgoiFq36o0B8U=;
 b=XTbutdDKkJKkajTBQBfb3gKAZ8HdQTRh7KPk2PRf4BKVCmPN/4PTUsFkxrz9l/MxyE
 WUpRpf229tNzjnPfHSCA8du3tlIB75OS5/RVT9l2X8Pi8CcwsUCX6HO+2vIyYWMLw2tC
 ebQhYTRJklmhotmYL2rx/GdLsCDfCBNHfnduxY4Q5bNFjSm8izV9JBOdMPkxXDwKlw4c
 031Lz9blGnoP7VIxmgxsb+iWzGBmm5T0wI/Tv3aiTxDNGjcUF71CVDuNVRspxPMH9UPA
 3nwu20FxG3BzD2wN0HUsD79p+AZtAAKT3qF+a+MxMkbmLHvKPtyLwMf0vUqt0hTFsvk2
 JbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HzSo+FKM+7hllBEEZUwDzngvpJfgcJMgoiFq36o0B8U=;
 b=a5FXPKeDPm9AAytvGoiuD+6E6p4MnKFCU7xmrXgYVawFG+gQHOzacWIAkArF1Kkxih
 EtCllpPA+kdG+XghnyFR9obZ3eh1rA3lOfTTrPJArCA2KUphzEnplGtA+SKLQ0fjNf54
 EFA6s5FMRz2ZWHxmSFz99flG6WZs59C4nf+VmHQ0cTsT2GXGzYH5t0mSV6Yned7uHgRK
 PBlP2yNwvV+pNrf5Xm5qrmY4JnK1o8KjVEDFNwIIYBpF+orBG9Ghhw6g19GwtTjFMDrT
 JsLC52jr8KH69WalaLjTakmOa/Y+5qCMIV9NFmR1OVmK5eujS5k7wgkIb8Fw68913tsi
 +Hqw==
X-Gm-Message-State: AOAM531oZqmhJ2/Tebh3u4xvqsrf3OCqWhs2Y5RCPS6KTvqvpEBDZseL
 USE3IyEbBUBbFcdhvxJCLGrOd2rT
X-Received: by 2002:a7b:c84b:: with SMTP id c11mr21338870wml.78.1591021774481; 
 Mon, 01 Jun 2020 07:29:34 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw/arm/aspeed: Correct DRAM container region size
Date: Mon,  1 Jun 2020 16:29:23 +0200
Message-Id: <20200601142930.29408-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0FXunl3vQafG

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value. This is not a problem
for the 32-bit maximum, 4 GiB.
By using the UINT32_MAX value, the aspeed-ram-container
MemoryRegion ends up missing 1 byte:

 $ qemu-system-arm -M ast2600-evb -S -monitor stdio
 (qemu) info mtree

  address-space: aspeed.fmc-ast2600-dma-dram
    0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000bfffffff (prio 0, ram): ram
      00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram

Fix by using the correct value. We now have:

  address-space: aspeed.fmc-ast2600-dma-dram
    0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000bfffffff (prio 0, ram): ram
      00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2c23297edf..62344ac6a3 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -262,7 +262,7 @@ static void aspeed_machine_init(MachineState *machine)
     bmc = g_new0(AspeedBoardState, 1);
 
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
-                       UINT32_MAX);
+                       4 * GiB);
     memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
 
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
-- 
2.21.3

