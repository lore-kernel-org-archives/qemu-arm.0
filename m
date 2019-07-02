Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3357411wru;
        Mon, 1 Jul 2019 21:19:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe4gpCSgQDqeByfgT+T03+pMCQ2YYWro0KdcNadL11i6kS8L07FF8k3WzaSWEZvCaB1Vk9
X-Received: by 2002:a17:906:914:: with SMTP id i20mr26525446ejd.213.1562041197991;
        Mon, 01 Jul 2019 21:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562041197; cv=none;
        d=google.com; s=arc-20160816;
        b=ojCjg+DiBzq2/J9iSpGuDRi/pogckCSmVuIiIurym+YpOWlWWCb1eT8eQkWznigr38
         XhfGBFwGNgIvDb6iffOOWlbYQ0m17Io+S38IkuLDF5lKwnRviMJRYBplPUcenmmE5yAL
         gg8RAXOtB1LfSFw45KmrzWWF5oFRUh4tP+P/mM4X0FJnpi3YpZUTRHu6Ddey/jpak3l3
         8SG4PlLJtXy9qt49uYwUhRUTyLn6eyUNbuM5KuEZoohtgKtpxhcpYoqMLHMlS8J0cAsn
         rCYj3lXDT5p4V6qRr4xYzPg73NABbt99gKo73pGN0c9ZUSPvaDz6f4wY9TZiwjrAbhkE
         xqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yGUjS9WtkXidBm2EgH77cPR9n2FoDymKRrrTfpAZFY=;
        b=c0eooKI6gkzgJjTZ87e+7hxA0JX4KQK3I31tLAWPh0J5KMLPc5dboDiriFQkC0a/yO
         W+ilTTBbO+iYtaMLQjxph/W0rnTRtAkQFxVv4umuKUVS20+W6f91njIFNMw5usV5GvX7
         HN1yuI8N/h4z7h/jqxZZNvBka70sPDQISGh1jh2/5hNEXR5pHZp7eMq5LQBanRrCdVVs
         tynTPXXvlIVqm0Vye0L7pqXnyTlFHhqDBNTKJcrXfJ67EvpPhRalVavNDipEU9OZt6kb
         vpqYh/J3vdOfsF6ddCto23r+GlzUoC7yC8GCOJHs4DLTVX9gSG1iDDGg07Btvu2bs+0N
         UEHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9MLz4Bt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si7454135ejj.345.2019.07.01.21.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 21:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9MLz4Bt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiAGq-0006Hk-BI
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 00:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60365)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hongbo.zhang@linaro.org>) id 1hi9QI-0007Cn-DX
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 23:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hongbo.zhang@linaro.org>) id 1hi9QH-00018Y-BX
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 23:25:38 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
 id 1hi9QH-00017D-2l
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 23:25:37 -0400
Received: by mail-io1-xd43.google.com with SMTP id m24so33833553ioo.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 20:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yGUjS9WtkXidBm2EgH77cPR9n2FoDymKRrrTfpAZFY=;
 b=L9MLz4BtWOik5geQ9F8UPlEf+MbMN5kfDULnjF/hQfoWFZKY5ymGwJXqTlP/1fyTxi
 H+lYJ0xBi7XMzxuTYMtU3TcBUjBqb8+xvDUxmmDw4U0HXjxQBKRqN7jUN9RURnIRFbjX
 GQvfAlBn3dJBNecbsagSmb4SPlk/yEovvFzwdPoUoPI8hd7ANRjHC1NH+Qo1dcjnuIlH
 7O0YxBlWFL4D6mcWFutoqRSldXxnJng8p2tw19hQbGHVMt1j+m71MBq2ca/JIptfWiaK
 GSEz90NMGyWXX1Bm64Eci7nIpO4vb+0aqGdztSn1+j+Df1wH5QamhPeG5a7MmhMWvla6
 RyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yGUjS9WtkXidBm2EgH77cPR9n2FoDymKRrrTfpAZFY=;
 b=s02DB9ipkW270O0kQXxyPjg+5LmarEJcNqou3EfcsgHW9QsqatcuB/whRXng5DRlGK
 QX9Cr06nJSUNiP6eDrkx8RsmlOFMIyilYvNmWjKpISe+AdjrSimNqG5X+Mb/FWOIMAHS
 VrTyCUmRPaoZhKesKoT3Kjl9yjv9IuYUDlhxUCqRYArt71FtgV7PBS6mqn77tt9Np1A+
 cjBJ+qYGew14SRovCVKkm3gtAjU3+XjGmMjShSxHSZZ62dCTjlAX1+yqj5NTAXgKT54/
 og0aojZNwO9bdwmgC99RZvVjwsYDZ/C089WSntlVCYN7ciQ01AkVj894TeBdq9DDo6h+
 PKZA==
X-Gm-Message-State: APjAAAVSDWLerqH0lAtMemK3rLIIj247KMHLv37H5Gy6IIpfDfqIOIKk
 BGe4TbvMzWe+XzFas8PUNTI/05fAWumUBN2T0oWfgQ==
X-Received: by 2002:a6b:e60b:: with SMTP id g11mr31428459ioh.9.1562037934407; 
 Mon, 01 Jul 2019 20:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA8P-=mbQ4__9OXB078GnrGfm9afH1YBDLkv88mUXmm=PQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8P-=mbQ4__9OXB078GnrGfm9afH1YBDLkv88mUXmm=PQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Tue, 2 Jul 2019 11:25:24 +0800
Message-ID: <CAHmQWvAbqWjDFotms-aAbiKVOhNzzcbewfRdOcg9NDq3A9aX=A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: Re: [Qemu-devel] [PATCH v9 0/2] Add Arm SBSA Reference Machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qD8GeWQ3Wfps

On Mon, 1 Jul 2019 at 22:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 30 Jun 2019 at 11:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > run on KVM and execute virtualization workloads, but we need an
> > environment as faithful as possible to physical hardware,  to support
> > firmware and OS development for pysical Aarch64 machines.
> >
> > This machine comes with:
> >  - Re-designed memory map.
> >  - CPU cortex-a57.
> >  - EL2 and EL3 enabled.
> >  - GIC version 3.
> >  - System bus AHCI controller.
> >  - System bus XHCI controller.
> >  - CDROM and hard disc on AHCI bus.
> >  - E1000E ethernet card on PCIE bus.
> >  - VGA display adaptor on PCIE bus.
> >  - Only minimal device tree nodes.
> > And without:
> >  - virtio deivces.
> >  - fw_cfg device.
> >  - ACPI tables.
>
> I've pointed out a number of issues with these patches, but they
> all turn out to be very minor (mostly fixable by moving code between
> patch 1 and 2). The other thing we need is a MAINTAINERS section for
> the new board:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cad58b94879..0bf3739f06a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -728,6 +728,13 @@ F: include/hw/arm/fsl-imx6.h
>  F: include/hw/misc/imx6_*.h
>  F: include/hw/ssi/imx_spi.h
>
> +SBSA-REF
> +M: Hongbo Zhang <hongbo.zhang@linaro.org>
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/sbsa-ref.c
> +
>  Sharp SL-5500 (Collie) PDA
>  M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>
>
> So rather than making you do another respin, I'm planning to
> make the fixes in my target-arm.next tree as I apply the patches.
> That way we can get this in before softfreeze (which is tomorrow).
>
Thank you for the efforts.

> thanks
> -- PMM
