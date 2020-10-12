Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1041596lfa;
        Mon, 12 Oct 2020 06:20:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMXiAp50a7G1i61woVMHz9bB4h1UzavPbl2R/Y/Tpwmb1EwEOT4JNzGZkzteFl2r8cTxoi
X-Received: by 2002:a25:bc09:: with SMTP id i9mr32703344ybh.237.1602508839494;
        Mon, 12 Oct 2020 06:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602508839; cv=none;
        d=google.com; s=arc-20160816;
        b=fR0OQ821M4DV8TFU9aJgwGGmfobtOAYjBXRPS0HTJo4AbW1ELnX0aPJlhyMsKe/lIX
         EIvdnRkBEh/mTe+AXlzUiQ+nYA6vmeifs88LAP4/bnQTg8/mpHNUxZVwbHAZH0LAV3md
         ZPgO5YT3bRvwZ/kGl6GpT0thq9I/q8Tb4BoRWwk7vP3yPNcTG504d0dK0n3HUhv7qj9l
         WV1bKdUHxETQJ6VpYcJSIQYR79BYx4hSIQ71qLy270fHYSp2W9OR1Ah7XOLHbsl0cl75
         vgAOm7uthfVY1BO7TZGOIK6AfjQER4fuenoK7jlfRwI3AEI1c/Pl0MVFBTVul+tKAMOu
         TvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=05RfNurGaAHkRWlZ1YYxqFf0MRZv8h15YxydMsNWKx0=;
        b=g1RqlgplHBMoB7LF4NacwLBeViNhbLfQO+4JAeHyGVHfMxDh5Fs7mboARba8UAn8jB
         w384iC2kMYwbu+dFJnI8N1BDSKAvtb6plVFDLc02Mm4tTp+m7pivzSNHRdlUeaqcfJFF
         IK7m41tFs7HuU96WbYEBTNVjPCqdThec4zuFtvYPK4TrjGz0GFHyKQuMsdbRA+CNfeso
         Qi9b7iAgv0hntiUv/vngqX7DPubzA4ipmRasiBQ8ZWSGC2fMMg6Oqu38v42ETBQxr4kp
         01/23zy4elpBJeAzJ2E5lLmIBnaR68XYQo3uDlpgT9sx4Zo4pr6oJVwXlxmqu+mcLLQv
         vxuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Klg4jDOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d126si15073379ybd.67.2020.10.12.06.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 06:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Klg4jDOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxkk-0004kV-PV
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 09:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxkV-0004jA-Ug; Mon, 12 Oct 2020 09:20:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxkT-0005Fg-M4; Mon, 12 Oct 2020 09:20:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id 13so17168482wmf.0;
 Mon, 12 Oct 2020 06:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05RfNurGaAHkRWlZ1YYxqFf0MRZv8h15YxydMsNWKx0=;
 b=Klg4jDOF3uxhIMfMszwhjX7wIHESa2ulFQff3ybFJU3mJTr5mYM7RjMDR1UBVHRmnp
 NihX4egubF86I+6z15EypOXG8z5cOs5INzwh7askzE8ep2cA4rDMuZAiStwkM0EFW2D7
 lOAy1KgFvuDSHHOOrGYKof9c8fLpxa3bgjPYAroQggz0HUf2Fk+QGv7M5V07fxW9nhgk
 VEg2FBGhIzav4KJgIuHcTlfTFnX1VSt6gwu6VJBa8PUVvOx+3RmyGgG78cGOP3HP1Dg4
 arcwkhNjxqqa8XGj2kou4rjosW+Mh7yvmcS41redFtig/y6kAxzZqXERrhHJFkrvIJ0R
 P7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=05RfNurGaAHkRWlZ1YYxqFf0MRZv8h15YxydMsNWKx0=;
 b=N/BZGHjkIdlKTd4dGBrC/lK9jBid/BylZMy3gVxRG8s9dYg18Ozpv575LbPbxH2teA
 OJ7pr0EZ9Qur9eX83yAsutNSmxo+OilJ/VfQKCQ918D8+AZTyt6UDwdKof3Rb7zH5/tp
 jHOPOV3V1VDFxoIrJvLhLio+5HQcLzQlBog3xWBhtKuhobr9O4gXmSH9HxXPiUD8fPJT
 +typjIpbJxt6sLb6suIYfW17FdpYkKapUbCapnvvn1gKHBSGBtZmvvPeUIASAYsbZBAs
 w9fOU/i74qsCK/ngHU00ZY/IZX2XOYOn4BsqW+XwCKM0AA+yEOqFfxHmuAaUFDvvDImV
 k1ig==
X-Gm-Message-State: AOAM530hPiE0MBDL8gklviyA76dDGxXVcHpE+lrAWcmUPePTh76NWXZw
 rwYzIbrgJyKNaylB9zJXaqLGrO2hUF8=
X-Received: by 2002:a1c:1983:: with SMTP id 125mr10768239wmz.29.1602508819174; 
 Mon, 12 Oct 2020 06:20:19 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id t6sm28092754wre.30.2020.10.12.06.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:20:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw: Replace some magic by definitions
Date: Mon, 12 Oct 2020 15:20:11 +0200
Message-Id: <20201012132017.3423954-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8b7wMGgZIbqx

A bunch of trivial cleanups, replacing magic=0D
values by definitions to make the code easier=0D
to review.=0D
=0D
Since v1:=0D
- Addressed Peter review comment on versatile PCI controller=0D
- Added Thomas R-b tag=0D
=0D
Expected to be merged via qemu-trivial@.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw: Replace magic value by PCI_NUM_PINS definition=0D
  hw/pci-host/pam: Use ARRAY_SIZE() instead of magic value=0D
  hw/pci-host/versatile: Add the MEMORY_WINDOW_COUNT definition=0D
  hw/pci-host/versatile: Add the PCI_BAR_COUNT definition=0D
  tests/qtest: Replace magic value by NANOSECONDS_PER_SECOND definition=0D
=0D
 hw/arm/virt.c           |  4 ++--=0D
 hw/mips/gt64xxx_pci.c   |  2 +-=0D
 hw/pci-host/pam.c       |  2 +-=0D
 hw/pci-host/versatile.c | 46 ++++++++++++++++++++++-------------------=0D
 tests/qtest/rtc-test.c  |  2 +-=0D
 5 files changed, 30 insertions(+), 26 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
