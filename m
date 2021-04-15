Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp698740lfr;
        Thu, 15 Apr 2021 09:46:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJxAGBpkWfu/QfwnJ4gWw2IBLOu4Cx3sMYw3ouT5EXn8paEEUzn6slwpvseifPo8MrJS3B
X-Received: by 2002:a92:cb51:: with SMTP id f17mr3661338ilq.119.1618505185295;
        Thu, 15 Apr 2021 09:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618505185; cv=none;
        d=google.com; s=arc-20160816;
        b=hkxggtPs0fCLI0wRQ90805uY9BrsK1CNy46gVvf/waKsXlxFZrZWsFf1v8Ooy3Oq9R
         m5vQ17MGOAhk1Ah0RoXFJB1ZujVsoLv4A2agSCSEoAiRV+2He8SFRCgTUE4112gUBS5h
         nRtKODZb9pTOmOMtVKzmzaxwTxtNWo4c0nFpxaH8BozN4buQh5KgFbjL7H/3GhI3FqQw
         eLgMJjovS9/3YxyUvyzEGgK6ivUeBSHmQxVUpjsFNUXrTrdM1MqKbr4HCg2cCG95vb3W
         aHB0I4wGaxg8i//uSQ+QBsPbP8urwiVpAgCfrlDPjZ7oCsQAF2RunLrcA6z4TunMKzny
         iZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Z4+nmTFRYy19cLHZMOV8ZDTm2cOXzGsPlBiJeSnJ14=;
        b=KV5h6X6o9pDR8IxiETzk48mOLr1jAe1R1TI/LXkHTt/n/ehfQqehMAjlL6FuxK+tqh
         8rMCWwKR6ak6AsF4AqIqibbufjwRD8/RIDuYLTerUpdeG1z9RZeYzEkRRyRGtg6FdA0J
         mog62tJ1i/57oU4y9vUBLGHgfHyX6cQZdxlqHm5wGBnMplhoM5uZtHMFgR68qOx9XhS9
         dIW2TUsu5nao4HoF4EEyk/2sAjO203D4gERs5cf1cy31ccprXJB1mi7POSHU2uJsZlLx
         wuAibychLyPvoI26VSj6IDa2wLI2Jo7vkjiRoIGHgVu3NtylSaThvMvkZtXZF2xrJK6G
         Ccyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GQkFQUHX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si3448638ilx.110.2021.04.15.09.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 09:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GQkFQUHX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX58K-0003Yj-JI
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 12:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wY-0003TC-11
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wR-0006Ih-N9
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Z4+nmTFRYy19cLHZMOV8ZDTm2cOXzGsPlBiJeSnJ14=;
 b=GQkFQUHXkdCy6elNwNk+PvA2O+bYEM0NV7SWP4FNJUZUjvzUOQRO0auaNl62OiACA5o5Ly
 zHv7zfvYeKlydsimHBIhakkJRkVDGngF9fkzcv8H2HPJDXLZmzRlNH6g22vqE3GC+WUHcL
 sMwYKqFcRJIKsIgFKNKizp+UAEJOpqE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601--oGvQ85eNbGxJEHwJS05Iw-1; Thu, 15 Apr 2021 12:33:59 -0400
X-MC-Unique: -oGvQ85eNbGxJEHwJS05Iw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z135-20020a1c7e8d0000b02901297f50f20dso2223116wmc.0
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 09:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Z4+nmTFRYy19cLHZMOV8ZDTm2cOXzGsPlBiJeSnJ14=;
 b=sdJkGsSmYhC8vDOhHC3hkHwHjrIQhoBYB8Crn8FijIWxTatO2ld5Wx1G130kgjd6cR
 OqZIhEC40O6BUixyij3iUbXveUoiz2zG7pGohxdm9q1F/IwnVxjjNJbmmJ6pKmwcItmb
 wvLbmZLnQzMmeoV9z54miMaIPuT6FM1gBJMcc3/7+eFdFhyLDSKUex16px8qfMlkUd8m
 U3ex0LJG+aQua14VY6kCC367tLI7by9hxbu1SD6Q5IhQ1LclD5Eyq4AA8JtkakgXfrlu
 Bx9Vf0LZZO3S0PpM7EmKMt1Rf2CpsFOm3/MFB057oT9NHahtkxbQ7fU0fglRoMm25x1d
 jm2w==
X-Gm-Message-State: AOAM530v37/+iCU/3GNBwxgINe3VQaE6D2qQtiQT4wrmWaDIgN7vL1mr
 FrG+emwbe639zmMvNDBtMQrZtLVwPU1FNnEeKka0wsOW59x7eIg+A/LgsInGunPoLJpCuLT9YaS
 Vu8qqJ1SRPETX
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr4459629wrq.418.1618504438568; 
 Thu, 15 Apr 2021 09:33:58 -0700 (PDT)
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr4459620wrq.418.1618504438472; 
 Thu, 15 Apr 2021 09:33:58 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p14sm4199376wrn.49.2021.04.15.09.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/12] qtest/migration-test: Skip tests if KVM not builtin
 on s390x/ppc64
Date: Thu, 15 Apr 2021 18:33:01 +0200
Message-Id: <20210415163304.4120052-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zF3ZIocJCmxa

We might have a s390x/ppc64 QEMU binary built without the KVM
accelerator (configured with --disable-kvm).
Checking for /dev/kvm accessibility isn't enough, also check for the
accelerator in the binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
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

