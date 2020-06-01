Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2947005lfc;
        Mon, 1 Jun 2020 02:58:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG1I7LrvFyL6PSSI8dUH3cic8PiGau8+LsJhd8OmHuRC2wZSn+5VfYY44xe0ciwR62KqTp
X-Received: by 2002:a25:cb06:: with SMTP id b6mr31159446ybg.470.1591005482835;
        Mon, 01 Jun 2020 02:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591005482; cv=none;
        d=google.com; s=arc-20160816;
        b=uO7mgt/EGqvGjuOXY6hokRvCLdMSYjeboTJEdp7ZSVV+CS31dVrFYjI11vus8X3jzt
         IIe04da+Owlac9Y3THz1T9OWaWtLU/fY7Z3pnBEQE1ajtwvK1YkJgzKPQTwrB0bnhXnU
         Bzs0Y2xCgpR097Y7cC+WjcReDwgYdXIHMdGSe+DOu/qLJ3F0aIlq+glat+UKNZJYP+ds
         0iU6csfLCBth+5JL0DyQChW1bUdxQvIdIwAuRHClkfSJF8pIKp4ZKj7DE4XKrkxylSac
         6w6jl2uQr2BqkujtGy+rZdxxkdL2qIYEfBMQHfUZIoTaXs7UkulxzSh2KLRrRkyEuIl5
         huOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pIV856h8IDKbJSiGhboDFaODzNkh/5/k7bOv0FQhaok=;
        b=GSe7sCzhzqubFZshhbkD10eqwPokdtZ7p5WUosG9GJyh9RrcCQCk9MPIKLUI5yY7o/
         rdg7L9XQL9XQYnVlKJgl+oXuJcumG/dyaJhW/7ZIykw2/hWDe2nwvBPzvAKuH+giRyT7
         bLGN4QuCis8qoTpEn99bv8guNL/vCnPwft+NhJ+iCetRT/LOc0UjYYvUn4O6awib7RFM
         2SYNtFgLwTWH+rHOeU4dBbJYYJyd8W+3qtqxly/aX875L25f3rKMZyhh+TlmVgJz0Abi
         77Gb/kUH95ljx7zioCrgTY1uPynPh3p1EBrJ4+/sO7LvwW7UXC9dHdcV1slPIlbP1GwK
         LgKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7dtP1Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si1124473ybb.414.2020.06.01.02.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 02:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7dtP1Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhCk-000475-6X
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 05:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhCd-000463-L3
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 05:57:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54902
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhCc-0002JU-8E
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 05:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591005472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pIV856h8IDKbJSiGhboDFaODzNkh/5/k7bOv0FQhaok=;
 b=M7dtP1LmvMFjaq2HMAPZyg7Ev1uZkpprG3qBGd8buSJaxBvOdzu2H5XfPiJzISW5YFjYNa
 W0ivNrrb+Is7D9PZwUS9rCEIQtiV5gMZy6z8CqgkAfk6MZiihAlfR6+FZgX+fcHQxd0Gx4
 dStaB9uqAr9jdot4x77+EXLCYKgtxuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-dRRw2bU4PcmvTC1ReOIV-Q-1; Mon, 01 Jun 2020 05:57:50 -0400
X-MC-Unique: dRRw2bU4PcmvTC1ReOIV-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A4CE800053;
 Mon,  1 Jun 2020 09:57:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82C7C5C1B2;
 Mon,  1 Jun 2020 09:57:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 0/4] vTPM/aarch64 ACPI support
Date: Mon,  1 Jun 2020 11:57:33 +0200
Message-Id: <20200601095737.32671-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GgUX+4rFZbvt

Those patches bring MMIO TPM TIS ACPI support in machvirt.
The TPM2 build function is converted to build_append style.
Then the code is moved to the generic part.

On ARM, the TPM2 table is added when the TPM TIS sysbus
device is dynamically instantiated in machvirt.

Also the TPM2 device object is described in the DSDT.

Many thanks to Ard for his support.

Tested with LUKS partition automatic decryption. Also
tested with new bios-tables-test dedicated tests,
sent separately.

Depends on "acpi: tpm: Do not build TCPA table for TPM 2"

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-v3

History:
v2 -> v3:
- Rebase on top of Stefan's
  "acpi: tpm: Do not build TCPA table for TPM 2"
- brings conversion to build_append

v1 -> v2:
- move build_tpm2() in the generic code (Michael)
- collect Stefan's R-b on 3/3

Eric Auger (4):
  acpi: Convert build_tpm2() to build_append* API
  acpi: Move build_tpm2() in the generic part
  arm/acpi: TPM2 ACPI table support
  arm/acpi: Add the TPM2.0 device under the DSDT

 include/hw/acpi/aml-build.h |  2 ++
 include/sysemu/tpm.h        |  2 ++
 hw/acpi/aml-build.c         | 45 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 39 ++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 34 ----------------------------
 5 files changed, 88 insertions(+), 34 deletions(-)

-- 
2.20.1

