Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1853913njf;
        Mon, 28 Oct 2024 17:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUt43wvURSbaURMh/pKKrbOTBYnU4o+Z/Npv7F+Pp0b6UjKgEqNc9MhFwjKjBNXXdoaZUIHgWJ5vckwNg==@linaro.org
X-Google-Smtp-Source: AGHT+IH9YjEZsyxewJau0zbg0JmelXAnxaexlvtgbF1VuaV44VHSfJ3F9euHTFtwSvhHPsRimnwl
X-Received: by 2002:ac8:7e87:0:b0:460:9318:e4c2 with SMTP id d75a77b69052e-4613c015355mr168685691cf.16.1730162654233;
        Mon, 28 Oct 2024 17:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730162654; cv=none;
        d=google.com; s=arc-20240605;
        b=VeH4EReSDxKPK8O4XsMkn+Uarvv0JrgqTdINfMXIjtC4lH4H+ADe2JE1lOfWrNAFr3
         v02USQmqua5C/n42Z+CRJZNXWLuBDmYsNzp7NIG9Q40mFNIjT9lJXkMQQ4N/78KKFZ+P
         gnsRmbCEK0vCIsdokVll+mODgmWaTmkgid0LsqjDMP5fJ3W6+8Y/FQ9AEB392dVQtNsQ
         RAZJfHwUIJbHTFd4It2uh37UsSZ5RzSD6NH70pwiaVlOW0KGiUx+ELvPvG+k35qScXKi
         AI6PpcWuVd0dH2czGGsF0Rqv0mhb77Tq+04jZPYkqAtLAxyG7oymlvXq2+htFOkhM8gn
         7r6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=RfNJOEYfRA4SVGr5drt27pkJ4FQ56aEDZ3ObEOUh6dU=;
        fh=NAVYy30vlRiaS5fUDLBZ7By08vh0LhXO0mmyhCY0w9E=;
        b=CnAx75eZhXqzRo6qVlQAJ5qIENumTH+FazanWA71KKoJxHVje5xVJRc0z8FnhfnX/A
         uNjEBTNgaIdnQYWyQz4Xb+OpnzMyO1fN1Dmk0gjZuy2xT+fQaluT5XUAATZ8ZdoNzF8k
         IaNXL9ES2zIklmOTd8nc+ByPMOMHUuLjekFTItNJ1IlWJnNAAs18vk+vbAzhR5Dd4OKY
         YsB7CiTK5dkZHPFC3DteeNLTPIg90cRBrIG6uL7RHG51DNJyZCOc/xkJDrZph2do0GL2
         hGPh0/hTXkxqi1wJPwqj7U5Y6u445FbZhXITRkKKGSwaSJqUsXrNmOeXxUfdfRMiFk/4
         ctVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=j9qx7NQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46132115d0bsi105320461cf.78.2024.10.28.17.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 17:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=j9qx7NQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5aKi-0004eL-NQ; Mon, 28 Oct 2024 20:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1t5aKW-0004dY-O7; Mon, 28 Oct 2024 20:43:31 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1t5aKU-0002Vs-KH; Mon, 28 Oct 2024 20:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1730162595;
 bh=RfNJOEYfRA4SVGr5drt27pkJ4FQ56aEDZ3ObEOUh6dU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=j9qx7NQ8/B/OPj7qQkXR1qqZiNKF8wjBf3YmS6Wo6cG4EfasDeNT8IqyI4nZbOm9L
 Wt6oglHpmPs8J16tx4LSGb7cl2w5EdqAhQDkWnJ1NdEvprbxaXdwUvGdFWQjbonHOv
 +OHhP58eoyuD0xOGxzs94RtXSU+u0CoSvVdS1/HVXMusHlH4PINVDMaCfWDPAgBmhq
 k0F3stao4QtaBd6gBfKK/pc5DamUWgVAWixbVQPb+UiDDWXLr7fvscxnfILxkoFS7u
 JmFRz57p80r0tajqQz4No7TFxDg8fNKDxugbA3bQ5sFg5KUOo96xgVkgbQey2xXhof
 8RwIKaBB/w44w==
Received: from [192.168.68.112]
 (ppp118-210-190-243.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.190.243])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B34E167728;
 Tue, 29 Oct 2024 08:43:14 +0800 (AWST)
Message-ID: <df317f3f9f70340669f032377328765b81b3e493.camel@codeconstruct.com.au>
Subject: Re: [PATCH] hw/arm: enable at24c with aspeed
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Leis <venture@google.com>, clg@kaod.org,
 peter.maydell@linaro.org,  steven_lee@aspeedtech.com, Troy Lee
 <leetroy@gmail.com>,  jamin_lin@aspeedtech.com, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 29 Oct 2024 11:13:14 +1030
In-Reply-To: <20241028181420.1438938-1-venture@google.com>
References: <20241028181420.1438938-1-venture@google.com>
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
X-TUID: jzMrrgvw8ca6

On Mon, 2024-10-28 at 18:14 +0000, Patrick Leis wrote:
> Enable AT24C with ASPEED in the KConfig because the boards build this
> device.
>=20
> Signed-off-by: Patrick Leis <venture@google.com>

I was wondering how we haven't hit problems before now. Poking around
with scripts/minikconf.py for an arm-softmmu build we get:

   # config AT24C depends on I2C
   # select AT24C if NPCM7XX
   # =3D> AT24C is now True
   # config AT24C default y if E500
   # config AT24C default n

Seems reasonable that the Aspeed models should select it themselves
given they depend on the symbols.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
