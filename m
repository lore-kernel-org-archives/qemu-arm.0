Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp294037njb;
        Thu, 8 May 2025 02:36:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXG2Qdd9Hb8kDrli4sH6bTdiFp7yDGw5gPbXFvWM7Vm7mXrkp8hUCYkxAEEWI5jvj8WG+h/6IbTi8RU8A==@linaro.org
X-Google-Smtp-Source: AGHT+IF5y3Wy2wK7a6LjjgJ4QVK+wrvOaIAj1Y2/nx3mIoUF62CGpUQ6g3p3auhOxTmsTQazUAJq
X-Received: by 2002:a05:620a:d8b:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7ccf9e85b25mr278569785a.37.1746696981570;
        Thu, 08 May 2025 02:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746696981; cv=none;
        d=google.com; s=arc-20240605;
        b=kJruHoAJguEO9HT7c0BUjvN4NmqIl/24ZymjJd7sZxzB/S+qNIDWplhKMVwXdSxi80
         xjoW7crmeui6Qm3ZGRXKrUUREV9F/HVXW2KB7wbY/rpWd/W57VFFEZQDzYKfIvTHvH6o
         P0uI9RlJ+GyT7T/r+4LVF3u5Fc9floPrXOhsX8FTWG/ZoV5txc0cg9WJMX+INyD9Vz/Q
         mVicqe6X9j+8dk6LUMoq/MjO7VRmQV/lWIpzVFCvnMvVrWyfHQjPtZzI5tOwj0Hin9UW
         IFMmjm77iZYPyivb4awpNQ5hr97oB034skxKIwJdtBczFnW5Y2GQle3Q/3VbS7PpGr3q
         oVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nU4LiLynOrWE+N38igctS6l33SUxz1Pd5CrmiqYD5vI=;
        fh=cp5/pjrGBiOSnVnIYR1qYu8cyK1vwqycjiVaN+zSIMY=;
        b=aekp2mX70d0mNS0JzQyM5M7i2k752C6/O+xrsrIqoTkKakcYyaCt8ptFLx4P+Mmurd
         VX7IibJTqsRBsqdC77/qt3v0SW6ttLup0k9r6AgfteGvaugp3ptJ1eKGPnXFBvRjZsSd
         yWVi4+jNfUIjHhO1rFAn2bXI76fiRiRPqWcbcPHhfloktFQgp5JjxH9hpaAsDm/UIPyU
         qcL5rmid0MfyTaR0waA9i/Sx/mAsfWSYlt64f0fGlD+ALpPXU+dZ8uPxcTDEnpVe2RBH
         L2gxM8qEOY0HXdOFcG3Z9/uEiLhwRGqDPufmMq1XfzUfEVqBu7fFKcO/SaZWgqdve7A8
         +qgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RsWvonQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75c999asi421752785a.522.2025.05.08.02.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 02:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RsWvonQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCxfU-0005PJ-9R; Thu, 08 May 2025 05:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfT-0005P8-Fq
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfR-0007m5-QF
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746696949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nU4LiLynOrWE+N38igctS6l33SUxz1Pd5CrmiqYD5vI=;
 b=RsWvonQZNhtIxX09T9I0Qebo4PGY3pxTaaVvGJCcWJ01FCrTmrkEAj+jvFlg7e2r8wYxUC
 LBZKRQ6hf7MyfmDwVRYJ9Yt1EUDN0T0VnZt9vO7rWytAnGxrmz6U3alyGfWtrqleARb34y
 /By6cjaQTSh3puvj20mhgfkAeHd/KQU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-U53I7ScRNmuThrUlJpeP0w-1; Thu,
 08 May 2025 05:35:47 -0400
X-MC-Unique: U53I7ScRNmuThrUlJpeP0w-1
X-Mimecast-MFC-AGG-ID: U53I7ScRNmuThrUlJpeP0w_1746696946
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A4E67180045C; Thu,  8 May 2025 09:35:46 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BD7C91955F24; Thu,  8 May 2025 09:35:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs on
 OpenBSD"
Date: Thu,  8 May 2025 11:35:19 +0200
Message-ID: <20250508093519.144004-6-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-1-thuth@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2V_LOXktuFnQ0FsBJ64FahJSmuwdFhUFoKZ2S2k5Jh8_1746696946
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 85k6FU8ZdHyr

From: Thomas Huth <thuth@redhat.com>

This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.

OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBSD,
see https://github.com/openbsd/src/commit/03eca72d1e030b7a542cd6aec1 for
the fix there.

Suggested-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 6c61e1dcaec..5f0e6a65cb0 100644
--- a/meson.build
+++ b/meson.build
@@ -699,11 +699,7 @@ hardening_flags = [
 #
 # NB: Clang 17 is broken and SEGVs
 # https://github.com/llvm/llvm-project/issues/75168
-#
-# NB2: This clashes with the "retguard" extension of OpenBSD's Clang
-# https://gitlab.com/qemu-project/qemu/-/issues/2278
-if host_os != 'openbsd' and \
-   cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
+if cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
                name: '-fzero-call-used-regs=used-gpr',
                args: ['-O2', '-fzero-call-used-regs=used-gpr'])
     hardening_flags += '-fzero-call-used-regs=used-gpr'
-- 
2.49.0

