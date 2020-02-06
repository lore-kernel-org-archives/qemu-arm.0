Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1738034lfp;
        Thu, 6 Feb 2020 09:51:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyET7UaWfvMcL3HDX9ccCeFFftK7Hr+gXXENpiSbSOaRlYOVJqkvISaNpO6wZ3LtkEumnT9
X-Received: by 2002:a1c:a381:: with SMTP id m123mr5760394wme.158.1581011493256;
        Thu, 06 Feb 2020 09:51:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581011493; cv=none;
        d=google.com; s=arc-20160816;
        b=tZUk/18X/1yByk04m5Pm9O0TtsxqHpKnx7+HozBwcJghIj3Vot1vKCW1ZsFvkyECeQ
         hCYkHwD+F745xP+K/HKt3q8/TQaS2GQ1XCqlxUOZ+RIt7XZ5uu5GG1hYCCHa6iqKxIWh
         piyX6aPfwbIB2D4ArWMAnK9Yar8JiMzn65e/hh6DOXNu7X1fayS/kxosUeq/WtjrjL2R
         aHesLObGWd/B+hEbt8GqallZQIBHajUZ8dGoWzXtPcd0Wn+Y6+BsZI6kfClgHCzRzWFd
         IrrMqYwt8PgS6rFabv0Brm8mbQBp2yyS7ObLI3amXWh86lolPEa8AHe12YDOi12XfaqS
         28yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GU5SzrImhVHxSH9SRMLjeWb7oiCFei/8fAYMctxqW94=;
        b=QYP7XwOlXsnf+Vw/RFgsFKKYnXX6IrBRkeH6rrYERuN+m2KCTSP7jWUGDlwKZB9fxn
         DXR2jqb82bXZ3tqaf1ThPVEcKiPk+dwj0jbn2JurfwVrQA8QbdAw5WdYAMyVACkt/9vo
         tmpnayyPttsmjvXSV/lfa1mYpO9477IuUTHoiVHwYKoeC3Em3C3eXcIjLRCFyE/Jo2oQ
         Ld+3OSfmHdvti28s4tCuuukutYKliAOfCE3DRWWd542+mq9XVtb+G6JK+pYixQXmA1t8
         bxAbFCl4Lk6+8zSlQ7Axqeup4+/rv+Ci0xJ4ATzk3o9N8TVeV9G+OzwVNxnW9FZx6zFx
         DRAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fFSsZuID;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g138si2813751wmg.220.2020.02.06.09.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 09:51:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fFSsZuID;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izlJM-0007DD-5v
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 12:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izlIu-0006bA-Q5
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 12:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izlIt-00020e-Jv
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 12:51:04 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:38526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izlIt-0001vW-EP
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 12:51:03 -0500
Received: by mail-oi1-x234.google.com with SMTP id l9so5460494oii.5
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GU5SzrImhVHxSH9SRMLjeWb7oiCFei/8fAYMctxqW94=;
 b=fFSsZuIDF2hA864r7c6XHKcEUme7kR7AiqiECf6kqibaegD1D/cQcE5y1lc1MbbwgZ
 vXAg9InAjNWGpl65WrSQp5z01CJ5rgYP1e0ubrsIJsQLt/m9dIz3R3kaExkIQX+DLe2g
 AteRhgNT9c8mgmhrvFyf49TzmoKPRpOFM4pTBMFo0DI8kBD5w5Qf9qQIyBTbz7vqfgU6
 Ec4nw06oz6BaD94v48kb0JYSY3dzXOt8I88HicaI2VXkdXggjh7kAyRb3HuBfGDC+/F5
 2x5ymXsepeoatTBQWd3hJMlNI5RhNIITqN6+WpZDao86rhlL18VGjstbstPUn1j0WGGL
 Nahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GU5SzrImhVHxSH9SRMLjeWb7oiCFei/8fAYMctxqW94=;
 b=TtzTK6ihsRtab5umqyDLCTvytoj1NmVZqeIzFyXxIaBBw3XFLlE86YweKgz9dnPFXU
 tL+izK+cryLUANUOgIr8YjF3RkBLatOgstvj1QNNUABS6NwepXNir0ttIItw2gSrK1WD
 YKDcgdhGcko1ESUzkyVIHATcbYdR8YxXvIaOqq6JCcmyWd3SD19odc8/fDvr0SrzuSAb
 FFRKW27NH9UyuNJqteS9TbmCCQzFV1oVZuHoL5LNLNVUShN0KnilWQjIIgL3xoslAgsN
 rVLgQSDtGss1nIuQjy8D6C1Agrk0/6qzEqYkXZqzYFHpOezzEA0gZTop0oyPEhkWRXBv
 dVgg==
X-Gm-Message-State: APjAAAVdJ9NiFHoet934MU4PkpooMO65Efl4GOqPTPqDPC9ZYy44+YJW
 Vp8SZSXGrSHcqQTfVhEu6NwmSeCnjeVId5BHDYJQEg==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr7870988oid.98.1581011462335;
 Thu, 06 Feb 2020 09:51:02 -0800 (PST)
MIME-Version: 1.0
References: <CAC41xo2pUsuzOBAG2fFwYiF8cK=cN+0pZYY+-2GTxamhxSw1gA@mail.gmail.com>
In-Reply-To: <CAC41xo2pUsuzOBAG2fFwYiF8cK=cN+0pZYY+-2GTxamhxSw1gA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2020 17:50:51 +0000
Message-ID: <CAFEAcA_JnpOAH-aas82YsQ2UsHC7WLxVSMd+Tr1R7aqkwCdW7w@mail.gmail.com>
Subject: Re: gicv2 virtual interface alias base address
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SmDOfXymG9lg

On Wed, 5 Feb 2020 at 18:32, Jose Martins <josemartins90@gmail.com> wrote:
>
> Gicv2 specification describes a mandatory global alias region through
> which any virtual interface can be accessed by any cpu. Looking at
> arm_gic_realize function this region seems to be implemented ( /*Extra
> core-specific regions for virtual interfaces. This is required by the
> GICv2 specification */). However, I cant figure out what would be its
> based address on the memory map. I'm using the virt platform. Can
> anyone help me with this?

These are required by the GIC specification, but there's nothing
that requires any particular SoC or board to actually expose them
to the programmer. The 'virt' board does not map these. What
you get is the GICH_* virtual interface control registers at
0x08030000, and the GICV_* virtual CPU interface at 0x08040000.
In both cases the registers apply to the current CPU (ie the CPU
you access them from); there is no direct access to another CPU's
GIC interfaces.

(Our GIC model provides the for-each-core memory regions because
a few of the boards we model (eg one of the xilinx boards) provide
that facility in hardware.)

thanks
-- PMM
