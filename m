Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3482794wrv;
        Fri, 19 Jul 2019 04:47:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx71P0mkwpagKtMHjAG4H3eTy4UpNyDwXPHjUx5Y15qmm32WEhxwqnzvb39/bEAnOvxJMXk
X-Received: by 2002:a17:906:5ad0:: with SMTP id x16mr41234606ejs.23.1563536851604;
        Fri, 19 Jul 2019 04:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563536851; cv=none;
        d=google.com; s=arc-20160816;
        b=b4v+G3d0a7tmHcfAmbBPHUqPdM8S6rTOEascK74eBznicoyb/2LEau8+72PyUOQ4ER
         t8cHutucoRixIU/5OFtGwvXYDhX/OwdMCGz0+ZGg3WCAkDa8aYTDIod/K4IfX3388jRA
         Jvo5JxjS4oXZeVDgpP0O1b5doi+u0YyC7zt3N/rPHC8ROmvZ+x89OTQl3nDL0XsWOAX+
         gMHamU+uJSw9Nb2SZyy8OThwdyAcIYvP52Uapju+MRQChFIUEpvL7MGLtPmnLzoH65lX
         hnXOwdv5rhtMtuEeIAEdL0QH1jaa+AJx08MKo/I2/uujPLQp9rtN1jMPv7vP6cWE8qoR
         MQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=z4iPOBzFhMTUPZoHyJ55VwwkuY8lGjxWl84caEjm7i0=;
        b=KA1i1Wb4yzdLOvQKVdSymki+L4Pfv9xUPFhBC9mOXAbss7bOlJmwypRLCq7zXkaBAM
         QXatyN3l/spcerMPYMB+QqzJz2h7V6+4zlq12/VN15nbv7+BPPYjYYSvI6LaQN08tv+P
         MC5pqw3cF+/oXLJAGY8vxLd3Zue0i9FnYZ98S1nzBQJBezJAtY4KVzPxNoO6IDtJj47h
         atTA36nEiTRzGyykY2bAm7TuDEKpwoEkkhWyeQWYvgG6STl+FqorRr0i+9aJg9BF4KeS
         QRNbHr0QtC6Pv38LYSHXFeNdKsRp8V9fpZ67yEafYMMPP9JP4+jmZsAwzNXOeJP8qOLA
         mp9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RGpPrTGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si158064eja.338.2019.07.19.04.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2019 04:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RGpPrTGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hoRMI-0000aR-EG
	for alex.bennee@linaro.org; Fri, 19 Jul 2019 07:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41615)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hoRME-0000aA-LK
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 07:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hoRMC-00023X-E7
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 07:47:26 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:40295)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hoRMA-00021b-NO
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 07:47:22 -0400
Received: by mail-ot1-x32b.google.com with SMTP id y20so16483451otk.7
 for <qemu-arm@nongnu.org>; Fri, 19 Jul 2019 04:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z4iPOBzFhMTUPZoHyJ55VwwkuY8lGjxWl84caEjm7i0=;
 b=RGpPrTGrEXUHccK/w5sLwXWCwQ8BMpD0cwlhrg203G521YBccl9PiaxlfAj6pFFT9o
 tWJEsBaBOhLzum2Az0T2NVpwPyepuTAUr2iDOJrsLNqSz+sU3MY3mp6l1GnV9zdDHRvi
 XHi8v0kvZwChVzXO4UYpfA0R0D/WIu4/hyzaijYhksr+FtGNAJAH2HpKxzI2IJjW991Q
 jiNXQWGfxDWIPyXbUJMqaTwkYSVoQnkFGti9h5xNKHOkFZxB3ULgl4jHpzm76li7bQNb
 MPDYt338cGLl1GH84T5EJOY7EblPFqKe8RNLzw2cMgZWUduyUFI6S7uWHNdBt8H3cBxM
 PZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z4iPOBzFhMTUPZoHyJ55VwwkuY8lGjxWl84caEjm7i0=;
 b=rakZrFj/ljVtNWP5SQ1AqjHe4a0MElaSx6fbAI4Rt3rnqJKGJqFMSB6i5JMSXrPaWh
 mruF9DO0u+4Wi03IxHOCVXb5uP8OoxZ5rmzhExgLjlgWZ+mqYuJxe3u5oGtufTNImTs8
 /DHoWndl9kCZN/IjwH62T7solur6j0405G6YgSZnChgfVu8Ekcq+OKGOLVogzzELnA/p
 r7DzWoZvg2vc/kDyBhCwg56yOrkEnV0pe96fiv+vHM8Sj2A2zCjI/Kn7EDCN2nDhHt96
 TqpBLtyWcE2cKRPWRNK9TOBPFl4/ORvPPpYkfQtX4c/AqYVza+X/Qmihztje3Q2dNbA3
 hIbg==
X-Gm-Message-State: APjAAAVQ0H0DRhPQbao2k75tziWJR/aS85n4cBMqLWDxQFPuMqV+zYzf
 dl+DUz4So5TEX5QecNPddQjlRwvgdV2NkxX16TU0ijrOCD4=
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr31665938otr.232.1563536840512; 
 Fri, 19 Jul 2019 04:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190719111451.12406-1-philmd@redhat.com>
In-Reply-To: <20190719111451.12406-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2019 12:47:09 +0100
Message-ID: <CAFEAcA92mCp6WYb5wVEYbVNEFkPb9TwpedjNwj4SdS9Mb_rNtw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-arm] [PATCH-for-4.1] target/arm: Add missing break
 statement for Hypervisor Trap Exception
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gk/Kpmam5H3V

On Fri, 19 Jul 2019 at 12:15, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Reported by GCC9 when building with  -Wimplicit-fallthrough=3D2:
>
>   target/arm/helper.c: In function =E2=80=98arm_cpu_do_interrupt_aarch32_=
hyp=E2=80=99:
>   target/arm/helper.c:7958:14: error: this statement may fall through [-W=
error=3Dimplicit-fallthrough=3D]
>    7958 |         addr =3D 0x14;
>         |         ~~~~~^~~~~~
>   target/arm/helper.c:7959:5: note: here
>    7959 |     default:
>         |     ^~~~~~~
>   cc1: all warnings being treated as errors
>
> Fixes: b9bc21ff9f9
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 20f8728be1..b74c23a9bc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7956,6 +7956,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUSta=
te *cs)
>          break;
>      case EXCP_HYP_TRAP:
>          addr =3D 0x14;
> +        break;
>      default:
>          cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index)=
;
>      }

I think this is right, but EXCP_HYP_TRAP is a bit odd -- we appear
to use this only for the case of "SMC instruction is trapped from
NS EL1 to EL2 by HCR.TSC". I was expecting more traps-to-EL2
to use this EXCP_ variable... Mostly we seem to use EXCP_UDEF,
eg for CP_ACCESS_TRAP_UNCATEGORIZED_EL2 coprocessor/sysreg accesses:
this has the same behaviour as EXCP_HYP_TRAP as long as we know
we are going from an EL below 2 to EL2. Which I think we could
also use in the one place we use EXCP_HYP_TRAP; or we could make
wider use of EXCP_HYP_TRAP, since feeding everything through
EXCP_UDEF is rather confusing.

Anyway, for 4.1 we should do this.
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
