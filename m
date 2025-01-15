Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170298dlj;
        Wed, 15 Jan 2025 09:10:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWI5FsQrXgBNWlQ7RPPc+96ZKlU4yz+wapBCzgrxDRrVBPbmdgj5wMlLMclb2+IlMjEijSIKCND+jAEjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvOv++waOuSd+1VMCyTf/eqx+Vb2mKCPvzWpyJ7GiO4t8UY6JCQR8B+b7gVnWoxTIW6Kzb
X-Received: by 2002:a05:6214:1249:b0:6d8:8a7b:66a4 with SMTP id 6a1803df08f44-6df9b1eaa6emr512093136d6.14.1736961042193;
        Wed, 15 Jan 2025 09:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961042; cv=none;
        d=google.com; s=arc-20240605;
        b=Efd23Yj5LGFYYBruX9zd6QLo26nk8CyeNRy288EzHpsHoHr28SeOtIDdlkQrcIlXtl
         /SenOH4N8HI+Rf6npjfS0KNNdDu1EDywqgmHH1Ueox9badtFpk8yFw0/IkrDUxw3mKgh
         EvVKmAbnyl3fqDEk+7V7iZfDdN/CLNHRrlza13GUbEUuIyeDXYEIRodjGMfOMrT1r6Wt
         WvLEpQeCxbpp4xUkntQBRHmNNy/Ei88iUPqsJlJ3kdFbnkq3opY2VBFjFLpt4tglY9/9
         MPck92E2AARAIY/nJ64XPsaYUsjHUHuxCexP0vcuTwqbQi+0dw0APSm8279t7FJs7LNV
         2Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mucUZndHbSnQ/NqiIKIUnUVH/0ghWJZPNVfuuMeVrDw=;
        fh=DcoUyNgRnSH/ddS9z4naqlunDzHUmBwn3pUdcJ+15B0=;
        b=YlTIzq9j8GFV1ryfV/TzeqTDc4L5FaxSJ8N++1yQQF6wvbzs8rxPVkGgyl0q2zfqmv
         NIi+0ed8kLjH+IR35bqyBdPD+WIxiNaxOzshUfQBybdhylXylS7lQcSE83WhyYu8oUYi
         aIC57OOYjerj+P7zeMYzrtOsJ5LW/gzu8YtVUl107N6GSyJ2LDJU7NadI+J2IPvzhMBj
         ftrpVH2qUc+DxuiH0daxqPwwy97i+LIEIhILO0UjgZBMTcJzYaNoDCKwwjMcOuPSh6Zz
         +CaR4KcnPxj6sFIcG9UaabyJqjTr9+BP8cNwF+w55T+l1icfZfpp64lpCdYBeIb6ZasE
         PZiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oO03FN0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadf9b301si141081826d6.377.2025.01.15.09.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oO03FN0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6uU-0007F6-I2; Wed, 15 Jan 2025 12:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uG-0007Bw-T0
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uD-0006V6-72
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso48747325e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961011; x=1737565811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mucUZndHbSnQ/NqiIKIUnUVH/0ghWJZPNVfuuMeVrDw=;
 b=oO03FN0Nmg/DTf9vdeUo4bmZc1hFUWGPlCo0rdGef28WvfEoWdMAP/x45U2a4UMvj9
 Vd497WSnMR/miQtptIks8zFaPRUMNxOUcvOQIiJ47F35Yb+tE1X7/qYD5bdQYt0xBis7
 qhI4aN6SpxIcbXHYXlEvSRN8rzEP8oGl81WhFt9bSHpI4i9KQ82+5+NNXobRrbYiMzgx
 TZQXiAbwNyIyJjYogzpXeO70tYci6mNOve7COZJPTaCmSUBEvrDEVN4X2wrS5RilfWvw
 0pI9rEvFVZhclbTlhrRra4sIP8IJG7vDeP4gH0dmC5DjGT/SSSY8/gGU5f1w9QUXNXeu
 1Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961011; x=1737565811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mucUZndHbSnQ/NqiIKIUnUVH/0ghWJZPNVfuuMeVrDw=;
 b=AXy1RzXVJ0vkM0LYO/xHA4tOR2P9uAzMzouY2h34I4vC/P+Ax9g6toj90MtC8d2Irp
 0EeZ4WJ17BafpkLwpHSl5ohb5CLYyr0pZ3g/ZCbSK9y8cjESGIaOi5YTLKrvyam19H4k
 3Oe5LAigDJjiKrm40qRydSofbnD/t/bCYaNRvcuUdaM4YXX2BKpeoHVlSc38h59q3AXO
 E+EIS75gltZy+TLyHa1lwPfhT8Ag+59s43MwvE7Y7+J605FpCzmoGhxbPFGp4Bb0/Rpj
 n3jI8RgKkRR5HiOo6qCRsnxwhFno8aebxCZpRoFRz0wxdEL8rsXvTo+6+BnMI+1a4ypx
 nFRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWki130rI3hdGhbPVwWuRykDUaTEvRR/4u2vzVsFflPU83UY37vcD8/7texNOBNm/HQ3fcqib+jNA==@nongnu.org
X-Gm-Message-State: AOJu0YyMancguVAyG7kg6/tM4PS2xrjQ4HPJFsxwBYPN6TXFwfQ4CKjn
 xY3I5diJlccrFzDMDk5ZnsibZXsZvmx96oyg98t1PDeXtW3LszOnDiDf1rokKhU=
X-Gm-Gg: ASbGncuzPNpP03XFw9m/P/QJ2rrJkPnfGzBymsPz1QakUNnVNOwDs7TjwHu/K1MxkEc
 Dk2SDLxN9WhdQBdBDyJHWoy5xIDJipFf9Nfnket9nzczpsbvsJjDo2SG5DxVd/fC0hqtz91jfF6
 E76UoMFvUOL1KKYujvJ3D3Q3gdaGjUH3aqTKPQjGXgmYGgyESRv1j5X1/GpjFcaXlNFfkfVfbTB
 MU2i83k0n86lfYQygV39C3rmlz0g8OZEjkXZtQjvZOrI1CwNh6SG/zMMjo8tvCG/gQYYNVui12R
 OYuAWlGFGRdMRou6t8xwl9HKvGX0zToSDZYK
X-Received: by 2002:a05:600c:1c28:b0:434:a734:d268 with SMTP id
 5b1f17b1804b1-436e2699dfbmr308360395e9.14.1736961011248; 
 Wed, 15 Jan 2025 09:10:11 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499878sm30894735e9.6.2025.01.15.09.10.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/13] hw/arm: Remove virt-2.6 up to virt-2.12 machines
Date: Wed, 15 Jan 2025 18:09:56 +0100
Message-ID: <20250115171009.19302-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
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
X-TUID: 9jVS39Ez5e9t

The versioned 'virt' machines up to 2.12 been marked as deprecated
two releases ago, and are older than 6 years, so according to our
support policy we can remove them. Remove associated dead code.

Philippe Mathieu-Daudé (13):
  hw/arm/virt: Remove deprecated virt-2.6 machine
  hw/arm/virt: Remove VirtMachineClass::no_pmu field
  hw/arm/virt: Remove VirtMachineClass::disallow_affinity_adjustment
  hw/arm/virt: Remove deprecated virt-2.7 machine
  hw/arm/virt: Remove VirtMachineClass::no_its field
  hw/arm/virt: Remove deprecated virt-2.8 machine
  hw/arm/virt: Remove VirtMachineClass::claim_edge_triggered_timers
    field
  hw/arm/virt: Remove deprecated virt-2.9 machine
  hw/arm/virt: Remove deprecated virt-2.10 machine
  hw/arm/virt: Remove deprecated virt-2.11 machine
  hw/arm/virt: Remove VirtMachineClass::smbios_old_sys_ver field
  hw/arm/virt: Remove deprecated virt-2.12 machine
  hw/arm/virt: Remove VirtMachineClass::no_highmem_ecam field

 docs/about/removed-features.rst    |   4 +
 include/hw/arm/virt.h              |   6 --
 include/hw/intc/arm_gic.h          |   1 -
 include/hw/intc/arm_gicv3_common.h |   3 -
 hw/arm/virt-acpi-build.c           |  10 +--
 hw/arm/virt.c                      | 122 ++---------------------------
 6 files changed, 15 insertions(+), 131 deletions(-)

-- 
2.47.1

