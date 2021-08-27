Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1519229lfb;
        Fri, 27 Aug 2021 05:10:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8SlT+w5HXnf0NVdA42DVAw6C+BNyGVEowEndcCtZLzY14o3Lf+EExJR209DEXUE/4oF/z
X-Received: by 2002:a17:906:bfe3:: with SMTP id vr3mr9706153ejb.521.1630066225984;
        Fri, 27 Aug 2021 05:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630066225; cv=none;
        d=google.com; s=arc-20160816;
        b=earboG3ogEtP0lQLTkWmKAhvwrJBRTbImakXSqOZ8tFAlKAdeSUvQ+u1i2V0oOdsuw
         iVTO5XPygy2Caxca4sQklIVCw8RqyTwHfi/OH3Kt1cMjww4qeWx1Z7Q1p3KgfRzzmfLg
         2j8H7TOKkWDtpv73doqiqyWQxE1SoQ+kmWaDMFcDyouVu5s6xu5n8B6MAOwWK7JsXKN+
         RvtGTyEG8OnTu0CGyQM6b/QEAW/E0Cf/AGcjgMbWLIRtOPNqLcU2J/DHQ9/sUj81p1J9
         RRJfm32ZiUzUYdiQiOMJBXkiOa0FcFP4VLhQu6Ps7J0t43CTGUliBjudABATJqcMH+mr
         +1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PXN2XqI6Yrf3sKmT4TN2bu3GayaHLDeqAznihBOaJXs=;
        b=SLuw0H/WSUACaG8acjZVer9c6Yz+4xDJAcUrtrvCSXblb49LFJpR+3FZ2gVnO75VXY
         LU+nDdIE9cWYaon5BBu70Ubfyr/Z1e7GynBEokoueKq0r38yhn0CiR1YkHtcgHON/rPG
         MNxiMP9c5NuqQP2P4kbTZq417aDK6s1ry/ZTeTyAaSpe3E9Ke19wheX3inMOejzN6AUq
         Pa+TMnDWySKZS9UV9Vxn4svAN2d6g9svsnQ1zSl0VgMkAo7H7Grmk4KGWEDRGXvPm+e+
         p+0oMBMeESouJsKjyhEwVqihgaTHqxSZBAkNsLRRV2aYnEnU2ndGcDwb+pgROpzFzBVf
         4GMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V94oItaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qa15si3899075ejc.241.2021.08.27.05.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 05:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V94oItaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJagj-000109-1w
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 08:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafe-0007xE-Cg
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 08:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJafc-0004cS-6i
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 08:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630066155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXN2XqI6Yrf3sKmT4TN2bu3GayaHLDeqAznihBOaJXs=;
 b=V94oItaV2qPJzNiXm7PHdPAc8uxqHFu2VQELSEdDzrzwAN/IEkTFbd1781UpdYFIbG3aC3
 cEefcgNJPI+jbkTnjTF9bPey75MOzIPZO0leW9vhbGFHJJ/DTPQPJtMPI/kpWJ7ToJdxdF
 cYTV8yhL+jS1/y8NiIkiQNKNt6gGGxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-3AccST65PYayhUysvWHvGQ-1; Fri, 27 Aug 2021 08:09:12 -0400
X-MC-Unique: 3AccST65PYayhUysvWHvGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08611853026;
 Fri, 27 Aug 2021 12:09:10 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 364135F724;
 Fri, 27 Aug 2021 12:09:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] meson.build: Fix the check for a usable libfdt
Date: Fri, 27 Aug 2021 14:08:59 +0200
Message-Id: <20210827120901.150276-2-thuth@redhat.com>
In-Reply-To: <20210827120901.150276-1-thuth@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ujjh56EVrtoN

The check for libfdt currently has a flaw: If there is a system libfdt, the
meson.build code initialized the fdt variable with fdt = cc.find_library(...).
However, if this libfdt is too old and there is no internal dtc module
available, it continues with "fdt" pointing to the old and unusable version.
The check later in the file that tries to detect whether libfdt is necessary
then fails to trigger:

 if not fdt.found() and fdt_required.length() > 0
  error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif

The build fails then during compilation instead, which is of course bad
since this is quite confusing and already wasted quite some time of the user.
Thus if libfdt is not usable, we should unset the "fdt" variable immediately
again, so that the build already fails during the configuration phase.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/255
Signed-off-by: Thomas Huth <thuth@redhat.com>

If the system has
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 0b555197c3..ee156ff0a5 100644
--- a/meson.build
+++ b/meson.build
@@ -1916,6 +1916,7 @@ if have_system
       fdt_opt = 'internal'
     else
       fdt_opt = 'disabled'
+      fdt = not_found
     endif
   endif
   if fdt_opt == 'internal'
-- 
2.27.0

