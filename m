Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5243679njc;
        Fri, 22 Nov 2024 01:03:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3naEnOi6otaiQQPNFibJj7r9tPkZ/SwDZuDpZHMzR2AnhnFX4JHzRPSHR22MqGKWZTiQFfGUMNR+1jQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFRU3Dl2ikAvSezK5O5y3VVEj2TL1VcdDUkQOXQK2xbsUN79LykLz2xbunMM3QfPsle9OyS
X-Received: by 2002:ac8:5815:0:b0:463:1677:c09 with SMTP id d75a77b69052e-4653d5cd228mr23564181cf.23.1732266222538;
        Fri, 22 Nov 2024 01:03:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732266222; cv=none;
        d=google.com; s=arc-20240605;
        b=fxdJcuVyDDmC90WYLAE7x0XuWrY+NdXCNFUvQcBP6M28v5XtZbvYzC5ILXzlGrj3in
         Pg3dFj7d1c4xdskbY8Yz1EfS7F1Hz5Cl0z8dLO4wWw+Wcoe33BnRZyLzOi/F3h8YXU/5
         dexbULOR69ijhaSDQIUCuxKo+La5+Cn9Ovcr+aHpis00JPWUtHZpxGL9yKaz7nndmnRd
         f+c/9M3LDTBCMXt+gCB7SkbhwFUFBjNxpEyuZ9oHhy4i0bqZzu7zs6lGFNKWF1WoZ9Hf
         ajiHn1s3AOb4pVpQvmFvlYzzJdNUkB7kq5hbdO/N4wqKuSRxMUjXGBfH8St8dzrOzISD
         nElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=A+G6/gqy8DWuTAk5KRmjphJ90Touva2ZbzvqQHdsOrE=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=XQiPd0DOoW/5qIbl7R62EkOOa53eP2fjzgM1ZltjjVeYrIdsdQeoKswfXbAeZKJAPY
         zaWiIdvI07qf3wREj/k3RMvw++vKpfRkpUlZySigjfMqQ97FTskFAcBZFEFkT3hL7Wqa
         uN2UJGmYmH2K5wgazhzYKDnZxAOvkcLlGGBvIR9BAkHmwjdtYXREnGzvBUB9I1+5ozp1
         Z+htIX3/LgOcJrPnI9uYOtwFoBKRh91YlRLJMz4CF7RY9LI9Vh9ScBDc6Zcrk5DF9MrB
         XVvQ2QCz0VLOEyhkln4nTZ1E6fQignu6dyOCjXMXgdTVxBTLI/4LX1OUPVN50p9CEj8w
         BC7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMWvlsA7;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c475c2csi18423451cf.217.2024.11.22.01.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:03:42 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMWvlsA7;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732266222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A+G6/gqy8DWuTAk5KRmjphJ90Touva2ZbzvqQHdsOrE=;
	b=FMWvlsA7WO0j+YHf9grkr3Y7YNpq0CcDbhQqJjBvPPkVPWBFcTnNyErkRKCku/76eZG6n3
	CUo3bi+I9gVZy2yuA1MbErJ7A7ujoooHJl7lj38eBmxJTIR8QWR+Ba465DcLjzA+aMIRi3
	QsSmIBwTP267T62xnAJqfB4GDDZtorg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-Pac_KCz6NnywxxWL8sDX7A-1; Fri,
 22 Nov 2024 04:03:38 -0500
X-MC-Unique: Pac_KCz6NnywxxWL8sDX7A-1
X-Mimecast-MFC-AGG-ID: Pac_KCz6NnywxxWL8sDX7A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3B3D195608B;
	Fri, 22 Nov 2024 09:03:35 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E42DE1955E99;
	Fri, 22 Nov 2024 09:03:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 0/3] tests/functional: Finish conversion of Aspeed tests
Date: Fri, 22 Nov 2024 10:03:19 +0100
Message-ID: <20241122090322.1934697-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: PCwECbPiqh39

Hello,

This series completes the conversion of the Aspeed tests to the new
functional framework and removes the workarounds for capturing the
console output.
  
Thanks,

C.

Changes in v3:

 - Required 'user' netdev in do_test_aarch64_aspeed_sdk_start() and
   do_test_arm_aspeed_sdk_start()
  
Changes in v3:

 - Rebased on :
   https://lore.kernel.org/all/20241121165806.476008-1-alex.bennee@linaro.org/
 - Added documentation on EXTRA_BOOTARGS removal
 - Used a "login:" string or the command prompt to wait for in all
   executed commands

Changes in v2:

 - Redirected all console output in console.log file
 - Added a "found" prefix when an expected string is captured
 - Used a user mode network backend in SDK tests
 - Changed the expected string to "login:" in buildroot tests
 
Cédric Le Goater (3):
  tests/functional: Convert Aspeed aarch64 SDK tests
  tests/functional: Convert Aspeed arm SDK tests
  tests/functional: Remove sleep workarounds from Aspeed tests

 tests/avocado/machine_aspeed.py         | 202 ------------------------
 tests/functional/meson.build            |   2 +
 tests/functional/test_aarch64_aspeed.py |  98 ++++++++++++
 tests/functional/test_arm_aspeed.py     |  84 ++++++++--
 4 files changed, 175 insertions(+), 211 deletions(-)
 delete mode 100644 tests/avocado/machine_aspeed.py
 create mode 100644 tests/functional/test_aarch64_aspeed.py

-- 
2.47.0
