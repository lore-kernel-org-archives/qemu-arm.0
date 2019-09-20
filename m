Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1948781wrp;
        Thu, 19 Sep 2019 21:58:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoUY6r4++Zig9EC8thHM65rT6CcbmWWi1Ej6a5SBzGcsf6/lmrAYUI4e0ZOz3KG/E1+tlO
X-Received: by 2002:a0c:b068:: with SMTP id l37mr11504463qvc.36.1568955504712;
        Thu, 19 Sep 2019 21:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955504; cv=none;
        d=google.com; s=arc-20160816;
        b=JXvmRt9px+k/5yrls3r3FQeWa35NyKc6+id4CgC0N7eYMlGtyPMWCgxc3liZEMyVAj
         DW0NLyuYyT47sl1GZfAx5Tu53H2D6qiekQBSWuFpM3ki/AYts9t0G3tmL8v2q3t28Fv8
         7iOYOwG6hFfq677eeL2qnm2aXVOnnSIbvQYh5zaRUz1wg6H9Rrabzp8a0LMEvSXpgN4+
         2Qo5SeR13SZoCRzpe2EoCga1WPYi1CuzL2duQwWw4yDnsrp0kIWONPD8Axe/Y/n0ohuv
         YgeftLiyIMFDvR/ThTA0wO8wQu0Ft+92WPRMhtq252FiPWkQ5S+U8p/hNoQe1tUkjenl
         zVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SGI5ruWsSFpsMLLBU0QfsgY3oUihUxgZdf+94AkfPSc=;
        b=CoYkB+s/OAq8yiryCfIjueUhgAYqnLwTeaPZR+q5BdrhrCK9CrdNhO7mz4EDQqyD6c
         DsTkuXwJNqGP3fOi0H4GWC89bwQpvRIxTkllUg87wg+uz/qgTD84mXQKgVy5kkrAOfz3
         /XUjh8c2C/T7oUPrCvTLHT99TAodRd0XSveDH2XDNArIvbG4N1Mi4HzFO7nVG7twHY92
         EYaf4As5C5JUwg0b4XQTxOfDx4JK+LY/zYu4G+tyM9yLLDsdpk4xcsC49yCVHMgBWQMP
         UsFSh+oqpJQSm35rpnDQ2j17qB+vSTQshRDDtLnQnyOxw1uo/1475ZC543lIUmE9wRq6
         /D2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Am4ZSFzJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p39si1233397qtc.80.2019.09.19.21.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 21:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Am4ZSFzJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBAzw-00009E-1G
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 00:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwf-0006pC-FA
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBApL-0007Ux-MQ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 00:47:29 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:41757)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBApJ-0007SJ-S5; Fri, 20 Sep 2019 00:47:25 -0400
Received: by mail-qt1-x842.google.com with SMTP id x4so7192535qtq.8;
 Thu, 19 Sep 2019 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SGI5ruWsSFpsMLLBU0QfsgY3oUihUxgZdf+94AkfPSc=;
 b=Am4ZSFzJWYV/fGQ2qitFkVSdvU4D+4y949Yw522yufJgYpO9zpgAeZAUn76RbNpmwL
 87Adm5detDnw42+bdL/o/Axj7GQ58wfd+5LyVcc0zOwTGZHsPb7CYkyVwCXvcjlYpek6
 Vwrf7Tc86srhq6795QmjN+2vrpFHbwwLQ2BE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGI5ruWsSFpsMLLBU0QfsgY3oUihUxgZdf+94AkfPSc=;
 b=FWgV6hzsvrFluCss7pApgDYocvEEN60mEFWr642B3i2pPKr7UblIk28EwAVLBleiFr
 DwSVFLyKHDQiXFW3KWkjGiArOHtxi7ZbJb+cHdQfdGEQGbJXk6w+Pop+pW8Dh44eFvDu
 35PhfQOvvGDROhNEkQ+gnuEY7IOkAGX9atitf0Jk/p8srmws2zNRU/JzEh4Wt70/G0Qu
 QgmNwNn+4AcJOtRN4wypjJQquWWZNbGm6EZ7PKnxPMD64kHyDNEXlq34548jmuMFcKTb
 iwbtz6JtaE+4Jqf9+dxGingHgnTi6H36RPgbkEe09ohNJXUDPasDtfYSsA6AR/kbnbfx
 Ma+w==
X-Gm-Message-State: APjAAAXetEgwpAUzzHgs232i4gyUjOzsyuz62i9ArXO48NGfPW13V/iL
 GqQYsUo9RhptqbFTXFDJL8o/ukbk1rVywT9chtQ=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr1207553qtd.255.1568954845006; 
 Thu, 19 Sep 2019 21:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-15-clg@kaod.org>
In-Reply-To: <20190919055002.6729-15-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:47:13 +0000
Message-ID: <CACPK8XdbprvDGcYwhA=twT1osJ1EaUj8cveSZZkMPxfvtn42ew@mail.gmail.com>
Subject: Re: [PATCH 14/21] aspeed/i2c: Introduce an object class per SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ALb6dBTyebW9

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> It prepares ground for register differences between SoCs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
