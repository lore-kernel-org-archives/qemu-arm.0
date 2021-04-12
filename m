Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3785327lfr;
        Mon, 12 Apr 2021 03:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Nyrs7XUeB5qHYWPTSqSWIIIUcDSBnMyTm+9yAYarMqnhuvyrFIZt93dfx3TGShEZO3SM
X-Received: by 2002:a02:230d:: with SMTP id u13mr28374117jau.53.1618224335740;
        Mon, 12 Apr 2021 03:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618224335; cv=none;
        d=google.com; s=arc-20160816;
        b=ulSyvT67RfVs3z8NdOCOVuteJS15Dm+vkQdvuTnlEQ57X3bm3Jb8Zj5UdAMlesbDUk
         dWwEJvnRZgoiI1Nv9u2rWCoD1z0jz68GQpCRsKMOd0gGgf7s7i8nFRPALniY1HgaXps9
         Ln4yPVL5+FxM+4FFW3av9vyh7mt7yHbOIcEjwIApqCNvzlsl096MfxpJe6HkaKIgeAGS
         0zB0roZHOG1TSzLRmm6zO3+q53YKTRAxpNkA69oa1wudOSTO4i1qtpxfbZQqKbstlT7u
         d0JC+88dJ9ub6mX4NOItqOh3GApMVhm9cALDvqmTXmWT6CDu4zPupmaM9jSs7wkrHkbe
         Lnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mzhlp9f1DfdUDQ5GH5cqdeZ4c1LfOrN3OsZnC2r6D6g=;
        b=FkixXjx7Dd1YlNGFO5d/EB+NdpJirsbo8yYC6FELOYXVSBio7rZhtXLeOqsw5WJCRp
         /iMDK1C+9tOgUVU0uZ8kflyT8AGwxHEIAXr8Bg+2x3jraAisYr5gtXY1Vn+FjOfyNXt6
         wjv3sfqdDMGvztN+noeNXOK7SuNM39w1+wj56SYUG9UJDoCFP7/ba9L4SQ18y3mWSO+n
         wS8iTF/TvfIDfoKUNvlZwGRpjCGnrPcbHy956/dl355/X3lCR8gTRdcpYkp5DDrJaCPL
         EuqJzAfvXrcrhwrpLQKRb715NhJBOdHxA3qphnwa/T4QX6WHYRK9742HNt2yyDSZ0ror
         2zgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ON0Qla+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si11842207ilc.1.2021.04.12.03.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 03:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ON0Qla+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVu4U-0006Zl-VQ
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 06:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVu4F-0006Y0-HM
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 06:45:19 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVu4B-0008BG-4W
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 06:45:18 -0400
Received: by mail-ed1-x533.google.com with SMTP id bx20so13315044edb.12
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mzhlp9f1DfdUDQ5GH5cqdeZ4c1LfOrN3OsZnC2r6D6g=;
 b=ON0Qla+G8fyfqRtUYc5SnUNQVco/wCLx0D5Zo7YbJZVTCOhYFp9csEDL31o1UiPIMU
 IanalNhsM3Kj9XvimaoIkak7C4moBJQ5zKKJ1oG9udD0jLR6phfWTr482GVJLCsgiVBn
 VTcDWEmq8z6UsP6aPEMNlOqbUEDqtdYJwgofMzj3IoD9Sq7LDXFSEWXj9EOdD0HrB1SP
 l35px1byVU34SI3AsfShcbjbvZusLSfrZ5R+weiDusKjHJKNz8rUTlvKsob/5EPMPBhu
 ZxKpaT/1qJxnPTor9q7q+DS4ipp1OjdG+vguIl5+pqzCJnuFqKjNVx3YLjlLhl86crNN
 8BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mzhlp9f1DfdUDQ5GH5cqdeZ4c1LfOrN3OsZnC2r6D6g=;
 b=ELAWCkIB1Mh/tSYkvYoC3TEutjbL3oBEb4MW6lBTyUkJr/xH9Tt9hta40weqHAf0M0
 vj/g/HIjy0iCKDxGS2TjsGA44IlgZkBBmUg6E6ivCKAWE1oOYfWkz3WMKh2E6kb1g9FI
 8FrLX5zRiFgIX8TxxUb091boxIu2kgUkPrufe3i5sPFyWuXiVbElRN2FGlE3ODvkjG5S
 8XUf04Bh0guwGjVeK9fY+sSRSOfMZ8HjNVHSaYl1r8QEDsUdVYNajWhz9cBJvR+1Vylp
 NaMmdgDtlahIec5vcY4uzKkPTj/Sbi+FIDPFJxp/sOdzKfSuj8iY+WqUXiUlzvPcAenu
 lv+Q==
X-Gm-Message-State: AOAM531909dcz9Ie9u+MpLPElG20JLtnj/owFm7Sc27qFHjj3Km5Vt0+
 HhloCNaXwUd6/RtZYhUbj1Im5s7lTBZZP6kGgj4Eqw==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr28402698edu.100.1618224313485; 
 Mon, 12 Apr 2021 03:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
 <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
In-Reply-To: <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 11:44:29 +0100
Message-ID: <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: osqsrV3UwOTZ

On Mon, 12 Apr 2021 at 11:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> TIL MachineClass::reset().
>
> - hw/hppa/machine.c
> - hw/i386/pc.c
>
>   Used to reset CPUs manually because CPUs aren't sysbus-reset.

pc_machine_reset() is not resetting the CPUs -- it is
re-resetting the APIC devices, which looks like it is a
workaround for a reset-ordering or other problem. I'm not
sure where the CPUs are being reset...

-- PMM
