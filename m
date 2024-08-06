Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1302913njb;
        Tue, 6 Aug 2024 10:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeg817+hQUs0Nr5Ugym/qfYXzgNtOJ3Z/Sy59eBEoo4JuS1dQS7djSVEk+fgasycYMaKAI0zQRFRlUb2lUZEm0xJ/hY4o4
X-Google-Smtp-Source: AGHT+IHzGTWTyEOr495YI0J2UpSKr0gB78pQOWQRCv/vOx/tUv4eZSuPRHtG1uzPm9FwaXNXSDtZ
X-Received: by 2002:ac8:58cc:0:b0:44c:2c6b:9a5b with SMTP id d75a77b69052e-4518943f38cmr274922691cf.25.1722965564007;
        Tue, 06 Aug 2024 10:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965563; cv=none;
        d=google.com; s=arc-20160816;
        b=oVklnvuX9m+G9o6KJNHGr60vP6kaRHX1MnsjMZZiRP7YeN4VsybNTcnUBGmya+CWdh
         lxuI3fGBFX4j1fhIjsPrPhUr80bxdAlwjD1Id8ZRnWuMuQdblD3Y69qvSu+YdVkqz/jJ
         uivF3HdqfhRyNlU9AcWvda+2FWgh+mMy8/77GQamJSt1Cxyr5jKRWbeVMXRPF15m16s+
         oBuC+arZrWPtkCZ7I+cCdFl7fIOxlm6jyxRu2wGh3sItTzv5LhKQM+I2isonN3BLgBHl
         1ehFvWWqq6cimZY0+wllk13CwPvB2AyikEVpXsFJlN9yP7Pxm111pnk+4h+6knqNqcQj
         g2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=01Mezu2vBS7e/Bbaib7lIYgCl8rkcleLFRElcDYTArc=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=h7VnEfN5ifVSNiwt1UESQ4MOXCADtlL2fzC3OCLbZ5d0iUoOU01+QVYk1U1of7lpSA
         vGKhIXC0KYqqZLKzRIhoRZ8y9xcN6u5n+eKz31D3VpdPeY4qKhrMQ4ORXL+cjDoS4NH4
         qD0Jkk3UF6p7OT12Ppvkq+xoajlV4Ra+fM5CPWvGGBcF17321iIIl2x0Afe2Z+cvJo6P
         a73PH5DUdx99vjRg4nnJiT3ofAqNQvyScpTfD3nmnDMi0U2jmYLKla9mU+ZWsfj23/yq
         XZbVnqot0usqFMM2Ld2UmfpWa2rBNNIYywEBXC1wwyxe4n7f0KeBUoxmwdEoJarHkYcm
         +NoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XATz4wQL;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a7814a8si137148031cf.505.2024.08.06.10.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XATz4wQL;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01Mezu2vBS7e/Bbaib7lIYgCl8rkcleLFRElcDYTArc=;
	b=XATz4wQLgQ8ICgGPDf+/zGd7zuIWWesdIdw1S81ovTCm0ecweuBEYxlOp6AYlBBxsOzCOa
	d9VGUj+bHqSHTa2OHDPyVebRtffJu+nNMtt/IuKdlw2z21MZqE+lFVsTcAl1rxI8B+T5IO
	ChRXb2yY73tNOmMcDz3iX2Ykt/YkWn8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-zxumTil8PJCidnFK9zrJIg-1; Tue,
 06 Aug 2024 13:32:40 -0400
X-MC-Unique: zxumTil8PJCidnFK9zrJIg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F6CD1955D45;
	Tue,  6 Aug 2024 17:32:36 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C21A419560AE;
	Tue,  6 Aug 2024 17:32:26 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Troy Lee <leetroy@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Beraldo Leal <bleal@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paul Durrant <paul@xen.org>,
	Eric Auger <eric.auger@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH v2 5/9] tests/avocado: simplify parameters on fetch_asset with name only
Date: Tue,  6 Aug 2024 13:31:15 -0400
Message-ID: <20240806173119.582857-6-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: NfgD997y9VYW

When an asset has a single location, it's possible to use that
URI as the name of the asset.

Reference: https://avocado-framework.readthedocs.io/en/103.0/api/utils/avocado.utils.html#avocado.utils.asset.Asset
Reference: https://avocado-framework.readthedocs.io/en/103.0/api/test/avocado.html#avocado.Test.fetch_asset

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/kvm_xen_guest.py  | 2 +-
 tests/avocado/netdev-ethtool.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index f8cb458d5d..b6ee1ff752 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -40,7 +40,7 @@ def get_asset(self, name, sha1):
         url = base_url + name
         # use explicit name rather than failing to neatly parse the
         # URL into a unique one
-        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
+        return self.fetch_asset(name=url, asset_hash=sha1)
 
     def common_vm_setup(self):
         # We also catch lack of KVM_XEN support if we fail to launch
diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
index 5f33288f81..7345ded28c 100644
--- a/tests/avocado/netdev-ethtool.py
+++ b/tests/avocado/netdev-ethtool.py
@@ -27,7 +27,7 @@ def get_asset(self, name, sha1):
         url = base_url + name
         # use explicit name rather than failing to neatly parse the
         # URL into a unique one
-        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
+        return self.fetch_asset(name=url, asset_hash=sha1)
 
     def common_test_code(self, netdev, extra_args=None):
 
-- 
2.45.2
