Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp73205njl;
        Wed, 29 Jan 2025 20:32:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdLh9fSwIm4HLetROi0Kay4eo1hZnrvAZyboAlCuL2VlgthZcjZjNk9ENVu11gEM0sesG8qACYzsDxqw==@linaro.org
X-Google-Smtp-Source: AGHT+IFpVZcmroVJx9Nwi5rukANTyraAb9xahRrwZmrgTOqc4Agct65+b7XJoCHXjNPIA0PcpQ43
X-Received: by 2002:ac8:574d:0:b0:46f:c222:a5c8 with SMTP id d75a77b69052e-46fd0ae2183mr109549441cf.41.1738211563605;
        Wed, 29 Jan 2025 20:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738211563; cv=none;
        d=google.com; s=arc-20240605;
        b=UDhwN3QPEvhoivqDU62PNh93euHR9C8W6cSAIB8Muxt6rd7ff8mJzOWQkRJU6iT/Sv
         3fT3TKV3StxSH4nn2MUOVZvYszJ7tMZnKDlBfgKjprFONhgsGDfNq0R+ah4gEA6wivWR
         XmdG55y9xUQzpwb5eVj/+JaK1tPr1sNFdfwPtct3VF93Uu9SGzjgD10imVcOO0OBJ5vs
         9+BPcklAh4/XgZOyw3NVAAdc+jTMUNRvvB1jh7v3jbFPy2mFeV5JvgrLx7l7m0xf8d7b
         n8zRSSHNChfDM2uYsWFXp/KsjbkIxb6s6HwJxXsFhOL5w6F25pgXJE4I+2ElwGyA7yig
         AxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=q3sizWaYByj5QvcJfTrqw4nboFnX1qsPVfisTxY2FT4=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=eaDmJXSMemMFqjHXXFFeSKhGbNnjPGe/EaL7vWis0h4rEzozVu+NFGcs0m7EOiV9uC
         0BI/kR0mqpkqnkzrXs2Cui4vAqGL6+jla72CVwTLLjhjMrI4yaYOD7BdY/W2wdGUotep
         8AiMa9VWbvTkW4vw34/LF1vUsDfQCcr16+cYtGen+/9qvsi6OWFeSsaXFdsLfm1bGNH3
         yx94yvNj1qy6IZ32mSxJXN6kVxvb20xBTSoH6CKFJIArU6cI8Rclm0RrWzT1vyJBD7Z9
         kQlmIZnfJHZRRos5Bt0Jj5aUxO4z9GV/yyc6bG2rN1ppgrKmQA/uYHWbMe1+ogGAMMMX
         Ywrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Wg23bQL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1ba6dfsi9213621cf.307.2025.01.29.20.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 20:32:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Wg23bQL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdME4-0008PJ-2g; Wed, 29 Jan 2025 23:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdME2-0008OI-Lo; Wed, 29 Jan 2025 23:32:22 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdME1-00074H-1k; Wed, 29 Jan 2025 23:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738211537;
 bh=q3sizWaYByj5QvcJfTrqw4nboFnX1qsPVfisTxY2FT4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Wg23bQL334/FADe3XsNZGIMjPesj75BSVRDwWIt0vu/r8Bgdorx7Y8odJUtrxuyeG
 Jtxw7PKm2Q/RaoPReqIMbihluT9V5MYV5nBv1nTPSzD973b52FUsOhFBhShVzowXu+
 AcRq+mOu4gXNdEiAC6JJf9a9vmzwlO2ikuAzxxHLDIhXylpfgg7Dx661lamYLGa5lx
 iWy9KQhv3Yd8y8CHz54RJkulb2aArS0OMwh9yoMeHfPSRDTlemxbjPHgcJA1eKvkDH
 uB0hXuj5BMb240jKy0ON95l6YMMOUuu1YqiswMWSNzu/NRt66Bzvf0uHcrDkYcmmwY
 nYcf1mo/Ad4uQ==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 995247383B;
 Thu, 30 Jan 2025 12:32:16 +0800 (AWST)
Message-ID: <26ca7f05245eab805d876c08ffef95ca9bc97b14.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 17/18] hw/arm/aspeed_ast27x0: Add HACE support for
 AST2700
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 15:02:16 +1030
In-Reply-To: <20250121070424.2465942-18-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-18-jamin_lin@aspeedtech.com>
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
X-TUID: Sh5Gr0AAcUDN

On Tue, 2025-01-21 at 15:04 +0800, Jamin Lin wrote:
> The HACE controller between AST2600 and AST2700 are almost identical.
> The HACE controller registers base address starts at 0x1207_0000 and
> its alarm interrupt is connected to GICINT4.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
