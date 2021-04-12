Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3764631lfr;
        Mon, 12 Apr 2021 03:12:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqNzfWfbx72fEzpzXp4+O8CEWjvNqjj9UQ9sSzrDbwzMXuN30lHqWqVhR5Tso8cOPBef1C
X-Received: by 2002:a05:620a:1432:: with SMTP id k18mr18975689qkj.151.1618222339005;
        Mon, 12 Apr 2021 03:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618222339; cv=none;
        d=google.com; s=arc-20160816;
        b=If2thAOx35c0Oc3ARxiHF1ftFTtYidvhEnVx/bfh3596oUcVCqOUYEkcK1IJ1UvvrO
         kjq91vb1u4DaENHa6qmRWmqvLba/uBbQtwT7cbzCRtZR59Bfl7oy3wn/9+LTiBg6j1M/
         Qz5D69oom2jyaMuw4S96To6HsFUOC33zqEDwLGH/BnTbgkAUKw1nh1jcQA8lC0kBd/Tz
         bbfAVTB0UvugUtwhNVHmzwXUcsdmywLr+Sd+oIxS4uhITPi79gAcde8wrNLUWfu5q/3u
         0RMOx/samrLt3JRj50MzoBAkSrRkBo/kZLXQlPDFszfjC+OCVanUOuphfH12iYvOy6gN
         wGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPbCYU/SQDrf/1IaN1D+mG7hmp0BDoP8V9K713/va9w=;
        b=LYaHTADepjfPW68S6DzkMgCDSubXd9ushJzqliijD8jVFVg0gkZ2mYxhpR65ycDkhg
         p3zRzPu9bbViSLQwze+yQ2vnv2LzxFs85YsdJlw5f51v0S4HFfoaMuRqYXYMJw4obKfK
         5/FjELM68R0ZKSlsNE4zxXI+BXbXmf74RZnO65vwAbE4xnJ66xzJ8nOSdgX1CsIzo3Yk
         c24nJNFkmrYe5t7/j9nDimZdtYDJWmvKlW7GuHzJLWbxB2jllF/sJw7fw5/TXNf4JWh8
         wfgRNjq8QjGGoMBzBTn3vGV1h2YQdkd1jIu7TN2qfzMWW/p4KqdHulpfKOD4Ov7hp/pj
         wX1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3CwNVZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si8665978qko.30.2021.04.12.03.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 03:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3CwNVZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVtYI-0001LQ-Ae
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 06:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtY6-0001Cf-Gb
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 06:12:06 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtXy-0005dD-VZ
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 06:12:06 -0400
Received: by mail-ej1-x629.google.com with SMTP id w3so19336938ejc.4
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 03:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPbCYU/SQDrf/1IaN1D+mG7hmp0BDoP8V9K713/va9w=;
 b=b3CwNVZDlrqnvzDIfvBlmeRkJJLdwTyEWQ1YRfljm24ImzrPKVLdyyzyasoUFFpktq
 Ix5WX47a0xFvcMt/b/tLO1vqqixz6YCVVyw0RQYg8NojjHszamrOTNq/mH7mWw0TJLC6
 oZRRZshK/sIfA4889qacluPP5L/Kplo2zu2ShZrVNgTRD7P4iGc15SAQXeybKL3Iuo1s
 HRMbMEp+ZQUmExXk+5xbEIWR0rUFihnt/JAbM31s6Wkj6UG6gDnYd2efjdXy5MnAenQN
 bn7uGs2e//LEdT0nWx4cMySLhrBJS7NX9BGEu7GY868OAVEYamzwzGZNv4z3CIe2XFsT
 ulpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPbCYU/SQDrf/1IaN1D+mG7hmp0BDoP8V9K713/va9w=;
 b=DazEmArzqUe6N4L8SN9aET9DPp67GMZW46Xra596dsFVEn5gTKOL3kAARzALdf37yo
 34IP1l/S1h+qsBSupZOkgewS1XmvBZ/X6YbnaiycuTMMZFrKrkbG7YS/7c92tS9D0GVJ
 T0H0D2E/uSeI+fLnpsBernSbsiqqcVLoJ2HJAMyxqgK+t5pS0ZHBBywYlkWsaOHPqmnt
 cLoJo0mEzhtw88/W2S2LnfvNlzD7kT6QSo2NKbbKc3qORcG7ygCVrdYOFSOqAhLSnVY5
 GEw52nbKldD5QLUiF40RXZAGxQ9VCWtyy+CDYRkonfjkTQF5HTO/eN1XLnNMP8L35cLd
 N59A==
X-Gm-Message-State: AOAM532FQEliL55i8Q6s6cBZM8kk/dxAmnKbTOZsmWnefWcFpnZMpxML
 3BS2ZAzh/VqylplfqJDNNoQQcCsFG6EekXrJq8+W9A==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr26396427ejh.4.1618222316058; 
 Mon, 12 Apr 2021 03:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
In-Reply-To: <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 11:11:11 +0100
Message-ID: <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: zUkIQGD3qVAB

On Sat, 10 Apr 2021 at 16:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> I do wonder if the right fix to that would be to make TYPE_MACHINE
> be a subtype of TYPE_DEVICE, though -- machines not being subtypes
> of device has other annoying effects, like their not having reset
> methods or being able to register vmstate structs.

I wasn't quite right about this -- turns out that machines can
have a reset method, but it is a weird special case method
MachineClass::reset that isn't like device reset. (We use it
in a few machine types; if implemented, it is responsible for
calling qemu_devices_reset() to kick off device reset. Probably
MachineClass ought to implement TYPE_RESETTABLE_INTERFACE
instead.)

thanks
-- PMM
