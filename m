Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1841576lfb;
        Thu, 21 May 2020 11:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk/1UTR6WxJTdVtw+8uClaB9L3XbcnhDomSM3wQAK/wTc+EFlILHv9LHOkFaHVBaxZbpHS
X-Received: by 2002:a25:af0e:: with SMTP id a14mr17283242ybh.275.1590087563645;
        Thu, 21 May 2020 11:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590087563; cv=none;
        d=google.com; s=arc-20160816;
        b=xfcYzsN5tur/x1c6UREWrw/y9qf7f1ixVMEHtgcoC8LWuMMFkLvNCkAz3liJ7pSQoh
         mw5k0/+DBqtAurKo2ttNGmDhC+Et1EJUsGS+ucCyShIFufUqSBUsB6Gv53mrQBVbWfKf
         XllrXfUdjFzswuxYkQSAj12DA5U7HssQbwqBebiSnncoasQOkey+vLedSkKhKhvzhTye
         RKSK2cvKv7/VcY60irZ/jH2B/izTHjZK6uN38hr3PkpSiWmiByaYFAc6pj+bm20a0eCH
         2UfSz1VU9kzg/Y17+qZHJtF4+uc1uEIn/AXATqdKaVSsaCYVf9L9tcSyGHnyZmqQ6CoA
         rwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TF/4RMNyI5qjXnX73kTH6e164dARfUFpER4eJwbwepk=;
        b=HdK6w5it45FGjHQZZEWANd0rUgquFg5aiB1nXzwGxuTCuMsx2fKIkJVuWIjgnkxE8R
         1AuxPLvBU+9IIbpja5XlsEECnoJH7dyvX8rIHWla8r1ONtRhQM41fog3u7829aq6hhjW
         ZP8XAJJGYuJP65JvGK+1BPDN8r7aLnHwMwRyKGAhVoQuHLrfaoJ+7pcMA4jeTGB5lwH9
         jE4rIZ7kHX9fulDRRafRiV1P1vAttv7q7xHz4hAJhUZUhoWku7yd3SqAjAOtYAbxQvtY
         I5vO82qjUOu3iJLfpR5CR/8yK/9Nq636UomEiWVimMA9eND39IHBLjVCB0IwLCW/RauL
         kSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x13aPp24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si6042801ybc.170.2020.05.21.11.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 11:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x13aPp24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbqPb-00073x-1D
	for alex.bennee@linaro.org; Thu, 21 May 2020 14:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqMu-0004Pn-GR
 for qemu-devel@nongnu.org; Thu, 21 May 2020 14:56:36 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqMt-0004ep-79
 for qemu-devel@nongnu.org; Thu, 21 May 2020 14:56:36 -0400
Received: by mail-oi1-x241.google.com with SMTP id x23so7133369oic.3
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TF/4RMNyI5qjXnX73kTH6e164dARfUFpER4eJwbwepk=;
 b=x13aPp24N7diruopnilbK14LbEKg+qUFvVXyFPZtSKlRVaelrpa1LGdwgWd1A4OZDr
 ewHTubmW4VbEqWXZOGNEj8UjNBTyKMCP0r3QkqAN6fVWrhiWyrgUv5VfegaOvnNHFZPu
 Sv9AISsNcu2I0sknLgXgTK2/qhCh1FG/89ISw9c/uMKuyuO1dkFVilkXOilPutz9eaCB
 sc+A3Ks9KoEaDvEIGAEgwogPWhqc494cZVq+LV65QiE+KkaCDgrsR4QDD3gdROAJg06q
 9YNC3vWCRAWASOK05glsCJ0VIoEk3HKcg5J7PIW4BZMYuCSfeObLtsZUKfeUIkjnkns3
 GluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TF/4RMNyI5qjXnX73kTH6e164dARfUFpER4eJwbwepk=;
 b=myiHZVWmwE3uvvRqLoj6o7H2Bo3ElUnLbDtEC3K+tV6gV4+b9EJf/tknkiFC3JNxWH
 sE9qcwiqlwTnaJvQHh9dTb8A/ETjQdzWo1HWvX9sFPLPAityEp0ttnh2oYb51eGXpf9U
 8Uop6l4WE1F8aubZS2FH78SjS6rLrpvHZcGZQMvhe9qyORmblpGzpcR2tpWaEAYDjKlL
 C5okRVqG51n7IWJ5uxZMIrGQcv7zSvuciXITCV4eV3E2JG0PMXBCGCRh++oqnbAx0UDx
 O7AnXj1qBIg3LH+fJ9Y+5gGiy5NCCn9cb3/5sSFPWeJrTJf1jS3E96C2s3S0N0vgSic8
 V2IA==
X-Gm-Message-State: AOAM532WfosDPbMs0OtBzk2iu3hVMjgD5N7kGY5ICDuD4pOkMcAUvpjR
 pHhtJRr3/nzS2H2WAOUQr87cMwyoyjziK5IKhrMjKQ==
X-Received: by 2002:a05:6808:6c6:: with SMTP id
 m6mr6391567oih.163.1590087393845; 
 Thu, 21 May 2020 11:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_i=HsBtpJh_o4+NWNeUihvNTccfB67gs0WrXttYdTc2A@mail.gmail.com>
 <20200521184923.19360-1-e.mikitas@gmail.com>
In-Reply-To: <20200521184923.19360-1-e.mikitas@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 19:56:23 +0100
Message-ID: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
Subject: Re: [PATCH] ssi/imx_spi: Removed unnecessary cast and fixed condition
 in while statement
To: Eden Mikitas <e.mikitas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m25Q3bJy57SC

On Thu, 21 May 2020 at 19:49, Eden Mikitas <e.mikitas@gmail.com> wrote:
>
> The ecspi controller is supposed to support burst length of 1 to 4096 bits,
> meaning it is possible to configure it to use a value that isn't a multiple
> of 8 (to my understanding). In that case, since tx_burst is always
> decremented by 8, it will underflow. Sorry I didn't include an explanation.

Ah, yes, I misread the code. On the first time into the loop
tx_burst must be positive, but this is a while() condition
and on subsequent loops we might end up negative. So all
the code changes in this patch are correct, they just need
to be split into two commits I think.

> > This seems like a separate change to the first one;
> > in general unrelated changes should be each in their
> > own patch, rather than combined into a single patch.
>
> Should I resubmit this as a patch?

Yes, if you could submit a 2-patch patch series where
one patch is the fix for handling burst lengths which aren't
multiples of 8, and the other is the fix for saving all the
data into the rx fifo rather than just the low byte, that
would be great.

thanks
-- PMM
