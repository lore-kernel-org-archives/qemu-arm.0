Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462249njb;
        Thu, 5 Dec 2024 14:22:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDEimWNnxeqYZV+nuS7tyHZ9X3dsogvsshTXEA7LNYg64feROM41po9htdodlGxhXJnr0+KR3CucoAaA==@linaro.org
X-Received: by 2002:a17:902:e888:b0:208:d856:dbb7 with SMTP id d9443c01a7336-21614dcd826mr4596005ad.39.1733437376347;
        Thu, 05 Dec 2024 14:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437376; cv=none;
        d=google.com; s=arc-20240605;
        b=UBU3Z03TJVtvG0msERd6uatTyCV/bJycWDc4Z87ZXEHlUm7WA6VTFtMIcs0LIGBsai
         tPWcbN56F7d8UYJcXuCaSuDwSoEQSuD11kFndOp/odnPH1aXTAZ+o4OCw1xw2HKR1XeE
         FCfmGQs/8tU9cEAxixlEc2s4iqEJt8UIs3kTBIPK9q11GL2PjFiULJlidJpfoq/gPrpw
         fxRsX1mhQehGPMHH9jdZFcBRX/cANWPJTOUVVQRTqBYYaZ4q4gZP0g7lBuJ8lRoTqs/H
         Ssi8Ls+AKf1MCng7xyjt+3+Y6TFnIyKYdQeqtWVzwC9R1sva4BiIMrwS/Q9rA8rjh2oN
         5Jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=quNdZOi6vs/DfPqpA5a+RAcvgntK93hl6bq6i2nnsOE=;
        fh=xQERbvdye+aDLfTaapJ5PQ3ISZ7JhN7JvHJASCdOWms=;
        b=kLwOdmeSPkKLOYjy7Yw9zkRF/XG2B/Umv8aAoZQZ5CUPLN99sYEI0NeWsCTlkUD+ZT
         6KrTaDf4wr3bBhCAndiUZUjuSvUVYoa3JjccG/YCIEvTXJPDUgzPu/NzTL77JHm+X8w2
         Dx1z7G+qeX/zEMjZyC3ERNvsGWECYk9oUbAFjL+rNrkBuCNY4AFstndfVU9XYIiGgTuM
         SYeDcLRyUBjqil+FrxMNf3jZFpjdmkdVUR2h+BXhtcfGDR3lk2x+TLurUx11yp75TSm5
         wT7LgmPSha1NtKnsSb8V00ezpAFzYn4KU7G3pvtqeN+aXtU7b4sUDRRbnJP0fSMWkiD9
         y/hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AydFUkNu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8ec837dsor17969265ad.9.2024.12.05.14.22.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AydFUkNu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437376; x=1734042176; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quNdZOi6vs/DfPqpA5a+RAcvgntK93hl6bq6i2nnsOE=;
        b=AydFUkNullKar/CSQExgzEJijbzFuuhvl0HcxQ+0S+KPCRafL9RwCF36H5fsrTpaW2
         CZ7xCcOg3thXUV0JBTMKScweSxWaFnbrRFF8nuiD/TpuzPjyzcRh4uCTQi/YJyfEBVDp
         Ntmkgf+WCYBdfMHMN5iZpuA5SMHQP7Cya04Qkl3ZokuPMHhEiTwYUQdZwDEdzTEIHERq
         JNJU9cK/uhqSQSlVtsrTDm+7GRvo/K5C2EVf8cViTaihXetQ9SeHFLkgN3Na3Kein9Dy
         +ykeo+/9xYqQP3iV9XASIgEmFB6WlvoqmFzx/Ok9YMxnQFU2vKjGWIk080fPg4BzSJhG
         GoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437376; x=1734042176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quNdZOi6vs/DfPqpA5a+RAcvgntK93hl6bq6i2nnsOE=;
        b=hSAfDwaUsICkdIZ8GqKeEX0P1xcjAE2fK8bZxZGIy/1LSMg3eICDiUb9COROAOL2CT
         VGQ6vJNP694+hPcqqsYu8W88YaeP6/Z+RfO2r7q2qUMPBzsX/4wBHBOZm0nYEJEK/gme
         3eBLlwexbZfhNUe/V5wfYY75DCV1MEy+iQod+48JrD9XEUhgUlDmtmkq5z7+Bqb42E6e
         pl8zzmsNIC05VMVLkQKS03KGcmJLd2wzGUwiIjMfLhglEoah+2ga1PnPtRbaV7LsWh6L
         ok3CLgXSyyQ201GUVsmhe59MzJYPxpGRA9RJyK9v+E2D1Np88vpRFpM4cSNMqbrzPQiO
         lcfw==
X-Forwarded-Encrypted: i=1; AJvYcCXxi0Tv5aZdBzB1wqonDzEllAZ65EIvhbD2UscGCbSp9j6xN2MyDYuQVlEpaGE9FKys9QhqEB26iMfZ1Q==@linaro.org
X-Gm-Message-State: AOJu0YwyTg4YA99aF5Bm37qBS8KJ//WooWsLHsYjzPKdtLVNJEiAWOTZ
	eE9aHW3j3SKDCyNnl/CQARCXGJIoN02/dpf7S/XOtYI42nB1DAFGuc1oQfAwFHaPAw==
X-Gm-Gg: ASbGncsf1P6EwB+f/8urQAvvhhEpNCsIIcnUYcm+HlJe3OoxvIO1BEHUR5wixKQ+PXy
	B+GoRztmuM5Al5OM+sP+FKv1BqYLNxfbA5qXLFtbJFlp27M2F8AZi4ou0oub83JLmypATeE9jVG
	av3qrPFEjK5/AHAAcBikJwiLAGYt3Yb62HPk+kELKxB7typmASlehvMo91QgQHcrdHYD5s8c2qG
	SNAABqIh9uDTsE6dKYjIpcqr8SoNIUhwnaJoCstQLGd7ci+kbU/kcKZbSrzzvM7OUT1mgnIKJYP
	LmGwSFFM
X-Google-Smtp-Source: AGHT+IGxrEzNdHCY9p3nI5Ms6sVCuD31aqxjxI6slOF9WgZZXewzF6L6NV8Tgvt2851VlTVvJfDYVg==
X-Received: by 2002:a17:902:e888:b0:208:d856:dbb7 with SMTP id d9443c01a7336-21614dcd826mr4595785ad.39.1733437375699;
        Thu, 05 Dec 2024 14:22:55 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0b571sm17310435ad.183.2024.12.05.14.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:55 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 6/6] docs: add a glossary
Date: Thu,  5 Dec 2024 14:22:41 -0800
Message-Id: <20241205222241.3789437-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QmTnlKrB2EKb

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/control-flow-integrity.rst |   2 +
 docs/devel/multi-thread-tcg.rst       |   2 +
 docs/glossary.rst                     | 280 ++++++++++++++++++++++++++
 docs/index.rst                        |   1 +
 docs/system/arm/virt.rst              |   2 +
 docs/system/images.rst                |   2 +
 docs/tools/qemu-nbd.rst               |   2 +
 7 files changed, 291 insertions(+)
 create mode 100644 docs/glossary.rst

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
diff --git a/docs/glossary.rst b/docs/glossary.rst
new file mode 100644
index 00000000000..693d9855dd1
--- /dev/null
+++ b/docs/glossary.rst
@@ -0,0 +1,280 @@
+.. _Glossary:
+
+--------
+Glossary
+--------
+
+This section of the manual presents brief definitions of acronyms and terms used
+by QEMU developers.
+
+Accelerator
+-----------
+
+A specific API used to accelerate execution of guest instructions. It can be
+hardware-based, through a virtualization API provided by the host OS (kvm, hvf,
+whpx, ...), or software-based (tcg). See this description of `supported
+accelerators<Accelerators>`.
+
+Board
+-----
+
+Another name for :ref:`machine`.
+
+Block
+-----
+
+Block drivers are the available `disk formats and front-ends
+<block-drivers>` available, and block devices `(see Block device section on
+options page)<sec_005finvocation>` are using them to implement disks for a
+virtual machine.
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
+In QEMU, a device is a piece of hardware visible to the guest. Examples include
+UARTs, PCI controllers, PCI cards, VGA controllers, and many more.
+
+QEMU is able to emulate a CPU, and all the hardware interacting with it,
+including `many devices<device-emulation>`. When QEMU runs a virtual machine
+using a hardware-based accelerator, it is responsible for emulating, using
+software, all devices.
+
+EDK2
+----
+
+EDK2, as known as `TianoCore <https://www.tianocore.org/>`_, is an open source
+implementation of UEFI standard. QEMU virtual machines that boot a UEFI firmware
+usually use EDK2.
+
+gdbstub
+-------
+
+QEMU implements a `gdb server <GDB usage>`, allowing gdb to attach to it and
+debug a running virtual machine, or a program in user-mode. This allows
+debugging the guest code that is running inside QEMU.
+
+glib2
+-----
+
+`GLib2 <https://docs.gtk.org/glib/>`_ is one of the most important libraries we
+are using through the codebase. It provides many data structures, macros, string
+and thread utilities and portable functions across different OS. It's required
+to build QEMU.
+
+Guest agent
+-----------
+
+The `QEMU Guest Agent <qemu-ga>` is a daemon intended to be run within virtual
+machines. It provides various services to help QEMU to interact with it.
+
+.. _guest:
+
+Guest
+-----
+
+Guest is the architecture of the virtual machine, which is emulated.
+See also :ref:`host`.
+
+Sometimes this is called the :ref:`target` architecture, but that term
+can be ambiguous.
+
+.. _host:
+
+Host
+----
+
+Host is the architecture on which QEMU is running on, which is native.
+See also :ref:`guest`.
+
+Hypervisor
+----------
+
+The formal definition of an hypervisor is a program or API than can be used to
+manage a virtual machine. QEMU is a virtualizer, that interacts with various
+hypervisors.
+
+In the context of QEMU, an hypervisor is an API, provided by the Host OS,
+allowing to execute virtual machines. Linux implementation is KVM (and supports
+Xen as well). For MacOS, it's HVF. Windows defines WHPX. And NetBSD provides
+NVMM.
+
+.. _machine:
+
+Machine
+-------
+
+QEMU's system emulation models many different types of hardware. A machine model
+(sometimes called a board model) is the model of a complete virtual system with
+RAM, one or more CPUs, and various devices. It can be selected with the option
+``-machine`` of qemu-system. Our machine models can be found on this `page
+<system-targets-ref>`.
+
+Migration
+---------
+
+QEMU can save and restore the execution of a virtual machine between different
+host systems. This is provided by the `Migration framework<migration>`.
+
+NBD
+---
+
+The `QEMU Network Block Device server <qemu-nbd>` is a tool that can be used to
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
+.. _softmmu:
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
+The `QEMU Monitor <QEMU monitor>` is a text interface which can be used to interact
+with a running virtual machine.
+
+QMP stands for QEMU Monitor Protocol and is a json based interface.
+HMP stands for Human Monitor Protocol and is a set of text commands available
+for users who prefer natural language to json.
+
+MTTCG
+-----
+
+Multiple CPU support was first implemented using a round-robin algorithm
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
+Patchew
+-------
+
+`Patchew <https://patchew.org/QEMU/>`_ is a website that tracks patches on the
+Mailing List.
+
+PR
+--
+
+Once a series is reviewed and accepted by a subsystem maintainer, it will be
+included in a PR (Pull Request) that the project maintainer will merge into QEMU
+main branch, after running tests.
+
+The QEMU project doesn't currently expect most developers to directly submit
+pull requests.
+
+QCOW2
+-----
+
+QEMU Copy On Write is a disk format developed by QEMU. It provides transparent
+compression, automatic extension, and many other advantages over a raw image.
+
+qcow2 is the recommended format to use.
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
+default. There is a work in progress to integrate it in QEMU codebase for
+various subsystems.
+
+System mode
+-----------
+
+QEMU System mode provides a virtual model of an entire machine (CPU, memory and
+emulated devices) to run a guest OS. In this mode the CPU may be fully emulated,
+or it may work with a hypervisor such as KVM, Xen or Hypervisor.Framework to
+allow the guest to run directly on the host CPU.
+
+QEMU System mode is called :ref:`softmmu <softmmu>` as well.
+
+.. _target:
+
+Target
+------
+
+The term "target" can be ambiguous. In most places in QEMU it is used as a
+synonym for :ref:`guest`. For example the code for emulating Arm CPUs is in
+``target/arm/``. However in the :ref:`TCG subsystem <tcg>` "target" refers to the
+architecture which QEMU is running on, i.e. the :ref:`host`.
+
+TCG
+---
+
+TCG is the QEMU `Tiny Code Generator <tcg>`. It is the JIT (just-in-time)
+compiler we use to emulate a guest CPU in software.
+
+It is one of the accelerators supported by QEMU, and supports a lot of
+guest/host architectures.
+
+User mode
+---------
+
+QEMU User mode can launch processes compiled for one CPU on another CPU. In this
+mode the CPU is always emulated. In this mode, QEMU translate system calls from
+guest to host kernel. It is available for Linux and BSD.
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
index 78285ebd6a4..5665de85cab 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -20,3 +20,4 @@ Welcome to QEMU's documentation!
    interop/index
    specs/index
    devel/index
+   glossary
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
