Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1839291wrp;
        Thu, 26 Sep 2019 01:25:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZ2AKwfnau4S38JOzhrZ4vWj39kUYVJqPVHB9z3LgECBqIT/wgAgaLMY9q8kbnE+k3mi55
X-Received: by 2002:aa7:cd18:: with SMTP id b24mr2193995edw.181.1569486325170;
        Thu, 26 Sep 2019 01:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569486325; cv=none;
        d=google.com; s=arc-20160816;
        b=ppziT7SnY0lzU1OPbaxahyPI2tE8vpKL2UTgPa0DrR05EnCbCacelFvkAibPjn8uuC
         NPx3iTuH4ZYl7aGRDw9Jpd0fcuprCmqvbeNeLXtW9fNAymp8N9bMoMBZ7r3FP/RfDRRP
         yLsA2MPVGNP70AHg55GRL/cYpUgCgtGSlZn6LVtYDWfQzK1SdgNhuHnCeTAJPvUJ7upz
         YuIHsdrs5v+iUhiVAMgtU/45aUkICGufTVj0nYUaeRknrjXmKYpphs8JKIZvaZbC7XBk
         dXGsRt42dWmghtaQrSmF3N8VXMaodzX2mjMBdS4AGI/CHnupdG+LtPHlC9rj5CfN9mJZ
         Dx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0tB7GcN89aEd7SiJdb2whDGpMrw7TcOxIWPnV3YqKVc=;
        b=k+6roWYIHHxTFTs627hKMX2X+JI3qWhYqwjT32DBYOCORmZMu0jc9WPg8hgzEyZewR
         JMXSbgsTPLdrSqalo9giP1jroHS/9LA+IZCMQRg3XTJrFjCT/hDIsq0HqWfhwuycB8qB
         7vftMdvQaKNO57G9i4Rm5+ne2sUorSXLMVolCBI+ayiESuRy4491AXhqvyi5S8RX9HO1
         pRsHkO+JT/k7h1AUnsMVdA0CAkjbvii5GWrc0LkZR/FTSX/2yIBVZfDywGhokgW2227n
         WbBYvIuG5dP3gt/HV29fXL48jHoFg5A8MC55AQ4JUV7zJDEwcisCb4o15fT8LROyGSek
         0P1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=GOgS9y1T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oc24si642554ejb.254.2019.09.26.01.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 01:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=GOgS9y1T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDP5Y-0002pR-58
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 04:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iDP57-0002pF-N9
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iDP55-0004wu-Vb
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 04:24:56 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iDP55-0004nh-FA; Thu, 26 Sep 2019 04:24:55 -0400
Received: by mail-qt1-f194.google.com with SMTP id j31so1805084qta.5;
 Thu, 26 Sep 2019 01:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0tB7GcN89aEd7SiJdb2whDGpMrw7TcOxIWPnV3YqKVc=;
 b=GOgS9y1T0SLjHehxqZJJLPEX14NlzWQI51j1l86+wZHuXMTwtoHjT3e3rA6gAjAiqe
 rzzwh8a6AO8npV6Ix1PO7BgwwmB8kVQz3ESpY6XDvwOCaSz7nB+Es97ntJMqzNdqBJjP
 2cln28X5T3FXC7RDGAiW5PLPUhSuSF6LkADpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0tB7GcN89aEd7SiJdb2whDGpMrw7TcOxIWPnV3YqKVc=;
 b=j5iKx4KNjp1b5sw+wyzlwv7dhR0INdITtZTb9sMehECfnQoFHeHEO21DudZ8J80vfJ
 E/C7/arEBhmxZeELuy4R2RoInwn56gLyCnEnQod57Ee5ERf+MrE288ctH6bOl44mFPOD
 dyY4Oe8gNExVhmzk5x86REBYFnH+Zdgo0oNWlH88udCj1a0aBjZsvvl1YaI0GKOYZTB9
 aeTWQNiaNtKMvolR7dWqIhD6Z0twqshvUZn14RSmV7tVYI26XMG0SAh+5zT09KSJPF9c
 p2EFdymcfBG0X/a3ytPs4/H7OZ+hvufPz94mCt7Xi0lyn1GJeGtvUFe5ANCM3UsSHohL
 rlJQ==
X-Gm-Message-State: APjAAAV6SPwf2rn9DiwVK2q7TutNq1PQPpzMAkAaYwFPSciVvDhdE5cG
 UCCsDHKejw8asQoFKKf2bLsets9yKAym1C+vjbI=
X-Received: by 2002:ad4:55b2:: with SMTP id f18mr1662866qvx.16.1569486230441; 
 Thu, 26 Sep 2019 01:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
 <20190925143248.10000-13-clg@kaod.org>
In-Reply-To: <20190925143248.10000-13-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:23:38 +0000
Message-ID: <CACPK8XeYQtzQbxvRjjdWdTtGfOfL3uUxE+R9bMaAqm_Xxxgx8w@mail.gmail.com>
Subject: Re: [PATCH v2 12/23] aspeed/smc: Introduce segment operations
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.194
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
X-TUID: 0AJ8Z3BEmQnI

On Wed, 25 Sep 2019 at 14:34, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> AST2600 will use a different encoding for the addresses defined in the
> Segment Register.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Joel Stanley <joel@jms.id.au>
