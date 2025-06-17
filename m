Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2252736njc;
        Mon, 16 Jun 2025 20:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0jIF/xK3sqUxomYwJ37qvpx0tg5vkPwTP302JqrpyD2GWvulCxfGICQgIKhXIkAyw8NJ67DDHPCba5g==@linaro.org
X-Google-Smtp-Source: AGHT+IFRRABdER+WkwZ7si4F0s3+Z0R60H2QJnr0Z0vAAZZdnEMZmDRF46fMWab/z0rFnow9bviz
X-Received: by 2002:a05:6214:f6a:b0:6fa:cc39:9f with SMTP id 6a1803df08f44-6fb47778ab7mr211501116d6.32.1750129556367;
        Mon, 16 Jun 2025 20:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750129556; cv=none;
        d=google.com; s=arc-20240605;
        b=B1K2PIIIpXwU3dDxDN0S/M0UH/H2/pe2XpOwWCBFRJolcEvPznGNzXlYcBOT0b8dgH
         rRtMEgKaNIUtkqeyykRFqLSKm35I0Sj7BapbWlRxTmcJdF//Qe6LZmT7BTcQrMyeBekB
         4EBbAyC1CW5e2TbpJzxg6X9tsNWSA0o+5XsWK/AqoHei+htsgmrawVX17XzfNGETS02J
         sMMegWT8qHOfM/5w6iTHHRoP9GPkTfXR6hrLKmy2ELLVGmLaar2fMmlxW0eHbJd9eSRl
         cjkQC34lBI131bz7xoPtHULNsmftFfGEdN2TF19+YuOCYupCJXzj8LM47Y78rZxfO4dj
         buLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ELv2X9zhnnOetgXUyB9XbyUdrlWbV7CSRukM0eOt2QE=;
        fh=XmQ64oC2GXlRKeSh70qOiuviRf7iaTTDuYAzitDP7YU=;
        b=a8kq0mZs73xmnnep3hORmki8mL56vnStHEKybkT59dRZuMsD6gUzYWHCuo5gruxeyO
         AmSW4yPLrST/rMcb7hj1Wc5mwp86qZJVaMysRjjde5DHjEWIQVv+g7HKXMQGtNEUxsJK
         MFsrR/X5dKaGzXr4S14q6fulivCPPjEJE7j1L7Y4F1WqVQn3u62cIZYCBsF5RxELSJcv
         4MXpEabVD0NwgxdFxihqD0ihM7kYZdrdS1DxrfRNLE9TUFRdJJMV7D5iICiESYDSKVmI
         CMwDqIrGzoxgdpdurufFxQxOlkHaosLJxC7YBnkNKsbN+nCpcB2DghzFdXPcqzr9locp
         +qGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SYJsxBU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb4a8f870fsi75750886d6.230.2025.06.16.20.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 20:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SYJsxBU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uRMdm-00050U-4Y; Mon, 16 Jun 2025 23:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uRMdj-0004zs-Sw
 for qemu-devel@nongnu.org; Mon, 16 Jun 2025 23:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uRMdi-0004an-6t
 for qemu-devel@nongnu.org; Mon, 16 Jun 2025 23:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750129532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ELv2X9zhnnOetgXUyB9XbyUdrlWbV7CSRukM0eOt2QE=;
 b=SYJsxBU7W0bEVI/Aw2QnPR/2mm5h/AGrdi6ASQHSeAR+Rkvecrr3iXMal82Lu+c4vg62hH
 poXQmhbenz9lF3tKr6aTeFiNRWacb3apidvFY6I0x1uJlwjtCmafXTwc8fygf8WWiJ08Tg
 YSU/Dk3jO1aaMELM679FSitilQ9tQGs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-I9c08JxWMjar_MGzR6pcAg-1; Mon,
 16 Jun 2025 23:05:28 -0400
X-MC-Unique: I9c08JxWMjar_MGzR6pcAg-1
X-Mimecast-MFC-AGG-ID: I9c08JxWMjar_MGzR6pcAg_1750129527
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4FB7A19560A5; Tue, 17 Jun 2025 03:05:27 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 23F7819560A3; Tue, 17 Jun 2025 03:05:23 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 0/2] ramfb: Add property to control if load the romfile
Date: Mon, 16 Jun 2025 23:05:19 -0400
Message-Id: <20250617030521.2109305-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p7g4ikysl260

Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
the x86 need the vgabios-ramfb.bin, this can cause that when use the
release package on arm64 it can't find the vgabios-ramfb.bin.

Because only seabios will use the vgabios-ramfb.bin, load the rom logic
is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
for ramfb, so they don't need to load the romfile.

So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
device, because the vfio display also use the ramfb_setup() to load
the vgabios-ramfb.bin file.

After have this property, the machine type can set the compatibility to
not load the vgabios-ramfb.bin if the arch doesn't need it.

Then I set the use_legacy_x86_rom property to false by default, and only set it
to true on x86 since only x86 will need it.

Changelog:
---------
v3 -> v4:
  - Set the new property to false by default, only set it to true on x86.
v2 -> v3:
  - Fix the underscore error.
  - Add a new patch to set the property in arm compatibility.
v1 -> v2:
  - Change the property name.

v3: https://lore.kernel.org/all/20250609073408.2083831-1-shahuang@redhat.com/
v2: https://lore.kernel.org/all/20250606070234.2063451-1-shahuang@redhat.com/
v1: https://lore.kernel.org/all/20250605030351.2056571-1-shahuang@redhat.com/

Shaoqin Huang (2):
  ramfb: Add property to control if load the romfile
  hw/i386: Add the ramfb romfile compatatibility

 hw/display/ramfb-standalone.c | 4 +++-
 hw/display/ramfb-stubs.c      | 2 +-
 hw/display/ramfb.c            | 6 ++++--
 hw/i386/pc_q35.c              | 3 +++
 hw/vfio/display.c             | 4 ++--
 hw/vfio/pci.c                 | 1 +
 hw/vfio/pci.h                 | 1 +
 include/hw/display/ramfb.h    | 2 +-
 8 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.40.1

