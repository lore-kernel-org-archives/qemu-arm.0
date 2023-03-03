Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp884406ejc;
        Fri, 3 Mar 2023 02:15:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/T3fNwPGQzO6nYwaPILmzkqK2LRtHd4PqZ9hKcezNXqr6aiRRNoXfiimibQ9MFlmJz/Qs6
X-Received: by 2002:a05:622a:138f:b0:3b6:323d:bcac with SMTP id o15-20020a05622a138f00b003b6323dbcacmr1959392qtk.32.1677838502017;
        Fri, 03 Mar 2023 02:15:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838502; cv=none;
        d=google.com; s=arc-20160816;
        b=DIteuNS7KHB26jNFBP+WDRTMxE3/CekS1R8X7GHpz2d6spPHyvV2W9CDvgPSNbGd/N
         URvhyqVaRn69x5mnjPw7ERNkVvc4b/pRzybDy2XBGwOHHvsNUCNhqihSHlQ0UOviNkzc
         doEBaFIWfhrFuO+OcqRnFCZvcUKjuq6h3cvjWneKxFhOMWZNNrr53WIME+6HjBozQrWM
         PbCGixtpt9oxYffbcBDJgktqi90lNcwV0N+/7w0z1zXaLAx89UqfC8v27/fYa2Z1wB/y
         UohPahpQcwDlTT6nDamC+kKL3QuC3iv7N4mQjfLH2p6joNsFrjWnFkseH6191e0UOAWh
         HKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=TpIlf9psPSTZKBaw+RSYYsCEkerCEPwHUsx9lr/nHA8=;
        b=ev9MowX1IE0bVWRFGG3bBfSNw8kRD/aYht+jf/LBFgDdlqWx4o4beO6Bp+ie0b5pHL
         7OJZyPmmBxBPGfyvF3Hp37+/QcPCcjEh5sJBASmwtatblEU0vNpmbBDTgLaur0HRXqgZ
         HiUgBP0C+VCi3ckysnpiEFq6i/pt7ypO2IlxFvGTM5/rwQKCJQJ7wlAbKG9CStwT7/r7
         3BPKCE1mjIfGC05qfcHhAv7vqMu/di889M5atmMcO8RchhlHZRcYK6WK+wKRR9ohvJEK
         aV95tkoxBRJBHK/TJYJ/nEswCtPL+LyURQ+qjoU8b/9Suz8rB218wnj6tAhUclNDdi6y
         c8Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hCV7oNSm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d13-20020a05622a05cd00b003bcd3532491si1557750qtb.304.2023.03.03.02.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 02:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hCV7oNSm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TpIlf9psPSTZKBaw+RSYYsCEkerCEPwHUsx9lr/nHA8=;
	b=hCV7oNSmLc+VC7Qfysn6/EWrFpHsO+HFe6AayZ+T8fp9fqghhFcJFjTpfhf3X5wpSbjsQY
	0uy+vXeUOZBcu1MycPa+saLGW8ncHbv2XNR+N2XH6UKU9VfDwUodc9DVc4DV5ZgersBzIh
	LM7Pucqn6x++ll/zo2o6yXLp3T7AQSA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-AerQz7NuMbiiz8u1ijZjjQ-1; Fri, 03 Mar 2023 05:14:57 -0500
X-MC-Unique: AerQz7NuMbiiz8u1ijZjjQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E93A5802C18;
	Fri,  3 Mar 2023 10:14:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84169492C14;
	Fri,  3 Mar 2023 10:14:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 0/6] Deprecate support for 32-bit x86 and arm hosts
Date: Fri,  3 Mar 2023 11:14:46 +0100
Message-Id: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: yV6BeE2q7yq/

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now (32-bit arm for system emulation, and 32-bit x86
completely).

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit x86 host support and for system emulation on
32-bit arm hosts anymore, so it should be fine if we drop these host
environments soon (these are also the two architectures that contribute
the most to the long test times in our CI, so we would benefit a lot by
dropping those).

v3:
- Update some commit descriptions according to the suggestions in v2
- Added the Reviewed-bys from v2

v2:
- Split binary and host deprecation into separate patches
- Added patches to immediately drop the jobs from the CI

Thomas Huth (6):
  docs/about/deprecated: Deprecate 32-bit x86 hosts
  docs/about/deprecated: Deprecate the qemu-system-i386 binary
  gitlab-ci.d/crossbuilds: Drop the i386 jobs
  docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
  docs/about/deprecated: Deprecate the qemu-system-arm binary
  gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs

 docs/about/deprecated.rst    | 43 ++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 34 ----------------------------
 2 files changed, 43 insertions(+), 34 deletions(-)

-- 
2.31.1
