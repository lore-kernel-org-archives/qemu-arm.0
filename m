Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787839ejc;
        Wed, 18 Jan 2023 11:38:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs6B49G+Cp8PWNhHy+O0aFxsRhua7LHxbUGTrKOHeNm0wUcegleVTW439u/IXS+w4aoN5Oq
X-Received: by 2002:adf:f0c1:0:b0:2bc:67d:c018 with SMTP id x1-20020adff0c1000000b002bc067dc018mr7419551wro.48.1674070705152;
        Wed, 18 Jan 2023 11:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070705; cv=none;
        d=google.com; s=arc-20160816;
        b=BYNcALUE8GiU0kCpYGjChm+CqMYKWgvNffL1k9Lg+3eFkUWikjRDNCRsmxlLIZvhX8
         DyNE16XhuaWncxj19p+9MXXhN5o1y5ChIOqY/YiB35QVz8erWmLXQrHH1eoxnL/SgXNR
         dcqjX1aIHv7GkVDzDoqd/8301626GTcg3LINDs8ZoHgDWaIh1lsGQmw2BlkJBfZHt2E0
         WeFo0yzTE3fD3jg8IRRo+tiX3bEy7MX1L6pXL0htzKDKoUyD0YjIl8StAc9q/DXH/Jsb
         +/nfjTolfKmk6CS11nRCny2UKtkW8sVNMKmuThVaQYz0fw53iS10SrzSM5jqdbGjRIKL
         mTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=h83+ckeZU8d/nlLFTyp/l4xVD91xEWYC1+aMA1rItec=;
        b=TCeU7zCdV4j+6FwM+CfeGJPVcss8uiB0l87ARbTnteW83OhDav2LSfO33uckAP0rOC
         z/mlYT0stuhro4DXe+njo3lvbgPDLEVWaIEWOb9ZS3z5m8MnY3MfclNvqPibA6JHznoh
         5c/F2AsHvUE7qsFWgmKhmaCim7Q1/Fp50yluJh4saiGj6ivDJrgZ939moLIS64fwqDMZ
         sGrTOh+WLdtAhDSLeMg+YucQB388/t7f7rV/XyuV8US5rI2MJgaHNoQG+cRiz2e0P8J8
         5+PFdc3ldDvikqqDlLZts9KOuc1g2C9zgNNrK+44EPPCxT3XBt93rc8yNJ3kjV5cjcfC
         gIfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ubbH+cBg;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id l6-20020a05600002a600b0028f29b31a73si16153415wry.452.2023.01.18.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ubbH+cBg;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C1A355BED3;
	Wed, 18 Jan 2023 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h83+ckeZU8d/nlLFTyp/l4xVD91xEWYC1+aMA1rItec=;
	b=ubbH+cBgZO+c7+vZWC+ovR9A1aLCrg/iEaySAzLSWwzR2jOeJGGh/8UNziVrSK340IE2sh
	XOdG54SyY+GSkpIfdlIqvjbDwucIOcLzU6HQPvSYLgqAw+nBZHQT/mSA8tCNOPfgPsuXn2
	z9dZrBjRJL9rUthBP4OIlYJa77fCXQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h83+ckeZU8d/nlLFTyp/l4xVD91xEWYC1+aMA1rItec=;
	b=OJusFQCDnh2mSD0XNxQVV9ILJiUUYZvfCwGpHjGDSLfi6YJM7DHqWIiYhh9sqtebYl6Edd
	dzbFZjjgM0+0RzAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BBBF139D2;
	Wed, 18 Jan 2023 19:38:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YA0nEa1KyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 19/20] tests/avocado: Skip tests that require a missing accelerator
Date: Wed, 18 Jan 2023 16:35:17 -0300
Message-Id: <20230118193518.26433-20-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u5MyPye+uc4D

If a test was tagged with the "accel" tag and the specified
accelerator it not present in the qemu binary, cancel the test.

We can now write tests without explicit calls to require_accelerator,
just the tag is enough.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..ed2809210b 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -274,6 +274,10 @@ def setUp(self):
 
         super().setUp('qemu-system-')
 
+        accel_required = self._get_unique_tag_val('accel')
+        if accel_required:
+            self.require_accelerator(accel_required)
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
-- 
2.35.3
