Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4203597lfg;
        Mon, 28 Jun 2021 10:40:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSI5rHT4L79RmP/fufVrN4RqoDb1Ebz4VVufynv/diVMmHjtm/G6wf1oZLT6c+b4KeXmJf
X-Received: by 2002:a05:6402:18f6:: with SMTP id x54mr35568356edy.53.1624902029544;
        Mon, 28 Jun 2021 10:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624902029; cv=none;
        d=google.com; s=arc-20160816;
        b=RHe8guNvLyJIdzuxcoGmhotJxa3//q6e0GcxF08lUPg+n8QPGhDobX5kno7SLl4vXq
         g2vo39GvWI1w75KVcuOB/ptVB04TR4YZlGGo031fFTRWGigtnU+LnDqcLinEZmC3gOi4
         lV8/YplI4BAHZu78xBF6RR1sk6r4T0iZxehu8vCEkHyt3AeyAZgSKeRG7x15gko+yjTN
         axx2uNS4jMFhH012BKPKCzKSOWdv03HbHRE77uaSwKKvQ2nKitdIuOMODiBWKTobiRVG
         JHpCB3isakYzOmIYC9ef7BApZJggyt8wnKWrDLOgH64ZnPv8F8Dnwql/HZnaarqaO1ph
         XuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AimPmqRLMwOueQkfSEyiTePKvwH9fQVu0hpd5dYqN/Y=;
        b=MqqScCtlSFUbeSgSug4kHeBf7jSxZ8iUKO9Gu/51HtucecVxQstAgGVqUw8Fk6Xa8L
         tl963zXxlN5vJJItvS6GiPQfYhc9p0gX9eHqLSbbfqQneKjXswJsFrtAnPkdszH3/XNo
         sqH169eRqK9zczX9GVdmDf/WZ+X0IJyg/5pLKmL1fpQru7gm/rEmf14YjznDfhdJgaxt
         z9lR7xKSOS3hbs+RMI9He8TA3mn0lTtzh5tjZexX+5Mdmk86ZvJI1EUn+cQXGpnovdiH
         bX54ngL/PV4zHuIvYks27YfFrTBnVT2H5kYqvKXYMne9sdI6ddVkAvhlmYMagQe2XOsK
         J/0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="b8Yyq1a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hq27si9086929ejc.456.2021.06.28.10.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 10:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="b8Yyq1a/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxvFE-0001OE-KG
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 13:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvEx-0001Ln-IG
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 13:40:11 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvEu-0002BC-UL
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 13:40:11 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hq39so31305403ejc.5
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AimPmqRLMwOueQkfSEyiTePKvwH9fQVu0hpd5dYqN/Y=;
 b=b8Yyq1a/BGI3r5X6j9q5zfthU4pCNLWXJjTtzfY7LkLQDD2Zg8cjK/SXlDopbGvrSJ
 Gg12BzNSsddde1ai6esRk6/pmSsBKKyboaBk/mE6q62zsvCt4YMxf9C/C2wkOtoZyjBV
 2i7YbOWIY0ylpSg1WhVdwV+Obym8mTKdpz6bUepk0BOSY9Tc69EFN5NKksZB/DG4co+C
 HnwHtZpblVUrBZ5eSWNYFP11sP+iuzZw2LnVlEe+rCVmeZ2jSi4SsRzY7ePn7I6pVhWW
 FJaFL0Cf5Ngyw9+VoSTyOejhLTqGKxOdcofnlu6s8q4K0oloYxDZ6zvPmnCozPxNGbZI
 IJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AimPmqRLMwOueQkfSEyiTePKvwH9fQVu0hpd5dYqN/Y=;
 b=AXe23yzLo5XRHnuHkTzNUBdm3USSbYPbKx+X7BlUBGlu5jirSInqePQWhBzlUfpVT4
 HLADhNaxxYUiTvWVin4eZ0nzNCMYoOr+JGIODTIrk/7swCVE1a6ADQqcU86ya3+O4W39
 EWbeHKOSjSS8KJ/jxBjQV/1TE7GzxmJuTnr2yGaQYiWldE77GwJ9oe0RUzdCrzX1Xc50
 2Rlsj9+bZOBpvDiaLzAEjkvatpd3TYo0xRm9saobZ3bm1v1BB2rPvGW7iOXvHXOJHUo9
 TERpQdTltRW93/oHqRurFQ2nvnQQichUUx0Kjqc14LaAQEkErcCH7sNyFlAY5rMgtW91
 BBuw==
X-Gm-Message-State: AOAM533PJx/uJ7ez3mBcQXVdvc/oM2Es1l4OUuBB3f72DZ8QUTIqPsHz
 6dErY7yrE4BvY3EIonJ9O/UBKbNxJN4xuj7OWZr1kA==
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr25625346ejc.482.1624902007115; 
 Mon, 28 Jun 2021 10:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210531113837.1689775-1-f4bug@amsat.org>
In-Reply-To: <20210531113837.1689775-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 18:39:30 +0100
Message-ID: <CAFEAcA8y5-Bs4+_2Fg_0bezBsdJhODrV52LFXLytP-P0-fFJuw@mail.gmail.com>
Subject: Re: [PATCH] tests: Boot and halt a Linux guest on the Raspberry Pi 2
 machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Nolan Leake <nolan@sigbus.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jL4VkuGECOcb

On Mon, 31 May 2021 at 12:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add a test booting and quickly shutdown a raspi2 machine,
> to test the power management model:
>




Applied to target-arm.next, thanks.

-- PMM
