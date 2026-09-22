Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AC6C98302
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 21:56:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x98Sr-0002xA-D7; Tue, 22 Sep 2026 17:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Sp-0002w8-UV
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 17:55:47 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98So-0000te-BA
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 17:55:47 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd025d06so233404c88.1
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114144; x=1790718944; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fiJfh6oSUUYoPo7/xcIl4gZOELtkNOzvep6zEerumV0=;
 b=XleCNN+7djyOmaIHCXNgLXOKzIGbPv8CDKi9MfTS3sQY397Cm1KttvCeXWXCR0uazn
 AW7/YiIOUQQZC64ca0x0EIxLV9mrbAKTYA1YNLD0DUCTBN28fSq2TlnyOl+8EzHfrnlU
 SbqJlBYRA1qmt2n1B36EHj/Jcwk6h/Kzkidqs71DegIo8XzuCiwcawHpGNm3x9osGBh2
 uLTI8HW3breBfdCKrw07uQ/IlEeb17/5MgYqKJdS5N2hg5k/fYsuh6rF6JCDmjPY+k2Q
 2ceUpB1R7BZpQflsW7xFeoZ4HEBpvUtIMv3Z1PVVd2Xz4n3TwVmImrwBxhCZqqtzPVqT
 XiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114144; x=1790718944;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fiJfh6oSUUYoPo7/xcIl4gZOELtkNOzvep6zEerumV0=;
 b=FoMmtcvYp16iMjVlsYZa4zZXehaV11gSnRcBSBwJy5epSp1oVxh9KQe76AMUL0x3ee
 tnaCvWnShDGJhsokrkKfpUR60nz2oS1bE7GP8PXT3kOpyxqoDFK4pZwtEq2bQkGT+j6O
 Cg29fJGKd3s45Y6vobvQ3Sid5A5mza3aV87EDiugeHQW3Dqh7poaEv1Rd3GOfYov97M8
 27iDFFrDjhm596zcVmD9G0SLgoAtJ8KnVXpv1/QqwEA722TM5DOoEKBXF9/I2XCD7+Tx
 XSiuGArambpSvWRsJAL0sByzemnkn+EQKtPb99MBORRjijeluw3ZaIanWjyqmFGIoXRP
 xLqg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4p/A8DrjU9IagokozTRJ8gtysGjY7NzkFBUxdiLrf7vMWzuM88x4tdD80qvjpltIXJH1Dp8YmdQ==@nongnu.org
X-Gm-Message-State: AFuF++lciZINnYA1knnK7QSmRZ9qwYqyvIf7P33+N7HNZJ8Nu6vZF78x
 nFLcXffhvFbuDFxZU7Nm84gt0Dzirn/qCS36myBFAT4Kt6WX/BB5Pot8
X-Gm-Gg: AYBFou3g20jyhspkIHfdlh5mQQ/vqdwsl+WQsY329VDIGFZ+ck/ruwrpxz63JUDGuHh
 hT7GjoMK7rcYdIwaOoNimj/Jc5JTJ9i63BJKoch/hm/+5QHHPCHklU3yQDXrqmr5tDSxv3H7vIh
 t71u53pwl9zHf77Or0sFstA5UsDDL70WHyeUxOfnjJhlPGMHcsfHAQa254jbCBL1OlqVkLEKt3f
 jqn/+gGY8EZrdhFzEpk620OPWcLaxaKhb+D1j9G09ABSY/b1nYDGkwH8WNE2VkrIXjaPx5TZjle
 Qoi9M84auIeAKGD7uFmG5SdwWwC/sThba3zFqu4idvxmMWpnLN/P/Y5tfvio0eq2DZU4A6LyJ1h
 gmg8MNTDe3yl5FWk9wY4IwrZXv3MN6jyu/nrQa0liC4gizwomwFz1HXzrAlBWT6ZjEsIo+YJ7Zx
 ygupUcqfdm62uJhLzP9ujpCqzTcBYBvhSh18SBNUXl2VF6GjBQR23h1boK09llBwjkwG5w+WslP
 vYSbbzFIYXKC8U0cGuu41H20zAmmKA=
X-Received: by 2002:a05:701b:4214:10b0:144:fb31:a597 with SMTP id
 a92af1059eb24-144fb31a701mr174801c88.47.1790114144215; 
 Tue, 22 Sep 2026 14:55:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:55:43 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 0/9] machine: uniquify virt QOM names
Date: Wed, 23 Sep 2026 05:55:23 +0800
Message-ID: <20260922215533.641-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Multiple targets register a virt board as MACHINE_TYPE_NAME("virt").
Those QOM types collide if more than one board is linked into one
qemu-system process. This series splits the QOM type from the -M name
so each virt board can keep a unique type while -M virt, help, and
migration stay the same.

- Add machine_class_set_name() so boards can set MachineClass::name
  when it must differ from the QOM type. machine_class_base_init still
  defaults the name to the QOM type without -machine. Document that
  MachineClass::name is the -M name, not the QOM type. Sort -M help
  by that name so order matches the printed names after types are
  prefixed (arm-virt-11.1-machine vs virt-11.1).
- Give each colliding virt board a unique QOM type and keep the
  existing -M name via machine_class_set_name(): riscv-virt, arm-virt,
  or1k-virt, hexagon-virt, loongarch-virt, m68k-virt, and xtensa-virt.
  Versioned ARM, LoongArch, and M68K boards keep virt-<ver>. Latest
  ARM virt still sets mc->alias to virt.
- query-machines returns MachineInfo typename, the QOM type from
  object_class_get_name(), for qom-list-properties. The -M name alone
  is not that type once virt boards are prefixed.

Changes v1 -> v2:
- query-machines returns MachineInfo typename. v1 returned only the
  -M name, so a client that appended "-machine" looked up the wrong
  type for a prefixed board such as arm-virt-11.1-machine versus
  -M virt-11.1.

Yonggang Luo (9):
  machine: allow -M name to differ from QOM type
  hw/riscv/virt: use unique QOM name
  hw/arm/virt: use unique QOM name
  hw/or1k/virt: use unique QOM name
  hw/hexagon/virt: use unique QOM name
  hw/loongarch/virt: use unique QOM name
  hw/m68k/virt: use unique QOM name
  hw/xtensa/virt: use unique QOM name
  qapi: return MachineInfo typename from query-machines

 hw/arm/virt.c               |  3 +-
 hw/core/machine-qmp-cmds.c  |  1 +
 hw/core/machine.c           |  6 ++++
 hw/hexagon/virt.c           |  1 +
 hw/loongarch/virt.c         |  3 +-
 hw/m68k/virt.c              |  7 ++--
 hw/or1k/virt.c              |  3 +-
 hw/riscv/virt.c             |  3 +-
 hw/xtensa/virt.c            |  3 +-
 include/hw/arm/virt.h       |  2 +-
 include/hw/core/boards.h    | 12 ++++++-
 include/hw/hexagon/virt.h   |  2 +-
 include/hw/loongarch/virt.h |  2 +-
 include/hw/riscv/virt.h     |  2 +-
 qapi/machine.json           |  6 +++-
 system/vl.c                 |  8 ++---
 tests/qtest/qom-test.c      | 65 +++++++++++++++++++++++++++++++++----
 17 files changed, 104 insertions(+), 25 deletions(-)

-- 
2.52.0.windows.1


