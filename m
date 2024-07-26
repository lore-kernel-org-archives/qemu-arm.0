Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475033njb;
        Fri, 26 Jul 2024 06:45:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKzf1lfKUJxyOb2CedZiQ7nIEXW0sh2bo89uo9O7ZkVAIJdua7GxYX6u6x5T4nZ+owo6w1kZkSg12K+91bgE08K/yvUR3r
X-Google-Smtp-Source: AGHT+IFkdndrnY28784b37XjhdAm8NCWeHCodIPeFhqLDXNX/GrJ8QMgQU3w6kUKssf6LNGPwr0m
X-Received: by 2002:a05:6102:1514:b0:492:97c1:a78a with SMTP id ada2fe7eead31-493d643cfc9mr5292344137.13.1722001524673;
        Fri, 26 Jul 2024 06:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001524; cv=none;
        d=google.com; s=arc-20160816;
        b=t8OglkBt15q303sotAzebPEvmXTyD68fYTJAKTjTvwLyXvRVCY3nnPgIgrRkGqkF0a
         3Tf/EsqXnc5OgXEQ5j0MsseMdwonlQ7EKybgAr9fo9RFXRvY2G7tJsuJ/3ZVK+VQMh1Z
         oMNg9XG/mdWHPQlkZDZgZSojhgNZYiglDtvpAqdRMzwd8/a2BNtkvuO/qrTfZSlputOt
         BmEWhaqqOhJ4eZ2fi8i65w5QOFYFPIOdTPGijPmDkSnE9r0LGVfzwv81HEO0Q5lLwJ9q
         HNMfuq+Ywhj4IKNPcfm5pvZrOL2kgWwj2EHZ9OfKtI4c0Rq21u3oQxSrtlU6M7CtyY+Q
         8fUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1OvDLu3KIbWHiu6ZxO0CUx4o4QNDavrUPXIZjllUrVA=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=zTzGc/J0L0fgo3BiIUSf3j2Hp9T1AvOx3193Q8bnlAH1AROiGKtn9tZoz7+Nd3+PfO
         +m1GgJCBLFUkqffd9gdF5prAw2Vv8fBQCbCD1D1FePrEWc6Xvjj73vCXTRUcfbM2JMOu
         E16GTJ6wErhXjlwdnbAjhRE3W87CPHQGt+kWK2Q2w8J3b8NOGyqlWqJDIOaH5ioo9fp4
         ifDg5WmEPNfXi3NafI0OWR+kMK6Ke93GuICwd2zcCYfAg5TmIMDWXaHyxdr/jXhXQM6z
         QzFoEqqFRtcry1O6odJ+h2O7EXkerUZzgmTgXTtslxKQWOhpxNSDqjcwoCZ0Bb6rjV+H
         YiyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UobLGc2T;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-493d95fb8cesi912629137.7.2024.07.26.06.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UobLGc2T;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OvDLu3KIbWHiu6ZxO0CUx4o4QNDavrUPXIZjllUrVA=;
	b=UobLGc2TxBvedzGAP+ikondnEUDtaLFRCArDP2I91hkZUbN/B9yuZAy6d0AIsIZyiqi4Ja
	6ZXWgbbkB6e2ONVNv8iNzbB/2pbR9eBT9aKpFWiKuM8fZ1n7BOjNHi58MuHMQey2jlRWbC
	3bXHwVVfjiH4Qgb89du8i++Yj3gYkU0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-X4q3-WUWMgibfuwHxzfhaQ-1; Fri,
 26 Jul 2024 09:45:19 -0400
X-MC-Unique: X4q3-WUWMgibfuwHxzfhaQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 920EF1944AA6;
	Fri, 26 Jul 2024 13:45:16 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2BD61955D42;
	Fri, 26 Jul 2024 13:45:12 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Cleber Rosa <crosa@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 06/13] tests/avocado: use more distinct names for assets
Date: Fri, 26 Jul 2024 09:44:31 -0400
Message-ID: <20240726134438.14720-7-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: HDsFQ9LIKXKl

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
index f8cb458d5d..318fadebc3 100644
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
2.45.2
