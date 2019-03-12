Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp783850wrs;
        Tue, 12 Mar 2019 11:20:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtVp2XXLgWNDGRc6AN4RWgdujlU+MePO7zXkcCRmNNCP8jQI8YVtlZ3gLL5xgQiGU+ECuf
X-Received: by 2002:a25:2c45:: with SMTP id s66mr33963397ybs.432.1552414804544;
        Tue, 12 Mar 2019 11:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552414804; cv=none;
        d=google.com; s=arc-20160816;
        b=cwB10Hb0rd9MMFkjiAmOiDyaOVahNWUceungb9jCtoyWyyGHrF/bokhj9OuHU+UiyF
         eGpZG2Yu1wNBuu9TNa9uRK9uN7/t7i9s75QWTKOI7D6FWsHNYIsWdkwGK+IwdddFuvga
         HI6ZivDMPhfAbsAWrGGiN821SoB2nG9Hbu+9kpfjQCCjG2TvYxQRKvahp8AusXdo2vjb
         lv/Coy/0IEfYXYNCN1UGuzWBp1hMzhyxTIYJt2OeQDE6t2XMp1yMoy0/pKtaJeJ54fLL
         1VdeQzh23KQV31VDn78L+mXghNiHTjcBmpPXbXoHSLV7VzAVDzImIziweGle0LQwrVSs
         subA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4htiJ63gEmka+PTvn5qY4c23oXKmq/PeN2xJIA7VOLA=;
        b=I2cucqZaMNpK4kB988yucuiWzA+AErUndoQtDZdpMOWVNvSYX9UyPcnU2EOm6dN8wd
         62bIntqzseYNRsAdn6TlWx2sGDeCEVh8r0ODS08B2p6ODDNzvfLas7bYUDaMd+f/yyE2
         xPlSS23MqM+CR7bTUtGTSKmtIU2poRiB9NeOCpwUxGpE0MioHsVGJnhnUX8VqhETb+fX
         Q3FcI5w8LCaOGVYGD8y4SwXEJVsbikOoh6rT4GyPUGM5ttJsy/7KApOm0cHVYLwMKhIi
         +Zjc2s3LbXN1lOYG8FoIf4eiNcHUvecyCLZ+1tiq2YHoSWYcWnHEPgzBSFiHWX+WzgHu
         CVHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=poHS++rn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f184si5191240ybb.348.2019.03.12.11.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 11:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=poHS++rn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3m0S-00014d-0d
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 14:20:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3ldg-0005kd-9A
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 13:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3ldf-0002Se-GG
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 13:56:32 -0400
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:39818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3ldf-0002RR-8p
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 13:56:31 -0400
Received: by mail-it1-x142.google.com with SMTP id l15so5973193iti.4
	for <qemu-devel@nongnu.org>; Tue, 12 Mar 2019 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4htiJ63gEmka+PTvn5qY4c23oXKmq/PeN2xJIA7VOLA=;
	b=poHS++rnNmyE8egyNqWcchax51LaSbmyXrRmXioMMe/QYvBl8hHZSEkbRBfWusM5ZI
	J3eVCTMvEVChcX+BRjiguWQcnlWVf84a3sJHdXmgcmo4kON7sOH7oMKYTPAuXpbFWRwU
	9KXqynYjxI5hISBAvw63QPGOGniQr08O6PbtlDdxTEfLzDM1qr6IS7KRhOTYSYx6HJSf
	GF3eT83S3FNLYMiebEG00c+Tg0BuhElGyG3yjZglRoeV7cejbZzBTIWBzSp4o53MTS5Q
	WwLb+LgIJbOeWhQM5osaWrx/uXtvmCt9pvFi+g/kMsP9AAVjrA93r3hrGreWpj8O8GtB
	/UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4htiJ63gEmka+PTvn5qY4c23oXKmq/PeN2xJIA7VOLA=;
	b=C20Ben37xcF/VwYO+uBRBppxZFJf/7yICOLs8rKy0YpAgBZM/wgwYpjCYku7tMj4eQ
	utyGfJ3xQQpUFCtRvi81QOO55tfiFZmMqzlK5LjrtHtI0XcleNRSrmS+3ysgPGXFccne
	v+36oVmzzcQfCXXeIoCEi+DiEOJnOZ2GzJ/lsb7zEv/4h3uYg9G3nlFNY/RCCk+yAKbl
	1FjXujqBr2e4xPZ+6zrsYmXTQScJY5MI1QBH+4LpQxBxuPkdh8c56KIu+hX8WbXfB0Fy
	gvvi+A37UEktS0hNtRlKwOM3NtKSUpBEINQqbZf9q/H67mxpn/mV6DilUm6w9SwgLgUW
	0XCQ==
X-Gm-Message-State: APjAAAWiiSHXs658FugOgLtLlFehr12xz82RYvxck7jb4FZYH1cHUUzo
	SpTk3k8YMJKDedbmTYt26jDBXWj+WikVLJdidtEF8w==
X-Received: by 2002:a24:4087:: with SMTP id n129mr2712810ita.140.1552413389969;
	Tue, 12 Mar 2019 10:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
	<CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
	<CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
	<CAFEAcA-+U75+EQzcpV4kZHw+4xMSbMv3UJ0CV_Q3DVbNx5RbNg@mail.gmail.com>
	<CADYoBw2XWeDUqBHVJBWxJAzQ4f0imosEeLHHoG9AfHfdavOTrA@mail.gmail.com>
	<CAFEAcA8YT4oLWK7gQB44p5UQVHEUR6bFdHy6VcGnGAxFxhWdiQ@mail.gmail.com>
	<CADYoBw1TQMpkYbS8g_OzZ4UeQz=NYO=dugRnCuL2mP4xBxcWMQ@mail.gmail.com>
In-Reply-To: <CADYoBw1TQMpkYbS8g_OzZ4UeQz=NYO=dugRnCuL2mP4xBxcWMQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2019 17:56:18 +0000
Message-ID: <CAFEAcA9hWPvGxw3THrsnQAMuQ87gzArGRa+kouF=d9DWsEnLTw@mail.gmail.com>
To: bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9rL5L54T62t/

On Sun, 10 Mar 2019 at 11:02, bzt <bztemail@gmail.com> wrote:
>
> Hi,
>
> Okay, as you wish. My code works either way and on real hardware as
> well, because I acknowledge the periodic IRQ as soon as possible, so
> good for me.

Thanks; I'll get this version of the patch into git master
at some point in the next week.

(I happened to have an rpi2 to hand, so I wrote a little test
program to check what the behaviour of the h/w is, and it does
indeed not clear the INTEN bit when it signals an IRQ,
and it doesn't clear the IRQ line until the guest clears the
interrupt flag: so if your IRQ handler doesn't clear the flag
by writing to the register then the IRQ will 'scream' (fire
continually) both on QEMU and on the real hardware. So I think
the data sheet is correct here, though it certainly has its share
of errors...)

thanks
-- PMM
