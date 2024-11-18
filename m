Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2916270njc;
        Mon, 18 Nov 2024 14:52:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhoTUBvbcim/lIiHnNEpmSeek2xorffUKyhvDml9biNiEog1DGCyzVrhXjyDnEhmUiZyYjozd+kPgcqA==@linaro.org
X-Google-Smtp-Source: AGHT+IHarDfNkMkxACEvEJ0EqEnWViy0hI6SeEA2WV8YlycyK+N51m/rdoPztTA+75uoB8fBOnLE
X-Received: by 2002:a05:620a:414b:b0:7b1:54bf:7185 with SMTP id af79cd13be357-7b362313799mr2002453185a.38.1731970321064;
        Mon, 18 Nov 2024 14:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731970321; cv=none;
        d=google.com; s=arc-20240605;
        b=e328okGd0Szdo7VFNiDXTGQK6md9APDgHrwEuCpdQWbl515Uv1F4lcPSpGzwfZCZNa
         Lud97gJQbSl7GdHxwLd1nX3NRfezxFeguVZCdf8bV1g/o9JcXADFZVvjLKFerBsaKxlF
         OPMgDJvs5bs3RVjQzcuMJAwvQ6Orx+FtFsuwYemZyfU/Wqya8+cqmaJZ+Tu6m3uaQS7T
         3tKYB16fyCA7gop1fRWqBE32VL2b3PKzcA0ze0/lM2hFIm3tASeea0CqrQC+ik/JCPgY
         6ALzRzl/M1oaS0IukaT9lF4YfNbZOYt9UqdB9A/IPtfL2K3qboMmKhYFAJ0s/GaDSIs8
         DHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=Q1Nh8Exk+mU0FCsSon3uK1rKupXr3I67HHPMK3uXzBs=;
        fh=skAjISkoRy6I33SMz5YUUWltz4eowD97yoXgkQFiN5U=;
        b=Sj4lczfJpfJ+mKS0+FkAZr7tMu+6Nawuq3DS0jD3va+OowezfesmYcaSLJh74ea5Fm
         1+fMckTRiBptpDHIMa6rSY3yLn6auGr1PlxrFK9mKFFKkl0+hiZT+LBuQaDZJ1JMv4yK
         1ozbLAIMJ70Qoq29adLFkSiDPlC32zwDxjLDdgh0fcW6lQ/LSLWuFIY/7TGizZtMZBo5
         1Xvy9D7+mF3CZtwWFWhuM7fboil2tQoDXwHs7BIoHgaCd7L3tftCLtTLYr+BKI1j3P+Q
         XGPGuo6JYHd8tZBAMYLfsfgiYj442UC2JTnCgTYtzY20fXn9WN6tt0OmfTe/29AP88J2
         +r5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=nSuIAgT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b37a84a201si83878885a.165.2024.11.18.14.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 14:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=nSuIAgT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDAac-00023s-Dw; Mon, 18 Nov 2024 17:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tDAaZ-00023W-S1; Mon, 18 Nov 2024 17:51:24 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tDAaX-0002NJ-EA; Mon, 18 Nov 2024 17:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1731970269;
 bh=Q1Nh8Exk+mU0FCsSon3uK1rKupXr3I67HHPMK3uXzBs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=nSuIAgT64zkep7vVdGoCNED9yd9E9iSYjEnGRx4JPy2qM9ig4TjNkE1IKVx23OHu8
 DZHLed7gf1wyjFUG0OzVPrwsbhYpT5xzkbYrfqs/gAV16SUM9uIYuhm7+cTmlfAhnG
 uCzTqWxoOMxS16odSjiL1u7CK9hS/yJJtOUd9IgoCPfPk0YiiQTHA6LyA/9Su4BwOH
 fjouxn/5yCd4NUPjOGPh97IZmH+RsLa3xiP4F5YV1W9MMwlWB1Z84AVVWZ7xB1UoVV
 BrnDEP0SyosokOOEUlJ1YCNH/Jg1sq91ArXe8VvD99WfD3EBQ7V2T1Odio6Rr7UdDI
 DmwRN7TpfE4GA==
Received: from [192.168.68.112]
 (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F3BDA68D9B;
 Tue, 19 Nov 2024 06:51:06 +0800 (AWST)
Message-ID: <dd665bf4cc0ce4e5e9af28149928b5e2650f6d56.camel@codeconstruct.com.au>
Subject: Re: [PATCH] docs: aspeed: Reorganize the "Boot options" section
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,  Steven Lee <steven_lee@aspeedtech.com>, Troy
 Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,  Joel
 Stanley <joel@jms.id.au>, Jan =?ISO-8859-1?Q?L=FCbbe?=
 <jlu@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>
Date: Tue, 19 Nov 2024 09:21:06 +1030
In-Reply-To: <20241118090648.187720-1-clg@redhat.com>
References: <20241118090648.187720-1-clg@redhat.com>
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: kILxgTkAX+++

On Mon, 2024-11-18 at 10:06 +0100, C=C3=A9dric Le Goater wrote:
> Add subsubsections for possible boot methods and introduce a new
> section on eMMC boot support for the ast2600-evb and rainier-emmc
> machines, boot partitions assumptions and limitations.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>

Nice!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
