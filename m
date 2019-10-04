Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp407882wrm;
        Fri, 4 Oct 2019 05:57:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7D6jHco8pIj7Y24tTLITzKwVOcfQeAjxVyXT2UZxHdumZBzdPRVJqHJBFMpNn6BzKG1Q7
X-Received: by 2002:ac8:368b:: with SMTP id a11mr15294546qtc.47.1570193857592;
        Fri, 04 Oct 2019 05:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570193857; cv=none;
        d=google.com; s=arc-20160816;
        b=rZOTQS4cUH9NzjwvVxEGRHVdtVyeuHKX1z7aPicDTkzXuQX2HMp/e1zDtW/ixJimVT
         Nan6RHs87j9vLHmX5MN8RJO9HjUW9nTcVUacGWdOwUbH/SzeW92trtlcxri960eK4Kq1
         0H987bKsseAAlu5ZvruKuCYhnstul5jpnoCdizVOw/oA33xovdMtha6mKmrJehO/eJA/
         hu9DQX5R239dvyOr04xZenw4UOCscbwZ/1pjenUGQNvGG608nJKMTbgqt4mF4J8B8hhW
         Cc8hyw9tG5rd3nhu+iCQmH/t6/FSbzVRpIOltpLuXBbQkKpi/glS4NCzHC8nEamqDfAq
         DgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lzFLDutDd3xKc+joycTl8Y9n3aqwAHpCYR6FyyAFLh0=;
        b=GCrLhv9VVtXPO3yrmgZ3CkQ+ZaS8PViyBttsbPcD02E1QrzSJTOY2w/eXrUtOGuiPB
         gvb5pP2Rqara7Aij3VQEF8WDYngYfNsJvTTukLI2czRslVIOZg+7mlwRMVSCJ8xOpx0D
         VKzHO5K7e6XweOpi+QFCS68k6+UkeB8miQjMmAlShL/TVCeBD8yBok+8rRd+Fl+Lf5ft
         3zPCkI3ekD8CfQrg5Y0zi2otN+W9/lXetW46wyU+W1p51MVTxUxSgDNVP6MlizAaBSAn
         jwngUwdBk4kCzoH2iCsQydvrV+s81oGZo9I19KIg4+r9eiZaEV/mx6n2qtWZkHcqmRn6
         Ug2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pZCDym94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si5156050qkl.129.2019.10.04.05.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pZCDym94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGN9M-0007Up-7x
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 08:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iGN8n-0007Fk-Fi
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iGN8m-00081n-63
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:57:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iGN8m-00081K-09
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:57:00 -0400
Received: by mail-oi1-x241.google.com with SMTP id 83so5688026oii.1
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2019 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lzFLDutDd3xKc+joycTl8Y9n3aqwAHpCYR6FyyAFLh0=;
 b=pZCDym94Ecm2FIf9CF6PVwvIqQ7Bz8KUORI5G1H1Si5V0ZZ7FvrNBRYt5IGrqLMdvT
 0hdDWfR4acBgCPyB41+uGWxJTcgCdp24aajdISb7ami3799seMGr9BUDsnY4jWjQNGWh
 mfwOF47oLQd67ZO5whttc8biowucdgKOzHfY+sik62slGMjK0fGdP6wWaWJiXHSvLqfO
 K2Q4cJyL+EwyHEgTolfEKc0JT+uRwrP2ZGu305KKlB213LXzVxpReZvB9mROJRSkkxeV
 YSD8afu/dQQKpF7iyLgG6tRN6Kjn2TvlRB+IEGU0wNzVtDD6ThXHQ0rxePWRL0RVkVG2
 FsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzFLDutDd3xKc+joycTl8Y9n3aqwAHpCYR6FyyAFLh0=;
 b=LjcM941X9nrBX9M4yWf5okjrdX0vc6laWLDeC8P66+xL18HakznvjA8mMB8wTPYh3C
 aT7cCKZolUo2/XzGT6A7NJCS53mx9no3CcMu3VBMDPYQIihJVlUfnyX8QrGV9S2pvPET
 6VQ0UHIHq5G4M/5ZThxI5J/GEb/SNbT7/vWrEf+CwpfUN2cQn0TX9LTF7dudBVXBmCan
 09XxvxP+Jk7htBU++z3RyI+oTXct4qOXtKEvi8eMqF4hPigPuRkvbzL8rlVvCfD8wvB/
 N6LqePgP839vF5E8x2mmEDhGjAmH1d8Fwn2BOoqM2Cq7nPSi1yKZ4Dq1Dw3NdrkgGBNh
 2RDQ==
X-Gm-Message-State: APjAAAUC7F+Do0h2OL3rQ4jZtkVQzfYqxT420Jh50Qs170RvzK5Rq1zd
 zlGvReEMow71f08/VQS3uxYnJKDIQBbKBRBsiijVdzCEMyo=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr7212586oif.98.1570193818860; 
 Fri, 04 Oct 2019 05:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191004114848.16831-1-peter.maydell@linaro.org>
 <20191004114848.16831-4-peter.maydell@linaro.org>
In-Reply-To: <20191004114848.16831-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2019 13:56:48 +0100
Message-ID: <CAFEAcA97dyR2_A72OgfJ6M68jC7Qv+zat74AobPUGNi12RWxLQ@mail.gmail.com>
Subject: Re: [RFC 3/4] ptimer: Provide new transaction-based API
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: addvMIa0rSx9

On Fri, 4 Oct 2019 at 12:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Provide the new transaction-based API.


> +void ptimer_transaction_begin(ptimer_state *s)
> +{
> +    assert(!s->in_transaction && s->callback);
> +    s->in_transaction = true;

As I was working on converting the ptimer tests to the new
API I noticed a silly bug here -- we should set
       s->need_reload = false;
in ptimer_transaction_begin(). Otherwise one transaction has
decided to do a reload, we'll do a reload in commit every time,
including when that's bogus (eg when the timer is disabled)...

thanks
-- PMM
