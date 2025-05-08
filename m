Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp429151njb;
        Thu, 8 May 2025 06:40:42 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX4Q1DLPWsEzdnAceD8r91BRgcEY6Jg9C+SLTMkAmxKbSVhwvVapFn8RHZI1stkHkjU1Yb0mBr1g+YrHA==@linaro.org
X-Google-Smtp-Source: AGHT+IHmtaGKy4OEh2tkScgYqPKws7lD5CfjBPPUOxFacwpReG1gV5qVlRcSz1DZGMUd/C+05QOX
X-Received: by 2002:a17:90b:2f85:b0:30a:3e8e:492c with SMTP id 98e67ed59e1d1-30aac2483f4mr9831506a91.32.1746711641860;
        Thu, 08 May 2025 06:40:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746711641; cv=pass;
        d=google.com; s=arc-20240605;
        b=bWeBteibuJcIIkxE4C96hsFGIrh7VdfXuisuUOQy74FYjMapLfeOF1N6t8r/0KYMRh
         KcQLd30i1QMTaCtpkokdl/H+HjuyHGBL0kDm+f7o2KfIxJlzg3vo5TklhEFIeeV3/lrI
         sHvBrBacmyZLw9PkT0mbD3am2nhPJRUxXZMJXRtdAuz3t21dv5hp3V1/5TJGZKdttu7i
         8fz4myVm2yHasY3FkDehC86Ko8G0pYelMkJxhchXQaZD+xauw+BJnoAVwj9NGZqnPS9A
         8x1PsoBLXt9qw4K8JmpXhSRvOU4B/V+kF9JmGOWxwgaYHeEler5s/xaufi6MzxebPkND
         Hwgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=asjuzn+eAAncdD20eXT1wyN528c12dvw5wk014+4k7o=;
        fh=LvzlICZxy2zK3CujnzW5ziA0pAW1o3bVgi+HBoefSfQ=;
        b=VoUPBftV7C9kU9HjZery5ozKErwOYAfrsN8k/+KeNAWAxY5w4ID6Ocd39aOWY62jZn
         SkXWOz43iR7VANKuoLt/jPpHYUnmpHwf8R8PJ9EXywuTDrbolU7OOkQlyhgiji3Ty8Mj
         +ajXq3VqTjH9S8JRq2AbMD9f/CgjrqvJYb/MemngLGOkl9uFV0fgn8MXvs/Io2W/rJR6
         mH/NaSV2WjQyffO3w57jKJ3FGEYcZGkGAis9UNXU3z9Fpf2Dm+tPixcjYUq/iVCRrLy8
         yT57lsiczKNMrCnh3KEt8UwBStT6QHUpJ0lI+CNbqFJffUt/eIhlIKdSXmRkOsKwsWvs
         AW0w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVCgZTWv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45871-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-45871-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45871-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d9443c01a7336-22fb6269184si10607955ad.273.2025.05.08.06.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45871-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVCgZTWv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45871-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-45871-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 570CF7A2E67
	for <alex.bennee@linaro.org>; Thu,  8 May 2025 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B671A22A4CA;
	Thu,  8 May 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVCgZTWv"
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B084D13
	for <kvm@vger.kernel.org>; Thu,  8 May 2025 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711634; cv=none; b=ae+QV77xUmovCouvZzaEyzzSr2LZl5rjHYaFsrP1Tby7nWYzwORwoABESpv6jcicrCPct4X4kWyURbH2azjTPAcJYWx/JrJb6EuLlMpTg3Zgl+AQvoTMVkfhqMZHGN0cyZJamBW93pWGE8Cz5vMqkZ7lRy0yZwlrVxaSu3kS5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711634; c=relaxed/simple;
	bh=BXIZADMLw8diixAhdF8XrXCa/Jlz43UOwh7Gu2X3RkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzHBsKAKnNH0qQvh/nwN2mSBxqWLr0fpCP70OVYwakvqpWQhfSFHzY9KM7pUvPQuv7aQ6+MXIAN4yNVsqxov7PkLzZADLZOeRt57Uh/4s2DuvaM2NnhCMQXXNSxyfahjI3BDtaypFOJTeipdRGsTT/ggMlugYxpWV9857xVkiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVCgZTWv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e033a3a07so11499415ad.0
        for <kvm@vger.kernel.org>; Thu, 08 May 2025 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746711631; x=1747316431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asjuzn+eAAncdD20eXT1wyN528c12dvw5wk014+4k7o=;
        b=yVCgZTWvcm9ulZCqV9hM5yohnjudiDlSnhqRbLX3DPXQsqrTiPYGrgJZruCHxQDDgh
         qLidMuaYkko6X5FN7HEh6zQ/Vidk7BNaFAkKdRUgrcERP2ImuZZGvOLaBgsaMPtM9McB
         TdsghjTUCG99dFtKnkR00gVtCsx1RtihSfB8kqa/kiL9rG5o2lrTUpBmw2dd0bMYOgDc
         R5zlktAqSle+hfrxJxQtUKLyQ6qLMWvOClubwNy7/sWqBxcjAjHfQ3cDt9xvrarHoSAx
         W1sVuVnlM1oIuq3RqC6v288BdkmWyHGCyJZkyZPAMzOUaGQ62xAzyvrGw9ul3orTxXQf
         7aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711631; x=1747316431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asjuzn+eAAncdD20eXT1wyN528c12dvw5wk014+4k7o=;
        b=HQiuaklHRsetK9T7jf1bs783xuAcvrtl8xfpE5FTDG0oWisbDHUh1ONPwT9IaFN6lT
         8fGewHVbD0NsxRMPhAYs9HYC3zYomkX38DUzIZab5m3CwfF+bxGZ8zepPNEJrPyJuK+o
         VdYIiHAJCPPujs3w4pA3txRJvR+jXQpk2+mDuDjyg/dNa1IMIrwRPJdaLha9Nw6Bsect
         ASZ1+38ul/VOv/9oce6iO5yTPjtUj6gO9DSDeUPD8i/Phn38JRamKTG4MgJ6Txdc+nzF
         m5/KVISHY/pL7Z43BVYubH1FvV8+KBJqblZah0Yze/jJqVyOUwskdjM4FQ6+XNKgwe41
         03yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ySveK7AXA6beo7T2xNB7xt9rqSvBEjxiUuISyCOmBpdATMvhiv3HbmOsI25Uu1s+mQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBSfu9A4NDKmfzrHeq5+WLwmX8vTC5//+PHx8RFLXhhYndkdK
	66CNo6R2lXS2rUrc6aPt3somGP4enKHHfpLomdIKUfY79dwlhJ4CQgQy+OZ/kKM=
X-Gm-Gg: ASbGncu3xzzLKDM357zRrKzomdevLsc7bXNJ2NkOQ4H7aLQ0/0JtIZzqjxYUyl35066
	JWCPepSCNqanSvThecajnhnRj5m2Ck0T6/p+MuKIceZLUoJ6RbZHj3gWSjlBTbUZh/+HgPthCwd
	8eumEgsARZpWsaZWFlaC0l6qzDTSOZDsQJDdf8WzdXaCkzNquuv7XMHv2ZgOWYJAe2yMRjK6yzb
	sRGwLlYAnHbclXyI1hRBUWbPZ0VVrGsn1HSbVRF8t8EXH967DWRqT7v0sze5aivddJx0eXo69RV
	Lto7QR6V85XXpDALFUEMUKm7yGYociDiqS1akWcVqXnvCFcdjGnJz4UJ/1PFAuU+TTDZrqrxs2t
	Ochi93ttSTzHAgzw=
X-Received: by 2002:a17:903:3bc6:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22e5ea1d4b2mr110687105ad.5.1746711631350;
        Thu, 08 May 2025 06:40:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fbd4474c1sm3299195ad.112.2025.05.08.06.40.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 06:40:30 -0700 (PDT)
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
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 12/27] target/i386/cpu: Remove CPUX86State::enable_cpuid_0xb field
Date: Thu,  8 May 2025 15:35:35 +0200
Message-ID: <20250508133550.81391-13-philmd@linaro.org>
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
X-TUID: Q+zCzu9UmGtF

The CPUX86State::enable_cpuid_0xb boolean was only disabled
for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
removed. Being now always %true, we can remove it and simplify
cpu_x86_cpuid().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.h | 3 ---
 target/i386/cpu.c | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0db70a70439..06817a31cf9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2241,9 +2241,6 @@ struct ArchCPU {
      */
     bool legacy_multi_node;
 
-    /* Compatibility bits for old machine types: */
-    bool enable_cpuid_0xb;
-
     /* Enable auto level-increase for all CPUID leaves */
     bool full_cpuid_auto_level;
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 49179f35812..6fe37f71b1e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6982,11 +6982,6 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 0xB:
         /* Extended Topology Enumeration Leaf */
-        if (!cpu->enable_cpuid_0xb) {
-                *eax = *ebx = *ecx = *edx = 0;
-                break;
-        }
-
         *ecx = count & 0xff;
         *edx = cpu->apic_id;
 
@@ -8828,7 +8823,6 @@ static const Property x86_cpu_properties[] = {
     DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
     DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
     DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
-    DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
     DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, true),
     DEFINE_PROP_BOOL("x-amd-topoext-features-only", X86CPU, amd_topoext_features_only, true),
     DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
-- 
2.47.1

