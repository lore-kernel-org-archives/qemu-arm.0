Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3007181lfg;
        Mon, 3 May 2021 14:11:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGN8/6QGRJiSQMLtEtv+fe1f5j9eVewxZ767hGlthuS61nm7xFqAlhfhYH+Y8WCQBzHqdz
X-Received: by 2002:a17:906:32ce:: with SMTP id k14mr19335302ejk.27.1620076287525;
        Mon, 03 May 2021 14:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076287; cv=none;
        d=google.com; s=arc-20160816;
        b=WkgqfklO+O9czUS7bBZ7c8AU8rNWf/EbG/GEKcdYzSkOkN09C78ZPTd4ZmMdzMd1OR
         qMPiIAwupZxGf7DNou47QTTDtd/bnpoEYIMVbxscbIfPNFwtkvF52uJ4VW/JU5bCXNMb
         HShwRDzeJ80oJU4q0tgDAi0gt2GEbNe1V98NFuJws+5K76r1bvOIgDvu7Hf8o2ehyDLr
         9ASzotY834MXAXKtA8kM+6cj3z6f+3a+AkOqQYg0M0yVJLBFlNzoer9KOFuk0OUbauG8
         qm+qU81HS4E4vWX89ZNCJ00++qr4tOUvwx9pkgyXH/foKiGw7iCtyn1r/p9LW9lmy2dr
         A6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
        b=kNlogy7sLpTV3zFl5fs4BArHLm7NGmPQ5971PDARvhurVN8icMEJ9W1Tp3qUvPxpu3
         iMnJe2jNGBQZCmy31a4SSHMpkQt47VUorukaXS1HdLvcdlebmnKykoZMWNc+Asmd6WNI
         W6I/IDYcnPnoT7YmQTPmruTE/lzZz+XVruTx4sNq8z6Ll4UohkpRcT34oN4VJfHYbJJu
         hwM5hszWa2gfQE2+X72+maj2zzQJNLymqZ2OakFdHqcemr7IS8GZ6j36xVA2Hq6bSFXx
         Re06+Hfcnd/9WkOEAiEy0jrSxU0nVq/hChvtcKK9UW1Co+kV3bzJhE5IMjKH2DxUnDKd
         E70g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JePQfIz0;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n26si10289555edr.190.2021.05.03.14.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JePQfIz0;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
	b=JePQfIz0Fd1Pnn4d7E5+Jfk/U86q+Cr39BMaNNSNWt7D1MLXrDzlfwTdsm8MmfQ7DiEkt1
	JLuxrQPa2fv2B8Ksn284wil6eQ1KkipoPF26f/bmKk9Cs1N8CvaBNRjuMmCy8hLVQd2/cR
	zI2H8I8KovmX0f1CDz3TAxmWB1gmz5U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-83tXDavdM_qezXTbjchPGA-1; Mon, 03 May 2021 17:11:04 -0400
X-MC-Unique: 83tXDavdM_qezXTbjchPGA-1
Received: by mail-wr1-f71.google.com with SMTP id l2-20020adf9f020000b029010d6bb7f1cbso4645534wrf.7
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSr0ATvoVPT94Kw0PlP2HcPHUZbWsmv1leCf95/HD08=;
        b=Ux3Sts3FjEfnrUKzxmC+26t6KMXqOeEnmogIoJ8w9ynwrFHohBzWq7/tUAhQmsiIvz
         EVLDfBPFEj7yvAqAzGTjegqg9jMWTfSbLVSRjkS9JTHQweHimO6QZbK//qCbV9WGgQm4
         0OKKxqgx3FTJDhBGZVTvU5nxND+azUpAvc+YHcaFbOMJM/GtOS0aBZk5dLk3JLRowjCJ
         ikVaf2OpG4IW8+sy/LTRrgkZvxrUw9R/pdGR1wjkFcqWLeVqsvVLkl+GP0CGnJD/84dM
         Mvwjp3okorgbt5kTlFZiPIrg7E9PEoqY6sOaQTgHRZ6rsaaOvOYhQICzYju70rtKk7p9
         9KdA==
X-Gm-Message-State: AOAM5329ZxikfOnrgjAi4i4DTe/zOC1+4/TdP/Z7cBRFh1D84Kwkw18G
	ewiAoeW9/B1P1qnmFf3jcIuoYBMCnegdRtq0hBB9O9OGIeAg8OXfBZ4vl94r3Dl7JYdJD6XM+WB
	19LFLvFE/vWMEqnAm
X-Received: by 2002:a5d:694c:: with SMTP id r12mr19922312wrw.224.1620076263875;
        Mon, 03 May 2021 14:11:03 -0700 (PDT)
X-Received: by 2002:a5d:694c:: with SMTP id r12mr19922293wrw.224.1620076263712;
        Mon, 03 May 2021 14:11:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id f18sm549071wmg.26.2021.05.03.14.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:11:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 08/12] qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
Date: Mon,  3 May 2021 23:10:16 +0200
Message-Id: <20210503211020.894589-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bbao+78/XQ/N

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
