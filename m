Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp426479njb;
        Thu, 8 May 2025 06:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW6sPXtwrgYi6u8IYAiVaFLf2WBPcSPhoRcXf5/hBsPXNVmSD0UcOWNpKSQXZQhAadBpG2SZ6hnV6Ukhw==@linaro.org
X-Google-Smtp-Source: AGHT+IF0uA1V5I+7tFlVAKV4oVHgDVGJIxpL9i68AsN5IGkR0j7+dFOl0LRqIISkEM8DzLyvm63K
X-Received: by 2002:a05:620a:2585:b0:7c5:97ca:3ea0 with SMTP id af79cd13be357-7caf727b406mr1008157685a.0.1746711397795;
        Thu, 08 May 2025 06:36:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746711397; cv=pass;
        d=google.com; s=arc-20240605;
        b=D18oKyZ1UICbqtR6WJmU6ZiayKYCkczzHf2Px/ISG2Rz5gmvJOJ5tt9puZDmDn3s6w
         cKl3ay9B+zbbHh4I9Pu2n0h2jf+y3i2HQeS8BOjINleGG26W8JGFyzLIanXYhH0IlV+R
         DBwk42iYRfBNdzPvKJEDQ19amvNWa7neAm8yCHUH9mBpa536xpGb8EyjMRTzt/bzO0vU
         GtG94wK6pCdT/hWqnWrsFyFlFMeqdObotoI1pkzavGG9e7nBWY+fL5wNQYwJbikozQ5K
         o3tHoqlImvOHhORgG3NERZr6hQsDCvEH/Lrj0GbxBOY8cW6Ou3fMsEP7LPaXxB3IbBQO
         T+kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=XP+ZGWOYnOiwfrA3/LUhv7eqSLRqDyC8l2H8ehhMIaA=;
        fh=Y1TW8MblWjwX4pWelUKrk4Gp55v/mM605xw49AjWYLM=;
        b=b86Zvl/FkcLefAVZ4mgdSWaGrgWE455qcX5rOJUcun1p1gasn/IoeD1rgjC9dny6u/
         yDdgC5Zv8tdvTljVw6dI09lIOr/rN5yShrffEyQPeWd6bG4kMYtDNsStdovp7CIObnVE
         KOBGjtZGw/PuTMxH5HGuMyn8SGC0hCY25Ypf2HOYh3qTtJnbVCUEYs+dqhLobtK+snVZ
         Fwpx1lHT0OOmD3Xasl12qo4HqntTxX1hGkA7PAyMJGrdUsF6TrDHEjeDGAwD2DEttjPW
         TZBtE0S7SeEgFeRGfOMewwjdLmJUesj2CFGTteMN9gpTy3KPHH7Gb4bicqahC+ITmtf5
         zIQQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+86IAh8;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45860-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-45860-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45860-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75c9a6csi438310985a.542.2025.05.08.06.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45860-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+86IAh8;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45860-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-45860-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B62E24E5166
	for <alex.bennee@linaro.org>; Thu,  8 May 2025 13:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6A919D891;
	Thu,  8 May 2025 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+86IAh8"
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92F84D13
	for <kvm@vger.kernel.org>; Thu,  8 May 2025 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711393; cv=none; b=kI3rYy7pItmAB0/J88wLGp64+kxY484KBDLrqmWPmey9s/rizZ7N8Wyc2SNXQnpIDXVc4eGqL9wT5CEx6vU5y8F6V192QgXcWtTVt8Iy6PfsJikPwu+8uMY5CdZSO7zI/PbI3EXkuY/DUfA3FD5FBwyNoyH2dth2O97hsBg3Uks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711393; c=relaxed/simple;
	bh=J4SN93XeHzWKfJcTKYToJwKYi9igISa42znhUkn5k00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5QVrY4T4mKx/GZzyBg8pW2E9fo6vNO1UJqWJYB36tKmeluB2Hxp9UMTXO5aeNnDoW7PFAnBo2MDuWrMQ9XiZ9QcPIJ9UFb0b6mYDsTewdbvEsH6ESq3QzKSkBwu4hJl1yuGxoy0eRu7iSbBqX2na+kOIWTIFRPSLF4XBrjJT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+86IAh8; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so559901a12.1
        for <kvm@vger.kernel.org>; Thu, 08 May 2025 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746711391; x=1747316191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP+ZGWOYnOiwfrA3/LUhv7eqSLRqDyC8l2H8ehhMIaA=;
        b=l+86IAh8lR6ZbgCeT/pRh1lv4Dq4vpfHx/ADw4FdxXl3KU+GUMHrLD1TGIhU0UoMBy
         l7O54ZnJvnthdmyAVyHJIoz6t8m+GqPKi9L5NQt/lYeZq1dmWK5O2/TZ+uCG3qLUB/35
         skmriBpyralFYAUDrA2qUmALI2nE4cl2tYQcF3AGEU49YUq8js1wpwiDkjbG1zGrcbPZ
         1vG8Jx5AYkVnQynJGUdaewppHmracIXY6V0CeWagaxdrQAUCfGRQspLdawhfAuTt3GJ2
         tk3S6tdhfVPiz8z9EL6PwD84PI1Q9zCemMb5G4R38Hh1JlT8HsUAF4d1gFnt4Hkbrd7n
         eryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711391; x=1747316191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP+ZGWOYnOiwfrA3/LUhv7eqSLRqDyC8l2H8ehhMIaA=;
        b=sbhgqlIIYA3sHrVKfUH38RCRDuRxfLK31zgBcVy5lyraVrMm3RQSwQwkLaiUXaNY1z
         6M6BoLjANkNdIh3/BzxgiEzO8kcgB1q2/vef67qR8y09+b9cM+z5KxyxYt8XEDMPqc80
         MK4XJUYgX7EV7F8vgZq3WdGCVq31EUKGwMqdgyz7elDN52zGCVb3/2n+2fFIYnmiHziE
         qZa6GVmvf3ZMWL+KVvkFlZJ/7cxqpHoERmpP9ql+IAjydyZTfmSCdC8FLRLxIhHq+/3Q
         VeFJ7XKX040bPaQnoWJA2FlOcxP15L8EYF4TN46fa1QyJNQqaG7yeXz8KFgEUN5cPKxR
         KitA==
X-Forwarded-Encrypted: i=1; AJvYcCVuBSa1pI2CwHEXdu9IjQvOPMDanPz75nlaUU488iUI57a37fIqhXnS+KG4SUfg+tDIM4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHYS671oRvHABfedy5EfKE5zYtjm/XCrVqbAHGqWKkyZxUNHj
	XpYfycaKyh1ORm+Ff9q8WMJWOjnOFAOsWA/dK7plaKP9dE/bProzkc+TPGFxiqw=
X-Gm-Gg: ASbGncufIFJDOhIs3I8iGd3ro/kaUe6fKGahlozWJF8uAm9SwoKFN87Kxt5xYJi6BeX
	n6NdWMs/UhETD/ryoy/MWWmX9yn097iQy1SwpGQg5YFwjOKZWFBUM8p0YM1uMr9T3a61hEUvfmd
	jbW46Rq0BJJM8gBVVQatkz+d1dC2wvqaEd95nz1C0iuL+UAAu2GmvRtwITy1ytzUGoHumCLVYKI
	KEUcz44PT5MtnBAqnMQChBp9Bdtrh04I0LZ3Mor/84GIezzVcQT297r791OmFsy2vCUSNyj682J
	y/tq5vvvCDiLwrQ/974p1Xus15ZbsPT7k2Ky/5t28Hgx5TUNjw7/isbpYjpo9KXXmgk8Kx9wz1S
	SoKUDAO3JI0YpG/c=
X-Received: by 2002:a05:6a20:9f48:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-2148d3124f5mr10576405637.42.1746711390803;
        Thu, 08 May 2025 06:36:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6a590sm11373659a12.66.2025.05.08.06.36.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 06:36:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Sergio Lopez <slp@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yi Liu <yi.l.liu@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Amit Shah <amit@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Helge Deller <deller@gmx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 01/27] hw/i386/pc: Remove deprecated pc-q35-2.6 and pc-i440fx-2.6 machines
Date: Thu,  8 May 2025 15:35:24 +0200
Message-ID: <20250508133550.81391-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vnpjXsyLQ6Tp

These machines has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") they can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/pc_piix.c | 14 --------------
 hw/i386/pc_q35.c  | 14 --------------
 2 files changed, 28 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7a62bb06500..98a118fd4a0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -764,20 +764,6 @@ static void pc_i440fx_machine_2_7_options(MachineClass *m)
 
 DEFINE_I440FX_MACHINE(2, 7);
 
-static void pc_i440fx_machine_2_6_options(MachineClass *m)
-{
-    X86MachineClass *x86mc = X86_MACHINE_CLASS(m);
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
-
-    pc_i440fx_machine_2_7_options(m);
-    pcmc->legacy_cpu_hotplug = true;
-    x86mc->fwcfg_dma_enabled = false;
-    compat_props_add(m->compat_props, hw_compat_2_6, hw_compat_2_6_len);
-    compat_props_add(m->compat_props, pc_compat_2_6, pc_compat_2_6_len);
-}
-
-DEFINE_I440FX_MACHINE(2, 6);
-
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 33211b1876f..b7ffb5f1216 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -658,17 +658,3 @@ static void pc_q35_machine_2_7_options(MachineClass *m)
 }
 
 DEFINE_Q35_MACHINE(2, 7);
-
-static void pc_q35_machine_2_6_options(MachineClass *m)
-{
-    X86MachineClass *x86mc = X86_MACHINE_CLASS(m);
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
-
-    pc_q35_machine_2_7_options(m);
-    pcmc->legacy_cpu_hotplug = true;
-    x86mc->fwcfg_dma_enabled = false;
-    compat_props_add(m->compat_props, hw_compat_2_6, hw_compat_2_6_len);
-    compat_props_add(m->compat_props, pc_compat_2_6, pc_compat_2_6_len);
-}
-
-DEFINE_Q35_MACHINE(2, 6);
-- 
2.47.1

