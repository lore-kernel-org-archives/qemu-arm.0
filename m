Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp266246lfg;
        Thu, 8 Jul 2021 05:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrm2P7oiJTYaHrnt6x2GZHSZb3jZKQ9mX3Gg1J/blh/QshG3xqwYWIPLJMItGEU19Juo1N
X-Received: by 2002:a05:6402:6:: with SMTP id d6mr25687171edu.236.1625746532383;
        Thu, 08 Jul 2021 05:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625746532; cv=none;
        d=google.com; s=arc-20160816;
        b=b01aVURNQZNL/YLZEJP6par7Yn1Nn2pg+xnBHaqJ+IQAk7MT5kOD9GtmvnDER0YfFA
         g8Q8azx5BugVgY7vhHhiH4Wyb5MpBoN4nOL5fdMeUmg/65SDAGkzqU/YYJTD9jycIJg6
         GQVOBsYqsdQchlz4nLSGV30hOzQbQzSR76oxzPNIKAMtGv/EYogrfW7Os+bpRKYMS7X5
         riM75o7JKBGlLh3u/HJH0Epb/UlhvYOmmMQC3nB0P7Ug3Qqlnl1ianNI5VobJAT1zwqS
         IQ3ecge4DFskUGY7Zg1kN8NbUQtY55dycNQ1hI3Hrn2eXE6oZN3CrSOYvO2PaNEiUm7B
         0NVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nT497qzfEj2kvN1C+SQTe5QMIPJjPkAgPNTToeqNSc=;
        b=0MRiFHnh9kho5zc6Ziesl6bjkH7qsWOYNsBsFCuNAUqxKyy1D10Kylg8vSfGykplAY
         ft5l2MNyfKXwY5sZEQnQNwEpfOfW5LdfmejIUMU/tIXtpIJxZQxQMMYA4j94jJ/4stSH
         YrwKMlwa1ruH759M0Ecj8o+2t8et49frMUzh+wFpf5YzoYcdjPznyNiGakW9RTDxskjE
         tgeGKZ/yihg+UvnOA+XJrSGameA4x1Lvg2G4FvNJ9HQCtqhKj/qzkgXo7NNQwhcQm0TF
         pXbVHdBYVKHUAdL1gtfaCgkb5Ja9SRu8w4P+bUJLcOGdQyh9Ys2gNN6A3bffhbsys9mw
         801g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hsS9xhBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si3038904eds.141.2021.07.08.05.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 05:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hsS9xhBp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1SwF-0006lJ-Fd
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 08:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sw3-0006h3-Er
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 08:15:19 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sw1-0006JE-Bn
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 08:15:19 -0400
Received: by mail-ej1-x634.google.com with SMTP id gb6so9228629ejc.5
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nT497qzfEj2kvN1C+SQTe5QMIPJjPkAgPNTToeqNSc=;
 b=hsS9xhBp2IqmIUGd3VkUcpQPzPzPXqMGuRXKdZQmiSJ/g9Ji9n4SKudaVESnso69yi
 kvxI6tRKKGjtCaWgkhPwXlDTXOoWCJOUQfJfGkKfINTzJKSMnoEtPQSeUk65SC8T+6sB
 bwoQqKYlERak8Zo6Q4+d/2HMM3gWj0b4tth6SKsovx/Cf3SIE99n1I+CehZ9QUsSWGU0
 HovVDV9oJlH29jaPzEk/t07LpACdhbv3cf0kDghdBTeMnmfPSg0PzZx1ug9ovza8JQtO
 zgIwWEBcEhpOG3gM5GKCXNGgSD6nbsFkb7EOS983OZiQo9tx0alGMbYGkFMaLuAjYZlL
 UV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nT497qzfEj2kvN1C+SQTe5QMIPJjPkAgPNTToeqNSc=;
 b=NxhhExNhLbthBWgmEc4E/kOV+Ug6ADZKL5tpDz6G8VSA2mUuGsKNyKKbGLGqEHE4Np
 BbYjVqrObRKDNbjpE7Me18iQ0l88/wQOXUtLkkvJJJJdKkQyuC0TMnu4dd1GGxkH/vQq
 Uskns/H4rAZopkAZ2cjnjwx9Jjv+ob21abcBfhbHVr6czMYiHfcg5U2uTO3+2f/k9X0c
 QJlErDtlR/4dkNqlkiKPp5KLxrRtJlg9Mf27VjFXHljDdnv0YdpKHIFCU51boW+22R+5
 kzxfNOR7H8JNct4iJzxlOqYVXwAoq6IJSS2Ln1/RhR4YshBj5s+hrdI+crO5fWw/mD0Z
 Ilqw==
X-Gm-Message-State: AOAM5306928372NXFuD4eMcN8M49PQgKHesdEiiuJdipm4npjB926A8Q
 U9YZYT2yhgC2Gkvb6GBALhoEZutDotnrh5sHHGse6g==
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr9834181ejd.250.1625746515384; 
 Thu, 08 Jul 2021 05:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-8-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:14:36 +0100
Message-ID: <CAFEAcA_27x2nrTCDzXj8Xv640x+0M50gM8a8wrgGYn9M3CxokA@mail.gmail.com>
Subject: Re: [PATCH v2 07/28] target/arm: Use translator_use_goto_tb for
 aarch32
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wl8lZ1gV03uk

On Wed, 30 Jun 2021 at 19:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

Now we end up checking for the single-stepping case twice: once in
gen_jmp_tb() etc, and then again indirectly in gen_goto_tb(), because
all the callsites to gen_goto_tb() carefully avoid calling it for
the is-singlestepping case. That suggests there's more cleanup
possible here.

For this patch, I guess
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
