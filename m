Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35991C98338
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 08:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xANbI-0000aV-Qc; Sat, 26 Sep 2026 04:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANaU-0008H9-G1
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 04:16:53 -0400
Received: from mail-dy2-x2a.google.com ([2607:f8b0:4864:36::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANaS-0006qu-7N
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 04:16:50 -0400
Received: by mail-dy2-x2a.google.com with SMTP id
 5a478bee46e88-3437a48f386so111473eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410607; x=1791015407; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1l68+yaj46pbRfPOttnQxmh79QuevFDMvi1cBw5cGf4=;
 b=pDtmpz55abABeFn5cgAAHTmRBI3ZgKvsaJbHWtbmjtaxrm3m2TENSGd/ysB3G1q/Xm
 +aTW0KJh1Tjyda3G9dbt812E7vhnBKjf4e4x2Po4PQ86wn08II8lN5JvSUHympoBLl8H
 Mw/0VWgmQ4BEesd7uiaW5JkbTQmyaFRba/3Yy6Apbq+/RBAA0igH083D3e9cG9OVZjje
 vWX5niHg7PaMEqzfHDrl0AN7iKgVGfmkFYJyJ5BZww0lkhfP70Z6nfEv6AtTTZu1I8Pz
 ZQtsA+Jlqm6BM/AR/wXegaOLgRJYEN5PWpgWjl/CUf+USPRoVFpxXHQAKDOE/TxzRuXG
 5n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410607; x=1791015407;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1l68+yaj46pbRfPOttnQxmh79QuevFDMvi1cBw5cGf4=;
 b=XvaJjRpnbK6UBidM0qDNkYPBXMCWmGv90nHRpfogZa6gVwyS1WSXUZVr919gU+Sr2n
 DkTf9sv4EiZ1wkDA3DFfNi6OlnZ9vNV14+7vFUrOlIjeGMuNp9zC+aRAoZK8UQKEoq04
 HLnegSzFMMPLc6Ds9FTBmWSJvurSTm1td36muxHXhwrwnFAQS0iQVx5KQMZuTdzGO1fm
 l+JI6Mla1PhrDgk6X7jzkzWcRDdZAMNwlXOJas4VuTIJ5kRYg3WFqvYKyQg2QnA9GEml
 qkeg4CM8l5MhgBmftABIXwdKUoaZNMNE2f1u/KsemTF8uc8eS0gpZfBTas5IJ6Car64l
 Sh1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBweqAo4xA026Er5tqPWaVaO5DTytpxCdcTHChvJxoc4XY0lPjxbolBaGr3ftV9FzTWfRO+18lj3LQ==@nongnu.org
X-Gm-Message-State: AFuF++nv53Pq9UeX1CATch70FRVUvl4HlD+OzASbYcSzG6C+AxMddBQd
 yl8FpxRw3Jo4CzAWUM0tyYKBCf7RF3KlY+sHnNHclDVOtmKuBCLGsuQl
X-Gm-Gg: AYBFou39dvSfCOAeM4VSXusu4DhKZXh4PA6QzvAK/qiAZcXh1l8b/oq86n8gCA+dUWd
 sFFxhRBBaiMiotKRPc9Mjyo6mPW/XuqZl1VkvHak+8fafNUTHmfA9RYdIsL8CrTJ0jWbxtt0ATG
 RGfOhQwFVuy4E+6c5GdR+Pttc/VnEnHeRjz7/qULX39lId29LU6dIwfBJbybp6HZx0lIodwM2UB
 HZ6/bPJyCCiMZo/PjB2Wu6g3VrlFiZRpnNOdnbaznG1grIV8/4CC61OXWHvExI0XfpQ93X6jljD
 9BXTtBa6EW8A1xUE+5Gp1DIHXEMp7RIhXZozOeJnxXKitcejTwFt/AugjloC+H9Tef12nE2sp5S
 W9xA7gB77tqB4Zj1vdDDDaISQ414h67h5/s/9Erj9lYzh3fzVGGJO8IKFS2UO2whS46n3taZ9Tv
 bNdKNVDryUg0DRUxZZk30nsgTmBXz36TJIOwweU/bnQRkBgKoufG3IGFpaXdqO0sM5Gz4XbcaBm
 5mEM6vktt5LdvItnuaktGs6vsqBEM8=
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id
 5a478bee46e88-342705b865cmr3508267eec.1.1790410606665; 
 Sat, 26 Sep 2026 01:16:46 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 08/10] hw/xtensa/virt: use unique QOM name
Date: Sat, 26 Sep 2026 16:15:48 +0800
Message-ID: <20260926081551.29-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::2a;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Register the board as xtensa-virt so Xtensa virt no longer collides
with other virt-machine types in one process. Keep the -M / help /
migration name as virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/xtensa/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..dc5b255b9b1 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -118,10 +118,11 @@ static void xtensa_virt_init(MachineState *machine)
 static void xtensa_virt_machine_init(MachineClass *mc)
 {
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
+    machine_class_set_name(mc, "virt");
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
     mc->default_cpu_type = XTENSA_DEFAULT_CPU_TYPE;
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+DEFINE_MACHINE("xtensa-virt", xtensa_virt_machine_init)
-- 
2.52.0.windows.1


