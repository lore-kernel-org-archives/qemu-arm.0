Received: by 2002:a05:7022:264e:b0:7e:eb73:5b3b with SMTP id er14csp259142dlb;
        Fri, 21 Jun 2024 02:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcWiNvQQy+adNeInxqRZGDhHI+hOyG7nlioNkIBKtoUkMQSIlJVTLey8OipoNw2QJK4e8cyt8+jFFBr3D07Y5e29qR4vDg
X-Google-Smtp-Source: AGHT+IHxir2TH1O2RR/JIdgtcEZW5V/Qz4JtjgcEqeT/eVTMDk+Tk1loAthvKRj9aRGEuGqhjNMU
X-Received: by 2002:a05:620a:29d4:b0:795:5272:1182 with SMTP id af79cd13be357-79bb3ee0a1emr883046485a.69.1718961436478;
        Fri, 21 Jun 2024 02:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718961436; cv=none;
        d=google.com; s=arc-20160816;
        b=KCP92er37apjRdcSHHgsHWg7m06wGI06zdYpCtYWefbb4aM09gdYXPoYGVmSb1gGBr
         w6uvbPACLc97AojI+UVBT0eAVE5xxxjpQRItdZdkrSIiGL4juM8yWJ4/9CL0yilHhoXF
         wuMON8EHPURL5OGHaMvY/0L+1KNk9wpfuCLadlLW+AjG8cE8K/S5hTVxC477UWj3cRXC
         SX0DtgTg98Fr5s3J/wlfEu2Mff4tKHtiLJm2prV8pKu72izNbFaSsj8kSxu+fAWCWQEP
         yz2rFP1LE40iSvN0RvlrohnvK/7UjqxL/gxKWLTSuXXXxWBGXCSDH2Uln6eU8iIgX23V
         S55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5ITE7CHt8v0x+Q58L8M5IKcst9W8PdcpVYovIq8JCQ8=;
        fh=E77GTkIjkW9xBvoRkkTpzZQxauEuFVxcc+A6o+YcrpI=;
        b=f8wgyQtwxrooNwC4O/uMpatCYf7lvKj/mK8mSK1ha2BzVKPLsdaqPTxbipvmAF6yOh
         k8q83Dez8tD6il+kOuln+Ew/1A4dxQ2+peEmmnd5IRcTf7IuINfofP8+hDs+KM3Mhbfb
         CGHZlb+li3yjZSjWGS/R3aYsp9j0f+Z3sWqOSCPIsAX1w013eb0ub3MZuVJ0QalZcHws
         Al3lzb3AlovqNDFqfKZ0cLtM2hLRD8J8Emqnz+gaegawhwBKHZSVjqXH9GTM3e5W9l9D
         tKRM1VKtAEYahu1dlfdSaPulG0vMcXu4IMwpo4gobJmAubDF9GLyQI+QIZUYrvsj2VrV
         3tEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sxeFkkeR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92c1e6si138671485a.510.2024.06.21.02.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 02:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sxeFkkeR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKaOJ-0001W4-Oa; Fri, 21 Jun 2024 05:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKaOH-0001Vh-VL
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 05:17:05 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKaOF-0004tH-V3
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 05:17:05 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so17811171fa.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718961422; x=1719566222; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ITE7CHt8v0x+Q58L8M5IKcst9W8PdcpVYovIq8JCQ8=;
 b=sxeFkkeRTMZwXwn//VXGMWd8cWK0TwLAUordojO82ocNsOjHiecxJ68AWSmbO86oFS
 EYRiTDtybvH8P+VHfqVX0ThWpJlpm/tFPYtjvzXhtxjz9XJwyTKratURlxPef/LlYmKN
 /tpG0KUbcc4LTDKsHRa1WuD37ny1tNyLzongByMKu8WMFCICfiGbjIYp+MtKFVk7nC9t
 vlx6WjyuAJlhZAarrqld+MKdHvwLLFzwiHWWvbjT1EkPXtnw3YQppeXTauv3Maj6SVVj
 nTkZibv30CG8KDI2+dIhgVQs5zN5wXBkaQ3sVjS3V0oHDdBB9sOa7Y8CL9XaVMhAV27I
 nbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718961422; x=1719566222;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ITE7CHt8v0x+Q58L8M5IKcst9W8PdcpVYovIq8JCQ8=;
 b=AA750Qqq5rMNNhxClN+VCjXcWjQ8D/UlDobU7fjXmeL4ORwB2PS5OnR8Vc4Pb7mNJb
 Jn4zSLX5OZFsVNFVjkQYfa6kr73lG9/jSdxi/jxvYPfiaXObB8J/jC0tPvzJD+h+dI33
 faSxhcbPJWh8BSMqYOWddwPgdhPwzz78763UVMZTPBknatw74KaEp2X/Wu7g7R5WS1od
 FqYCP7yRCkR/irKlrjQqpXkevfpHG7LSh51C+1zPDBGpCa2a8ogTHmRr1dzNf3VA+f/V
 b3crcys9KtWcPirtPaFxMIqkGZjhJRoICFH/BR6yXQyX3f035bKMfy6ARWPDkgv2btnq
 P77w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+uW9L4+hTlZIXNpIGcYvQiG+PtbUlD4mASRPdXOPx3Mh4O7NuJp0/uZ8vtE466f5zuUcfYVgOUD+uA1kGv/18SRQz
X-Gm-Message-State: AOJu0YxL5Dkl//U3ixtUcYu3ZmNGbhJS3wesQjv70lDYdHTB5OjzYWZJ
 qrme1zVSEorsFu0m+Zrt0SjdyGvQhGSdmcn3MBNdSPRxeAFLi+xdP/N+3z4nvWmIthw54aKhoRE
 2jMj01OjYUZbSimT012Nd33JbtO/akvlMoE4riQ==
X-Received: by 2002:a2e:7d14:0:b0:2ec:174b:75bb with SMTP id
 38308e7fff4ca-2ec3cea1b81mr44982091fa.28.1718961421746; Fri, 21 Jun 2024
 02:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <CADueUgQh-=vmoO9kqL589Xeuf_LOM_K2Rr-rBxwe8iArdNdzsA@mail.gmail.com>
 <6b1daa9c-6f37-4edb-86d4-782941f1bcca@redhat.com>
 <CAFEAcA-Yda=XXspi49Z+-7bmBP-DzL2kFMg_XfNxMviHuAX18w@mail.gmail.com>
 <CADueUgS1==4gAmNmTBLZzrnRUp9z2wxkce8+TcOeoR3w_Pg-bg@mail.gmail.com>
 <CADueUgT4xDJft6On4j+oic65UcQRv_PcNSWJg-CcdBM8My3zow@mail.gmail.com>
In-Reply-To: <CADueUgT4xDJft6On4j+oic65UcQRv_PcNSWJg-CcdBM8My3zow@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 10:16:50 +0100
Message-ID: <CAFEAcA-TV6MKC32zd3WP5yhLABkbDrLKtP7CCZ0kB5pbV+-5Vg@mail.gmail.com>
Subject: Re: How to use designware-root-port and designware-root-host devices ?
To: Arthur Tumanyan <arthurtumanyan@gmail.com>
Cc: thuth@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 andrew.smirnov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RHDghPnAIiOl

On Fri, 21 Jun 2024 at 08:07, Arthur Tumanyan <arthurtumanyan@gmail.com> wrote:
>
> Hi,
>
> I just tried to run mcimx7d-sabre machine this way:
>
> ${HOME}/cosim/usr/local/bin/qemu-system-arm -M mcimx7d-sabre -m 2G \
> -kernel ${HOME}/cosim-arm/buildroot/output/images/uImage \
>         --initrd ${HOME}/cosim-arm/buildroot/output/images/rootfs.cpio.gz \
> -nographic \
> -net nic -net user
>
> and it just prints this and do nothing: qemu-system-arm: warning: nic imx.enet.1 has no peer
>
> Based on what I see in the mcimx7d-sabre.c , it configures just very basic things, no PCIe at all (may be I'm wrong ;) )

The machine model in mcimx7d-sabre.c creates the SoC object
(TYPE_FSL_IMX7). It's the code for that in hw/arm/fsl-imx7.c
that creates all the SoC devices including the PCIe controller.
(This structure is similar to real hardware where you have a
board, which has one or two chips on it like RAM but most of
the complicated stuff is inside the one big SoC chip.)

> Is there any idea what goes wrong here ? Maybe someone has experience with running this machine ?

"No output" usually means "your guest kernel is not configured
correctly for this machine type", and/or possibly "you didn't
tell the kernel to output on the serial port".

The "no peer" warning is because this board has two ethernet devices,
and your command line explicitly wires up one but not the other.
If you drop both the "-net" options entirely it will probably go
away (you get the default user networking anyway).

thanks
-- PMM
