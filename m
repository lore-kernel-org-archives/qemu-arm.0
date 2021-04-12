Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp2096147qvb;
        Mon, 12 Apr 2021 06:43:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyy31Wi6Leb79eea/eNd9HD/Up2JOL8Vv4EHCgWBHkMIg6zun76E2F1mamGmLsFi+BC1Tn
X-Received: by 2002:a05:6e02:144f:: with SMTP id p15mr4630125ilo.143.1618235015484;
        Mon, 12 Apr 2021 06:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618235015; cv=none;
        d=google.com; s=arc-20160816;
        b=dQYcnofl7xz+s8axlcTsa1P1pvKlTwecrwkI9ApH02OXTCsUtBHheSCvRCJguv7+OU
         uuSZJt+gprLUcvBbmyI4e6iSnvdERYatKgfAto+IxAlVYlA5uHHRHtRcl+sa6cGHq/BG
         rULNUCtGQlu9i4PBVFwc3hNOQ/LHK1eLOQum6/daGZbsSsx5RVXk8ZKYMQjAzK2wGg3O
         Oc2dHa7wSCTQN+q+FM15HdlZb8nKxTM4JRS538vM2uuALUfX0CQskBcflKrOSl3Ws5Om
         u5QswtHtwaQbsgK4SWRui49wdRtiA1iAn6xPcgng0eFlPnrHKJYbEBsfoyYj7OeUz5uf
         VNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=coR5qfcj7HbN5UNgt4/UQCpFaRvRt8MSF2O7M15ACS8=;
        b=FLx3ekf3oOQU9WalZSBE+aeHpcVRieCkenc44NpnAo7vNxaBwFdvVjF7rKTytStbXq
         FYoUIlN+YaWHBTovkv1XBZKKSx9URN4DU0IPzBaVS0Re82OA9eHsQI+Xw3ihhOK8Yovt
         z+u13K5XKPsOnLFBhjUA4tcb4Saduye4U8KLwRlTdMJtl7PVhqS+oassaWqxv3vaOW43
         rDQ62PbSvL1VE/gbQ5QFqBKm6BuW8iSYXQr8R2CbPUAUsd3bDNC3Od0tbBkQtOZmP70z
         qkILPC0osCRa7vsAiPMa45cYuBqiUA0M8eyDWF3lFzHRPoeyfUSqcJms+hktjv6KVCOj
         f8ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BMUfEZPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w29si12747700iox.12.2021.04.12.06.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 06:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BMUfEZPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVwqk-0004NV-RQ
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 09:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqb-0004Kp-Dn
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 09:43:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqX-0003N2-TP
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 09:43:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so264066wrx.3
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coR5qfcj7HbN5UNgt4/UQCpFaRvRt8MSF2O7M15ACS8=;
 b=BMUfEZPwGnUS8HE7k/U/fh4/0ucrzzjeMHFpoYRDqJoOqkRJMoaJRp6RMRUK47fN3S
 M/0CZAzeskwp/Kunx0UcRSKJUocnrKmaxwRyRxol5IsbHA8Xu5dMMEqJ2rDE6qu1UoGR
 5Junhb83gJzKiVY/ixs/74DIT8jegYMkEDCiLheiG7bgy9h6TgN5sIltBqarIsCiC71w
 nLT8VYBV4szL7mu+07eoYnkZVscKez4n+sfZGDKxEncNCcQsYizRtRmYo3LJZw/Vekc5
 Y67u3LLUOxFRSHDl96l759f1xFWgOFwdZKiefCE8IEQG7jvYZabr+8G4eCEwwb6eYfaT
 iz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coR5qfcj7HbN5UNgt4/UQCpFaRvRt8MSF2O7M15ACS8=;
 b=ChmJQOFBzopjTbnbq7aA1eQhGie7KOGhjA9NL2eje7yGc8az4LL8ZwWvFchEQj0gL7
 hEybeqZht1PTpo2apG7kBL4/vZ0SqTH1LB+CWFiCwHrQZ1Sh2GnUVjZqQOCu/G2LhU25
 1iRit2R5+Tho7ONpyYSHNIPjpBw0upy28kS6AejdePiru3bkllCnz2Plau2jwXkOcXOv
 O7ezqRlguqW3O7tHn7eOcYzCb742rTPqGOqzhJPZczK+mGYXHhowRSM768Bjue/rMcOF
 jRXms1emn3TaFZKXAo4YqTlCSnQDcttwFkYY3D1aUArohlL6myabUErbQ6nwqfdn4yjq
 CizQ==
X-Gm-Message-State: AOAM531cMgTPd4KYnTPR7p7gt4UOB7XBc28ii4kfQP3PY+uVroVOnHj9
 OiDEL7jy1EsGezwjSlKdmrn1zyRrhxKyrJ/x
X-Received: by 2002:a05:6000:1102:: with SMTP id
 z2mr9914770wrw.333.1618235000055; 
 Mon, 12 Apr 2021 06:43:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm19574680wrt.54.2021.04.12.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:43:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] mps3-an524: support memory remapping
Date: Mon, 12 Apr 2021 14:43:14 +0100
Message-Id: <20210412134317.12501-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: srM9wygqgxA9

The AN524 FPGA image supports two memory maps, which differ
in where the QSPI and BRAM are. In the default map, the BRAM
is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
map, they are the other way around.

In hardware, the initial mapping can be selected by the user
by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
in the board configuration file. The guest can also dynamically
change the mapping via the SCC CFG_REG0 register.

This patchset adds support for the feature to QEMU's model;
the user-sets-the-initial-mapping part is a new machine property
which can be set with "-M remap=QSPI".

This is needed for some guest images -- for instance the
Arm TF-M binaries -- which assume they have the QSPI layout.

Based-on: 20210409150527.15053-1-peter.maydell@linaro.org
("mps3-an524: Fix MPC setting for SRAM block")
though any conflict/dependency would be minor and purely textual.

thanks
-- PMM

Peter Maydell (3):
  hw/misc/mps2-scc: Add "QEMU interface" comment
  hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
  hw/arm/mps2-tz: Implement AN524 memory remapping via machine property

 docs/system/arm/mps2.rst   |  10 ++++
 include/hw/misc/mps2-scc.h |  21 ++++++++
 hw/arm/mps2-tz.c           | 106 ++++++++++++++++++++++++++++++++++++-
 hw/misc/mps2-scc.c         |  13 +++--
 4 files changed, 146 insertions(+), 4 deletions(-)

-- 
2.20.1

