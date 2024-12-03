Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3543222njk;
        Tue, 3 Dec 2024 01:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBvEY+UwTH/dnpr3NT6fjt4ES8Pevy/q+WV44NUnwe24PCG2FNQgRXv51HAFEK5jgTopwblD41GK4Qow==@linaro.org
X-Google-Smtp-Source: AGHT+IH7B9djp+OVLaiT27bajmKec0kQOYLJzKHh902PDEAMK2xzCYPfkzJSb63ZCYqMnAqVnbSl
X-Received: by 2002:ac8:5816:0:b0:466:a04c:e9db with SMTP id d75a77b69052e-4670c111c73mr20052631cf.33.1733217739904;
        Tue, 03 Dec 2024 01:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733217739; cv=none;
        d=google.com; s=arc-20240605;
        b=ONuPmOBCoaf4T1ZBOotR1tOiIXdsrmWIlRmL1W0tNDpe3HyR0PYJ7xlx7keifIExY+
         zQcOi0xf06DwDe1ndQs8cahutCnRJPOFxybB/G/5C0AglSCOgPJEQVEyep5F3R6gMSi2
         CbqLAndFLtEg1j3Vci8Ehoa2E8oA3wbHOl/QHFayboV3VXEwxJFF1g4tARL9IxN9lx3k
         s8bIlfC62REDOZFcLxJjAAdKhdAWQOJD528bOeTVfFgRu6rTGrg+HysPSj1BchOPmMnl
         3N5eltBtbHeclP3E5Y4WURlNI/Ogi/v4QrC3MYrKQityofZ02+7wCxjx5gTk7xN1QXQc
         1iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7YrECqGgLUZ1d6WAaLttV2kaR/8HcO6J1SyjXJDIUtI=;
        fh=K4q8LGA1dTAvVw7OHYqRwA3rKlWlusrk6TGWj+g1fmU=;
        b=G/gBoWeGZ8LOXQyDMzJD3CtsJjeW0q3OFnIniUF8uDZ/pNRQV07H5bHDmm87AygLGd
         eeDjbrCBowR9hGnM+mtnLfWFC6++j3z1aPSFHvNaxHxP1cz4rTE4UeBgw0NoLiYGK8Lc
         kgs/nf9ufyyDWo4mQrbN87Kt/SjbEjrdMqCv12VYMaPRDCqftLANQv/zndalEG+5BygO
         bVzvCbRk8ZYPsrnmPYpRLxNIK5ztOSjSAOXtU+10S34Tibl8wwOk2eY6JTpGhfmZMC9M
         s2cGIWaUgcYtFjbXGCS/SM/cpOKLsGmkiVf6Z9UxLtkL2FujsTMUJpC5BcrDYkYxc5Ym
         Fhag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IOjNgJ7L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c445cc10si129471851cf.642.2024.12.03.01.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:22:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IOjNgJ7L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIP6Z-0005WP-Co; Tue, 03 Dec 2024 04:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIP6X-0005VK-9G
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 04:22:01 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIP6T-0002dW-Tu
 for qemu-devel@nongnu.org; Tue, 03 Dec 2024 04:22:00 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53df119675dso6382340e87.0
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2024 01:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733217716; x=1733822516; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7YrECqGgLUZ1d6WAaLttV2kaR/8HcO6J1SyjXJDIUtI=;
 b=IOjNgJ7LjBtMACeTQHcKLyDpiTZVFp7WPGQkRQyHrm8+Vt+ZzfSm0YnRY2KCOnCWxx
 8IoQMSRDA/hKtkoIccryr5dmn5S/8h+4j476e7uEiQI2K5C4WbOiHjOvx/PTI/42NYpA
 i/YXnr9Z5Nm0FvgQgUnlKcvkrY1sGK6WgiAugU9Et5wzvk4w28vEr6FnqaRDamrRngNO
 u23Q7Tw8eWpvliXr8Khud01j1/mo9Bwbxhj05AK/4LpO5LzqmE1GsrEU2q8pfYF8xoZ6
 1fQANfyTsDWk8aTMLUHWhPlPGCP7nNuaJuiV1sk8omHc7qHta4aFNgWdzDAnrXFHzL7a
 GEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217716; x=1733822516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7YrECqGgLUZ1d6WAaLttV2kaR/8HcO6J1SyjXJDIUtI=;
 b=TK5FJoRLoy6t/l2yXVCwgyylubQOhu4z2RK8rFGvepgK3qdJo0fs7bQ/XVIogNIs/9
 huGe0Rnr6xNoI70MUYJWtzY3cTRtwesJV/ZfeXIYkNI2RzniMt9/ZLGkW6H43aw0rUf/
 8SbGGTvtaoS22dmxK45k0ZnypeakR/w8a1yQEAuVBMQwKLjcJgeZ/TmUl1YLERchTdHR
 r3KoMYtkU4UhD8gABoVEvem11SOGs6Ryh1ah/Q0C7XiiMjHaS5LWJzS/oGWusUcEnIAz
 eRohKOWt9jAetm8IBBEz5LunkVRy3GdnujiriFnwPtJo7yIL7TMW8QvLeOc3QPb21uiJ
 8g9g==
X-Gm-Message-State: AOJu0Yww8VvYYQbqkYdQKKNLiiZjMegA+Ausqdz+2nfi0aVjECgwzfk7
 Cnmj7G+VKW0UZ/is2wrixrj3oo/RnUepMGPU1SGSXo/Egpk7zPdQ63dxA3uyLjuNWv1BHnifpxn
 YqHI=
X-Gm-Gg: ASbGncsI1FQcYCH/oS13qr89q+DTu8U26jPqvOrgQsdbkrlAX2UYirJzb4oymtSBApB
 etfJcgd7XN/jc6/CAx6cRz/xp7jAlddi5FPONQpEizDM6Ic48MgA8tjKICeDML9e4lPk6AyHVar
 qaDc7W8jbNKVGIQXO7gM9IfAAiDEs9XKwlo892bHfvrx90C5gg3hUkOrK6rmP5EO++TA95Uugxi
 6p0TEh0lIFhuJHsipeHlyZTXkfxPeahrlpD83qSkk1acpgRIhTbyYpI9Vfnvm1q4mMe34BQ
X-Received: by 2002:a05:6512:1313:b0:53d:ed94:fe64 with SMTP id
 2adb3069b0e04-53e129ef4aemr1305626e87.10.1733217715863; 
 Tue, 03 Dec 2024 01:21:55 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c1945sm587682966b.19.2024.12.03.01.21.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:21:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] cli: Remove mentions of legacy '-machine foo,
 accel=bar' command line
Date: Tue,  3 Dec 2024 10:21:46 +0100
Message-ID: <20241203092153.60590-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uG3aTJ1/tUKH

Thomas told '-machine foo,accel=bar' is sugar and almost
deprecated. Rather than having bad examples in the tree,
remove the legacy form and update to the new '-accel bar'
one.

Xen uses via MachineClass::default_machine_opts left for later:

hw/i386/pc_piix.c:818:    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
hw/i386/pc_piix.c:830:    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
hw/xen/xen-pvh-common.c:381:    mc->default_machine_opts = "accel=xen";
hw/xenpv/xen_machine_pv.c:69:    mc->default_machine_opts = "accel=xen";

Philippe Mathieu-Daudé (7):
  tests/functional/test_ppc64_hv: Remove legacy '-machine foo,accel=bar'
  tests/functional/test_virtio_gpu: Remove legacy '-machine
    foo,accel=bar'
  tests/qtest/fuzz: Remove legacy '-machine foo,accel=bar'
  scripts/device-crash-test: Remove legacy '-machine foo,accel=bar'
  accel/tcg: Remove mentions of legacy '-machine foo,accel=bar'
  accel/kvm: Remove mentions of legacy '-machine foo,accel=bar'
  qemu-options: Remove mentions of legacy '-machine foo,accel=bar'

 docs/about/removed-features.rst                |  2 +-
 docs/bypass-iommu.txt                          |  3 ++-
 docs/nvdimm.txt                                |  2 +-
 docs/specs/tpm.rst                             |  2 +-
 docs/system/arm/cpu-features.rst               |  2 +-
 docs/system/cpu-hotplug.rst                    |  2 +-
 docs/system/ppc/powernv.rst                    |  2 +-
 docs/system/ppc/pseries.rst                    |  4 ++--
 linux-user/s390x/target_proc.h                 |  2 +-
 accel/tcg/monitor.c                            |  4 ++--
 system/vl.c                                    |  2 +-
 tests/qtest/fuzz/generic_fuzz.c                |  2 +-
 tests/qtest/fuzz/i440fx_fuzz.c                 |  2 +-
 tests/qtest/fuzz/qos_fuzz.c                    |  2 +-
 tests/qtest/qmp-cmd-test.c                     |  2 +-
 qemu-options.hx                                |  9 ---------
 scripts/device-crash-test                      | 11 ++++++++---
 scripts/oss-fuzz/output_reproducer.py          |  2 --
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py |  6 +++---
 tests/functional/test_ppc64_hv.py              |  3 ++-
 tests/functional/test_virtio_gpu.py            |  6 ++++--
 21 files changed, 35 insertions(+), 37 deletions(-)

-- 
2.45.2

