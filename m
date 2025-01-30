Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp51231njl;
        Wed, 29 Jan 2025 19:22:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEv1rf0ozFOP01Gqn3LpWwWKhlgA4rUdLWZ4eOpeI051QGty8qpZF98YBB7x67oBC190AePL0AfTnaTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEvquUg4XPSRZNok6PT5k7XbxarmIiCab25UkCP0bLdW93QOBHx+oqI11DMLiQ9lgjS2k6h
X-Received: by 2002:a05:6122:2385:b0:518:859e:87c0 with SMTP id 71dfb90a1353d-51e9e5163c5mr6390505e0c.9.1738207359228;
        Wed, 29 Jan 2025 19:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738207359; cv=none;
        d=google.com; s=arc-20240605;
        b=NfTG7GfTeBBILF5prz8W73EDncUVnLMlEgf5CzlElEZobCM2KQZdNu8K01Up13AzKJ
         ZlphlnHPaeXcdd2NGiE9vdHHzZPsdpYlQjh4ZNYQQ/CheiVRUnzMVHkZPn9FZiBQZncl
         sc9YOPcSmUgWnUXE4AY2GZBDbGT/JbX0STx/2cGzzM6LUcEUkcueC6JKo9F79ElBWrQz
         /QsIHcRjO+J7ACtEwn4E16q5z1X9tTppI8cB+Y0hWAOyCXbbBfAc8931h+djSeGGS02L
         0mZ0+F/MpQ9ZqUB2PNcrjBGXxY7EhEeVeIzvCyL9fSH6M/eV/Coz5oiuZ3ca9bbR9wGW
         24/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=JRnk1Jy3uF8oUUdYOGtwQqaTUM7N9ifDICdlGehOZaA=;
        fh=CMqv2q8catk2Ge9/uBOv2R7SzhK0VUzoJXqtAEPmy+Y=;
        b=lyf34TTWAyYGhZMNL/gC4EdccOcN74QvZk8xV6egkJ3AogLKRRMDXLXNmUe9d1nkn1
         IN2NYGAOpGBdpt3LEgny3iIf2Sow0F7CxtECOccHSm1BSm+kmrg/v23yabLDbBAeJrxY
         ynY2T4QDrw/nyQlGjGtraKrVyj6bY37wGEk9be97BbtHNs9Nk0mYqv+kF/h3EDhDbfio
         N2bGDd4tnSb8fPehKI2llt+P798GICtoUCQFZUtBQkj6CFa7Jt+NTpy/uC+ry48tHShf
         fetNCMeL5sSXWxJnEDLopIn6jJ7s4sfe2j0k5rOM9sEFC6Mc/hPYx+L58abN7fzJOBoD
         U69w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=jFh12HKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51eb1bf368esi178553e0c.28.2025.01.29.19.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 19:22:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=jFh12HKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdL8H-0005ti-GC; Wed, 29 Jan 2025 22:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdL8F-0005tW-Ub; Wed, 29 Jan 2025 22:22:19 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdL8D-0007Pg-33; Wed, 29 Jan 2025 22:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738207331;
 bh=JRnk1Jy3uF8oUUdYOGtwQqaTUM7N9ifDICdlGehOZaA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=jFh12HKMoYjn3xPtP4sVfFqHgAy0PFX9VCyhH2PnZmBRss23zDQEs1SI/7reZF6Fw
 kak2vl/Wzh9opMSuG9rpFGMuH/eDI1Qshd4p6JWg5KtFox0N7DB0EUqZOwnkSQHmJv
 LRXo1yWuRMQkkde3a4gtpquo8Vz/TNbCFkhqSSUXTa0OQ/OP+bDUjn5TRVSBHUIjyV
 wh6bT1DQz8fKVFvDmVVWuSYqHz0ITBV6spVXuYBeE9owH1t0YOWVBOtPZnlZz9mZBu
 ENVTcsEA4eeU7MIdq+oop+Vf4t5vAzM33HEsb56lBfETpFvLjLx5+1NCPkbriAaeD7
 jeOeVDT0RiW1Q==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3C70E73803;
 Thu, 30 Jan 2025 11:22:10 +0800 (AWST)
Message-ID: <d9575d2cec122e41e11d84667f4d7cc63848b3ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 01/18] hw/intc/aspeed: Rename INTC to INTC0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel
 Stanley <joel@jms.id.au>,  "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 13:52:09 +1030
In-Reply-To: <2d9247ab-34dd-4dde-a9c0-c04c2d8a1a18@kaod.org>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-2-jamin_lin@aspeedtech.com>
 <2d9247ab-34dd-4dde-a9c0-c04c2d8a1a18@kaod.org>
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
X-TUID: 7WoG4vnQtBFp

On Wed, 2025-01-29 at 18:03 +0100, C=C3=A9dric Le Goater wrote:
> On 1/21/25 08:04, Jamin Lin wrote:
> > The design of the INTC has significant changes in the AST2700 A1.
> > In the
> > AST2700 A0, there was one INTC controller, whereas in the AST2700
> > A1,
> > there were two INTC controllers: INTC0 (CPU DIE) and INTC1 (I/O
> > DIE).
> >=20
> > The previous INTC model only supported the AST2700 A0 and was
> > implemented for
> > the INTC0 (CPU DIE). To support the future INTC1 (I/O DIE) model,
> > rename INTC
> > to INTC0.
>=20
>=20
> Why not introduce definitions with _INTC_IO_ and leave alone the
> current
> instead ? Do we expect to have more than 2 INTC controllers ?
>=20

There was similar discussion on the devicetree bindings for the SCU a
while back:

https://lore.kernel.org/all/94efc2d4ff280a112b869124fc9d7e35ac031596.camel@=
codeconstruct.com.au/

Ryan didn't like deviating from their internal documentation :(

Andrew
