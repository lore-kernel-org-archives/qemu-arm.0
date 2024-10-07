Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1820932njb;
        Mon, 7 Oct 2024 02:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfcwwQvFlcHIOmqn1XJIvU6GUKp4saHUPaxdi8/aRSqjJdObRka28FxMsD1kV9xF4kjRis6H28LMk26Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFOuWvFU0NCB83WUPKH6fah/SPxzfafQGboDrarb0jodRiFhGJU1jvRc0AdREN7eXKGG8r9
X-Received: by 2002:a05:6102:4406:b0:49e:9240:a67a with SMTP id ada2fe7eead31-4a4059033f6mr7433060137.24.1728294033543;
        Mon, 07 Oct 2024 02:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728294033; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjKixphUV2T8xvjG9Db2MXLhCG210s8eoTaPc7767O5C/CvCAG8XRpYqrWYRjmGiVo
         uFqjEhnhVn50/V0WsOWNTe0HF6XHUdUcRNb3cN4Kb4ybV7zx6Xvl7aslEGC7SzcL2tPO
         uIpToR2PGmhOQ3L5ewV7ZLYULksqf7S0iEIin32Zy8rmnT72yfmE3iI01qSDGH6ctuxj
         pNosZiZn5wn2SZ6WdvPHe8Yfk3XQ9Nt8IQfdSgYoNXlt06AL+TCDusw11lKBX3r73hLn
         +X2yVR1f8H5diNzFPqw6A3D1aTxXp8sZ4rT4s7Kdb8BSnpgk9W4ROs90gfXMGyo5gsip
         n+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=0bvmJJ+8246gH4K3TL1jO3GW/p257TZ4N0EkExiJyKo=;
        fh=bUz+Ab5dNsVlaYo04xT/dnjMN5la8cWPVQc9NhKCwsQ=;
        b=am532+G88u0bIWJdmgw/QjAnntJit1j410Yp4YGu2dYrC1tx/drLK6uOTCajsTE7rB
         SjDKz4uPX3xki2LKLazV2QyIRt8KPxt0KRQlGHvtwf6Nx2dnyP9NQOi5CuaUKiiZwiqQ
         e7/qxNx0PpJhH23wk9HLiUwpuprUws32aGcz7wqPZhafuNEyCf5X/8RdvOayipDCqMoi
         8XsTHRl6I8V2BbwQny8vU3795QzfqsBtjd3gDdhhIwNo9Jca2yPcNYpi0auvqwoU3O8N
         CugdKqIkYYG/1uhrLFb4jmcbvL82CahaoWfM3WZVven9eLia0ePsJPDrAuslMRqRr/xp
         z3Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RADl143H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae7577431bsi562182485a.684.2024.10.07.02.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 02:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RADl143H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxkDt-0004vv-Iz; Mon, 07 Oct 2024 05:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1sxkDr-0004vL-JN
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 05:40:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1sxkDo-000534-P1
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 05:40:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cb9a0c300so38023885e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728294007; x=1728898807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0bvmJJ+8246gH4K3TL1jO3GW/p257TZ4N0EkExiJyKo=;
 b=RADl143HKhFGmcJdyht4bWK94WivhBmiDvtKttl1VaoxtuGgOkEFjX7x7ab+9l3cmh
 8WpxQ7eKCoj8iqz0lDw2SWpTc28jitlw7Vfhxkm1uMHTTErGhytVBWEKLBGW1SmUxgJj
 1SF1F8YZK5SN92gPiQQ+SzBSp+BhYEl+ppHbrVGgzic5OqTAm+UcyHBvup2DW67Rt1fM
 NPT+e4ohGU37XTbjvmH3XE4QCwKuBGgsaI4eEdPKutwwuuFkr/xzx2T4T3CQ/6vD9vwF
 o0Juba/Hg+50RYiW12aIVlpF5vgUqGqkiQQSZzBK9irzvcitHlv54hbI6Km/+R7ILfUe
 w4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728294007; x=1728898807;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0bvmJJ+8246gH4K3TL1jO3GW/p257TZ4N0EkExiJyKo=;
 b=aECEay9MgDNw8rBbETKNMgLy1hWjGxT75Zu3vtrR3+4ahAeRlAoVcXbnxMhuYsJnMG
 p6mqGPSuGXYZEi2vs8beRNF+QGDFFLw3sGjgsfK7U/gx0toeGupFenBT5RX3NfOZYU+D
 KsrZClkNZWJlmDfo6L0t8XdIGKYofWiXO4eHV1yYfvNwziLOepFbuLH4HRMdhlIXZ0bj
 pr0IMZCtKicUNxt7zFWtAurC0oP9nath9xVvUsFQ2ZJL2ioNqIJABw+fUpkyHohk6FHN
 khSmNtlWfvPgISoHN3Fm2zxE2H5JUcxCVSK+r7rWTKgfT+M5XxzSFcNw3/SG9wSTZLjm
 VxGA==
X-Gm-Message-State: AOJu0Yxw2bhu7+bhNlQYxQ98XIH3GzyiKalprg8EoUnZSeECsvjH+K+G
 ckWZhAZ7WIITJA33kuMEVu37vJAV93KVrqyY8vizudu7hYFQTQ2GPCkXdxzYpLc=
X-Received: by 2002:a05:600c:190b:b0:42c:be90:fa2f with SMTP id
 5b1f17b1804b1-42f85af4582mr80485315e9.25.1728294007091; 
 Mon, 07 Oct 2024 02:40:07 -0700 (PDT)
Received: from meli-email.org (adsl-122.37.6.160.tellas.gr. [37.6.160.122])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89e89624sm69109265e9.12.2024.10.07.02.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 02:40:06 -0700 (PDT)
Date: Mon, 07 Oct 2024 12:39:12 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Bcc: 
Subject: Re: [PATCH v2] tests/functional: Switch back to the gitlab URLs for
 the advent calendar tests
User-Agent: meli 0.8.7
References: <20241007083649.204886-1-thuth@redhat.com>
In-Reply-To: <20241007083649.204886-1-thuth@redhat.com>
Message-ID: <kzc6t.omlco5eeifu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: r675Kb4rgczX

On Mon, 07 Oct 2024 11:36, Thomas Huth <thuth@redhat.com> wrote:
>Shortly after we switched to the original URLs on qemu-advent-calendar.org,
>the server went offline - looks like we are better off using the gitlab
>URLs again instead.
>
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---
> v2: Drop the wrong change to the test_microblazeel_s3adsp1800.py file
>
> tests/functional/test_arm_vexpress.py    | 2 +-
> tests/functional/test_m68k_mcf5208evb.py | 2 +-
> tests/functional/test_or1k_sim.py        | 2 +-
> tests/functional/test_ppc64_e500.py      | 2 +-
> tests/functional/test_ppc_mac.py         | 2 +-
> tests/functional/test_sh4_r2d.py         | 2 +-
> tests/functional/test_sparc_sun4m.py     | 2 +-
> tests/functional/test_xtensa_lx60.py     | 2 +-
> 8 files changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/tests/functional/test_arm_vexpress.py b/tests/functional/test_arm_vexpress.py
>index cc6015112b..6bd6290030 100755
>--- a/tests/functional/test_arm_vexpress.py
>+++ b/tests/functional/test_arm_vexpress.py
>@@ -11,7 +11,7 @@
> class VExpressTest(LinuxKernelTest):
> 
>     ASSET_DAY16 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day16.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day16.tar.xz',
>         '63311adb2d4c4e7a73214a86d29988add87266a909719c56acfadd026b4110a7')
> 
>     def test_arm_vexpressa9(self):
>diff --git a/tests/functional/test_m68k_mcf5208evb.py b/tests/functional/test_m68k_mcf5208evb.py
>index 869ccc88df..00c59590c3 100755
>--- a/tests/functional/test_m68k_mcf5208evb.py
>+++ b/tests/functional/test_m68k_mcf5208evb.py
>@@ -13,7 +13,7 @@
> class Mcf5208EvbTest(LinuxKernelTest):
> 
>     ASSET_DAY07 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day07.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day07.tar.xz',
>         '753c2f3837126b7c6ba92d0b1e0b156e8a2c5131d2d576bb0b9a763fae73c08a')
> 
>     def test_m68k_mcf5208evb(self):
>diff --git a/tests/functional/test_or1k_sim.py b/tests/functional/test_or1k_sim.py
>index aa2a1f08d2..10e0437c50 100755
>--- a/tests/functional/test_or1k_sim.py
>+++ b/tests/functional/test_or1k_sim.py
>@@ -13,7 +13,7 @@
> class OpenRISC1kSimTest(LinuxKernelTest):
> 
>     ASSET_DAY20 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day20.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day20.tar.xz',
>         'ff9d7dd7c6bdba325bd85ee85c02db61ff653e129558aeffe6aff55bffb6763a')
> 
>     def test_or1k_sim(self):
>diff --git a/tests/functional/test_ppc64_e500.py b/tests/functional/test_ppc64_e500.py
>index 3558ae0c8c..f1af92373e 100755
>--- a/tests/functional/test_ppc64_e500.py
>+++ b/tests/functional/test_ppc64_e500.py
>@@ -10,7 +10,7 @@
> class E500Test(LinuxKernelTest):
> 
>     ASSET_DAY19 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day19.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day19.tar.xz',
>         '20b1bb5a8488c664defbb5d283addc91a05335a936c63b3f5ff7eee74b725755')
> 
>     def test_ppc64_e500(self):
>diff --git a/tests/functional/test_ppc_mac.py b/tests/functional/test_ppc_mac.py
>index a6b1ca2d4c..3f45e37a45 100755
>--- a/tests/functional/test_ppc_mac.py
>+++ b/tests/functional/test_ppc_mac.py
>@@ -10,7 +10,7 @@
> class MacTest(LinuxKernelTest):
> 
>     ASSET_DAY15 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day15.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day15.tar.xz',
>         '03e0757c131d2959decf293a3572d3b96c5a53587165bf05ce41b2818a2bccd5')
> 
>     def do_day15_test(self):
>diff --git a/tests/functional/test_sh4_r2d.py b/tests/functional/test_sh4_r2d.py
>index 5fe8cf9f8d..c3cfff79ad 100755
>--- a/tests/functional/test_sh4_r2d.py
>+++ b/tests/functional/test_sh4_r2d.py
>@@ -13,7 +13,7 @@
> class R2dTest(LinuxKernelTest):
> 
>     ASSET_DAY09 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day09.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day09.tar.xz',
>         'a61b44d2630a739d1380cc4ff4b80981d47ccfd5992f1484ccf48322c35f09ac')
> 
>     # This test has a 6-10% failure rate on various hosts that look
>diff --git a/tests/functional/test_sparc_sun4m.py b/tests/functional/test_sparc_sun4m.py
>index b334375820..573f85222a 100755
>--- a/tests/functional/test_sparc_sun4m.py
>+++ b/tests/functional/test_sparc_sun4m.py
>@@ -11,7 +11,7 @@
> class Sun4mTest(LinuxKernelTest):
> 
>     ASSET_DAY11 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day11.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day11.tar.xz',
>         'c776533ba756bf4dd3f1fc4c024fb50ef0d853e05c5f5ddf0900a32d1eaa49e0')
> 
>     def test_sparc_ss20(self):
>diff --git a/tests/functional/test_xtensa_lx60.py b/tests/functional/test_xtensa_lx60.py
>index 8ce5206a4f..d4ad92dc6c 100755
>--- a/tests/functional/test_xtensa_lx60.py
>+++ b/tests/functional/test_xtensa_lx60.py
>@@ -11,7 +11,7 @@
> class XTensaLX60Test(LinuxKernelTest):
> 
>     ASSET_DAY02 = Asset(
>-        'https://www.qemu-advent-calendar.org/2018/download/day02.tar.xz',
>+        'https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/day02.tar.xz',
>         '68ff07f9b3fd3df36d015eb46299ba44748e94bfbb2d5295fddc1a8d4a9fd324')
> 
>     def test_xtensa_lx60(self):
>-- 
>2.46.1
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
