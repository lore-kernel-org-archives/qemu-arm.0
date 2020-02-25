Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1643644lfg;
        Tue, 25 Feb 2020 04:52:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOz+FI4DYitCQl71fkLfns2o+D+3sZ6VcPtDRY72bNGLeFMYHH0xenJveulzimjHMaXbBD
X-Received: by 2002:a37:b5c1:: with SMTP id e184mr59093846qkf.189.1582635127879;
        Tue, 25 Feb 2020 04:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582635127; cv=none;
        d=google.com; s=arc-20160816;
        b=LsxLtxsBxBGDWPANov9goeLJsOIb4DcVo6Z/7eNxKH4PG6umsays1Eh/qLIFQEte/m
         rI67buPjIwQ+0moVlUZxNOt9tKna67oqQyXTfz9IL74I4QKWPrTgY/cDN5USDsiY0t0I
         fshYwBgcsFywgl2PzjnBg3+SWqO6ic62tmf56uhLZpooloLSelzLrvKIP7/TvWETp4kV
         ZgU4F7+PeH+H3YVMVj2fGfLngeLhWaXpM47bJPS3k3eMULKsODg9I2UHhGjwihJ6+43T
         5JmLRVkpdio3q4dt1rJsKNSq5nna4Vp0zOGoSGXyiJ3aNk09unmWpyjeoTVctfgxRgDw
         mMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cH4yIJ3LDfBR7fon/qGvvy8vo1wHfnVaZXHIRFCxNXA=;
        b=u13PMgPgBclfDmVoxDtwm/+x/R3S3VO0vexpbhqWS485rfUdcy3YuVQy7KZ28EkyCV
         Pq/zFlbRSNsMejoTWnxEl7GTcjuGP7BaReGnFgeg6yUtO7Yjl/th10m7kfUPNaXwkMaM
         s7rsYvGZivE8Jc6KPLAd779Qdn090rt7zgWMehSai257wiUxviOXueQXfNGSr/z7xtgW
         M8xBVzWnxeMJ/ccNdJP5JSo7mSi6C6kp103F8HbbxnPddhjH/HjxkE4rui4MLm0NZmtV
         y9fN1FvS5+lf6vCDwbAH6EFyJx4SQU/DXL38A/OK99u8nNoOae6oFn6RSTHYPdLFrRML
         jqgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xSvSpg4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l27si7396487qtv.19.2020.02.25.04.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 04:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xSvSpg4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Zh1-00069d-An
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 07:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Zdi-0007om-Ar
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 07:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6Zdh-0007nI-8D
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 07:48:42 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6Zdh-0007mw-3A
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 07:48:41 -0500
Received: by mail-oi1-x241.google.com with SMTP id q81so12444143oig.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 04:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cH4yIJ3LDfBR7fon/qGvvy8vo1wHfnVaZXHIRFCxNXA=;
 b=xSvSpg4Tg6ciFLCOH6JWSouW85Kbzey2YaAwFNKUZC0csji6a79pk6Zu5dIut5diZW
 FCkSTBVZ30qbI8IE8iufcreQ7ilw+NvydTg9kzg1XB9m+qkHwCWI6oeKDpeML3av54BF
 63knxb6CEg3Qri5zIdOGL9M/O4mTp1pQ6ravT0yxxx6UCZvMjhcYMGt8pBSqUiUXnoO+
 7CR1NDDDA7WxdE3gW19IpFOa2bN0oYALsDN3JQTtCbEZBG5OEcfgwupaHRl7ZT/58EzE
 srTOja15x7xrUN1RPU/XYIItZL9eXo5pPuZBCkPX3aG3nKknNLGa8XHzq+KQcUnffrTc
 irmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cH4yIJ3LDfBR7fon/qGvvy8vo1wHfnVaZXHIRFCxNXA=;
 b=Io6yO9bS4IKgbbVojB94xaKclJxBaYxc1imqJPxIAHx5x1UtKnPjGfBt2bTOg8BoYp
 /lwm8FvKYoUgeZJor1wulCN2HYj7hACyxgYzzJ/lxgGa+4mPztKlQUhbZ/sZ/VVZgtx0
 40NdrQHMvglCixJkkJnR+ojSuSfJZRAZJnhahBfkKTkW8jkmR3lhhj3lMIE/vshlvmHu
 vBmp0k7RmvwK85MAbUTnmgGV5hx7TYWYGNMNTFfj4fCNm8iF6srUfhrNoTcLWycSiv54
 Oao5hj3R4K6f9AyyjMluCJr3fl8p89lMvBwTmG/Y15U6KADCPNCCrerIc/sRcg11sMTX
 QK/w==
X-Gm-Message-State: APjAAAWUlV4ymPoFvRjD26HFu/AxG4W/xWlKhKbOa3x+RRzlSRxGQ+Nr
 oi6dvrdLryID0OM0YMeriY7LTTBaAhcOBww/Mm77iw==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3265260oie.146.1582634920399; 
 Tue, 25 Feb 2020 04:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20200223233033.15371-1-f4bug@amsat.org>
In-Reply-To: <20200223233033.15371-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 12:48:28 +0000
Message-ID: <CAFEAcA9VF6LXeOPW+7jUpv_AFHdB46ZaJas4hcNt8KVfEwabAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/integratorcp: Map Audio controller and
 parallel flash
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GYlyc670W2nk

On Sun, 23 Feb 2020 at 23:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> While looking whether Thomas's test patch [*] requires a respin
> or not, I noticed we could complete the integrator model.
> Thomas patch still applies properly ;)
>
> Since v1:
> - Added uncommitted Kconfig
> - Use hobbyist git-identity
>
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675828.html
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/integratorcp: Map the audio codec controller
>   hw/arm/integratorcp: Map a CFI parallel flash

I've left comments on patch 2, and taken patch 1 into
target-arm.next.

thanks
-- PMM
