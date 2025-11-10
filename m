Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D575CCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 22:59:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIar4-0004f3-1O; Mon, 10 Nov 2025 17:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vIaqt-0004Qc-He
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 17:59:14 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vIaqr-0004X7-Og
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 17:59:11 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so5433453a12.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 14:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762815548; x=1763420348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJ/aCtEzIF0pB/zF0oJfUqwREKGpwVpCTU/gtPJxffU=;
 b=FZIu3MWFC2BQFSGmwd6Ev1C69GBnalfAvUFy6uKfIIfySv7vE72GBpFfV+Imk3q+Dd
 v24vOtHuBcIg2E2J+iAeR3yFxakHuEMNefkqICQW48KM6eu4Zo9hAasJuzwy8LGEqen/
 G7uVeYlgTHLDSHIaJzMmFW5rVkb0Z0dpLYUpWqstWz8SOryKp3vxfpg7aL0B68ZJ2rQc
 PLYi8zPjETzJJ31SPYHZ4sSpmZNSR0EM16ne9SrXeG5NaYhpxUePvyxNFi4heoA3RKbP
 cBN8hlmkOceonq7ndtSCjEFd299PBLq9tTu1PCz1TvvxAMPpbZqjsusC5nkEj0HYn8JD
 rqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762815548; x=1763420348;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XJ/aCtEzIF0pB/zF0oJfUqwREKGpwVpCTU/gtPJxffU=;
 b=CpbEbKo6GZfyv86DXh31aDDmassFshXyCirCRVd+aBC1QYVRPrr2gh2hlQgN08Z3IP
 FIvnWaPkOnYJ9O4zdco7XU4l3R83LSXCtwYBecq9jalb6wvPR3aadyaGzZRl5wk9Co46
 +rGM/e4DuZFgSU5gJL1tA7YduPWPvEqHuCOOo24wsOJf312UDdeq06+Fa0E1M9Tz6kQZ
 YhluwllsbbUBn4ddaTpnSXT/Tof44MeEFNoHp+gD5U5HgAkyfW6en6la080RSdJFGdxP
 /wzZISs6zKvR10N166beUdo0fxPh0EFqOKxxI3hgiofmjRVmavbx0JFUoWsi0yGbMFGk
 xqqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDCojrXRm/9RNGt3XXaZOjB23Lyux26SnN2A1Mp8Gf+cuVhj2bvh48CWIgOKDTsbqt8f0mquY0Tg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2/56QvRpK9/t+H+Ui0DOoHACM8rlBTSM0g/aU9uQbG3jx9Whf
 CxugkbVNhLCZgW2YAflEOm61UL9rhobfpybiNRLkV52mi9bep2fOqxyk
X-Gm-Gg: ASbGncugSAXZmduoNVXkZD1tgfXYG6eGgm7rdTmOyQ4Xmo4QrcQatVe0gfDOEFvyTz7
 c86cbjId60q5a64YBbBtu9Z6QrbS90OMrBJXSzCKblIkTXgAdEfIlIyaWz4XidcHJfxFMi9FZ5T
 OVmu/Z/W+Scafddbz7sJe/+znK8lmAwtq1llbucJ5QSAOD3UNG7QJKulD0AYeq1nomDV3mXkbn3
 xG0HwJ8b87NL3sOtZ3Jy+AF/yYxjvW9Cg5e0O/9TcReNIa0snV/1OQ1lYY/SLBw9VVwKAIRzAlA
 PbENIw3rvDhUx7uRhwSSf0B5Aq77Jp/qfp54Fo9d9RxxNLMx0aoOd/6GDfb8a70H8zP6lUFVCKJ
 DfS9azt5rW2IkVBfUv8Q2jw6vUIFI0QU7oulRhHbosKsvUXRWI6wP+SyHcbtYiZfzYjPlXfnIwP
 5+0xaQThcaEdAvFrWVm+F/2TN2AvN9nLldcTk2Yu3No/c6i+50Il2orPItf1oN9kF5k9h/6DtaV
 Ya2k0KZKvN6a1UaaZ6CQXnJk0sFSZAmpc4=
X-Google-Smtp-Source: AGHT+IE8yPg06rj5njcFQDbyIehPCrWn7Sw/7AUjC4DyI4HP5tG60fI7QlSPLV+qYRBw/c8Zhb21HA==
X-Received: by 2002:a17:907:6ea5:b0:b5b:3ab0:a5b7 with SMTP id
 a640c23a62f3a-b72e0562593mr976435566b.42.1762815547315; 
 Mon, 10 Nov 2025 14:59:07 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-23dc-7300-bdbc-21c7-75fc-dd84.310.pool.telefonica.de.
 [2a02:3100:23dc:7300:bdbc:21c7:75fc:dd84])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bd741sm1165777866b.57.2025.11.10.14.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 14:59:06 -0800 (PST)
Date: Mon, 10 Nov 2025 22:59:04 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 mohamed@unpredictable.fr
CC: Pedro Barbuda <pbarbuda@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v10 13/28] whpx: change memory management logic
In-Reply-To: <20251029165510.45824-14-mohamed@unpredictable.fr>
References: <20251029165510.45824-1-mohamed@unpredictable.fr>
 <20251029165510.45824-14-mohamed@unpredictable.fr>
Message-ID: <463DE817-A72E-4ACF-B6A4-C40E879B4107@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 29=2E Oktober 2025 16:54:55 UTC schrieb Mohamed Mediouni <mohamed@unpre=
dictable=2Efr>:
>This allows edk2 to work on Arm, although u-boot is still not functional=
=2E

This seems to fix https://gitlab=2Ecom/qemu-project/qemu/-/issues/513, at =
least it works for me with x86 SeaBIOS via pflash=2E Also, https://gitlab=
=2Ecom/qemu-project/qemu/-/issues/934 looks like a duplicate=2E

I wonder if this patch could be 10=2E2 material such that OVMF can finally=
 work with WHPX=2E

Best regards,
Bernhard

>
>Signed-off-by: Mohamed Mediouni <mohamed@unpredictable=2Efr>
>---
> accel/whpx/whpx-common=2Ec | 101 +++++++++++++++------------------------
> 1 file changed, 38 insertions(+), 63 deletions(-)
>
>diff --git a/accel/whpx/whpx-common=2Ec b/accel/whpx/whpx-common=2Ec
>index c69792e638=2E=2Eaefec4bc8f 100644
>--- a/accel/whpx/whpx-common=2Ec
>+++ b/accel/whpx/whpx-common=2Ec
>@@ -258,89 +258,64 @@ void whpx_vcpu_kick(CPUState *cpu)
>  * Memory support=2E
>  */
>=20
>-static void whpx_update_mapping(hwaddr start_pa, ram_addr_t size,
>-                                void *host_va, int add, int rom,
>-                                const char *name)
>+static void whpx_set_phys_mem(MemoryRegionSection *section, bool add)
> {
>     struct whpx_state *whpx =3D &whpx_global;
>-    HRESULT hr;
>-
>-    /*
>-    if (add) {
>-        printf("WHPX: ADD PA:%p Size:%p, Host:%p, %s, '%s'\n",
>-               (void*)start_pa, (void*)size, host_va,
>-               (rom ? "ROM" : "RAM"), name);
>-    } else {
>-        printf("WHPX: DEL PA:%p Size:%p, Host:%p,      '%s'\n",
>-               (void*)start_pa, (void*)size, host_va, name);
>-    }
>-    */
>-
>-    if (add) {
>-        hr =3D whp_dispatch=2EWHvMapGpaRange(whpx->partition,
>-                                         host_va,
>-                                         start_pa,
>-                                         size,
>-                                         (WHvMapGpaRangeFlagRead |
>-                                          WHvMapGpaRangeFlagExecute |
>-                                          (rom ? 0 : WHvMapGpaRangeFlagW=
rite)));
>-    } else {
>-        hr =3D whp_dispatch=2EWHvUnmapGpaRange(whpx->partition,
>-                                           start_pa,
>-                                           size);
>-    }
>-
>-    if (FAILED(hr)) {
>-        error_report("WHPX: Failed to %s GPA range '%s' PA:%p, Size:%p b=
ytes,"
>-                     " Host:%p, hr=3D%08lx",
>-                     (add ? "MAP" : "UNMAP"), name,
>-                     (void *)(uintptr_t)start_pa, (void *)size, host_va,=
 hr);
>+    MemoryRegion *area =3D section->mr;
>+    bool writable =3D !area->readonly && !area->rom_device;
>+    WHV_MAP_GPA_RANGE_FLAGS flags;
>+    uint64_t page_size =3D qemu_real_host_page_size();
>+    uint64_t gva =3D section->offset_within_address_space;
>+    uint64_t size =3D int128_get64(section->size);
>+    HRESULT res;
>+    void *mem;
>+
>+    if (!memory_region_is_ram(area)) {
>+        if (writable) {
>+            return;
>+        } else if (!memory_region_is_romd(area)) {
>+             add =3D false;
>+        }
>     }
>-}
>-
>-static void whpx_process_section(MemoryRegionSection *section, int add)
>-{
>-    MemoryRegion *mr =3D section->mr;
>-    hwaddr start_pa =3D section->offset_within_address_space;
>-    ram_addr_t size =3D int128_get64(section->size);
>-    unsigned int delta;
>-    uint64_t host_va;
>=20
>-    if (!memory_region_is_ram(mr)) {
>-        return;
>+    if (!QEMU_IS_ALIGNED(size, page_size) ||
>+        !QEMU_IS_ALIGNED(gva, page_size)) {
>+        /* Not page aligned, so we can not map as RAM */
>+        add =3D false;
>     }
>=20
>-    delta =3D qemu_real_host_page_size() - (start_pa & ~qemu_real_host_p=
age_mask());
>-    delta &=3D ~qemu_real_host_page_mask();
>-    if (delta > size) {
>-        return;
>-    }
>-    start_pa +=3D delta;
>-    size -=3D delta;
>-    size &=3D qemu_real_host_page_mask();
>-    if (!size || (start_pa & ~qemu_real_host_page_mask())) {
>+    if (!add) {
>+        res =3D whp_dispatch=2EWHvUnmapGpaRange(whpx->partition,
>+                gva, size);
>+        if (!SUCCEEDED(res)) {
>+            error_report("WHPX: failed to unmap GPA range");
>+            abort();
>+        }
>         return;
>     }
>=20
>-    host_va =3D (uintptr_t)memory_region_get_ram_ptr(mr)
>-            + section->offset_within_region + delta;
>+    flags =3D WHvMapGpaRangeFlagRead | WHvMapGpaRangeFlagExecute
>+     | (writable ? WHvMapGpaRangeFlagWrite : 0);
>+    mem =3D memory_region_get_ram_ptr(area) + section->offset_within_reg=
ion;
>=20
>-    whpx_update_mapping(start_pa, size, (void *)(uintptr_t)host_va, add,
>-                        memory_region_is_rom(mr), mr->name);
>+    res =3D whp_dispatch=2EWHvMapGpaRange(whpx->partition,
>+         mem, gva, size, flags);
>+    if (!SUCCEEDED(res)) {
>+        error_report("WHPX: failed to map GPA range");
>+        abort();
>+    }
> }
>=20
> static void whpx_region_add(MemoryListener *listener,
>                            MemoryRegionSection *section)
> {
>-    memory_region_ref(section->mr);
>-    whpx_process_section(section, 1);
>+    whpx_set_phys_mem(section, true);
> }
>=20
> static void whpx_region_del(MemoryListener *listener,
>                            MemoryRegionSection *section)
> {
>-    whpx_process_section(section, 0);
>-    memory_region_unref(section->mr);
>+    whpx_set_phys_mem(section, false);
> }
>=20
> static void whpx_transaction_begin(MemoryListener *listener)

