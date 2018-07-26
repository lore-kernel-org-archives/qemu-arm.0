Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp226549wru;
        Thu, 26 Jul 2018 03:52:43 -0700 (PDT)
X-Received: by 2002:aca:b48b:: with SMTP id d133-v6mr1261149oif.165.1532602363737;
        Thu, 26 Jul 2018 03:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532602363; cv=none;
        d=google.com; s=arc-20160816;
        b=rg40JVDBo+IFtasnYkRDskG8QTc2aVdaJ0ctjFNmPjyCa75qsbPqlanxyLlY+bGWWu
         6aWqzjOJW0zcyiJCDdCu6+f3uMHL04HVv5YMgR/TgQgYGGvvG5tGg5Ws5w2xrjVSWc9L
         Vi2Lc0WO7AaeNxaF7LZEICuTznEDQw2yqCqR0eKKHqvTMnLlUf37PhzqeLXJ1Pa9ApMh
         hiNVpFId2oWlf5IYZAlzia3LoJ2ZB4ukuWOgiBRkMnd6NJmu2/doBdSBd9eRe9knTZY+
         qm+9VV3/GDM2Jo0U+JtUb5pK4jzkK9+RImBSFZyA0v+Xszb2TB+yB1HWKfiHMN9nKaqh
         U/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=2qu7WkRNaNkwOaWv71fpR02xosxtM4/HQLd2+ca+oxI=;
        b=QP/2dfzdH+gw+FlfX/SuOdMA6H8hfTcc19pWJcgog9krM6dDsHBIjlHG1V4PyFQmIP
         xKE9kXPs5kM3FlLzMxFGbMAUZu3YKYHprrm8I9JdwURDddUFZaPdtldC74m0eGoRwllF
         Dtr67sMfXDr+M/dyJaiiJ8Cy1vm8yZSWobox9uMwsgu3M7VdCuic1TNloCs6TYolr2hu
         0QS6/1SFffUlLOJ5WMOdp3Ja3ZlzBHG73KDlBi8T+QRupj47dPLSSR6PXmW8p2rH1PtK
         3WCMK9zp1/IvEVQ/KqEqtDH2w0ZyZX3sMwz4Dv9FCMcGcjmLlyRfZezSg4/I3nwN/tNw
         rS3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jf0yZJLo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r64-v6sor559414oib.119.2018.07.26.03.52.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 03:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jf0yZJLo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=2qu7WkRNaNkwOaWv71fpR02xosxtM4/HQLd2+ca+oxI=;
        b=Jf0yZJLohPoYhpoNQpzqTkevJWLHLeiNGrMjEHvlzIWJLzCcmzgIpQifzIKTPT0DCo
         7CnSQwm5ghv00YFRXDy+ECTdnGZujZJBw4IZe5wvKSSbz3MNP20SoDcpRgx+QikfgBib
         bkUjQkoeseSvA21N/9hyOwmNMX2wMNzB21OW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=2qu7WkRNaNkwOaWv71fpR02xosxtM4/HQLd2+ca+oxI=;
        b=NkBeLPs2fbxOYZaI2Ql7Sy5Xy0hjQFmlmXGsUyboQv2d6xv3x6LRkBlGYL4halhn8h
         DeWdtxSE+IC7LFZvf2ldF+zcs3D9leFjMcpee2Mbq3/WQrPQHKGg8/MzOMmSsziidR2k
         qryBefNJD3FUVEbC8wCbMdFSbrJYm8/Ad6HgBqYfbWO661EAmktxJ7mhmCryFoscAkOu
         Sz05qf7ypQxLHDMdlYYcy4RG/y9UMDxKK8O4mDZ86h0rvIdjGKoGf/8QnozD9lkoE41c
         8Ft0YJTLSSZsuiKtzh7D8DZLAB2YESV/lOp3GZQaJkOkjzXnxiok6rtELoI6T6ZtZ2pm
         M8/Q==
X-Gm-Message-State: AOUpUlEmA/OWqpAETCbCH8znH4bm9pBgxxGfuSdC/H1qQMQ8ky79Wlpc
	hQ1GFI+SGqaorjsyu1gXC0Fn63FIiiy/KGm71RLGEPJ3KIjYAQ==
X-Google-Smtp-Source: AAOMgpdy+ImV1XUtnQkFz8D4TdnppozduqcTClxHCml1ZRkOaOKp3ovUv5AwY9ebLzganxs6gOTorOpANwGLS1Xb5xA=
X-Received: by 2002:aca:4c14:: with SMTP id z20-v6mr1289894oia.164.1532602363442;
 Thu, 26 Jul 2018 03:52:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 03:52:22
 -0700 (PDT)
In-Reply-To: <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com> <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
 <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 11:52:22 +0100
Message-ID: <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: IVxCdHud/Wsq

On 26 July 2018 at 11:46, Andrew Jones <drjones@redhat.com> wrote:
> i440fx and q35 are specific machine types. 'sbsa' is a generic machine
> type that conforms to the SBSA specification. If you weren't trying to
> memory map AHCI and EHCI controllers, or if memory mapped AHCI and EHCI
> controllers were mandated in the SBSA spec, then there wouldn't be
> anything to discuss. But that's not the case. You're attempting to
> hard code one instance of a generic class of SBSA machines, but then
> just call it 'sbsa'.

Modelling a 'generic SBSA machine' is not the goal here (I'm
not sure that's even possible or useful), so let's just
stipulate that we'll call the machine type something else
and move on ?

thanks
-- PMM
