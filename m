Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1060315lfq;
        Thu, 10 Sep 2020 00:02:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEVVzusBmLO3QDiqCJUCNdkXbjCMtdbkiwlt31wpx2LBV0e7ToQ2GiOcEXiWvG5w2MkZab
X-Received: by 2002:a17:906:76c7:: with SMTP id q7mr7679949ejn.541.1599721334097;
        Thu, 10 Sep 2020 00:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721334; cv=none;
        d=google.com; s=arc-20160816;
        b=jw2Vx70K/FNskLMLy6XquMT6b7nnNYOxK7pSpotzPZklnTSzswq2U6NmmB8/MHIvrI
         G6WPyr8bBpzPBD191StPGTP3HPAoyd1rXMzCmlM0F5O412tZwoNxM43r3Q0G460g0Hlj
         ogswR23UA1UH/Pzy+asKevG+cp58/YsrKzksjenjlRF7Z7zVXdD0aAFgBSk71C9lHh5t
         tchtVq9eA5rV+uZ0AmP0e4dmaPai8yCGFC4s+nHKTNfa9mrfvygRFEGj32fxryFeeSHR
         V0UpPAow2ag9uIJDbrEsDIqQs3siJYfFuXc8VFBK4amQVrCx/lXjVAzrTD8WwxsRy99+
         +m8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lGs5ABKm8y9Jc/D3T2fzKVj+EYzhUQk9uXM+DI2xiY8=;
        b=KIvDpzJqjcE4hlmBMtge49JZ27w6+OqF+VrInrW+/Bmi3So5VfMES2JnfcXtGLxGAN
         5+ZYQDqFjwuxB+47fSXj/OLSewrLFrepJO/Kh8dlLuVvY+U9WM43So127JN8lDFzDejO
         e4yVF5aynKjGiHN1r1TzEOw2pJ7uXDqEph4RsRlIVX69WImsIQtoQLqlLugSNz+tNvD/
         C6ibQ/3Kgb5fD9C/QdAwdVBnq6z4EoHMvJVDtYlA4biu++QBFClBfb0c0nAmoaWwXlWG
         EscPevLeLGZhOWPoIc2IIUmUHUmwr87nVQGFYSEqDwST7JLSzBj/5Z4vQomwjiwaJ8tS
         7PiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e2PkHEo9;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id qx8si2834943ejb.175.2020.09.10.00.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e2PkHEo9;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGs5ABKm8y9Jc/D3T2fzKVj+EYzhUQk9uXM+DI2xiY8=;
	b=e2PkHEo93uOKXntqt7yzCppa9vPoqPKBAUJ7iJfeL7IpSBxRSzjCW0TCc5H78HDGU63B+a
	PZUA9JkVd8AKnaAQuS8UVjsJMLToplK6dBvwxQaw9xXvv2LRo6IuzhnpdtRWygr3tQXsyL
	tEJrQ8orJolzLtPYEqjqyWMCK0HvwzA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-PANoDmKcOM-4bV52BlpqiQ-1; Thu, 10 Sep 2020 03:02:09 -0400
X-MC-Unique: PANoDmKcOM-4bV52BlpqiQ-1
Received: by mail-wr1-f72.google.com with SMTP id l17so1869792wrw.11
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lGs5ABKm8y9Jc/D3T2fzKVj+EYzhUQk9uXM+DI2xiY8=;
        b=Ekef6y79WKcAQ7YGisH0XV0V9DOPZcuXeEcli0YKGmjTjqPDb48xmcie8dIWh3fmKR
         l4rCsJ1yDz60JezBT3JUUBYI0cIYd6rEjDZZDkLWn1jR6sXpzuIlIQDrAmdarnS53EAm
         LXSsmCUUVsVmoPOFdaLiWeix6UUs7pWXkRPQz0KgfabJe6DpUWb+GnjAuzAC+4N83hne
         PP8ipGOs3nl8iwSWhN0QvCAxkSihNzYRrL8I/sHDapnpci9VA9BEF4Q5JuXFBWGkbv2i
         iKUhHFfVl/SSYgGlHqB/Y2tDv3N3yhQmT47sbVa9sMqV0DQfpX2iWkgpCsw2yUBL8XtL
         Sr0g==
X-Gm-Message-State: AOAM530mWVs9pKVrScbRBLjxRiXOp2Um84PKpNCcGsHr5nRHSuMaW/WH
	MU99QM16Y97QZYRDoLDoIQZ10jLenYHTceFVj3rO/WQV3XnzC1EpYVRfWgxl2bgC3SJGqD1WQyI
	jD5UTWqqo5Kw2rdYn
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr6891002wma.111.1599721328157;
        Thu, 10 Sep 2020 00:02:08 -0700 (PDT)
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr6890972wma.111.1599721327946;
        Thu, 10 Sep 2020 00:02:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id m185sm2221410wmf.5.2020.09.10.00.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:02:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 6/6] target/i386/kvm: Rename host_tsx_blacklisted() as host_tsx_broken()
Date: Thu, 10 Sep 2020 09:01:31 +0200
Message-Id: <20200910070131.435543-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: uJ6unhWRyw/I

In order to use inclusive terminology, rename host_tsx_blacklisted()
as host_tsx_broken().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 205b68bc0ce..3d640a8decf 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -302,7 +302,7 @@ static int get_para_features(KVMState *s)
     return features;
 }
 
-static bool host_tsx_blacklisted(void)
+static bool host_tsx_broken(void)
 {
     int family, model, stepping;\
     char vendor[CPUID_VENDOR_SZ + 1];
@@ -408,7 +408,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
     } else if (function == 6 && reg == R_EAX) {
         ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
     } else if (function == 7 && index == 0 && reg == R_EBX) {
-        if (host_tsx_blacklisted()) {
+        if (host_tsx_broken()) {
             ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
         }
     } else if (function == 7 && index == 0 && reg == R_EDX) {
-- 
2.26.2
