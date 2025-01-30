Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp54393njl;
        Wed, 29 Jan 2025 19:32:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULp0gQ+tL4BWqPUmRU3DRFX4pQDIeeruG2FnT5Wl77I/N63kJ8ASnkUj2dIn6sPz2bAH3CiAIaUeI/7w==@linaro.org
X-Google-Smtp-Source: AGHT+IGQQvyuhex3RyoAN0gBCs9ZwSdSrfNR0SB7ln4H2fnjR7lBZRenBzmmTGUZ2W5TK3/K51GP
X-Received: by 2002:ac8:5d43:0:b0:467:6692:c18b with SMTP id d75a77b69052e-46fd0a7f81bmr98284671cf.5.1738207955418;
        Wed, 29 Jan 2025 19:32:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738207955; cv=none;
        d=google.com; s=arc-20240605;
        b=T2RzhdvD9LbazsyaluiCpWKm0IXTFSSjoJmfaM5iHIk1Y2aGbVziQe0ifDZLamyNoS
         jnPKBUaas6du6W9ojXZ2DU9jTVY7l044oXUliYgG8FuiaZjn36XzjgFkSSksMVRYGc2+
         Zw/42ws/vBnsW9b8W8hQcbSahtuq9jy9gHV9G9Yez3RPE5UH3HCVHT+B+fbRscs7Fdn3
         5DiHn9mdLtt1MXmAxMMEJ85xRqpCsoPmkddwpeHyRIs6qtSzNhynRv1wCiQgOnU0pwl2
         FJ08ftJbB3izvVG9Bu2/Kxgd8n949BpW+mY0tlf6uTmCmXCQ1IRteObgYze3AG3DkFz4
         Imvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=kTQxGgo7ou40qvmsBfu1dW38+QtlfEuOajgtgwxc62g=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=e7Z/0nHnhaFS/jmgy0QGpOtF6pt5T7s/KjLXWbFhojPhz1yPkDJ/+Wh4AY+0nUxUet
         V+0CXz9bgfuSpeCfHY50RUhMuMu4CJ83hNFLakN1/hK2TeH2ctKpvJkyMo/4yvY3Tcu0
         S5MM4Ay0EAKssAYXip7kc4IoiE4sjFurhPlyUp+tpqI48snpUlH6nLMY7VMkUuKbI898
         vbd7pWy0X0dUJ0/4DwJRvvCkLfLkqPJMQLM/DAa4bhLyjvGMHrwcDYM+DPvnW2nDP8L+
         pj6wiUeuhWjq+6U16Lh56/VIvwTOlDZkGkbugt0BsQH+gIz07VPyZwDcKABGUJu719zE
         DTOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=R8AOua8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d21a6si9484511cf.426.2025.01.29.19.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 19:32:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=R8AOua8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdLHu-0007jw-BE; Wed, 29 Jan 2025 22:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLHs-0007je-LF; Wed, 29 Jan 2025 22:32:16 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLHp-0008Ts-Pc; Wed, 29 Jan 2025 22:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738207931;
 bh=kTQxGgo7ou40qvmsBfu1dW38+QtlfEuOajgtgwxc62g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=R8AOua8aTUXZ2ypJN5YlCbkv/gJK/tp9YFn5aDyEGLNiLLJLQC53SnjrVO/wwoKVA
 eBdqU6OVCRO7kJ2GxgSxTk2xzJjKtNtSVI1YeiF38iwP4zPlz0r0l2CUrMFiJF2mjs
 tfbNsw64yR1QAeQ5dHliPwzQdpaFATHsIebV58YSgSX+Jz6Ij4YCwV1Ib6T8tR3iWH
 V8kqdDqhOeyU4sBiKiINuCso7LP+CYEwJs9x2yBc00Cy/JN6sAKra+QByNobAgUm/z
 93trVvPlIH9ZESSTvfWM0CwWN+0IJNZGonGOBbr4pwMC39e9uqrvHlZ2d6KgJkSuIY
 bmY4xO9pCh6XA==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B7E873803;
 Thu, 30 Jan 2025 11:32:10 +0800 (AWST)
Message-ID: <ee2d8a35f9fc890091c789cad452e6e0aa915cdf.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 02/18] hw/intc/aspeed: Support different memory
 region ops
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 14:02:09 +1030
In-Reply-To: <20250121070424.2465942-3-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-3-jamin_lin@aspeedtech.com>
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
X-TUID: BBKi0Hyd7ktw

On Tue, 2025-01-21 at 15:04 +0800, Jamin Lin wrote:
> The previous implementation set the "aspeed_intc_ops" struct,
> containing read
> and write callbacks, to be used when I/O is performed on the INTC
> region.
> Both "aspeed_intc_read" and "aspeed_intc_write" callback functions
> were used
> for INTC0 (CPU DIE).
>=20
> To support the INTC1 (I/O DIE) model, introduces a new "reg_ops"
> class
> attribute. This allows setting different memory region operations to
> support
> different INTC models.

Is there a reason not to make it a different type altogether? I'm not
sure I like the idea of playing tricks with the memory ops. The timer
model does something similar, but I was toying with the idea of
removing that part of its implementation...

Andrew
