Received: by 10.25.77.65 with SMTP id a62csp261935lfb;
        Thu, 26 Jan 2017 07:27:18 -0800 (PST)
X-Received: by 10.55.158.129 with SMTP id h123mr3240697qke.53.1485444438042;
        Thu, 26 Jan 2017 07:27:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55si1348585qts.215.2017.01.26.07.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 07:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWlxD-0005er-6U
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 10:27:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cWluf-0003P8-CJ
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 10:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cWlud-0001KT-E4
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 10:24:37 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:64223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1cWluC-00011e-0l; Thu, 26 Jan 2017 10:24:29 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MFtRO-1ckXFf1rl8-00EsBR; Thu, 26 Jan 2017 16:22:17 +0100
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1485443388-27253-1-git-send-email-armbru@redhat.com>
	<1485443388-27253-4-git-send-email-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a931c7d6-e4e7-6d81-4828-e4258caf9d89@vivier.eu>
Date: Thu, 26 Jan 2017 16:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485443388-27253-4-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:3YX7Xac8ldRIbMrknLGBM5b3anCsvTPh1yASHTLHJXYCGNmhEzy
	n+6Pici1qgVslq4l193AFCzIIky8DbH2XrYT5QZN/a20qwQ32+f+01p408/AkjtoQu8HxwJ
	vy+o1smKA5uJnUa/KI3KUwmehhCc3SGAxjVgsLCpSx5cCCcTQw7wpI4NR9d4Q2Q2FsninYk
	FFRQm0XJ0JwdGt9O2v9Cw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ZYSEh8K8tIg=:lJQam8W/GFyvI8siee1Lhn
	btchdKGggKpboniOm9AUGNxI23G/2EtEmmLGIexABxEKY14AitmpCt/0/arNawod4iy9BTsZO
	wFkRRJ/E0Vbk1oGaI4peWe8F3ySqH9joX9hU1bI+A3Mb4kK7N1QcnhqJ2d2Hnk7Z1suFb/lTc
	cPyvEV8w+NSq5X83b2bi/HmZWyXkqZWcffN5NBPf6dPmKqrk8WYA+rLnX1aB78BDB2OCifjgJ
	9zN6+uGDcodXFF4JE++O+Sow6MDIHs/m9m0bRjY5pimDnG9agnr0CdF7exgSqRYrF7ASE3afO
	xEV/X3RPbAEhSRQ+dtN3IMcNUWsiIaA9ogfjtLJcFQKcnGJzc5ww3T4swP/peUmLag6KoApyy
	qhuD/dcLYQTDOpQcOJWlzADnNlw/G8ckY/CMQnctlw27//RtgXI1K+M36JFbD3SF0BNl5b4rP
	Qv0Syy964NhJLDNo6cCwTwRRHdAyFwHGGmEpZAajX2pTo8Wu3kd0+K2FGxP33nRyaTqBFqheD
	dTYjM4dNzvxK8MgpbsBamV793NaqAwRFCrg+0q/C6cl/eQ2O4VEX+CFCPFy3eH1YR6JH8KT/p
	T5Xjuc4XVNxVmprE/eg0deMz7ifwwzNHVMf5yYN4rKMkvuZAaPq2iGLohaVCJTimAJwWB92GL
	RxG7AKdlbhPmzLG+udrjwSxOQIAX1KJG4cEbqOkNl2hcMdNRRZNmxw/Z5HPwKdRide3d9MM+s
	r2G4UCMfRAcDhI7U
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-arm] [PATCH v2 3/8] hw: Default -drive to if=none instead
 of ide when ide cannot work
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jia Liu <proljc@gmail.com>, qemu-block@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>,
	Fabien Chouteau <chouteau@adacore.com>, mreitz@redhat.com,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, xen-devel@lists.xensource.com,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wpmW+Q1JtNp/

Le 26/01/2017 à 16:09, Markus Armbruster a écrit :
> Block backends defined with -drive if=ide are meant to be picked up by
> machine initialization code: a suitable frontend gets created and
> wired up automatically.
> 
> if=ide drives not picked up that way can still be used with -device as
> if they had if=none, but that's unclean and best avoided.  Unused ones
> produce an "Orphaned drive without device" warning.
> 
> -drive parameter "if" is optional, and the default depends on the
> machine type.  If a machine type doesn't specify a default, the
> default is "ide".
> 
> Many machine types implicitly default to if=ide that way, even though
> they don't actually have an IDE controller.  This makes no sense.
> 
> Change the implicit default to if=none.  Affected machines:
> 
> * all targets: none
> * aarch64/arm: akita ast2500 canon cheetah collie connex imx25
>   integratorcp kzm lm3s6965evb lm3s811evb mainstone musicpal n800 n810
>   netduino2 nuri palmetto realview romulus sabrelite smdkc210 sx1 sx1
>   verdex z2
> * cris: axis-dev88
> * i386/x86_64: xenpv
> * lm32: lm32-evr lm32-uclinux milkymist
> * m68k: an5206 dummy mcf5208evb
> * microblaze/microblazeel: petalogix-ml605 petalogix-s3adsp1800
> * mips/mips64/mips64el/mipsel: mipssim
> * moxie: moxiesim
> * or32: or32-sim
> * ppc/ppc64/ppcemb: bamboo ref405ep taihu virtex-ml507
> * ppc/ppc64: mpc8544ds ppce500
> * sh4/sh4eb: shix
> * sparc: leon3_generic
> * sparc64: niagara
> * tricore: tricore_testboard
> * unicore32: puv3
> * xtensa/xtensaeb: kc705 lx200 lx60 ml605 sim
> 
> None of these machines have an IDE controller, let alone code to
> honor if=ide.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: xen-devel@lists.xensource.com
> Cc: Michael Walle <michael@walle.cc>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Anthony Green <green@moxielogic.com>
> Cc: Jia Liu <proljc@gmail.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: qemu-ppc@nongnu.org
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Fabien Chouteau <chouteau@adacore.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>
> ---
>  include/sysemu/blockdev.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 16432f3..351a039 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -19,12 +19,11 @@ void blockdev_auto_del(BlockBackend *blk);
>  typedef enum {
>      IF_DEFAULT = -1,            /* for use with drive_add() only */
>      /*
> -     * IF_IDE must be zero, because we want MachineClass member
> -     * block_default_type to default-initialize to IF_IDE
> +     * IF_NONE must be zero, because we want MachineClass member
> +     * block_default_type to default-initialize to IF_NONE
>       */
> -    IF_IDE = 0,
> -    IF_NONE,
> -    IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
> +    IF_NONE = 0,
> +    IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
>      IF_COUNT
>  } BlockInterfaceType;
>  
> 
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

