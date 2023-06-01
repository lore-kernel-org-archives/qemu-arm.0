Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp392535ejb;
        Thu, 1 Jun 2023 05:15:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bTqaVe0QHvCd1lxf759xZimBGkotyhxD+xeVjmO+5dvonM1qnpKWWAZg17MoADG9XoVkK
X-Received: by 2002:a1f:4585:0:b0:44f:d2e3:1097 with SMTP id s127-20020a1f4585000000b0044fd2e31097mr770021vka.7.1685621738826;
        Thu, 01 Jun 2023 05:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685621738; cv=none;
        d=google.com; s=arc-20160816;
        b=CNEc6tpX6iA/9XojoVnOshr9HJ0zI5hOSK5L/Y7ljUYS+QNWfU157R3ancVHZPyWYp
         HKwfWWgGeh3iX8eVbKEqyAHwfmaCpASZIL6Jf2eI8fB0dJtO3QHusU1zo9tkpiZ1sSYb
         HPN/iWoFTpUu32HDPdYSUyr0lCJIs8uHJgnps2ctVYiNCp2ff0RPanh+myi+GyiG+XTV
         bpCNMhY/7CagTPWYb478fC0ZEtqKgPW8MBenMb/Z98b9SnIZ+B3v7vPuC+e0ck+yGZNX
         PcP4t36Pk2bSkrkoBkyjkBdR3RPEEkoKzApcou1VvMn8x5Z4Aa6x5zjluRXoUgna7VzW
         mqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cNKityIJKk4fsDWWD+cw7VqvMuSsZHYQ4JYdtwxB4TU=;
        b=Hea5uOkHWaw9XF+zgPgOHelcHZ7IRorzXPMYb6Eb8aYxumpMTmYFA/pscpADV7NsP+
         h3G6IAvZjJqfNZDJtqkplvctW52PWtR9tUWSf7mMs3jfFECe0mTphHPcGNZwvJQJG0qc
         npDbQ1GmoGq48K3Jo31pM3SqBhgzXwbDk72oLKI8GMlVQriBrg5H/JXJA0tvTF62v/VP
         4BOrN+jxQjXG1pLrfz3586P2MMI4vs3k9Z/5XgN3xQs2cH50Q3I2PBof2MsaWAudt2to
         WxhtiS2Bo5ZHmfxTSrBRTKBQ5nKSj67CFml3BUC6xW6w4e0E1+iQZPVoViuPjmaN/HkF
         9ZMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f0E4uLQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020ac85951000000b003f6925f032fsi9755468qtz.197.2023.06.01.05.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f0E4uLQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4hCx-0000Xy-8w; Thu, 01 Jun 2023 08:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCl-0000Ov-DP
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 08:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCj-0006Oc-O9
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 08:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNKityIJKk4fsDWWD+cw7VqvMuSsZHYQ4JYdtwxB4TU=;
 b=f0E4uLQtUPaTjH6FeOp+Kik5TYok5x1g2Lj73MhthVDX+qUxtQJvj5tBY7dZ6j6ztLvrF4
 l7yoEr7bLCzMM42Fhdy/gF1L+Bk6vdEBToehduqdKCTxP1ijNiZUxPvwJlfzAOA4DXElXs
 JIcm/QVQscg6lDXNKc1apnCP5aXRuXA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-TC1fEM2SOKyqpo7Wy9Mw-w-1; Thu, 01 Jun 2023 08:14:52 -0400
X-MC-Unique: TC1fEM2SOKyqpo7Wy9Mw-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A2393C14AB0;
 Thu,  1 Jun 2023 12:14:52 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C6C22166B25;
 Thu,  1 Jun 2023 12:14:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v3 00/10] memory-device: Some cleanups
Date: Thu,  1 Jun 2023 14:14:37 +0200
Message-Id: <20230601121447.272487-2-david@redhat.com>
In-Reply-To: <20230601121447.272487-1-david@redhat.com>
References: <20230601121447.272487-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Y4fYuJ1WHCzl

Working on adding multi-memslot support for virtio-mem (teaching memory
device code about memory devices that can consume multiple memslots), I
have some preparatory cleanups in my queue that make sense independent of
the actual memory-device/virtio-mem extensions.

v2 -> v3:
- "memory-device: Introduce machine_memory_devices_init()"
-- Declare the function in hw/boards.h
- "hw/loongarch/virt: Use machine_memory_devices_init()"
-- Use VIRT_HIGHMEM_BASE
-- No need to include memory-device.h
- "hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZ"
-- Add more details why it's ok to the patch description
- Adjust to memory_devices_init() -> machine_memory_devices_init()
- Add RBs

v1 -> v2:
- Allocate ms->device_memory only if the size > 0.
- Split it up and include more cleanups

David Hildenbrand (10):
  memory-device: Unify enabled vs. supported error messages
  memory-device: Introduce machine_memory_devices_init()
  hw/arm/virt: Use machine_memory_devices_init()
  hw/ppc/spapr: Use machine_memory_devices_init()
  hw/loongarch/virt: Use machine_memory_devices_init()
  hw/i386/pc: Use machine_memory_devices_init()
  hw/i386/acpi-build: Rely on machine->device_memory when building SRAT
  hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
  memory-device: Refactor memory_device_pre_plug()
  memory-device: Track used region size in DeviceMemoryState

 hw/arm/virt.c          |  9 +-----
 hw/i386/acpi-build.c   |  9 ++----
 hw/i386/pc.c           | 36 +++-------------------
 hw/loongarch/virt.c    | 12 ++------
 hw/mem/memory-device.c | 69 +++++++++++++++++++-----------------------
 hw/ppc/spapr.c         | 37 +++++++++++-----------
 hw/ppc/spapr_hcall.c   |  2 +-
 include/hw/boards.h    |  4 +++
 include/hw/i386/pc.h   |  1 -
 9 files changed, 67 insertions(+), 112 deletions(-)

-- 
2.40.1

