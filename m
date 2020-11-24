Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4477956lfb;
        Tue, 24 Nov 2020 04:53:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykaqy3hnHTj2+cNWDln7KF715eIu2o4k3PfdrU8Za55azImQSLGlfFO3rZ7SnbLlHvDX/r
X-Received: by 2002:a25:8401:: with SMTP id u1mr8902092ybk.96.1606222383499;
        Tue, 24 Nov 2020 04:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606222383; cv=none;
        d=google.com; s=arc-20160816;
        b=mQ30YvAUghoCOXocoSboVPJCTksqppOKPul6QvBF6Ckmp7yvkYtVnapYZRyBZPKuN8
         0T8CEXc5hdbLNUkQbWay/scUAHUQpbpkqgFUeVWVHabesutEJkcId6jNzsIIRKk9BmBF
         QW4BL2T/bpb15GHzNODX/SQOVOKy5UGnm6W5QOMn1h+NmYfQjwcU37ZBe3G4Kc8cACw+
         C8CfiUVMHVS11qecCdtwZ7weQpbYKW3rKKKlMjqvg4efPogQSel3Q7zlycOVJbEBdwCs
         cGgnN0RwKCcL/jGORAV79G4MSVBuPtGhofnpMZm2V2ppFye06ROgQh18TNC1Oc75EsFS
         89Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pwN7Jsfy6C0mt8E2ywmzQeyWgEgMKwQQVB/esWilJpU=;
        b=dZmY7IYKNpYIAwFUcGFgzrfyVLznZlXRFzEdLBKlfGKWt5EfP9vZ23ROjvj+8FqU+p
         rpMWeZsymZxE07lnnjLxNU7Y38Q9w764xI5IVMHxmbq/6Nsx9G5cb2uXq1+20r+YL3+q
         4WrB1G5poXv/eemR3ZE22nmyOF5bb5nQtf13U9vXCgEAknTQpoLyF+M8aaKuzQ+4asyV
         dETkOKseMyK1qksbqN+c/91VT2DY2c4NEfNRlh9CLj7ZgO3RR/l3QQ+XzWEjJxaNuQ3C
         tDTbNl/wiROKow9fej284b1QMs1ftLleEF+FU3PI47/0RLmcbsKFt9IjAAAblpqlTfOJ
         vRZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gJb3JAvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23si20782972ybe.387.2020.11.24.04.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 04:53:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gJb3JAvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khXoc-0002VZ-TZ
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 07:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXoT-0002TT-M5
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 07:52:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khXoQ-0004pW-PB
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 07:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606222369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pwN7Jsfy6C0mt8E2ywmzQeyWgEgMKwQQVB/esWilJpU=;
 b=gJb3JAvBaGqaeZukaNHhPI69dcvyGY4VsL779Z0nSj7U6QKrRONnbqs2bCxcIMLl3jy9br
 SR7iv3xtTtklXgHe/+P2qfTHq0C24b3t+21pwp43Qa2E6/Yb+JnAtS+kFH4BIfb9RV3Wov
 shOv9osLZwmQaA9jQRUXBvijdhEftzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-JJ5kAiSjOXWvrJDTskBZGg-1; Tue, 24 Nov 2020 07:52:46 -0500
X-MC-Unique: JJ5kAiSjOXWvrJDTskBZGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBB13423BA;
 Tue, 24 Nov 2020 12:52:45 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA8D760864;
 Tue, 24 Nov 2020 12:52:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove GCC < 4.8 checks
Date: Tue, 24 Nov 2020 16:52:33 +0400
Message-Id: <20201124125235.266884-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 richard.henderson@linaro.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: blR2bPlPfte+

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Since commit efc6c07 ("configure: Add a test for the minimum compiler versi=
on=3D=0D
"),=0D
QEMU explicitely depends on GCC >=3D3D 4.8.=0D
=0D
Marc-Andr=3DC3=3DA9 Lureau (2):=0D
  Remove GCC version checks (all < 4.8)=0D
  compiler.h: remove QEMU_GNUC_PREREQ macro=0D
=0D
 include/qemu/atomic.h         | 17 -----------------=0D
 include/qemu/compiler.h       | 33 ++++++---------------------------=0D
 include/qemu/qemu-plugin.h    |  9 ++-------=0D
 scripts/cocci-macro-file.h    |  1 -=0D
 tools/virtiofsd/fuse_common.h |  4 +---=0D
 accel/tcg/cpu-exec.c          |  2 +-=0D
 tests/tcg/arm/fcvt.c          |  8 +++-----=0D
 7 files changed, 13 insertions(+), 61 deletions(-)=0D
=0D
--=3D20=0D
2.29.0=0D
=0D

