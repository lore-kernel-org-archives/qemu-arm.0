Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2773635lfg;
        Wed, 26 Feb 2020 00:42:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzK2pkTCotA5vNhgk+YNjNaTwWNvSwHtD+Dws3lgco+STEDL1bXbjL4n4XJNv0ZEnRnqsVT
X-Received: by 2002:a05:6214:11ac:: with SMTP id u12mr3863655qvv.85.1582706521757;
        Wed, 26 Feb 2020 00:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582706521; cv=none;
        d=google.com; s=arc-20160816;
        b=NUfedt+4c/QkL6spbtFDnuTCupgofPyw4GBZLYXjk94xOki0hCTkUdjuQO8x18SdOl
         M2GIbSaRmYnwBi+WwhZlEOZ7Q5ItW/Xi6IkIwzl7mBj5WS7ra2YzP8niBxQWtirpEn3C
         xPvQqM3JEKuYAVzVI0fcqTuXJPmMDcdcNlsQWvFL8iT8b5kS3vwQw66KD/OLjedNzPZB
         fhjYV2iKyK6/9m88A0V+B0fw0k1b+zmrY9IIhrPq/GonJv4rS6T13BVN54evx+reNf4+
         0cqjW7PRrU0SaE6Efnm4t+0eCn4t/M+L19vMee2l0MTE2uz50th4A5sYYfbJiYjV3qaK
         aPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs4Gx1l043Wyd/UJbyquAHW+qxU1Xk/fpYPCsw+P84A=;
        b=PzzaoW2E/LMxJwpIjDBDMLlAdwdxqWdjpGUT43CUHOmkGIe1bdOi/Q13+i9hV9lbMo
         BtvovQTGu6KLkPJTLCPNYRuEH4opBT5b1wjWtcdMdqad9r4OHX3DyHLBb2uVlmYX5gwm
         p3LjtKT14kUeujKaaU6OhRjgs5WOyhh4lznpmVbac2ZfSnjHo9mm7Y1GGkgif1yN3N6B
         rlkGEMgTrXeAeM6EhIf/9Gmu1PQSD+eyeX93mAtVcajFZdZp0qTWKNQObmX7RNZYhsp1
         SCG6wT+hu5UaQNIC2XdZYnQaEBPuxUUqIhAdVTO0I9/uaVr9B+CAYbKGA3EHx9uhAMqJ
         pnGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWkp1KTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si596641qvn.162.2020.02.26.00.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 00:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWkp1KTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sGX-0005cY-7v
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 03:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6sGQ-0005cN-O6
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:41:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6sGP-0000zO-JY
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:41:54 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6sGP-0000xy-DU
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 03:41:53 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so2237752otq.3
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 00:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hs4Gx1l043Wyd/UJbyquAHW+qxU1Xk/fpYPCsw+P84A=;
 b=aWkp1KTGswB2Vp1Z0Lrwsg4y/Z02IysxAue2exAaKNU7dIUxCT4qt4WPVs6PtTGxnq
 ixlzone/dBZI6F2lEen7TyldV9Be7H4k1UvgYXKLuq/o1cIKLAxXJGdPO6wDF1oqWuOS
 kt/V6LzwC30VYYwMS91c4gFoyIwxJ+xLCP1gsGxQYbDFMRbDc8VDzJo8qMcqHBb93x12
 E+NuNacoW6hs6bP3J5vN6xZNjUo72rix1s8KXjDzCxovS252/qyjzV63Ihsb3rFXhdH1
 n7A7nr0sHUANOqGUWnHnP9L1lEJqD1zN7hecYYfAQz8wzT/pqNJ2AmXr6qD5hh/3Gj2T
 kDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hs4Gx1l043Wyd/UJbyquAHW+qxU1Xk/fpYPCsw+P84A=;
 b=JZvmYxn8oxMGKzZ3Oj6OfoimdXZsCW2RG8MVo67UZPnR+98cJZ6w090K71l9h6mecZ
 9RzajuZNki3/R19/N2oxl/1sSf0R9GvI7EoLMn51Rxh3hgsZ7ZfPWVI9DUu8OcGRVTWE
 ltB5CGdm5YQjjzmpZCuc5tq9kevtByKKhUgu/b/l7M3G5VnIr28J06g6Sii60HxM4p0l
 Gg2BRsBVpHjTXu8qXxTcSHbYfuWujYphSdHterg8ao0syDjCFzOF26PAuKVDPMIjcoke
 kKxn0hGUDYgRJkiessVkSaVPUKWzXVucmIu9o5F88GQeCZQ2f/8UOgs2SalY7ZbK2gd0
 HUhg==
X-Gm-Message-State: APjAAAXqjX9S9zwj7UlvYKDQF50LNwP2oRmrRllM+uV93yRvYjgC2k04
 DxbQ/bGz1/jAaTFITKO8QJmE/hxmTpcrlon8fxVR+A==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr2097178oto.135.1582706512565; 
 Wed, 26 Feb 2020 00:41:52 -0800 (PST)
MIME-Version: 1.0
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
In-Reply-To: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2020 08:41:41 +0000
Message-ID: <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
Subject: Re: Sudden slowdown of ARM emulation in master
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nDE916RP9tBZ

On Tue, 25 Feb 2020 at 23:08, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:

> Just now I was working on some small fixes for the cubieboard machine and rebasing my Allwinner H3 branches.
> While doing some testing, I noticed that suddenly the machines were much slower than before.
> I only see this happening when I rebase to this commit:
>    ca6155c0f2bd39b4b4162533be401c98bd960820 ("Merge tag 'patchew/20200219160953.13771-1-imammedo@redhat.com' of https://github.com/patchew-project/qemu into HEAD")

Yeah, I noticed a slowdown yesterday as well, but haven't tracked it down
as yet. The first thing would be to do a git bisect to try to narrow
down what commit caused it.

thanks
-- PMM
