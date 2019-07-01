Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2533417wru;
        Mon, 1 Jul 2019 04:15:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIKXPJYQNf3X00Lxx3RaqR+J73SWnEr5EgJzg7GaD2G4JFEKH5IeIvtMeiOcIEm1AU5LCN
X-Received: by 2002:aa7:ccd6:: with SMTP id y22mr28390292edt.274.1561979726448;
        Mon, 01 Jul 2019 04:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561979726; cv=none;
        d=google.com; s=arc-20160816;
        b=qeA9S5PNZiE0iEn1GfAnq+k14eNykQsyBzx+E2FhG74GJ/ciLxJNKgsLnnCqulV20x
         mKaWzWp3X6cIXwXyunYKaIySrcR0qn1kO6KwMG4XkqBR6xzwfo7EezSv01n3S/crsvNl
         /N4bTL+N63NP/CL/ZMGlVfvaQa7SybkCxYz29ADbX6hQIh7aQAAvXsldV36aHqc13VHf
         uCePRikbCkNGOozkPerhw9EHs7FVvpHtaKXwC1V+ij6KgWvzFKUKNieGhOyLuqbC66D+
         1JXCRbxhSIibeZ2nyuiyW4N4Ec7WddZZRirpCDqNjxEBxDR4HOGJ6j7Lu7ZgiJiHjvB4
         ShEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=7MX/hj5TK7ag8GI2yRLSXkbgTmJI0D2UVT8OqLP8rpc=;
        b=rbdIRXYxLszOaVZYgGcd43r1/w4jOBi3W3Ky0BhgS4HqFDE0eFLMi//E04c6/amz9m
         s/xACXjC9oecPJrT5qi27OY8s0qXzhwQA0aoIm6iOTv20CYibLiWU4RP/1/5ARZpdvzI
         19a5+JjvEcv3vCgIC6G2pX3TilfGjDFDvqwd38O+yEwyQG4oWc7OUlNA2gQu39uwYQzn
         fp/zwWjjWUWjqesAYLNrFpQbLPKPGTR3IXtWkMbo8no8q7x9fanbilrNSHvMqTWx+1Rq
         eoGpQ+SZY9fF8mhrWecADmiVMi3oLgM7pWr0SkScxYbqo+EGvug3kO/R+/q1jRsDZa4i
         LDvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KykoAqhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si9294592ede.393.2019.07.01.04.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 04:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KykoAqhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhuHN-000557-IC
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 07:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuH4-00053s-7X
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuH3-0006V1-AO
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:15:06 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhuH2-0006S6-Oj
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:15:05 -0400
Received: by mail-ot1-x343.google.com with SMTP id e8so13041591otl.7
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7MX/hj5TK7ag8GI2yRLSXkbgTmJI0D2UVT8OqLP8rpc=;
 b=KykoAqheP/imSW8/lCj4fjeOOLEfodSCvbUeGc6YXaN6GeVBq3Uas3agCfbMe+q1/L
 A87oADZgYeHdU4SCRcrADz3aXlxmqObgFSCaSzM1ydgHdxIovJWEFd8ipzo5EiZyB6sR
 SQnmINxiBkOrXqfANvJ21W6fPFlIBaNxkqI7AmHkO+EApWNiJ8+ZLL4kN/XUXdqGX38v
 6u9ajbcJCAlZk5RKFx3Jgt5R++Tm5jsEueC/XrJKYHogqPY50Bh+SIuLVrTvN3kUWeOH
 SSp+0eDNXc2UUs8kLC8d4VxJF4Ruow329drIYafDLCiaFq7i0VLxL1utVJFFh7LOVbkC
 V6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7MX/hj5TK7ag8GI2yRLSXkbgTmJI0D2UVT8OqLP8rpc=;
 b=kd2lNHk4yX8lcjxCAqfTvUI0s1ydvHO/NIsgRDtYpSW2SdCt8bRB7fucDDY/k4j6P3
 VzHpA4EsS2QjhSt8+RNifLvW5A5ngC9Fhd27kHnfTEFCpviOUZ+XzDLjx9HCt/plvW5C
 Yu5j2CIBF5FGz5Z4/vEGXI4xWzAz652zJhALUL2yOV/yfhQzxf7u3ltlxwYg21MccFP6
 7BPZMFohlLkA+UhjqnviKRdDtqFzvttweVPMM1yaGpb6jqxU+T+oLle4z/lBowo/DSMh
 hn5mJ3Mix0KZionmHGkvtsUEBsV4Z038Xkr7UN6iImwufP5On/U74cZ1FKKvEJMpU8XR
 sSPA==
X-Gm-Message-State: APjAAAXVsYClgD4iYR/0zcsvumfk1YcTqaWIt/eC8YUeI8LHF1DlYjYP
 bwJ0gk+ed/5WwbQRNZuS7cZBO8QyXWlSqVrC5R0L7w==
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20089151otk.232.1561979702586; 
 Mon, 01 Jul 2019 04:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190617160136.29930-1-philmd@redhat.com>
In-Reply-To: <20190617160136.29930-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 12:14:51 +0100
Message-ID: <CAFEAcA_2QkVDGaVUtn_8ofHcfuj9Zg0RMq4a_YcGKmmFJCu5zQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] hw/arm/msf2-som: Exit when the cpu is not
 the expected one
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7zu7y2MWdYtC

On Mon, 17 Jun 2019 at 17:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This machine correctly defines its default_cpu_type to cortex-m3
> and report an error if the user requested another cpu_type,
> however it does not exit, and this can confuse users trying
> to use another core:
>
>   $ qemu-system-arm -M emcraft-sf2 -cpu cortex-m4 -kernel test-m4.elf
>   qemu-system-arm: This board can only be used with CPU cortex-m3-arm-cpu
>   [output related to M3 core ...]
>
> The CPU is indeed a M3 core:
>
>   (qemu) info qom-tree
>   /machine (emcraft-sf2-machine)
>     /unattached (container)
>       /device[0] (msf2-soc)
>         /armv7m (armv7m)
>           /cpu (cortex-m3-arm-cpu)
>
> Add the missing exit() call to return to the shell.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
