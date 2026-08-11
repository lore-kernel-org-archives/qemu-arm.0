Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72927C5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:37:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnZz-00005k-Tg; Tue, 11 Aug 2026 10:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnZy-0008WM-GO
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:35:46 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnZw-0001oW-9q
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:35:46 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-8efcef23d21so22073186d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458943; x=1787063743; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nUDoFYam/Cs4djr+4VD+W1090TdsQ0zW6Cv5SU9lt7c=;
 b=D8H7Kj4AW4tN2gP+xyIWGEcTJ9VDeRPfOeXhCVR0NKvfNiTc7ozzhfaTkcexgMN1Io
 CP/RwBQMc87Td1A5itGJLrbgH8IbNI3O96wvqWuxrhlHRBrQuf6JyjCGEyYEPDyhugRP
 /yaylbivvgJ+t95mR2/5eThY/N77iDfOp2m7DsZ1HrM99ZDZvbmteCEiSJm5FlN6SCMu
 ro/bcCcxzw/q9dXhiqMFnH7yQNzGOJ7a/GbfCjzgReCXvMOn9gtg59vUSCwrU6chGcJi
 P4tWWtUv6IRKFx5bdj4LmwXEZNaSN7EgWd2PVvQow41J21LGvpUjv4pdr1TxMpQbl9LD
 IPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458943; x=1787063743;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nUDoFYam/Cs4djr+4VD+W1090TdsQ0zW6Cv5SU9lt7c=;
 b=CNQpBj30nqSkI/KN0uPsssncTxaJfwOcMCk2wiTqKMSC8M8CzgmH1z5Il9ix0Lc15X
 JvmYZEtNYV8IRiQeHAv9pubLLb0sfS5Iky3Nrna1It6T2YE0TzAkwmdu5+nDBKgAUUgl
 44qEbUY/TYFYJPosUonBSxA0qSDJ0f/7PFPTvLmFkhe9D5qFjrknHqIWTF4pmpilrgdd
 MwOHJYJwFcZj3bkwxaHX3+DGDkc8Q/9sYkCp094DqngfX5fnQhvc3DQp9d2qj9CxKRue
 b82/AwwJtADI90/x+/zG5NTXngL7TVc5V9+wDZLU147Ooz9rNzqzByrwM4HBR4dPp5J3
 SpAA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqO353X58yTui97xeJ9Yq2ffvjaNZTXOiMdpcMeddhca78wSfkN5RCc3oLP1Kr9HaV4VehhJkgHsQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyp/ryezVQVA0myZjI1DCMUUeM8TqcPO+jOztkL8IRPLzV4wJ0i
 Jc/1xvtoboeRkVaFagcNtaoUzpzzdk/ZY9yOxFjb/vVJDQ72nLBHW+Ny
X-Gm-Gg: AR+sD13Vb+NwerJUgu/IVq2gwfR/+uNqZsZ8ZClhw28xyHKPbF11LrrSt/q2QzU6Zza
 0Gj2QH4DbPaFSXjW4onY7MpToC/tNMyCmnE+g4oekVtiQ+BhvA8aXb0MFt7iDJ0Quil1CrVgDBx
 E37zg70wroyqrUzPLGzNaJ/t7zeEMdcCuUimkjwMMM4U5THxvmUYprc5a5Una3B2/I8izEjfOxE
 hzHtfvF0SEM+q9Rq9hARHzC6RUUuubDR1g0REGGeWCxxEFS1MfhDYAd+02wNhrvFGi+JjVVkPKw
 4lJx1bMDDOZ/+06h8Yf6Y2yql0kB07Ehpmrzz+kyLxKW+jutqDSrlJjJ5/NMRPhSZU3mQeLEK2b
 wIviQtPDcseon08HVNGU6bxN3tCa9r3S0FcTETJxLNnzB8SMDI5CeDV9Cr7dg6ohTC8qknoBJrT
 onnGYJINk4B1cTUzafF5iKWH7S0Tc5SndG2ITHbIbwcakBfFShIo43SdFZxSSjaGTGIAUoPW6P2
 I56LGeJab9Ij80aqzY=
X-Received: by 2002:a05:6214:540e:b0:8f0:5b55:1f64 with SMTP id
 6a1803df08f44-90a66901679mr36615686d6.20.1786458943057; 
 Tue, 11 Aug 2026 07:35:43 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c3ec565sm376396d6.43.2026.08.11.07.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:35:42 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v3 1/2] hw/arm/raspi4b: fix guest never seeing more than ~1
 GiB of RAM
Date: Tue, 11 Aug 2026 10:35:38 -0400
Message-ID: <20260811143539.7835-2-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143539.7835-1-marcelomanzo@gmail.com>
References: <20260811143539.7835-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

raspi4_modify_dtb() decides whether to add a second memory node above
the 1 GiB peripheral hole by checking info->ram_size -- but that field
is the boot loader's RAM budget for loading the kernel/initrd/dtb
image, itself always capped to at most UPPER_RAM_BASE - vcram_size by
raspi_base_machine_init(). Since that capped value can never exceed
UPPER_RAM_BASE by construction, the condition was never true for any
raspi4b configuration, and the second node was never added: the guest
never saw more than ~1 GiB of its nominal RAM, regardless of the
machine's actual size.

board_ram_size(info->board_id), computed one line above in the same
function, is the value that was actually needed -- the board's real
total RAM, not the boot loader's own budget for where it's allowed to
place the kernel image.

Confirmed via direct measurement inside the guest ("free -h" /
/proc/meminfo) on raspi4b's default 2 GiB configuration, before and
after:

    before: MemTotal:  943524 kB (~921 MiB)
    after:  MemTotal: 1905824 kB (~1861 MiB)

Also verified against two real, unmodified Raspberry Pi OS releases
(Debian 11/Bullseye and Debian 13/Trixie): both now report ~1.8 GiB of
usable RAM instead of ~900 MiB, with clean boots, working SSH, and no
kernel errors on either.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/raspi4b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index b92840e1b6..821ddb42ed 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -64,7 +64,7 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
     ram_size = board_ram_size(info->board_id);
 
-    if (info->ram_size > UPPER_RAM_BASE) {
+    if (ram_size > UPPER_RAM_BASE) {
         raspi_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
     }
 }
-- 
2.47.1


