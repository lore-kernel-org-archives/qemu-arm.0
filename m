Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2217900lfq;
        Mon, 14 Sep 2020 05:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTORg5FAiLEnLKu2h54kzJrruDsEvqSLPl/+sPM71bpEqDnHY7Tfi4kL0sS3Do6j6YkgdK
X-Received: by 2002:a05:6902:100b:: with SMTP id w11mr22190492ybt.43.1600086483969;
        Mon, 14 Sep 2020 05:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600086483; cv=none;
        d=google.com; s=arc-20160816;
        b=TkoVqxzAXH/OAbyeMh0HRm86pgJoNdKfhjHxnnR+accqnlL4IeG0Skgw0Nnkh9p7S7
         6psW9VFt5vmTVs1mNpmqrpAk8W72TmB/5QZGi7x4oaYDAIaDF0EOVn+3B0b2/nM3Fcxa
         xhuRh4cph2AFpYqNlOjKzuKYv8OA67nt+FAMXODd8CEMpIchR7xZCnUEmKijyvmpSJEP
         ixS63VshVmYBLE4Rucz3kHtWPAnX2NOjhroamp2d/Wcz3tC4spj8fg5SPAHvHnsM3RVp
         9TBnMRtRwLu+ZczWpqTr4Pn7BRXB7CZjZGxbhuU7KV0aBb1qBTcMuu33MRTPN/XKQBs9
         1gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4YJvX8r1AGHm4LXtW8381XZByd8RQjFAZBDnyxEbrMw=;
        b=oRiAvGJ+45DwXdjOR6149cBSN8liaf0ArxeRcduTLfurz7qkU51uT2YPL4/9YxGsRS
         JpcgCfIzFsR2XNll59KfLFTS+4fkxIg2OxFVPKlwPwryZS2WByV5jLIkHfAyk6KsDJKd
         88C8tEls29BnTzFHawBGEzhZLL8/Sjzt+R5azr90Z7HbEOvleMiqXfVZbrXM0rJGoniI
         c49t1LpyMF8mV6q6ITD/XLoTCkYU4l/fCDoQ9TjueBf9GF/f0bitw98CSmbJJtOEJlex
         XgF5H02nZrBB98uXU4MwVSbXukEP1PgmSoHYOipwzjpseV+2pWDwVYvB2oorLdrFYYqg
         WdbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FSivjIPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si9662713ybb.59.2020.09.14.05.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 05:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FSivjIPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHnaV-0001AB-9R
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 08:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHnZV-00006e-G6
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 08:27:01 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHnZR-0007lu-3L
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 08:27:01 -0400
Received: by mail-ed1-x541.google.com with SMTP id w1so17404468edr.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YJvX8r1AGHm4LXtW8381XZByd8RQjFAZBDnyxEbrMw=;
 b=FSivjIPsD4WUtqcCSO4DguzznYxJ9+kIIfV5Cg9bSBwXe+yUXLjoe9No43KJx7HaVB
 TWeblfRTuEbQNBfdCRfozLHdlT5Dyk+37AM0B1ukNMeiVj6yfxIw5KeiRE9ihnShzke/
 uOwndNqUmr4IfH4DhFBQCbonEzFmLbYRpzxm1iUWUcW3pagBPoesgNm8KzpUi/yOTaqv
 uatm0eEa2OSX9NGCOU5tK+CywxNFmGuMwEU88t3PEFJ81fGlIkOJilqo/ax4NoBmz5Al
 63BlUzWoBOJPc6gB6dZx6GvaDyN8yclTWJGydDbcrRCMv3xexhdATtJAVq8A0hA5oC1A
 7zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YJvX8r1AGHm4LXtW8381XZByd8RQjFAZBDnyxEbrMw=;
 b=CjDDH2KoZbJNpm7FPzJw1hmzvf9xJBpZgKwEmIC2dqSnfHmfaLHkTFZOuZbf1IQLV+
 EC+1/bu0yqDABChiIa+HFLFg6KIacjOmiKZ2SeFW41TjKziZvpabelhQOqeWgm4hxIcn
 o5xUa36tXrz0Ivb6MieoKwxmBeYwG2mqiaVpPEmewufr7fazQ/ozIklMmH5Wrpj5fJm5
 6/ppg334cI6Sp9b+keSxlNq1RkCacWXzmkxr1v0bML3Vwzhh8XDXnz0UuklU5wmC629I
 Alrkc3IDFGS9zezqftXyQkqv/ly7CEV1uVUeh7rrdKB5DngJyDQxuxyocoirelk8BKmu
 Ou5w==
X-Gm-Message-State: AOAM531AJi5+YTavmhrsMF7qNatAQJ4zqgHVPkhGIHiti3gPyzOIyu/q
 XSsb7EaW+By6Kxd2hKr8yxyFef+/nFgy9fD2J8GmAQ==
X-Received: by 2002:a50:8f45:: with SMTP id 63mr17594526edy.52.1600086414320; 
 Mon, 14 Sep 2020 05:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200909174647.662864-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200909174647.662864-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2020 13:26:43 +0100
Message-ID: <CAFEAcA9BK1z3hJL0nNjJQkX9kH0_64v81fPhOmj78DY85zYTgw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] hw/arm: versal-virt: Correct the tx/rx GEM clocks
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6tMmaR58fy4E

On Wed, 9 Sep 2020 at 18:46, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This corrects the Ethernet tx/rx clocks in the generated DTB.
> Avoids a Linux kernel warning.
>
> Cheers,
> Edgar
>
> ChangeLog:
>
> v1 -> v2:
> * Fix commit message typo, I -> It
>
> Edgar E. Iglesias (1):
>   hw/arm: versal-virt: Correct the tx/rx GEM clocks
>
>  hw/arm/xlnx-versal-virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
