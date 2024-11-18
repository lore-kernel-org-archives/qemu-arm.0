Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2743053njc;
        Mon, 18 Nov 2024 09:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX71cYAnIFZA6S1J7+L2Gq25/YgEfCIdH16ellV3SmzfWlkIC2G4918giuHGW3dYy6ZpG+IngQ+fqCBUw==@linaro.org
X-Received: by 2002:a17:902:f545:b0:20c:6399:d637 with SMTP id d9443c01a7336-211d0ed9371mr203338675ad.40.1731950661590;
        Mon, 18 Nov 2024 09:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950661; cv=none;
        d=google.com; s=arc-20240605;
        b=MoPOHtcluL9AYt1mZpIzR7HqgRecvwAG6diAvPtHasNUWvIkJaFMlFt5BYL88qdKSY
         z+RZQFPqaQbVnNuuBEdKziBmXB0bBPIaGraEYhU1+bciU4vc15DxTkzzMHCjo9C/xwer
         QJaR+jkPvKZ0wbDwj61lV6m8No6VGPRf4T4trV6vwr0NJQ8Yw3xf8ZIzoNYi3TiH5lSg
         uXpTPXDfLDfZwaPr6YTcE0N1AIAIa8144938rXjndwFSNj0rHPmkR2ioQK22SIC6Y2VL
         cuGaBd0J3E4y8wNoM5CM4eByHy13lG/3zJTSUzqu4KdL2/cnNCMe2AuuUjE/0N7z5FbG
         N/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VBgtkjSEbYTTKzs2OsUJSbyBpcPy82P3Qfcz05KH5DM=;
        fh=NUhK4v8A7vcBbVut3cEFljDtjcHNll3UEepfQQGso/U=;
        b=bp/06k1p7mj8iogoEy46v/1j1uQAZDFmn3j6LOSG6t8LohihOi+xSzBEfzQGdHSS0C
         9ZZJ/rBlY0+u4pPIT5wQ4xfTPoviGAvaE0XLSUMGihPyg92jIRY3c4L50ODpl0LRVlKX
         f2dFhNYRS1YS9gNMmr4gPvqtba2Y9Z7ZOyoYcz0n4A2VkpwPjyOzTpdGsnBnNEAIjhzy
         JAWjMkLjDFvys1RJjyWaAtIBK/YGFLR6Lt10wJUtrS3yDQdYYPu0RDDx0v88H8s69SYg
         +Lie60++89xGFWb2xASbuh5eY1qEkd8d0XxyHpyBdRNdn14fU/J1hqd75kzZ8ZDywy+8
         P2Iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HbMfeTQf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7d05aeasor76767555ad.16.2024.11.18.09.24.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HbMfeTQf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950661; x=1732555461; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBgtkjSEbYTTKzs2OsUJSbyBpcPy82P3Qfcz05KH5DM=;
        b=HbMfeTQfzPxdUBv9hkhHC3OaeH21XSiWy9z1a0jbSpBxa6t473Pr1L520DpSUo/dt6
         aP3TJwhB5v+OXMtK0ogmfL1Q1E+ypPig8oFHFF28SVT7igSC5zA+oKBG4YOlTgfiw/bb
         gJnT+GmpjDBgKcIyYNpGZCxvUBv50PjmxvmSFiMfMnhhq0m4sSOKxU+ojQ5QE4kDDfkh
         Q9ehCaQRfJ+EItEjMBLq/Z64/gc2rwdZaitl35ahEy9xHfBGSlMkpN98KFrnrVi3IWUp
         z+d7JFTAi+f3O9Fj8bC/TxU8WSAHROjsWOBuDuXgxioPASjHxGZsUZtdglKBRMYhezP1
         ZwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950661; x=1732555461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBgtkjSEbYTTKzs2OsUJSbyBpcPy82P3Qfcz05KH5DM=;
        b=CrezUFDniAle2cvLdK0FaWrIt0kKfw15DxGfXVMuAJLQlQf+hmmkMbG02TAFTrnTcC
         mWrAi1YGFzMQOpV7DUjDLr5IJwcFNb7F0vpI2QLhIabqMvdvD+yACOQof2ZqOTeZ1tYp
         eh6W1sV4anAVxVPbIYgx2J+42U79o3II+LNBX+lr/2dg936evXayUmmGzXUMFhAfCaUO
         x3PVx10YjLsLxVM//AbhT4yHtTzhF+0xQ0uLQ75ZlkjOt7ZzlqDIU2ftW2qI/GrQe18y
         wXWn8K/oiXbwzhe9SFSP2X//b5kz7rq4RBQjQEXc3Cz+y8KO9URHwXYvMvWoxo1cZ62e
         vRQw==
X-Forwarded-Encrypted: i=1; AJvYcCWU4Xb0aLRsmwdfdK4LBmbCHB67DJ19X9dKHDk+QCd+gJCf/pqjOBGkDWaFZPQ9zN08x8pFT9pT7HV+Sw==@linaro.org
X-Gm-Message-State: AOJu0YxmF2rdC3fNKE2pPBsYiFUr6sXQc+W4e6wUoZv6rN3Cd+ShO+bW
	cqitJm0jKxpJpDJFXTXFILwaBR9/vb2oKGmXPnDTPZusnoF2Dl1l2q9ahoW8lUCPgw==
X-Google-Smtp-Source: AGHT+IEtfHUwMv6Qgz1+4IxX3nYSm1Xv9+hPyGeTbVfIa6T3JJYCwtxXSq0Y6cpRHlWh5/YdsgTf/g==
X-Received: by 2002:a17:902:d2c1:b0:20c:a174:f77 with SMTP id d9443c01a7336-212348d39c1mr39617695ad.32.1731950660835;
        Mon, 18 Nov 2024 09:24:20 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:20 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 6/7] docs: add a glossary
Date: Mon, 18 Nov 2024 09:23:56 -0800
Message-Id: <20241118172357.475281-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mo5A3fLjSEp0

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/control-flow-integrity.rst |   2 +
 docs/devel/multi-thread-tcg.rst       |   2 +
 docs/glossary/index.rst               | 238 ++++++++++++++++++++++++++
 docs/index.rst                        |   1 +
 docs/system/arm/virt.rst              |   2 +
 docs/system/images.rst                |   2 +
 docs/tools/qemu-nbd.rst               |   2 +
 7 files changed, 249 insertions(+)
 create mode 100644 docs/glossary/index.rst

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index e6b73a4fe1a..3d5702fa4cc 100644
--- a/docs/devel/control-flow-integrity.rst
+++ b/docs/devel/control-flow-integrity.rst
@@ -1,3 +1,5 @@
+.. _cfi:
+
 ============================
 Control-Flow Integrity (CFI)
 ============================
diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index d706c27ea74..7fd0a07633d 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -4,6 +4,8 @@
   This work is licensed under the terms of the GNU GPL, version 2 or
   later. See the COPYING file in the top-level directory.
 
+.. _mttcg:
+
 ==================
 Multi-threaded TCG
 ==================
diff --git a/docs/glossary/index.rst b/docs/glossary/index.rst
new file mode 100644
index 00000000000..a2d4f3eae16
--- /dev/null
+++ b/docs/glossary/index.rst
@@ -0,0 +1,238 @@
+.. _Glossary:
+
+--------
+Glossary
+--------
+
+This section of the manual presents *simply* acronyms and terms QEMU developers
+use.
+
+Accelerator
+-----------
+
+A specific API used to accelerate execution of guest instructions. It can be
+hardware-based, through a virtualization API provided by the host OS (kvm, hvf,
+whpx, ...) or software-based (tcg). See this description of `supported
+accelerators<Accelerators>`.
+
+Board
+-----
+
+QEMU system defines board models for various architectures. It's a description
+of a SoC (system-on-chip) with various devices pre-configured, and can be
+selected with the option ``-machine`` of qemu-system.
+For virtual machines, you'll use ``virt`` board model, designed for this use
+case. As an example, for Arm architecture, you can find the `model code
+<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/arm/virt.c>`_ and
+associated `documentation <arm-virt>`.
+
+Block
+-----
+
+Block drivers are the available `disk formats <block-drivers>` available, and
+block devices `(see Block device section on options page)<sec_005finvocation>`
+are using them to implement disks for a virtual machine.
+
+CFI
+---
+
+Control Flow Integrity is a hardening technique used to prevent exploits
+targeting QEMU by detecting unexpected branches during execution. QEMU `actively
+supports<cfi>` being compiled with CFI enabled.
+
+Device
+------
+
+QEMU is able to emulate a CPU, and all the hardware interacting with it,
+including many devices. When QEMU runs a virtual machine using a hardware-based
+accelerator, it is responsible for emulating, using software, all devices.
+
+EDK2
+----
+
+EDK2, as known as `TianoCore <https://www.tianocore.org/>`_, is an open source
+implementation of UEFI standard. It's ran by QEMU to support UEFI for virtual
+machines.
+
+gdbstub
+-------
+
+QEMU implements a `gdb server <GDB usage>`, allowing gdb to attach to it and
+debug a running virtual machine, or a program in user-mode. This allows to debug
+a given architecture without having access to hardware.
+
+glib2
+-----
+
+`GLib2 <https://docs.gtk.org/glib/>`_ is one of the most important library we
+are using through the codebase. It provides many data structures, macros, string
+and thread utilities and portable functions across different OS. It's required
+to build QEMU.
+
+Guest agent
+-----------
+
+`QEMU Guest agent <qemu-ga>` is a daemon intended to be executed by guest
+virtual machines and providing various services to help QEMU to interact with
+it.
+
+Guest/Host
+----------
+
+Guest is the architecture of the virtual machine, which is emulated.
+Host is the architecture on which QEMU is running on, which is native.
+
+Hypervisor
+----------
+
+The formal definition of an hypervisor is a program than can be used to manage a
+virtual machine. QEMU itself is an hypervisor.
+
+In the context of QEMU, an hypervisor is an API, provided by the Host OS,
+allowing to execute virtual machines. Linux implementation is KVM (and supports
+Xen as well). For MacOS, it's HVF. Windows defines WHPX. And NetBSD provides
+NVMM.
+
+Migration
+---------
+
+QEMU can save and restore the execution of a virtual machine, including across
+different machines. This is provided by the `Migration framework<migration>`.
+
+NBD
+---
+
+`QEMU Network Block Device server <qemu-nbd>` is a tool that can be used to
+mount and access QEMU images, providing functionality similar to a loop device.
+
+Mailing List
+------------
+
+This is `where <https://wiki.qemu.org/Contribute/MailingLists>`_ all the
+development happens! Changes are posted as series, that all developers can
+review and share feedback for.
+
+For reporting issues, our `GitLab
+<https://gitlab.com/qemu-project/qemu/-/issues>`_ tracker is the best place.
+
+MMU / softmmu
+-------------
+
+The Memory Management Unit is responsible for translating virtual addresses to
+physical addresses and managing memory protection. QEMU system mode is named
+"softmmu" precisely because it implements this in software, including a TLB
+(Translation lookaside buffer), for the guest virtual machine.
+
+QEMU user-mode does not implement a full software MMU, but "simply" translates
+virtual addresses by adding a specific offset, and relying on host MMU/OS
+instead.
+
+Monitor / QMP / HMP
+-------------------
+
+`QEMU Monitor <QEMU monitor>` is a text interface which can be used to interact
+with a running virtual machine.
+
+QMP stands for QEMU Monitor Protocol and is a json based interface.
+HMP stands for Human Monitor Protocol and is a set of text commands available
+for users who prefer natural language to json.
+
+MTTCG
+-----
+
+Multiple cpus support was first implemented using a round-robin algorithm
+running on a single thread. Later on, `Multi-threaded TCG <mttcg>` was developed
+to benefit from multiple cores to speed up execution.
+
+Plugins
+-------
+
+`TCG Plugins <TCG Plugins>` is an API used to instrument guest code, in system
+and user mode. The end goal is to have a similar set of functionality compared
+to `DynamoRIO <https://dynamorio.org/>`_ or `valgrind <https://valgrind.org/>`_.
+
+One key advantage of QEMU plugins is that they can be used to perform
+architecture agnostic instrumentation.
+
+Patchwork
+---------
+
+`Patchwork <https://patchew.org/QEMU/>`_ is a website that tracks
+patches on the Mailing List.
+
+PR
+--
+
+Once a series is reviewed and accepted by a subsystem maintainer, it will be
+included in a PR (Pull Request) that the project maintainer will merge into QEMU
+main branch, after running tests.
+
+QCOW
+----
+
+QEMU Copy On Write is a disk format developed by QEMU. It provides transparent
+compression, automatic extension, and many other advantages over a raw image.
+
+QEMU
+----
+
+`QEMU (Quick Emulator) <https://www.qemu.org/>`_ is a generic and open source
+machine emulator and virtualizer.
+
+QOM
+---
+
+`QEMU Object Model <qom>` is an object oriented API used to define various
+devices and hardware in the QEMU codebase.
+
+Record/replay
+-------------
+
+`Record/replay <replay>` is a feature of QEMU allowing to have a deterministic
+and reproducible execution of a virtual machine.
+
+Rust
+----
+
+`A new programming language <https://www.rust-lang.org/>`_, memory safe by
+default. We didn't see a more efficient way to create debates and tensions in
+a community of C programmers since the birth of C++.
+
+System mode
+-----------
+
+QEMU System mode emulates a full machine, including its cpu, memory and devices.
+It can be accelerated to hardware speed by using one of the hypervisors QEMU
+supports. It is referenced as softmmu as well.
+
+TCG
+---
+
+`Tiny Code Generator <tcg>` is an intermediate representation (IR) used to run
+guest instructions on host cpu, with both architectures possibly being
+different.
+
+It is one of the accelerator supported by QEMU, and supports a lot of
+guest/host architectures.
+
+User mode
+---------
+
+QEMU User mode allows to run programs for a guest architecture, on a host
+architecture, by translating system calls and using TCG. It is available for
+Linux and BSD.
+
+VirtIO
+------
+
+VirtIO is an open standard used to define and implement virtual devices with a
+minimal overhead, defining a set of data structures and hypercalls (similar to
+system calls, but targeting an hypervisor, which happens to be QEMU in our
+case). It's designed to be more efficient than emulating a real device, by
+minimizing the amount of interactions between a guest VM and its hypervisor.
+
+vhost-user
+----------
+
+`Vhost-user <vhost_user>` is an interface used to implement VirtIO devices
+outside of QEMU itself.
diff --git a/docs/index.rst b/docs/index.rst
index cb5e5098b65..2cad84cd77c 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -21,3 +21,4 @@ Welcome to QEMU's documentation!
    specs/index
    devel/index
    codebase/index
+   glossary/index
diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index e67e7f0f7c5..11ceb898264 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -1,3 +1,5 @@
+.. _arm-virt:
+
 'virt' generic virtual platform (``virt``)
 ==========================================
 
diff --git a/docs/system/images.rst b/docs/system/images.rst
index d000bd6b6f1..a5551173c97 100644
--- a/docs/system/images.rst
+++ b/docs/system/images.rst
@@ -82,4 +82,6 @@ VM snapshots currently have the following known limitations:
 -  A few device drivers still have incomplete snapshot support so their
    state is not saved or restored properly (in particular USB).
 
+.. _block-drivers:
+
 .. include:: qemu-block-drivers.rst.inc
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 329f44d9895..4f21b7904ac 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -1,3 +1,5 @@
+.. _qemu-nbd:
+
 =====================================
 QEMU Disk Network Block Device Server
 =====================================
-- 
2.39.5
