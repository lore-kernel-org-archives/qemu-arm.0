Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10005248wrx;
        Mon, 25 Feb 2019 06:39:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY81/vQUoqP62Co09+B0XId+yPhRzP+UKIsgEIUPZOlyMTbHKRrWT/YzgiwBMuSzyQ07prt
X-Received: by 2002:a81:24c2:: with SMTP id k185mr14352482ywk.179.1551105561113;
        Mon, 25 Feb 2019 06:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551105561; cv=none;
        d=google.com; s=arc-20160816;
        b=aDcqY+MAx4Y/J4Q0GdDpOor//4lFIJt3gxBgwGu0j5nzhBgqXFlvR/ID7vS6ExjHCw
         hO6mk68KtLYqFIdJN46aPu33L58GD9v1RTHHG/uN+txFADyNCiCKNJ3H532glC7LFscH
         UGCo9cVu5I5CzZNeP7wI3eeuqljUDZYCjOF0Mxssr/m8vRlUB2YXZmSLiNqGNsEd4xWd
         cd6X3mp3x6tld2fB4Y1sTJqjoOws9XAyZAWp3354+K0eLML2vZVC1dAQhrEAFOcgVKvw
         Lml4b3IOmRKWu8Ss9RwtzXlDpc5bWoKbRrIDjC6tt8a7q5e83IrjyGHW7UUad+RqGXdI
         HCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JBZpuki7Bi1OE58bdPtPqNonTs95DrEvxjICbHAwebg=;
        b=0Ao9lHGZzujzy9lhtAgjhwgTITc01HjNqwEf9QGoryl6xYgdMYqfcsl46Khpa0zfkL
         oMmcJATAsG63dKCoZhXKHJAqYBdXzoNHADljk5LQJ4z/+sLuXUEoiu8s1nRZgZWvPCeg
         uuKgreHG55HHuDmQsTDsCmAQH5hBJFb1SNc/yoXs6GMdMvbTdpVCKtMObJqA8mGdR2be
         wEC/RyXFMOCHM/DUgqiFlnL6o/rgTLmERNzjkv5knWWCV71mhCQFfH0PB9CUuUZK4QYA
         Qxaidm3ZqgRXiGmg6y6P2xw+MIYywrjwVN+zpZmbzZtwlPXYqtZLrqsvQVxmyLYwm8GQ
         BAPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfIKgd1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r129si5149243ywb.164.2019.02.25.06.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 06:39:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfIKgd1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyHPc-0001KM-Ia
	for alex.bennee@linaro.org; Mon, 25 Feb 2019 09:39:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyHNH-0008M4-DY
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 09:36:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyHNF-0002Ht-Cs
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 09:36:55 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:41047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gyHNB-0002BC-SJ
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 09:36:51 -0500
Received: by mail-oi1-x231.google.com with SMTP id e7so7392996oia.8
	for <qemu-arm@nongnu.org>; Mon, 25 Feb 2019 06:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JBZpuki7Bi1OE58bdPtPqNonTs95DrEvxjICbHAwebg=;
	b=qfIKgd1K1zYoggOCwGGTBDYdvO7+CLvM2278TqDBWoolxq4bVXoMooqCYQvojfBQJ8
	lpEsUEKombkyGxbp5/4yI9ZfLIe3mza0riqAte3+p5fk/UkcS7Y7D7sc7v7uDnk76f0h
	2CUeBFXh3C/vRW3D3NADYV0q26FwRcqX7PKGGovrj/8gIwWkMFwM5MscqnRpK+uZ7fQQ
	OI8aZ7q9MLgSVdVVEUzrqrcoiyLeFPMkIGUCjw7nU2pv0TQjeEpnDq7G+jpJoVWgbMky
	1MBxNUjoSwvu10sPKbS5a3IkF8DH5L79BSh/7ycEV+nzFX746WCkuoRBiOYf0Z1WFdM9
	Ef2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JBZpuki7Bi1OE58bdPtPqNonTs95DrEvxjICbHAwebg=;
	b=MuvFVtYKVuu+lla3o+Mm1k4wuG0mpe1PPHZmkEN5/z94hmuXlsmLiMKQnpl9SMeVLW
	nqb625g7uXNLf9jrdVzeNK2FNQlVtxvf1knCzz4LJomnWxfcyVqggpttsIS79KZzY998
	1Ub5CDlNZNXJnpqw8u0Itsk+GY+NWae9FfbdTAdkRF1A/Li8ZPGy3v3L8LrT0i3k4rcA
	t1F7I8NXB20K+dPQRFyu+EYHETejm8vrKf02zeRbI8sZcP2g85AGp3txzIiZYCaRnaYZ
	cXOWsJnyiGa7gitGZanKvhJXLeyYOOi1klyMIs9khsgbUqjn1l9+mUm2Xj7eC2xc2CVE
	wRkQ==
X-Gm-Message-State: AHQUAubzMPrrqys+kIGRVoh9pnhUUdIVDj2bTes7gPGySQzTzyxBIFR+
	KqDfrJLIJNVIfhqN5JINQS+zOt7BN7Vw+85nXwY9Ron2
X-Received: by 2002:aca:1813:: with SMTP id h19mr10651067oih.146.1551105407891;
	Mon, 25 Feb 2019 06:36:47 -0800 (PST)
MIME-Version: 1.0
References: <CADdcL-_-VpubFVB74kac+HW1HopiKhSKfWsLypNafka1BV=hrg@mail.gmail.com>
In-Reply-To: <CADdcL-_-VpubFVB74kac+HW1HopiKhSKfWsLypNafka1BV=hrg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Feb 2019 14:36:36 +0000
Message-ID: <CAFEAcA8p1Mbu2yviHrs_rWfpKZ8-KK436i5SdanwARnSatQQ5g@mail.gmail.com>
To: Benny Baraz <benny.baraz@hexatier.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::231
Subject: Re: [Qemu-arm] ARMv8 (aarch64) emulator with vnc
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ThPWmSnHlUf4

On Mon, 25 Feb 2019 at 14:22, Benny Baraz <benny.baraz@hexatier.com> wrote:
> I run the qemu-system-aarch64 on Fedora on Xen.
>
> qemu-system-aarch64 -boot d -cdrom /root/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda centos7-arm.img -machine virt -nographic -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::5555-:22
>
> From another window I run
> ssh localhost -p 5555 -v
> Connection established but still there is no answer (black screen) until Connection reset by peer
>
> Do you have any idea how I can solve it?

You should debug this in the same way you would debug
not being able to connect via ssh on a real hardware
machine (this isn't specific to QEMU). Look at the logs
inside the guest to see what its sshd is doing -- is the
sshd running, does it see connections, and so on.

thanks
-- PMM
