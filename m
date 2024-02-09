Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp863646ejb;
        Fri, 9 Feb 2024 08:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfcYE8bUF8bpUAQfJ5Ayqb5aBG4mgJLp1U17k5vP9NbA/1dgbAGbHRvPUI7qaAy7Pd874P4wQrf4m3boxs8iHf2BuCGzCN
X-Google-Smtp-Source: AGHT+IHh5rilq9G7KlEAVuTyqDQDBnqLYIkWFL63KblYi4RYSxCXhaF5QaDQDt2fiDE+sBKg0nAQ
X-Received: by 2002:ac8:5f06:0:b0:42c:53ec:a8f6 with SMTP id x6-20020ac85f06000000b0042c53eca8f6mr2419219qta.28.1707494522122;
        Fri, 09 Feb 2024 08:02:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707494522; cv=none;
        d=google.com; s=arc-20160816;
        b=hkHSrEx9UnjcYakjROO2Q9ZPTB96yCza7DeTvurV8cpQ1UxIP9GXd+OOyekKED+kV/
         64UHLRuFW5VcX53JaYaV1iybOmYKs7QwdC4QY6ZKcGGaxKwM3oXLyVcnP8jwHMl812p+
         h5pdDOYXFA0Llui0owqE2/NorfNP02dhYsuuJscQEr/umBWllPuhDdyeOd9+CWkBikRU
         IQK7bJkkIFG0iqwGI6EvnNcTbFCjiPg9PewcU/BMrrPiUocOQtZftkJWG0NWWWA0kXZG
         yl2n05nygu2CG8TXNci4TPoDNCOm7m0ZpB8IgQdPaqVP6VgKg64hMFVBZCnIbhvXLnFL
         KuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2j1cv9GE/cSVQNx82treSczXBYP5IBlUz2FWE4zgQFE=;
        fh=DUFruo2QyjQDCiPDSJKkuC/I/poQp+Ail32HJ6D32sU=;
        b=GuQQjZCO8NcjJaWLkni7tcaoZHQeXY8feoqQbZJtZxXN+I9t8VQBjLulrIRyu0qACH
         gWnhBm54oOz4rM/qzMnuVxByVifUfnmWLruh/YHSqcSUPP9t2b/OxReAaQpVXpirvtHC
         0WTL9g2HXZSWpv0pUdNZePJbKj2QqEiiQImukH8CosgMOMVGgZaUcNbZesrR1o0sFm2P
         ZfNxRHCPP3MJI00zBnDXS3co9K7JLPOFEG5NTSsk717F+Ap06TZMbx0YZuqSIcSQcy9W
         I5at+svkB/zYzg8UXtkP8vs13ioXsee9+VfOfUCzAnmrxeuIZHLy2HgTHeMo2g4DPHD9
         jv1A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E328EwUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXppCKJiI35MzQHSFRkA+syrOQYXbDgdLoNxfvGwXDfn4gG+gRsRTe6/2PMuI3vqpDFzCCORN0AcUzJuo9mHNkrr6eoTVOt
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac85d87000000b0042c4f58fce4si2067623qtx.48.2024.02.09.08.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 08:02:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E328EwUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYTJD-00010b-9w; Fri, 09 Feb 2024 11:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJC-0000z5-Hv
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 11:00:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJ5-00063v-2x
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 11:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707494448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2j1cv9GE/cSVQNx82treSczXBYP5IBlUz2FWE4zgQFE=;
 b=E328EwUUjbpD8QY5/TRIWjBceT4pWBH0kmsiKHYM9+G8swGP80W6DoaGEFK5LW5NbZoipl
 P01hAX7NNFFkl2CkAt8UZp6D5lhapvm6S492rtRhmKnBaKjLtDGK4Ih+j6TJNtCZC2a+9f
 FZwV3mG32ID9NvABwiCLrC9BfmNKYF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-dZj9QjKKM4mT5zHmXPRRwA-1; Fri, 09 Feb 2024 11:00:45 -0500
X-MC-Unique: dZj9QjKKM4mT5zHmXPRRwA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF0985A597;
 Fri,  9 Feb 2024 16:00:44 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE2B492BC6;
 Fri,  9 Feb 2024 16:00:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, haibo.xu@linaro.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com
Subject: [RFC v2 0/5] ARM Nested Virt Support
Date: Fri,  9 Feb 2024 16:59:12 +0100
Message-ID: <20240209160039.677865-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.269,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: beO8YV/Ii0TR

This series adds ARM Nested Virtualization support in KVM mode.
This is a respin of previous contributions from Miguel [1] and Haibo [2].

This was tested with Marc's v11 [3] on Ampere HW with fedora L1 guest and
L2 guests booted without EDK2. However it does not work yet with
EDK2 but it looks unrelated to this qemu integration (host hard lockups).

The host needs to be booted with "kvm-arm.mode=nested" option and
qemu needs to be invoked with :

-machine virt,virtualization=on

There is a known issue with hosts supporting SVE. Kernel does not support both
SVE and NV2 and the current qemu integration has an issue with the
scratch_host_vcpu startup because both are enabled if exposed by the kernel.
This is independent on whether sve is disabled on the command line. Unfortunately
I lost access to the HW that expose that issue so I couldn't fix it in this
version.

This series can be found at:
https://github.com/eauger/qemu/tree/v8.2-nv-rfcv2

Previous version from Miguel:
[1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
Previous version from Haibo:
[2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/
[3] Marc's kernel v11 series:
    [PATCH v11 00/43] KVM: arm64: Nested Virtualization support (FEAT_NV2 only)
    https://lore.kernel.org/linux-arm-kernel/20231120131027.854038-1-maz@kernel.org/T/
    available at: https://github.com/eauger/linux/tree/nv-6.8-nv2-v11

Haibo Xu (5):
  [Placeholder] headers: Partial headers update for NV2 enablement
  hw/arm: Allow setting KVM vGIC maintenance IRQ
  target/arm/kvm: Add helper to detect EL2 when using KVM
  target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
  hw/arm/virt: Allow virt extensions with KVM

 hw/arm/virt.c                      |  6 +++++-
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 21 +++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  1 +
 linux-headers/linux/kvm.h          |  1 +
 target/arm/kvm.c                   | 21 +++++++++++++++++++++
 target/arm/kvm_arm.h               | 12 ++++++++++++
 8 files changed, 63 insertions(+), 1 deletion(-)

-- 
2.41.0

