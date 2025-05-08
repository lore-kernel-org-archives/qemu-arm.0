Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp470673njb;
        Thu, 8 May 2025 07:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfMjFxYLb04K0eOfaCl4g5lQ0ytcvACRUjms6f9QA9VMRoG6r9NNm7HKF/CHFpxKUCKImzm05nthOgHw==@linaro.org
X-Google-Smtp-Source: AGHT+IEiP6xvLZHjZamL6AVmFSEZpXel76tccu4yxsWC/LANIIVLdKM1bszwsgLvXwgujWi2PwwP
X-Received: by 2002:a05:6214:19c4:b0:6ee:ba58:e099 with SMTP id 6a1803df08f44-6f54c3bf6a9mr60748316d6.15.1746715304000;
        Thu, 08 May 2025 07:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746715303; cv=none;
        d=google.com; s=arc-20240605;
        b=TuY5ZaL8aF+iyWwvxdFvk0vDNtTux3LIlC7/D+JCluk9dIxJoDj+AWNUImp+VGGEok
         TKu7RK6MDyDeueBPThEdmXtTYuRMeGdUV5uyAlIKoD0/1LnQGpSlVrAEsZ9pqSRlZXuD
         8kstCXJWhNhB7ebPzcYYBQcXzR91x8xXcpmH0itfwueANAPUZxNIBaL5n1cqSpekKDfS
         f+ryj1mQCNxxcggq9He0Hc9h5cnN3IAgAIWapzLLgKpAtBRbW7hF0bxyJfudJSEBviBJ
         FY6FTTlFy3GttZDDKfVXnXRQQOD7sYKuvOji8IWdLbC71GomFfq5e8oZWcOZ6eJU7zzP
         PFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7rOrt0arOj0AsEmDcAxQS8lpsa38MnnGCY/U+gFk0Dg=;
        fh=mV1hj/g4izUEtI00kKHr/+DcS8Ht1XYt/8wmIYnJvQU=;
        b=CFchRXlXW5eKXdM+rdH4vVQqRDwAOzJJAMn0xoABu9JsqvIlbn0+DqDmutE5dg6IM/
         DUJqCmSFO9wYzayzFlB1/qc9DERmeytDHOAVQKxDwKuDNcpOBA1d6tdpIDGRAqFT1oZN
         zllKABnZVmGGgOqfiz5oRXLiDvOGTd0AgGFfVba5bSkJfaK9ovA/S8PYHpt/RMk//R9N
         Jthy4z/DQyq7AifuXZ/63QvoR74viT6Uiao4HhiUg4kCH4/mUaK3dj9WALSNpGfLnRKN
         ApyX5xkWzWlvO8GyiR0LjTIVF43impG1v8uILe+FUHXW/VDVGA+D4u55FW27OtAAAG9R
         0u1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDRnjBNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a645f1si657926d6.479.2025.05.08.07.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 07:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDRnjBNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD2RL-0005Vg-Jb; Thu, 08 May 2025 10:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2RJ-0005TU-GT
 for qemu-arm@nongnu.org; Thu, 08 May 2025 10:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2RH-0004xZ-9M
 for qemu-arm@nongnu.org; Thu, 08 May 2025 10:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746715290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rOrt0arOj0AsEmDcAxQS8lpsa38MnnGCY/U+gFk0Dg=;
 b=GDRnjBNSXSCdiRLnvTMtfO0XAXVQlmohkW6QE5w98S2tx5LtsBiFb42+BGe9desYoqJY6q
 rwPRt0VDEhHyMj0i2u5RDFyxHzxsx9wCxAk8YtIrK/3JQpf4Wv+W8zrm8tsvA0Mdduc05G
 EfQaTk08DVL75RS9x2j9tcxuTNwnCYI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-noSU3-3iO8-S5KTVh1gacg-1; Thu,
 08 May 2025 10:41:29 -0400
X-MC-Unique: noSU3-3iO8-S5KTVh1gacg-1
X-Mimecast-MFC-AGG-ID: noSU3-3iO8-S5KTVh1gacg_1746715288
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 159A2180899E; Thu,  8 May 2025 14:41:27 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0685219560AE; Thu,  8 May 2025 14:41:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH RESEND 0/5] Fix dependencies in arm machines and update
 OpenBSD to 7.7
Date: Thu,  8 May 2025 16:41:15 +0200
Message-ID: <20250508144120.163009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: isbQGxxaf3lL

I accidentally only sent this to qemu-arm, not to the qemu-devel mailing
list, so this is a resend, sorry if you've got it twice.
Note that there was already some discussion on the qemu-arm mailing list,
see the archive here (i.e. I'll try to rework the third patch and
postpone the last one):

 https://lists.libreplanet.org/archive/html/qemu-arm/2025-05/msg00549.html

Original cover letter message follows:

At the end of April, OpenBSD 7.7 has been released, so we could update
our test VM to that version now. However, I noticed that some arm machines
now fail to compile since they fail to include the <epoxy/gl.h> header.
This header resides in /usr/X11R6/include instead of /usr/include in
OpenBSD, so we have to make sure that the machines are compiled with the
right CFLAGS (or don't include the header at all if it is not really
necessary). Thus the first patches of this series clean up this first
before we can finally switch to OpenBSD 7.7. The last patch then
also reverts a hack for OpenBSD in the main meson.build file since the
related problem has finally been fixed there.

Thomas Huth (5):
  include/hw/dma/xlnx_dpdma: Remove dependency on console.h
  hw/display/bcm2835_fb: Move inclusion of console.h to the .c file
  hw/arm: Compile musicpal and the xlnx machines with the right CFLAGS
  tests/vm: Update OpenBSD to 7.7
  Revert "meson.build: Disable -fzero-call-used-regs on OpenBSD"

 meson.build                     | 6 +-----
 include/hw/display/bcm2835_fb.h | 1 -
 include/hw/dma/xlnx_dpdma.h     | 1 -
 hw/display/bcm2835_fb.c         | 1 +
 hw/arm/meson.build              | 4 ++--
 tests/vm/openbsd                | 4 ++--
 6 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.49.0

