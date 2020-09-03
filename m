Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp759633lfc;
        Thu, 3 Sep 2020 11:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNU9UCL6cXCxJiIldqpm1xQgWt5zj/gVzaDmx0yR/BTSDiiFjkHSwiFi+CZiERsTNyz+X9
X-Received: by 2002:a25:8b09:: with SMTP id i9mr4913324ybl.149.1599156940629;
        Thu, 03 Sep 2020 11:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599156940; cv=none;
        d=google.com; s=arc-20160816;
        b=GcsC9DVTo6PmrWzNqXWA58MH9EYdNJUWcjn/pBdD3hhqFJRsfe1FB7JV5FCzrwflGH
         kRv0LjH7vnnmr+9C7VyXqOWiGbNUD81w6p1TZgFLdW2rf3batg3E68Etq5/VmgixAS7D
         FPqFeZ8uL2oICxyLBVILgZQSFiU6v9xEuUOka7crenazAR6k59iFf08VE6WgkRM8nHp3
         hUsWjTEZUqizq/IEMH5xdaotv20ARDCEODNF/FMU5TE47zf38B2a3KpK5/uU7hYhBu70
         VA6QAfV41jyCuvpDrseqy9PpoQ6/kvcPHmhzAXsg2NNmPVCdo32j37ki1kNuFEzSYlPb
         aq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cglZBYp22brb71cVyHQl8NI2C9r/WyDiBlXJEAfiZhk=;
        b=L/QUR9JcxSIRlg0y/L+7y3KFN2j4FIP2qBXIV/EpwIpNPt0l/gdW+EIt5fhh82G5cC
         iEwTzou6BA863u0DLTbDEciFVS4fD8KbcqYnZZLsDSQuZsRfqRsH7FunwCWkZ1w6Zm4O
         eGXD8CPIlDNnIpC9jTE6XchIYLyBSVsYP07z0XALOQkKhZ/FXbhOtulEJm/JfVNCS9Ct
         +/fJU1SiQXhuZlvV0TQ0HrE+ALXZL+sl7tQgqOX7oNXTAyTKelRz1P6XoMyYH7B+1PTU
         qA5nFOUkay+mkRuhb0Dhuh15eOgrbPnSnC2nBzY69Fxg3j+saG8HHq8XknGCvXxvo+bX
         xIHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HITvIk5E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si3852485ybb.447.2020.09.03.11.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 11:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HITvIk5E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDtls-0006pU-2G
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 14:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDtl0-0006P9-VK
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 14:14:46 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDtkz-0000kA-8F
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 14:14:46 -0400
Received: by mail-ej1-x643.google.com with SMTP id a15so5099009ejf.11
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 11:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cglZBYp22brb71cVyHQl8NI2C9r/WyDiBlXJEAfiZhk=;
 b=HITvIk5E1wLto5P0odp9by/nT8sljBXRVu8Ns8IpWs7csYLpVj24F8yhv0zGh9sbPR
 Hn5jebKZC3eCsk1rMMtsKwzLYZ+4ZD4uyL39m9aV3gaYaW0VQfq9P5Vyd/5I9SSUkUSn
 mJ5tDLFk+7R45lr+x9t+l1lHvZ9UQkIjOMOWLYzzfxpIGFDRfX7QzqrC2hN7LIYxQ+Nw
 EyUS+aZYLy0uQqwMBIsrqAvwtv0RZYPebkNqmb4tT38+ExoyYRg9I8C6A2Mbxp7V7kZ/
 Y4XvMHfYo3Am2++0YzvssYwg0o+IRyyD0yjJuHz3ZhZHJgezHj9ZE5yrPbehZwCLPC+a
 14Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cglZBYp22brb71cVyHQl8NI2C9r/WyDiBlXJEAfiZhk=;
 b=jGFVr97cRyDvJWN6MWD3rlWOeh30bkr/pQz7YZFsXKraNRN3iwZNDnvnxNZXfLlqeb
 L9eVLLV5imcknIySeppQYVcVp2mU9q6RTZIaUqJladM60Zs3+YT6pmhzylHLTaKVjf38
 8uQ0wOa+x8E+mSczsGZaXNDP8Tu3lToqCQGYdVC3tq4Jlp9FP/h3LZ56Y2gEi3IBQnV9
 nyLiFMCRFQxS7GhXXGRww/OhZ1aTs6ctiwh7YIdXW1JbchWA7ziCmtg2fDTgGXgIrUeV
 TGYV+U7ubKtL62lGFru6QY1cZt7iJ7RWo9syPadC1pTgR7p2s2Ge/JBMiFEW201lIvQ0
 jvXA==
X-Gm-Message-State: AOAM5333ixFsLSOrLf+5COH159KVj9oCj5b5jejaAsjEW6hsgWpO0vWL
 h38PqyCGL1aKRN8x9oEMO1c1eCkpPXwPMwdRLyhcBw==
X-Received: by 2002:a17:906:71c9:: with SMTP id
 i9mr3357986ejk.250.1599156883487; 
 Thu, 03 Sep 2020 11:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200903133209.5141-1-peter.maydell@linaro.org>
 <20200903133209.5141-2-peter.maydell@linaro.org>
 <d4329a97-d20b-f47a-ddca-cc42cb190ee7@linaro.org>
In-Reply-To: <d4329a97-d20b-f47a-ddca-cc42cb190ee7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Sep 2020 19:14:32 +0100
Message-ID: <CAFEAcA9g-EZpqj2Qg4izL0YhteJB+7MiPcKWtO3QOXjn3a6cpw@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Convert Neon 3-same-fp size field to MO_*
 in decode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2zEqu5Bt21EU

On Thu, 3 Sep 2020 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/3/20 6:32 AM, Peter Maydell wrote:
> > I wanted to call the field %3same_fp_size, but decodetree
> > doesn't seem to allow a field starting with a digit, even
> > though it does allow a format that starts with a digit.
> > So it's %fp_3same_size...
>
> Odd.  All of the names get prefixed, so we don't have a problem of a digit
> beginning a C identifier...  I can look at fixing this if you want.

If it's not too involved a fix it would be nice. The failure
is that it doesn't manage to parse the file, rather than
that it produces bad code.

thanks
-- PMM
