Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp8287wrx;
        Thu, 11 Apr 2019 19:13:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxltUQEpR52rXHfCkO94Z9ryrrCmC4BekF5lxMRDZtmL1COVjvSV+EUs8RuHuDxXQkmXgtf
X-Received: by 2002:a5d:60cf:: with SMTP id x15mr33499814wrt.96.1555035238880;
        Thu, 11 Apr 2019 19:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555035238; cv=none;
        d=google.com; s=arc-20160816;
        b=aAX/JkQuZNm+81Wt0Iw/Ot0jpSgC77Vl8ypwqTEiow70eNtIbdY1+JgYlIHIH5cRmn
         HHDEkvFjs/daBp1/8BBvktVHvIwcb3ZPs8jlcDsi2tUAcEQdwIewuUXJhyVueN8URWwt
         L02GdK66Npiuv7CY8BDz1vE17DflC1wU4ZPy+ZSlU6EE1NZ2gQMLOXrIiD2EMJKTTOy+
         J15uh9n3dWbhQHrD47Scv/2TmsrVe/+SnZazv1dpxWIYIlou3oGCgyl67y7E/1+Pq8gj
         umH6GIC2QewKkWFJgp6i2n0bbLc91M8DRMAurAhSRkp6n7LAC8ErCcp4rFXqAWMwVREc
         CfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Tj8pyJxNjpOr+pv5EXOpBQDoVitHpGp2jeWgsrxYRE8=;
        b=NONOxd6JUmgEneGx4Ml8+sOBYhZ0BAB3f3lDejlWw8mtnF+ALKim9lKFED45n7RXis
         Y8hW9mYG+xTDxXbr5J2Uxvz/Gaz7YcqUMCYq5JmrLRRhZmS1R2eptOg3X6/ZlVeENdAH
         1/tmAqNb/Im6ZtoxFoMCjOnbkh7+hIfbMMY51z7FFBKMKUwSU1t8getOfSKjKIZXtRu6
         3jhHY3fLv3Um4mAA50xn3qL++P2P/6b2FpSa6p+UeTgSTjIqnL4trJB/f+6V1eXPH8uA
         FDMeh4tGQS95P6tXqTIMujYEoJ+B7ooGtrwQV0UNZSfcwTnw0uZ/ltnv6ugJHDNHEurt
         2qpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=KJ1XGA52;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si26052717wrv.24.2019.04.11.19.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 19:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=KJ1XGA52;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hElhV-0007A5-V5
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 22:13:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hElhN-00079l-RL
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 22:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hElhI-00070k-En
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 22:13:49 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:34942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hElhG-00070L-Lr; Thu, 11 Apr 2019 22:13:44 -0400
Received: by mail-qk1-x741.google.com with SMTP id a71so4785149qkg.2;
	Thu, 11 Apr 2019 19:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Tj8pyJxNjpOr+pv5EXOpBQDoVitHpGp2jeWgsrxYRE8=;
	b=KJ1XGA52z1MyTIyR3XCLHnxggMjmhfVxP+HdENUN2KKhQM56mjgxJ553Y19Gr5uHN0
	D8/O9J2H0Lxh3Vvr6W2XB2XI0evkMpU0NyBnNni0oTPVcTYOq6q8Ssj+ELBGeqg8tjCI
	Htgbo/ABmeGQnI3+OaoAz1JWuRtXdJg4IEHgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Tj8pyJxNjpOr+pv5EXOpBQDoVitHpGp2jeWgsrxYRE8=;
	b=X5NUF3D93417+WXUjjQQk6uxgL5DQyQ/nLgWf44w7ZN1bZbOoNcgcwbNfrvcQl/idP
	dKee5DVM4mTWx+MWoaaTtIDMHKxhxlnIvlxFTq9xeswsCNL4NeqQ+uLvSH1epWWDViFO
	DCljPoN9/mVVza2gwqm44sRoaQ/a4f/6PG+Yj2ZBTH6vmj/LcnL1nECUNk0mltHU2Z4q
	aETmYlH325HEt5YgeTxuxVjGLyu1Kxclw+TZMJcNkmjnWTNkeAghymUloqrSOQ22mPHt
	XEFoo1D8G17jI4IxOCD1HclvInnXYcMJC2NKMa/II2huvGww0xMKoTgxfEr18Of2gnEL
	EENA==
X-Gm-Message-State: APjAAAUmdlQ9FKkZh7BQrwffanD4RgcxPMBfavLeBmg/ZGs0JEzwlZjp
	O3UUs8t35WjRYuxTwWS9brqZJZ7JxeU8l0t8YLg=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
	s10mr40811395qkj.305.1555035221115; 
	Thu, 11 Apr 2019 19:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190411161013.4514-1-clg@kaod.org>
	<20190411161013.4514-2-clg@kaod.org>
In-Reply-To: <20190411161013.4514-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Apr 2019 02:13:29 +0000
Message-ID: <CACPK8XdBo-QLzkh1qmgA8D1_hN7P_7KcUOvwfm3LYqw_Pzzycg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [PATCH 1/3] aspeed: add a per SoC mapping for the
 interrupt space
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s4CsKEWbMSug

On Thu, 11 Apr 2019 at 16:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This will simplify the definition of new SoCs, like the AST2600 which
> should use a different CPU and a different IRQ number layout.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
