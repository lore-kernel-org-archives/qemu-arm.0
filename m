Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2304261lfg;
        Mon, 2 Mar 2020 03:02:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCuvI/1cBB1mC5Qm0HbvVGBUJefLfPKzsfUU6TAGLRWfpBOIPIOCSmprS7C1FQTIjNCoWa
X-Received: by 2002:aed:2926:: with SMTP id s35mr13101952qtd.368.1583146961416;
        Mon, 02 Mar 2020 03:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146961; cv=none;
        d=google.com; s=arc-20160816;
        b=CYBOfKPsdOzD4aXu+8YoVuLoTkldThQtbqYGfAUWphj/EKaF6LFeESMdUIXpiAt+0e
         A3adj7QFJB6Laa6P7ZIEirzKbziXgKjE0fNOl2Hrd5aQ17w7Kw7hviloqMh0CSbWy6EZ
         5Gw4XU5eyXXj7Iw0TAolhpfpGMmNmPh1Jfgco2E1UM2F1RLjf14NAh9vr1fzf5YwUTBa
         Pt8zk3olwij0WRc8SEAY93J06Dhm30J7wRr6DO3p2qXq03Nev7SKYsuXlfa8pkVfu7QI
         F0VlR8p5I6hBpmIKYNh2SdveG+T4GfTJiDx2QA9T6ai9bp3ZXO1E9eAutRpPLz6GP5KU
         ysjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3xPkDCTTQpgwTNewKIg9eQaVQEz55A6GJLb1Cab3MjA=;
        b=URh2pnFGz75y3izX15XRpCez3PAmkO7NdtS+tnfdeiQOGqsvU/Y9EU3x6wV9iLb2An
         rM9645GX9Se7SKyhyWDRvg5xvEc64ObIUl5nfRRkoiKbTZw5tTXc3XxiPi53PftxsT5C
         tK5vveMAaEOdhlZrW5hXClCB7OiEO2yebwqnorttt9JHb4Qy6GJMDWu98uXz3cCJ1PGO
         53WPvn+87jCY00RTDvRMPfCRIWfso1xqr/KC4TdZOrxbgKnA0jnYgHfwoGh+J4WMhIXg
         2Owmkkmejkbs/hrUmfSUqTsPzpCSisYM++NRUq49YP/ijvLnEABcXqlNVQN511AWuAuM
         7bFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z2hOXrlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si4209687qtq.97.2020.03.02.03.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 03:02:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z2hOXrlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8iqN-0007U7-SQ
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 06:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8iqB-0007Th-5D
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:02:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8iq9-0000Su-TG
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:02:26 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8iq9-0000Rb-NZ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:02:25 -0500
Received: by mail-oi1-x241.google.com with SMTP id j80so7857047oih.7
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3xPkDCTTQpgwTNewKIg9eQaVQEz55A6GJLb1Cab3MjA=;
 b=Z2hOXrlRBA/1WtvUbm77PZs5AALAyp/UqXFAW/58Qw0MZNVEPhD7eg4jC6h0rYnaEW
 CtGeeb2STDfEU+25vLzzHK5mln3b04tSBNakjULGfu6x4jVLKX5FmChusiNllRt+WO4y
 /MvFV9TUj67zfNnTHW60ueQqRO8tXP11yI1OrsGYP4VAYh4YtZ6Q5t5bnfAgPyqXn9JQ
 frqp7b9Pwuge7Hi400P63AriqkW7qJ1t7+epe62ebcb+wCQvam9fIZdmKhC/Tf19hA4f
 U+ajsrgfnoVhysjrsDQv7CPvqyxzOdlGx6lMdfx3m9CvpGralurXRnkeY7sYiqzXq6d3
 YSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3xPkDCTTQpgwTNewKIg9eQaVQEz55A6GJLb1Cab3MjA=;
 b=R1s47JJbJboP/5NwC/MZC/w7j9RPUn33jGNo6Pu2XTvc7cntYkYVPuBSWPEgMAVp2H
 bq1kkLurJfcmOBP5Z4wOGiEqIIlpL4VPS1whcHzAnig9syZHomdagWBlhPf0cQYUgUNe
 q6mPRyMcJ9/0NGf04dow+fUAelmw5riXn3JRRVJkLgCGQt2v+DcVJst0TUAcIaMSsJ2t
 QtB0Zpa+CC8xrlh2gV1PxbN8vtLkU5wUvO+Z4bW2SWM3ZReRrx5UkNAfB8ORteshew9e
 iKxbozZMvW/9roiQSY9DtAC0m2BKBfahIW/8WM4QX1PyakGfL3haK6ZftCEkqCV3CLf7
 +tKQ==
X-Gm-Message-State: APjAAAU4rNBGHOEqadwWsBMA8l8UHDea5darMjt4hYXa7UmstmGkCxYO
 eCDsx8TFdoZpIaOC7uz7ikvPcRztdVhh5RdwAme5uw==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr10742225oic.48.1583146944865; 
 Mon, 02 Mar 2020 03:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20200226172628.17449-1-eric.auger@redhat.com>
 <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
In-Reply-To: <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:02:13 +0000
Message-ID: <CAFEAcA-2DJ_Bw2NhWtJdNugkHKwAHmxiFv+tGO_y9wRm8aCp4A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MBIclGIuiMrI

On Wed, 26 Feb 2020 at 17:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Eric,

> Patch is easy to review but code not. By inverting the if() statement I
> find the code easier to review.



> SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
> {
>      SMMUPciBus *smmu_pci_bus =3D s->smmu_pcibus_by_bus_num[bus_num];
>      GHashTableIter iter;
>
>      if (smmu_pci_bus) {
>          return smmu_pci_bus;
>      }
>
>      g_hash_table_iter_init(&iter, s->smmu_pcibus_by_busptr);
>      while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) =
{
>          if (pci_bus_num(smmu_pci_bus->bus) =3D=3D bus_num) {
>              s->smmu_pcibus_by_bus_num[bus_num] =3D smmu_pci_bus;
>              return smmu_pci_bus;
>          }
>      }
>
>      return NULL;
> }
>
> What do you think?

I think I agree with Philippe here -- the current code is already
a bit confusing in that it looks at first glance as if the "find
the bus in the hash table" code works by falling through into
the "we already had the cached value" code on success, but in
fact the success case is dealt with by the return in the middle
of the while loop and it's only the not-found case that falls
through. Adding this patch on top fixes the bug but leaves in
place the odd code structure that caused it. Rearranging it as
Philippe does above makes it much clearer what's happening,
I think.

Would one of you like to submit a patch that does it that way
round, please?

thanks
-- PMM
