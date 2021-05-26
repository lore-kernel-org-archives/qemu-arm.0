Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5616152lfm;
        Wed, 26 May 2021 10:05:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXzNo12TCYA4t1/szcW4UkJ92w7ljCcgv3biWwjidpzamZXClDjzsSg1x9hFu3TK9+qs2u
X-Received: by 2002:a17:906:4f91:: with SMTP id o17mr34467295eju.219.1622048754995;
        Wed, 26 May 2021 10:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048754; cv=none;
        d=google.com; s=arc-20160816;
        b=mKdFCOfiSl2IlQd4OgxqAnO2j+9XXsuxAOGVsuEv/rnbPlPp5Ceh3407T8tw62xCvr
         DNzOavDhfAStVQzZrV8I7QKjafNdzAN+VIJEwS11br1HZK15EuNGlB4LC38FwiIkdD8D
         cqMYlI2LZ4oonqIVKfqfpxg5LpVKhzByd+R7sYXAyHX+JrQUnQ/HX/n59GMZ2inMu+s/
         vTyWNFReFYEVCqch6hwj161XnK/dBb/vWhFbuKEccpRVHJ4BmIe66v91ihHYZ75UZacq
         zdhROg40ud0+Ep4AzsEl1NSOBxZl39q9lo9T3sK9zjZN1hOJS3BKqmFTqz0hM8+aNs3X
         t0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CIcR3Dg8r3/BLZX5s3uJXgxa95m9nxbDQsMDWt+Jqds=;
        b=I+CRoNVUtnbIyvAQGz64gCT71k4MgJshNfwI+Ty1MvDd5HmRTUnak3hwTILo98V5Tb
         vxP658n+Xm+stshZCr4d1HntdjrmWbMjF+HVHfI13oKkcCQeTWIJuk8IbnzjB5lrGloW
         7wAN2CSfdn3FUzAerpcsgT7aolu9/Cb7kkRU7IFaRmExlD4BKnagFHCHLThqT8SrCUDQ
         uqa7Ar9lwGHdwI6BUTiJjNuW6rORp5QfAErHMkx91nFzCE4c9q8mSFAYmIbl/kPOfui6
         ikoTjqU3UUuH5pUwD68xIOdMt7twQe6gQwcQgKaWuE32GbP1MIU9PA/1LA7O8pCyyopJ
         pkXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FrJdI3ZI;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id jx2si18952272ejb.176.2021.05.26.10.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FrJdI3ZI;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CIcR3Dg8r3/BLZX5s3uJXgxa95m9nxbDQsMDWt+Jqds=;
	b=FrJdI3ZI8t5kNCwNjEUiwsEW35NPUXGvgDdbKA8yUV2yLsiZPJVVgm+qF11ydvnficeq16
	8jxcjSD32ukJap139y07YFauNS/L47L/TjQrWhCOY3veX2woBih8FF1KyxcsI1PMs2oSNO
	E52VXRoc6mv/An7nf9wTkv+iFH86HEg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-VGxE_LBbM1aoD0y7izf45g-1; Wed, 26 May 2021 13:05:51 -0400
X-MC-Unique: VGxE_LBbM1aoD0y7izf45g-1
Received: by mail-wm1-f71.google.com with SMTP id w10-20020a1c620a0000b0290192eaddd6b0so559087wmb.1
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CIcR3Dg8r3/BLZX5s3uJXgxa95m9nxbDQsMDWt+Jqds=;
        b=RD7apMhLEpi9qoEUX0oA3z75L/RuOpSNAx97mwRZYV9orJAdooP03nl2IjZ5kPuxRd
         j8VglXbkO3SKc+I4GAZIvpEyx6RGcvxiioMfLKCl/XZGLQMCzSoBucFBRtVzzGMrzgZ7
         h9iw61ksgZATTPNvM9cV/NkqfjjgePPZFs1T66IspfHZpv3ToEPFTxKUFF2gTQAhJVDg
         526N++JuY6/ApSiytzFiqJ4chazerRm1UEr5+ddkKp5FjgwAowFVBuYQMeSmhGMwseL+
         EJmjk7SYlq/Joz1GxeXThy1ySVEKSf5kzz28b82IHg/QS5bE7GNDac32ZizsqsO6296p
         f/mA==
X-Gm-Message-State: AOAM531fR9qLEmY0KpTJNnl1oacGR2oyI1uBIidy4CC1QbPpxRGqquR/
	he3flV+JJo7VYj9cgpgtS9RHp2zPxPku/XNX/aFWUUhJRvWT3yK+UE9gnGTfNsXWuwrZ/YWk/df
	A88ggJugp7xwYKx2J
X-Received: by 2002:a1c:e205:: with SMTP id z5mr3177882wmg.70.1622048750731;
        Wed, 26 May 2021 10:05:50 -0700 (PDT)
X-Received: by 2002:a1c:e205:: with SMTP id z5mr3177867wmg.70.1622048750606;
        Wed, 26 May 2021 10:05:50 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id u8sm6728924wmq.29.2021.05.26.10.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:05:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 08/12] qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
Date: Wed, 26 May 2021 19:04:28 +0200
Message-Id: <20210526170432.343588-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6HTknBgtH6pk

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
index 2b028df6875..102bc36b91c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1387,7 +1387,7 @@ int main(int argc, char **argv)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
         (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1398,7 +1398,7 @@ int main(int argc, char **argv)
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
