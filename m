Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082361ejc;
        Tue, 14 Nov 2023 06:38:28 -0800 (PST)
X-Received: by 2002:a17:906:480b:b0:9e7:2d0b:8c46 with SMTP id w11-20020a170906480b00b009e72d0b8c46mr8649575ejq.50.1699972707950;
        Tue, 14 Nov 2023 06:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972707; cv=none;
        d=google.com; s=arc-20160816;
        b=RJJsh3ZkKABqT2iLdLXpvF/Ns8gGu4mcu8MUf5XnUV9zxSkNOyQ9rzTQrJ36Sivuo3
         Nc41XLEQ16uz0bHmCuP8f+6pHpve16/972l+IRq3xdz9/mM9shCyKwDqE2t2MohirYrn
         GG7xMAFsNcJFgZl/9WMneziLyNlECtoA8+Ev+JGhLBuZu8ht6i7ZkgqL+xpKt2EIIFOa
         VufJSvy0J5rA0pZYMxl6iOAuNElZzWAvLdOlOwBricwnG/WzXcnIhDUGtCHEcQ9cniyz
         nROf117pJ7iD87Ns40LNGrVwUhElxf+p76fMAC2fYjnMcNX9S6wpqH1A5OgRqTrzz5XR
         9YXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7bjOOh298/gVm20zFogtcW7Ag9vjCtjGY9z1KnDRo3U=;
        fh=+Vke2cRJ/9boBBC29R1hFHQdJ1vL+acKER0N8tLuRWA=;
        b=EPvwVZilQ49skQntj4JfZxhbiZ9mZyX5gab5lK/cuLsE11YfdfJFf1rI01uO+WrehD
         kAWhSNFLqVGkQvvp0NLRUdpnTprIboKGphCtDcXofSO6lHizqVn17XeMDqSxRGfz2P9R
         20RPoNhpcx6ZPm9jpD5N0l7wNTI/CNWsl8y44656ORoI26OOetf01QaIyjAVA1gcO7vs
         BVjiY13HIcALtcxVW6GHJCl4jt/WPDb4/Yq7+uy/DmrssBlVkB0Qjm3KIP2fAgQqLDCg
         6xBxZCdE1gfHmPXk51HMaTIIV4Y2jxiNdA3zTlj5TYgEh1XhRhfYkAoWBVue5Gsb/FLZ
         JUYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5SNb5ye;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 17-20020a17090602d100b009ad7d9ad20dsor1961329ejk.5.2023.11.14.06.38.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:38:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5SNb5ye;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972707; x=1700577507; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bjOOh298/gVm20zFogtcW7Ag9vjCtjGY9z1KnDRo3U=;
        b=d5SNb5yevYwWlHlNvVreqg/Dj/CS9MVqsZ7e4zbCJnJvgr13DA2pE0lbS0R5DRphPE
         C0ClsPOI24FXR4jWxY18JYRI2qsRPdUpfY/3yWhE6HQLW75HSuE6v/kR4XtLyInbatqz
         D9qfVibOAAcQf5H46E1ZocUjcnE3bDZtnNMGtJ+ZuWyZi0wJOn9JdsgCcSLxWcY+DGOM
         Krd9qoSdexsI86gu1aNYG5/H80Q1LekW9WMzvFIX6ZpsNaQKTBfRUGqNHvRpx37JuvFm
         G0eXbwJOnlfm56GtJbFunR8UyLBPBZoyUpNa5KiVePKGtwu42rcKBZ/v2PauRO2nEXqC
         6Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972707; x=1700577507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bjOOh298/gVm20zFogtcW7Ag9vjCtjGY9z1KnDRo3U=;
        b=ORK9t+I51pdC3Us4XW8VjD+w5byhe/kKMLYg/ux36qP+EJiCb0TG31AFg1LQ8Lo2cr
         AaAk+SzJHClJzUOqKTri488qsPa3LotR+Uncy3dK/C9FoGDUfrh9BFSvoNnFnh9gXZf6
         odXiql1+vM+hhLBVfWP41NbHjjNNjmZ7FDqMcQjKUpZo3jK05B8DZySbhb7WEqKCFmUJ
         OCRSWr/mwZKNgjpljHxsRW8IYZe2yQnx9WNrmxQCKDUQyBPclMauxORpq80Pv3WSlq3K
         jQ77hYYfEr+hx7EUaGK9aAz2TVs6oCLMxRdSoCbSSFCSA/WELeIIJE6NyeRqkZcMsEh2
         b+tA==
X-Gm-Message-State: AOJu0YyUWASxEuyncWW+yUIXPZs3roLQVvmuIUROYKBbo1uj7FeRrpZw
	XQtDsl9az6juM5xhlYHYRVI9fsY8
X-Google-Smtp-Source: AGHT+IGmC/f0NBuJq3lX6zmQbmq53YN/p3zW7ekfEdUOO96zzY8Hw2NKquJgt5a7Y31IS7pqqhAiDQ==
X-Received: by 2002:a17:906:e084:b0:9c6:64be:a3c9 with SMTP id gh4-20020a170906e08400b009c664bea3c9mr7562718ejb.39.1699972707580;
        Tue, 14 Nov 2023 06:38:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id v21-20020a1709064e9500b009df5d874ca7sm5636254eju.23.2023.11.14.06.38.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:38:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to tests running Xen guest
Date: Tue, 14 Nov 2023 15:37:57 +0100
Message-ID: <20231114143816.71079-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cAOqiUq9DfRu

Add a tag to run all Xen-specific tests using:

  $ make check-avocado AVOCADO_TAGS='guest:xen'

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_xen.py      | 3 +++
 tests/avocado/kvm_xen_guest.py | 1 +
 2 files changed, 4 insertions(+)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb5..f7f35d4740 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -61,6 +61,9 @@ def launch_xen(self, xen_path):
 
 
 class BootXen(BootXenBase):
+    """
+    :avocado: tags=guest:xen
+    """
 
     def test_arm64_xen_411_and_dom0(self):
         """
diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index 5391283113..63607707d6 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -22,6 +22,7 @@ class KVMXenGuest(QemuSystemTest, LinuxSSHMixIn):
     :avocado: tags=arch:x86_64
     :avocado: tags=machine:q35
     :avocado: tags=accel:kvm
+    :avocado: tags=guest:xen
     :avocado: tags=kvm_xen_guest
     """
 
-- 
2.41.0
