Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1319086ejb;
        Wed, 19 Jun 2024 04:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfbE8V9QrHjFSMot3zoRbSG7zGPz5jaYSDc9J/iA6gdTsn64wZeJdfjtzNFi0kMXlSOLad/dpDYrORPrki2xxuAcRvMlf9
X-Google-Smtp-Source: AGHT+IGgtOHAhQ6ob53aXY7ehxE+VqQD9o5NWa7OeUUpJksKvRHhusIKAuR26cpmLGZUrMK+NMgM
X-Received: by 2002:a81:f90d:0:b0:630:2749:2f4d with SMTP id 00721157ae682-63a8faf11abmr22497317b3.36.1718794811221;
        Wed, 19 Jun 2024 04:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718794811; cv=none;
        d=google.com; s=arc-20160816;
        b=uIDwARqaWVGMN/liaEczPMAwESsZUG5MdsR+ucwxHzWGeXzIMDrHTNJDBuNegNseLT
         mBFmh1kHdD9gZyYyw0xuYgX91JTGCqm+3nrKzEwwPjCME92MJTPVV2jJ7/wed4zHHoKj
         Q9tGcib4hLJr8XE8UJJ2310ETHRJK0XlSuKXy4qcNEltpdKYaH/uxcd1zUOvxCKvYF02
         xPxNemdcdYI19J4z9q2IyxqcoDXp5ryblPfdcKJwc/gRtdD+j9KtedEsgqQeucP1fLwl
         vENyqRrKv4SJ4y9+ruHgWMtNVLfST4SztAqps/mh3ZxCe1+ijMzNYJ1bLTmlnAL2Yrbz
         0RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Rcsm0WTpEK47jKA5v+GiLW3VbApfllbaJlLioDKBEHg=;
        fh=WbNoenrrnDy/vjK1MKe1TQUCxwGLlFlm8QLNBfGt2LI=;
        b=aHenisdO/QaSeaugY0QSSF9rCMJy7OyBeiGhW7xOSSp3OjQ8iEAee+rrnAJW0zgpsm
         nmMJKNlXKMwgVBHklj1TuA4qdHyOkRnR/asnUnGEFNOLvJAkBlrCCsbxx43sKA+i2RdN
         t1moauVsWBykkizKWMERhOHSI/NQvfnUluMl3T51KY/tJT1r9fwrewyIUJaVuTqNHcVP
         pFMhET2Qt8m4pvobZjiFrDchhHaKiRDPyvxQGyEddSt7fmFwpyrlkdAc4TEVBCnNB8Tf
         /POhD22KYPThMPT9o6d05zsKz3ZNk27X6VTpYOlWGNHtprVC+M2PU/N+ytlpAeibdxrm
         N8bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LubsFcWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5a1541asi142007746d6.96.2024.06.19.04.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 04:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LubsFcWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJt2n-0006Hm-Sp; Wed, 19 Jun 2024 07:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sJt2m-0006Gn-L7; Wed, 19 Jun 2024 07:00:00 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1sJt2k-0004Tf-GL; Wed, 19 Jun 2024 07:00:00 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so178156a12.1; 
 Wed, 19 Jun 2024 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718794797; x=1719399597; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rcsm0WTpEK47jKA5v+GiLW3VbApfllbaJlLioDKBEHg=;
 b=LubsFcWcQkeGrzXLYcgVMVgkYaaCLpkcQje5Dtuf5L4RiBywDdcI636ShyqWeprggi
 H4cg2rlFLLPq7K+aGJMFmbOYaxaVI4o8h77vY6iacO6T9igffUaD+VJJV7tQdrOhYhnj
 bqokuQ2BxLDhy3B+aimhbfAp3XQKS6uxv/lQeDlTDG+00DEFrfZ9L62wEiNimoIG6Z4s
 ItAzf0dlpeqcRY/UbavwDPlnVAFLMYjbqJLkwRKCM/ajWtY0OHIqCLEzolQeeSXUgvav
 kaTwktg0Jhk/FQuLQ0IJf5plinYWmoBqLCUOhWKoCh8LjL/yofM+rfnIOEtmAxlRoxnR
 ttxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718794797; x=1719399597;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rcsm0WTpEK47jKA5v+GiLW3VbApfllbaJlLioDKBEHg=;
 b=eCPi4qYzI31rX8mkl2LQ9yWc1dTyTor/xBnyM4uFAh918tHR9wrwnUVjR3fCR6tDcK
 M6GSO2B+HhHmN40jfTg1XRML6DqxMGt8zUWR2fCFqjsI1jz3o5aZpGxKzzWOtFcRBHzq
 f3/BiYP4G1EZ7Q5KyP5LXdxUvuCivhWOlITL2QKAQt07iTzOEQfwc4exsniNdkg5a42C
 8HTWm1xUiz7a9kH3We5f0aVy3xqORAxzewaOhRm+Mh8zOb3dhhA+rbkTdiftH9GLjOdV
 Dga/ETHkJrXGhLT/3i6EYyszGhMS9U63IIXnnURQe5yx4v8PGkmdRkMgy/rZ+LvFpWSf
 TMPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVblll3YC9coBZFUWCvegQlP81CV2RkYIOHOHORR8Z1fTiJHYBRnOvmOZp9KOJ/JZphgs2BJxVYRwpe8eNElFZLugKIFFA=
X-Gm-Message-State: AOJu0YyNyiVGrdd+cbXqSWHGwOA4zPBx1sZRzLuEH9j2gUchoeQVctxC
 Q3v5+O4MQxriKZ1RjX0M8o2SNvRnJdiHsN8lvmhuU3h/HlcfPVF6HTWARgZdDXiAS3kl+LVpcQf
 kP8GEgtFKAZ/iBXpmXpeNwdQs/25mBFR9GPz0iA==
X-Received: by 2002:a50:d598:0:b0:578:d846:fc0a with SMTP id
 4fb4d7f45d1cf-57d06ae369dmr1091852a12.20.1718794796206; Wed, 19 Jun 2024
 03:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240619091632.2825550-1-sai.pavan.boddu@amd.com>
 <20240619091632.2825550-4-sai.pavan.boddu@amd.com>
In-Reply-To: <20240619091632.2825550-4-sai.pavan.boddu@amd.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 19 Jun 2024 12:59:44 +0200
Message-ID: <CAJy5ezpD13Reen-WKZ4Kc5wnMKgE+gkVHobgdQZAyXtnV+88dQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/system/arm: Add a doc for zynq board
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, francisco.iglesias@amd.com
Content-Type: multipart/alternative; boundary="0000000000004512c5061b3c1912"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P0CdlQJErZl0

--0000000000004512c5061b3c1912
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 11:16=E2=80=AFAM Sai Pavan Boddu <sai.pavan.boddu@a=
md.com>
wrote:

> Added the supported device list and an example command.
>
>
Thanks Sai!

You need to add an entry in the Xilinx Zynq section of the MAINTAINERS
file, e.g:
F: docs/system/arm/xlnx-zynq.rst

I would also list the supported boot-mode values in lower-case or the
boot-mode example in upper-case.
I know case doesn't matter but it would be nice to have the example
consistent with the list of supported values.

With those changes feel free to add:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Cheers,
Edgar



> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
>  docs/system/arm/xlnx-zynq.rst | 47 +++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst    |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 docs/system/arm/xlnx-zynq.rst
>
> diff --git a/docs/system/arm/xlnx-zynq.rst b/docs/system/arm/xlnx-zynq.rs=
t
> new file mode 100644
> index 00000000000..419cc1aec8b
> --- /dev/null
> +++ b/docs/system/arm/xlnx-zynq.rst
> @@ -0,0 +1,47 @@
> +Xilinx Zynq board (``xilinx-zynq-a9``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The Zynq 7000 family is based on the AMD SoC architecture. These product=
s
> +integrate a feature-rich dual or single-core Arm Cortex-A9 MPCore based
> +processing system (PS) and AMD programmable logic (PL) in a single devic=
e.
> +
> +More details here:
> +
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Zynq-7000-SoC-Techni=
cal-Reference-Manual
> +
> +QEMU xilinx-zynq-a9 board supports following devices:
> +    - A9 MPCORE
> +        - cortex-a9
> +        - GIC v1
> +        - Generic timer
> +        - wdt
> +    - OCM 256KB
> +    - SMC SRAM@0xe2000000 64MB
> +    - Zynq SLCR
> +    - SPI x2
> +    - QSPI
> +    - UART
> +    - TTC x2
> +    - Gigabit Ethernet Controller x2
> +    - SD Controller x2
> +    - XADC
> +    - Arm PrimeCell DMA Controller
> +    - DDR Memory
> +    - USB 2.0 x2
> +
> +Running
> +"""""""
> +Direct Linux boot of a generic ARM upstream Linux kernel:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-aarch64 -M xilinx-zynq-a9 \
> +        -dtb zynq-zc702.dtb  -serial null -serial mon:stdio \
> +        -display none  -m 1024 \
> +        -initrd rootfs.cpio.gz -kernel zImage
> +
> +For configuring the boot-mode provide the following on the command line:
> +
> +.. code-block:: bash
> +
> +   -machine boot-mode=3Dqspi
> +
> +Supported values are JTAG, SD, QSPI, NOR.
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 870d30e3502..7b992722846 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -109,6 +109,7 @@ undocumented; you can get a complete list by running
>     arm/virt
>     arm/xenpvh
>     arm/xlnx-versal-virt
> +   arm/xlnx-zynq
>
>  Emulated CPU architecture support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> 2.34.1
>
>

--0000000000004512c5061b3c1912
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 19, 2024 at 11:16=E2=80=AFAM =
Sai Pavan Boddu &lt;<a href=3D"mailto:sai.pavan.boddu@amd.com">sai.pavan.bo=
ddu@amd.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Added the supported device list and a=
n example command.<br>
<br></blockquote><div><br></div><div>Thanks Sai!</div><div><br></div><div>Y=
ou need to add an entry in the Xilinx Zynq section of the MAINTAINERS file,=
 e.g:</div><div>F: docs/system/arm/xlnx-zynq.rst<br></div><div><br></div><d=
iv>I would also list the supported boot-mode values in lower-case or the bo=
ot-mode example in upper-case.</div><div>I know case doesn&#39;t matter but=
 it would be nice to have the example consistent with the list of supported=
 values.</div><div><br></div><div><div>With those changes feel free to add:=
</div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.igles=
ias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></div><div><br></div></div><=
div>Cheers,</div><div>Edgar</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Sai Pavan Boddu &lt;<a href=3D"mailto:sai.pavan.boddu@amd.co=
m" target=3D"_blank">sai.pavan.boddu@amd.com</a>&gt;<br>
---<br>
=C2=A0docs/system/arm/xlnx-zynq.rst | 47 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0docs/system/target-arm.rst=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 48 insertions(+)<br>
=C2=A0create mode 100644 docs/system/arm/xlnx-zynq.rst<br>
<br>
diff --git a/docs/system/arm/xlnx-zynq.rst b/docs/system/arm/xlnx-zynq.rst<=
br>
new file mode 100644<br>
index 00000000000..419cc1aec8b<br>
--- /dev/null<br>
+++ b/docs/system/arm/xlnx-zynq.rst<br>
@@ -0,0 +1,47 @@<br>
+Xilinx Zynq board (``xilinx-zynq-a9``)<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+The Zynq 7000 family is based on the AMD SoC architecture. These products<=
br>
+integrate a feature-rich dual or single-core Arm Cortex-A9 MPCore based<br=
>
+processing system (PS) and AMD programmable logic (PL) in a single device.=
<br>
+<br>
+More details here:<br>
+<a href=3D"https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Zynq-7000-=
SoC-Technical-Reference-Manual" rel=3D"noreferrer" target=3D"_blank">https:=
//docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Zynq-7000-SoC-Technical-Refe=
rence-Manual</a><br>
+<br>
+QEMU xilinx-zynq-a9 board supports following devices:<br>
+=C2=A0 =C2=A0 - A9 MPCORE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 - cortex-a9<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 - GIC v1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Generic timer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 - wdt<br>
+=C2=A0 =C2=A0 - OCM 256KB<br>
+=C2=A0 =C2=A0 - SMC SRAM@0xe2000000 64MB<br>
+=C2=A0 =C2=A0 - Zynq SLCR<br>
+=C2=A0 =C2=A0 - SPI x2<br>
+=C2=A0 =C2=A0 - QSPI<br>
+=C2=A0 =C2=A0 - UART<br>
+=C2=A0 =C2=A0 - TTC x2<br>
+=C2=A0 =C2=A0 - Gigabit Ethernet Controller x2<br>
+=C2=A0 =C2=A0 - SD Controller x2<br>
+=C2=A0 =C2=A0 - XADC<br>
+=C2=A0 =C2=A0 - Arm PrimeCell DMA Controller<br>
+=C2=A0 =C2=A0 - DDR Memory<br>
+=C2=A0 =C2=A0 - USB 2.0 x2<br>
+<br>
+Running<br>
+&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br>
+Direct Linux boot of a generic ARM upstream Linux kernel:<br>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 $ qemu-system-aarch64 -M xilinx-zynq-a9 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -dtb zynq-zc702.dtb=C2=A0 -serial null -serial=
 mon:stdio \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display none=C2=A0 -m 1024 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd rootfs.cpio.gz -kernel zImage<br>
+<br>
+For configuring the boot-mode provide the following on the command line:<b=
r>
+<br>
+.. code-block:: bash<br>
+<br>
+=C2=A0 =C2=A0-machine boot-mode=3Dqspi<br>
+<br>
+Supported values are JTAG, SD, QSPI, NOR.<br>
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst<br>
index 870d30e3502..7b992722846 100644<br>
--- a/docs/system/target-arm.rst<br>
+++ b/docs/system/target-arm.rst<br>
@@ -109,6 +109,7 @@ undocumented; you can get a complete list by running<br=
>
=C2=A0 =C2=A0 arm/virt<br>
=C2=A0 =C2=A0 arm/xenpvh<br>
=C2=A0 =C2=A0 arm/xlnx-versal-virt<br>
+=C2=A0 =C2=A0arm/xlnx-zynq<br>
<br>
=C2=A0Emulated CPU architecture support<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000004512c5061b3c1912--
