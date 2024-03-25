Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1009233ejj;
        Mon, 25 Mar 2024 16:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrDbBoo7oxW5vEew3IzO8KVH8oQ8WTAIK0uX5IPXyHKbwk+xyWncL1JbRAKIW7plIiclHPEf3IBO88QW+GgC2QEXxRV1Yx
X-Google-Smtp-Source: AGHT+IHTEavMjkfN0lkCsV4qgMmpAaFqM+e3PWhJrtTYQOK/LOymafa8/UEGs+gzI0zkY444+uXg
X-Received: by 2002:a05:6102:3168:b0:473:2f6b:bcda with SMTP id l8-20020a056102316800b004732f6bbcdamr6675289vsm.15.1711409301777;
        Mon, 25 Mar 2024 16:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711409301; cv=none;
        d=google.com; s=arc-20160816;
        b=GF5qeziyJlHcFl8uL+vBnOV4rqfIJLoM2dSHt8e+oMeUWYHjoz3UBYDfhmrVaTgJmm
         BvwzuVasXo+t2PCnQE6819LDdlEsPOB8n+cxHycA1R2RT6TWaAFoNprgqZV/t6CGnSXz
         Tn9pl8N2GctG0A/6twIVAK0oFysNdA5fIgrq6jpmBmnHoydkKR0CINpyrKX0jma/IAGJ
         a5rFLWsjvbgCEaP1GP9Y+XrrCsWkk6gbGrvY2MX6GC2BWj2ylbYErIJ6Yann2srrBSVi
         N+tf9V+wxyok2CgKOF61ScJubsQR0c58ZR9zP2W6FEHSGsdTtlf8I/DAyQQz0vEU66CH
         hlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=BcSNJsphdXKJA17EZSo1rc+zIEeoWzPM2m9NIw9j4xQ=;
        fh=4B4p/1kHZhLeawybk2gH/kGbgZQ4dIoTN3jYa4Lne24=;
        b=q15cC2PCY4pe1ezMnHx/VcI+3/Q8qYOHKoDdGxwjbqdkRn9zXGpLmJ+PyQvgcTj6sl
         Tn4b/BzfLZI7qITdYOjUvhuct9yuBb/Kt63AipkOU1x+Gya4HVhf/w8WZvNFnw+Y4jtz
         aprTjNHQejQnzQV2ymDdoBp/SWKytCbMUcgRSwilNhhhy22OYdVLgMve1tt6QKYAv9HS
         PP3gFX7wQcETSAs6V22khstscGKWIgqy9zs/qHPh/Li3+Qg9iD+k1cmpOqs9UQtG0X1X
         VDt+bGPLrEkBoaUiNChVb3CSUBUGMAssb75M+Nji7U7ucCz6xqZ/kQtmiT6xf2LMZ3zR
         LTaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=BbQ492aM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020a05620a137800b00789ddb6a45asi6480827qkl.690.2024.03.25.16.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 16:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=BbQ492aM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rotjL-0007XV-Pm; Mon, 25 Mar 2024 19:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1rotjJ-0007XC-9H; Mon, 25 Mar 2024 19:27:49 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1rotjH-0000Cd-21; Mon, 25 Mar 2024 19:27:49 -0400
Received: from [192.168.68.112]
 (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.177.226])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 07C4020154;
 Tue, 26 Mar 2024 07:27:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1711409254;
 bh=BcSNJsphdXKJA17EZSo1rc+zIEeoWzPM2m9NIw9j4xQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=BbQ492aMZDwxl7n9viBnsVhWy0RUBGIfT97kAcGBtKNLaxeDZy6qLxG+Ml2mHk/Fx
 wXEuENgE2qB1EK2Xxtjveleoh13Z6j/IIthMGkibJzOM059pOgfy7MePlX2L8VP3yM
 pFZXDH4PW/G0OstD70HIoHoAuXRKcNZc50JjQFgyoUkvt5gx2aC4yKJjmwX+ZKGqzU
 S9RniEOKqRrHNGqU5BDfMttydE0M+hz/JOvEdVBpxdBGeD9Y4WHRjPvg22oXacc9kp
 NH5UnNtn1M0VQEqtDKMdF+CI+hPfp6t8iTZhuS7Pnybs2WCyKMtOEvx1hJb5L1rd8Q
 38sm1Jbc+WGEw==
Message-ID: <0416990a901f2ca05db92033630a8dd7babe1eaf.camel@codeconstruct.com.au>
Subject: Re: [PATCH] misc/pca955*: Move models under hw/gpio
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Glenn Miles <milesg@linux.vnet.ibm.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 =?ISO-8859-1?Q?Fr=E9d=E9ric?= Barrat <fbarrat@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Date: Tue, 26 Mar 2024 09:57:31 +1030
In-Reply-To: <20240325134833.1484265-1-clg@redhat.com>
References: <20240325134833.1484265-1-clg@redhat.com>
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
X-TUID: aUN2AuDTh82k

On Mon, 2024-03-25 at 14:48 +0100, C=C3=A9dric Le Goater wrote:
> The PCA9552 and PCA9554 devices are both I2C GPIO controllers and the
> PCA9552 also can drive LEDs. Do all the necessary adjustments to move
> the models under hw/gpio.
>=20
> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
