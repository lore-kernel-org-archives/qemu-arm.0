Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3536596wrp;
        Fri, 27 Sep 2019 07:02:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsthF8lnNXyVoUrHy/qofsfYsAkGDRwGUh3ddoGsp7eUUIGBjicWZvDFXma556GNDqqXet
X-Received: by 2002:a37:8586:: with SMTP id h128mr4662194qkd.253.1569592953902;
        Fri, 27 Sep 2019 07:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569592953; cv=none;
        d=google.com; s=arc-20160816;
        b=E87/jSnEG4dHcSHJ4o8/FKErOE/fJuWg4bWTQ2vbuhXUwNrvcDZe+tJhN+gbO1APsg
         stfDUdGly/7/Uh/VzSZbE/feMoM1CVCnWog1mRJouybYwi70ppoeeyKjaDdqwbWnF7ZP
         j7Y4kkAP+wo2B7OzGCKRN7MCjwqI+l/IK0tcDHXcUcaiy/2Z+SvbQT0N4GtM4E7Z+tXm
         uTa2J+9IdoTuvFpzZbr5nXarm7i6F4LliUtkkO8vQSRC9MzWfF0emKjCgIjl7vw1sonv
         Y7lp0qtrrofAzddU5TqSOJwWZxAgZ5eUbOTidFo7zOU3B3CGTzxAGO7+TKSQqF3WhQXW
         7JZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=TzPly1HOOP5ZxOVgZNGoYgvsj1Jnu09Ez2nIhgHlkY8=;
        b=uIwgqfosIv7AzKNj/Y+d/WrnYdAiKqJpVNnN8L6E/9zvXyHJqIpvxMylVd9yd+jhDS
         Yrv/zaVFapApyi2+54i20TixjqFN1PDnPSJC18LLKTbwunwUrLu1DtwdFDAI11CCVkTw
         OAkKgfhx2sCsdITNhv+C4jmIsNH5J8CwHLjezN11L7Zj7D66PvJdO0yXMBuHSfwV/8ll
         39sgJCzQ1QYKLZNXDbEhKd7jHPV9MYOExTGjtoznDJnECoJj3YcL3hiv6usxFgmK9w2D
         Vc8717vO4b4TPyJvMMGEaRZsPJoPGQJp7BmFoCFtxesIhwDlqzbnoimgnxc/ukUAEtXu
         EMcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L8Edi8jP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o47si4762721qvc.11.2019.09.27.07.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 07:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L8Edi8jP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDqpM-0007lp-Ac
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 10:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iDqGA-0007dC-JN
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iDqG9-00012s-HJ
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:26:10 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45129)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iDqG7-00012W-58; Fri, 27 Sep 2019 09:26:07 -0400
Received: by mail-pf1-x442.google.com with SMTP id y72so1581835pfb.12;
 Fri, 27 Sep 2019 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=TzPly1HOOP5ZxOVgZNGoYgvsj1Jnu09Ez2nIhgHlkY8=;
 b=L8Edi8jPOfq2NbZlINTGOHDgfJyjJIFAI0nrKtzA6iGx5qYKUMti0M25LvSOnNbN4l
 OM0naoRLzCuuz+zd0sp4/SzoW8ThYeAkfz/Qcifhbkg+zeAf5eLmkuK6MKwkPNPgY8uN
 QLPyZvLxTdjqCUU7QoVN1L+/HbWwX0jlzDRKQZSVEjCxy627dNVcsn2dIMev11PpNDsP
 uygFZN7Y9gGP5BpOSy1jfeb/tZxSN7HUKJzJkzpiqGUeM2Fzcr4DvpfsmBRagxFwwXLP
 GU+e1Eu8fzZnMofGeVof73xUnkzr/dbO5dK/uZZzIH0MC6CK3akiIoyRCdEB4J16P5Kj
 dT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=TzPly1HOOP5ZxOVgZNGoYgvsj1Jnu09Ez2nIhgHlkY8=;
 b=twWtxuFP0aG9Tdg0gm14nTRwZAxouQB99+QYCF/beTm2qj+tXdtgNDAxbXyH3MFIgZ
 IJKQDhOs3ULBLGlnJGZeNswjPw8y1Dbrvg0y4rwkiPqRVZxOOT7o3/rbXbnLbImAYnT3
 SKSEaRCVxUZL8rLLNDSgaM8zO4N+CT5cPlvDlssr0xkwGhFNKDy1hmTuM2KYjLn3oYqS
 ka3eKT8TQxcqIInok9LbtSFUhnN5ipkCU4AgSUG0sJRJ+PqVAwEhYZ2A021+0Tqwt3L+
 5/qzpgiuFo0Mb8CI2c4HdiJtFvuP7ETRU/Z9b+glEDvAsTBt0dyCxYt5ep+ScXc+C89A
 VLoQ==
X-Gm-Message-State: APjAAAX4Q/XKwU19VF708pumFaGwgtYDdiE9ijSR9/rbam48jJ1wQWs1
 cqlBsQPBEOcDfPOsr1zih4s=
X-Received: by 2002:a63:5745:: with SMTP id h5mr9518090pgm.268.1569590765893; 
 Fri, 27 Sep 2019 06:26:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f6sm4488541pga.50.2019.09.27.06.26.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Sep 2019 06:26:04 -0700 (PDT)
Date: Fri, 27 Sep 2019 06:26:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: bzt <bztemail@gmail.com>
Subject: Re: [PATCH 14/19] python/qemu/machine: Allow to use other serial
 consoles than default
Message-ID: <20190927132602.GA19931@roeck-us.net>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-15-f4bug@amsat.org>
 <CADYoBw11iiK=+O-mGYS5Xp85zVhezOXXXr-wKV_xCg07ZYuzVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYoBw11iiK=+O-mGYS5Xp85zVhezOXXXr-wKV_xCg07ZYuzVw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DT0++NtJrBPG

On Fri, Sep 27, 2019 at 02:54:10PM +0200, bzt wrote:
> Hi,
> 
> On 9/26/19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > Currently we are limited to use the first serial console available.
> 
> I'm not so sure. Right now it works like this:
> 
> qemu -serial stdio
> Connects the VM's UART0 (PL011) serial console to the host terminal
> 
> qemu -serial null -serial stdio
> Connects the VM's UART1 (AUX) serial console to the host terminal
> 
> I think this is simple and good, please don't remove this option. If
> your commit does not influence these cli args, I'm not against it.
> 
Agreed. I am using that mechanism (raspi3 uses the second console,
not pl011) in my scripts. Please don't take it away.

Guenter
