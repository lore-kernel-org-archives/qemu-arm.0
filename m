Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4393200ejc;
        Mon, 6 Mar 2023 00:47:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/s1iqMoiqxTrJoYlslB+M52JaXtVs+tk/yxD7gZZhnV4tj/2n351Suov6pOti0gYTUostU
X-Received: by 2002:a05:6214:cc3:b0:53b:d514:724 with SMTP id 3-20020a0562140cc300b0053bd5140724mr19444278qvx.26.1678092426509;
        Mon, 06 Mar 2023 00:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092426; cv=none;
        d=google.com; s=arc-20160816;
        b=Oo/U4FACTqBSXFRqUfJcGJ7cGTAV0/8jXpXigYpInB4a45erANUcRXMf7r4T3DaQaF
         Py4T0gfC+Up58yn4LhDIr965kFD/6BK5C8eSi+MU7TOx4yO4gYuARhiFRrKdYZeDLM2O
         MWyCJvNCTkygkFK1trQP0CQ/Xe1QBCHZsOCNHLzI54ac/WZ1+qaq/HFuF39cUomslSfh
         YjEn3PF4VJQ41Jyts72/PpeWg1MbYyPbyjERBwe03JIUa485wTSF0D484O+CLDJMg7tA
         YSNcZDih59f6C91eNBgXggfoquHIqWcq4eY/n6Tvq6oPzqU74Llzpkv41sVLch3/moJe
         WgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=tCsKG0wad2kO1KKnqRl1WoTNl9pW94eSqEiurkcIzhg=;
        b=TQYI/MmoNs2BsgR7JOzRZB8nQQlmjhmi1ulzjQuV0NFDzVzydrwegD/7Vdx4bRhslu
         WewUv5+6HMpPec6FFX+2S7ZQeC9+VLqPBxNLjywN00wVbQFRBwppHQz3fY42Kwa4qPCU
         E+KZAnHD9ghuNmPcnqQd8+DGXBbXGYNAaRz30slJm+cABAnZZ6/vwTiOP1iQmRXvM3Vi
         2qYD9wvwcpr8tEfvgbmJjs9nMOPAAOUwzlIXmBjqJj3fUnO8VaIyKNrjlGqa4EXK8xQN
         B1Fiq3OrvdT5LjE/a4V43f+XRPxfXh74CPMuCjzoSAiCoVKqIwrEYIX4ZmXR7WVwXoJx
         q6tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QgpU5F9D;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n7-20020a0ce547000000b0056ea777446esi6556495qvm.456.2023.03.06.00.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 00:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QgpU5F9D;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tCsKG0wad2kO1KKnqRl1WoTNl9pW94eSqEiurkcIzhg=;
	b=QgpU5F9DaGKHKd5MtvfxZ+SKkT/2A33xc3W+i6HIVbHmpxxK2xXR3PUFxAto0sbIwVfN6B
	idTNow7amTiIP/Ga2vCH2P346/sAT6FuSzvIXK+fEiEHq5ue2X2xRJHHhLcOTSNWPCIrrL
	j6V2VQ8tJIHQimoHgYMahudmayWyVqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-iFMUPCcmN3aMIcATWsDMhw-1; Mon, 06 Mar 2023 03:47:03 -0500
X-MC-Unique: iFMUPCcmN3aMIcATWsDMhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D705D85C6F4;
	Mon,  6 Mar 2023 08:47:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 664C3175AD;
	Mon,  6 Mar 2023 08:47:00 +0000 (UTC)
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
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 0/5] Deprecate system emulation support for 32-bit x86 and arm hosts
Date: Mon,  6 Mar 2023 09:46:53 +0100
Message-Id: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: zSRHlr5ugHnC

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. Hardly anybody uses
QEMU system emulation on 32-bit x86 and arm hosts anymore, so it's
time to deprecate these environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for system emulation on 32-bit x86 host and 32-bit arm
hosts anymore, so it should be fine if we drop these host environments
soon (these are also the two architectures that contribute the most to
the long test times in our CI, so we would benefit a lot by dropping
those).

v4:
- Drop the patch that deprecated qemu-system-arm since it still
  might be required to enforce 32-bit guests with TCG
- Only deprecate system emulation on 32-bit x86 hosts since user-mode
  emulation might still be useful in certain scenarios
- Add a sentence how to enforce 32-bit mode with qemu-system-x86_64

v3:
- Update some commit descriptions according to the suggestions in v2
- Added the Reviewed-bys from v2

v2:
- Split binary and host deprecation into separate patches
- Added patches to immediately drop the jobs from the CI

Thomas Huth (5):
  docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation
  docs/about/deprecated: Deprecate the qemu-system-i386 binary
  gitlab-ci.d/crossbuilds: Drop the i386 system emulation job
  docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
  gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs

 docs/about/deprecated.rst    | 34 ++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 24 ------------------------
 2 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.31.1
