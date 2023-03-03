Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp884559ejc;
        Fri, 3 Mar 2023 02:15:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/Q6dwAFrcUDCl66dRw6fSybThzGjhK+2mZ9fSHnTjalyvspv97+/kNoC3jFeps9Y6mY8SH
X-Received: by 2002:ac8:4e4b:0:b0:3bf:c3e8:c19b with SMTP id e11-20020ac84e4b000000b003bfc3e8c19bmr2020622qtw.22.1677838511039;
        Fri, 03 Mar 2023 02:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838511; cv=none;
        d=google.com; s=arc-20160816;
        b=ig03NTOb2KI3JujNakVg+hQp5EToqThmVJXNcSaf3GEpu9tPtdVG7ldJbLrRPrqMEo
         eBVVuOdREt5S5X+OLYx4Dg6DnP2lvdB71rDKX8mKjkmeVspdkBPyiUpvRhpajQMfioav
         nOxf2/y4XkWUwM/Z7U+a8T91LnNda8aexNnPytLEG5gliOMAIuYHgNl5p3QqxHmYmT1H
         LWD8k00S/iHwbOx0V0Yh54kzfn1myc6+ozcpzZF93ZykwzP1+mq/gN6p3423uXEIA3xx
         vEwNxMav87hGtDCw0ejknxP9cs9Lb2fS9O0jTgOV0Ho8blLM2F174R4FpjfYr4glb0N1
         Go8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7dafleJ4wx0U8vXmX6zkQfmq0ZVEg8ZdEB/iM0cnlPA=;
        b=A27zBUlQ4qhDJ8nsv0KdnAY7lUFX5pvMM9rxhrbZi2hH3aPPXpLKNJt3Z2XDjEw3CW
         p7kTJVlZf+Rbx35Wy5qpCnUYiIwVGjhAn33wIYu3oZgzxUjF6x0+2s+uPcyFrxaL5cIs
         MNw11qP38tvH5tR6pqmttgOPN02Nqntm2aQ4fAkbR2CrHsr8wZ5SVEDLvBGlXaCk69QE
         M7S0kM13pQk3qPBNh6QaXV2fr6g6ql6zjzN6cvUL2auVvBClJCDrdTBWv6Fc5Wy1avc+
         Ew0Q1MFWK9sUV77Ob+98LMbueX3uNvQhB4fbTbxOmCBmzIi7DYyW67apl1Qbp0u6ZAs9
         xWVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dS/D6E/3";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m4-20020a05620a290400b007427f149f38si1664798qkp.597.2023.03.03.02.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:15:11 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dS/D6E/3";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dafleJ4wx0U8vXmX6zkQfmq0ZVEg8ZdEB/iM0cnlPA=;
	b=dS/D6E/3z/z1Cro3p6tYlEBTDURu3jgXwPcroL+BVzJmwHME334DXuhJYbIlz8eE0+RBY3
	m75g/Jy0QtK72M9f1dE2s4CmdMDqoGzbheiNKqBXuhqbWZJFUGoiCdHeR6au/bodRSN5bQ
	MYjHJq440r9us1U3h7Xh3azJZodMxeg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-RqxCewsHMbWECtiyPGQ6TQ-1; Fri, 03 Mar 2023 05:15:07 -0500
X-MC-Unique: RqxCewsHMbWECtiyPGQ6TQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFA493811F35;
	Fri,  3 Mar 2023 10:15:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD5F7492C18;
	Fri,  3 Mar 2023 10:15:04 +0000 (UTC)
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
Subject: [PATCH v3 4/6] docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
Date: Fri,  3 Mar 2023 11:14:50 +0100
Message-Id: <20230303101452.769367-5-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: 9D7T7wBBNZhO

For running QEMU in system emulation mode, the user needs a rather
strong host system, i.e. not only an embedded low-frequency controller.
All recent beefy arm host machines should support 64-bit now, it's
unlikely that anybody is still seriously using QEMU on a 32-bit arm
CPU, so we deprecate the 32-bit arm hosts here to finally save use
some time and precious CI minutes.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a30aa8dfdf..e2e908f84d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -219,6 +219,15 @@ discontinue it. Since all recent x86 hardware from the past >10 years
 is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
 should be used instead.
 
+System emulation on 32-bit arm hosts (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Since QEMU needs a strong host machine for running full system emulation, and
+all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
+support for running any system emulation on 32-bit arm hosts in general. Use
+64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
+continuous to be supported on 32-bit arm hosts, too)
+
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1
