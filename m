Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409620ejc;
        Thu, 2 Mar 2023 08:31:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9m5t5Cd20E9aeI28y6n53PV7HIBRjGaGI5weiHCHAMi8yyY7yWAUSJcGjGuEjq0+Dzud8L
X-Received: by 2002:a67:fe0e:0:b0:412:35dd:a2ad with SMTP id l14-20020a67fe0e000000b0041235dda2admr5143272vsr.4.1677774689081;
        Thu, 02 Mar 2023 08:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774689; cv=none;
        d=google.com; s=arc-20160816;
        b=nPqOJDhuKgc5gGYUvXghoRlfxCV5Dr41REeY6NgDMQO/STChJEzKKn6yzrRpFUhern
         EWVPfWprj194pLBb95icGHevjSC78yZiIrxTr/DA1DwzSHMZq17dgXVfyyXq6CKrS1pF
         EjxC5h6OgUpHZAiH98zaOf40ZGVY7dRnCFVa361Rx+4Ek6D1F4THN/e/WT+HF1o8JuoD
         vtjpey6Zcbv0vmJy2RkUYU/zErkh1dEsBM5ox9lZzcFtXz7s3exqlX6gAGjHugceMsbO
         BRPbLsFDlRNv/vdntfkBj5ySQ49X0tW6iRUq7wr7hcYgNmPb+7xgeltMRUp6GH7PLjf3
         9bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mTfeuO/znvs5lHRChCVKJ8TB4KKBsOzPzos7lhRqsaw=;
        b=Bb+juvCq3e+YzSWwys4qIL5s4ShlK0bSQtj2BKAgXcfftXnNvOktM4jlgaVa2miSlj
         GMtobc6jCn/juPyN8UK2Kh0Ow6HF1wlu2TV2jtPt2Kf3gH1QdRI1rDg7AEedar5Thtvh
         91d+zWSRxfEtBXTcIwG2VaiOa3E3O4IHiFOE4wSLm1/99+elZ4iCBbvXCMM833o4Wpol
         6c82N71Hj7uBEXqxZtGd3jkjw2No80adJhtSJMKnhU5YeZH2CAdQSSgYH4+pal7DbG+h
         MfCqi7ULXCNtd3RYbzJ+MU2GrAf8dB/pnIJA9rzLVVnlwshCaEjz+Wu2BE7wznwXq1+5
         aEkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CQbG+mgv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l11-20020a67b74b000000b004124718b21bsi5056885vsh.295.2023.03.02.08.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 08:31:29 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CQbG+mgv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTfeuO/znvs5lHRChCVKJ8TB4KKBsOzPzos7lhRqsaw=;
	b=CQbG+mgvLfJBFb2G8+5bB/8O0elAzSWCQAlxrLggFCdXjf0gGZZQJKVC9lojFI5azM/9jT
	H8XLmiNlZHHlMPGWL9TNS/548LBTVM5VrINAE6ZmX8tvNL3BGOmePsWtf9B0LtKWIk2RUj
	dl7tO0t8YCgMsCcr/NGtaxIN4J9f+Wo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-z0xiPiE1MZGTjYv3zq48oQ-1; Thu, 02 Mar 2023 11:31:25 -0500
X-MC-Unique: z0xiPiE1MZGTjYv3zq48oQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0A7E101A55E;
	Thu,  2 Mar 2023 16:31:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CA32400EA93;
	Thu,  2 Mar 2023 16:31:21 +0000 (UTC)
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
Subject: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Date: Thu,  2 Mar 2023 17:31:05 +0100
Message-Id: <20230302163106.465559-6-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: KOdvvF5VNQz7

For running QEMU in system emulation mode, the user needs a rather
strong host system, i.e. not only an embedded low-frequency controller.
All recent beefy arm host machines should support 64-bit now, it's
unlikely that anybody is still seriously using QEMU on a 32-bit arm
CPU, so we deprecate the 32-bit arm hosts here to finally save use
some time and precious CI minutes.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 21ce70b5c9..c7113a7510 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -229,6 +229,15 @@ discontinue it. Since all recent x86 hardware from the past >10 years
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
