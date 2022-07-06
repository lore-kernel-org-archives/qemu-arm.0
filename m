Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4533593lft;
        Wed, 6 Jul 2022 01:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sx9eQN5b/tPZdt/8Jnk9fq0iM00QJbRiTGsEFXLY/a/Xum8QjZBZFeZtjvmE9LCmJvDqwX
X-Received: by 2002:a05:6214:27ce:b0:470:596b:4e82 with SMTP id ge14-20020a05621427ce00b00470596b4e82mr35791994qvb.118.1657095729162;
        Wed, 06 Jul 2022 01:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657095729; cv=none;
        d=google.com; s=arc-20160816;
        b=o74LBf7mT4rejrigwA4DvElnZKqzH0fp3p6LW6JO+KhlbdumbsB7zoe9leaKm6OrQL
         ULMlxhrLTTybQmGX0qoBQFTLQPyeRPjXxZlcO6OD+i+UknnubXsdbaOQplu8AFV+Dw3M
         3assE54WnWyAC+VH+2AKSmRGBQMS8Cq1YpxgfbG2U/rEiswVe940CJBwijTglknUMK/Q
         a+GAInlIH9qcvVhGQE4aetFq2BqkpkP1g0jozOlmlCCbDjAwJzvZyJ5JXA6F9mIww8f8
         nlkaTyehxgyL1HaY8E53yUND7zK3qg7sdMLdWlv+vL3prTlamjqeCrc980OYY2IDCYYZ
         JShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H0K718I/3+NmaYpZnMhTUJO1E3ZmMje2B/Ich65mo/U=;
        b=twYRzaX1rnIBqR7H5WsXc11aYN0vFbY5347gf0PnmePijVUNWwBgnKViSZTgX0j80x
         8vYf6COqmmzi+CabT4Bwwas+mYCeM5kbMjkF9rK4M+v/RCKrdOuMo0Ft0n1jIQLzABHe
         NCZ5y/s6PkeltRUUTkHimuGMypioL9/HTNzWqB2OT6gLu2MDqFzSXkC/bDA9pPX6sP/i
         H2cgYkxrNgr2paKG6rCEE2GZqzIaNywg8PLmz4mJ8iH9TicUOxDc4M95k9d+n1FZ5Xnb
         WAbCs7fIQ6quhb/bDfLSmrKqf6nAUfU/NYysHFxr993229M50LWo09jYb3FohAIVaR7k
         tBMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=nppp9rHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a05622a018f00b0031a320bb69dsi19317387qtw.293.2022.07.06.01.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=nppp9rHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90IS-0003kp-GR
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o90Hr-0003jF-Ck; Wed, 06 Jul 2022 04:21:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o90Ho-0007WB-Bj; Wed, 06 Jul 2022 04:21:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id s1so20868742wra.9;
 Wed, 06 Jul 2022 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0K718I/3+NmaYpZnMhTUJO1E3ZmMje2B/Ich65mo/U=;
 b=nppp9rHEVqYYbQc25CR/6l3DcAIaea5iXIBKnWb8cQBeccBnmIb5gfPjcuTAFUGY+0
 uOifsjg2+88k/vV2Yjeiz/hWwAQW7RBgtQ4ykRDFM/g0tyHzEveRu84mliNNHZimwWfx
 LHSbol4enEHwJmZ4BelFVl1Q0JF9LDs8G70ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0K718I/3+NmaYpZnMhTUJO1E3ZmMje2B/Ich65mo/U=;
 b=SzqN68j4bAons/+agjPgvCwxRhV4AMMsue3zV3hHkFfkWoesp70aeC7c3CKDWL+Hes
 Bu4poS7AMnVd5eKxJxJHVmS9kL4DqlhaXAtMv8ZAAxo6pj9iU6o/6NABmaNZIFW8H9o9
 Y34KP6490d1zmx+Ko8E833490bdxdoSMHipg3o3zQgygi+i6Y/0Ui8oGOjnGb7mwqt12
 gudltgfwXjV6xgYh6phPcvqaWYdpdg0MnmDW53leONY/eKbhAAfzWsP2eOOzu2Npuye5
 7d3Ox7KNpJ/IcivN0MUeUirwP19RmFpzd+BMRBlWBh+ybJFA3C5sDLVr7rQ5g7H5R7H9
 9uOg==
X-Gm-Message-State: AJIora/C3Flxr8pbxd7t8gjtr0rOU+XbBcV4T00omrp7Vi1qsDH6v2zZ
 thc091JVAawiEJtZ5IdTbHnXXkq1fPspV7n2tzw=
X-Received: by 2002:a05:6000:993:b0:21b:8f16:5b3f with SMTP id
 by19-20020a056000099300b0021b8f165b3fmr33949075wrb.628.1657095684546; Wed, 06
 Jul 2022 01:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-10-peter@pjd.dev>
In-Reply-To: <20220705191400.41632-10-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Jul 2022 08:21:12 +0000
Message-ID: <CACPK8Xd4iR1kdZRx8CCQn1n7w4L6ZUQhcyuUOGfinX6qbPOY-w@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] docs: aspeed: Add fby35 multi-SoC machine section
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwyNpg3cJ5dd

On Tue, 5 Jul 2022 at 19:14, Peter Delevoryas <peter@pjd.dev> wrote:
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  docs/system/arm/aspeed.rst | 48 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 5d0a7865d3..b233191b67 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -136,6 +136,54 @@ AST1030 SoC based machines :
>
>  - ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
>
> +Facebook Yosemite v3.5 Platform and CraterLake Server (``fby35``)
> +==================================================================
> +
> +Facebook has a series of multi-node compute server designs named
> +Yosemite. The most recent version released was
> +`Yosemite v3 <https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf>`.
> +
> +Yosemite v3.5 is an iteration on this design, and is very similar: there's a
> +baseboard with a BMC, and 4 server slots. The new server board design termed
> +"CraterLake" includes a Bridge IC (BIC), with room for expansion boards to
> +include various compute accelerators (video, inferencing, etc). At the moment,
> +only the first server slot's BIC is included.
> +
> +Yosemite v3.5 is itself a sled which fits into a 40U chassis, and 3 sleds
> +can be fit into a chassis. See `here <https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server>`
> +for an example.
> +
> +In this generation, the BMC is an AST2600 and each BIC is an AST1030. The BMC
> +runs `OpenBMC <https://github.com/facebook/openbmc>`, and the BIC runs
> +`OpenBIC <https://github.com/facebook/openbic>`.
> +
> +Firmware images can be retrieved from the Github releases or built from the
> +source code, see the README's for instructions on that. This image uses the
> +"fby35" machine recipe from OpenBMC, and the "yv35-cl" target from OpenBIC.
> +Some reference images can also be found here:
> +
> +.. code-block:: bash
> +
> +    $ wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
> +    $ wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> +
> +Since this machine has multiple SoC's, each with their own serial console, the
> +recommended way to run it is to allocate a pseudoterminal for each serial
> +console and let the monitor use stdio. Also, starting in a paused state is
> +useful because it allows you to attach to the pseudoterminals before the boot
> +process starts.
> +
> +.. code-block:: bash
> +
> +    $ qemu-system-arm -machine fby35 \
> +        -drive file=fby35.mtd,format=raw,if=mtd \
> +        -device loader,file=Y35BCL.elf,addr=0,cpu-num=2 \

I came across a quirk of the qemu commandline when testing.

-drive knows how to expand ~ in a path, but -device loader does not.
Something for someone to look into on a rainy day!

eg:

$ build/qemu-system-arm -M fby35 -drive
file=~/tmp/fby35.mtd,format=raw,if=mtd -device
loader,file=~/tmp/Y35BCL.elf,addr=0,cpu-num=2 -serial pty -serial pty
-serial mon:stdio -display none -S
char device redirected to /dev/pts/3 (label serial0)
char device redirected to /dev/pts/5 (label serial1)
qemu-system-arm: warning: Aspeed iBT has no chardev backend
~/tmp/Y35BCL.elf: No such file or directory
qemu-system-arm: -device
loader,file=~/tmp/Y35BCL.elf,addr=0,cpu-num=2: Cannot load specified
image ~/tmp/Y35BCL.elf

loader uses open(2) in load_elf_ram_sym.

The call stack for -drive looks like this (using a bad path to make it
easier to identify what's going on):

#0  __libc_open64 (file=file@entry=0xaaaaac009250
"/home/joel/tmp/fby35.mtda", oflag=oflag@entry=524288) at
../sysdeps/unix/sysv/linux/open64.c:37
#1  0x0000aaaaab3b18bc in open64 (__oflag=524288,
__path=0xaaaaac009250 "/home/joel/tmp/fby35.mtda") at
/usr/include/aarch64-linux-gnu/bits/fcntl2.h:59
#2  qemu_open_cloexec (mode=0, flags=0, name=0xaaaaac009250
"/home/joel/tmp/fby35.mtda") at ../util/osdep.c:286
#3  qemu_open_internal (name=name@entry=0xaaaaac009250
"/home/joel/tmp/fby35.mtda", flags=flags@entry=0, mode=mode@entry=0,
errp=errp@entry=0xffffffffeb70) at ../util/osdep.c:330
#4  0x0000aaaaab3b1f30 in qemu_open (name=name@entry=0xaaaaac009250
"/home/joel/tmp/fby35.mtda", flags=flags@entry=0,
errp=errp@entry=0xffffffffeb70) at ../util/osdep.c:360
#5  0x0000aaaaab30d9d8 in raw_open_common (bs=0xaaaaac002c40,
options=<optimized out>, bdrv_flags=155650, open_flags=<optimized
out>, device=<optimized out>, errp=0xffffffffeb70)
    at ../block/file-posix.c:680
#6  0x0000aaaaab2a53d0 in bdrv_open_driver
(bs=bs@entry=0xaaaaac002c40, drv=drv@entry=0xaaaaabc13250 <bdrv_file>,
node_name=<optimized out>, options=options@entry=0xaaaaac008230,
    open_flags=open_flags@entry=155650,
errp=errp@entry=0xffffffffec18) at ../block.c:1625
#7  0x0000aaaaab2a9454 in bdrv_open_common (errp=0xffffffffec18,
options=0xaaaaac008230, file=0x0, bs=0xaaaaac002c40) at
../block.c:1922
#8  bdrv_open_inherit (filename=<optimized out>,
filename@entry=0xaaaaabff9cd0 "/home/joel/tmp/fby35.mtda",
reference=reference@entry=0x0, options=0xaaaaac008230,
flags=<optimized out>,
    flags@entry=0, parent=parent@entry=0xaaaaabffb580,
child_class=child_class@entry=0xaaaaab864498 <child_of_bds>,
child_role=child_role@entry=19, errp=errp@entry=0xffffffffed48)
    at ../block.c:3991
#9  0x0000aaaaab2aa35c in bdrv_open_child_bs
(filename=filename@entry=0xaaaaabff9cd0 "/home/joel/tmp/fby35.mtda",
options=options@entry=0xaaaaac000a50,
    bdref_key=bdref_key@entry=0xaaaaab573010 "file",
parent=parent@entry=0xaaaaabffb580,
child_class=child_class@entry=0xaaaaab864498 <child_of_bds>,
child_role=child_role@entry=19,
    allow_none=allow_none@entry=true, errp=errp@entry=0xffffffffed48)
at ../block.c:3624
#10 0x0000aaaaab2a98e4 in bdrv_open_inherit
(filename=filename@entry=0xaaaaabff9cd0 "/home/joel/tmp/fby35.mtda",
reference=reference@entry=0x0, options=0xaaaaac000a50,
    options@entry=0xaaaaabff8b70, flags=<optimized out>,
parent=parent@entry=0x0, child_class=child_class@entry=0x0,
child_role=child_role@entry=0,
    errp=errp@entry=0xaaaaabc62368 <error_fatal>) at ../block.c:3938
#11 0x0000aaaaab2aa758 in bdrv_open
(filename=filename@entry=0xaaaaabff9cd0 "/home/joel/tmp/fby35.mtda",
reference=reference@entry=0x0, options=options@entry=0xaaaaabff8b70,
    flags=<optimized out>, errp=errp@entry=0xaaaaabc62368
<error_fatal>) at ../block.c:4086
#12 0x0000aaaaab2c59c8 in blk_new_open
(filename=filename@entry=0xaaaaabff9cd0 "/home/joel/tmp/fby35.mtda",
reference=reference@entry=0x0, options=options@entry=0xaaaaabff8b70,
    flags=<optimized out>, errp=errp@entry=0xaaaaabc62368
<error_fatal>) at ../block/block-backend.c:454
#13 0x0000aaaaab2956c8 in blockdev_init
(file=file@entry=0xaaaaabff9cd0 "/home/joel/tmp/fby35.mtda",
bs_opts=bs_opts@entry=0xaaaaabff8b70, errp=errp@entry=0xaaaaabc62368
<error_fatal>)
    at ../blockdev.c:592
#14 0x0000aaaaab296884 in drive_new (all_opts=0xaaaaabd1a3b0,
block_default_type=<optimized out>, errp=0xaaaaabc62368 <error_fatal>)
at ../blockdev.c:981
#15 0x0000aaaaaafea1e8 in drive_init_func (opaque=<optimized out>,
opts=<optimized out>, errp=<optimized out>) at ../softmmu/vl.c:648
#16 0x0000aaaaab3c0a74 in qemu_opts_foreach (list=<optimized out>,
func=func@entry=0xaaaaaafea1d0 <drive_init_func>,
opaque=opaque@entry=0xaaaaabf3eb58,
    errp=errp@entry=0xaaaaabc62368 <error_fatal>) at ../util/qemu-option.c:1135
#17 0x0000aaaaaafee9d8 in configure_blockdev (bdo_queue=0xaaaaabb866c0
<bdo_queue>, snapshot=0, machine_class=0xaaaaabf3eab0) at
../softmmu/vl.c:707
#18 qemu_create_early_backends () at ../softmmu/vl.c:1882
#19 qemu_init (argc=<optimized out>, argv=0xfffffffff358,
envp=envp@entry=0x0) at ../softmmu/vl.c:3502
#20 0x0000aaaaaadb4300 in qemu_main (envp=0x0, argv=<optimized out>,
argc=<optimized out>) at ../softmmu/main.c:35
#21 main (argc=<optimized out>, argv=<optimized out>) at ../softmmu/main.c:45

and that was where I lost interest.


> +        -serial pty -serial pty -serial mon:stdio \
> +        -display none -S
> +    $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
> +    $ screen /dev/tty1
> +    $ (qemu) c            # Start the boot process once screen is setup.
> +
>  Supported devices
>  -----------------
>
> --
> 2.37.0
>
