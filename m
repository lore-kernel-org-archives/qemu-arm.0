Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp290376ejb;
        Thu, 1 Jun 2023 02:35:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pM8JUwBY5Gy5xK6BGZedFBmaFPtarBouuYcffMff0Nuvhe4+WyxPYagQpHnT+bG3StvCc
X-Received: by 2002:ac8:5fc4:0:b0:3ef:54c9:9869 with SMTP id k4-20020ac85fc4000000b003ef54c99869mr9465165qta.31.1685612137729;
        Thu, 01 Jun 2023 02:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685612137; cv=none;
        d=google.com; s=arc-20160816;
        b=QbBGgNfEKUyYwme80WvhDcBBAETK1+EfqGUHyiY4pj37GVkKbjbqB0Z+3s5BOLFlUm
         /tL37pXBaFxARr/VB26XGFQwmfDSwj+GnfSMtNXMzu5zFgGzrEqqXQrScSnmglE4QVA3
         sYE/+LHvGz03snh5jLo1VdHflhAvzRGhPZANXwsAWdiiLGjts043wuhSEvYFRrPlPzqi
         WF5iREZeERgJyT2r5fkGz0HODxNVEl2sQxygY8fg1Pe/zaXMda8ULT9hZbCtFswPLbTw
         jpKuPFJ47o1EzTDa7Rwe2C6hItrXkEHXRlAQkFh5GLFQ0/89UZ18/Hjr4RIfL9IgIDMd
         SYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3Zwvv7hRmZE3KagMMUek3a8BemDtxYZcXS3YbhElKH8=;
        b=kY+N5yqJVOVTd5hAMGb+kZpZNVEoxUZPq0+L8oD1OKEmyvaxEL0XiAClvRdtSniHD4
         0jlr4uDo8h9gg6CLRaJirzP5wmUmbBL7K6ze+mLYLayodtulkN3unubZWFJcqnK9VNhp
         jUNtlNTcdobtPXoWRvqRaNBtkkkc4zxAxTlV7e5EyB4+hpz5DECGeB8uh1YigdkJZvnn
         6T50YRJTAEMREzy/z6vI2DCDqo9RaGIENvE287wTIoP5WZBQQTlYFVrLWgdRKbusgRHe
         h0dZy7Npd/jNJZiYd19kIJtG6aAUCA573kwPF+g6yHvWSwwbLxEQR9N7khRmHPK5wbh6
         qVnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZP6BAwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020ac87d88000000b003ef3a821006si9695341qtd.124.2023.06.01.02.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 02:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZP6BAwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4ei9-0007g1-Gr; Thu, 01 Jun 2023 05:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4ei1-0007ex-DP
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:35:05 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4ehw-0008RU-VI
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:35:02 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f3b9e54338so704471e87.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612095; x=1688204095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Zwvv7hRmZE3KagMMUek3a8BemDtxYZcXS3YbhElKH8=;
 b=UZP6BAwmLY10EpomH4dV6egqcE0OD95bP3Jw4lNbeZNHcjkwzZG0637F26+P19yfgP
 xDrT7rRt4PVV2dCqA1v7bpSZVsYA74yWDoKCtrobgIT2jxLRjUTQO++8nReoiiQRtYL5
 3lzBm8J8vPrf4FvUYrRx9KTk1odNA7tiCHbYevFUpN4bFzmqwYiHA4x+FpllWJagdXpO
 pNjUwfelXpi+0qw8x3kvY2hN1Y5IZ/4Uy9Lqi1fFF+57ElvOSuyKyOBp/OEr5NUVA+yJ
 DS7uJVKe+CHhha7Uvg2hD3NPp53OfPZG+otVAi2P2z98XAbIbR7J/RQFC6FL9mjQNld9
 LmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612095; x=1688204095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Zwvv7hRmZE3KagMMUek3a8BemDtxYZcXS3YbhElKH8=;
 b=DrtXDp6DsB6eR+BuGosXnurLjQZQE7U6bIamRqah6KcmpFWk8Fm6SmOEc3PeuLhZMj
 SsiuL6BPei/hC8rY7B3llFEkkHMrYIbPXRzHKvXcR9GSoKVk1kB2F6k2+OWXmuunF36r
 puxLx6RGJ2Qknq877wu0xa94+wV6tYK/pAfujqHkSgkGXmqeCKKhxsQhrGfGyj07oUMx
 qkDv/1URix4osJAtZfEPH21nHjAj9rAcUVloItXMMMZI1idrWEgx9RwfP0g9Ai4rbFY1
 Z20glISdenp0kBjfc+e5QcOKqSkLvd4fwLaY3hPlQhmNcb518MOjFclVFlTicYS+4hDL
 sohw==
X-Gm-Message-State: AC+VfDy3Zn7f1O+eGnNkU125t2QRxK1xa/8v7wUvweY3LO8JGiN/eS2d
 6t80N540DFAossw7lYW8mqxtssg2d9PeItzCeb0=
X-Received: by 2002:ac2:5223:0:b0:4f3:b9b1:5683 with SMTP id
 i3-20020ac25223000000b004f3b9b15683mr897808lfl.62.1685612094720; 
 Thu, 01 Jun 2023 02:34:54 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003eddc6aa5fasm1637449wmj.39.2023.06.01.02.34.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:34:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] bulk: Remove pointless QOM casts
Date: Thu,  1 Jun 2023 11:34:50 +0200
Message-Id: <20230601093452.38972-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: j0nfjsBGWoZL

As per Markus suggestion in [*], use Coccinelle to remove
pointless QOM cast macro uses. Since we have more than 1000
QOM types, add a script to generate the semantic patch.

[*] https://lore.kernel.org/qemu-devel/87mt1jafjt.fsf@pond.sub.org/

Philippe Mathieu-Daudé (2):
  scripts: Add qom-cast-macro-clean-cocci-gen.py
  bulk: Remove pointless QOM casts

 MAINTAINERS                               |  1 +
 block/nbd.c                               |  4 +-
 chardev/char-pty.c                        |  2 +-
 hw/arm/musicpal.c                         |  2 +-
 hw/arm/xlnx-versal.c                      |  2 +-
 hw/display/vhost-user-gpu.c               |  4 +-
 hw/intc/loongarch_extioi.c                |  6 +--
 hw/m68k/q800.c                            |  2 +-
 hw/pci-host/bonito.c                      |  2 +-
 hw/ppc/pnv_lpc.c                          |  2 +-
 hw/ppc/pnv_occ.c                          |  2 +-
 hw/ppc/pnv_sbe.c                          |  2 +-
 hw/riscv/virt.c                           | 10 ++---
 hw/rx/rx62n.c                             |  2 +-
 hw/scsi/esp-pci.c                         | 18 ++++-----
 hw/sparc/sun4m.c                          |  4 +-
 hw/virtio/virtio-mem-pci.c                |  6 +--
 hw/virtio/virtio-pmem-pci.c               |  6 +--
 migration/fd.c                            |  4 +-
 migration/multifd.c                       |  2 +-
 migration/yank_functions.c                |  4 +-
 nbd/client-connection.c                   |  2 +-
 nbd/server.c                              |  2 +-
 softmmu/qdev-monitor.c                    |  2 +-
 ui/vnc-ws.c                               |  6 +--
 scripts/qom-cast-macro-clean-cocci-gen.py | 49 +++++++++++++++++++++++
 26 files changed, 99 insertions(+), 49 deletions(-)
 create mode 100644 scripts/qom-cast-macro-clean-cocci-gen.py

-- 
2.38.1

