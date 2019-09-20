Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1953567wrp;
        Thu, 19 Sep 2019 22:03:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ0Z6eTjClOOSMUscvKzPK49KEiTxdkpAN1TmRWsGQTljzgMrVxP1vykvt/9IuPHbQX09j
X-Received: by 2002:a50:f78a:: with SMTP id h10mr20179245edn.161.1568955795231;
        Thu, 19 Sep 2019 22:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955795; cv=none;
        d=google.com; s=arc-20160816;
        b=iEI8mp0rYUmntUZ7baPB/eEIwQA56N8a2PdMFZnNGF/6JPh0Ky+hxE86Lcer9vIwyA
         pwAz1uVA6VFGmgsrT5AhD2WyQqHxMyZ7NK7V27lu1TAtD+0rNfCVpXdLNTypHYymHZK0
         /w0Le8L6oGB0056APqCNiTzjOaZrP3clxB94jKY7GKkOGNLBMXTPsV6C32vaLaPoMVdq
         yqoFxodLarI3eJ6KncSYn7IxFiA6RLpWsO8tB8WcuomUefJeEic2gmWqZxNeswTk2RG/
         DDxHJZH/loaw6QZvLwHE6Kv1stwHtFmkWfCuBJ9kBpEnSvPnrm3GY+zI8zIhfO5i5hAK
         onnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Rn7Tk2uHB/T6xugSgAQXU7wxHG5fe/ryoh/z+q4n7+g=;
        b=KgQO5ArMpDQXqPabpnBCUZnhmgQv4H/BcVVInEiSg0LoIRrNGxt02jzhRClGnLmH5A
         IlfUKaH0BAQdrA50Oii1tdHsitihN97ruIdRHERZfuhDEWjQYp0KdVLYdYRSe5085wFm
         Azl9JbGX9NiIwGLcCc8eGlTc01Ke2THt7npeKMWAujkpWCMZ0orjdi12GASyudRnzlkj
         LIyeO3fLD15v0DOYGfe3141CbtVCUclDDUcOKgCTQmA+4y+pKq46BYdP/OsIetP4Wdd6
         lTHmPGWtPbCvnDqCqfjkMQPaGGYuaElu/exkXMpPko/D8gJOUGUqSgJzRHGIPBCOVnlY
         QVog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="PACf//Sz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si456551ejr.272.2019.09.19.22.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 22:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="PACf//Sz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBB4c-0004MS-5T
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 01:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwo-0006zD-UX
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAli-0005vp-M1
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:43:43 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:45416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAli-0005vi-IW; Fri, 20 Sep 2019 00:43:42 -0400
Received: by mail-qk1-x744.google.com with SMTP id z67so5951156qkb.12;
 Thu, 19 Sep 2019 21:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rn7Tk2uHB/T6xugSgAQXU7wxHG5fe/ryoh/z+q4n7+g=;
 b=PACf//SzGAsO+5SoCZgLBWEqSqK42zxzzb8d8kCnrqPNdYskR+Uh3LavIyk3z2zUw+
 uuYfApoBhZragXmedwB2IWWsDmuL3eqBpA05qwWCIwO0IRYqTTGJVjRLJumV7HUhU6bH
 9j8NDqdpbzd44jc7fxjk7YQE9jj9Jnn19PPuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rn7Tk2uHB/T6xugSgAQXU7wxHG5fe/ryoh/z+q4n7+g=;
 b=qyWFQow5FqFVZn2olN3Nm4G+mgecG0XZsU6ksqMF4WWbumf+IeTjLguQFSWbiBe11k
 NexEho8qVwtJigTVVlLI3k23uMwvk/uuLDMQMBasvm7I5otqJ/+JDzkGO90bOIynFC1F
 5Vwl7GBiF55GejHXzJb1sC8ZiNEPpk5REP4DX+iPJBCKDBcvF8jZGhaldE6KFMzxXmgu
 eoO+erIExqYzMzwVz2F0lM04JTMyFh1Ozsp57yuyHqkJ6qFrqA6XJJiZhP+zJ7HncUkl
 aqt62TpyrnuY/SH0xB1dBVgCSdwofuddioWhHJyQNQJKoUBaLLnG/V98MoCIDyHsgvy7
 WvHQ==
X-Gm-Message-State: APjAAAXkwJDqNHunM4Qnz6CZVhafOXQKFkU9UmWMYPlGRxVWYdG4x2HF
 k1rzeUrszYk0xvsVfZq76FZSBGmnBBFI0hSPREJJ5w==
X-Received: by 2002:a37:bd5:: with SMTP id 204mr1738608qkl.330.1568954621777; 
 Thu, 19 Sep 2019 21:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-8-clg@kaod.org>
In-Reply-To: <20190919055002.6729-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:43:30 +0000
Message-ID: <CACPK8XdaPsaMyUVUnNULG=6_AD17Z9KCm=dkSrv_YDckmyD-HQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] aspeed/timer: Add support for IRQ status register
 on the AST2600
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
X-TUID: CmfWJe30s6W/

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2600 timer replaces control register 2 with a interrupt status
> register. It is set by hardware when an IRQ occurs and cleared by
> software.
>
> Modify the vmstate version to take into account the new fields.
>
> Based on previous work from Joel Stanley.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
