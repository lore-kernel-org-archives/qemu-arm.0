Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185049njd;
        Thu, 3 Apr 2025 08:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUItgKk4thHi2KBHwipFi3uOWMuuXazlVaa92RkFbDXSrBgoRtujffIQAg6mdyWKx28i6NO/syOJppGbw==@linaro.org
X-Received: by 2002:a05:6000:1a8d:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-39c2f8e27f6mr2659042f8f.29.1743693532711;
        Thu, 03 Apr 2025 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693532; cv=none;
        d=google.com; s=arc-20240605;
        b=XGSm6ZzSZ5sNp1qewzSbJB9m8/rNgqxm38LSi1Uqm2JxjZ52kOnGbfxTh16aXOB+wZ
         2OnzaUYL5fP571Z4DAVyvMZe2knms1oh+pZRu/Tv3PprfM6LRuUQuqtx2NjfLfxu7YId
         wpwDWF0csLErAqYOAvnLrRGfZmK02GahvOSAyQ1C1X0GMYQJaH5bUgraKT4cfWvTt+Bv
         b0ROLk7+XKEnPcPA/jdgRoP0qYBhPAVS/4+oHEk61wrydMTaSNBejn4CYdeo1C27q41V
         A+3uB+zFg5iVkmDAskJU6qUTKsy9ghitvnHPqBTYMC+HuSshQ/Ggd7AfLVuUfcCPMJhO
         Z+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SL1deZbZrQCTs4masaMY+2Uy3IE2KzJVlJp7tx88rA0=;
        fh=EYjQ1FKT0kSwv8AfyVXLnDzNvrCoOkWGQ+G6BbY9BEM=;
        b=C6mlsO0rsv0j/VdQ/ClryWWMuNqDsy1eOoedf4Ki1xvUHL2zF7fMMfvw6ryQKzmeT+
         z6rFU9KT9rGg5lRlDB4ylggYQuWoTUkG3sDjeLY3S077HUUB0HopzZd82hxd9aWrgegj
         u52YapUkUvWt+vQyrhAXPoCYZryilNeVcx7lGtyb/8hqsfPtNseASvaN4KKXn3rBM+Pp
         GJQzG0SuN+NXeMoi0AD15iz393FXlvJ2WPxKvygh8ZmJxybOmf4jDvZS5Hl1NC0aGXNj
         YEFrbFlzYS4Gcq7XUhS1ZzmCAHeqWHl9KLxspqXMj6Mhl/p5opv/4HUTgvbvWQkHMjV0
         vdoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQTFlW+a;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec1fd4c71sor7536855e9.0.2025.04.03.08.18.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQTFlW+a;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693532; x=1744298332; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL1deZbZrQCTs4masaMY+2Uy3IE2KzJVlJp7tx88rA0=;
        b=pQTFlW+aOS04Lky7uhDP2ACwVlXHYafv9aCXW4bnIASwBnkLb749DXdRlgYCeV4SA3
         L043NS8cCw2dEftjtPxfTtX3s/iY/omKlD5xLoQS/nT5nH75j3emhVxBTvNAG0W9Ooha
         S6PAnT7xcqK8shyQPxqne/m/RNqu2yRqhbUBinXBb4fAQLUVRORQ37lka0aOVsBknfn3
         VX1GHQZDgOddVLHbTjo8efvgkUqh7i6EBiHGE3EH9y9i2CJ77pkPAFqog3/LdU4bN3d9
         g0J3vtGGP9SmthrPa1d95KSBttsgR3hLyBTpf4ofuoxtqZVnXmUhXnZC2qmmvCocsuhC
         D+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693532; x=1744298332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SL1deZbZrQCTs4masaMY+2Uy3IE2KzJVlJp7tx88rA0=;
        b=O8TSALHp8f7MNqjaHz4TwaOwtfG4awlmqIjI9YkrDv3hr6xWLeUwKdojA3d5xIEImc
         Y4NSqBkdgTPQ42kMyyufbaqwI9Npj516dwOP8ryJoGsKq0vibfZn/Z0XJ8iz8UbNMNCh
         7jfX1m5gDwHBQqWdn1Ql8lxoQN1rJ3qsQdknJvvK7y4fz4aDnri8Kufjn90OJr+ynFRj
         sswKwIjsHwrxVvBF9EV7tzZT/c5UysM47IO3PdQZdJaSiRIw0yIhnVedM/KxDHNTuJvS
         hAiQ7dUo3eE5FiRxSr+uh/DzTejFwA8Xk8gQOoDmfDsDjpUdRYiPWK5y6p+egG41qsVK
         /roA==
X-Forwarded-Encrypted: i=1; AJvYcCX7nquspvPEPFSVR6Gav70a/2F71/WeC5XjyhKNBkNaKX5UiL+AbaQoDiGNBrKmHuIHp2Lm9E4C0/K2aw==@linaro.org
X-Gm-Message-State: AOJu0YwLYT5M590XUFqvsFNLbajyEyqrOXBlPMnqu6lsqr0gumOqRhAp
	pewbUGEE4uJ/V7GIavA9LY+CzhbT7FoUpp2qSuQON2Z/BRndR/RVe505dug4Qy+FGg==
X-Gm-Gg: ASbGncs6DVtSF/yXOgmUh7JACC2xJ49QFDgwvdfvsUmMON0ap/ZiJTrU+NzShHQ6LOL
	IfI+C4x7UWQZrgP+B95AYyasyO1q4QA20bGwCKA1dHmSNgAok6+IlOcHOyYn59QaEZ/SPNWhoMM
	Y87KNgyDn2uZCPF7ppz2S8bJrcLBLomtbXgl0q+vzAjrzWmM9/oHPTeA4dzZcJ8Ur/eZtyguCAs
	BuL9SifnYhKlNUCn5xiIitRsd0hHsQ7ue5Q8SWvgD86PKZ+PXGPPsqX2Zrbwdc3j047TEdF3iec
	KhC1lIFH73KiEdnApKY7W9/l9eRWX4KVeUgJ0sr8QtON0I8G1xhy94Qn1wUmhFAAuzYxR5Emet9
	PvIoIRBgRUqSGzfpqrslDb/cvQrK3eg==
X-Google-Smtp-Source: AGHT+IHLdb/KwzDYEzMPQ8tCsN6KanjpCnJ40l6AkElsJ7H4X9AR7REyWlw92creuZIMat1lQjU28A==
X-Received: by 2002:a05:600c:3d0a:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43ec1532085mr35629655e9.29.1743693532113;
        Thu, 03 Apr 2025 08:18:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a92desm20988475e9.14.2025.04.03.08.18.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:18:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0 v2 03/14] tests/functional: Skip aarch64_replay test on macOS
Date: Thu,  3 Apr 2025 17:18:18 +0200
Message-ID: <20250403151829.44858-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 86DsTpj2KJnX

As of v10.0.0-rc2 this test is still failing on macos:

  $ make check-functional-aarch64 V=1
  ...
  ERROR:../../replay/replay-internal.c:235:replay_mutex_unlock: assertion failed: (replay_mutex_locked())
  Bail out! ERROR:../../replay/replay-internal.c:235:replay_mutex_unlock: assertion failed: (replay_mutex_locked())

This is tracked as https://gitlab.com/qemu-project/qemu/-/issues/2907

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_replay.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_replay.py b/tests/functional/test_aarch64_replay.py
index 04cde433bcf..029fef3cbf8 100755
--- a/tests/functional/test_aarch64_replay.py
+++ b/tests/functional/test_aarch64_replay.py
@@ -5,7 +5,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-from qemu_test import Asset
+from qemu_test import Asset, skipIfOperatingSystem
 from replay_kernel import ReplayKernelBase
 
 
@@ -16,6 +16,8 @@ class Aarch64Replay(ReplayKernelBase):
          'releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz'),
         '7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7')
 
+    # Failing on Darwin: https://gitlab.com/qemu-project/qemu/-/issues/2907
+    @skipIfOperatingSystem('Darwin')
     def test_aarch64_virt(self):
         self.set_machine('virt')
         self.cpu = 'cortex-a53'
-- 
2.47.1
