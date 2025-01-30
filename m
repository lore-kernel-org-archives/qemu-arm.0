Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp61473njl;
        Wed, 29 Jan 2025 19:56:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJyoIY659lrzctMt2Xm1yv6V5BaMS51UOfpniC55cRVh8b2cyVQj1uX7PdtbMDBJwHpATDyMVn+xh2SA==@linaro.org
X-Google-Smtp-Source: AGHT+IHQYpjiUEJ4SLdCwTmG+n3AhZXiwIEORxXtB60hSRcFwL3Z/oeMPjA2oaah1AP4n37mxrTr
X-Received: by 2002:a05:620a:6192:b0:7b1:19f4:c6e0 with SMTP id af79cd13be357-7bffcda8806mr929557685a.51.1738209359999;
        Wed, 29 Jan 2025 19:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738209359; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPnwRO84d2AD7PMWezJKnxugvKZ5uSIg0J7vqLdI/sNBIK2r6MobVaMpmo0VO5LCm2
         xqE5okBbgbqRAfGlrwiii311fdh6AfRNcA5a70DfZkTteHEQu8hlOT71yhA/FdxD6fvC
         9yA1MPrtYU/Ou3wggRJFzDekMzI53BduVtOcXVQdSCFfUD9HQi0UQlPvJV04AUPD6BF2
         i/chHoFh+yPoc6PbjViZc44+JN+WIMCveRmnhsVbOuqkp6J/9wjrcCwWD1hHGNb3fFi6
         nGVDNAiMU0rk2kCHDNI8P42kmNWq+8vBl127a7d5AJaXfkBuefnSxshIDODtr3I3hGsj
         brbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=nOHN9Z0F4GNxVQw4v8D6NOSe8J4E90wDeME4X8ilZGU=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=lat+Xt77hteriQNVDB64jfl6cOsHA7IAoLejdHRhc00V8r7Mk3n6uj64OVA1nrknmP
         oBpklN1TCQoDbOioT0QmuVqP0z1fVOd65c8+o0MzbZGQ0KXlBhZgmGgbKIA+nTHBt8mE
         9TAd9NrjUCCALpxmb3rPe3we3J+aWgjIY5pduVWOJQGjgDyadmAqa3s7AWU67xOmUCcs
         xxy3FgabOUQ+r5jNrAlZ+d6oPHrDrpJ/BRgaRfa2+5q7r+6N3vus4K9J3JwiKzy3aNl0
         s1AfxHzjAm5lUPttQ5rYjM7qylOLPVj+ja/EEw5nUCGWQXwynXhdglsQ/v5DQPkFcWZB
         kyiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=E8pQJVS7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8c0ca6si100656685a.54.2025.01.29.19.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 19:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=E8pQJVS7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdLeL-0001rN-6M; Wed, 29 Jan 2025 22:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLeI-0001qc-Vw; Wed, 29 Jan 2025 22:55:27 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLeG-0002q1-4u; Wed, 29 Jan 2025 22:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738209318;
 bh=nOHN9Z0F4GNxVQw4v8D6NOSe8J4E90wDeME4X8ilZGU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=E8pQJVS7vbd5kesTHt64ZieFhYy1dT6cO46xgUnKCsiCejRbu4gJ2jE73b116PGI4
 g0a94pVDTBqUOzJqqSnVmFoxj+i59ndEXQvmlrw5gED9ZIKsth10JvRcVsIMlj+Dcj
 rXlEionVCza+gt7dcxupMhgJfOh1C8ppWBlGbdQmyI16Co4+6U9Qg20vGSPg85QQKK
 g6FkfV1jaJPwnRz18r99Fk2qQaioawOzj14fpgeCaR814/6mbSwwAGbV8yftzMVl+D
 mh906AKu8yDLBjDE7JxnB+MifbRNdN5KWTPCKBFp9qSZaXj3GD0yBzThqbXgK62aNQ
 nYL9OfmEIRjrg==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2D15F7383B;
 Thu, 30 Jan 2025 11:55:17 +0800 (AWST)
Message-ID: <a853d2ae4bc50703fe193406f9e4008d18110287.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 06/18] hw/intc/aspeed: Introduce AspeedINTCIRQ
 structure to save the irq index and register address
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 14:25:16 +1030
In-Reply-To: <20250121070424.2465942-7-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-7-jamin_lin@aspeedtech.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lMkn3+z90nBY

On Tue, 2025-01-21 at 15:04 +0800, Jamin Lin wrote:
> The INTC0 controller supports GICINT128 to GICINT136, mapping 1:1 to
> input and
> output IRQs 0 to 8. Previously, the formula "address & 0x0f00" was
> used to
> derive the IRQ index numbers.
>=20
> However, the INTC0 controller also supports GICINT192_201, mapping 1
> input IRQ
> pin to 10 output IRQ pins. The pin numbers for input and output are
> different.
> Additionally, the INTC0 controller supports routing to GIC, SSP, TSP,
> and
> BOOTMCU, making it difficult to use a formula to determine the index
> number of
> INTC0 model supported input and output IRQs.

It's also a bit difficult to follow, even having looked at the
datasheet. Do you mind adding some documentation with discussion and a
diagram of the components involved and the potential interrupt paths?
Further, it would be great if the documentation also described the
motivation for the interrupt chaining involving involving INT128-159,
INTM*, and GICINT192_201, GICINT208 and GICINT224. Clearly it's a
thing, but, why?


Andrew
