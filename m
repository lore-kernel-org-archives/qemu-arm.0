Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1386849lfc;
        Mon, 9 Mar 2020 10:27:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvylM7QFS9YTwrnMtpHzEhj2iFGn9xFoMTegU6osyq+5dbphLCHa+wv7Y28pOSrPH9nA69i
X-Received: by 2002:a37:a746:: with SMTP id q67mr16511615qke.215.1583774857872;
        Mon, 09 Mar 2020 10:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583774857; cv=none;
        d=google.com; s=arc-20160816;
        b=dVd0WkprwjNvrnZ+bxJm5dza8KvoZZWrCsN+avA6GPIlxGbhjAt0iyZgl2t3zMAuwS
         nR8fpXkpFmVHGRBegTnBli/gXnzL/4hVSPQ796OrKt8Ew5L24ln8oKqHN90iunpOb+u4
         9pWMaJ501VJSkOS5XHVP8e7t755y/1jrDSlt8zgAVG1Bal0+9/V9QK7kAi2snJiZDun+
         OKJaOGuM3c7W6SXS6rNIz3Rt9qBUZspq4RQawgGU39gVO5d7q95vCanz/mM8e/onbgPL
         itpgTT3bSpPSQirC+LIdIW6oFHwIuKnpc6B0BuwmiysqRXN9ilrFg+PeE6ECObNdt1/W
         JD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=BZngQXGMUcd9HSfvr8IOy8qIk/2ixiIy5QrDgre2vx0=;
        b=eKyhd6u+t5JqIqiyDAzZmOXi64cSvoSkciH9K56+PhLtBYLyenOw7096rxRvPF/3VZ
         U+JDSkrlAcYZ6E6ia7GeIJXtUYrB/2EEfr2InYgIs++cDe0ozl0Spur3yhhrUSmsSEfx
         xevgYZF0rs8wPcLu14Hg/s84XwN3VtQEax78EgD++Ebqwxmgj7w37pWqHFZf+U2rEH4v
         AN/x+AHg3ItslQRMHX8XPdY0R4Db18o9U0uEIPHhE2ii2Gnt5E3Ph9nsQvZ1mauPdbrV
         01+Qb5XUc+gX+JEhVv6cC5O1qJmqpcNDxF04bwaXwoiyugA56ti7V6DUywkNhgBtrrIt
         +Uqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AKS2M+gW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si5671227qvt.198.2020.03.09.10.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 10:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AKS2M+gW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBMBl-0007cf-Bi
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 13:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jBMBd-0007Zz-66
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jBMBc-0002nW-7K
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:27:29 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jBMBc-0002nG-1g; Mon, 09 Mar 2020 13:27:28 -0400
Received: by mail-pl1-x642.google.com with SMTP id j20so4254802pll.6;
 Mon, 09 Mar 2020 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BZngQXGMUcd9HSfvr8IOy8qIk/2ixiIy5QrDgre2vx0=;
 b=AKS2M+gWUJ28ir7RFBtbVPchPt7iyBv4j4AtB6Vlroyn2fO9vFg+4QJ5jpqdwxm97Z
 T5lxsD6QneeIiSC1mrQa2a6A8ARkBbHs7ZNwKBpabErQ2zzyBJ1v30SoTkzPpuEqvHlR
 QBHNIv1rblMiWOzAUDuy/Hyak7rN9u288iGgzgn3Tv4pQmS4flu69M8phfPT8JjkkiUa
 Rucv1WfFOQ6uraScFo7ySNDUcMxhAWbvJAotYbD3uZSNqH8L6ags23wGiil3HleUgG/d
 DlRpI/0GGNfhx/nnVPL0MhP+Q6QoeKUs4oyDC7PD/qL6PIzjzPaRB37MpfdI9sF4Zuuv
 6pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BZngQXGMUcd9HSfvr8IOy8qIk/2ixiIy5QrDgre2vx0=;
 b=U6zgqC67zE494zfbOeRsAzH2Gq6QAMQdrGD6B05bbXxakih5OEq8/Gh5ukQlQnd3AC
 NIP5D9sktRO2OlKwpNg1FqNiEgz0F5Y0a5uzagqzP4tUUuwKTChzyZSmyyi5Q3eApJT7
 D0bBdCtiftHtbTSvm1w9bpsXidrMkstSgWPlNMIozrZwAWhpDM2zrg29Ai3aDr0ixxL+
 dBqCm2JfTVenZci9iSJix9QWarkaLhYKRZawaDtdfutlhppCQFRfhI6dIim9QoxYBvam
 TzFqzRb7F1YMIqdyk+DcxCsAAJODGoa2M/If/8ewWvanlTGCe+FQBOUhfSjS1P3m3+UI
 c9xA==
X-Gm-Message-State: ANhLgQ2Hqx5AMt3OibBC1i3mV9snw8gOI1OEAeZDN4i4lOR3C7RXTo8J
 Y6UqmqIKUeJ7TcpIrjAf3AY=
X-Received: by 2002:a17:902:8b8a:: with SMTP id
 ay10mr17112803plb.288.1583774846907; 
 Mon, 09 Mar 2020 10:27:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k9sm147850pjo.19.2020.03.09.10.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 10:27:26 -0700 (PDT)
Date: Mon, 9 Mar 2020 10:27:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] Wire up USB controllers on fsl-imx6 and fsl-imx6ul
Message-ID: <20200309172724.GA25106@roeck-us.net>
References: <20200301170443.12904-1-linux@roeck-us.net>
 <CAFEAcA_VuY+1egn8B6=Tk8PKGuhAPuP4-=pwuWHQGQsfdXB=dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_VuY+1egn8B6=Tk8PKGuhAPuP4-=pwuWHQGQsfdXB=dw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5s+Fz/nBRo1f

On Mon, Mar 09, 2020 at 05:09:21PM +0000, Peter Maydell wrote:
> On Sun, 1 Mar 2020 at 17:04, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > This patch series wires up the USB controllers on fsl-imx6 and fsl-imx6ul
> > emulations.
> >
> > The first patch is a prerequisite for the following patches. It provides
> > a dummy implementation of a register widely used on i.MX systems, and
> > specifically the reset behavior of this register. This is needed to make
> > the USB ports operational without full implementation of an emulation
> > of its PHY controller.
> >
> > ----------------------------------------------------------------
> > Guenter Roeck (3):
> >       Add dummy i.MXS STMP register support
> >       arm: fsl-imx6ul: Wire up USB controllers
> >       hw/arm/fsl-imx6: Wire up USB controllers
> 
> I'm not a huge fan of the "dummy device that's really just
> implementing 4 registers from the middle of some other
> device" approach. Unless you think we're strongly likely
> to want to use it in other places, I think I'd prefer
> to just implement a (minimal/no-functionality) model of
> the PHY register block.
> 

Sure, no problem; I don't really have a preference. What would be
the best place for such a dummy phy ?

Thanks,
Guenter
