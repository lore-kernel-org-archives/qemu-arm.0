Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp119424wrg;
        Tue, 18 Jun 2019 19:12:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwK1M+spMLL6o+2FtSryUfepuDTmY3m9Vl3tsQGFENLC/IOeIjrOwRiL5QOJZ7ATm7PpQq
X-Received: by 2002:a50:9167:: with SMTP id f36mr20504635eda.297.1560910379280;
        Tue, 18 Jun 2019 19:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560910379; cv=none;
        d=google.com; s=arc-20160816;
        b=jqv8l1O0C1R+p10vLWc/CnK+Z4yQfmiKPj3S+em98TLBUgofmF/4mWmWlUfAGhx/+4
         9/X3l2e7mNDdt4h2CRcGY4+5OPtUO1BG41k0XLRXyY/TXnWolNQm+D72ivoc1XspPLt4
         MbyiZ9XSEzPHr6OFcVzUI4wzsuCHJMlNHTmvo8DNsf/+ubu6X762UbI8kcxXE+Vj6G8H
         ybvpzlMhbQ5fir1i3RfheuISdr6k36pZyodgL4BRSEY+f1mT5xkT0u6JyTHS8Kgq3ZDO
         BZruRrXuf/m8QHb+OtfLbprRK96bxB1V/0xqrBgp+9XWRi6K3U4intnMbrZoCAR/AC84
         AFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=JmFYrZ/2pNkhlZXI38OKDocoPb+MDSF3p7Zqlsji8kI=;
        b=UtvU501PPBqpp9aw0hR+2iAs6H67QcF6nnJH0hV8+AqaSL0GQOu5b5hxNzKkoYxDmG
         nmF1rMlUrAmY8Hoo8dDGhV6HT/8QFh/hmGOElQs0bwrf0UQCkbuT0SRsatLEt7b79UVI
         g9R/Ct5hRYJ3rTuiGyseubsJ45uyWcyPaFtjGTE50G4lHdl316/OhA+gDmH6I/hS2zz7
         6eIyAVI7hLtPeJOVV1T8mnlHVToLFpjCRiRx941mou4KoSu8JmU5QwUlgEQK7wW4a55Z
         I7CCyKIHDdHZkdlzbSX6NBcbETTQht8Chk7XtQz6CTh3qFPReK0eatzKBsBNnCJsC+P3
         i4/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=jIzTfLDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s27si12928159edb.6.2019.06.18.19.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 19:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=jIzTfLDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdQ5q-00016c-Bv
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 22:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34443)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ5j-00014O-H6
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ5i-0004Ho-LL
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:12:51 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:36270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQ5i-0004HV-Hn; Tue, 18 Jun 2019 22:12:50 -0400
Received: by mail-qt1-x844.google.com with SMTP id p15so18072663qtl.3;
 Tue, 18 Jun 2019 19:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JmFYrZ/2pNkhlZXI38OKDocoPb+MDSF3p7Zqlsji8kI=;
 b=jIzTfLDF1e3DXw9edY1FZdbuo2J83P/RhlOwqZxvVmxmHlYoi35pfCPWmL8F6wuAh7
 pf1wsk8IL0KxMUu66LArJSd6xUIegJEK6zdFDirMfbMw37jzbm2B5yffrgteF2K21Ksv
 bQX/P3fLshx1LDRpMBMQwt4A7Barfp5Kmch/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JmFYrZ/2pNkhlZXI38OKDocoPb+MDSF3p7Zqlsji8kI=;
 b=s3LZSBCorux5Ko3OgryZRkVUaXMSDo+B8tNLHoc4RokbUWYzJWKGGt5uCplw5aT1ql
 ztrZhVPB8Va3T9QmW5Df9x/h5reSRvr2aYfDL4/ATa23zGM33exdKOpiGGaXKdHjMCbb
 9Q+zS7USnAgDjMX595bHv7/7nTkhVXShPgIzjnS8LYQmaB4jtoc7eIsoOPRiuA+pE6ku
 fc23qqSPMXcPnC9ohMnRWXKRv0xrqOMXImoANkDFRvrlCzdsOJRBkukQ2dueqgOKp2qQ
 ZLUTfQxbGf1KbmGENoUeuhJ8eRDhZIDLqcoAKyqNhjjorW3fuBhkcs4ssh6ewIeUs7ke
 9QCg==
X-Gm-Message-State: APjAAAXZZbkhX5EjgOQOjOmg3HdI/8N8uak2wVoBAfTWpgFnazANlzQF
 ZCe3XILmp1WnJiySguHjK+OrISQGOrIOgHKXl80=
X-Received: by 2002:ac8:7545:: with SMTP id b5mr94541008qtr.234.1560910369972; 
 Tue, 18 Jun 2019 19:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-9-clg@kaod.org>
In-Reply-To: <20190618165311.27066-9-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:12:38 +0000
Message-ID: <CACPK8Xc80XFjJ_o9X4i_LtpCqL8c00rmLKJ_Tio5XP=XEOhTow@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-arm] [PATCH v2 08/21] aspeed/timer: Status register
 contains reload for stopped timer
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S3/oIL2tdww0

On Tue, 18 Jun 2019 at 16:54, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Andrew Jeffery <andrew@aj.id.au>
>
> From the datasheet:
>
>   This register stores the current status of counter #N. When timer
>   enable bit TMC30[N * b] is disabled, the reload register will be
>   loaded into this counter. When timer bit TMC30[N * b] is set, the
>   counter will start to decrement. CPU can update this register value
>   when enable bit is set.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
