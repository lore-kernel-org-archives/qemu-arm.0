Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3941190ejc;
        Tue, 17 Oct 2023 07:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeZDCgdzL66Hg+DEturhfSBKlPBl3mrk+k7cpobNaIuUIBCzj0dMRkUCntg3EQHmbYPI7P
X-Received: by 2002:a05:620a:f11:b0:76e:f73d:65ae with SMTP id v17-20020a05620a0f1100b0076ef73d65aemr2571181qkl.6.1697551325222;
        Tue, 17 Oct 2023 07:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697551325; cv=none;
        d=google.com; s=arc-20160816;
        b=UCxrjQN0UTaMMd7Z9wCsHaLAq92Udj5rERWBIajgDKyOEPNRPhOApwvQ0DljIc88yZ
         vRd4sPs+6WWiIFEx6egEgQglq5QKnEyzCgaVs+NYnyTiDrUMQ3AXXnjlpzp7hGruV/al
         zV6STHttIUHeaUuqIDA1Lo1XAkhDdbI0+k2ig59BAYfyTQGey1GiXVC0EwLeqDw6Cp/t
         OpFDcfScHfofE7g9XbFGObRHx5rLYXWy3A32SPjp197Wg1D0ouETCQnKay9KfSwLfvUx
         9P7gdN4oxO44LuUd84Kfo+qn72sAhDdxLvVfkb3wiH1wgjmfxnPim9couONoE8OywABV
         cZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=U07vvwJvdXtod6zAds5vLdaXE9ec4HFeXce7l7flLYk=;
        fh=PkQUf9c5shm23GEgSgwIjaGjrTFXVTBGToef+bFaIfM=;
        b=De/srDMWwsi8jUOX0uiLVmoNvcddJOVA20ZQhgLxdpnJAY4oEEAsiK5NYIA/BkdG4S
         4Sxom09s9C2zPFPfeGXw1gbKnNdTKvrEhKgCGc2H5Zjc/bv84BTkQ3EsaRsoVFC4G2Qf
         73jimyYdspgw7yCIpL7F0l/Z0MSyDbh8U4QOxq4wnWFPwENdWtdBknc0KiZ1QsMN+9c8
         lywd/EnzHhGPFQxq0S0lXqHv8hO3ggZKAQ315LK2m/SVnk+DARkkU8ZeUVJQppz02P1M
         WkGoYWIQcnGeCli0LjYnU2luADnzAXbNTWB3moekAJ7nzxzoZX+8u/tVmcfjQlI4Q8Up
         8hFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AbWopEsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a67f2c9000000b0045471784273si123218vsn.709.2023.10.17.07.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 07:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AbWopEsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qske0-0003jg-10; Tue, 17 Oct 2023 10:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskdy-0003jL-RQ
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:01:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskdw-0008Hn-MR
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:01:58 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4065dea9a33so53620425e9.3
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697551315; x=1698156115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U07vvwJvdXtod6zAds5vLdaXE9ec4HFeXce7l7flLYk=;
 b=AbWopEscAmCuvEamEgZuh8g+L4UlokKMXBg4l7tMC1JyNPtzGDyC8aw7IjaCMXOkTd
 Uy54kYnw69nTvmP6K442zvMiIOnrx+t5sJ0vuYY55AlNMI3E+EQkOBBRf8IJ4YzTIRYv
 LHDEmzGiBXJGfOCg3B+Osxl4z9iThyuRlN5nhwyMphRn1dbmfgVbBVnydoRJ7aKflso8
 CB8Kv8iInY9OR8LiIeLNvvv4Rz/2XtEBt+Wuy756Di9cziH0/1jmuQjwqKdlUTZcKz49
 pzBporv0SbPdo2hG1vqpdkNSVmi1ir0toDCO9MGkLQL87MkjnVUoYzJA+S91HeJpl35c
 6rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697551315; x=1698156115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U07vvwJvdXtod6zAds5vLdaXE9ec4HFeXce7l7flLYk=;
 b=ZajfJkUEhF6rL2hWm73TmKs2CG51vIEC8mF2KSWFkpZK9Rr4gloCOY6vTokqEbVloI
 ANg6pESO1NGnk20CSvlEhnWPW6BLWoNukGQuIgAvxQ8MeYScLpr40jjKXYTzdwaI3gTB
 RIEMDcfkjGDHLzblDvuZ9Z0sVAzR7Sc5jx2NxCR1NO1RT0y4C2QROQowT5utHeAzmYfM
 b4RH1tojoTyXN5KNi2KSnZ/maTsBhGzx4ZlohYWdAsWbWC5IZEwV00Fx9zTTc1emc2sc
 L1KsfID7GG9mIhQcPD1XPuqBp6i5wp2nRakB6NPSqJUFmm6O03veJTfwv2YdZoYtHBK2
 5/DA==
X-Gm-Message-State: AOJu0Yxf3NBQUV2DtEcROgT+2OuEOEuQEcyNLH56RA8ZHGiBaUj40ZyR
 onSNJApR1M4MEi1vrPhCCcWUAQ==
X-Received: by 2002:a05:600c:4f81:b0:405:4002:825a with SMTP id
 n1-20020a05600c4f8100b004054002825amr1794417wmq.13.1697551314609; 
 Tue, 17 Oct 2023 07:01:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 fj7-20020a05600c0c8700b0040772138bb7sm9973513wmb.2.2023.10.17.07.01.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Oct 2023 07:01:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] hw: Few more QOM/QDev cleanups
Date: Tue, 17 Oct 2023 16:01:43 +0200
Message-ID: <20231017140150.44995-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: JP+bCR4C4sli

- Remove a pointless check,
- Use QOM cast macros,
- Declare QDev links statically using DEFINE_PROP_LINK()

Philippe Mathieu-Daudé (7):
  hw/virtio/virtio-pmem: Replace impossible check by assertion
  hw/block/vhost-user-blk: Use DEVICE() / VIRTIO_DEVICE() macros
  hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
  hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
  hw/dma: Declare link using static DEFINE_PROP_LINK() macro
  hw/net: Declare link using static DEFINE_PROP_LINK() macro
  hw/usb: Declare link using static DEFINE_PROP_LINK() macro

 hw/block/vhost-user-blk.c |  4 ++--
 hw/display/virtio-gpu.c   |  2 +-
 hw/dma/xilinx_axidma.c    |  6 ++----
 hw/dma/xlnx-zdma.c        |  7 ++-----
 hw/dma/xlnx_csu_dma.c     | 13 ++++---------
 hw/net/cadence_gem.c      |  7 ++-----
 hw/scsi/virtio-scsi.c     |  2 +-
 hw/usb/hcd-xhci-sysbus.c  |  4 ----
 hw/usb/hcd-xhci.c         |  2 ++
 hw/virtio/virtio-pmem.c   |  5 +----
 10 files changed, 17 insertions(+), 35 deletions(-)

-- 
2.41.0

