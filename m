Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373933lfg;
        Sat, 1 May 2021 15:37:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2CoZGBiG1oHswNYzDmetyK2khCoDg2I2OSUXW1jNXj0KZFD+UGhk6hPsTpJ95EMPpFw48
X-Received: by 2002:a05:6402:b88:: with SMTP id cf8mr12921998edb.227.1619908648954;
        Sat, 01 May 2021 15:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908648; cv=none;
        d=google.com; s=arc-20160816;
        b=OASoa3llj+S35p5fRuorSpwS5ePjfstVBCGdJSXJibl1D37lLPr8eStZSv1L6XbgbX
         qdnHcDxfnvKYuoqBlyssfcIPDh8yyjT2wiNSVOu+zNbCuv3PBDXxESjgvCHzd01SNDHS
         IoRuMF5t3DW/qlbjbSv1uXeCYLHaB7lsdiCiouVzTsjYgeopMSc9aMgJv1ikK8LUU1hP
         tRcbEr2ffi2r6YADgLhTnD2Py/mi5E3ahSWKFCoNibeZaS8DVpU0YecilbAwMNTB21C+
         B2ilBrbvQObO6wTwMg18kPH9wB4f5JpOy6d8jaKlgdO5oseO1t10bkih4a5LRJEWszWp
         Ozvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
        b=mwrzWfc7wktr+YOQ0nyDc0tCjYOCSYl4hNqNH9IvdJj4oP9/IvS9UEnCfkuzKhNkMJ
         wWB+gSyfExE1YInVXSYg6qI8zgYWHsSFkJMl/FYdTqyBGgq9AHEswz8xlZCwhgwnZZxS
         MuONszIKeNSqekes1C71JReTgl0hwlnvwrQfnMowCVO8vbmg+LAkLbUTE6pOsxFhfQt4
         Y1kr+KEtYAeOE92g07XLR6DDG+lTHIcLPis63/8tJi36E6xEk+hYTtsKZTLYlFHj1Q+f
         rXoDK5H6FSwgFUzRp7yZB7I4aBotoZ2Tieza5EQw5/t3QRtehxgr7/tpyoM8MU3+cjra
         8vbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DoCfmxFy;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u28si5880938eda.342.2021.05.01.15.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DoCfmxFy;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
	b=DoCfmxFyyQF0SRGXG0eK/AIqfxwKj6xoQvR2jYGOrhjSPxGa65dJpUjPat/5GIHR5NZjF2
	RD8KIPGDa6I9pXC2tZWrRDuSKFREcDR4lbm3b13LRgkJgaUkgMSkRqmORwwR0FhvHDikVL
	bi+Nfd0C3hm9i6JlRI+xmpVmSH4Noxw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-6islhr5BPYyFhaOBkDoyyA-1; Sat, 01 May 2021 18:37:26 -0400
X-MC-Unique: 6islhr5BPYyFhaOBkDoyyA-1
Received: by mail-wr1-f71.google.com with SMTP id q18-20020adfc5120000b029010c2bdd72adso1288823wrf.16
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
        b=cTl1G6zmUczYK/aq7QWjHga5x+rnjMIZJsGnc8rAhuqU1Hla2o44J4IYZh62PL0XQb
         hW83dvwG2AyQ2gonbTg/m1+Uzq0Ofgyo7Ow+gIW9lWWzx7WWchvArrqbiOfzpeuCk64D
         NlD2f52T5Q3xZWRb+LrS/wSckNNEPhPF3frTI5ac11sriws8BvQWkSFpMDGTtt4ciYju
         P64q9dWoxSKJuXehCdW8n5HWfpy4hm7CVciU3nUK14vAuiQ3ueace05y+LsJhSIZmpaa
         ZrvKO+q6b+OnOhHxbq3HY0KRmnvmGF39FVdOoRc26hVIX8FLrSATBiljUbfGhuB2tVPn
         6g0g==
X-Gm-Message-State: AOAM5334bQQ8ozVEPyo4aR4FsdhiDYkn+P2udZSBu6ZKkpW+4+L2uJL7
	mknxixJsD+0JDnreI1ttuM+/zhPrNZgW6z/OlGbk3wUIDBKbiJ+Q3f8InpkvRVpthZFkQ29/MkD
	ZyLYgxN1z6+gL0ee+
X-Received: by 2002:a5d:6d48:: with SMTP id k8mr15615924wri.93.1619908645325;
        Sat, 01 May 2021 15:37:25 -0700 (PDT)
X-Received: by 2002:a5d:6d48:: with SMTP id k8mr15615905wri.93.1619908645226;
        Sat, 01 May 2021 15:37:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id n2sm8024960wmb.32.2021.05.01.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 09/10] qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
Date: Sun,  2 May 2021 00:36:37 +0200
Message-Id: <20210501223638.510712-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: it0bh/mKL8BJ

We might have a s390x/ppc64 QEMU binary built without the KVM
accelerator (configured with --disable-kvm).
Checking for /dev/kvm accessibility isn't enough, also check for the
accelerator in the binary.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3a711bb4929..c32a2aa30a2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
         (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "s390x")) {
 #if defined(HOST_S390X)
-        if (access("/dev/kvm", R_OK | W_OK)) {
+        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
             g_test_message("Skipping test: kvm not available");
             return g_test_run();
         }
-- 
2.26.3
