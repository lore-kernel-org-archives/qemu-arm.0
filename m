Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp997370dlb;
        Thu, 23 May 2024 23:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpODnlStRuUJPZXGv0ExJZboPBPWCnhoNC3Lk9lCLADCCy140/2wauWCp8OwSGhl9kd8qFhsVurwUEQFQDPqFE5DOXxpKC
X-Google-Smtp-Source: AGHT+IEWcq6zYMFJ62XsyzIJb55tiF8Bt+8LLJ0ZMGzdZvY7Z7Fx1l2L5zRbP4HqMQ8DNs7dRYng
X-Received: by 2002:a05:620a:a19:b0:790:f843:db57 with SMTP id af79cd13be357-794ab0f8b0bmr131111985a.58.1716531427129;
        Thu, 23 May 2024 23:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716531427; cv=none;
        d=google.com; s=arc-20160816;
        b=aJ96oClt2nQDDEiDgm6hmnjqlqGP1z+v6/aySKQC+zvfbagwjz47Nm9nrQSmHy/CdF
         zB/r18zxQTj2lRuAc+U3+Tl/KJbZlRV82i9rJc2n4G9PXrU55iAThgnwIv49auvr1Jt7
         aczP6aOYJqmYARSbeTx678SlGZnratvvRLs6DZw6zhwdDyrUYcKmJSqjLqjqAveCrdh/
         cZ1QnyMgGp0JVFpIIv0xSYOw3ftWkszfOmjpFzGjsX4BkEcCuzipvmXioK6t2Lg9eTiC
         KKc5i0TwMFI+0qTELivrqj7RzxqZqDunEP2SLQ9DOOgQqbbRSToNhbvo8ZRLP3D2WClN
         9wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vrXaQc53ipIFlLePhseHKfjVcL4zLVxbYhNZg/WizrI=;
        fh=oURZU+tvbpbsRbQlKhtPVkDuguE29o3msQW447CU/Rw=;
        b=FPZFRcfKpyKcHYr/pdXAWkN3ZSVhPpBvutP1ge49PKykRzP9AxZllUVWceH6TyIPVp
         YFnGOW6Lu1ejAw0xhcvmg0eUvmb8xH5/ur5tMHd8AXfsRHGNtmt6lnLAA2/B86ktgoHu
         NVFCygqLJLAtkMAMxfxRZzz3khZ9aBE8CSe+VXTqOmmxbkbuw25htdyN0WCOHY4SBb3r
         fCh/jP5MWPimAyjuWtc5scA1F2QIjj7LfXYKBgnszN886F36jfU9LLsecDKgAzDw2AkL
         WVOmxlft4S8ZajFLyUzZodPUng3tJaGsIdbxffKscWN4odJDkJLCDOwxDiFlXyzkK2hj
         aRsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hr5X02th;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcab4b8si91137685a.71.2024.05.23.23.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 23:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hr5X02th;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAODO-0002uv-Ng; Fri, 24 May 2024 02:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAODA-0002aT-IV
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:15:29 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOD8-0001PU-CT
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:15:28 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-24ca21014ccso185484fac.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 23:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531325; x=1717136125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrXaQc53ipIFlLePhseHKfjVcL4zLVxbYhNZg/WizrI=;
 b=hr5X02thrfbM/UPTRx9NB9KP7kt3qFs2Z1x3k98furCXvS/U4vE8wkQHwDyc+iQ59N
 +QmBpkJZuo2sGgyHlKXOKzqCbjzzBtif51fF8iW7s0FAxMzPXzyYlY2Vkzy6R3zA1yGU
 RoH+u69hQALACjBtJZsm5DcrIz9e7XPhvSo1ZnyAplB2cdBy4n0z5m8t0oI1r8JHALRe
 MPCRjmAf+P5YjkxJPEBrW8UCJ73rYuCeUX1EsxPeNKZzNq1ZShQz/WBgX8ZvzhRJBYJT
 MkQPa+rL8L6A4TwnleeRuEkpkaudYyQEyBaOzdiAiR+c+DhVe0SCqSy/0fsym/QNn7wH
 J5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531325; x=1717136125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vrXaQc53ipIFlLePhseHKfjVcL4zLVxbYhNZg/WizrI=;
 b=jcwOTadJnj8fRN5VzmrdltQH/ZpDl3AuRMUBhv7+GeN4VmdUx0M9xJEboFjtm7wm5F
 AJc4/sNC3JoPVwtPRSFmR03ESnoI1JrZ4vCEobMNrtIoYC0qYL7Vqgfk92OPiFUr+nGR
 k2ceVuY7W32XVZ5C0TBx9LSHwiJ+3GJn3pcTaxS5W1AfHTeBYrFgjDGfCHAVuB+TG3Pw
 zSmlTCBeB+sn6eWBmxA6o9bzCYq8eHCAlUKflKDiWAI/DG5jzh8eGwHdv9LJe36VPeG2
 Gl+YQoxmyGxkgzcsTG2Or8o2qL92wnbPIXCqXnG6+Ai+VVLKuhkHNgFpxKTH44jQFlPx
 hoCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD2N6Rj3DpJVKUOiKbfELRTt5NZiB31SLtqXStix/6816cN4JNdnlX+j+27kv2NS9qYYqK5gkRE7AI77gWCh9DE3oQ
X-Gm-Message-State: AOJu0YxTLqyW4K6F9SyIVoeE/a2len4xnvxqzE23Yf41Ew75+F8DDEPr
 TXypcZVW92oDgkreWh1F4ixnQpwJ7MAP9Tqhu8gfoKoSry0M333QtH5iFaNMcyY=
X-Received: by 2002:a05:6870:158b:b0:23e:7432:6f12 with SMTP id
 586e51a60fabf-24ca151bee2mr1402393fac.45.1716531325033; 
 Thu, 23 May 2024 23:15:25 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:15:24 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 09/12] tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
Date: Fri, 24 May 2024 11:44:08 +0530
Message-Id: <20240524061411.341599-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240524061411.341599-1-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x29.google.com
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
X-TUID: RpFVZwi2pe1M

Update the list of supported architectures to include RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 tests/data/acpi/rebuild-expected-aml.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
index dcf2e2f221..c1092fb8ba 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -12,7 +12,7 @@
 # This work is licensed under the terms of the GNU GPLv2.
 # See the COPYING.LIB file in the top-level directory.
 
-qemu_arches="x86_64 aarch64"
+qemu_arches="x86_64 aarch64 riscv64"
 
 if [ ! -e "tests/qtest/bios-tables-test" ]; then
     echo "Test: bios-tables-test is required! Run make check before this script."
@@ -36,7 +36,8 @@ fi
 if [ -z "$qemu_bins" ]; then
     echo "Only the following architectures are currently supported: $qemu_arches"
     echo "None of these configured!"
-    echo "To fix, run configure --target-list=x86_64-softmmu,aarch64-softmmu"
+    echo "To fix, run configure \
+         --target-list=x86_64-softmmu,aarch64-softmmu,riscv64-softmmu"
     exit 1;
 fi
 
-- 
2.40.1

