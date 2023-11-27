Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp676927ejt;
        Sun, 26 Nov 2023 17:02:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3s9BjddoQYsrZ9AcUR3H5JxYG2AeVWu+zNnCHCpfMZGgWo67CHXYKESALFyAUX0wDVyIR
X-Received: by 2002:a05:622a:4e:b0:415:138e:d858 with SMTP id y14-20020a05622a004e00b00415138ed858mr11310602qtw.60.1701046923392;
        Sun, 26 Nov 2023 17:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701046923; cv=none;
        d=google.com; s=arc-20160816;
        b=g16vpFoFimvQyVkMheoqMYNLKQ7/t02tmysZ+b/AijfZjvKX7cOB3Pc5wHTJauMMvp
         MsuP39gRRGR7i1smtHFdKoP3ctd1CBjBxq3LYgVIs55xZgUs51yq58RtumuUTZauoCLs
         af0i3qAie5q8jIxfBERagUvwnOWBCHUf3aZrVmtmVxiA9rMOPiv/dZ72UaCzaIPrIlV5
         PMv/+G3WRJc5JNMcOOKBqNq2In/8RxTKBFZ0KgDjZwhunxrgs30IBulcMdS5V+y6raHf
         cwSPbp70nvTx4FkEmWwdGF1Non/gTYp7HDGCrzel7mFS4ThUORkp73qBamhhwF6CsLxy
         bbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=gyXYbD+jBNyHAa8R6BFK0wYQc5cwzpYcgzXJaYq4x98=;
        fh=aQSPtT8wYfhwt8MA/40FABP+dqoC9BRcnI0vZlsbtNw=;
        b=JHz7NZ67p+fRkFvIhqubF4AlNtk3XJsky+s1XCslVLRAtkFsHk0uoGdOLgPuJ3V951
         niJeIHR5IP9rfUzI5yMV+IA+FyiIJF3hLiOnzvGFUEJ4uyg6ZQ3RNjahGf3AzwKwabb1
         c7+31lyaNQbcMBOmjxKSqLKGQpCEOOHiL+VR2oOwkSKMTnitXRCIHI2XNd4Rq0b7xpN+
         y1za8hXedpwiCaS00PdXhdMgkJYfNjCHaQOIzp7D8aBc0T5CFLTWP6lZM0ecmOQy9wbd
         lteoJvwoS76NyGG9VKvO++YWZQtxZovHMWTWv9/Ob4V4lSJ5tdscsSmja7j+TwjEfvzQ
         5jaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=TE3nyeys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05622a000c00b004181004e2f4si7911879qtw.729.2023.11.26.17.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 17:02:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=TE3nyeys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7Q02-0008Rs-EX; Sun, 26 Nov 2023 20:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1r7Q01-0008RH-7I; Sun, 26 Nov 2023 20:01:21 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1r7Pzy-0006Oz-1S; Sun, 26 Nov 2023 20:01:20 -0500
Received: from [192.168.68.112] (203-57-215-234.dyn.iinet.net.au
 [203.57.215.234])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1FC42012A;
 Mon, 27 Nov 2023 09:01:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1701046868;
 bh=gyXYbD+jBNyHAa8R6BFK0wYQc5cwzpYcgzXJaYq4x98=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=TE3nyeyssTkHYsI6HNVJmk3ZHWKqVWfMfFKPrCWw/TMGuYvoFnKK+ntONe1XTDFD8
 BRPZn3W/lWFVNy3csGtPLbRE2ax2FDdSLKtvbQwva3M4NBiFCSF3CWsgaRweF9WSJP
 vEoghqraiq6/UTU7BdJt+R4O0O1HUlRTrbqZl54N7GcbwPqQirQrOTcCkRqxq/HnMh
 v+8RB6ZO5TesXJIoB6SuWyiHhE8F1gzZr1oaWRNhERIPriRyqwZ1wIMrpOCtBcpmPO
 GlmwsDw839BNZkbIM25X2/AK4tXc1smOVgJrrFo+zMwD1A1V4n2TaUYhHmr/RdwdD8
 uUmBxeaV7Z8dw==
Message-ID: <5aa705e249de5b14797ba0facbe813fa4ca1c07a.camel@codeconstruct.com.au>
Subject: Re: [PATCH-for-9.0 20/25] hw: Simplify memory_region_init_ram() calls
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,  qemu-ppc@nongnu.org,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,  Peter Xu
 <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>, Jean-Christophe Dubois
 <jcd@tribudubois.net>, =?ISO-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>
Date: Mon, 27 Nov 2023 11:31:05 +1030
In-Reply-To: <20231120213301.24349-21-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-21-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gpjb7bcALpUZ

On Mon, 2023-11-20 at 22:32 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Mechanical change using the following coccinelle script:
>=20
> @@
> expression mr, owner, arg3, arg4, errp;
> @@
> -   memory_region_init_ram(mr, owner, arg3, arg4, &errp);
>     if (
> -       errp
> +       !memory_region_init_ram(mr, owner, arg3, arg4, &errp)
>     ) {
>         ...
>         return;
>     }
>=20
> and removing the local Error variable.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast2400.c | 6 ++----
>  hw/arm/aspeed_ast2600.c | 6 ++----

For my own benefit it looks like the motivating thread for this series
is:=C2=A0

https://lore.kernel.org/qemu-devel/936e1ac4-cef8-08b4-c688-e5b1e057208b@lin=
aro.org/

Anyway,

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed
