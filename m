Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp378543ejb;
        Tue, 13 Feb 2024 00:12:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8zaG/lOxCwNucynJTkF4ckX7xRp5zMtcHSXfCXR5rtjfhjq9R5gstfX7K7Ie0T0DuvYJb54PBmzW3nExj+EXhal8U+Pq1
X-Google-Smtp-Source: AGHT+IFdy1Jcg0rsum1OhLXZXmYJMexqwRRY2iiSOqAJJwEMVYgG/TCyk7LJfqlpyw/X8uDVVK09
X-Received: by 2002:a05:620a:40d5:b0:787:2269:b07 with SMTP id g21-20020a05620a40d500b0078722690b07mr155528qko.34.1707811943283;
        Tue, 13 Feb 2024 00:12:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707811943; cv=none;
        d=google.com; s=arc-20160816;
        b=Wtys1ZObOJbKFru9S2Ur6m+AdVtfHQgWZ48/Ob+BTkaxf/ZKlyYJGa8learaj0OtD0
         39DM94UABxlp5CqxlOM9STST+fJeGk3pikuGr9Y53loQZ/OuilT+yYGijg9OjjV95n79
         7HVqM/Sy+qOhNYnMHvBr436keredieBR+24QHwajnmRJPLHN4Vz3YjYu3QEUL94cJUxt
         iBjuaTK2KvCQxDN/UVdP8ZSmeNhQ6wcFpbkewfNG2ojoNAlbzmIjgS8PGlKLKTPnLP4T
         3AzoEkVugU7AGL4VxFEPFKmy8fT1AjZQ3roXY/KzkHD5gYFQ2ip4yfQ1GvJVU5ssBH1q
         glFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SNdTU2HlcU5s/z0+DB1v8IvSjqtCtnO33Hovm2ZRDRI=;
        fh=L2sq5uUCEX0kA9CgPEL76mgdttI3O/Q49oFLxIw6gik=;
        b=KYG8u7vEc0P2DmNALt7rNdROmVxiFzyEavf++sCmNiWy+xWMosAI4StjjMhFgNwyd9
         jVnlJLPMKqOtYw1oWTZ2KASWhBetyql9BAO0y7m8dExFm3DmvPJwcyeavwkBbeoYoRXP
         eCvkDW0+0iBAky1CBIR+n8iZpfdYFJCSmVymKSP4HwOMHl6xXpGB9xFY2B8f/tysQVMN
         UugYopTmkppa+idxF2Hsc32loV9qOJnMs0cYIUxFqzUpPXk7DcBixqpTc2mV8pMBqDdb
         Tcc08cZP21OoytTrV3LtBBUKo9/Wn8OeuLx6iUmagLgx0MapGZnn13h1jx2gOl3kWBHS
         eSPg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrTJd1y0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWz7crq37aFvFDip6MgOHzUKtUOOe/ZqL9Dquk0KpTSZFoL2m8eCl5n0Y7S0eaY/S2QFXiITK3ekjx5km7hZq3KTMSxbrtR
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a000d00b00785db666b7esi2771016qki.739.2024.02.13.00.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 00:12:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jrTJd1y0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZnti-0000OF-Ig; Tue, 13 Feb 2024 03:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnth-0000Nq-7l
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:12:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnte-0000hb-T3
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:12:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-410c804e933so15073115e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707811925; x=1708416725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SNdTU2HlcU5s/z0+DB1v8IvSjqtCtnO33Hovm2ZRDRI=;
 b=jrTJd1y0UofU/Cyckn8d6gfeJ9WI3AyZ4531Cyi/cREb/kIvzdv5n5XqYyHx99HBKP
 IW3tKJP0Gg5VEmuDFJf6+m8Vefils3FJZppYWGzg4PCpYEKagIt8WOUxYYolaemBKK+0
 8E4bLvTHRIws9wR088RXD1cosH/LypSnChcuQLYESmfe1vUCYMCUCH/reMrxbi6YL/0g
 3RrHQWvV0QZZGBO5njgsn2OLFpRxNevjAkabC7dBJhhBPyw+MvJ/j6qucqfvw2uGGmx3
 ZI7wMwEMQGzdWYbDULkv0JzwaLV4JzpPZOef/yZo8mxrnQJ7dQhP4AqkbDstg3D1AGfM
 4ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707811925; x=1708416725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SNdTU2HlcU5s/z0+DB1v8IvSjqtCtnO33Hovm2ZRDRI=;
 b=pYG4UGa0h69TXm5igorEGpWAI3j3XJETvC9lmfSwMnHKOsxxzBmXwPPYSuY+popyYz
 mozjFX+z4or4AJ0m+C1Y1/h7YsGYs7o9Pwz80+5YoN2+Rc4g7jcQK33IPCKbEx8OteKY
 aNkDmFvtDfadeER9rifFCRVSojQv8z+i06k8a5jX1BtoWR3OzwfxpYayaqnkQVZKPast
 32VbNtDk+4SxBrbVfQEzqzZ326LStv5HojyOlnvuc1StGdU3txH2uaFo+tmqX+7RI3/Z
 WGF9Yr4qyQjARPRzhwvCJvfHiVtTrlr3GaLwYEbAODp6RHIOw5uUolXqQvl6gBMREhLp
 8LsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQLRZROiiT7AANmMqZ0LdUgX7BehR+oYFlf1wrSN7dsRQmjhySb84oAwXrLqVAG/+N48s2GZURKubu2ZkPgj2SBMsQ
X-Gm-Message-State: AOJu0Yw0ARGU5EneEvz0X1dzmdH8NTsrXWtmzflPD0Tx35q8Vqk3ena3
 T3IzDkPg/XVhxLykvGFcSSUrUBxei5pvtoIxFeXORTf8QY/cmvd8SNFWpz8gYbA=
X-Received: by 2002:a05:600c:35d6:b0:410:bb99:af83 with SMTP id
 r22-20020a05600c35d600b00410bb99af83mr4869569wmq.23.1707811925007; 
 Tue, 13 Feb 2024 00:12:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjyWtWroj3K6+6Zu0pzKH2TyHoGYRVKhqorsEmjbCZW7clzgCibkXPWOTS8EmzF0xQNv4sgJBWbnBDHB+OAEqIEOS5enI6IZsO/KNpC/HY2NVlFTwiIU/lupgySWWVcEcvOnmJ7ynG28tlHzLJ+F40R9jhBSH1y5UauBEr6BwDXXyZauc2p/iueLMWCD+QCiuc3SZFiNlPXZUGkY3JnPrvyk+E2P75Qxuazzkx7qRdrZFTShMb2BFFhUEt6xmOqjdyTPyZZrbqGbQ+QzEvwPLtrLsWiCo=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 jz15-20020a05600c580f00b004101f27737asm10808681wmb.29.2024.02.13.00.12.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 00:12:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw/ide/ahci: Housekeeping
Date: Tue, 13 Feb 2024 09:11:51 +0100
Message-ID: <20240213081201.78951-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: IEDm83vs++Bn

- Split 'ahci.h' as sysbus / pci
- Inline ahci_get_num_ports()
- Directly use AHCIState::ports instead of SysbusAHCIState::num_ports

Philippe Mathieu-Daudé (9):
  hw/i386/q35: Use DEVICE() cast macro with PCIDevice object
  hw/ide/ahci: Expose AHCIPCIState structure
  hw/ide/ahci: Rename AHCI PCI function as 'pdev'
  hw/ide/ahci: Inline ahci_get_num_ports()
  hw/ide/ahci: Pass AHCI context to ahci_ide_create_devs()
  hw/ide/ahci: Convert AHCIState::ports to unsigned
  hw/ide/ahci: Do not pass 'ports' argument to ahci_realize()
  hw/ide/ahci: Remove SysbusAHCIState::num_ports field
  hw/ide/ahci: Move SysBus definitions to 'ahci-sysbus.h'

 hw/ide/ahci_internal.h         | 10 +--------
 include/hw/arm/allwinner-a10.h |  2 +-
 include/hw/arm/allwinner-r40.h |  2 +-
 include/hw/arm/xlnx-zynqmp.h   |  2 +-
 include/hw/ide/ahci-pci.h      | 22 ++++++++++++++++++++
 include/hw/ide/ahci-sysbus.h   | 35 +++++++++++++++++++++++++++++++
 include/hw/ide/ahci.h          | 38 +++-------------------------------
 hw/arm/highbank.c              |  2 +-
 hw/arm/sbsa-ref.c              |  1 +
 hw/i386/pc_q35.c               | 19 ++++++++++-------
 hw/ide/ahci-allwinner.c        |  3 +--
 hw/ide/ahci.c                  | 29 +++++++++-----------------
 hw/ide/ich.c                   |  4 +++-
 hw/mips/boston.c               | 14 +++++++------
 14 files changed, 99 insertions(+), 84 deletions(-)
 create mode 100644 include/hw/ide/ahci-pci.h
 create mode 100644 include/hw/ide/ahci-sysbus.h

-- 
2.41.0

