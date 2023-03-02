Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409231ejc;
        Thu, 2 Mar 2023 08:31:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8ULgmT8KLoqmoYqoUW3Hy/r683+t9R8a7PT14NtWO5vI7xGckRUEI+Kpw1ZVjSp3O5Kg3n
X-Received: by 2002:aa7:d6cf:0:b0:4af:593d:9ce5 with SMTP id x15-20020aa7d6cf000000b004af593d9ce5mr11495197edr.16.1677774673559;
        Thu, 02 Mar 2023 08:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774673; cv=none;
        d=google.com; s=arc-20160816;
        b=nGZe03uNWLwKuMUjYU/hNGG2jE2dTJZqRl6opqFqJgr7LdT4RhvZM5JmlkirT0hhp8
         WGEnlBu6ZIam6uGikB8MSqg1EyO3MWbhdEZD2nDdBxR8UGjPGDQWBawMo+aQt+9Ga1iK
         hcXsLLYRD9EDlp3KJfaVtzd6G4jqdx7/4HHJTjhIG1IsCdeewys/hXRA1MXLB7Jc33gY
         RooAM6x3ivYOUx4RmlUfmBF4uybYbnuBTqSid+hKOLx9zKYlFffnnTwgH64sqbfz1M4N
         ZOJ3DMhPdKhWvnp3DrUFNKbEJfTUwl+ylCI9XsD9oH/s4a5vIN1YwSIm8hhlNu4Hd7hF
         jiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ZDJm0qbzU2JdESu0wAQDuLmy0wi+765V7K8ePbWUcC0=;
        b=dtIOBe3QvejGvcajsFAi8z3PP8rOUSsrs3BIpzG4kEDVY1IqsxCECGrT5rAY9kP3vb
         z1SSvmCtgKGW5EXhh43Ry5R51XVJVc7iP9RTdW6fAQnpIDpOWziHt5vlI6JLR170ku77
         wkp7z8aGa3zLzVRSdWVOfu9qFs7dIYfTmouX1d2idlv+bZueSA31VNeUvyRkhvSrTIPZ
         ETE/XSM7Zdgp7Xjnv+Hc4r16xRDAhK3N4Gb1kg1yOFYcO1l/oPFrkEPc3fAcyMniow/v
         +rm4aUXRg7v3vgzfrudo24N44cRrNa7FBiJXqz341q9gSRRuOq59fAHeqtaIaPARDeUv
         4T4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KELoklWd;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b13-20020aa7d48d000000b004af67b75fe7si71605edr.453.2023.03.02.08.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 08:31:13 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KELoklWd;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZDJm0qbzU2JdESu0wAQDuLmy0wi+765V7K8ePbWUcC0=;
	b=KELoklWdvJV31z3aa66Ve11RVWES2tCTfpF73UpVURx/6oSgMjjpJKjEMAZR9+4rxMmyDB
	/MVfhKzqy3fnRSUTDpn9C3gVz2LEGg7XwZs/eTAt9+5vCi8nikeI6tQHI4B4JDBsQ3I/OS
	kw2DwjIQnxWhb8OopqjpnYarUDT6wTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-FfzftseYMeyd-EeORqC0WQ-1; Thu, 02 Mar 2023 11:31:11 -0500
X-MC-Unique: FfzftseYMeyd-EeORqC0WQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C87A18E0044;
	Thu,  2 Mar 2023 16:31:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31BB74010E86;
	Thu,  2 Mar 2023 16:31:08 +0000 (UTC)
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
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
Date: Thu,  2 Mar 2023 17:31:00 +0100
Message-Id: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: leZAPnyfA5af

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit x86 host support and for system emulation on
32-bit arm hosts anymore, so it should be fine if we drop these host
environments soon (these are also the two architectures that contribute
the most to the long test times in our CI, so we would benefit a lot by
dropping those).

v2:
- Split binary and host deprecation into separate patches
- Added patches to immediately drop the jobs from the CI

Thomas Huth (6):
  docs/about/deprecated: Deprecate the qemu-system-i386 binary
  docs/about/deprecated: Deprecate 32-bit x86 hosts
  gitlab-ci.d/crossbuilds: Drop the i386 jobs
  docs/about/deprecated: Deprecate the qemu-system-arm binary
  docs/about/deprecated: Deprecate 32-bit arm hosts
  gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs

 docs/about/deprecated.rst    | 43 ++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 30 -------------------------
 2 files changed, 43 insertions(+), 30 deletions(-)

-- 
2.31.1
