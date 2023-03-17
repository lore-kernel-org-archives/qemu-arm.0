Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1069657ejb;
        Fri, 17 Mar 2023 09:55:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set96hytbn1F8HVCEEEojmBVOi2Qa4w6wwuJFtzo2hGa58JiohfV0yMW4b0kWi0ZVg7gT/9d4
X-Received: by 2002:a05:6214:194a:b0:537:7484:8d1c with SMTP id q10-20020a056214194a00b0053774848d1cmr41241752qvk.30.1679072141656;
        Fri, 17 Mar 2023 09:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679072141; cv=none;
        d=google.com; s=arc-20160816;
        b=Po4gdE6Ja6wdjMbCO3fbo7a/t5Zqk+iAdBz1X2V0YOKQ0+ScW+5v7uqPKymmQ2uTjK
         R9lB+PEB9HHlT3HnXY6oFD+6uJPt01zx1fkg/TkUsrU2p0hWNL+/3C/hPhyvg0+BXI7V
         YVCgoLHqK2fiRIqoxQS+7FcswQGsovr2mDeTHUP0fJ9JXSE1zZbXfNSuciwdamnZTGwO
         OJD7MU9F5/Se7kGCAUWk02yel5HLIIfLp92ay3K0zWJVHyOyMU4jXa3GiDeCiePOt/CB
         ofRLm6KptlNla45SadgoP4C6T3ISbzpe1yjAngtRwsSDPKR65Me4Ol3ja0DH5PpBTZCn
         b/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SykpPfy1te9EVTFRls+clt2tZyxyhnTYRdhxDsQi3HA=;
        b=phRBGk6kxNvnRw6xXRrj3lQ7n7lTT1JwYmhXsE4g4oPqmy4zclIfHQwzpN14obY9PP
         08cwTpzI1x70uLUyvlrrdS1TTtGlvZO0oJI0wr6TJPT0OW2eXQPVi6CPuVfwr64vyEfG
         7DFh2mnCKqvTLSzUeZo4NS9r+bdjiHOU/jBx5FrcLZ5ydXonxmUC84Xe65FJGfWFKXjY
         69IKs98w7FtDCrbp0sA9hSRwaIldfk5R0XYFLmRFZJspvf8p0eLgWPXJIbA5Q6sS5hVH
         rzywTUmbuRj2yxTWz32Ls5PKGPN2L5XgPckpuF8VbiKW1cLt+Z3sIC6+LxYp6hMXWjrF
         K70g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IxsLEi71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a0cf845000000b005a24f4dc34asi1652303qvo.326.2023.03.17.09.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 09:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IxsLEi71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pdDMN-0003EJ-2I; Fri, 17 Mar 2023 12:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pdDMM-0003Ds-05
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 12:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pdDMJ-0001iK-J8
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 12:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679072113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SykpPfy1te9EVTFRls+clt2tZyxyhnTYRdhxDsQi3HA=;
 b=IxsLEi71tmajtft+n9oghmWXTcWmtd/RJRHPzHZVqC6XrGjtquNrF28cu0E5OCW/NfJpIQ
 oQ6u+SuNzoKQgu3ABT/lPtNjeorhT9HrsfAbgIg7PHHSRiSNVhwt5HyTKtIPmfzF8xWY4W
 NUgz0tiIq+VVSBg4vCw6he/IaRPPSrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-70LzTOSGMPalaefvWKoNHQ-1; Fri, 17 Mar 2023 12:55:10 -0400
X-MC-Unique: 70LzTOSGMPalaefvWKoNHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C520C185A78F;
 Fri, 17 Mar 2023 16:55:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D996B590;
 Fri, 17 Mar 2023 16:55:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Liviu Ionescu <ilg@livius.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH] Revert "docs/about/deprecated: Deprecate 32-bit arm hosts for
 system emulation"
Date: Fri, 17 Mar 2023 17:55:04 +0100
Message-Id: <20230317165504.613172-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bLlhVqt9+fht

This reverts commit 1d0a8eba38cdddd028ea02c6e0b68f0a4c9a3cbf.

The commit made the wrong assumption that 64-bit distros are most
common these days on arm devices, but as Liviu Ionescu pointed out,
the recommended OS for the very popular Raspberry Pi boards is still
the 32-bit variant, and thus likely still used by a lot of people:

 https://www.raspberrypi.com/software/operating-systems/

Thus it's likely still a little bit too early to put this host
environment on the deprecation list and we should wait a little
bit longer 'til 64-bit distros are the predominant ones.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 33b942283f..1ca9dc33d6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -206,15 +206,6 @@ be an effective use of its limited resources, and thus intends to discontinue
 it. Since all recent x86 hardware from the past >10 years is capable of the
 64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
 
-System emulation on 32-bit arm hosts (since 8.0)
-''''''''''''''''''''''''''''''''''''''''''''''''
-
-Since QEMU needs a strong host machine for running full system emulation, and
-all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
-support for running any system emulation on 32-bit arm hosts in general. Use
-64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
-continues to be supported on 32-bit arm hosts, too)
-
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1

