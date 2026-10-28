Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BC7606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIOhhslW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA4G-0004vH-A4; Wed, 28 Oct 2026 16:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4E-0004uV-Mt
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:14 -0400
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4B-0002C2-LB
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:14 -0400
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-369f33df08eso2610333eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218570; x=1793823370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pwlfz+Y06nPj/X9BMLcwEjj0c0qHWsfGuPy/DPtVRRE=;
 b=zIOhhslWLAzPd8FlE1LdgaHO52kREfDMx2LSUGPwNWc25i7f95dZkYXW4FBL/zFGg8
 rgFNPlNniXSovHH1VOEKc8FmeZff6L9OhaRtJEr9MShWzmDe/eFDSgY1l+PjTLUKeZx1
 nrYhXHEB2cvtUYEBOcw5dk3mKwdXG6hGYSIinYaK2Fg3qdQ5bydWOL/u17Aj0itEUAgo
 /V37LhtKDn0lXfFnH6yXS50hKwXYv7/QbzIT4YRBOFML+1inToMuLg+QmBXI0NF12GRL
 KpBJ9bSpy4smxjwrL+uihoq+sGBjkSbUUKCHnLriCeQ7D4FPepsGlCBmfPcYs5RTSkme
 y4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218570; x=1793823370;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pwlfz+Y06nPj/X9BMLcwEjj0c0qHWsfGuPy/DPtVRRE=;
 b=ZnhnI+LJaPlO0HzKDiwmYTV5yjHDwJOyM4+8dCI+T5NG8Lli6tv9tlYDIqaRVSEaM+
 WVM/STv8fsloV6iJGmtCfbNOZBYc54UQ5YW+ztNItbJWuf/RgW79KfHWcRDSuGCRe8H7
 d2y1MCtPsivQfS/q8b336L9i88I73SEFV/srRmZEcXjmTuCWctc+gwbVlkn2WhoEq1xk
 VTjM8rl/OuRc6WuL6wuU5meOyqaKa5ScC6pwgfWvvh1YdvdmIfXIBo3jwKse8ZMhiACj
 gRujWYm7XdMv3x1vI54I4GN2mEsF0qtUFy9eRZhiHPs7EpbVJ+gKNkwPOLwUyZ82bmYP
 cWzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwe2P3p0Ea4ijn6Ul86qfIPRJ3eGQEpG/Uou0NjRaxUAhIbbrXBQ10r9tFmx3vblLVUfI2K02NrQw==@nongnu.org
X-Gm-Message-State: AFq9FYJdHbXti32P72VWK8eInqRdoZ/gkFR8PPm8AED36mtJWA9SxF3l
 AWfr+CKcGTWaL1zRJodlBr3OPD3SLeghrLvBY1akDveUyz5KNsRnhs7e
X-Gm-Gg: AYBFou1tD6Y9ZYM1BEZGb7xPTk291G3Maw+hWVSFxmoLvyW3TjVFlU62+H+xZue3y/v
 Kt5Inw971uBFJyXhoEhCtantO1eRhpG4eJrx0s2vXvNoa7eCHbKC7zI8HeMRUZifM4nYAYqs6Fk
 xaiRopLQLQKdFKjXFNpiayEtELZcXHsloKmnmARgqQuS9WUBrmmkp8YF3bpv055TozGnXStUiy4
 OXEc8GkapOGm+I71s9hIJGeiFnGU4q7eEnnmxXImJ7T/PgbYuAmlJjSayzvrA/4QiTZvkWOMs2V
 UVcRqmjnE+r1VGu2wvyBNFurIDwgJgUE0YQG8OJufkLokAWk3cotLMu+zIMZpwBGWXpFyfFCaig
 D6mqUSaXfGz73cKKRoNld4Ut7vAf0BJI9h+1c6/tkegloWupEd3zmHs6OcAK1zTWuPwJjyxa1iY
 UIB/X7iu1kJ/Sk4kwHcgUHRUZun7S5T/Ipd3U/kmmh814rwhWL0uXMac+YAomIQWmIJnIIOkrKV
 qsbNNjaRQRCPxz53ZAWbrf86ajmVA2yJR07UuZ8ovjbIBZhhHhYQqN998+uLJpE7MarWoOUtjYZ
 div0RzAMl5VTj1kDg3sUx/jLFoxmxh8RFL3jnOCOncKUTKEH
X-Received: by 2002:a05:693c:88da:10b0:36a:12c4:8bd6 with SMTP id
 5a478bee46e88-36a20108070mr4792753eec.22.1793218569611; 
 Wed, 28 Oct 2026 13:16:09 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:08 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 00/12] qom: resolve type name conflicts,
 avoid target_info() in class_init or type_init
Date: Thu, 29 Oct 2026 04:15:44 +0800
Message-ID: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132c;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The goal is a single binary that links several targets, where every QOM type is
registered once for all of them. Types that share a name go into one bucket per
name, each variant tagged with the targets it serves, and the selected target
picks the variant at lookup time. For that to work, registering a type and
building its class must not depend on which target is selected.

Today some class_init and type_init functions call target_info(), directly or
through helpers such as target_s390x(). The result is fixed for the one target
selected when the class is built, so the other targets never get their own form
of that type.

max-v8 called target_aarch64() from its type_init to pick an instance
initializer. scsi-hd, scsi-cd, virtio-blk-pci, virtio-net-pci and virtio-mem
called target_s390x() or target_arch() from class_init to add properties. The
PetaLogix machine called target_big_endian() from class_init to set the default
endianness.

Instead, each target-specific form becomes its own TypeInfo under the same name.
Its is_available callback says which target it belongs to. Today QOM registers
only the one that matches; a bucket can later keep all of them. LoongArch and
Xtensa virt machines are handled the same way, since both share the virt-machine
name. PetaLogix keeps one type: its endianness default is "unspecified" until
the machine starts. A few target_*() helpers are added for the new callbacks.

Yonggang Luo (12):
  target-info: add target_loongarch()
  hw/loongarch/virt: select virt machine types with is_available
  target-info: add target_xtensa()
  hw/xtensa/virt: select virt machine types with is_available
  target/arm: register separate max-v8 CPU types for arm and aarch64
  target-info: add target_not_s390x()
  hw/scsi/scsi-disk: register s390x scsi-hd and scsi-cd variants
  hw/virtio/virtio-pci: pass is_available through
    VirtioPCIDeviceTypeInfo
  hw/virtio: register s390x virtio-blk-pci and virtio-net-pci variants
  target-info: add target_base_i386() and target_not_base_i386()
  hw/virtio/virtio-mem: register legacy-guest variant with is_available
  hw/microblaze: defer PetaLogix endianness default until init

 hw/loongarch/virt.c                      |  3 ++
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 11 ++++--
 hw/pci/pci.c                             | 13 +++----
 hw/scsi/scsi-disk.c                      | 43 +++++++++++++++++-----
 hw/virtio/virtio-blk-pci.c               | 22 ++++++++++-
 hw/virtio/virtio-mem.c                   | 47 ++++++++++++++----------
 hw/virtio/virtio-net-pci.c               | 22 ++++++++++-
 hw/virtio/virtio-pci.c                   |  4 ++
 hw/xtensa/virt.c                         | 21 ++++++++++-
 include/hw/virtio/virtio-mem.h           |  2 +
 include/hw/virtio/virtio-pci.h           |  1 +
 include/qemu/target-info.h               | 35 ++++++++++++++++++
 target-info.c                            | 37 +++++++++++++++++++
 target/arm/cpu.c                         |  1 +
 target/arm/cpu.h                         |  1 +
 target/arm/tcg/cpu-max-v8.c              | 16 ++++++--
 16 files changed, 231 insertions(+), 48 deletions(-)

-- 
2.55.0.windows.3


