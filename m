Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp303840lfb;
        Fri, 15 May 2020 01:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz//2FL7lWNmXdE1wT3sn77bXBY8Lof55FewuVKAkMBN8b8wPk5uluLOPdg6inABbEnrTUP
X-Received: by 2002:ad4:534a:: with SMTP id v10mr2462521qvs.49.1589532763744;
        Fri, 15 May 2020 01:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589532763; cv=none;
        d=google.com; s=arc-20160816;
        b=jvXXuMMjGgzgQf2hA+A4R70qwIkZzqClHFK1hpSmhlbrCV2qHNM+W6pREIjNs9lIC6
         /owWz4dvdbQGnzNASPaZVMAsf62xQf32ZW7sweGhM9GTAiLHppCC/CarsbSw09J/EA3z
         FbKgYs+X4ld4xljleMsU/9rvS3tx8lD2DgJdjd6dPBqERwm7XVLmKRtc+UrEplT/Zdc1
         9oirYXEg1+btHf+VcYPwvXQkn5OAcIRSL7RkVBoM5j68suEUsfMobRsS9hl5N5h6PMrE
         Tkiz7aA80I03NecwlsNlSar1hx8xuNGEdWB20C34AiNAO6VWDMCBvNkJ6+VU2DERdP1r
         04aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pEKYNjBvhN8dZ13AWVM5QCFsoEWkc60iA2BrV/kjtvQ=;
        b=oumwIH1ChA5wV8sPdc+RjiIC1e3ODLtEF24cLvvdeCOueFxYYMTNv7hxj29QyCOMZo
         jYAx3AFVITPfNB/7NPLolFQq5M42r3vlUpZNMtxkHL3DyYsn9VRdLVCdNsPctrxnScIG
         e0wCB94kBryMuW1bcvEbPI3Bd4A91Or+hwBZUPmQEiTDUnIct1T8eZgXX+CYMKgE2tq9
         H//Trf9kvM1eURND/YKNJ1wJO6ejX3MXl2O+ti03UrxV5Dk+EqIaccGmj7miLq51ymTr
         eDXTD27eZ0mn7kznxJkexpNE8Av1fbJwyFHEVqflMIJMAfsUwZq57tRuoIzug68L89ng
         sXMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DfvZAMVw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p35si889106qtf.160.2020.05.15.01.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 01:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DfvZAMVw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZW5D-0007Zz-7m
	for alex.bennee@linaro.org; Fri, 15 May 2020 04:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZW4U-0006bs-T2
 for qemu-arm@nongnu.org; Fri, 15 May 2020 04:51:58 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:44397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZW4U-0004o5-1E
 for qemu-arm@nongnu.org; Fri, 15 May 2020 04:51:58 -0400
Received: by mail-ot1-x336.google.com with SMTP id j4so1298911otr.11
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pEKYNjBvhN8dZ13AWVM5QCFsoEWkc60iA2BrV/kjtvQ=;
 b=DfvZAMVwODmMg9gqSLHqOGO5DyC4SLy6qLLMwN1X5n1pVmSO9HEeELVKi/1D+uMQkc
 Q1vuZeCqZNsoxEUcBRayI41Vn/Q3YfDFgM2WXSD4wsCX1xod5a4clKeVAxT2eAhyqbWc
 +JAJXzPuPj6K727LLJ/R5Tf9IcIbjyt919ZBDX6h48UPyG4poEagRC8kxRdw2EeQI3JV
 3dX+ZQMFL4metsmnGZBN7x3l74/a5QD3rcztDytBRHgd3RvTwBoQl1CR4vL0RqUGP9IT
 fqPF+yp9guDCxaEjv4wI1+FnwaTC1hRHC8RWmVwCZ//TAb67irtFuJzAOuL8cv70O7V4
 LjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pEKYNjBvhN8dZ13AWVM5QCFsoEWkc60iA2BrV/kjtvQ=;
 b=AvTuACyeW/uvP1c03dkqWsmab12vHXeuJMUghj6/MUbdec3P4tQH1cAhRFZ9ablKBN
 zFutOd7e8QrSrh/FkjOUpbVXWqUsLFXcBax3YSQMmyBJZwmYqGfQ6djS1eSLfrxzAQ5P
 guoohmqEM7eWJc19AU+T0TCNWEkvFcQb7neDCE4yacUpD9skINa21B2E+pROFAVLci9x
 oJ0Ig4Z/1+KgDN6BOaXr/gl0XVg3iMsXxGFt/RdDz4xYRsJKLLBCjalYtoG4TI6649XC
 KZqMMPOJL5/+l44itSOU2/usyUcwzsWKuGrbpwOTfEpWFpFtYznBcxOsv682bhRbOkYe
 Y/Ww==
X-Gm-Message-State: AOAM531Bjo7d+g7rellec0N4NwEQ1GSwbY1j73BBf7uVi+SYH92yDBCw
 J9jHTNehaUBzGSvmvi/kfi48LkY1S78dFGIJYgLrhQ==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr1439365otj.91.1589532716615; 
 Fri, 15 May 2020 01:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <CAFEAcA_p1x6S10yswHgOkMd=KrxcTGh9TD47+k1LRKM0xy5x+Q@mail.gmail.com>
 <567755c6-3bb1-b16e-af26-431dec4616ba@redhat.com>
In-Reply-To: <567755c6-3bb1-b16e-af26-431dec4616ba@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2020 09:51:45 +0100
Message-ID: <CAFEAcA-67uGcwSu7mJ+w26xYqpTm4C0t3Yrr8gWCsA1VtHeaLg@mail.gmail.com>
Subject: Re: [PATCH 0/5] docs/system: Document some arm board models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iTA8kxfgplJ

On Fri, 15 May 2020 at 09:03, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> However I'd rather see the board documentation in the source code, and
> extract it when building. It'd be harder to miss updating the
> documentation when modifying the code.

I definitely agree in principle; but for the moment at least
we can have some documentation...

> Another way (rather than using external program to extract from source
> code) can be to add a method/field to MachineClass, and once a build is
> finished, we could run 'qemu-system-arch -M gendoc' which go thru all
> machines and display the documentation properly formatted.

The documentation needs to include all machines, not just
the ones that got compiled into a particular binary, so
I'm not sure this will work. I also would prefer it if
we avoided having the docs build depend on doing a full
binary build -- places like readthedocs will just do a docs
build by invoking Sphinx directly, and we'd like the machine
docs to be visible there.

thanks
-- PMM
