Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp879400ejb;
        Thu, 26 Oct 2023 23:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs2CpySkg+7jG1Hxx7p2ageKuI/96jyrJ0AzecFC5wyQfemUGsfOqYXvxMD+/Dzd1JPHQ2
X-Received: by 2002:a25:db8f:0:b0:d78:3b67:ef3 with SMTP id g137-20020a25db8f000000b00d783b670ef3mr3393579ybf.12.1698386943039;
        Thu, 26 Oct 2023 23:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698386943; cv=none;
        d=google.com; s=arc-20160816;
        b=TpPq3mD04zqhgWrZXCB8aOxq49fozuApbhqP8xmxqTSOnDaHGr1ZhQG3il5jlE1vnP
         rkT9XxCS1goA4wU7lGs9cLpotnqJ0TNaI4yKAYe0EXEigPiXn+aUMoYLvebIIfKPg/B1
         fjgYDd8Pz5j2y8LVbXR0Ur96psM8ZLR6Vtcfu1kZL0EbbgeD2rRMRgWcK4L2DkZUul1Y
         eWbQrwvr5MaJHQnFJwz2dxsRZmvcPUs9eLepv8EzbB4kPowZCfPXglmuc66ErSfUGSj9
         ihj4mjl27JQqmBUMEsb7WamtGw4GgmNllKQYMAYz1LoY+wbjzT8uLVQjM0Oj+/NrogRs
         P+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=g16CvfS0OYfewcGbYBDyxJR0tshXGS+QzvGp+YH9ZjE=;
        fh=sim2U86zRlLRwV3n1fh1353Mj/dJtAIDiQYoryW9CS8=;
        b=bam2gOMrF+lPTJALdtCuIbZidz7rrUUAo3JWAiKylURthDzw3G6aWhMFE5GkJuOvyR
         rZujrPnTWpMmdt/0HEqvyKCEHAyvGoAQe+reAjahYFxSvY6KjsmV/TnyBX7eXaDj5arc
         DTcK/2ZBPe0VhUu48UbmvbhN6tVR6jQ0x/56LIElxk0BDgEb+Jft/6hbdNjg+Za3sxC6
         DJ4WPZxrg87IJhpxV++izuoYre3VHUvh9PoXiJa7JgvsjGDzJ5efaLnCks11p2w291Iy
         azTx3bIyMsDSrWZR87Hkw6Mqx/4VK3OGOn0k5O6pWfUBDpp6Zq6yMV/u/jkozoRsMbmH
         srGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b="i3Ts+pL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r65-20020a254444000000b00d9bc6346797si1538329yba.692.2023.10.26.23.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 23:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b="i3Ts+pL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwG1j-00055x-S0; Fri, 27 Oct 2023 02:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qwG1j-00055j-CX; Fri, 27 Oct 2023 02:08:59 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qwG1g-0001Ni-Ik; Fri, 27 Oct 2023 02:08:59 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F052A2017B;
 Fri, 27 Oct 2023 14:08:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1698386929;
 bh=g16CvfS0OYfewcGbYBDyxJR0tshXGS+QzvGp+YH9ZjE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=i3Ts+pL/d1TFjlNz9Y1HYhlDBJvHKIcd6HfOTEOBKuFc60r3Y9iolHzXMx9cB/h34
 QUDf8LQc2zxOhheECJ5Z1vx6K8XxWBdz0o8MqgYj2r/nGNgCG5QRD0H35+YXCAsXaE
 GRT5lt/1xErBFN/faOLwET9AsY0d8m770/dEEti6Cz7/qlTKdrXYmOrGMgQgW3zXVj
 29/J/UpyrA6/wJaoDyaUpWlH8e481xMUwL7W8ssZxoyw0Q1CSPaD19WAWDtEezhNlt
 k0jhbhAnX9Zx6edBWMslfWqNuTH/owgz0yJdtNmFWNZInKPyb92baX+w8ZXzFMbcoW
 IYDVihORiM7JA==
Message-ID: <e12e01428066976c2e02af78cb380f808b12865a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] misc/pca9552: Let external devices set pca9552
 inputs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au, philmd@linaro.org
Date: Fri, 27 Oct 2023 16:38:48 +1030
In-Reply-To: <20231024181144.4045056-3-milesg@linux.vnet.ibm.com>
References: <20231024181144.4045056-1-milesg@linux.vnet.ibm.com>
 <20231024181144.4045056-3-milesg@linux.vnet.ibm.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PC11BECAyc2y

On Tue, 2023-10-24 at 13:11 -0500, Glenn Miles wrote:
> Allow external devices to drive pca9552 input pins by adding
> input GPIO's to the model.  This allows a device to connect
> its output GPIO's to the pca9552 input GPIO's.
>=20
> In order for an external device to set the state of a pca9552
> pin, the pin must first be configured for high impedance (LED
> is off).  If the pca9552 pin is configured to drive the pin low
> (LED is on), then external input will be ignored.
>=20
> Here is a table describing the logical state of a pca9552 pin
> given the state being driven by the pca9552 and an external device:
>=20
>                    PCA9552
>                    Configured
>                    State
>=20
>                   | Hi-Z | Low |
>             ------+------+-----+
>   External   Hi-Z |  Hi  | Low |
>   Device    ------+------+-----+
>   State      Low  |  Low | Low |
>             ------+------+-----+
>=20
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
