Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3995422njk;
        Tue, 3 Dec 2024 12:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOxPv697P1MD9VINs3vXnK5bIiBINT/yWdrxoVbMD2z4nXKwDNRDOQXeAMViEXHoL21x7WYDfvurKWJw==@linaro.org
X-Received: by 2002:a17:902:f544:b0:215:7fb6:7648 with SMTP id d9443c01a7336-215bd184580mr44725325ad.55.1733257926778;
        Tue, 03 Dec 2024 12:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733257926; cv=none;
        d=google.com; s=arc-20240605;
        b=WoaISeVAO/ft1Zb0FS95uJiGLrHh7H/J1LcoUT4+lE+T05LWsnW8qH79IRVF9YiUNM
         +h+979lnwi8tiEoy+sGrLJwYfnScrYdNOhTDSsrHxckzSALpaz8Zt7UmO0OIkPMpRP9d
         OUkUk0XNBttm+sdIa6sndQkhNyemdQeC+XmyfmpMHYQf7y7Qq760tStWMQ9fbpfuO7xf
         v+C9zSnaaDWAjUHAv5RGF9WXKBXgDBxC8FxI39Fl6dtzKVNJNZIpm1A3aQTtBe9aB82J
         d8lbOoo7Ly+v7VpxJ+DXxhbBMopVVw1Galm23r7ScDO1tlJNHqFV41j5CYQUmwrC0dQa
         LsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r+GD/ej76sPsT8FfH7l0PmXspXKI1rpi26C0CD8lSS4=;
        fh=lel9RHlFvxPosmP9Z6gJh4HXFGWKQfALvRTJqDPqiZg=;
        b=IGhzjgYby/hdbLdEY6w74Wkq42/OK/IvpQb+Xn1bkL8hQUtUhxz3TkbjWwZ3FSMYyf
         HBHK1jQjMA4pWa1lg3/oE9HIlijuNKsk4fYDx71myzOZzsUBNiR5nzIjkpQaXkwWCV95
         Wb82pNCvkZ0B2bry3sUgjrM/A+t7Dr2lMbd2d9B5uGdA9qiTsBVN99BIOhU4VwUNbpk8
         wRK9Wsdf+qhW3NNmpl64OGTgS94TIpadPFsvjvzg389cBYLqgQjBm80PxAdRcgYYIO05
         d7+HlsEDZhOnws4LT+tgNyu/4R+C4hk14J6pKWOtT/QFLmSFpxPx908m2HBam2+tdlUy
         kk4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciYikIR1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2159a1f73c1sor39537065ad.5.2024.12.03.12.32.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 12:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciYikIR1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733257926; x=1733862726; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+GD/ej76sPsT8FfH7l0PmXspXKI1rpi26C0CD8lSS4=;
        b=ciYikIR18YvNh7G0rJ+zI9qkvtc3JViBNOkuh9PjiELEQ5aXtTikBaqHiGu/iM8uSb
         4ia/Pfv0O5v0vDaT3udThVpYN54tM4fqbhtF+i1tZw0r5fq3eVDVLFSLEFiWQKdVdXcS
         n1Fto7xC+jjqbPUzoH9NOuK3q3DHYmx4Ku3hcWxSg3sREieONLz68QOVOeXXSuXMv4N9
         ovemC/iduW8f1hbAvvyts/dI6eYDxOMwka67eA7Zjp/eAj75/zqN6nZwcBgijtJF2cn/
         ZALhTXUF5fBcK3fc0i6OKqw1BP+0T4j/gDCnUDBaWzTxhZu96gK/mWBZRn3XitaaKbJB
         vCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257926; x=1733862726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+GD/ej76sPsT8FfH7l0PmXspXKI1rpi26C0CD8lSS4=;
        b=qPeygtZ7pEmDBire4q0Nt5eaJpOTt70tDGzGkJb+pENfzzGdY374UCTAf/+curxDEt
         ARcUWnIqIl1DUG03D8QAYI/cubzxUyJ1pKj8bMxKF0ppT0x92om+8zBO2QJJ6cDoHebz
         wedtoyDQv7CProFMU4FfQYUZgdCT02fU5lcUBuNZjdbIRb3p3Gov8/Xoj+2ruThIH9NX
         ILL1Xz+g2rtNLEfTB7UkFcq+eSFr4WF8QatT8yha/Cw6XrRDpzLtZ2NrY9Ks52RNUj2j
         kY9/x0tnIG2XIXO1cbvzv9SGO7kzVMJpbCyNuTn9/sanLZBldhGUMl51qMSe1T4D2aWi
         fCow==
X-Forwarded-Encrypted: i=1; AJvYcCVUhzobzvrABntBKsp8KjyU2imEhev8cBXmkYueQ+1olhKmuYhffK4aNMULKs9jijhLikyRJPaJtEZVSA==@linaro.org
X-Gm-Message-State: AOJu0YyjNwzO1SYolwHfm8GtTwiw2v+5aXTk4RRWl+IQ7s30AOBQWQn4
	szYeNGVNNe6Anug/vfWmKQKYxQsjhcMhDeQsz/r7YsAGfiF0xJxvNIGERYJ0n+uKVQ==
X-Gm-Gg: ASbGncvOxfxmf1ZMj+TVEWDXtyeojYWlwamy90SJFcj3ev6wE3GH7P0TGnoqXk1Bsmx
	V4NVYE05Hw26yTIBRS52rNPhlv67VyCLyLWAPYV57qDuNFeDdJEAZFLMppSFmGpy6HbBl+dl5EU
	O1n9X+IfeeWd7GvuqtOLI7iepz9aOIDCI9QyxnUQINwgPdrD8JLVj/kg86Ba1Y3hlSs9gLWPSMA
	1Hm4LCNL47dW5c5Kb7uCEtSNUwWprhdMLUr7+OOab8Pj5dUKl0RdiPDS6Ed6NL1SizEVYLzR952
	KXWp0YywK7zf7NyJGG8uOg==
X-Google-Smtp-Source: AGHT+IHfKFy0UY9YsNggL4y6mPFU5avJNxoMrc4oYr4zLuji8cVJfqC+fQXNTwcGtzcRKllDJ0O+Ag==
X-Received: by 2002:a17:902:dac8:b0:215:a190:ba10 with SMTP id d9443c01a7336-215bd0c2a98mr53150935ad.15.1733257925993;
        Tue, 03 Dec 2024 12:32:05 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2152191ba31sm99459185ad.110.2024.12.03.12.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 12:32:05 -0800 (PST)
Message-ID: <bdefc0ac-311b-4820-913f-e21d753890fa@linaro.org>
Date: Tue, 3 Dec 2024 12:32:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] docs: add a glossary
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-7-pierrick.bouvier@linaro.org>
 <CAFEAcA9JdLxi5cr-Z2-YX6Q8nv=j0O3k=f9u6gS-CzSf5BH7Ug@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9JdLxi5cr-Z2-YX6Q8nv=j0O3k=f9u6gS-CzSf5BH7Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: BeJUk4SAKnvR

On 12/3/24 09:37, Peter Maydell wrote:
> On Mon, 18 Nov 2024 at 17:24, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   docs/devel/control-flow-integrity.rst |   2 +
>>   docs/devel/multi-thread-tcg.rst       |   2 +
>>   docs/glossary/index.rst               | 238 ++++++++++++++++++++++++++
>>   docs/index.rst                        |   1 +
>>   docs/system/arm/virt.rst              |   2 +
>>   docs/system/images.rst                |   2 +
>>   docs/tools/qemu-nbd.rst               |   2 +
>>   7 files changed, 249 insertions(+)
>>   create mode 100644 docs/glossary/index.rst
> 
> I think this is a good idea; we've had at least one bug
> report from a user pointing out that we had a term in
> our docs which we didn't define ("block driver"):
> https://gitlab.com/qemu-project/qemu/-/issues/2611
> I have some comments on specific entries below.
> 

And people can be free to add new entries later. However, we should 
resist the temptation to add too many details. It should stay simple and 
understandable, even if not all technical nuances are not represented.

>> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
>> index e6b73a4fe1a..3d5702fa4cc 100644
>> --- a/docs/devel/control-flow-integrity.rst
>> +++ b/docs/devel/control-flow-integrity.rst
>> @@ -1,3 +1,5 @@
>> +.. _cfi:
>> +
>>   ============================
>>   Control-Flow Integrity (CFI)
>>   ============================
>> diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
>> index d706c27ea74..7fd0a07633d 100644
>> --- a/docs/devel/multi-thread-tcg.rst
>> +++ b/docs/devel/multi-thread-tcg.rst
>> @@ -4,6 +4,8 @@
>>     This work is licensed under the terms of the GNU GPL, version 2 or
>>     later. See the COPYING file in the top-level directory.
>>
>> +.. _mttcg:
>> +
>>   ==================
>>   Multi-threaded TCG
>>   ==================
>> diff --git a/docs/glossary/index.rst b/docs/glossary/index.rst
>> new file mode 100644
>> index 00000000000..a2d4f3eae16
>> --- /dev/null
>> +++ b/docs/glossary/index.rst
> 
> I guess it makes sense to give this its own subdir, since we want
> it to come at the end of the manual. The other option would be
> to put it directly into docs/.
> 

 From your comment, it's not clear for me if it's ok as it is, or if you 
want a change.
Can you elaborate on that?

>> @@ -0,0 +1,238 @@
>> +.. _Glossary:
>> +
>> +--------
>> +Glossary
>> +--------
>> +
>> +This section of the manual presents *simply* acronyms and terms QEMU developers
>> +use.
> 
> What's "simply" intended to mean here?
> 

"in a straightforward or plain manner".
I can remove this word if you think it does not serve any purpose.

>> +
>> +Accelerator
>> +-----------
>> +
>> +A specific API used to accelerate execution of guest instructions. It can be
>> +hardware-based, through a virtualization API provided by the host OS (kvm, hvf,
>> +whpx, ...) or software-based (tcg). See this description of `supported
> 
> Comma after ')'.
> 

Thanks.

>> +accelerators<Accelerators>`.
>> +
>> +Board
>> +-----
> 
> I think the correct term here is "machine" -- that's what the
> command line option is named, it's what the QOM class is, etc.
> So the major glossary entry should be "Machine". Some people
> (including me!) and some of the documentation uses "board" as a
> synonym for "machine", so we should have a glossary entry for
> "board", but it should just say "Another name for 'machine'" and
> xref to the "machine" entry.
> 

It's a good point. I thought the same when I wrote it (and finally chose 
Board). I'll rename it to machine and add the board entry to point to it.

>> +
>> +QEMU system defines board models for various architectures. It's a description
>> +of a SoC (system-on-chip) with various devices pre-configured, and can be
>> +selected with the option ``-machine`` of qemu-system.
> 
> SoCs are not the same as boards.
> 
> We could say something like:
> 
> QEMU's system emulation models many different types of hardware.
> A machine model (sometimes called a board model) is the model
> of a complete virtual system with RAM, one or more CPUs, and
> various devices.
> 
> We could also put in a link to
> https://www.qemu.org/docs/master/system/targets.html
> which is where we document what our machine types are.
> 

How do you distinguish a SoC and cpu? Is a SoC cpu + devices?
Isn't a board/machine a set of SoC + devices attached?

The definition does not say a board is a SoC, but maybe the wording is 
confusing.

>> +For virtual machines, you'll use ``virt`` board model, designed for this use
>> +case. As an example, for Arm architecture, you can find the `model code
>> +<https://gitlab.com/qemu-project/qemu/-/blob/master/hw/arm/virt.c>`_ and
>> +associated `documentation <arm-virt>`.
> 
> I think I would delete this paragraph. 'virt' is only the
> board type for virtual machines for some architectures; on
> x86 it doesn't exist for, example. Our user facing
> docs (that link above) are where we should suggest what
> the best machine type to use is. And the codebase-guide
> page is where we would say where machine type source code is.
> 

Ok.

>> +
>> +Block
>> +-----
>> +
>> +Block drivers are the available `disk formats <block-drivers>` available, and
>> +block devices `(see Block device section on options page)<sec_005finvocation>`
>> +are using them to implement disks for a virtual machine.
> 
> Block drivers aren't just disk formats; there are some filter
> drivers too. Somebody on the block side could probably
> provide a better definition here.
> 

I'm open to a more exact definition. The two terms (drivers and devices) 
seem to overlap on some parts, so I came up with this trivial definition.

>> +
>> +CFI
>> +---
>> +
>> +Control Flow Integrity is a hardening technique used to prevent exploits
>> +targeting QEMU by detecting unexpected branches during execution. QEMU `actively
>> +supports<cfi>` being compiled with CFI enabled.
>> +
>> +Device
>> +------
>> +
>> +QEMU is able to emulate a CPU, and all the hardware interacting with it,
>> +including many devices. When QEMU runs a virtual machine using a hardware-based
>> +accelerator, it is responsible for emulating, using software, all devices.
> 
> This definition doesn't actually define what a device is :-)
> 

Indeed :)
Should we explain what is a computer device?
The goal was just to say that QEMU can emulate hardware interacting with 
the cpu, which could be a possible definition. So people can associate 
that QEMU devices are nothing else than a "normal" computer device.

>> +
>> +EDK2
>> +----
>> +
>> +EDK2, as known as `TianoCore <https://www.tianocore.org/>`_, is an open source
>> +implementation of UEFI standard. It's ran by QEMU to support UEFI for virtual
>> +machines.
> 
> Replace last sentence with
> "QEMU virtual machines that boot a UEFI BIOS usually use EDK2."
> ?
> 
>> +
>> +gdbstub
>> +-------
>> +
>> +QEMU implements a `gdb server <GDB usage>`, allowing gdb to attach to it and
>> +debug a running virtual machine, or a program in user-mode. This allows to debug
>> +a given architecture without having access to hardware.
> 
> "allows debugging the guest code that is running inside QEMU."
> 
>> +
>> +glib2
>> +-----
>> +
>> +`GLib2 <https://docs.gtk.org/glib/>`_ is one of the most important library we
> 
> "libraries"
> 
>> +are using through the codebase. It provides many data structures, macros, string
>> +and thread utilities and portable functions across different OS. It's required
>> +to build QEMU.
>> +
>> +Guest agent
>> +-----------
>> +
>> +`QEMU Guest agent <qemu-ga>` is a daemon intended to be executed by guest
> 
> "The QEMU Guest Agent"
> 
> "intended to be run within virtual machines. It provides various services"
> 
>> +virtual machines and providing various services to help QEMU to interact with
>> +it.
>> +
>> +Guest/Host
>> +----------
> 
> Make these two separate glossary entries, which cross reference each other.
> 
>> +
>> +Guest is the architecture of the virtual machine, which is emulated.
> 
> "Sometimes this is called the 'target' architecture, but that term
> can be ambiguous."
> 
>> +Host is the architecture on which QEMU is running on, which is native.
> 
> 
> We could also have an entry for Target
> 
>   The term "target" can be ambiguous. In most places in QEMU it is used
>   as a synonym for "guest"; for example the code for emulating Arm CPUs
>   is in ``target/arm/``. However in the TCG subsystem "target" refers
>   to the architecture which QEMU is running on, i.e. the "host".
> 

It's a good point, and a very confusing one.
I'll add it and a link to docs/devel/tcg-ops.rst, that clarifies this 
for TCG.

> 
>> +
>> +Hypervisor
>> +----------
>> +
>> +The formal definition of an hypervisor is a program than can be used to manage a
>> +virtual machine. QEMU itself is an hypervisor.
> 
> "a hypervisor". QEMU isn't really a hypervisor, though...
> 

It's a shortcut, and I'm open to change it. It brings an interesting 
question though.

Technically, QEMU interacts with hypervisor APIs built in various OSes. 
On the other hand, when we use TCG, it's an emulator instead.

But as you can't use KVM/hvf/whpx by itself, how do you name the program 
interacting with it, and emulating the rest of the VM?

The correct word is probably "virtualizer", but from searching on 
Internet, it seems that "vmm" and "virtualizer" are considered the same 
as an "hypervisor". The difference is subtle, and maybe we have an 
opportunity here to clarify it.

> 
>> +
>> +In the context of QEMU, an hypervisor is an API, provided by the Host OS,
>> +allowing to execute virtual machines. Linux implementation is KVM (and supports
>> +Xen as well). For MacOS, it's HVF. Windows defines WHPX. And NetBSD provides
>> +NVMM.
>> +
>> +Migration
>> +---------
>> +
>> +QEMU can save and restore the execution of a virtual machine, including across
>> +different machines. This is provided by the `Migration framework<migration>`.
> 
> "between different host systems".
> 
>> +
>> +NBD
>> +---
>> +
>> +`QEMU Network Block Device server <qemu-nbd>` is a tool that can be used to
> 
> "The QEMU ..."
> 
>> +mount and access QEMU images, providing functionality similar to a loop device.
>> +
>> +Mailing List
>> +------------
>> +
>> +This is `where <https://wiki.qemu.org/Contribute/MailingLists>`_ all the
>> +development happens! Changes are posted as series, that all developers can
>> +review and share feedback for.
>> +
>> +For reporting issues, our `GitLab
>> +<https://gitlab.com/qemu-project/qemu/-/issues>`_ tracker is the best place.
>> +
>> +MMU / softmmu
>> +-------------
>> +
>> +The Memory Management Unit is responsible for translating virtual addresses to
>> +physical addresses and managing memory protection. QEMU system mode is named
>> +"softmmu" precisely because it implements this in software, including a TLB
>> +(Translation lookaside buffer), for the guest virtual machine.
>> +
>> +QEMU user-mode does not implement a full software MMU, but "simply" translates
>> +virtual addresses by adding a specific offset, and relying on host MMU/OS
>> +instead.
>> +
>> +Monitor / QMP / HMP
>> +-------------------
>> +
>> +`QEMU Monitor <QEMU monitor>` is a text interface which can be used to interact
> 
> "The QEMU Monitor"
> 
>> +with a running virtual machine.
>> +
>> +QMP stands for QEMU Monitor Protocol and is a json based interface.
>> +HMP stands for Human Monitor Protocol and is a set of text commands available
>> +for users who prefer natural language to json.
>> +
>> +MTTCG
>> +-----
>> +
>> +Multiple cpus support was first implemented using a round-robin algorithm
> 
> "Multiple CPU support"
> 
>> +running on a single thread. Later on, `Multi-threaded TCG <mttcg>` was developed
>> +to benefit from multiple cores to speed up execution.
>> +
>> +Plugins
>> +-------
>> +
>> +`TCG Plugins <TCG Plugins>` is an API used to instrument guest code, in system
>> +and user mode. The end goal is to have a similar set of functionality compared
>> +to `DynamoRIO <https://dynamorio.org/>`_ or `valgrind <https://valgrind.org/>`_.
>> +
>> +One key advantage of QEMU plugins is that they can be used to perform
>> +architecture agnostic instrumentation.
>> +
>> +Patchwork
>> +---------
>> +
>> +`Patchwork <https://patchew.org/QEMU/>`_ is a website that tracks
>> +patches on the Mailing List.
> 
> Patchwork and patchew are different systems. Patchew's URL is
> https://patchew.org/QEMU/
> 
> (There is a patchwork instance that tracks qemu-devel patches,
> at https://patchwork.kernel.org/project/qemu-devel/list/ , but
> I'm not aware of any developers that are actively using it, so
> I don't think it merits being mentioned in the glossary.)
> 

I've been confused by that, and just thought it was two different 
instances (fork me if you can) of the "same" thing.
How would you define patchew?
When we say patchwork, do we implicitely mean patchew?

if I understand currently, patchew is what we want to mention in our 
doc? (and mention it's not associated to patchwork).

>> +
>> +PR
>> +--
>> +
>> +Once a series is reviewed and accepted by a subsystem maintainer, it will be
>> +included in a PR (Pull Request) that the project maintainer will merge into QEMU
>> +main branch, after running tests.
> 
> I think we could probably also usefully say
> 
> "The QEMU project doesn't currently expect most developers to
> directly submit pull requests."
> 
> just to flag up that our development model isn't like the
> currently-popular github/gitlab one where a PR is how you
> send contributions.
> 

This is interesting.

For the majority of developers nowadays, a PR is a GitHub/GitLab PR.
Despite the fact we use the original PR meaning (in git terms), it's 
probably confusing when new comers hear pull request.

>> +
>> +QCOW
>> +----
>> +
>> +QEMU Copy On Write is a disk format developed by QEMU. It provides transparent
>> +compression, automatic extension, and many other advantages over a raw image.
> 
> We want to be a bit careful here, because the "qcow" format
> is not something we recommend for new use -- "qcow2" is what
> you actually want.
> 
> https://www.qemu.org/docs/master/system/qemu-block-drivers.html#cmdoption-image-formats-arg-qcow2
> 

Sounds good.

For my personal knowledge: during this work I discovered that we had 
qcow3. From what I understood, it seems to be included in what we called 
qcow2 today. Is that correct?

>> +
>> +QEMU
>> +----
>> +
>> +`QEMU (Quick Emulator) <https://www.qemu.org/>`_ is a generic and open source
>> +machine emulator and virtualizer.
>> +
>> +QOM
>> +---
>> +
>> +`QEMU Object Model <qom>` is an object oriented API used to define various
>> +devices and hardware in the QEMU codebase.
>> +
>> +Record/replay
>> +-------------
>> +
>> +`Record/replay <replay>` is a feature of QEMU allowing to have a deterministic
>> +and reproducible execution of a virtual machine.
>> +
>> +Rust
>> +----
>> +
>> +`A new programming language <https://www.rust-lang.org/>`_, memory safe by
>> +default. We didn't see a more efficient way to create debates and tensions in
>> +a community of C programmers since the birth of C++.
> 
> :-)  but I think we should probably avoid the joke in our docs.
> 

I had one smile, I'm happy to remove it now :).

More seriously, I can complete after "memory safe by default", "The QEMU 
community is currently working to integrate Rust in the codebase for 
various subsystems".

>> +
>> +System mode
>> +-----------
>> +
>> +QEMU System mode emulates a full machine, including its cpu, memory and devices.
>> +It can be accelerated to hardware speed by using one of the hypervisors QEMU
>> +supports. It is referenced as softmmu as well.
> 
> https://www.qemu.org/docs/master/about/index.html already has
> text defining system emulation and user emulation, so we don't
> really need to re-invent new phrasing for those here.
> 

I can repeat the definition we have there:
"System Emulation provides a virtual model of an entire machine (CPU, 
memory and emulated devices) to run a guest OS. In this mode the CPU may 
be fully emulated, or it may work with a hypervisor such as KVM, Xen or 
Hypervisor.Framework to allow the guest to run directly on the host CPU."

However, I think mentioning softmmu is important, as it's a common 
confusing name (to the new comer) coming from target list.

>> +
>> +TCG
>> +---
>> +
>> +`Tiny Code Generator <tcg>` is an intermediate representation (IR) used to run
>> +guest instructions on host cpu, with both architectures possibly being
>> +different.
> 
> I would say
> 
>    TCG is the QEMU Tiny Code Generator; it is the JIT system we use
>    to emulate a guest CPU in software.
> 
> That's enough for users to understand what it means (I hope); if
> they want to know more specifics like about the intermediate
> representation they can follow the link.
> 

I'm ok with your definition, TCG is wider than the IR we use.

>> +
>> +It is one of the accelerator supported by QEMU, and supports a lot of
> 
> "accelerators"
> 
>> +guest/host architectures.
>> +
>> +User mode
>> +---------
>> +
>> +QEMU User mode allows to run programs for a guest architecture, on a host
>> +architecture, by translating system calls and using TCG. It is available for
>> +Linux and BSD.
>> +
>> +VirtIO
>> +------
>> +
>> +VirtIO is an open standard used to define and implement virtual devices with a
>> +minimal overhead, defining a set of data structures and hypercalls (similar to
>> +system calls, but targeting an hypervisor, which happens to be QEMU in our
>> +case). It's designed to be more efficient than emulating a real device, by
>> +minimizing the amount of interactions between a guest VM and its hypervisor.
>> +
>> +vhost-user
>> +----------
>> +
>> +`Vhost-user <vhost_user>` is an interface used to implement VirtIO devices
>> +outside of QEMU itself.
> 
> thanks
> -- PMM

Thanks for your review Peter!

Pierrick
