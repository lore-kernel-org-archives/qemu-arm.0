Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1196704lfc;
        Tue, 10 Mar 2020 13:58:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuYlrxfFV3FLDC8xQ4F/TKB4Xm6LLhKEIn2kDIF2NgGnMzCBrrs3YKTAHZoAfnBgE+NsJX/
X-Received: by 2002:ad4:45a7:: with SMTP id y7mr100372qvu.146.1583873915304;
        Tue, 10 Mar 2020 13:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583873915; cv=none;
        d=google.com; s=arc-20160816;
        b=Ti171nyfIIkG/tbJjnEMvFm+o4r3+K3KS0Dv+FLd60eQgxmrStWWAMa9UhJchN5G1g
         hfh0x9t9wP42+DHhVruHLNYEYo/hSmNqRbhvXNjai/5tRrZ89fCQSzHhMo6PCkAFr2cJ
         8ZGLcjltTiQ2uD0RSV84oro1quSNthMJJu7Z3lSSsW2/HRCLCqwW4SAdqpWS+g4O8jx9
         kkZDuIhB/WMgvgeiPvNs4ynHDpDO7j1hqFro+AeSEjZ04y1jCy3l9lD0ZlkyQJOtdPKy
         WHQBQ5etEh4XJhUjGBHXGNngjXrV1n76bFnZkj6wHbNn1G3GjMb8g5VpUf4q/T01gEc6
         +UpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWn1NarZ6s09E6vxcTM6bLFFnz2rgiHJF6JcNWe8fuY=;
        b=uIpjrS+bjn3BpqkAuXDleLuPzbnLwQjkxKg1/aRHEeCF4Tb9F28fnSo1WuXfNQgr2C
         wFCredesNU3rmfGp2ttr63y5zPkEe8VhV8dj/2lDaVRavoinJUznlK52gXuF1fqA/95k
         YnAtl5D0I2kMB3t7MLcMVWEDGD1/vqfC3/LJ03vgw1GVmLtJIkFH5b6cUbiSFMHD+3gw
         cWVcR7MQSrQUW29KJZylynEHL+KAj/OnR1aNWIoNK3Fzgqzd7S4PuA4+wVOlkx2nTrqI
         gp82EmjpbXyd1qWhXGtzEcQO8WRrURmpDlLEyheE/A5Jo0o0+bCixq565edzft34HzIi
         btew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pnWO9w5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w54si3492614qtb.103.2020.03.10.13.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 13:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pnWO9w5s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBlxS-0004gJ-ON
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 16:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jBlxL-0004g0-59
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 16:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jBlxJ-0007Xb-4S
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 16:58:27 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:43126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jBlxI-0007XA-UU; Tue, 10 Mar 2020 16:58:25 -0400
Received: by mail-il1-x141.google.com with SMTP id o18so13306023ilg.10;
 Tue, 10 Mar 2020 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWn1NarZ6s09E6vxcTM6bLFFnz2rgiHJF6JcNWe8fuY=;
 b=pnWO9w5sgegDfzzvwLLW4dG2mjQfsGceFdtovIypDsGZDAjzlCJJjBHi7mfgXQepgY
 SkKKHOmgJIEzzCnKiRMJUsBiFZ3iTTxPEKrXwYehH3etyq6J7DLOBikM/9058jXAW0Zh
 R/iN1kxNjQOZBX08kBRvc3sNHQmCnAVh6lrKpIjYfxLXTpwhg2AvlxD9gTH5D0oqZLRN
 65Itx6X7WOMxOikzJbWB1gcfpiUT5Hon5o1KSH6NSgDbi4PDQIRVi1M+X7TXOz/D9eEV
 Tbod0pKqIFkriCuuEC4UfZ/NNFaQwZ503bh9yX/51gsu0/4sM85yivBREDE/nR2uKAXn
 fAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWn1NarZ6s09E6vxcTM6bLFFnz2rgiHJF6JcNWe8fuY=;
 b=nz5/7KHL5KWdyuONWcsDpCvm+3wu3tvj3liZQoU8y/LWK7TkwqbC2HEHTcf5iIPKz6
 V1uo5yhpkFoJ0YCdvP1cPwImm7ehxHHZ7RMy5jbkuG/N1Iai7flnh+V7NEQVS9HYpFld
 fHn4zxl5eesbp3DF2wMVjPVjxkrkVv/4eUFRUJNCAZa3vlntQ2Y6WlIC0ScbKta3s82M
 el8bf0gUHSl2Ogfc/hhTCPw+rr0y+TnPyw7Pv4JO2Bi4Lvwy0AQvjUK6S+E8Nh3mXZ4V
 TkY+VOFqQ0x6ebtAWUeCQ9G9QFzow20w8868WwW7UgLnFdJjgEGqcmz/00t9LQCmgpQa
 R8yg==
X-Gm-Message-State: ANhLgQ2x1sZLj2b1XkqwEZHHue36dgLsMWnS2DNAHjEcPbiWdtVHH496
 R4008v8+0llk2L6SnojyXAFg1oJzmh//CCxnHXJl5A==
X-Received: by 2002:a92:9e99:: with SMTP id s25mr6736674ilk.306.1583873904348; 
 Tue, 10 Mar 2020 13:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-4-peter.maydell@linaro.org>
In-Reply-To: <20200309215818.2021-4-peter.maydell@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 10 Mar 2020 21:58:13 +0100
Message-ID: <CAPan3WqmOAwOqJkEKBTp9vtJq0uUGcAp92vXRQyzu8_Quv38PA@mail.gmail.com>
Subject: Re: [PATCH 3/5] docs/system/target-arm.rst: Add some introductory text
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000070137005a08661ee"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i1jpAfBOYY1P

--00000000000070137005a08661ee
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

On Mon, Mar 9, 2020 at 10:58 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Now we've moved the various bits of per-board documentation into
> their own files, the top level document is a little bare. Add
> some introductory information, including a note that many
> of the board models we support are currently undocumented.
>
> (Most sections of this new text were originally written by me
> for the wiki page https://wiki.qemu.org/Documentation/Platforms/ARM)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> ---
>  docs/system/target-arm.rst | 66 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index c7df6fc1f97..86ea6f2f568 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -1,9 +1,71 @@
>  .. _ARM-System-emulator:
>
> -ARM System emulator
> +Arm System emulator
>  -------------------
>
> -Use the executable ``qemu-system-arm`` to simulate a ARM machine.
> +QEMU can emulate both 32-bit and 64-bit Arm CPUs. Use the
> +``qemu-system-aarch64`` executable to simulate a 64-bit Arm machine.
> +You can use either ``qemu-system-arm`` or ``qemu-system-aarch64``
> +to simulate a 32-bit Arm machine: in general, command lines that
> +work for ``qemu-system-arm`` will behave the same when used with
> +``qemu-system-aarch64``.
> +
> +QEMU has generally good support for Arm guests. It has support for
> +nearly fifty different machines. The reason we support so many is that
> +Arm hardware is much more widely varying than x86 hardware. Arm CPUs
> +are generally built into "system-on-chip" (SoC) designs created by
> +many different companies with different devices, and these SoCs are
> +then built into machines which can vary still further even if they use
> +the same SoC. Even with fifty boards QEMU does not cover more than a
> +small fraction of the Arm hardware ecosystem.
> +
> +The situation for 64-bit Arm is fairly similar, except that we don't
> +implement so many different machines.
> +
> +As well as the more common "A-profile" CPUs (which have MMUs and will
> +run Linux) QEMU also supports "M-profile" CPUs such as the Cortex-M0,
> +Cortex-M4 and Cortex-M33 (which are microcontrollers used in very
> +embedded boards). For most boards the CPU type is fixed (matching what
> +the hardware has), so typically you don't need to specify the CPU type
> +by hand, except for special cases like the ``virt`` board.
> +
> +Choosing a board model
> +======================
> +
> +For QEMU's Arm system emulation, you must specify which board
> +model you want to use with the ``-M`` or ``--machine`` option;
> +there is no default.
> +
> +Because Arm systems differ so much and in fundamental ways, typically
> +operating system or firmware images intended to run on one machine
> +will not run at all on any other. This is often surprising for new
> +users who are used to the x86 world where every system looks like a
> +standard PC. (Once the kernel has booted, most userspace software
> +cares much less about the detail of the hardware.)
> +
> +If you already have a system image or a kernel that works on hardware
> +and you want to boot with QEMU, check whether QEMU lists that machine
> +in its ``-machine help`` output. If it is listed, then you can probably
> +use that board model. If it is not listed, then unfortunately your image
> +will almost certainly not boot on QEMU. (You might be able to
> +extract the filesystem and use that with a different kernel which
> +boots on a system that QEMU does emulate.)
> +
> +If you don't care about reproducing the idiosyncrasies of a particular
> +bit of hardware, such as small amount of RAM, no PCI or other hard
> +disk, etc., and just want to run Linux, the best option is to use the
> +``virt`` board. This is a platform which doesn't correspond to any
> +real hardware and is designed for use in virtual machines. You'll
> +need to compile Linux with a suitable configuration for running on
> +the ``virt`` board. ``virt`` supports PCI, virtio, recent CPUs and
> +large amounts of RAM. It also supports 64-bit CPUs.
> +
> +Board-specific documentation
> +============================
> +
> +Unfortunately many of the Arm boards QEMU supports are currently
> +undocumented; you can get a complete list by running
> +``qemu-system-aarch64 --machine help``.
>
>  .. toctree::
>
> --
> 2.20.1
>
>

-- 
Niek Linnenbank

--00000000000070137005a08661ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklin=
nenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 =
at 10:58 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">p=
eter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Now we&#39;ve moved the various bits of per-board do=
cumentation into<br>
their own files, the top level document is a little bare. Add<br>
some introductory information, including a note that many<br>
of the board models we support are currently undocumented.<br>
<br>
(Most sections of this new text were originally written by me<br>
for the wiki page <a href=3D"https://wiki.qemu.org/Documentation/Platforms/=
ARM" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Documentati=
on/Platforms/ARM</a>)<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
---<br>
---<br>
=C2=A0docs/system/target-arm.rst | 66 ++++++++++++++++++++++++++++++++++++-=
-<br>
=C2=A01 file changed, 64 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst<br>
index c7df6fc1f97..86ea6f2f568 100644<br>
--- a/docs/system/target-arm.rst<br>
+++ b/docs/system/target-arm.rst<br>
@@ -1,9 +1,71 @@<br>
=C2=A0.. _ARM-System-emulator:<br>
<br>
-ARM System emulator<br>
+Arm System emulator<br>
=C2=A0-------------------<br>
<br>
-Use the executable ``qemu-system-arm`` to simulate a ARM machine.<br>
+QEMU can emulate both 32-bit and 64-bit Arm CPUs. Use the<br>
+``qemu-system-aarch64`` executable to simulate a 64-bit Arm machine.<br>
+You can use either ``qemu-system-arm`` or ``qemu-system-aarch64``<br>
+to simulate a 32-bit Arm machine: in general, command lines that<br>
+work for ``qemu-system-arm`` will behave the same when used with<br>
+``qemu-system-aarch64``.<br>
+<br>
+QEMU has generally good support for Arm guests. It has support for<br>
+nearly fifty different machines. The reason we support so many is that<br>
+Arm hardware is much more widely varying than x86 hardware. Arm CPUs<br>
+are generally built into &quot;system-on-chip&quot; (SoC) designs created =
by<br>
+many different companies with different devices, and these SoCs are<br>
+then built into machines which can vary still further even if they use<br>
+the same SoC. Even with fifty boards QEMU does not cover more than a<br>
+small fraction of the Arm hardware ecosystem.<br>
+<br>
+The situation for 64-bit Arm is fairly similar, except that we don&#39;t<b=
r>
+implement so many different machines.<br>
+<br>
+As well as the more common &quot;A-profile&quot; CPUs (which have MMUs and=
 will<br>
+run Linux) QEMU also supports &quot;M-profile&quot; CPUs such as the Corte=
x-M0,<br>
+Cortex-M4 and Cortex-M33 (which are microcontrollers used in very<br>
+embedded boards). For most boards the CPU type is fixed (matching what<br>
+the hardware has), so typically you don&#39;t need to specify the CPU type=
<br>
+by hand, except for special cases like the ``virt`` board.<br>
+<br>
+Choosing a board model<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+For QEMU&#39;s Arm system emulation, you must specify which board<br>
+model you want to use with the ``-M`` or ``--machine`` option;<br>
+there is no default.<br>
+<br>
+Because Arm systems differ so much and in fundamental ways, typically<br>
+operating system or firmware images intended to run on one machine<br>
+will not run at all on any other. This is often surprising for new<br>
+users who are used to the x86 world where every system looks like a<br>
+standard PC. (Once the kernel has booted, most userspace software<br>
+cares much less about the detail of the hardware.)<br>
+<br>
+If you already have a system image or a kernel that works on hardware<br>
+and you want to boot with QEMU, check whether QEMU lists that machine<br>
+in its ``-machine help`` output. If it is listed, then you can probably<br=
>
+use that board model. If it is not listed, then unfortunately your image<b=
r>
+will almost certainly not boot on QEMU. (You might be able to<br>
+extract the filesystem and use that with a different kernel which<br>
+boots on a system that QEMU does emulate.)<br>
+<br>
+If you don&#39;t care about reproducing the idiosyncrasies of a particular=
<br>
+bit of hardware, such as small amount of RAM, no PCI or other hard<br>
+disk, etc., and just want to run Linux, the best option is to use the<br>
+``virt`` board. This is a platform which doesn&#39;t correspond to any<br>
+real hardware and is designed for use in virtual machines. You&#39;ll<br>
+need to compile Linux with a suitable configuration for running on<br>
+the ``virt`` board. ``virt`` supports PCI, virtio, recent CPUs and<br>
+large amounts of RAM. It also supports 64-bit CPUs.<br>
+<br>
+Board-specific documentation<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
+<br>
+Unfortunately many of the Arm boards QEMU supports are currently<br>
+undocumented; you can get a complete list by running<br>
+``qemu-system-aarch64 --machine help``.<br>
<br>
=C2=A0.. toctree::<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--00000000000070137005a08661ee--
