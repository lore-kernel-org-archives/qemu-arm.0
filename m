Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2537036ejb;
        Fri, 8 Dec 2023 11:09:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUPahcIDr4jidx+tLzVTtyU2G4aA4ktEynLi/OYjovC8C8NVTD8lmihRbo3aVZ5/TkaTqv
X-Received: by 2002:a05:620a:1116:b0:77f:eaf:33fc with SMTP id o22-20020a05620a111600b0077f0eaf33fcmr583563qkk.110.1702062584697;
        Fri, 08 Dec 2023 11:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062584; cv=none;
        d=google.com; s=arc-20160816;
        b=Ez344Jli83QVhmZusCpsbsltgcgidUIu1xboc9ORlExXEV3W5dHRFFdr33XL8tbizq
         CA18eJDgMR6U2d9oLKaaf/zRUvmXBUJHCu0bySCUK3rGP0XEBsGUVpBOrjZR2g89XIHY
         BEuRyh8M0gVBD8Jtif6WtklfqargkiqdW5HHgpJ6M23C5OCklThMNryXOBDgxMIRV4Lc
         bLPMwFf5bL5XwWZMHWN9aLWEZAHCCZLTFgXisS6j8uuwgUf4vwQhjXZD0iSOOXOqd4jU
         c07A0f4I4am2W/ttyivCEONEPEnQc1jmvmF6wIEWU3Xh+ttpgea8ShwEZ905Fe+y/uho
         seHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dQfV6LviLmnLOWvIHHdxc9m6pS5dYwlHHOW0whSlNbs=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=GkZk3cPjnVIludUkRYkow/a5Ao84H+VFmU5XOYS0UHNh24KTkRPW0Vccd6hyfs3xrm
         GqmYmk+ZPInuEJ1YXs3Cxpm8pOy9gLSLGofTVqElx8YDQ3PA0u214lIC/5wGE6OFNGNw
         AttcGqsu327cv3JKghfYDXby4Xljx3zDSAVMV8axrySAehWghGcgnciCeuqrzYcC0DT7
         s+tdOlVMnA3c22bZOMnOljOAGNYcEcy6nulDdgCr6IzAT7Zpv3rF2Mg7XJHsk7nxazSf
         HugBaKB9/XAiRIf3mL236kUolejAyIjkXIihskDbQGWDxOKA/kGuxGusEwfs4Qm2v11U
         cHoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=flvVk535;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p10-20020a05620a22aa00b0077f03b587d5si2444967qkh.533.2023.12.08.11.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:44 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=flvVk535;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQfV6LviLmnLOWvIHHdxc9m6pS5dYwlHHOW0whSlNbs=;
	b=flvVk535MSUU9ZACZlCOx53yLhfdRP+/CA3n/iRWemTf6quc1SVo8hNsMercPNPTWTNxan
	Wa/qNahvLiY6ckQxACgw0t9m9osgqg8cpgZYYN70NyIOhsILTNhX1VF33nqUSXpL2E7knM
	pDC2lFUabGQqXlA2b3+36TPKyUH+sLU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-k844ebb0OB23C_5-AhuuGw-1; Fri,
 08 Dec 2023 14:09:38 -0500
X-MC-Unique: k844ebb0OB23C_5-AhuuGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF95E2823F61;
	Fri,  8 Dec 2023 19:09:37 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9176112131D;
	Fri,  8 Dec 2023 19:09:34 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 05/10] tests/avocado: use more distinct names for assets
Date: Fri,  8 Dec 2023 14:09:06 -0500
Message-ID: <20231208190911.102879-6-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: iabVu7KjCBPe

Avocado's asset system will deposit files in a cache organized either
by their original location (the URI) or by their names.  Because the
cache (and the "by_name" sub directory) is common across tests, it's a
good idea to make these names as distinct as possible.

This avoid name clashes, which makes future Avocado runs to attempt to
redownload the assets with the same name, but from the different
locations they actually are from.  This causes cache misses, extra
downloads, and possibly canceled tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/kvm_xen_guest.py  | 3 ++-
 tests/avocado/netdev-ethtool.py | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index 5391283113..ec4052a1fe 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -40,7 +40,8 @@ def get_asset(self, name, sha1):
         url = base_url + name
         # use explicit name rather than failing to neatly parse the
         # URL into a unique one
-        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
+        return self.fetch_asset(name=f"qemu-kvm-xen-guest-{name}",
+                                locations=(url), asset_hash=sha1)
 
     def common_vm_setup(self):
         # We also catch lack of KVM_XEN support if we fail to launch
diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
index 5f33288f81..462cf8de7d 100644
--- a/tests/avocado/netdev-ethtool.py
+++ b/tests/avocado/netdev-ethtool.py
@@ -27,7 +27,8 @@ def get_asset(self, name, sha1):
         url = base_url + name
         # use explicit name rather than failing to neatly parse the
         # URL into a unique one
-        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
+        return self.fetch_asset(name=f"qemu-netdev-ethtool-{name}",
+                                locations=(url), asset_hash=sha1)
 
     def common_test_code(self, netdev, extra_args=None):
 
-- 
2.43.0
