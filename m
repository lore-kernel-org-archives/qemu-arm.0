Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1300438lfm;
        Thu, 25 Jun 2020 06:34:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6lsj9aYg0uHpnCjLN4i0UgptFZOc+98WG4/u+c8we/hZaSiyXM8rXAqAaQQDJsSzufyQk
X-Received: by 2002:a25:dfcc:: with SMTP id w195mr54498945ybg.372.1593092085405;
        Thu, 25 Jun 2020 06:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593092085; cv=none;
        d=google.com; s=arc-20160816;
        b=vc4s+RFx65s+BEP4ln5bXSyknmQCOTkepAv7J33eO7Kxx58Dlfb77BZdFaWO0eLoLd
         oxh52CPWi5eR5yryCFWxO6hL731CbR+oo34b587ic9dgKcZY3OSyBkceWYD4Zq3eFSV6
         iklxy0twy1bSxccnjLmal9fNL17+v5AF2DZ+28wj+tQpv91ugoslaFeKfCWN9JItmJEw
         J1Xez2YI5XhclAdIaFYxR4pW614FoeyQf1Vsz1JFWIK/c8StwjkcspWRa/3IwYZF8aKm
         9kvglzoGlGRwlY5escQIT7kq5ZXLDdkQhLJpOoPOWIja4vto6Y7994lHQ1PPcFXcu8jf
         YCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NLad+mlef+5KxmOwMd4XiGWmOMWI4i1o5GSmm+83lxI=;
        b=w9jKGNUajY8c3JKuC8LX2tXBmb88znnheZBQMBqogU5I1yQ4I5Xi1wBhCK8m0nPL4N
         6LTpnfwsrebaRhjfIaJjlSWPHfyhMBm/o0wd5q06FLXu9+6F7TTtPdmUm7q08TBY11z1
         vln7+JqvYdw9xlgMZraqyEIP8CllTNEt+/GJUDclDe8WKGJn4V6LWyl7ffePN1GofVaS
         iTl403HW/4mi/bOG25B7MSRDnjw+ce10ed9Wm/1rjHIMb97R8Oph7Nstg4/EIUXyMNdJ
         sjp9kxKGjPA8SfveAEiO0f1WOTtuAHw5Wgy7AQrTT4NcNNdKl8ViTrNfesyea6MpQvbQ
         iShQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kbx4paPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si22495179ybm.381.2020.06.25.06.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kbx4paPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joS1c-00045M-Fi
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joS1R-00043K-05
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:34:33 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:32800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joS1O-0006yt-G4
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:34:32 -0400
Received: by mail-ot1-x344.google.com with SMTP id n6so5281851otl.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLad+mlef+5KxmOwMd4XiGWmOMWI4i1o5GSmm+83lxI=;
 b=kbx4paPN+kL+4sVYmiN5VAm3tpyPeSS8o/yT9NIujcOzBaV5fKyD3FOG/5l+jeVeIy
 Vmwxz/K0KJwTpfivlZ4Dd++XylfIvdOYZ59mBinp4Fyh48T2+Yg5B7BRSGOnjNwVimPv
 oAiGG1u/nfCU0838tAagiCRbmH9U0dwdArwnb8N0bqGbbQ6reSWwcvLIkG5+mEHv/2Kq
 GD/so6wam6wG4+xthFeNBlrufIcwQ6LUQpspg7/9q1lFDfC3UUC+Z1VwHJiQm6YgOLso
 bEqLkc6rRblCM3KIZu53vt0p/OxGcxIDoVeDlEXA/lN66H7eCUfuAS9AQj+WvmQkw3PF
 Z/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLad+mlef+5KxmOwMd4XiGWmOMWI4i1o5GSmm+83lxI=;
 b=gn19X3yQzu+29fLDXI3+K+yLbDLdk3SoejnK+5wHGEY3TsT6Q8gE8DgDUsvk6cQH8p
 Z2yDxtrj5xPshNsfgUaiCz0ogLYR5O/j5q3PzVK2lxTE2rITyqT7cClyjXXtUv6fezIn
 sYQAD016UqYbXN0CNcLhf3jjhFlKgAKTcD0FsvQMPj8hW7eM7y8LMo7/uW9Ant7GDYiS
 0c8BWN5pF+a1PmJcZ29CPtpy9wnDZfKomA8Yh3vqSQhzBTCyYjY/fhKJiFlDET5VnbmS
 FqHQLD7Okppq6Usy4T565hOtfFtgvFId0cv78qxLf6Rt+8WHEUocjkWQTNhJ3nztKMsl
 u3+A==
X-Gm-Message-State: AOAM530aJJ38ejMbdti+k+YUGxSQUM8tslijmUvT03A9DUcmaN8JRabQ
 sGuhwiCgmhKzjqun2BfmDEBqbS1kje2gnM9icdk8Bg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr25534916otn.221.1593092069079; 
 Thu, 25 Jun 2020 06:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200622140620.17229-1-eric.auger@redhat.com>
In-Reply-To: <20200622140620.17229-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 14:34:17 +0100
Message-ID: <CAFEAcA-NgFtwrKVWJ4x+9gGo+y4yK8t=gkfUa5XE2yX0cfuZxA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] vTPM/aarch64 ACPI support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, ardb@kernel.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eklz68KYkONK

On Mon, 22 Jun 2020 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> Those patches bring MMIO TPM TIS ACPI support in machvirt.
>
> On ARM, the TPM2 table is added when the TPM TIS sysbus
> device is dynamically instantiated in machvirt.
>
> Also the TPM2 device object is described in the DSDT.
>
> Many thanks to Ard for his support.
>
> Tested with LUKS partition automatic decryption. Also
> tested with new bios-tables-test dedicated tests,
> sent separately.
>



Applied to target-arm.next, thanks.

-- PMM
