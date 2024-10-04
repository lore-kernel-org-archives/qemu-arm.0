Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp557109njb;
        Fri, 4 Oct 2024 09:22:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb76zO96UCLbgGRUfFuZf2vlnG6AOcSQ3kZp/+GBJNHqosMa25tcMhoVxpwhAKU0UsUnw3NHipXp0BSA==@linaro.org
X-Google-Smtp-Source: AGHT+IGVmqnvmgb+1ab6oi2pClNjA3hts9R9X/IWwRTvli3B8deEO+6dF9jIIn3OGpfk9p923NWJ
X-Received: by 2002:a05:6214:3ca1:b0:6c7:c650:90dc with SMTP id 6a1803df08f44-6cb9a466299mr49104366d6.34.1728058936736;
        Fri, 04 Oct 2024 09:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728058936; cv=none;
        d=google.com; s=arc-20240605;
        b=h8CDau8YbyGLfxIP/4aq4/2JKQ+U4msXP1mm8NWtycx1HyHnLPBhWSd+8JLKhLuwLb
         vLe5fgc2+qqaXZZVLTmfZvq4Iw2QG1kH7+vWJrZOC3OldTVlWhRJqE6Kzz+QE9blfZLE
         QLqu5M+yTQW6n0308eq+bmub8Yu1kXl5SMICQiq76zifMY3bRNTvNDZWopTzy7MSGcp3
         tAMCTvedeg0SrTVunWxAoyQbYfnopyLuOwh10UsrqXp54pwUU3QnJyMqLm6go+DfsR0m
         /OUPgDMymPKyaCc8NVf9Y8KRQeRSfZ5E7S43mzLFW7Mmpau5PW5Ru520r4qG83TeqgcF
         ztuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gAASx7TY8bTkB3/GQlruQrs3zPDMiizNhLdumqS8Pfo=;
        fh=A9nfT0BRFykAP55077k3m5GDjylTFgtAodVcDbAAlE4=;
        b=jisBr468RSA70p0vEbMoq1HoUMB3RDRy9aBeN/Mro+rNmX0KCu4f6PiTkDDw/PhokB
         mRiIeRp2T1VK7hCXE5S4vZHgAym3dEv2ZRRFZG3jhrWCFx1cdjNXAimRXEIYZecnZ2/2
         VIgSYiLsIX1El3Uu/J8o2ryhLXt/CoQDHnjwB2Ht+6AY6XYt3tfLSObYay2ayE79WFVs
         GIPnVx7/AZKx6LhVj8nEsuJmCnAs+eJxL85QdGHGKxdBZExVtavPfHnAk0vgxfw6JfZd
         D6HjaByW2ztSZXG8v8a5mfKtjb9oqS1u6cf/lbKF/BvqIKrVfpJhU+wHxWF8a2Hivd00
         uV0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YYWsfRmr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba46d70f3si1511936d6.13.2024.10.04.09.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YYWsfRmr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swl3l-0003Gf-TP; Fri, 04 Oct 2024 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl3k-0003Ft-B8
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:21:40 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl3i-0004GU-Sx
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:21:40 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so23777751fa.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728058897; x=1728663697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gAASx7TY8bTkB3/GQlruQrs3zPDMiizNhLdumqS8Pfo=;
 b=YYWsfRmrAUdvBE2fjC8u/A1UhNObiJZSO3DMLM5RKuqrC9CoeCK5fgG3CrBAaseTTj
 IW9/eS0h874Kf9J9ru64x9NV8AerkHYLKjndhd2mAvAMooTmStKYLnarDr6vIUzzakr9
 sq1NINsqNOeZxg0uBV3FMgnnIrneKhiBVHqvmwD8MdvWoave2PtDmprnDn3qWgYB7qxK
 GTsNB6FOq4oyAjM1bIHVwNxgeWdyPJfInlALA+o3Wfpzj4fYMs9bfunpm/e/9CRG3y3z
 OFoKPOzw/oWehykOQ9galj82qwf3Me242ztxg81b/nEjB90TzRYDNxvTwkzaHbEWq2jP
 sEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728058897; x=1728663697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gAASx7TY8bTkB3/GQlruQrs3zPDMiizNhLdumqS8Pfo=;
 b=RzqH5Y/GAIEtP6smH50NFLFbmOWF4X0RF5Gyy98EDD8ETPbkz3F7jDNsYQtGeB5HkX
 9z3WsvMNlPzVUa9GNSrOD4fCOmXSWXdEZgmn5a5enm83bvjg9HxdEyTHFTeGc8Put2kp
 dSRfgw8dD08CzT9RPSjaYejOTCwevg1OcdoHa5SDcPVHL2iyJ3ipZma06oqT6THyPygn
 96zm4HCyek4Kc0m/d/fpmkQ+Thzn9AgM4UPWNT1RzhTY9K7EnAfobibEU8CkKZXnPIAc
 j4RGlQL/LCXe5xl/npj+l7+WPHbaeOqDxw+qL2/6FtUYiZJ0NL5XDjGc/XtaXZYbmo6s
 p8ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSpMavLRpyUyOPfP6FuN+gTUgVrNRC/AT4WoB7gBESB2PsRtCIBo0bFnPeOK7DysaBbUpxi9W14g==@nongnu.org
X-Gm-Message-State: AOJu0YwXw0SX9yf4AGEyaaMCeJQ8Vc02xm/2ZnlIZtkvNdBoq0f0pOp0
 YehOWQxJNp71MfS59ZJ8iNOzgjNueuoEPoLU5R5tfklLv/jNvdW1VVUqIPkXs18=
X-Received: by 2002:a2e:be9d:0:b0:2f7:ad6b:a31e with SMTP id
 38308e7fff4ca-2faf3d75b0dmr16935471fa.31.1728058896925; 
 Fri, 04 Oct 2024 09:21:36 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.208])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ab1564sm160281fa.7.2024.10.04.09.21.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:21:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/8] hw/core/cpu: Expose cpu_is_big_endian() method
Date: Fri,  4 Oct 2024 13:21:10 -0300
Message-ID: <20241004162118.84570-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: Dm/xWt4GWL2w

Introduce CPUClass::is_big_endian() handler and expose
the cpu_is_big_endian() method. This will be useful later
when endianness will be propagated in the slow paths,
allowing removal of various TARGET_BIG_ENDIAN uses.

Philippe Mathieu-Daudé (8):
  exec/tswap: Massage target_needs_bswap() definition
  hw/core/cpu: Introduce CPUClass::is_big_endian() handler
  target/arm: Implement CPUClass::is_big_endian
  target/microblaze: Implement CPUClass::is_big_endian
  target/mips: Declare mips_env_is_bigendian() in 'internal.h'
  target/mips: Implement CPUClass::is_big_endian
  target/ppc: Register CPUClass::is_big_endian
  hw/core/cpu: Expose cpu_is_big_endian() method

 include/exec/tswap.h          |  2 +-
 include/hw/core/cpu.h         | 11 ++++++++++-
 target/mips/internal.h        |  5 +++++
 hw/core/cpu-common.c          | 14 ++++++++++++++
 target/arm/cpu.c              |  6 ++++++
 target/microblaze/cpu.c       |  8 ++++++++
 target/mips/cpu.c             |  6 ++++++
 target/mips/tcg/ldst_helper.c | 15 +++++----------
 target/ppc/cpu_init.c         |  5 +++--
 9 files changed, 58 insertions(+), 14 deletions(-)

-- 
2.45.2

