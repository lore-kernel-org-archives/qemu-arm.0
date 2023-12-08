Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2537221ejb;
        Fri, 8 Dec 2023 11:10:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8jinjs3eU2gxBEgCxN1QO69iFbIeDQQzH4601qwnXrLT/z1ROXJFzkOF6tsUoUYyFu26e
X-Received: by 2002:a05:620a:66b:b0:77d:c863:b991 with SMTP id a11-20020a05620a066b00b0077dc863b991mr559066qkh.20.1702062602466;
        Fri, 08 Dec 2023 11:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062602; cv=none;
        d=google.com; s=arc-20160816;
        b=OGtFYl0ncn6gcYb5UYPJgR72ael8AEmwZk7fLxvjZpD0hV5GgWUF+fbnSUtuWk7E1p
         evHw/9Q0TBu8Z70tkREi/p6mLHhTc7zjIY5HItMtEa35ohsQgVDto5jnq9Wo96yqsb30
         jLNn0NkXufX1a/F7Z/bOgMl5FuSApIYJkmqIeA2kYMJmnacS1sXjKhyznxLcIqIJPTmY
         NxeXU1bgyrEgxIrTwHrxunzjqLzYGrMp974l0c+v4Jb1wljBoGSvr9ZK6yh7ai6fJ6tM
         6aPw87soHz8GzfVfigaNNoGjTjiGNwrAw/22/uIba1SEOWhC3mdZemPYAdZn4jFkguw/
         kuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2/ZJBxQx+a/oBJOsQBV1mcDu69d7gKxirFUm2tSNNUI=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=jyzop6DefxyHiBEW9Qv3wQbKLesuSKrcNoqPcgIfp9aXGEXUQpeoS+fhI93yDhIAnh
         qpAqi9HwScmHHyMX4Labhi+xe7dKkIeRoe0y0pPgyxCyEwgTCAhUSIF6RARNdg4fH+dm
         +RV1vwZizpgKs8kefqDt7Tu3yNByDEFIrIn/4I16mh9J6g2uqKU77q0kjNb7x80l1WEs
         Bfuka6+lm7ECOlJ0ZR+9+ppX/eCdaSrOfyJpy8VBL6gNqJ1JBtWOOJJE8dxOzikXQBQ0
         Fj2mLki5CO9IBhyeRH1jdAVZnrnT+aJ4o3qzBNQbks9N64AqoaoyLE/lyTWIq4ZvL7Lu
         EXSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M0+dRoyP;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cx22-20020a05620a51d600b0077d56d1151dsi2512564qkb.580.2023.12.08.11.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:10:02 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M0+dRoyP;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/ZJBxQx+a/oBJOsQBV1mcDu69d7gKxirFUm2tSNNUI=;
	b=M0+dRoyPBLX43IlqiA8kTyioO2W0yIxiFiYX/3lZCYQuRR7MbJCWgXZdq9gzHwfypmzndp
	57cRq1DR4awek6+1vmQq9O18eXKQk9XVp31kP+TQdPqAmCTB47olGP7c8h3Dy38wkGlGFy
	eZd5gTli9XAew/pSJ/q3Y4wj1VoJU9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302--3UFl49BNJGS3COW1tbAWg-1; Fri, 08 Dec 2023 14:09:55 -0500
X-MC-Unique: -3UFl49BNJGS3COW1tbAWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68F6F85A589;
	Fri,  8 Dec 2023 19:09:54 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63036112131D;
	Fri,  8 Dec 2023 19:09:51 +0000 (UTC)
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
Subject: [PATCH 10/10] tests/avocado/boot_xen.py: use class attribute
Date: Fri,  8 Dec 2023 14:09:11 -0500
Message-ID: <20231208190911.102879-11-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: G03+pRFzCvTN

Rather than defining a single use variable, let's just use the class
attribute directly.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_xen.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index f4b63c1ef2..f29bc58b9e 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -50,11 +50,10 @@ def launch_xen(self, xen_path):
 
         self.vm.set_console()
 
-        xen_command_line = self.XEN_COMMON_COMMAND_LINE
         self.vm.add_args('-machine', 'virtualization=on',
                          '-m', '768',
                          '-kernel', xen_path,
-                         '-append', xen_command_line,
+                         '-append', self.XEN_COMMON_COMMAND_LINE,
                          '-device',
                          'guest-loader,addr=0x47000000,kernel=%s,bootargs=console=hvc0'
                          % (kernel_path))
-- 
2.43.0
