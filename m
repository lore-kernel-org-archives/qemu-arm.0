Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5571132njd;
        Sat, 5 Apr 2025 14:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgzkV0S+DbnkxFMwCRleDtIJDZChn+qEaPDWn8uBJiO9WLDMGZewWZgLyh0kV2j+m9dYziMA1Lh/AvnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEafDefCTCHG3RBwlqs9cNipgHoFTQJzd3iBLoKg66LmCfXAO/a4l8UFAeXmZWgrrgepKY8
X-Received: by 2002:a05:622a:255:b0:472:145:3e02 with SMTP id d75a77b69052e-4791615e607mr214610321cf.8.1743889813682;
        Sat, 05 Apr 2025 14:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743889813; cv=none;
        d=google.com; s=arc-20240605;
        b=gs7jVg8V93I9JKENMmUtMyNgHhT6UsRYfMP65twHiW6L8gweKDkUVLsKDcWEhAkBPy
         ErfuAESpMfC3lgNd+SJyHVNOE7fNh4DAR1kqtDlPqFakqykeRw+JwFri+gJ3m8wYV3Wc
         dEe8kcy+xq1oKxCjAN9z1dDMGr6nU+jsonnLYrE6oeHlIxzI7l+t3ULd5SpeRBu224YK
         kx5r/EhfCHc5OgoWRZpTxcMVMxnygDs/p+7arweZvqsd3I6p8ybkrIlB3Km27SlVtToH
         P3yNH5Kc2rW+RNwdxbrnx6dN3hcBofjXe35nuKApym0Z77V2pPpkwY2+yG1LTK9iai/r
         P2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1d1BLMUXElgOrmHcKtE/T31W9fD0LUsaqgDKJy8c1to=;
        fh=WS0rIFSsushnaBUVE4ItdYMMjTSeyfaZAUD2VGgKDuI=;
        b=VaBd4PhTkFTxmtjnxhgWj+mDGpSGUtSjrxpG4AcHQbkMKdsON4n6n/cm24XqpSY456
         PKiVZGAmOTtYilcBLUkKG0G00UrF5kXMQutDJaeMdoF7hH35F5gvTloE+CDMKiOugcQC
         fkNBBA97RfkR1ELNPRET9HQsffJZ8fr4ZjBNyWTHJ6uQG3QQol4vCAykKnMJPrwYja/w
         ZYAu1MZfLjFC7Ab3oJmzETD+RgnCFr2jqUW6v+7crJv+OhvcuMMja/csryJu00fNcdju
         bLUmg0IRnzC9FS2ZK/LNkGaFrX7PoGNuFWbPqx2zEBPLoZD6qGsOBC0yNK1tKOQ4xdGY
         zPpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="DySdAS/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b05c956si59507131cf.47.2025.04.05.14.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Apr 2025 14:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="DySdAS/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u1BOS-0003VP-9O; Sat, 05 Apr 2025 17:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1u1BOA-0003R3-Df; Sat, 05 Apr 2025 17:49:19 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1u1BO7-0004N7-KJ; Sat, 05 Apr 2025 17:49:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so5586601a12.0; 
 Sat, 05 Apr 2025 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743889751; x=1744494551; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1d1BLMUXElgOrmHcKtE/T31W9fD0LUsaqgDKJy8c1to=;
 b=DySdAS/L7p67ll/k6oxsCy5aFbyUcilG1B9gqm4uo1PPJYrZS6oHP5qN72c866Turz
 wwzcUgIbTC5UE21pZ0QybWGvPCZGtaW6UPAiwsYkKUOUeMr3dBCQOIgXfv8A7Eq8O9+J
 L+uE7iz8dsdMWL7B3j0BmSI6ImUSPchGls+0Wy+rYttWP89JM8WQmdGa7Wf4h23iWQFN
 8HCSZrzFuNqfRRVND7BFRTXXNz0mBhFQ76iCayQTFI7pOHoBS2CyUoQpjA+icSvOgZ2Q
 rJJTMLju34IBMVb4SoYZDeMxzXKNj3BDppNncNiJOQGFXac0m0dNyFS9LP4vGKyrPMWO
 B2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743889751; x=1744494551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1d1BLMUXElgOrmHcKtE/T31W9fD0LUsaqgDKJy8c1to=;
 b=AjgzNnC9km7i5Dv7SYY53okVxDGoGNTqEf/7jAnN5q2M1jWeMdBSTxj7z4eO8iYD6U
 tJiGtSqn695RpGTmx0EfuFIcjr4hmfsT24xuLpITxVi0MP2kspR99Z82TaZIqA6zrB/P
 9jT1a3f3mqS96YMaxCW5QTEMfL0x2mMC8VoB1CoNgpYr1N8CveQdVNuWHVyVtnj2llPe
 LNgda7H0M1djYOEXFA8FFPtua9oV8NpoUBHbrpxVTtZnncCBJLphbHSHse4ThaAm4HYN
 J6r/Yk4104USgR5QBYfYxs5UcIE0IuYtnE6SixrrL3AvE+S+kTX6mwtgQke932KSJBiD
 TI1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhVMnh9R9pbhhOoGUIWwRM0d59RePz5i0mmmzrp+eCjvp7WpO32qIhinoGE9iWcR7TlfO4EpBA0Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw3m+rVmIu8ULqBCKb6X/2sHlozh9LR3E6eJNjTSgJD3E3+yoIO
 /uOJPgVw1TZyYXkpXrMXogQSs+F4cEr77PdlTPXG9IfJZbkjUg7qD5PYQw==
X-Gm-Gg: ASbGncu3vkGmPJYuy3Jhut3NTFwUkNZOXC/E1dQfobaeEW1i5PHDSm2wP916sz9rxIa
 /0owcS2Jg13MIViyuR8nEzYIEOB560OQCeKUnsHrxb+IwqmZLNo48iYdpDYInAOIOCLQm2MCzDS
 zmsLlqbUvVwvRl01o3BtLgl61uwy5CZ1YLWzZdejifekTVgc09+4KqT7Oz2dNynMugAw2ccx0zL
 oY1eJgC2BcKz/5/zMYqaXB+VUwmd4SDFvwJi39XZDZQwgaVh1YSg7hkceTOSjLI4lcS7DtVwMuc
 uzy1xFn6gWqXhFcQ74O+oOWDiPcJ/JyHZxmcnPmzGJ5cKgTN/mvB/QZY0jFXla8kM/oQ2kAeXrs
 RWwu/cJvT7fCdKem6HO0r/NAIwhptWdhH3ywLsM/5bC2eDPL9RDgRsfQk7nb8utdA
X-Received: by 2002:a05:6402:2793:b0:5dc:7725:a0c7 with SMTP id
 4fb4d7f45d1cf-5f0b3b65995mr6180765a12.3.1743889750813; 
 Sat, 05 Apr 2025 14:49:10 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-1bf0-7700-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1bf0:7700:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f0880a535fsm4382270a12.80.2025.04.05.14.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 14:49:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-10.0 0/3] More imx8mp-evk improvements
Date: Sat,  5 Apr 2025 23:48:57 +0200
Message-ID: <20250405214900.7114-1-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: tuW/C7+e4jDU

This series adds a functional test for the imx8mp-evk board with USDHC=0D
coverage. Thanks to Guenter Roeck the usage of the board gets simplified by=
 not=0D
asking the user to remove the cpu-idle-states properties from the devicetre=
e=0D
since that is now done automatically. Likewise, a stack trace during boot i=
s=0D
resolved by also automatically removing an offending device node.=0D
=0D
Supersedes: 20250330094139.11948-1-shentey@gmail.com=0D
=0D
Bernhard Beschow (1):=0D
  tests/functional: Add test for imx8mp-evk board with USDHC coverage=0D
=0D
Guenter Roeck (2):=0D
  hw/arm/imx8mp-evk: Remove unimplemented cpu-idle-states properties=0D
    from devicetree=0D
  hw/arm/imx8mp-evk: Remove unimplemented nxp,imx8mp-fspi node from=0D
    devicetree=0D
=0D
 MAINTAINERS                                 |  1 +=0D
 docs/system/arm/imx8mp-evk.rst              | 12 +---=0D
 hw/arm/imx8mp-evk.c                         | 29 +++++++++=0D
 tests/functional/meson.build                |  1 +=0D
 tests/functional/test_aarch64_imx8mp_evk.py | 69 +++++++++++++++++++++=0D
 5 files changed, 102 insertions(+), 10 deletions(-)=0D
 create mode 100644 tests/functional/test_aarch64_imx8mp_evk.py=0D
=0D
-- =0D
2.49.0=0D
=0D
