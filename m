Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp11950032lfc;
        Sun, 1 Dec 2019 14:52:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEqYROqtVDRxdf2baVmV8piWzquLjSYjwYApgbuZcMvwSIzFsHTkB01YVQTPH83aL8IGdj
X-Received: by 2002:aa7:d6c8:: with SMTP id x8mr29343434edr.300.1575240738273;
        Sun, 01 Dec 2019 14:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575240738; cv=none;
        d=google.com; s=arc-20160816;
        b=eLkohsc5DUkClDQFo11vNMtAsOnFwouLlvbEkZ+eEuelGUyJThhkt1KtVYxFcdpwxw
         4/MQj31jNN56FNEdaJvihHyR9f48meaByVuVbijTLFWRI+0/sM3UjMnr6wpoqzIcJT8Y
         Pk7GJzOCKu0GYERZ0BOsL9y9TtK3hZKwu+oKV3XSygUtcLxMDcDmHvsT8sh3EgVc1+ky
         gnJ73bUF2DGuYKVhcgU50ILuw+Z9MUySFbKSobUWkidNn7rPL465+0RvM6JSMXSHVY8k
         OfD6jinKD0XBZIT2jv9YnnxMX99V56qnprKxTUGVTEZXISeyoVjJlXVmy2fjNvjHUbeI
         HuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IseQ1yMIAUS2jCMaYl3VxZeZJQk1+p0QJl3nw4mJTGE=;
        b=uD4JMgYa/kSqsOo0rGB25cibl8EiU4WO/bEQpluJU/eoXuzmjNaFF0L8Lwlueniemt
         w1As3x7fsK1z4jxf7MKmmVBOvmrmzLaYLMc2Do8mJ2Sj5Ms873KvNy2FmrWUpRhp2Xo1
         vrQm+d2CzpQmpxaFlRYrXPr5n6TZJYbyNjbRQn1yVJWoCDm8o8U9twC715L6UzLAqmjT
         zYcK+l7lZC1FR//REHJ+u6EHc6mImCByB8zEX6po7Yz4D9WELnY46q3zgtwS5+IGRO92
         XDidLst0OWL2RJKhjFLyqsKLjJfV7Ligt0G0tmdMYgREUHFY9AuKME7ByyPUDHimua9E
         MGZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZA9KXIQ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si19372770ejs.161.2019.12.01.14.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2019 14:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZA9KXIQ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibY4f-0004e4-6z
	for alex.bennee@linaro.org; Sun, 01 Dec 2019 17:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibY4V-0004dh-Ch
 for qemu-arm@nongnu.org; Sun, 01 Dec 2019 17:52:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibY4U-00082u-89
 for qemu-arm@nongnu.org; Sun, 01 Dec 2019 17:52:07 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38839)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibY4T-00082S-VM
 for qemu-arm@nongnu.org; Sun, 01 Dec 2019 17:52:06 -0500
Received: by mail-oi1-x243.google.com with SMTP id b8so1459376oiy.5
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2019 14:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IseQ1yMIAUS2jCMaYl3VxZeZJQk1+p0QJl3nw4mJTGE=;
 b=ZA9KXIQ3HKXqA5b8YXHh3v0NxMpNtsG1PCebeqLAX/g9Shdb4ak7/rQmEhRDOmjOTA
 03uEXv+WMfiif/qbklGUxe4uoXO+ZTgkiUeFsaWwXS2KEx5JYFOm54UtwJG+BLK1G+Hu
 XgHqQMvy0lg+8cnQvb9+TMYDlbxspDZS7j0QuU03l+CfmlA06mkhfabY1odMyolwvDso
 yfj3upR4NkcINkCcijmP47fKIq72ODP+D9qn3L12ZTXnOoOWMdBkKGpyDJZnz7eW7gDU
 s3qAFXa8rqeQveGZu4dfjKJgeK3reCYTfg8VnentglkgLRIwPlyv/+/voDOcqCzDjfOb
 s9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IseQ1yMIAUS2jCMaYl3VxZeZJQk1+p0QJl3nw4mJTGE=;
 b=U5pjibaCQXf6/EpI1OP/9HUiM7WrkvvF2/v7yZ8CA0MGlg2MvPAkWxw4LOuEG3A0Uv
 5opEC4fpFl1x4whjqLLz05/PrVPwsxQ52J8wSMsj/8v1B9kHqHcZtV7lqF2ice6Ep8yF
 /4QXh9L5p/XtrQoI1Ec3pSk3Sb0x+8k258GEoRmRMwCijHrxpP2vV4dbTELDr5ulKwP2
 fXOt7ma3033ljF0flGQPIKApTxGzVD3DULT9ZVqySOIGT2ZPx57JfuP+5FtKNtQgVjMP
 ZOK5woi+TWt9TxgUCHpPTVMOWIRGErx9Uteo3/JDDq2RZykUifNDejutJiWx/GUc648A
 39Tg==
X-Gm-Message-State: APjAAAV5xy9cKgm6+fMsQ/YR/DpGlz2UYrcOv4lwPL6k60q1g17U65GQ
 e+hBVAYSHuclXim7wR++/dpNHgoH6tKIMasPogXHZA==
X-Received: by 2002:aca:f5cc:: with SMTP id
 t195mr18593935oih.163.1575240725047; 
 Sun, 01 Dec 2019 14:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20191125124055.19286-1-jean-hugues.deschenes@ossiaco.com>
 <3e2857fd-aa5e-acc5-edd6-359715a636a6@linaro.org>
 <CAFEAcA90u0GsZZTX6EB0AzrS+A-ErTEGE2XVeJH8wvSmfF80tQ@mail.gmail.com>
 <YQXPR0101MB1142ACF7B4629FB56926BDF1A0400@YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YQXPR0101MB1142ACF7B4629FB56926BDF1A0400@YQXPR0101MB1142.CANPRD01.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 Dec 2019 22:51:53 +0000
Message-ID: <CAFEAcA8y2bNiyJh1KOLERw_gi-k7nyGLgBEv=oYQZMOaCM_Rrg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow loading elf from aliased ROM regions
To: =?UTF-8?Q?Jean=2DHugues_Desch=C3=AAnes?=
 <Jean-Hugues.Deschenes@ossiaco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "martin.galvan@tallertechnologies.com" <martin.galvan@tallertechnologies.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJ0Xepz7YMtU

On Sun, 1 Dec 2019 at 22:50, Jean-Hugues Desch=C3=AAnes
<Jean-Hugues.Deschenes@ossiaco.com> wrote:
> > My preference for fixing this properly is:
> >  * get Damien's three-phase-reset patchset into master
> >  * make the ROM blob loader write its data into ram
> >    in phase 2 ('hold')
> > * make the arm CPU reset read the data in phase 3 ('exit')

> Makes perfect sense. Feel free to drop the patch.

Well, I'm still vaguely tracking this patch; we might want
a temporary-fix if it looks like the phased-reset approach
is going to take too long to get into master.

thanks
-- PMM
