Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp571967ejd;
        Tue, 16 Apr 2024 12:00:48 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXP8Fii36dI1rFRieqYufABxK4P4+C1FyaaKv4yBzWhwn8vkloPp2S5u3KqSasNRu2+bQY1gDhK5MSRcoB9socAHkxe5MUl
X-Google-Smtp-Source: AGHT+IHVb9KhpwJoD+bs8rfx8SYtfFrj3DUP3rJOuqh082r01ZsCf5Xqw4GXcJuGub4NXaTKVuVe
X-Received: by 2002:a17:906:1196:b0:a4a:36e4:c3f9 with SMTP id n22-20020a170906119600b00a4a36e4c3f9mr3142164eja.7.1713294048467;
        Tue, 16 Apr 2024 12:00:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294048; cv=pass;
        d=google.com; s=arc-20160816;
        b=GT2fzOHWgLT8F/Q0yrQpgwHJ0AhVp4PYBW8MMhPtmKd4GUSsGfC+cMWiqljpZO7QUV
         tH5vlRoF9EyfVlPIgHsPpd3AIgUS7LQZ9eTPkfSK4HVgbh/vTfokLpeg2jBWxo2Xsv4E
         NXBc8I9UiY8zRC/1FNa74W/NMUm3o9IUICvMh1b+rSURFYE6aFBQIQZKmQ+omQJbEDUV
         VSEcjZAJhwFc9hdD3V+ZoCdoVWLyptQpaC74u7opU16lvfFJKttee496xRyQC0Yy6oL9
         /Q4BtPR4ZcYiYiD+F6IrKZeWnNFwanFnCjckBdnLtFlzV9PyXInZxCzDZ6z50TLkEq+P
         ezJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oIsya0WjT//mE9jDUk5oKmf9DZYf6HHN1KydCpfDiGI=;
        fh=OZDL5R9w4b+rpu18KzvrYzN5DQw1X+JYo04kf/nTI6I=;
        b=IYz370Zcc/6hLgs4mNLLGUNmyqj0pZl50rZz5QIJtCOGgZcZS2m1ssdd85IwPzFyPG
         yNORM/R4aWosa0dSEgpeaNt0l5J3Y7HfQ9piVCLtdNBf+6GAnZ3CxDedueK4JmaFqjSw
         Tt7NpAcbTJ9MO28AJ+5GKlWbf/+/8X6aMj2mTWpjEbjWBe2SZAnbarpTmFGTP0hHmtLk
         wOHleMQ1m8AYGzVLs6NzUT5/nTzsnjX9JEBVGkHpYmc8trAnIjsFajZu+QxTFR2fwbDn
         xfRWxgHPevYPiBapRIErSsK5ov1OcC7PJD/7Ycn+cFYl6k+aR9Ib0SRqheN8kPj5EK2a
         e4rw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmYWjVZk;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14857-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-14857-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14857-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id ga16-20020a1709070c1000b00a525d0b2090si3054268ejc.256.2024.04.16.12.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14857-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmYWjVZk;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14857-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-14857-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075421F22A0E
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6150137929;
	Tue, 16 Apr 2024 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmYWjVZk"
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D578137920
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294039; cv=none; b=BR8RSljSCqElAX01XkbRuc34mguNvIit10lWftspwYoh/fo/ANUS3UXfgKqCAG//tR5r0U7Y2rVhKUsEq/+CjZeLatePA79JLZPnrQaYU7f9yvtaxx6HHPoc2zs/0LKOrRGHJ2d+dYyI5CF5pIW8lZ/qYuYdMDQbkmFz1ZwgerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294039; c=relaxed/simple;
	bh=ZVnB053lui3yOtr9L8Bnnl3fUpOmFfcwya9mw/zaqk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSHOBGbQ+e+y8B0L3Rr3mUSZ9gfGaOJTZiID5ElbCjtRJLG5F10L2YHcrugv5c73IgqmKMvFj9bbOHFPG2fe6d2qKnEocQ3H9k1krsdVr3/sBFMRgv9vd4bhUuaKPVnp9BheSHL0Jhjt5FeSDh0H8FGZWJnBrMC5KS+6BJcq+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmYWjVZk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a526d381d2fso15287466b.0
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294036; x=1713898836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIsya0WjT//mE9jDUk5oKmf9DZYf6HHN1KydCpfDiGI=;
        b=VmYWjVZkwoosc4o0MdHU2idvzofJltjGyDbrT/gTEGUWsHTo/xaolL2SDv2N5vs3j3
         HhhWrT6zGNePcw3hXMtDIaPdfgDlkyPcZ9lX4g476e970Sf9Lg+GV1sivv1HxQVgXUG7
         NRlnJLTOVQDbaIerILriWpsDssrdwLgwd0uUXvr1gEmBE8mQBxt0CfJuBnzgDlmdFZ1f
         /woUL2ivcT9UHLqiq2Kc5dH2frfZoGihpo8JEziBpP+fv6T5sVjR6gwwRBeHbTEAbGVD
         dea/cjt7XGOdqfvSQnFCn8PVrqRH5ubiCXDhkepR/K5hCiJJtINws6Xh6PofHeac4Ca9
         tqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294036; x=1713898836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIsya0WjT//mE9jDUk5oKmf9DZYf6HHN1KydCpfDiGI=;
        b=I6/vJhMbxl7TtO0tsbxZlpKjjMN2MVVtolUN94gQ6Q/fzfwA5du5fsKnxxTVG7aClP
         hrkq6QpZBDi1oWJq+EFOFUBpWqahxoP2OyyVV5elXDaX2VDjpAenOD5W5/SDk4mjwcJI
         we2An7lQ+YGyzpW23wQIHIOhxoekOZl0DRuzAMhc89I82oGRQh0PcZLXHGYcMxEAunXl
         bAwClPZddw7HTf3KoUQ9k7yXViaPyMrvhr9+VBoPl0wFBE34C+GT5TEMSWXPWsdIvtV3
         LKxt6uMVGBXiOEeGhrDGNd+pRSiGbBiehOK5esV0Ydj+g27BKoiQjBQ3vWFqVx2JYRcf
         7DHg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3W6jbfocDbnMc6X/IvLDCikSs3kBGhTBGxcw00a34RbzzOLdMten65dxhKoNOO5E7OmCWw9GOObBZEPE9zAcMpW8
X-Gm-Message-State: AOJu0YyldLJOhMg/pQ/PaUiEx87tVp2G483BjoeShDzO64LHszgqA5LP
	0DKLpYFlHwGtzi1tgjNqBgnQqjwiu7+hVV02Q6oInpOzVu5zWDmhgqn18Ua706U=
X-Received: by 2002:a17:906:b259:b0:a52:6b76:c722 with SMTP id ce25-20020a170906b25900b00a526b76c722mr3094545ejb.9.1713294035957;
        Tue, 16 Apr 2024 12:00:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00a51a9d87570sm7266186ejb.17.2024.04.16.12.00.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:00:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	devel@lists.libvirt.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v4 08/22] hw/i386/pc: Remove deprecated pc-i440fx-2.1 machine
Date: Tue, 16 Apr 2024 20:59:24 +0200
Message-ID: <20240416185939.37984-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GELekYgO46ly

The pc-i440fx-2.1 machine was deprecated for the 8.2
release (see commit c7437f0ddb "docs/about: Mark the
old pc-i440fx-2.0 - 2.3 machine types as deprecated"),
time to remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 docs/about/deprecated.rst       |  2 +-
 docs/about/removed-features.rst |  2 +-
 include/hw/i386/pc.h            |  3 ---
 hw/i386/pc.c                    |  7 -------
 hw/i386/pc_piix.c               | 23 -----------------------
 5 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index b09ae3d55d..a2a1b9d337 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -219,7 +219,7 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
 better reflects the way this property affects all random data within
 the device tree blob, not just the ``kaslr-seed`` node.
 
-``pc-i440fx-2.1`` up to ``pc-i440fx-2.3`` (since 8.2) and ``pc-i440fx-2.4`` up to ``pc-i440fx-2.12`` (since 9.1)
+``pc-i440fx-2.2`` up to ``pc-i440fx-2.3`` (since 8.2) and ``pc-i440fx-2.4`` up to ``pc-i440fx-2.12`` (since 9.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These old machine types are quite neglected nowadays and thus might have
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 51119e623f..01c55103d3 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -816,7 +816,7 @@ mips ``fulong2e`` machine alias (removed in 6.0)
 
 This machine has been renamed ``fuloong2e``.
 
-``pc-0.10`` up to ``pc-i440fx-2.0`` (removed in 4.0 up to 9.0)
+``pc-0.10`` up to ``pc-i440fx-2.1`` (removed in 4.0 up to 9.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These machine types were very old and likely could not be used for live
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4ad724601a..b528f17904 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -281,9 +281,6 @@ extern const size_t pc_compat_2_3_len;
 extern GlobalProperty pc_compat_2_2[];
 extern const size_t pc_compat_2_2_len;
 
-extern GlobalProperty pc_compat_2_1[];
-extern const size_t pc_compat_2_1_len;
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 172814f604..cd6335d6b4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -304,13 +304,6 @@ GlobalProperty pc_compat_2_2[] = {
 };
 const size_t pc_compat_2_2_len = G_N_ELEMENTS(pc_compat_2_2);
 
-GlobalProperty pc_compat_2_1[] = {
-    PC_CPU_MODEL_IDS("2.1.0")
-    { "coreduo" "-" TYPE_X86_CPU, "vmx", "on" },
-    { "core2duo" "-" TYPE_X86_CPU, "vmx", "on" },
-};
-const size_t pc_compat_2_1_len = G_N_ELEMENTS(pc_compat_2_1);
-
 GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
 {
     GSIState *s;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9e1bca7b17..dcf50684a4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -66,7 +66,6 @@
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/i386/acpi-build.h"
-#include "kvm/kvm-cpu.h"
 #include "target/i386/cpu.h"
 
 #define XEN_IOAPIC_NUM_PIRQS 128ULL
@@ -435,12 +434,6 @@ static void pc_compat_2_2_fn(MachineState *machine)
     pc_compat_2_3_fn(machine);
 }
 
-static void pc_compat_2_1_fn(MachineState *machine)
-{
-    pc_compat_2_2_fn(machine);
-    x86_cpu_change_kvm_default("svm", NULL);
-}
-
 #ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
@@ -851,22 +844,6 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
                       pc_i440fx_2_2_machine_options);
 
-static void pc_i440fx_2_1_machine_options(MachineClass *m)
-{
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
-
-    pc_i440fx_2_2_machine_options(m);
-    m->hw_version = "2.1.0";
-    m->default_display = NULL;
-    compat_props_add(m->compat_props, hw_compat_2_1, hw_compat_2_1_len);
-    compat_props_add(m->compat_props, pc_compat_2_1, pc_compat_2_1_len);
-    pcmc->smbios_uuid_encoded = false;
-    pcmc->enforce_aligned_dimm = false;
-}
-
-DEFINE_I440FX_MACHINE(v2_1, "pc-i440fx-2.1", pc_compat_2_1_fn,
-                      pc_i440fx_2_1_machine_options);
-
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
-- 
2.41.0

