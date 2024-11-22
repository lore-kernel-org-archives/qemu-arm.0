Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5204735njc;
        Thu, 21 Nov 2024 23:33:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVuRjlMl/7TZSknYgQeT39z9Np6bM7pw7usdm6tf5FkP7e4BzGNUQCmTBBSVQ23YLGkNlqTp/a4au9QuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOFlJrBLDio9B0e6iM2VXaXMtZpPf1E8kIW5qmGH9pIA+vS3qExnMHTuXDxGhgtLznj1dx
X-Received: by 2002:a05:622a:20e:b0:45f:788:b1ad with SMTP id d75a77b69052e-4653d5c32d3mr27192621cf.27.1732260809716;
        Thu, 21 Nov 2024 23:33:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732260809; cv=none;
        d=google.com; s=arc-20240605;
        b=MUx0RQQYHZ4J8ondn6600BRWfFV/y5FOtLMTGn01xJl+D9DRTyQBGP+CgLjG68JS9U
         /NqpbXK7azmOjQVm0v3aT2txd21runU1HxlyRFOK2ICwxxZa7QtBRxJLRwJekCa1e44y
         NyGSus03QgmsBzhtNqhUxjyb+WOULWA3ZyncENt1TACLf5ksph6cCZ7MB3sRFL+LVD8u
         XicfgmMIM60+gbYgfKPFQkqi6cbhCxZLijMrAfmWV8pJpcQEvBY07ztZN30GERYu2zP9
         iYRqklq3z4TJ9CtSbJtk4nhxgla1FQbsF2fdmHloqckmPs9PrXaVSBvBDHqf1RNYA3X7
         e/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MG1T2c7HErPqJnnYKB+lRnlI3FXUhtC+uZQyIF5JB2o=;
        fh=09DwpQbNoPR2GB8WyOTSHX+5iSoy0YN8vLTWXRZQNFk=;
        b=RuP82znFxgvjsCrulRKjG8ivZ3kGNHiPZE5t/D9EiT+N75VIjnDqsPbc/qw3BFf736
         F7uMPbMgqGnDeTVAT4Kt2FG+8h3d2Vke2UQnIFg1/zUmgGhyKS4ff+586ZWIlSMYVoZf
         8rSfjAjDS//ESD4ngHiX3TQvnh2Jxb//d55VNgimmEuunR33mlZWELech/BmEXC2z9EL
         gfIrwXgi/QNW/1PwDaazN3K0moDMaGEAqi8QyvrSgjgeEE7JiX0gPnOBCa3MUn3pBO5p
         2kt3gWBoLsSQy0os2UU3vTrB2HJ+0QfsE71mIDWstiUQ5JIIW2BlCdRZehlwz8FFBoZl
         Z3/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NTNJCuPy;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c4a3f99si16754361cf.560.2024.11.21.23.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 23:33:29 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NTNJCuPy;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732260809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MG1T2c7HErPqJnnYKB+lRnlI3FXUhtC+uZQyIF5JB2o=;
	b=NTNJCuPy2xfXZcXAspHOJTUvXzf6p6NCjWsZfr0x4Yj5f404B8OMOMnpxNPpfn0YRSBYyt
	ixevHHcfc0RgafAi5Zesnx+m5oQx6VzJgqzMavnNNm/u6ixjA4Wy3EZX3ogdyB6uSsgVYZ
	5dU1cyEc6CpHY5cmsRYgE0Q4EdVqrOE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-NTcG502cNoS5G87GCGiJ6A-1; Fri,
 22 Nov 2024 02:33:25 -0500
X-MC-Unique: NTcG502cNoS5G87GCGiJ6A-1
X-Mimecast-MFC-AGG-ID: NTcG502cNoS5G87GCGiJ6A
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C3FD19560B2;
	Fri, 22 Nov 2024 07:33:22 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E78B71955F40;
	Fri, 22 Nov 2024 07:33:10 +0000 (UTC)
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
Subject: [PATCH v3 0/3] tests/functional: Finish conversion of Aspeed tests
Date: Fri, 22 Nov 2024 08:33:06 +0100
Message-ID: <20241122073309.1897944-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: qixg2Ci8f/Nq

Hello,

This series completes the conversion of the Aspeed tests to the new
functional framework and removes the workarounds for capturing the
console output.
  
Thanks,

C.

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
 tests/functional/test_aarch64_aspeed.py |  97 ++++++++++++
 tests/functional/test_arm_aspeed.py     |  83 ++++++++--
 4 files changed, 173 insertions(+), 211 deletions(-)
 delete mode 100644 tests/avocado/machine_aspeed.py
 create mode 100644 tests/functional/test_aarch64_aspeed.py

-- 
2.47.0
