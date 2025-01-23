Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485113njk;
        Thu, 23 Jan 2025 15:44:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVCNuPVx722Uu3i0rO1Fw8PLvUdGszAbXgvJpI8pJTB7YIbZ6B8BnmSUahAKrDhsZwC5IqtdyhgJgM+g==@linaro.org
X-Received: by 2002:a05:600c:1c84:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-4389144fa26mr238734415e9.28.1737675890256;
        Thu, 23 Jan 2025 15:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675890; cv=none;
        d=google.com; s=arc-20240605;
        b=DBLF1da2rKJMDBotfgnFtbGOHlOdQeTtihdrmDJZPobDjD6YpYFlHfrH7wu8kj+wEa
         VyV09+VfOu1PbxPGQNROOAK6KY+iFRicyUyQ69H+LAjDxZ91XCuig0G5VfvFVIxLmoD8
         PVX5dYTyTpx0VSMmDUaH01jjD5DA/3I/vYoevbzWR+22cUSMMGzonigigipyNcTQlwNJ
         yKPv//oitQgPt7Z5ZONDmFq2fXaWWTc1AuIe7AarVtdS64+p0vnTOknlCubu+wvnrvDi
         wfEsUXgsV9Hzq9pc4sDUAwhQ61y9vbtYMNn/8K0g7/tyvcCWqw/5dXIIpQfToNIBeljj
         9KMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VK0JABDJF/QMP4ClWDlwjdLf62KvnH3DnM23ZO9feXo=;
        fh=qCiEb2Sc5Zdco0tPU8NUMoxy904EuF42E08JK5OnZgQ=;
        b=NRDkBfMS/O9jT4SNDct68At051sxSFIDKh0hyVIzFP2yZ7Sm0Lgz3sabZ7RwsYjPdV
         oj+QON4eyuqHVmlBw5IrjKFrv1wnvlZA6Jqfq5GuOcZ4PKXgp1p0fmXnpsKeffflGMXz
         mpQZ5xLc6P0z52H3nSBJstC0ORpLLEtpsaICmDm9ty3a5wQlbJaOaVgqiscP72peGRjQ
         iaNmREWo0hxL69w3l80A94av2nctkJoLsNDQibiWKxkovSGzaIM3gWqJ7otI8kQs0FfZ
         GvOSPRXz6VIKS6jbo9Ye+NMXxpddkMpHSyn9KOSFsj2e1RWYNHuTW8KcyOsc3blKdx5f
         cNQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjUtv3BS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4cd1b9sor2341455e9.1.2025.01.23.15.44.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjUtv3BS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675890; x=1738280690; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK0JABDJF/QMP4ClWDlwjdLf62KvnH3DnM23ZO9feXo=;
        b=KjUtv3BSISEwYYrjtsdW9rC21eHyWHlHWEaEIaDPFENOxIgxRu3h8rDvb2fGkLhisD
         LdAo44WmZo7CDRjOIgbMjS0sAadEmc4Sgc3OtB1lybYUpFflYxt0SCWMNiXVSM/Gk+Mj
         vfiSDmPF/Q8c2nV4ocXvd11qSo5pnEtqwtIqUdVkcrgtxBhUIlBVEb8oM9DGeUt5byE2
         y6XWiV85YWNo5d9qRNvQ7gX59Vb3W8NC3+MnxLJB1fB5A+U0LGIwcdGc5Ih04fJ/NUCp
         BxAvXc1HWiKMjBeTUESEm4iO+Sb8yTaehq0d4rIp8EiEFzOLSoKTt5k3cUFUzjxjajSk
         QE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675890; x=1738280690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK0JABDJF/QMP4ClWDlwjdLf62KvnH3DnM23ZO9feXo=;
        b=v7hZQGfz55DMIZVNYHylKXrP0WakeM8fTuZMrDjOOef0qSGyktgbEu7D0BpUVZWZws
         gqXqN6Fdw7EBor8eMNYlByH1diRdzMTHC/t8ZysONpip2sFGwbA7g6b0U3CZHEPIG48j
         qf/LvOyfI+HjVIADU06G1CWLLSF6SLQUU70HJt0pUszeXI82D2jNSlse9iv9899oMIFy
         jf4qE3B9wRyojGbk79uC6xAGnkeIuTAtMmVw2fQ5rimHekprQt7D/Uy0MLoFvRRJgUhI
         58aZYeKK+112kJP/tdLwYjfnyG79J0mMa5bKq8VXsXjb0BfPpisN0cMuhNV4LQ0jxmUD
         kUiw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Cs5xm2dLYWLYwLRy3aXvG3fsJsHP6O5Auk4NF9rq+f/Pk27/PyjmmYh2Z2+xrlj9+ZOAUQFxZns92w==@linaro.org
X-Gm-Message-State: AOJu0Yx2lztazFETb0zaSldrbIALNsS8sRl9GeYulFlcHDdHmO4NSMna
	d4exrcEij9K6eIF6EzNvHDeokt5luX0gis8oRMaZ2FXAG+TT++dk/oEVfO81a6+kRw==
X-Gm-Gg: ASbGnctWZKPW8Xl5eGKeMXrgWIt5jH2wIdq3DDTax//ffATy5OIqTa4P+We1qnZoSrE
	bUQKNt9MYMXt7kmPhp4K1NEn1da1KyRoYVgYfsyPNfDtxsGnXRZ4XfolqQeBNXHFh4EwhVwmdE3
	IUw3cRJB1SDqs4d+1nYp5uHXdBD2lmf5F/pKVI7C+cK+lz0j3SzvNILXu8fExutxk8hvgOElSOs
	z+WXIdd9f5b74X1UV7f80jWB9k/mD5KB5+qVujx4MVWMd5zNDL8BsS2pYyl7oUJN77rb7ZSCas+
	LyMQqQGi0wkKftDlFFeiAOqSkABgGOyMbR9i3gw6C9i9YUH283QaOWk=
X-Google-Smtp-Source: AGHT+IGSMRqXknIm20dxUVJ6YnBSj5qdwQEIsknPsDpqx1Ro9qYQKL2SDEG840LoeQHivalI7LVk8Q==
X-Received: by 2002:a5d:64a1:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-38bf5677c09mr24857649f8f.5.1737675889741;
        Thu, 23 Jan 2025 15:44:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4161sm952291f8f.88.2025.01.23.15.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/20] accel/kvm: Remove unused 'system/cpus.h' header in kvm-cpus.h
Date: Fri, 24 Jan 2025 00:44:00 +0100
Message-ID: <20250123234415.59850-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L2cuHOkpDhni

Missed in commit b86f59c7155 ("accel: replace struct CpusAccel
with AccelOpsClass") which removed the single CpusAccel use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-cpus.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index b5435286e42..688511151c8 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -10,8 +10,6 @@
 #ifndef KVM_CPUS_H
 #define KVM_CPUS_H
 
-#include "system/cpus.h"
-
 int kvm_init_vcpu(CPUState *cpu, Error **errp);
 int kvm_cpu_exec(CPUState *cpu);
 void kvm_destroy_vcpu(CPUState *cpu);
-- 
2.47.1
