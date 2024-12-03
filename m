Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3881911njk;
        Tue, 3 Dec 2024 09:37:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlwF6XnMgJiQMtPTbQAory7lr/KhQS0DSajpscP0hAA/hkBiTogV6kmbupN2o5UdgqrjTXX2m2hmXhYg==@linaro.org
X-Received: by 2002:a2e:a5c9:0:b0:2ff:cae1:2297 with SMTP id 38308e7fff4ca-30009cab3f4mr25794811fa.26.1733247454303;
        Tue, 03 Dec 2024 09:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733247454; cv=none;
        d=google.com; s=arc-20240605;
        b=CGzpwiPhEAlmUH/TxBWfzkAjBRFAuGenIT5hvNcxkXQ2X1DT38wmR8hKf76qJdxUNQ
         fVtDaxNBtvFBPKwDFqu60WL5rfV2UWdBPJBHy9QcfuemBU00sJRuJjU4O4q0TYKoIu4M
         2pbljgHVpnqRVn58HDCckjHFpG/uJEtWl+MK9fO518NBrSqWIVtFZwwAomL1ldascBAC
         K0D4o1RAwAwLNn5+udXrVcfs6xCgE6pKkNZD8TeVtulwTSrnz1SkII0FHUxkTUnrLkgW
         Rq9VydQqknD/fWfn6bUEm6SUgaaLcMr0nUw3KqAMCaYHWa5wFs2EVr5bG80oomoSTDJT
         8IbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nRkbnzOTQAns4CXPYF9lLr7SoxzPcsBCfO+M1ee3joU=;
        fh=/UQfqYOoGSvYxtmOQeSBJ2Mbinv/s3biRPY2lYtCU3I=;
        b=KtRTAzZCj9YYWLpr8LfssoZvUV70JI1TgFGPBFQZ+Oy6mPsKYwaiMBFVgmF1fRxl8n
         qU6kGn5YW5fQ43J+J/5vxkQErUk+sw1r0MWh2so3UxfZG5bIxbDf9vNnixVbg12hQYIo
         gtUpf2onW4DMqxME7MhrDUYtVxVlHDyA3feYfv9fMnciwTTL+kf2vyiP+fGP+qntVsil
         aFTnQyDFtxzswIFmMxj60w3HPSmJwueYnV/+O/S4lWj17MyyR00aVuJBO5EfwfPycftT
         VDVYmQ514FweO31pA+L9W9WpMSHn+m3cCBshnv3ZXTdkKfmOXe3Y0QsFlLpjOeShF5jD
         Ov0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCESCayZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ffdfc7555csor29622411fa.14.2024.12.03.09.37.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 09:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCESCayZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733247454; x=1733852254; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nRkbnzOTQAns4CXPYF9lLr7SoxzPcsBCfO+M1ee3joU=;
        b=sCESCayZTEPBbzFGAyssNDnq8/APO8e4pW89tCqqr9Vwhoaq0XJDor/4Ja13dArSxi
         sbgVGIHYSTFFT+sIpd2G+fhFfEc7iVaD5uREUbLbXDaPL7uYFg1X8TEC/WvUr8hl4MqN
         3goECZ+D7+Nof5R9Ue7djRQ7hPgD8ayBHa00oHCZDKf/WPc/aWOSwC7+UKCeJyxzly8g
         lCkv6Ri83vnhqf6A7YedROfXVYlrgFG/r6nPKbU8tG3qg1jz/AMXnUBfYS70NrLex6p9
         rQ2lhcaXt/g0acEITb4zdDMIx1cn3a1zivP9/FmZ74WKOuRQQFkaJjaP8dBg9pluiMlA
         uNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247454; x=1733852254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRkbnzOTQAns4CXPYF9lLr7SoxzPcsBCfO+M1ee3joU=;
        b=BsFKORyNfxeEIyOTlL53BlKQuLcBYrR0nFIlTaj827YfkbiXJ8ti5Pd9eW1dz5M73+
         +/dVmJZtO4uZtEvlGYeljtOouOl+c/13eG7+aku4QS8yXjjx4mmJwodE5TOvvSo+8ryJ
         +AyE5SmXQxkFpvnPLqYGapLjSO5AU7VniNr/hB54I/VZMfK0F1TQVF4huMhEF41TcW3T
         gUJLF8MLKkqhptBycYLv1S2ikoHSFCMjFthDRe1c12JKolK/eqjVVJsN8i2Xfb+dQ2Ll
         2p/ooU5Vu9zA4D082Mtn3qBDODtpZWre0gR4YoaR3K6uEwzrQYRYyy77GpeFRxLgQtcC
         kIzg==
X-Forwarded-Encrypted: i=1; AJvYcCUIamUt6H320X9ZLoNgKQhjAlhmssaniyA5SF5lGoJfJ6DcYKhCBMjm4Yle3MgsNc/1kMI5tgWpDHzQQA==@linaro.org
X-Gm-Message-State: AOJu0YyM8JMx/l5OIxLTCREmc37A3uXKtRVv0pOVMn4U+sDRmbOshzCH
	6IR6zAvKZQTo5dUnxoo2N8wsRnjnaihuhweNTeXi4xVFiqXiNHJUnQ9JBbrwq5Ns1kucXvRlAOs
	WyflLQA+/IJ162u4El8P3oFpx6Tu0oCSgSzEbWBIm
X-Gm-Gg: ASbGncuEDM4fsq1eAfQFBABfb/vY0xAcxLDzxHU9Yl3QpA0tQYStxBZWAdJWdEzV6rQ
	8Ze5JI2qM52BBrJvSGb6mb2ZwdJZZgiV8
X-Google-Smtp-Source: AGHT+IEJdZ7XZPRsLEur/t3l/bq/qjI4UPtlxtswNiRac9VzSHkdReieCP+jS2K+821ntSPIiuJ2XaL0a6HV08CrEfM=
X-Received: by 2002:a2e:bc06:0:b0:2ff:59fa:44f0 with SMTP id
 38308e7fff4ca-30009c0cacemr25598581fa.3.1733247453515; Tue, 03 Dec 2024
 09:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org> <20241118172357.475281-7-pierrick.bouvier@linaro.org>
In-Reply-To: <20241118172357.475281-7-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2024 17:37:22 +0000
Message-ID: <CAFEAcA9JdLxi5cr-Z2-YX6Q8nv=j0O3k=f9u6gS-CzSf5BH7Ug@mail.gmail.com>
Subject: Re: [PATCH 6/7] docs: add a glossary
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Andrew Melnychenko <andrew@daynix.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Fabiano Rosas <farosas@suse.de>, 
	Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>, 
	manos.pitsidianakis@linaro.org, qemu-block@nongnu.org, 
	Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: bVnAQoXfrJhA

On Mon, 18 Nov 2024 at 17:24, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/devel/control-flow-integrity.rst |   2 +
>  docs/devel/multi-thread-tcg.rst       |   2 +
>  docs/glossary/index.rst               | 238 ++++++++++++++++++++++++++
>  docs/index.rst                        |   1 +
>  docs/system/arm/virt.rst              |   2 +
>  docs/system/images.rst                |   2 +
>  docs/tools/qemu-nbd.rst               |   2 +
>  7 files changed, 249 insertions(+)
>  create mode 100644 docs/glossary/index.rst

I think this is a good idea; we've had at least one bug
report from a user pointing out that we had a term in
our docs which we didn't define ("block driver"):
https://gitlab.com/qemu-project/qemu/-/issues/2611
I have some comments on specific entries below.

> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
> index e6b73a4fe1a..3d5702fa4cc 100644
> --- a/docs/devel/control-flow-integrity.rst
> +++ b/docs/devel/control-flow-integrity.rst
> @@ -1,3 +1,5 @@
> +.. _cfi:
> +
>  ============================
>  Control-Flow Integrity (CFI)
>  ============================
> diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
> index d706c27ea74..7fd0a07633d 100644
> --- a/docs/devel/multi-thread-tcg.rst
> +++ b/docs/devel/multi-thread-tcg.rst
> @@ -4,6 +4,8 @@
>    This work is licensed under the terms of the GNU GPL, version 2 or
>    later. See the COPYING file in the top-level directory.
>
> +.. _mttcg:
> +
>  ==================
>  Multi-threaded TCG
>  ==================
> diff --git a/docs/glossary/index.rst b/docs/glossary/index.rst
> new file mode 100644
> index 00000000000..a2d4f3eae16
> --- /dev/null
> +++ b/docs/glossary/index.rst

I guess it makes sense to give this its own subdir, since we want
it to come at the end of the manual. The other option would be
to put it directly into docs/.

> @@ -0,0 +1,238 @@
> +.. _Glossary:
> +
> +--------
> +Glossary
> +--------
> +
> +This section of the manual presents *simply* acronyms and terms QEMU developers
> +use.

What's "simply" intended to mean here?

> +
> +Accelerator
> +-----------
> +
> +A specific API used to accelerate execution of guest instructions. It can be
> +hardware-based, through a virtualization API provided by the host OS (kvm, hvf,
> +whpx, ...) or software-based (tcg). See this description of `supported

Comma after ')'.

> +accelerators<Accelerators>`.
> +
> +Board
> +-----

I think the correct term here is "machine" -- that's what the
command line option is named, it's what the QOM class is, etc.
So the major glossary entry should be "Machine". Some people
(including me!) and some of the documentation uses "board" as a
synonym for "machine", so we should have a glossary entry for
"board", but it should just say "Another name for 'machine'" and
xref to the "machine" entry.

> +
> +QEMU system defines board models for various architectures. It's a description
> +of a SoC (system-on-chip) with various devices pre-configured, and can be
> +selected with the option ``-machine`` of qemu-system.

SoCs are not the same as boards.

We could say something like:

QEMU's system emulation models many different types of hardware.
A machine model (sometimes called a board model) is the model
of a complete virtual system with RAM, one or more CPUs, and
various devices.

We could also put in a link to
https://www.qemu.org/docs/master/system/targets.html
which is where we document what our machine types are.

> +For virtual machines, you'll use ``virt`` board model, designed for this use
> +case. As an example, for Arm architecture, you can find the `model code
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/arm/virt.c>`_ and
> +associated `documentation <arm-virt>`.

I think I would delete this paragraph. 'virt' is only the
board type for virtual machines for some architectures; on
x86 it doesn't exist for, example. Our user facing
docs (that link above) are where we should suggest what
the best machine type to use is. And the codebase-guide
page is where we would say where machine type source code is.

> +
> +Block
> +-----
> +
> +Block drivers are the available `disk formats <block-drivers>` available, and
> +block devices `(see Block device section on options page)<sec_005finvocation>`
> +are using them to implement disks for a virtual machine.

Block drivers aren't just disk formats; there are some filter
drivers too. Somebody on the block side could probably
provide a better definition here.

> +
> +CFI
> +---
> +
> +Control Flow Integrity is a hardening technique used to prevent exploits
> +targeting QEMU by detecting unexpected branches during execution. QEMU `actively
> +supports<cfi>` being compiled with CFI enabled.
> +
> +Device
> +------
> +
> +QEMU is able to emulate a CPU, and all the hardware interacting with it,
> +including many devices. When QEMU runs a virtual machine using a hardware-based
> +accelerator, it is responsible for emulating, using software, all devices.

This definition doesn't actually define what a device is :-)

> +
> +EDK2
> +----
> +
> +EDK2, as known as `TianoCore <https://www.tianocore.org/>`_, is an open source
> +implementation of UEFI standard. It's ran by QEMU to support UEFI for virtual
> +machines.

Replace last sentence with
"QEMU virtual machines that boot a UEFI BIOS usually use EDK2."
?

> +
> +gdbstub
> +-------
> +
> +QEMU implements a `gdb server <GDB usage>`, allowing gdb to attach to it and
> +debug a running virtual machine, or a program in user-mode. This allows to debug
> +a given architecture without having access to hardware.

"allows debugging the guest code that is running inside QEMU."

> +
> +glib2
> +-----
> +
> +`GLib2 <https://docs.gtk.org/glib/>`_ is one of the most important library we

"libraries"

> +are using through the codebase. It provides many data structures, macros, string
> +and thread utilities and portable functions across different OS. It's required
> +to build QEMU.
> +
> +Guest agent
> +-----------
> +
> +`QEMU Guest agent <qemu-ga>` is a daemon intended to be executed by guest

"The QEMU Guest Agent"

"intended to be run within virtual machines. It provides various services"

> +virtual machines and providing various services to help QEMU to interact with
> +it.
> +
> +Guest/Host
> +----------

Make these two separate glossary entries, which cross reference each other.

> +
> +Guest is the architecture of the virtual machine, which is emulated.

"Sometimes this is called the 'target' architecture, but that term
can be ambiguous."

> +Host is the architecture on which QEMU is running on, which is native.


We could also have an entry for Target

 The term "target" can be ambiguous. In most places in QEMU it is used
 as a synonym for "guest"; for example the code for emulating Arm CPUs
 is in ``target/arm/``. However in the TCG subsystem "target" refers
 to the architecture which QEMU is running on, i.e. the "host".


> +
> +Hypervisor
> +----------
> +
> +The formal definition of an hypervisor is a program than can be used to manage a
> +virtual machine. QEMU itself is an hypervisor.

"a hypervisor". QEMU isn't really a hypervisor, though...


> +
> +In the context of QEMU, an hypervisor is an API, provided by the Host OS,
> +allowing to execute virtual machines. Linux implementation is KVM (and supports
> +Xen as well). For MacOS, it's HVF. Windows defines WHPX. And NetBSD provides
> +NVMM.
> +
> +Migration
> +---------
> +
> +QEMU can save and restore the execution of a virtual machine, including across
> +different machines. This is provided by the `Migration framework<migration>`.

"between different host systems".

> +
> +NBD
> +---
> +
> +`QEMU Network Block Device server <qemu-nbd>` is a tool that can be used to

"The QEMU ..."

> +mount and access QEMU images, providing functionality similar to a loop device.
> +
> +Mailing List
> +------------
> +
> +This is `where <https://wiki.qemu.org/Contribute/MailingLists>`_ all the
> +development happens! Changes are posted as series, that all developers can
> +review and share feedback for.
> +
> +For reporting issues, our `GitLab
> +<https://gitlab.com/qemu-project/qemu/-/issues>`_ tracker is the best place.
> +
> +MMU / softmmu
> +-------------
> +
> +The Memory Management Unit is responsible for translating virtual addresses to
> +physical addresses and managing memory protection. QEMU system mode is named
> +"softmmu" precisely because it implements this in software, including a TLB
> +(Translation lookaside buffer), for the guest virtual machine.
> +
> +QEMU user-mode does not implement a full software MMU, but "simply" translates
> +virtual addresses by adding a specific offset, and relying on host MMU/OS
> +instead.
> +
> +Monitor / QMP / HMP
> +-------------------
> +
> +`QEMU Monitor <QEMU monitor>` is a text interface which can be used to interact

"The QEMU Monitor"

> +with a running virtual machine.
> +
> +QMP stands for QEMU Monitor Protocol and is a json based interface.
> +HMP stands for Human Monitor Protocol and is a set of text commands available
> +for users who prefer natural language to json.
> +
> +MTTCG
> +-----
> +
> +Multiple cpus support was first implemented using a round-robin algorithm

"Multiple CPU support"

> +running on a single thread. Later on, `Multi-threaded TCG <mttcg>` was developed
> +to benefit from multiple cores to speed up execution.
> +
> +Plugins
> +-------
> +
> +`TCG Plugins <TCG Plugins>` is an API used to instrument guest code, in system
> +and user mode. The end goal is to have a similar set of functionality compared
> +to `DynamoRIO <https://dynamorio.org/>`_ or `valgrind <https://valgrind.org/>`_.
> +
> +One key advantage of QEMU plugins is that they can be used to perform
> +architecture agnostic instrumentation.
> +
> +Patchwork
> +---------
> +
> +`Patchwork <https://patchew.org/QEMU/>`_ is a website that tracks
> +patches on the Mailing List.

Patchwork and patchew are different systems. Patchew's URL is
https://patchew.org/QEMU/

(There is a patchwork instance that tracks qemu-devel patches,
at https://patchwork.kernel.org/project/qemu-devel/list/ , but
I'm not aware of any developers that are actively using it, so
I don't think it merits being mentioned in the glossary.)

> +
> +PR
> +--
> +
> +Once a series is reviewed and accepted by a subsystem maintainer, it will be
> +included in a PR (Pull Request) that the project maintainer will merge into QEMU
> +main branch, after running tests.

I think we could probably also usefully say

"The QEMU project doesn't currently expect most developers to
directly submit pull requests."

just to flag up that our development model isn't like the
currently-popular github/gitlab one where a PR is how you
send contributions.

> +
> +QCOW
> +----
> +
> +QEMU Copy On Write is a disk format developed by QEMU. It provides transparent
> +compression, automatic extension, and many other advantages over a raw image.

We want to be a bit careful here, because the "qcow" format
is not something we recommend for new use -- "qcow2" is what
you actually want.

https://www.qemu.org/docs/master/system/qemu-block-drivers.html#cmdoption-image-formats-arg-qcow2

> +
> +QEMU
> +----
> +
> +`QEMU (Quick Emulator) <https://www.qemu.org/>`_ is a generic and open source
> +machine emulator and virtualizer.
> +
> +QOM
> +---
> +
> +`QEMU Object Model <qom>` is an object oriented API used to define various
> +devices and hardware in the QEMU codebase.
> +
> +Record/replay
> +-------------
> +
> +`Record/replay <replay>` is a feature of QEMU allowing to have a deterministic
> +and reproducible execution of a virtual machine.
> +
> +Rust
> +----
> +
> +`A new programming language <https://www.rust-lang.org/>`_, memory safe by
> +default. We didn't see a more efficient way to create debates and tensions in
> +a community of C programmers since the birth of C++.

:-)  but I think we should probably avoid the joke in our docs.

> +
> +System mode
> +-----------
> +
> +QEMU System mode emulates a full machine, including its cpu, memory and devices.
> +It can be accelerated to hardware speed by using one of the hypervisors QEMU
> +supports. It is referenced as softmmu as well.

https://www.qemu.org/docs/master/about/index.html already has
text defining system emulation and user emulation, so we don't
really need to re-invent new phrasing for those here.

> +
> +TCG
> +---
> +
> +`Tiny Code Generator <tcg>` is an intermediate representation (IR) used to run
> +guest instructions on host cpu, with both architectures possibly being
> +different.

I would say

  TCG is the QEMU Tiny Code Generator; it is the JIT system we use
  to emulate a guest CPU in software.

That's enough for users to understand what it means (I hope); if
they want to know more specifics like about the intermediate
representation they can follow the link.

> +
> +It is one of the accelerator supported by QEMU, and supports a lot of

"accelerators"

> +guest/host architectures.
> +
> +User mode
> +---------
> +
> +QEMU User mode allows to run programs for a guest architecture, on a host
> +architecture, by translating system calls and using TCG. It is available for
> +Linux and BSD.
> +
> +VirtIO
> +------
> +
> +VirtIO is an open standard used to define and implement virtual devices with a
> +minimal overhead, defining a set of data structures and hypercalls (similar to
> +system calls, but targeting an hypervisor, which happens to be QEMU in our
> +case). It's designed to be more efficient than emulating a real device, by
> +minimizing the amount of interactions between a guest VM and its hypervisor.
> +
> +vhost-user
> +----------
> +
> +`Vhost-user <vhost_user>` is an interface used to implement VirtIO devices
> +outside of QEMU itself.

thanks
-- PMM
