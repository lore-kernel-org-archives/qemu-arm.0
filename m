Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp791987ejb;
        Wed, 24 Apr 2024 10:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnHOKLYKUSFveL1I9r9Z1tQdTgAJOXcACnUTqjVWrCXaYTznBW3FGWCLn1Wj43YlKTSXIETSrpxw+6GNwyGtjNj6GqtNd2
X-Google-Smtp-Source: AGHT+IFBByKWneX3tUSxW1jbNUCgGAML3HHhiQWqeu2z863v1/AdSujW8TdaB6Mj99xnJ4ERUab9
X-Received: by 2002:a05:620a:579a:b0:790:8cb1:16e6 with SMTP id wk26-20020a05620a579a00b007908cb116e6mr2771539qkn.60.1713980763061;
        Wed, 24 Apr 2024 10:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713980763; cv=none;
        d=google.com; s=arc-20160816;
        b=y07nbpbKqxGPTX/7C/TCxR+vyevN2enUaoBOTnTkIvM5l2ZnUbr7j2B60YNcUo0ZtB
         FjiGvxDFu7/unsb7kHgA2Sflb5w2REtFgDnA3+4T6o7k7PrKp2LLbnIRcIv5AeQUkTLp
         Q03cMRtHBazVaM8OorJ5eycSd6Dg65G97wpGxLqKBsLNVYQU9S/l+Z399E1V/FbZiXXs
         PAz3xVwMB5uOaDj0siEYIk2asOCcbc5q+jfaxxRqTGXDTjFIKgQuh14EWiXZS3jPLhoC
         SBeKSrJuGgdO6+YivJpgo8GzcSBu/Mi2Cq7fSQ48gY8NdxUDWWn3xcyCRS+q9Bwj++Hr
         zrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ml+4qNbbwrewfNa4tKqFrq9Yee47wMDeCNmhWRp2b6s=;
        fh=kFznyDGgQWa7EGHYULnbMFEUYfrx+M/P24heDjBu56Q=;
        b=I4R+XS6l8H0bBLrBkmZH1So0Vak8BJPGaiFvC/c5yqpm3rcmCdxbP8H86OTyofhoIO
         qFuHy5ZQmu//iJvHlmKjkfJ+KaEOuydm+Qa/82rrKo8DUWdu0mgZ092FsDSTG82eam37
         RiDMtnQ0JxhlN2ipZhCUPB/a4BArJ9XIKSo6vq05yh8fKpHITzYIhR9DsvOyJjGFjKIL
         H6FUriAY9VbQgPO3dB4gNO8hvSFr7NlYtKy7p3YhwGfniqUGtWYScJmQna8UVYGisgMv
         brj3ksvlxg8Z5t/Gu7ntgSAcu3xDMpJK6lEfHzI/UNyI72d3fkNuV9ATNyNbXawAOnGl
         L5DQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmqRn2sW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xy23-20020a05620a5dd700b0078f103242a9si14799385qkn.489.2024.04.24.10.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 10:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmqRn2sW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzggH-0005I1-MN; Wed, 24 Apr 2024 13:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzggF-0005Gg-DZ
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 13:45:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzggB-0005Yz-S5
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 13:45:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34665dd7744so45351f8f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713980709; x=1714585509; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ml+4qNbbwrewfNa4tKqFrq9Yee47wMDeCNmhWRp2b6s=;
 b=mmqRn2sWKxKWFqDbRi1SWv0AMAPn0YKxWhD+Mmap2tV+ILnHP0RezUrhhSuL3+a5oQ
 URLQ7VZTbccfVtyjcezzow5RjaUOi3Qmi/5zrNIiD+88dIdOp+QvfaUPouuPWaEmucpX
 LfNzvFvRnW7B7MrzgGvZLfUjwcwV+YavcyYle6Eh5Km3vBRJXD2u9aJR9zPsBvbV8k6u
 bNZ0bggLB4zRmyc81aISpyq3lRZ4rcsBWEJnhaNeAJBwMCvgDA00SVkqNb3ejlfgXoi0
 bh4r12awrD4taG2VqGfsTFdJfZrvoeVkbX4ev6LlYF8okrXHVWoIOt4GpZn1+H/rW5Av
 rpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713980709; x=1714585509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ml+4qNbbwrewfNa4tKqFrq9Yee47wMDeCNmhWRp2b6s=;
 b=cRDydesO+9NRUsh0PI9zMkFMKr3yw8ePsyvmzqJv5xSbxkbqrVjmPjk/MH0nKGTtFX
 Jt9YRVd3nYnCTaC+PZPAwW9sSm6PD1ZRjNmrm/FPk93FO157FaRM/UJQLu1p1ACY5bVS
 E2QxsxvCFsPzshqthDgP1cazNl8rppmT0Enh7vYvNe/34iWeF8cj8ZthDQrGye3uop+u
 IHa6ISN35FkQ3pAb/voUhyGljaYoBIqutNoAFEh2f33o55uTbdsH6KW/CPo8DUocH3Yx
 Ry4VCoaIYMBbiyRYN4rJI2hGzgR0PfqDc+ef0y6dAJaSEKgH2fpyKa+6D4HlOIl3jtdu
 uXlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFdekWY41EshQ43CK9cCPNnXBr2ohK5YDOWTHha2BkR00lN6KfQYlWAlh7SlrsCpKKc7afhF+LeaGXx7mT+QY78Y1y
X-Gm-Message-State: AOJu0Yz4WMZhANe6ohgK4+Oy56FZjR+INygbx1wBCD9212UFNYLL7FhL
 Hp18mEC3doI5tYa8bDz6C5T0zKlE0pwNDh8/Iqzc1b3tsVFktYS4GftEjNHue68=
X-Received: by 2002:adf:fb0b:0:b0:346:d12d:fcab with SMTP id
 c11-20020adffb0b000000b00346d12dfcabmr1726298wrr.65.1713980708973; 
 Wed, 24 Apr 2024 10:45:08 -0700 (PDT)
Received: from localhost.localdomain
 (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr. [176.184.51.42])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfe903000000b003445bb2362esm17616085wrm.65.2024.04.24.10.45.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Apr 2024 10:45:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] accel: Add new @dirty field on HVF/NVMM/WHPX
Date: Wed, 24 Apr 2024 19:45:03 +0200
Message-ID: <20240424174506.326-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: w3mCo1FAvc0V

We want CPUState to only contain fields used by common code.
Start using a specific @dirty field for HVF/NVMM/WHPX
(TCG then KVM will follow).

Philippe Mathieu-Daudé (3):
  accel/whpx: Use accel-specific per-vcpu @dirty field
  accel/nvmm: Use accel-specific per-vcpu @dirty field
  accel/hvf: Use accel-specific per-vcpu @dirty field

 include/hw/core/cpu.h       |  3 +--
 include/sysemu/hvf_int.h    |  1 +
 accel/hvf/hvf-accel-ops.c   | 10 +++++-----
 target/arm/hvf/hvf.c        |  4 ++--
 target/i386/hvf/hvf.c       |  4 ++--
 target/i386/hvf/x86hvf.c    |  2 +-
 target/i386/nvmm/nvmm-all.c | 21 +++++++++++----------
 target/i386/whpx/whpx-all.c | 23 ++++++++++++-----------
 8 files changed, 35 insertions(+), 33 deletions(-)

-- 
2.41.0

