Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2177205wrt;
        Fri, 14 Dec 2018 07:18:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XhpJF0FTjIOCzGsjscc6+SqoMW+IQdJ925M0ECvM7PTgd7s9QlIk4lMgca6S54e7jPu0vg
X-Received: by 2002:aed:3bb8:: with SMTP id r53mr3174451qte.77.1544800721900;
        Fri, 14 Dec 2018 07:18:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544800721; cv=none;
        d=google.com; s=arc-20160816;
        b=wSgxKbmTEusFsoeJisU4Vbc2NtU3aQjicTblqXqMPuQmXKuFatS0wmHiN54PsmLWK/
         UETToAQPqHsCBzPQFTFcIQwB1kNx8Qw00mVs6GVc4d/v9AIRWBf/Zz0vOV7kj4Y4yHE/
         Cg/Vcpf057MOgTyEu3p+Ld1T/Po8QooGjFqpIw5DZUzav6dhp1PteuBwfyDZXQUX6l03
         cRynr8llXpAQScm1kACE71rDsLnQOUg3T2+YmcxdCukd4wdAUGptgvBOcfL13vmMeoIh
         GfcjIek3JBDb2ZTH8cRMsAYo/Ks1Jqvx3ersXNy8NMWKfeRjw4wcHk6KpFSdGvyF03wb
         AtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date;
        bh=Y+k/INGOJtD8HfCs8n0ZVdzo3iiG2oMBNkkk0LdYh40=;
        b=L+MschTrxPF/PhRqiaOwBAS9UI1CFZpYVJGv20qwnRVIl12f4NTNJTn//CmeFi+RhF
         RKDhp145mQBMRW+JsELrvmbeSYhbPwHdwa03GT+EMpu7skPrbWP7p5mDTapZif6SOPF+
         lsmuBIcZDfD5eQ9AWw/CM523LYCHj45OZrVHf+Ig3lHFQodzhqRvnssbHbh430a6UaLO
         s8idH8gWNx5tMqCWSUIeLfYFBXYj/mnognCCZA/xC60E2Ii12SZrthcq8Sez45SSO1q4
         82DC76XpYGzf4qrNbQQfmhmh4r72TapP+bfwOPqQW7SMx+wR5OZ5jMbE2hq3VsFb64nw
         rgIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mst@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s7si454334qvr.49.2018.12.14.07.18.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 07:18:41 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mst@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB96831256C8;
	Fri, 14 Dec 2018 15:18:40 +0000 (UTC)
Received: from redhat.com (ovpn-121-101.rdu2.redhat.com [10.10.121.101])
	by smtp.corp.redhat.com (Postfix) with SMTP id CDA58105705F;
	Fri, 14 Dec 2018 15:17:56 +0000 (UTC)
Date: Fri, 14 Dec 2018 10:17:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Amit Shah <amit@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Stefan Markovic <smarkovic@wavecomp.com>,
	Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Fam Zheng <famz@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	"open list:bochs" <qemu-block@nongnu.org>,
	"open list:Stellaris" <qemu-arm@nongnu.org>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	"open list:ppc4xx" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a few
Message-ID: <20181214101725-mutt-send-email-mst@kernel.org>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 14 Dec 2018 15:18:41 +0000 (UTC)
X-TUID: ngvww2sT3rh3

On Thu, Dec 13, 2018 at 11:37:37PM +0100, Paolo Bonzini wrote:
> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
> 
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.
> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.
> 
>     bsd-user/i386/target_syscall.h
>     bsd-user/x86_64/target_syscall.h
>     crypto/aes.c
>     hw/audio/fmopl.c
>     hw/audio/fmopl.h
>     hw/block/tc58128.c
>     hw/display/cirrus_vga.c
>     hw/display/xenfb.c
>     hw/dma/etraxfs_dma.c
>     hw/intc/sh_intc.c
>     hw/misc/mst_fpga.c
>     hw/net/pcnet.c
>     hw/sh4/sh7750.c
>     hw/timer/m48t59.c
>     hw/timer/sh_timer.c
>     include/crypto/aes.h
>     include/disas/bfd.h
>     include/hw/sh4/sh.h
>     libdecnumber/decNumber.c
>     linux-headers/asm-generic/unistd.h
>     linux-headers/linux/kvm.h
>     linux-user/alpha/target_syscall.h
>     linux-user/arm/nwfpe/double_cpdo.c
>     linux-user/arm/nwfpe/fpa11_cpdt.c
>     linux-user/arm/nwfpe/fpa11_cprt.c
>     linux-user/arm/nwfpe/fpa11.h
>     linux-user/flat.h
>     linux-user/flatload.c
>     linux-user/i386/target_syscall.h
>     linux-user/ppc/target_syscall.h
>     linux-user/sparc/target_syscall.h
>     linux-user/syscall.c
>     linux-user/syscall_defs.h
>     linux-user/x86_64/target_syscall.h
>     slirp/cksum.c
>     slirp/if.c
>     slirp/ip.h
>     slirp/ip_icmp.c
>     slirp/ip_icmp.h
>     slirp/ip_input.c
>     slirp/ip_output.c
>     slirp/mbuf.c
>     slirp/misc.c
>     slirp/sbuf.c
>     slirp/socket.c
>     slirp/socket.h
>     slirp/tcp_input.c
>     slirp/tcpip.h
>     slirp/tcp_output.c
>     slirp/tcp_subr.c
>     slirp/tcp_timer.c
>     slirp/tftp.c
>     slirp/udp.c
>     slirp/udp.h
>     target/cris/cpu.h
>     target/cris/mmu.c
>     target/cris/op_helper.c
>     target/sh4/helper.c
>     target/sh4/op_helper.c
>     target/sh4/translate.c
>     tcg/sparc/tcg-target.inc.c
>     tests/tcg/cris/check_addo.c
>     tests/tcg/cris/check_moveq.c
>     tests/tcg/cris/check_swap.c
>     tests/tcg/multiarch/test-mmap.c
>     ui/vnc-enc-hextile-template.h
>     ui/vnc-enc-zywrle.h
>     util/envlist.c
>     util/readline.c
> 
> The following have only TABs:
> 
>     bsd-user/i386/target_signal.h
>     bsd-user/sparc64/target_signal.h
>     bsd-user/sparc64/target_syscall.h
>     bsd-user/sparc/target_signal.h
>     bsd-user/sparc/target_syscall.h
>     bsd-user/x86_64/target_signal.h
>     crypto/desrfb.c
>     hw/audio/intel-hda-defs.h
>     hw/core/uboot_image.h
>     hw/sh4/sh7750_regnames.c
>     hw/sh4/sh7750_regs.h
>     include/hw/cris/etraxfs_dma.h
>     linux-user/alpha/termbits.h
>     linux-user/arm/nwfpe/fpopcode.h
>     linux-user/arm/nwfpe/fpsr.h
>     linux-user/arm/syscall_nr.h
>     linux-user/arm/target_signal.h
>     linux-user/cris/target_signal.h
>     linux-user/i386/target_signal.h
>     linux-user/linux_loop.h
>     linux-user/m68k/target_signal.h
>     linux-user/microblaze/target_signal.h
>     linux-user/mips64/target_signal.h
>     linux-user/mips/target_signal.h
>     linux-user/mips/target_syscall.h
>     linux-user/mips/termbits.h
>     linux-user/ppc/target_signal.h
>     linux-user/sh4/target_signal.h
>     linux-user/sh4/termbits.h
>     linux-user/sparc64/target_syscall.h
>     linux-user/sparc/target_signal.h
>     linux-user/x86_64/target_signal.h
>     linux-user/x86_64/termbits.h
>     pc-bios/optionrom/optionrom.h
>     slirp/mbuf.h
>     slirp/misc.h
>     slirp/sbuf.h
>     slirp/tcp.h
>     slirp/tcp_timer.h
>     slirp/tcp_var.h
>     target/i386/svm.h
>     target/sparc/asi.h
>     target/xtensa/core-dc232b/xtensa-modules.inc.c
>     target/xtensa/core-dc233c/xtensa-modules.inc.c
>     target/xtensa/core-de212/core-isa.h
>     target/xtensa/core-de212/xtensa-modules.inc.c
>     target/xtensa/core-fsf/xtensa-modules.inc.c
>     target/xtensa/core-sample_controller/core-isa.h
>     target/xtensa/core-sample_controller/xtensa-modules.inc.c
>     target/xtensa/core-test_kc705_be/core-isa.h
>     target/xtensa/core-test_kc705_be/xtensa-modules.inc.c
>     tests/tcg/cris/check_abs.c
>     tests/tcg/cris/check_addc.c
>     tests/tcg/cris/check_addcm.c
>     tests/tcg/cris/check_addoq.c
>     tests/tcg/cris/check_bound.c
>     tests/tcg/cris/check_ftag.c
>     tests/tcg/cris/check_int64.c
>     tests/tcg/cris/check_lz.c
>     tests/tcg/cris/check_openpf5.c
>     tests/tcg/cris/check_sigalrm.c
>     tests/tcg/cris/crisutils.h
>     tests/tcg/cris/sys.c
>     tests/tcg/i386/test-i386-ssse3.c
>     ui/vgafont.h
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Seems sane:
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
