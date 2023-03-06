Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4393259ejc;
        Mon, 6 Mar 2023 00:47:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+QokZ4OW1YiiSHETCTlpe/0fBVsGDFX+cTv+N98Vh6cTS/puumkiF+js1AFMPmgwR5mdIy
X-Received: by 2002:aa7:cb4c:0:b0:4ac:dac1:3f95 with SMTP id w12-20020aa7cb4c000000b004acdac13f95mr8953516edt.1.1678092432806;
        Mon, 06 Mar 2023 00:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092432; cv=none;
        d=google.com; s=arc-20160816;
        b=Uaoh9mhS35ygoBHZJNjx35MwMxywmjvX2VLbTXfk8jcgXxxmFyQbL7mgAffHox7R5W
         Cd8ctxruNQLe4mqlvBrBRjefC2zymehnHlOljFdd7IgiZ2V1CVevrqeKuYRbv3zzQyYg
         lVpm+nr9mQeibohBAc6U57X2+Q6xBHGyOgAiORCIS6/9/3EkKHFf7Ioxmmg/T1olq0Xr
         dmqM9DtfPTk3ElZ92LGmun8EO7RKGMju2OZEIwo3Bo1qbf48cYXuRDpXzS9RkViOeGjS
         nzyTnJhu57tFJTFx6id7eom0UvOe69AhRr4Uu5s2Ki2UucozOOvDPIMv6tFIKKVDi5A4
         7qHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=37MyqIGrJ8NDqQYDY+IFgkqLJhkh+Oz/+/sGdhCxVu4=;
        b=tk6hIN1bePjdF5Z3T2ZxpmIss6lCW+Hfah740CL3iJ9+cO5NkZNivlClOr+0tzQ0r1
         PGbif2un/0/ozfWwdnA80D6X6ZjYLP26afZGKs6dipzy4RVc013nNbGOrkG3/PE4GrSQ
         rZOKj04Ot7+LLiwyMeWnl70GrdGDEMXB/VKrseN2RJBxb4eyMbmGgQeCilGdaR2Zlyxh
         L8VTHjtZEKMF9Jb2lnKUl9u6OP36O2zDLVpJMv1BSG18rS2f0kh3L2z/orwRq+eQ7dCQ
         LkEuQ+Rae+dNNyWLMvWNQLS+bRA6C8vVAkceyDSwf5fL9zeIor0AWF8o6hdaFRTgvWrk
         q/nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d93zdGY+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f6-20020a056402160600b004ad0993e54esi6033279edv.487.2023.03.06.00.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d93zdGY+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37MyqIGrJ8NDqQYDY+IFgkqLJhkh+Oz/+/sGdhCxVu4=;
	b=d93zdGY+sC/dp6PQ7r4RRuswWzSmxDJYAbbV1op3/OuLn4cXrFdWqrCdf8h7zeWpA2xdPb
	Z5vDvXkamjiToVj1vzHZ4npFlx+spxnJO/JNuqiX4JuQHQF0SL6pJZ6UDkzB9Gd6MFcNNz
	lOEfw9nLUHg67R+kM+/+LzEni1fshAA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-NkXWXKrvNS6cNOE-ISoWlA-1; Mon, 06 Mar 2023 03:47:08 -0500
X-MC-Unique: NkXWXKrvNS6cNOE-ISoWlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 027C487A391;
	Mon,  6 Mar 2023 08:47:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC35A175AD;
	Mon,  6 Mar 2023 08:47:05 +0000 (UTC)
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
Subject: [PATCH v4 2/5] docs/about/deprecated: Deprecate the qemu-system-i386 binary
Date: Mon,  6 Mar 2023 09:46:55 +0100
Message-Id: <20230306084658.29709-3-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: +UcfU+EFDrOH

Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
binary is a proper superset of the qemu-system-i386 binary. With the
32-bit host support being deprecated, it is now also possible to
deprecate the qemu-system-i386 binary.

With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d6..c4fcc6b33c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
 ``--enable-gcov`` build option remains for analysis test case
 coverage.
 
+``qemu-system-i386`` binary (since 8.0)
+'''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-system-i386`` binary was mainly useful for running with KVM
+on 32-bit x86 hosts, but most Linux distributions already removed their
+support for 32-bit x86 kernels, so hardly anybody still needs this. The
+``qemu-system-x86_64`` binary is a proper superset and can be used to
+run 32-bit guests by selecting a 32-bit CPU model, including KVM support
+on x86_64 hosts. Thus users are recommended to reconfigure their systems
+to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
+environment should be enforced, you can switch off the "long mode" CPU
+flag, e.g. with ``-cpu max,lm=off``.
+
+
 System emulator command line arguments
 --------------------------------------
 
-- 
2.31.1
