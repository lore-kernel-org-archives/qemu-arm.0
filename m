Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp206646njb;
        Thu, 5 Dec 2024 07:26:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKEbwMpqCli/SWTPWVb26cdgOARf0ntajZQGGDnfvns099FAeV1yUaIH5Ly9dq1GReWnLuKjyyBuQElg==@linaro.org
X-Google-Smtp-Source: AGHT+IEsVnlbpSJXf7AjxfyUhP3Y1rmVoXjx35C5z/eImfHiRoLTQ5Gge5tERd6demjKdU8omy9T
X-Received: by 2002:a05:620a:3907:b0:7b6:a4bc:cc09 with SMTP id af79cd13be357-7b6a5d1683fmr1622871585a.2.1733412383944;
        Thu, 05 Dec 2024 07:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733412383; cv=none;
        d=google.com; s=arc-20240605;
        b=dpLLvSUJ4tCmS+RHuTMabg9LsBcs2TuGXk6jDvknfoxV4Ad7OaAHghhvmG/uEtMo9b
         h5fLiNi6ifBFSLdVV0GsXhntXueLtGY/8jHkju0wacocPuuS+kqzUhiXtpmPbt5ZrPSO
         hPSgArY0R+BhOO8q1nzseK8uB6gJnti17mi3bc9r/Y1DnzRLWoqxJLoOuK3qrx5Y1IhD
         6+vpej5tkJmOBVwoYn0WJgyKmutdO06hTFwsb9xKXUF9me7Y09mQPM+QYPfjvmxgR9oE
         Kmi4T20IIHTZ1F8svM6zejfZFiIK9TjnXxCUX6i4RVsAvK8Eh9DlsydrkKFGzRZEeVI/
         SVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c5Fse5OsBmvfIkY1AuFXMstw0XskRJL+JDj7m30TyUk=;
        fh=LmGNNY2vQgnn41cBjaQeDB90oXl9TiCvVN/ruiBhZ+Y=;
        b=IthIWHczIHThb4YqF4bBxCPKnyGwSIptRVvoVjIRWtDb0tbHzlIxvK7YjGKFbz/g1p
         c50cD1DBvaP9q12XwdIri5fqSdaXRXrEDcel/whpipccxUxqTkbGOdvgfBfBJlas5TGe
         s3/BMM+v6CR+C5m4DOnYkVnSfmPt4TEifQmXb6sXpZAm4hcB3C4dC6o9tovUswu1aZyA
         VDgaD8bdk8dt0m4QvhfR0iwTRnpxwAv8WZ6zrRE1CtrID4ZHkmbc9fyBx6jOjMALgCZc
         0DZ22nujpdc+80mtxtHwbNFYExcC3vq44/eF0oXY1/i5oEk8WrNJ+XGKDJhY3Vac5xyq
         eWIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPnmx9Bh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a5c67fsi179281485a.178.2024.12.05.07.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 07:26:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPnmx9Bh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJDkC-0005CB-OK; Thu, 05 Dec 2024 10:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJDjx-0005BM-Rv
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 10:26:07 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJDjq-0008Lq-Vi
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 10:26:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa5f1909d6fso201523366b.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733412356; x=1734017156; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c5Fse5OsBmvfIkY1AuFXMstw0XskRJL+JDj7m30TyUk=;
 b=MPnmx9BhLXV7TFt90d1Ccs0GU3EO8Iu3t+9EUYWMDEuIsD3acvkQneDoMiXkbFq0wy
 WHTEKW6xnMTZaeDDeTM9ou6lq8udaJBvrwV4HuUBVPy4DWFATuGVyc84YizUCCeAAV65
 PJ4ZjLXWwrJie/W63ZyAuG3NdtPP4wzhj5ANj7ZRLIfnw8O34nPRvvdwFcpaLdtva+9G
 gosDaC0JRE75srbGtuCS4De1KT0v83IDBkADDbzLu5Ap2extmrmhY6fmZ40h3v8B/hs4
 MYSXH+lTRVlXrcjESGANmHx7v/Zh+pAcEpROJMtftCfuzaTCIE/1wo+HXoE+mI0+rUgP
 0kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733412356; x=1734017156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c5Fse5OsBmvfIkY1AuFXMstw0XskRJL+JDj7m30TyUk=;
 b=T86iGz5P7dmjvJJL7yFQG5HF6sKQOybrwSRFERWaFYRUy7HCNPH7AbFujyCUNwCeqN
 9ArbzjhVqrZ2XTuruDUV+qP64UB1jTOxdtE+sQc9pc0YNpR9OCSZWTwHJaLXDN1XGfnO
 1MZFJea09AiJpzybevR5OOKtGstNpdgVErhLau/KrltRmnkjj7YuTrQ0H32TAhqeK7pD
 7eXbcjpV6rPnPDlNLlVbmGIMM2sdjfeYAIAonhUhO7eI3hQYQ2AO5IKj74eRn0p9IiSd
 NxmBFXmkB8WwdbbsVlqI8B54ILbzNcvZCIHyJiTmiavVpMP18cQFA1z57vQXnufgAE+V
 fl8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpDXhJC2qdUbrOaKOuhA0V/Eb9FCfs4h8j0d3M3nWvwB/0S07ShRoWrYsSsZ5yAfsvFY2708m43Q==@nongnu.org
X-Gm-Message-State: AOJu0YxdzKF127usVkEIiyvYSS5su1Gk30viIZyr7qeWN2gZDb9R+4nQ
 dM344A4Uym0EcgG1Sm3qnOPfiJZ42ndymLHuhpduJKTM0W+g9sjz2IbSZlhzN1erpKq/WUg4d+y
 SimI+XC3PqZOWA22WXNBBT8jhh1FwXeKzjZ2Fmg==
X-Gm-Gg: ASbGncvQ8gqZ63VybAJOvf9vuSNCCa8RcA1AvDRhGA4JRuMTOj2TZSJ/RAZsOvNVlRo
 hMs3EVOjEytTsAB/hFZkvcry8cSaryYn6
X-Received: by 2002:a17:907:7850:b0:aa6:27ec:688d with SMTP id
 a640c23a62f3a-aa627ec6e53mr288023566b.10.1733412356662; Thu, 05 Dec 2024
 07:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
 <cd635753-4e2c-42d6-bb7b-d558d90f59d7@linaro.org>
 <2106db77-88fb-4113-ae09-9bf77bce6ad7@quicinc.com>
 <c4245af0-3dd4-4cf6-a786-c15fa079ad05@linaro.org>
 <18ba737f-d669-4e6a-8319-fb5052223b26@linaro.org>
 <CAFEAcA-P5P4AJidWcGgUScBTe9-K_C4Qm9N2o2XWnfiT81LU=A@mail.gmail.com>
 <641a4d44-1406-4d3f-a87a-a12fe156b2fd@linaro.org>
In-Reply-To: <641a4d44-1406-4d3f-a87a-a12fe156b2fd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 15:25:45 +0000
Message-ID: <CAFEAcA_f5s8DgjgYpyfiwPXr=ACDAecTskMOg5K-5=RLxrhogg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, leif.lindholm@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: sVnpILyGL3f9

On Thu, 5 Dec 2024 at 15:10, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 5.12.2024 o 15:53, Peter Maydell pisze:
> >> This is sbsa-ref not sbc-ref. Let it just have that 2GB of ram.
> >> None of existing SBSA systems comes with such low amount.
>
> > Yes, I think I agree here. Changing the default RAM size based on
> > whether the CPU does or does not have a particular feature is
> > unusual and not something we do on other board types, and it
> > definitely doesn't match the general intention that sbsa-ref is a
> > "looks like real hardware" machine.
> >
> > The problem with using 2GB, though, is that it doesn't work on 32-
> > bit hosts, which have a max of 2047MB (and
>
> Do we do CI on 32-bit hosts?

We do at least some. In particular the qom-test tests run
by 'make check' include "start every machine in its default
configuration and check it doesn't fall over". This will fail
for a machine that defaults to 2GB RAM on a 32-bit host.

> RME tests (queued to testing/next by Alex) already use 2GB so in such
> environment we would have failure anyway.

I think we probably don't run the 'check-functional' tests on
32-bit hosts.

-- PMM
