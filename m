Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2904592lfy;
        Mon, 17 Aug 2020 07:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB6GXfvD2z7eE1RsjojEYc7V1BZMFyIN8Bfw60KfWuX07xS8c7dABznCEezryy6/DNVf1M
X-Received: by 2002:a25:aaf3:: with SMTP id t106mr19381734ybi.56.1597672924915;
        Mon, 17 Aug 2020 07:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597672924; cv=none;
        d=google.com; s=arc-20160816;
        b=WsaTcybhMZAX/6eZWt7e60CAxmTokW1rFLceylGORJaFLiaoKRmMxP+Mnhb/7MfVEA
         hDJmOOPPAETjaNhmkOf05HGupyKelEl6ZbUq1zxtRGJFGyjhlUS7s/fm+bCdfLh0UKli
         AlAk6ZlyVyblJU5IBnyOvPrABDFtaqMRvxBH3TEiPSehgiqvAB+Rp+honiaHJLMKGtTJ
         TYFq1QMD9UDc+tO9jXmJk5wqxfnbUgWmJW8mcGK0WQazrrqRSS3+5odCUVLaTgaFleN6
         pzKAVM/NWxcqPFgJZnf4Q4DR2vT94ZTJojAcXaECedVXrFNQGqLMsbB0HH4XL737qr4Y
         7iqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rFDNys71dgTDc8zx+0/nANNqkjvau89gJkLMGwhQhgs=;
        b=zg2eTsLZVsXstgx0RRN/bhAtzGaBPZzVsd9jo1vC7lpJbapSnYSPo5WjXKx9JXT0f8
         Nr3naCkoKpnK/okXBqboyTC6KDsQqENQgtLFWl7ZLTF0T4fugbXlSY/v3QQZteFawrDw
         8C9PVkd4kMD21lBjrtW0uMg6zi/iX5Fhl3KonE30jRVTMu/w5VB0ORMqX86ROkH0COTT
         LnyGxM5KGYrMvnECcvpdVdDQz92spxJwx/uL/o43zLj2IhrYdEh/dJdfez799hPrYWGd
         CqwnjmAMaLLZzdUI1RAqWpKVXQ+kTMe5ICeXr82fEiSzZR18CqYChlPNg3KvXpFsPPwB
         fBXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l6raCCzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si18431121ybc.333.2020.08.17.07.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 07:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l6raCCzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7fi8-0003GZ-23
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 10:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fhu-0003GE-Ps; Mon, 17 Aug 2020 10:01:50 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:46995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fht-0001Vw-14; Mon, 17 Aug 2020 10:01:50 -0400
Received: by mail-lj1-x241.google.com with SMTP id h19so17581186ljg.13;
 Mon, 17 Aug 2020 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rFDNys71dgTDc8zx+0/nANNqkjvau89gJkLMGwhQhgs=;
 b=l6raCCzOvUFPuI5nl8ARg3TRYRmzPZjNEJvFegsOVEg3ELpbb9SJXARRw9ak8WDRfQ
 eKIkdiDGdjcm+uTtOpslF8Foteu/wpN9byG4Bt0DRFGQhFKLMfHzJzs9VuZAvZ3Ol/cN
 iQTLQXnS1ONSGO4DGXceorVwkeSkFo3H5tXT6081b09zYAC0lHx3Llb8fKWDJlyRRIKz
 Bv2CF8FiSJYb941Jd2fhk15IJG9qpnfe0k0kEMB4KMCV2g9jWlBLRrYAufMl7CID1ONp
 jxPxA9pPlHZmCOUEYWkilX8ltjeKq9kW+57egt/14mOmvCS36aOAZ25CJRMkx1sJ9RRz
 H68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rFDNys71dgTDc8zx+0/nANNqkjvau89gJkLMGwhQhgs=;
 b=QBykhoU0f/DKeCS8KwIVAKLKqW39mIUpob/smmQFoaTYSuVCsdhhxlo1u7Xr24lZ97
 6BeVDZpGRBLLDxtt+0q7Jqc1jiKkBOrLhPFkINJviNT+0CFs+e3dOF7AW/pdzZVm+1Vj
 cQ5RVC/Vje5nCXyPca2l4nO3Klf1yN4weu3HWgG8Ff8FsZC3OtFtYCT2UtDPv00p39//
 bPn+YvYYzbB7eFuSQcTY2Bc6ULF0tWJ/yrQc4EAq2ffqYGuAyyvsrUJRcbj+X+3ySVEg
 cfNBip3173XglvJYLDLH36o8nmDQIZBg0lSGltJ9zcTVQhwCy/Jf60xMsCwNdL7OVL7f
 AzMw==
X-Gm-Message-State: AOAM530YX4FOdm9PtQBeLL7l9q0LDSDGv8G8vK5vswNDnl+vq/rKq0E3
 yXu8yul5ytoHxvb/Lc5y5ONykt/PBCNrrv7I
X-Received: by 2002:a2e:b5a5:: with SMTP id f5mr7800879ljn.114.1597672905999; 
 Mon, 17 Aug 2020 07:01:45 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id r8sm5522419lfm.42.2020.08.17.07.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:01:45 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/5] target/microblaze: Enable MTTCG
Date: Mon, 17 Aug 2020 16:01:39 +0200
Message-Id: <20200817140144.373403-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oQMEiCGi/Aqn

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This series adds translation for memory barrier instructions and
changes the store-exclusive implementation to use cmpxhg rather
than relying on single-threaded TCG.

This is primarily in preparation for future AMP machines.

Cheers,
Edgar

Edgar E. Iglesias (5):
  target/microblaze: mbar: Transfer dc->rd to mbar_imm
  target/microblaze: mbar: Move LOG_DIS to before sleep
  target/microblaze: mbar: Add support for data-access barriers
  target/microblaze: swx: Use atomic_cmpxchg
  configure: microblaze: Enable mttcg

 configure                     |  1 +
 target/microblaze/translate.c | 33 +++++++++++++++++++++++----------
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.25.1

