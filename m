Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1949200wrt;
        Thu, 24 Jan 2019 05:51:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7utBc8iSFZuWwusEspXwhgagKb3lsx6PiUhPyr7wNXuF40DcuL8Thf/bVteGzLZy7KtztZ
X-Received: by 2002:a1c:8acf:: with SMTP id m198mr2900348wmd.143.1548337889215;
        Thu, 24 Jan 2019 05:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548337889; cv=none;
        d=google.com; s=arc-20160816;
        b=lg/qmdAHi76GpqHaYeSMZQ/HI9VV1qscDx3qjiTrVkUv7UZFbmW6zy22boMRXCXq0T
         XxaF2RUwd70yM024+HfXHHQUErdZc0MLRqLyFRTGaJ6PEan3M/iaZHl79qdg6iIr+La1
         /N0W+TkGMme0CbKX6XkibRZSroQU4QGPw/ECvQxZZQdIQCdG6bvH8lN2VKJGUpZ0SzKs
         XZnPnW6FIfTaX0+Lvyh3A41jYg85iZ1rQhc2QOvJjOmHN7YxA92GWACC+I9ODuf5CeBF
         YkOs5IEIkfvcjmTUzKLy2ZD/8y/F0ssPdzLiSodb4m4QD5oJgyhGZt8SIQwvWP5BYqFL
         zezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=B49MTvy2htmy9EAiYa+lzBhsZjIVc/hyrp7PKkLr8dE=;
        b=dJSHKXDQ6frZPDlfSGp/H5qgBAasyFhUbvJlKoEzWoN1wrGtoSw7aafQVPOItWiMMe
         5ZxcMz7rIV8/iLFqeF1xEGqDYBZNQcU+gVu7eHhdO7yQ+H09cOnhE9d9lNU1PMAUe/nA
         +Nbs9lOkDNGt6U95xoOG1/Pvxe9qSlK5Tix6T/HoTm5J+SaSTxYuipUVn8eoztMvtt7N
         5YwhSIzpR/HD2scUNmbOVKEvOXf2iLBUQE2OwdfjPqBU1K/fCsTeKWdZYgDQRwqlSxuc
         yZ8a9yRG2yp+ZYqG/WAPy/GCYfD5tc2kXlYBPXNpu3fA/kdPWsPkLyfOwR4UiF8f0qhn
         JzYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fmD+kDGh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si38723791wmg.129.2019.01.24.05.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 05:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fmD+kDGh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfPk-00050k-8K
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 08:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfFs-0005kW-Dn
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 08:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmezy-00028Z-1y
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 08:24:52 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45585)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmezr-0001vS-UG
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 08:24:46 -0500
Received: by mail-ot1-x341.google.com with SMTP id 32so5149777ota.12
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 05:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B49MTvy2htmy9EAiYa+lzBhsZjIVc/hyrp7PKkLr8dE=;
	b=fmD+kDGhaC/k7Z86il4H2UCQ5+BYNTLreiSsBq+/Z2uZb1iOjJzHjtTCSevqXYEMpI
	ojX/rf7CZ5EHAvDitXabrkOFfsnKRcd1+dGJHXdbu5lcu6je3/kSRyCFTm69nPasiFWZ
	OYRoEd4dALJX/tbBK4zY3D5Vcl7RWbFloY2w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B49MTvy2htmy9EAiYa+lzBhsZjIVc/hyrp7PKkLr8dE=;
	b=U4qYEtBD2NI/1HxISHnAV4KX0dww2fjNR8P7RxHZW99SV9oCqLK9GF6Oiudg+63IH2
	c+jFrfd2n2OvlEdmg21VfTMBZ6IBxKO07NpP2cYnu0DDiMsNCcS+B6TpiJWlNBv3e7Dy
	lFeBFaRd2RoexwefTJxT3oHhq6KEkYZW0a7NnaOU0++uE4NFyjL/lUgzOnFm8w30BzJ5
	0mKYWKWyBdN9Ycm6DC5ryfYgq3FAfdVtJGrkZ/mNaO8y/q0tOMFDrOvjxl/m2JY2vcWJ
	3kViR3WNIhko7TW2n5692jtI/Z8p4w3vCETgR69xXTXF7ryBDTYNgjkkAnh4dhFAN/09
	+Evg==
X-Gm-Message-State: AJcUukdGdvCBOVonkO5hbMZGLiIJZHrkOuxbyEszWMghjWvK4UNM4363
	xVXv6T3VbMGDudzv3s0fUsdauKoSfJLg0PXauc5zdw==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr4032634oti.151.1548336273208; 
	Thu, 24 Jan 2019 05:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20190121154928.32065-1-clg@kaod.org>
In-Reply-To: <20190121154928.32065-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 13:24:21 +0000
Message-ID: <CAFEAcA-n-5GVpnKn_w03bJUR2Wxf=vCtyeXt1GK=PKEzvahTMg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] aspeed/smc: snoop SPI transfers to fake
 dummy cycles
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hPTNETKcR4O8

On Mon, 21 Jan 2019 at 15:49, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The m25p80 models dummy cycles using byte transfers. This works well
> when the transfers are initiated by the QEMU model of a SPI controller
> but when these are initiated by the OS, it breaks emulation.
>
> Snoop the SPI transfer to catch commands requiring dummy cycles and
> replace them with byte transfers compatible with the m25p80 model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

This fails to compile:

/home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c: In
function =E2=80=98aspeed_smc_do_snoop=E2=80=99:
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:646:42:
error: =E2=80=98R_DUMMY_DATA=E2=80=99 undeclared (first use in this functio=
n)
             ssi_transfer(s->spi, s->regs[R_DUMMY_DATA] & 0xff);
                                          ^
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:646:42:
note: each undeclared identifier is reported only once for each
function it appears in
/home/petmay01/linaro/qemu-from-laptop/qemu/rules.mak:69: recipe for
target 'hw/ssi/aspeed_smc.o' failed

Is it dependent on some other patch ?

thanks
-- PMM
