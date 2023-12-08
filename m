Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2536893ejb;
        Fri, 8 Dec 2023 11:09:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRJOz4Hi5mGNnid9ynBUjbQcHvQds7uAFstMAWp7UhOuuP+n8MiV/NVH45YYcbUktfssKA
X-Received: by 2002:a05:6870:6ec7:b0:1fb:75b:2ba4 with SMTP id qv7-20020a0568706ec700b001fb075b2ba4mr619280oab.96.1702062571669;
        Fri, 08 Dec 2023 11:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062571; cv=none;
        d=google.com; s=arc-20160816;
        b=q5CMqEuPzLecDqQd4hYYq5Yqnv9Tb3nr3a1mDLLiWmqNJ3oZyWwQLhfs+dGBK/tagJ
         32OqY1CFaW/SfCiLQ1e8+onoXrbEzo3f5VtGPQjq/6F2uKBa/GMK1g8m75kLEavDlK+b
         2jew9YsbApWtex644GzZI2dQXhOvi2tM8Fgka0GkZzp8kiK11Rnb7LQB09cLJqAxXMHq
         /LF94ISVu9451jj4MLoxJTRIanVt5sEqvH08CQMNa1KiVO/F29SfAj/414L2kXwXSX1v
         dGq2+/KtLX2Iqzjy6QjwJXxrrTu8NVtjsqfxd3VtrRHxxyJqB9vsLECrL2+P/N4hN3f8
         qZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=adJH7rWy3zq1h4h/lqGpwZ7Vbw0iyk9j/MLUkacF4c0=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=xJHMemYZv3buAHLFyn+APTL5zg6mBL1qS9gTvSAKfIgEdsh6Ga4UoWS27/ROHjA2M4
         0KNYqSgbWa8B/iWSyxUgdZtnnH6WdedkTzFiyVEYTorfq6+pzplH3Oet8wyn6CCPVVp/
         OXJT3OaqZi4XJHl44ktgILX3SguBUvn3Rh6InJ3VJEv8LKOF1JFGKNJYDlV7MdaIvkwq
         K/ay6UAyGcE88EvszaoLbjfmW3nzEUPsj54WqkDMPHtNLGJZIcN9JjG/LVX4eJU3S+d4
         64WcGvYq4e5+cRAwkxdrg9QXG+7uEOiR1xUh1SSBz9u2Ud2s/P8p1MFsNiPSOAXetRTA
         jS9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JvRE5+99;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a2-20020ab07a42000000b007c5f03b28absi652520uat.215.2023.12.08.11.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:31 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JvRE5+99;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=adJH7rWy3zq1h4h/lqGpwZ7Vbw0iyk9j/MLUkacF4c0=;
	b=JvRE5+99d7U0dNBUlfAxLEOjoT87OgVsS+i2hHUcH4qrKfQj+lFjX3Pk7wJvoNupRXByp5
	leRS9Wz4SS4qwg+Haxv2QO1RYzTgrXCz6j3UYLeM3SzkMoh7uYjUCxGaFG0+CMCT2vB4fi
	J95PrHt/78p9COuuT/nyazX7UAicTpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-heyNTEq2N5q3V0XwSXHsjw-1; Fri, 08 Dec 2023 14:09:24 -0500
X-MC-Unique: heyNTEq2N5q3V0XwSXHsjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB81101A52A;
	Fri,  8 Dec 2023 19:09:21 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D25112131D;
	Fri,  8 Dec 2023 19:09:17 +0000 (UTC)
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
Subject: [PATCH 00/10] for-8.3 tests/avocado: prep for Avocado 103.0 LTS
Date: Fri,  8 Dec 2023 14:09:01 -0500
Message-ID: <20231208190911.102879-1-crosa@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: hr+JHrYgDOEC

This is a collection of improvements to a number of Avocado based
tests, but also fixes that will allow them to behave properly under
Avocado's upcoming new Long Term Stability release (LTS) version
103.0.

A pipeline with (pretty much) these changes can be seen at:
  - https://gitlab.com/cleber.gnu/qemu/-/pipelines/1096168899

While a pipeline with the Avocado version bump (using a preview of the
103.0 release) can be seen at:
  - https://gitlab.com/cleber.gnu/qemu/-/pipelines/1099488480

Once Avocado officially releases 103.0 LTS, which is expected to take
no longer than 2 weeks (after a huge development window), the actual
version bump will be posted, along with more profound changes to the
tests to leverage the new features.

Cleber Rosa (10):
  tests/avocado: mips: fallback to HTTP given certificate expiration
  tests/avocado: mips: add hint for fetchasset plugin
  tests/avocado/intel_iommu.py: increase timeout
  tests/avocado: machine aarch64: standardize location and RO/RW access
  tests/avocado: use more distinct names for assets
  tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
  testa/avocado: test_arm_emcraft_sf2: handle RW requirements for asset
  tests/avocado/boot_xen.py: merge base classes
  tests/avocado/boot_xen.py: unify tags
  tests/avocado/boot_xen.py: use class attribute

 tests/avocado/boot_linux_console.py      | 27 +++++++++++++++----
 tests/avocado/boot_xen.py                | 34 +++++-------------------
 tests/avocado/intel_iommu.py             |  2 ++
 tests/avocado/kvm_xen_guest.py           | 30 ++++++++++++++-------
 tests/avocado/machine_aarch64_sbsaref.py |  9 +++++--
 tests/avocado/machine_aarch64_virt.py    | 14 +++++-----
 tests/avocado/netdev-ethtool.py          |  3 ++-
 7 files changed, 67 insertions(+), 52 deletions(-)

-- 
2.43.0
