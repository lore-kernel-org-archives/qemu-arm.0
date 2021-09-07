Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4832163lfb;
        Tue, 7 Sep 2021 08:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTtN1gzqV6zLWuyTbOm9i+eCu2wvpPytiDB564lerG3HxLO2YcchaIZaGWf+Ne5Y1x4caz
X-Received: by 2002:a67:cc01:: with SMTP id q1mr6086101vsl.16.1631028237671;
        Tue, 07 Sep 2021 08:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631028237; cv=none;
        d=google.com; s=arc-20160816;
        b=fbqqUA1Hw/NgAYAmF6D/ZHzOUAGX5Ywoo5cwJ0XONZAzd9ob/B+PSoeuwLAcltPlLz
         bcS+OCMuO7zJaCQOIp7NPvnLB115rnKu5aCSZLX0V5tQ1pE1KHrVrs+3AwXD4DTlalnZ
         vKpEreYDLeacIyYnY87WoLe2zKZ/RxG05EDAoM8dYKpX+tUaISBNgvYSuSD/B81FPsli
         8prG6XIXrJxe5FxCcjysgTBoC+Ev8HxmaUbh495RHSomFsbEm5OFNbPs2aIpGSguqW8F
         u30aSYv2pyyMqLs46xGwwf9SXmHKUhSNgL+Y60ZXx8p+/rP5mvLbGiafa3C0AEX3m9NZ
         zbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xjozTuRI+B8ZpWfwKIFoZg4RP89Sc+j7Y6/a7eL6uc0=;
        b=mL43yc7CPUIMX/1HBz4Fswyooj6Xy4kcONNXx/cuOPFUk5TFTKMjUib5ESpXSGmONX
         hR9KGQE+862us+F1LwEFFv+PiDQ41kUt3u6qVfev591tM5TrYG+zaF3AhpykjzJfj7zT
         ZkkZWlP2QE166NYZDOMN5ZPINJfnmYaFhx27kNUFtw/MOHAlhPx5PpMpwbO6xlQ65c9R
         Q/52cOVBUM5FFlDZXoJ47l8s1g5ukM8VHBBulE3d2uJD0pwM49dKNngVhjpULa/0JUaD
         vaS3mEouOdlxPjEHJsR/4WFrA/6ONaIm/IFEsmowhJLPt6qgqIaTKUw7sE7HryJR7h6/
         v7KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vFBpabDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si910729vsm.336.2021.09.07.08.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 08:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vFBpabDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNcx2-0003DY-Uu
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcwi-0003B9-BH
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 11:23:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcwe-0008Hx-N3
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 11:23:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so3023444wrb.3
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjozTuRI+B8ZpWfwKIFoZg4RP89Sc+j7Y6/a7eL6uc0=;
 b=vFBpabDOkpyETIqUXEiVGIHiIMqzbVs8IzaBMo4L5ToIdK3miOrQgtgutzLBGq4qXh
 FgO87oOOfYc88dnCWI8Z603tB25rzJz6jF3/QgjeClW/wO+gxZqbg4iU4mX6HZ+wctON
 +Z7zUUy0ikjCnUOSSTL/H7vrMuNt3VcdKURlgzz6rTmXtVFQP2MC/rF4x+HlH99nOPGZ
 fMPQpgTNP0W4PEXB8IJqoogWWcdYZpQPg/os+WoLZhh9umnDb2eOt9DP0OaLG6afMYLv
 5diM2EKHRZg1lht2Winuu/tdxINrZ1/zKvD2H6o3sNbSDLJYzA1vn2nq+I8/tfXrI2tn
 Uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjozTuRI+B8ZpWfwKIFoZg4RP89Sc+j7Y6/a7eL6uc0=;
 b=Vup4pGT0qrBz8DwqW0MlHWOsMCTawWzGXdKpmbcYannL28+wIhCxSDSPBthiXus0Sa
 pQ95zO438oCBAxenINJIS6FhG4FZIcs+eCkTC6pNmuouKuqeJzEPBWw5lFx0gHQ8OUrs
 ZPJHBw/WS8hWwKL9sFa2KusTBlZDfyGRzfDxRlkSZx2dTjXYc0AgWeOedlYRE9qpCxqq
 tgxWBrkslrhk7OF5MFGWzATQTFfPmkUuDKRfOEpWuuU6DD1gss+AycFfG8XGQmuM7xAr
 EOctn1T/rKenkvay4eYLzWc2obuxGmHd8o42hGE/U2DUkL7d1cTrcUkf2yJ51ADCRZPE
 AXdQ==
X-Gm-Message-State: AOAM533gIcruvvmlXPCpr7v4UcZjH0HptCAS5gB6FnL8Sh7k/w0ZeXgZ
 gCDMn2LzUc+8WCsuXeoA/Q1x3zMZGrCD+Jg+uS0vJw==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr19685402wrs.149.1631028211149; 
 Tue, 07 Sep 2021 08:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210823174924.201669-1-tong.ho@xilinx.com>
 <20210823174924.201669-10-tong.ho@xilinx.com>
In-Reply-To: <20210823174924.201669-10-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 16:22:42 +0100
Message-ID: <CAFEAcA8TU+YWRtgzM7vBS718v6wU5Lc=ekjNY4Dm_hxu-L+LvA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE
 Usage
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQZe8kAvJ+yy

On Mon, 23 Aug 2021 at 18:49, Tong Ho <tong.ho@xilinx.com> wrote:
>
> Add BBRAM and eFUSE usage to the Xilinx Versal Virt board
> document.
>
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  docs/system/arm/xlnx-versal-virt.rst | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
> index 27f73500d9..84afac3734 100644
> --- a/docs/system/arm/xlnx-versal-virt.rst
> +++ b/docs/system/arm/xlnx-versal-virt.rst
> @@ -32,6 +32,8 @@ Implemented devices:
>  - OCM (256KB of On Chip Memory)
>  - XRAM (4MB of on chip Accelerator RAM)
>  - DDR memory
> +- BBRAM (36 bytes of Battery-backed RAM)
> +- eFUSE (3072 bytes of one-time field-programmable bit array)
>
>  QEMU does not yet model any other devices, including the PL and the AI Engine.
>
> @@ -175,3 +177,50 @@ Run the following at the U-Boot prompt:
>    fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
>    booti 30000000 - 20000000
>
> +BBRAM File Backend
> +""""""""""""""""""
> +BBRAM can have an optional file backend, which must a seekable

"must be"

> +binary file with a size of 36 bytes or larger. A file with all
> +binary 0s is a 'blank'.
> +
> +To add a file-backend for the BBRAM:
> +
> +.. code-block:: bash
> +
> +  -drive if=pflash,index=0,file=versal-bbram.bin,format=raw
> +
> +To use a different index value, N, from default of 0, add:
> +
> +.. code-block:: bash
> +
> +  -global xlnx,bbram-ctrl.drive-index=N
> +
> +eFUSE File Backend
> +""""""""""""""""""
> +eFUSE can have an optional file backend, which must a seekable

"must be"

> +binary file with a size of 3072 bytes or larger. A file with all
> +binary 0s is a 'blank'.
> +
> +To add a file-backend for the eFUSE:
> +
> +.. code-block:: bash
> +
> +  -drive if=pflash,index=1,file=versal-efuse.bin,format=raw
> +
> +To use a different index value, N, from default of 1, add:
> +
> +.. code-block:: bash
> +
> +  -global xlnx,efuse.drive-index=N
> +
> +.. warning::
> +  In actual physical Versal, BBRAM and eFUSE contain sensitive data.
> +  The QEMU device models do **not** encrypt nor obfuscate any data
> +  when holding them in models' memory or when writing them to their
> +  file backends.
> +
> +  Thus, a file backend should be used with caution, and 'format=luks'
> +  is highly recommended (albeit with usage complexity).
> +
> +  Better yet, do not use actual product data when running guest image
> +  on this Xilinx Versal Virt board.                      |

Stray '|' at the end of the line.

-- PMM
