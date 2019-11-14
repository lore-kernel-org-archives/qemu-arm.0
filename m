Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5273920wrr;
        Thu, 14 Nov 2019 02:19:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyArBwNhI3flp9Ltssxo0Ssr6ifkpvu8Gafj0Z3Yp1kRVFp6e/xIZHF6ln8VY8qbgTOqGB1
X-Received: by 2002:a37:a78e:: with SMTP id q136mr6895089qke.353.1573726780189;
        Thu, 14 Nov 2019 02:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573726780; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7M8hoOtjhVleA/UtDgmYP0zdBAP5ve7ECkGJO5vcL0io46R0Vds62HDA9ljXecaQk
         S2Gg2LLmHseeI4RPFBTW8dSe9X6P967PvnseiX10qi26+HoUTeM74szB5s10Wv0lallw
         DNwuARuHwkD9tXOVZZF3QC5S2d2VVjXUY3QVy3E7lgqjfV+qgdLirPAlmDIo5VsGJONN
         A3bM2eDxMpWkKePT6a7UWHfcWlQrE9Rhd7JN63hQbLSCbrq4+Mw3SlKoqep0uyg4KsJv
         R0R1hR72QwiBEm7uUadSeKpBgTIExGGoTfP0PWtDkt01/Zwbd3g+YuJOcbFuEA0EzMzl
         Ay7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzQzIyzzw6I5hQd+v91m8MuDLjdIVIV63shhIURNVrQ=;
        b=uzD1D8fIU3CTgcNdhm7eUlsn30UcSfl2pmcUSeWIZ4hjzIPeS8JZZds9uJbmUNgl9h
         50KkeyO4CBhY+Yy3DN8rseEmDAT7n+aoPup2vbnLGgX7Y4LGKM4NHA6eTXyn9/H7F6pT
         PAxi1+SIvU/4zvK0vYcoeuCnFERIMntN0wLxBv67sQydV2jH9+yejgP7BRLjPkaG+Ttl
         7i+pZrWhZSn29oBXGYLiVC4DQXsi3+VjegZ9PN7eFRLwN2/tQxbVThX4EpeOKN2UpItx
         ZCZpEyLFUWcd2A2JMYPryUj+p8hsv8kE7KcbCo81dxD7eig7Pcyr8xrc+3Gol3H8lOhL
         LM4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kltSAEQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g54si2800484qtk.32.2019.11.14.02.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 02:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kltSAEQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVCDz-0001FU-MW
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 05:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVCDr-0001Ep-Jb
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:19:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVCDq-0007wz-EU
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:19:31 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32904)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVCDq-0007wQ-62
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:19:30 -0500
Received: by mail-ot1-x342.google.com with SMTP id u13so4406202ote.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzQzIyzzw6I5hQd+v91m8MuDLjdIVIV63shhIURNVrQ=;
 b=kltSAEQIoA/k1+TFNUjLNAqd7p/CxGO25moVg9X3ilpVS7tOpfzcXAZu97GRv9Ixsx
 tBqEn8Osssg1smGgylX7GvH2dqlcYdS/b0pkBcYuJV/V7vLEPWlXR0IvAcmtnSiaLmAm
 MclIqOWPoZtRv2eXjzKtyRog6CcWDHavaVwIrbfxfVwrkxrnOEk4FpV11bk6m6GIDzxg
 89Tq6/nq4eDHrNsBa22ZTya6s85fETPfUookO8IUHuO6p59elN50dWZ0c8CLDwekZNkv
 Ozh2cAJ6EATnPtYqBpyCZPSBxxe6HooUMNpqtyjNJ9HcJKvnpGEGiIhnGOo5qMbyOHmO
 5C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzQzIyzzw6I5hQd+v91m8MuDLjdIVIV63shhIURNVrQ=;
 b=szstaSy9gqyMJUHM0Y817LxeOCjmTXqJ4bxIIN6xooUU+rBKCjZv172dy1k0K9OuOE
 g31MkR77mE1KiqFB4YKCV/x6H59G/jbjqeITp2JCKbp1OCQo/0egGhvgljIAXLHQxYxP
 WouExSaIl5n6sj5sIXlnbEo/k6g/IHphgIyuWgqaFiUzcTY+NGXLT0shzOdgSH/0OJKC
 BqMRga2Q6Oe0I3rx/eDw49Bv+hmnSKW4fJBwMR0IZMJ89mBVhgWHQChfLAfrNfyzZveC
 7/tP1biE5/4D7f9Syb/D5APGEnjUqa1h0GdWOcqD9wDW2bZ+44t5IGRFPJlF7NhsJuhe
 WuIg==
X-Gm-Message-State: APjAAAXUR/L/88U+mcvKw2JwWyqXsjwYd3qzp2f1+dK/vxUpCk2jLY5R
 HtmT8KlKOLABjGv7/+8Jf/FZwvldhV0Cy6FF6Ee70Q==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr7224974otg.232.1573726769191; 
 Thu, 14 Nov 2019 02:19:29 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
In-Reply-To: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 10:19:18 +0000
Message-ID: <CAFEAcA-hSPZG5sVcnBbHRHwDgc_Qh3wjCsvZ99o6uyTZU-a68A@mail.gmail.com>
Subject: Re: Qemu support for mcimx6ul-evk machine
To: Pratik Parvati <pratikp@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: JUMkLT5ALMZB

On Thu, 14 Nov 2019 at 05:12, Pratik Parvati <pratikp@vayavyalabs.com> wrote:
>
> Hi Support team,

There is no 'support team' -- you're just talking to other
users and to developers on this mailing list :-)

> I am referring this article to replicate the same for mcimx6ul-evk. I ran the below command to boot Linux on my target machine
>
> $ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage -monitor stdio -drive file=output/images/rootfs.ext2,format=raw
>
> I don't see Linux booting on the serial0 console without any logs. can someone please help me how to resolve this? Or am I missing something here?

You haven't provided a dtb file to QEMU, which is
usually needed for the kernel to identify what
hardware it is running on and to find devices
like the serial port.

I also suspect that that -drive option is not doing
anything useful (you haven't specified what it plugs
into and I don't think the mcimx6ul-evk will assume
you meant an SD card image by default), but that
won't prevent initial boot so you can leave that
problem for later.


thanks
-- PMM
