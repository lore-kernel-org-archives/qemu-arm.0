Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A667CCD183
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 08:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7UmL-00019u-C7; Sat, 11 Oct 2025 04:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Um5-0000xk-Ps
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:16:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Ulw-00073q-Ta
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:16:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fadb4so3176723f8f.1
 for <qemu-arm@nongnu.org>; Sat, 11 Oct 2025 01:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760170567; x=1760775367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OxOXkUWjbNfdgOyfCO31w4sh83bWsOK8NhWXhJg34z8=;
 b=kdK6OKYf8AAtftMsy7H/7IPNXNPtrYuj5l3KtKZz3GTXIA70jeQYMKLjdVuqnu9Dws
 kgGTDcFBeyUsVEffzT09o07lkuLUELgZ7OadgJ+PDORZRd25nWlYGmBLeY7xL9wF7QdR
 kK7rSKxnMih/k9OCnd5ngkag6OGXohT9faY+0mpKUuQ3/aBT8tfpLRD/Ipsby2RxXpFU
 Le29GxgHhAdy/6RGLQRd8NUJNJGUvAxtcaT49d3SrM/EGsy4UZIqKZeAu+OX+c5B7V2U
 4rBDQtaYpqQ80IfJjD5SXtfWlWgDTcSjyBieCGjY9n86W9f6w8uiYLCXaoOTZ9CRMs7/
 QUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760170567; x=1760775367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxOXkUWjbNfdgOyfCO31w4sh83bWsOK8NhWXhJg34z8=;
 b=qoYN5as7opvUytBFh3r1sF/HSklFIyJFQNEzuN3hUoFq6jHMj/Fe2Bpqa4nTY331sQ
 +5TMgERvyTsZsY/yYfB//c3PwhR41bJ+tBnwBBeuH73DohImuCKlEIKV6zencGptAb90
 4utEWal2OOG3ChhmPTXde12zIAlMKN1Ohh/S3ROqX+o0L1nz9Z2+IRz8ADVzzU0j79Ks
 DbycMfp8YHY2HIhbQm7OoDpPk1UIqTgQl7uRrBMJE26tHMZvpatWEjzYVzr3jT+EMMNv
 g/5d8NkYUMuzhxN6eMA7cr+5VvWaLImmsly0b6gNWGv/V5Wx5r/yLe+rI4JNoIVYVcNf
 sBOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3aQgvDc3s0iZZOSeNQCmfaVPhuWI1Elzc3XelI/e1IET8ygm6FwUld2WygY4Ui6uxNpOVc2x5Fw==@nongnu.org
X-Gm-Message-State: AOJu0YzWhNCXGYoS6hViwjyCJWTJRsfhPC/QlhK80LcBiZUob4DJ/J7V
 If/TQ5RyaCUCeJolBY5HUydZGOTXeJqXnwKU5bSE4J9uLf3n8IPQS4Eb
X-Gm-Gg: ASbGncud5U1dKv60b61NoVVSkw8NB6eOca590i+NrLWZm7MtCc/NdHDhZ0TyTR55NcY
 ekA0chwwj3yCuihnwSqh4Vi6ZyXJFpTAAHRa3wQelDN616/e7/9EtrQBD0jj3RUqGrlZb3rpo6z
 7AvMH+GdhHwi1eKadSMCKkC65Wzl0uhpbnc9QaP0KxB+fnlXu9BBIOSWXJlSftQyMf089zRaU6E
 VqgBVpbUti7AkA7Gk3pyoOpD3IXc891XaYSeiLXkklMD4iOv8GVoGDoaJcvmfud2CX+2uBIbrmh
 XTqjUbNgKUBvQqWfRi+/q+54frpbbqq5OBihVHDOZDvdB4TGmMrgs0IB9IGVTAmGL4iGQB4LO2n
 MFII6kTFEqM+YYtL/UaVHnSvQJQNaqxASRF1N5RENDDgqh5EYV87MgibGuy6y4YJT/OMZwqwhMS
 86zmuT8Q33maKIO0ImkilOpF8bWMD/PiwNBNBCtcZsQw==
X-Google-Smtp-Source: AGHT+IHTcpxK5cFzuKPOX4FeMpZjndK3JzxDXfildK7XdebrPdpLZjQm8nFu5O1ULX1kwsrpeagp0g==
X-Received: by 2002:a05:6000:18a9:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-4266726dceemr9814866f8f.14.1760170567411; 
 Sat, 11 Oct 2025 01:16:07 -0700 (PDT)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm8045969f8f.32.2025.10.11.01.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 01:16:07 -0700 (PDT)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH v3 0/3] Add support for zboot images compressed with zstd
Date: Sat, 11 Oct 2025 10:15:50 +0200
Message-ID: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Fedora arm64 has an EFI_ZBOOT kernel image compressed
with zstd. Let's make sure we can use it for direct kernel
boot with qemu.

Daan De Meyer (3):
  Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
    LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
  Use g_autofree in unpack_efi_zboot_image()
  Add support for zboot images compressed with zstd

 hw/arm/boot.c       |  2 +-
 hw/core/loader.c    | 41 ++++++++++++++++++++++++++---------------
 hw/nvram/fw_cfg.c   |  2 +-
 include/hw/loader.h |  2 +-
 4 files changed, 29 insertions(+), 18 deletions(-)

-- 
2.51.0


