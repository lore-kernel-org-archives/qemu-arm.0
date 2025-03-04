Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97450njm;
        Tue, 4 Mar 2025 04:50:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9EGWw/05qwDKAVmEAxZ1WnzoVIhxJjBEwNzsZe8lNfpirwwxpd5mCh1w8fQa6x+MBt+aFnCa8A4vcJA==@linaro.org
X-Google-Smtp-Source: AGHT+IHicUSjkv/okJSgU/plDF+1IjMbBd0Ig7AzVL7k5axDpLSzdyXGAjNWojWZkdAUT5YLDvIv
X-Received: by 2002:a05:620a:808e:b0:7c3:c8fa:7aed with SMTP id af79cd13be357-7c3c8fa7c58mr616349785a.3.1741092657072;
        Tue, 04 Mar 2025 04:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092657; cv=none;
        d=google.com; s=arc-20240605;
        b=NKGAUW13UJwjmIdcpqzsOmrl1BVrUq0uqtWNGiTW/zwIeNvTISx3nX3BwN81yI5n1r
         hlAFDpmvgS/9/e9G9b0EDBeMyk55v1rpsY1CIx6QhiuMSMVCqal6RF3O29cldM0ViIVT
         rf4xw0MFL1nOKSGxRFEfAdR2SvL8UbFn8euySBEyC+1yYgfhhXdZZvvd0Snz8nC99mse
         BEEzV16hidurz7/mXSTXFbgTB3SoLXpI0ASvQtHu1Q1AOimJvFYfNnKoX705QS38SdnU
         tdT6R67ICpDkbiIKdFmvCbRc/IwvxEZeVFDiPkQec2E9mOYD6uCmrynW8gJoZOUDwP51
         4Lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HFuM3vvluFlXbR3RV3CtB0B3KpsdU4TGzdRskupJVuk=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=DHotiYOuzQZrd8rHHHNOMHuRAw8O6zLtf/v3w9gSqzIFELPKdsqLDNsTdoNhE1y2P9
         q3hdoE2nFeinQAFw/bpR/jxhhNLr14sI9BJe0z1TqWW7jE6BvTS/B0LON2Jd256PDkAh
         E7HuBJfMD1mZeMvoERqpf5RoCOBEd8VYr3j8M2eCe4o3GRGAZeIn4B5jYyYdk5T1Uwqo
         4xD/VAaIPcVPiBu0cvm+eEIBVp2tzCEjTadCJWpXak6DPnpkk+CjcTa5hO80hBBNHIxA
         AQFuWKpBubDp0tK4+NIcSRhZJeYayQK+60r0ElCw+4Al2zWJDO3yjLdgFxR2RbVUpEAS
         RA+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bf4wynTm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3caefb036si184915985a.472.2025.03.04.04.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:50:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bf4wynTm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tpRhY-0004ix-90; Tue, 04 Mar 2025 07:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhO-0004fz-Kq
 for qemu-devel@nongnu.org; Tue, 04 Mar 2025 07:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhM-0006j5-MQ
 for qemu-devel@nongnu.org; Tue, 04 Mar 2025 07:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HFuM3vvluFlXbR3RV3CtB0B3KpsdU4TGzdRskupJVuk=;
 b=Bf4wynTmWt86ctXXXtroBsAVuMgxnr+OAraFXw5+N3GVDzKnqQ3py7WkVoNQI5V1wUNa/g
 rWVuBNyH1rzqO4s9MDVTVMRF2JRnnQYth/g50S0lynCFc/d/sBXy36xNQikhdBttbypvVG
 TbaW1RKCWhWBERvwA3qGDYdrYGv4efE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-t-SJcrhxOqCP2G7BHvUZwg-1; Tue,
 04 Mar 2025 07:48:21 -0500
X-MC-Unique: t-SJcrhxOqCP2G7BHvUZwg-1
X-Mimecast-MFC-AGG-ID: t-SJcrhxOqCP2G7BHvUZwg_1741092499
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C249180087B; Tue,  4 Mar 2025 12:48:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A1ED0180087D; Tue,  4 Mar 2025 12:48:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 27CB2180038F; Tue, 04 Mar 2025 13:48:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 00/24] Firmware 20250304 patches
Date: Tue,  4 Mar 2025 13:47:48 +0100
Message-ID: <20250304124815.591749-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: obI7Ag0Z2K8V

The following changes since commit 661c2e1ab29cd9c4d268ae3f44712e8d421c0e56:

  scripts/checkpatch: Fix a typo (2025-03-04 09:30:26 +0800)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/firmware-20250304-pull-request

for you to fetch changes up to 2bc10b15deb4b29391628e10b18701bfbcf4be17:

  docs: add uefi variable service documentation (2025-03-04 12:07:05 +0100)

----------------------------------------------------------------
- add uefi variable store support

----------------------------------------------------------------

Gerd Hoffmann (24):
  Add support for etc/hardware-info fw_cfg file
  hw/uefi: add include/hw/uefi/var-service-api.h
  hw/uefi: add include/hw/uefi/var-service-edk2.h
  hw/uefi: add include/hw/uefi/var-service.h
  hw/uefi: add var-service-guid.c
  hw/uefi: add var-service-utils.c
  hw/uefi: add var-service-vars.c
  hw/uefi: add var-service-auth.c
  hw/uefi: add var-service-policy.c
  hw/uefi: add var-service-core.c
  hw/uefi: add var-service-pkcs7.c
  hw/uefi: add var-service-pkcs7-stub.c
  hw/uefi: add var-service-siglist.c
  hw/uefi: add var-service-json.c + qapi for NV vars.
  hw/uefi: add trace-events
  hw/uefi: add UEFI_VARS to Kconfig
  hw/uefi: add to meson
  hw/uefi: add uefi-vars-sysbus device
  hw/uefi-vars-sysbus: qemu platform bus support
  hw/uefi-vars-sysbus: add x64 variant
  hw/uefi-vars-sysbus: allow for arm virt
  hw/uefi-vars-sysbus: allow for pc and q35
  hw/uefi: add MAINTAINERS entry
  docs: add uefi variable service documentation

 include/hw/uefi/hardware-info.h    |  35 ++
 include/hw/uefi/var-service-api.h  |  48 ++
 include/hw/uefi/var-service-edk2.h | 227 +++++++++
 include/hw/uefi/var-service.h      | 191 ++++++++
 hw/arm/virt.c                      |   2 +
 hw/core/sysbus-fdt.c               |  24 +
 hw/i386/pc_piix.c                  |   2 +
 hw/i386/pc_q35.c                   |   2 +
 hw/uefi/hardware-info.c            |  31 ++
 hw/uefi/var-service-auth.c         | 361 ++++++++++++++
 hw/uefi/var-service-core.c         | 321 +++++++++++++
 hw/uefi/var-service-guid.c         |  99 ++++
 hw/uefi/var-service-json.c         | 243 ++++++++++
 hw/uefi/var-service-pkcs7-stub.c   |  16 +
 hw/uefi/var-service-pkcs7.c        | 436 +++++++++++++++++
 hw/uefi/var-service-policy.c       | 370 +++++++++++++++
 hw/uefi/var-service-siglist.c      | 212 +++++++++
 hw/uefi/var-service-sysbus.c       | 124 +++++
 hw/uefi/var-service-utils.c        | 241 ++++++++++
 hw/uefi/var-service-vars.c         | 725 +++++++++++++++++++++++++++++
 MAINTAINERS                        |   6 +
 docs/devel/index-internals.rst     |   1 +
 docs/devel/uefi-vars.rst           |  68 +++
 hw/Kconfig                         |   1 +
 hw/meson.build                     |   1 +
 hw/uefi/Kconfig                    |   3 +
 hw/uefi/LIMITATIONS.md             |   7 +
 hw/uefi/meson.build                |  21 +
 hw/uefi/trace-events               |  17 +
 meson.build                        |   1 +
 qapi/meson.build                   |   1 +
 qapi/qapi-schema.json              |   1 +
 qapi/uefi.json                     |  64 +++
 33 files changed, 3902 insertions(+)
 create mode 100644 include/hw/uefi/hardware-info.h
 create mode 100644 include/hw/uefi/var-service-api.h
 create mode 100644 include/hw/uefi/var-service-edk2.h
 create mode 100644 include/hw/uefi/var-service.h
 create mode 100644 hw/uefi/hardware-info.c
 create mode 100644 hw/uefi/var-service-auth.c
 create mode 100644 hw/uefi/var-service-core.c
 create mode 100644 hw/uefi/var-service-guid.c
 create mode 100644 hw/uefi/var-service-json.c
 create mode 100644 hw/uefi/var-service-pkcs7-stub.c
 create mode 100644 hw/uefi/var-service-pkcs7.c
 create mode 100644 hw/uefi/var-service-policy.c
 create mode 100644 hw/uefi/var-service-siglist.c
 create mode 100644 hw/uefi/var-service-sysbus.c
 create mode 100644 hw/uefi/var-service-utils.c
 create mode 100644 hw/uefi/var-service-vars.c
 create mode 100644 docs/devel/uefi-vars.rst
 create mode 100644 hw/uefi/Kconfig
 create mode 100644 hw/uefi/LIMITATIONS.md
 create mode 100644 hw/uefi/meson.build
 create mode 100644 hw/uefi/trace-events
 create mode 100644 qapi/uefi.json

-- 
2.48.1

