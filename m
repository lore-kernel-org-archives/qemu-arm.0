Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1045414ejc;
        Sun, 14 Apr 2024 23:57:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4RwWRKDg3o7hSTFYYuZT9WEpk2PhhwhLh0LgYA3o35r6jYdn47ohpUV3hYVwtVT+wRqD53WJ86vGbdZtIyaGqRM321u5O
X-Google-Smtp-Source: AGHT+IHE962zOpt+Hk2PvPrmxFgA79TijASroFRztlDiBarpinkxLTB0E+iDNKkVhjxALnndeAos
X-Received: by 2002:a0c:e8c3:0:b0:699:2212:3b33 with SMTP id m3-20020a0ce8c3000000b0069922123b33mr9317959qvo.19.1713164267715;
        Sun, 14 Apr 2024 23:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713164267; cv=none;
        d=google.com; s=arc-20160816;
        b=k+uHjYy5ApVg5P+/Oq5wvSFJl4Ivi94ohjFvEVjmDGn6Y9xlW2JasS/H4FlLdua377
         OBsKuTUM8ClpBAVT6TDsMKByexKNiBgAOd5Z5plDwQQRW1N6G7cyWKJMu2GF2YUwzIo2
         ZgespPkoHPJc9Divd7SYfFDFFwtbJFtv9TYgzvB3AsndpZT4nv2LDTfWPAq8NX4Wqifw
         M5vuuPZOiKUXFbCk/CAv0YsrH+AlB2EqXMJQRKOkOYn8dhy/bvnQnNk6sBm9HovOp9lo
         YA17+AzAq6UE4lMxRPjZIfmeSz3frBs+Fgr0CYLzzVpvVJG0q5FiPko+IxXZ1W/tZrSi
         7prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bxJeX+B7KSWmtuR0us1T/3kZsL3pvcA+zyP4+odJ2ss=;
        fh=FgpzUiSKNMTtMHyk5kkuAaa5ueEJtER2oT+Q/1wxShc=;
        b=BuRZr5rQDq+l0VnD0f1RlGQblxD+CEqMJZ5rRFNE659hDrZW21sde/w/t26dj+CMGM
         FrHFrovv7u6UK6n7y1esofSfiPaGOjAtc/J2atz5s9AoIRqw/htTsHPm1PVNYbDHRR0U
         zTZYN7GwPSRvCdpQHG+uU6nuhiKe9fNhhZjXM2paYWXOxo0QGHdW9imCiOcUNlqlCssp
         en6FcG/SfxmJAp2VSq6z8/KzGCtqW/xICQEHhXbUfcut0CtZoZ1opGT1EghJVVUykIGW
         P47y5LrtPUdB8qF62kRCUil9g0uqQLgRLicM5eCyj2QjA9tvMDpW5Zj4UD9rV1Zuy0Fr
         vQtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QN4xP6/K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dh5-20020ad458c5000000b0069b529b76d4si7985442qvb.7.2024.04.14.23.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2024 23:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QN4xP6/K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwGHK-0004Bv-S2; Mon, 15 Apr 2024 02:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rwGHJ-0004BB-Gc
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 02:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rwGHI-0005Nt-33
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 02:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713164239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bxJeX+B7KSWmtuR0us1T/3kZsL3pvcA+zyP4+odJ2ss=;
 b=QN4xP6/Ko30E3jjPAZRLmgBBF3cexX8BDFiHTfpXSnmtgzcqHUFwr8WdijlcjsYKhsEhfA
 tRB5EvA079O0pmh8Ng05avGIOKugfmnnBoEu5zsucVA5oXkCc1+pNJU5XbRRDe2vrxIg2t
 D8zp0AHXzQToIqQCxzPBR5ZPAR1EhDY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-388-DBKtyqIwMFGTe7wdFvPw6Q-1; Mon,
 15 Apr 2024 02:57:04 -0400
X-MC-Unique: DBKtyqIwMFGTe7wdFvPw6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF873C23FD6;
 Mon, 15 Apr 2024 06:57:04 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB658C13FA2;
 Mon, 15 Apr 2024 06:57:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 0/2] Improvements for switches in hw/cpu/Kconfig
Date: Mon, 15 Apr 2024 08:56:53 +0200
Message-ID: <20240415065655.130099-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.127,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: grFCVuhQDW8p

First patch fixes the problem that the file hw/cpu/Kconfig is
currently ignored and the switches there are duplicated in hw/arm/.

The second patch introduces a proper config switch for the cpu-cluster
device.

v2:
- Don't make core.c depend on the CPU_CLUSTER switch
- Added Philippe's Reviewed-bys

Thomas Huth (2):
  hw: Fix problem with the A*MPCORE switches in the Kconfig files
  hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device

 hw/Kconfig         |  1 +
 hw/arm/Kconfig     | 18 +++---------------
 hw/cpu/Kconfig     | 15 ++++++++++++---
 hw/cpu/meson.build |  3 ++-
 hw/riscv/Kconfig   |  2 ++
 5 files changed, 20 insertions(+), 19 deletions(-)

-- 
2.44.0

