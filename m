Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6074789lff;
        Tue, 10 Dec 2019 08:55:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUTlTQ9pnj6MhqQVxlfbUPBTSy6CPt/QPOAGz6BwnWW/iPTE7fVZ4BJUrIG4/+R8km7daY
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr28325804qvp.210.1575996910892;
        Tue, 10 Dec 2019 08:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996910; cv=none;
        d=google.com; s=arc-20160816;
        b=cKlrqk/vAopZDeWDBQ3PXx41chkBco/QBaGRQlhev+WCxrQ92oD6EYnAZiT2CPBALs
         hJejVuPns6v62tbOqVnwhWLvbIi2aRwHzyhi/E7HJUXldI8i9ptnuMP0UfYRzgVDNgMg
         +vqmdQmVaMibdM14WX8phu0NWXY5Cd2btGSKZZD3SAP+Y4dDGO7kIUK/d20HoW8FtWcm
         FnddYf8zrTxR27IctmxT+DWwgOKrUoZsff1m7uQuVAMyGiWpR6bDdKv9L2CmfO7zRYJ/
         hLgrxHab+3k1eLZZkOocfdV62I5674GbTCjTkb21wq7mDEZkrIqDZTlNhSZfjaA275iA
         Lx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=UxvJ/YVTJuP+hzpz1BJMpuf68KLAsLUo57u2sksODLU=;
        b=rFtKGprQPjl5CS7f+tzaKgAycDvzdTWWb5mWoh5Z/U2XLkAVF2AaxgnBzKf+Ltik29
         q/7PrZSHHVsaykuIJG9vAkeHfR4V05bT/edqnMJPS48NQ2Hs8kGh/Hrtyl2ZehJU5TxI
         +GB3VT2l3s/RvOfShpzPBi/bwXevh75blKh9PwQsrv/5Qo8mj5MFS+nvYihuNCr/xCJJ
         2p2P/eUQ6g47NIDmgz8Rhw14ECt/vEzmBRSBwYxvW5Kjr+tbcVQCUdYIkO5fooF2trZQ
         WiicBId9wHTSWI4CBIc9qJShNdVHyT4ix5CwhIY7pEXDvbKCnolyGSmphwL/ofAjiOHM
         5mvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGiPRQuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a68si2355900qke.236.2019.12.10.08.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:55:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGiPRQuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieimz-00054j-Hg
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1ieilm-0003wN-VN
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:53:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <daniel.thompson@linaro.org>) id 1ieill-0007dQ-RL
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:53:54 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <daniel.thompson@linaro.org>)
 id 1ieill-0007cQ-Lf
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:53:53 -0500
Received: by mail-wm1-x341.google.com with SMTP id d5so2458713wmb.4
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UxvJ/YVTJuP+hzpz1BJMpuf68KLAsLUo57u2sksODLU=;
 b=BGiPRQuwSInGNHSJAJJyjw7IdSn2N/5ded78AZFJiUsXWL2FJn25Ro9Kdak/CS/Wlb
 RDw21qnr3CwaeOALl/A0is/GVeXyG2FwjftKiBjFdzylfZ3YkLhwt00ZN7h5XDBUkxVl
 5ki1+DZNwPsqJTJMr6Yqr8rrpr1Ng3Nf8gYauYG9PUJWf2dgs4B3Fv+lipGlTHY12kTg
 E0pKtq/Kpr5Wu2SzOCbvCgGaZOYrYIrdKtwQpYuUrfqllnpKfzitGy/HXk+zOY8zaKdG
 5W9mCF2aLisOKJnqwI3t7QFqLJtIzSHq/Vz57fQPwoSFVJHZLmgDGLv/Dr9zbyclJ0fj
 A0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UxvJ/YVTJuP+hzpz1BJMpuf68KLAsLUo57u2sksODLU=;
 b=e4g3ktbyQxMrLddT2YOlO0BTcxQgQOk4AmrmS2mBomD4B3GSUr0Uq9efPzvYhd/1/c
 0tydbY+FlpWaG3IXlc3nnC08B4mjzR0gM8xp6COhvUrt0z1tEV+cxgjoyozHTPncO/KD
 XDBJoM1shUImoFMZFPHULVD+GdxEjtbOdtBQi7yJARsRXl4cILub0+YxbxNgPYqYVul9
 OGlRxA1C2jdioyWBHGB19u3FUvDohAWfivC+NwjmzxdGUIATUHh7aueTjwJqSaLIeywr
 DE8O83F3/EB3PIp28f9vkuaqKIO3kLXWrpMYmInUBIPmknInLXq+Z+NEgX7j+ZH+Iq0B
 b6TA==
X-Gm-Message-State: APjAAAVi57TXrQRJX3Cuk+OkcqT7+3rKk86Fdt2XMIytyTx9mzvyZfyV
 i8FF7evTj1iHEw6EfJpfXORi7g==
X-Received: by 2002:a1c:731a:: with SMTP id d26mr5975246wmb.130.1575996832049; 
 Tue, 10 Dec 2019 08:53:52 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z18sm3637640wmf.21.2019.12.10.08.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:53:51 -0800 (PST)
Date: Tue, 10 Dec 2019 16:53:49 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/virt: Second uart for normal-world
Message-ID: <20191210165349.5sfyqwkbpfl7nlk2@holly.lan>
References: <20191209152456.977399-1-daniel.thompson@linaro.org>
 <CAFEAcA-sgFKev2MiOjRAzuE0trNYQoNe6LOFLeghGm73N1h=SA@mail.gmail.com>
 <20191209170827.yojyts6qdvpxbkp4@holly.lan>
 <CAFEAcA_3_EwjAZ_Av4a9BkT_3KmbEEFFFukyV7gsDuWPrYKmVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_3_EwjAZ_Av4a9BkT_3KmbEEFFFukyV7gsDuWPrYKmVQ@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
 "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAfuzxHuUtPu

On Mon, Dec 09, 2019 at 05:10:30PM +0000, Peter Maydell wrote:
> On Mon, 9 Dec 2019 at 17:08, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > I don't object to making it command line dependant (it is certainly
> > lower risk) but, out of interest, has using /aliases to force the
> > kernel to enumerate the serial nodes in the existing order been ruled
> > out for any reason.
> 
> No, I don't think anybody's investigated that (I wasn't aware
> that you could do something like that). Bear in mind that the
> kernel is not the only consumer of the DT, though -- you need
> to use a mechanism that all DT consumers will handle correctly.

The syntax for /aliases is standardized (in the DT documentation) but
AFAIK the exact semantic meaning of an alias relies somewhat on idiom.
It is true that the DT binding documentation for some serial drivers
does include details of /aliases but sadly PL011 is not amoung them.

I took a fairly detailed look at FreeBSD. I don't think /aliases is
used to control enumeration order but that appears to be because
aliases are handled in a different way to Linux. For example 
FreeBSD allows a custom console to be selected using FDT syntax
(hw.fdt.console=serial0 or hw.fdt.console=/path/to/fdt-uart ) which
means the Linux-like approach (such as console=ttyAMA0) need not be
used.

In summary I think that support for /aliases can and should be added
since it the best way to help DT systems figure out how to match qemu
uart numbering to its own naming.

However I agree we still need a way to create systems with only a
single UART even if I have not yet been able to come up with a test
case that proves /aliases is insufficient ;-)


Daniel.
