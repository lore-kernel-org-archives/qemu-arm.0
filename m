Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3804400lfg;
        Tue, 11 May 2021 02:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8emHf2O+ESjyr/G+GTkkOYlnh19QPxggwwo2hY1xKgCD0SBZnyMrGJS71YaupS6CP5H/A
X-Received: by 2002:ab0:14ac:: with SMTP id d41mr25132002uae.49.1620725768127;
        Tue, 11 May 2021 02:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620725768; cv=none;
        d=google.com; s=arc-20160816;
        b=PfDDnKmjwNXkgLRv9lZHWNBghx8oQPwCUqPbUDpGwFkTP/ivwWU5oEJx+Knd9DLNJN
         1GVP0jQnhjSfpNa7P5Dccej62ezYci5rMXdYTpI1WP17iRBH8PqngNn6atuCttFzllu6
         EKoDyN3ruIGNh78TcPnluIAxOOkNWUO1S2Bxd4uyV/KuDAY77eio0tIqaLZUAGIS67+u
         uw6wEBpVR4z5xNKL+uX75C+BItGGujSjj9Lz8we0SQituamYEfu/QhjI4JnBFET208GR
         jh4Km9AFRUqKdEv5Mybmxv+k9tLRokdm3ty9ce1PDmk1tfflIEKp+WTNPUeENhUKtTpa
         ifRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0QxbAp7FgGeCC81Z1BKW2veeLkx9WqVARj9kyfd4fzU=;
        b=e29p2N7MkUEsfMaDFUULN4+GrVqW8uiXPkmmcabjak+2dQ6SUcafO8b6YbRJpQEi2h
         Jq4avxYPD+CPVQsGN0JxMOnGUw4ZAeszitp7KNXjd5/DA2/su/WTV3gM4uwm/d6WQHfo
         ajT8qwwt/HdkYCim+JhBXeCixvXzSmo6PJvf2YIfwh0qnqBhVs1hklwnOKK1rexHpSn5
         LB9m2qq1YVpIALGoGroBtRzVVzazkNG8L2NOu9Ul3O+BagI9UqVLgu0rOzcwlKiO2HyK
         Se/ZeiDRmCjk3SVyqzWoHHiqdmHLlCXcnNI+GaehZtN1VNq6S6WFxZKOElueEMUcjIpg
         1/+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YL4klpZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24si8349807vsk.165.2021.05.11.02.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 02:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YL4klpZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgOoB-0000zT-Ds
	for alex.bennee@linaro.org; Tue, 11 May 2021 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOSi-0006g2-Pf
 for qemu-arm@nongnu.org; Tue, 11 May 2021 05:13:57 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOSd-0000UR-Eg
 for qemu-arm@nongnu.org; Tue, 11 May 2021 05:13:56 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b25so28647074eju.5
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0QxbAp7FgGeCC81Z1BKW2veeLkx9WqVARj9kyfd4fzU=;
 b=YL4klpZ/qQjvoaAAfHaCOJsVmZkKvhj0yf3Nj66tUrQiyrlxwVTG23fMXQ+GGKxp0w
 Kje5xuwcsxWoBeMT5z/aFIvweeQDue6LwXPOLTZ/9YT7IlqV041B0VWu6g3ss9fcYP9T
 EuHTZjbpgHZoKtxv8TnYuCyu7p//eqhLl4A7hQuwANNh/5qVN5SpNu2W6QvEyKwlYZvF
 twJ6QsInWdyAamNKaeXNd/byVwmbJTB1bBt189Trwc8tjdp/s4Um5ue/VEaGxL5CQfZK
 AbYekwEV7UD2qNtzNc9qvr/sPAZAMg2PQhDUC7rm0Pplgj4ReCGOYbIRfZQi8KZk550D
 iWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0QxbAp7FgGeCC81Z1BKW2veeLkx9WqVARj9kyfd4fzU=;
 b=d1uANZu56hzZgwGg33JWf3IEbu1Aq7rysDuTYxCR/WT/Kj7yI0IBgkj1HJUo8f1grL
 t/QbuJdYw214vIIhUJI7AIaqNIT3t0ciPVIutzV8MsioaS4a64YVzqzQLJ8+TReOlv85
 vNXgzFEzyPEiJVhPnlGyW2CzpCvBpb4JC17sR84g9SLhUAmyF0TUll7a1983nI2iSmr9
 rocrCMRzgS+i9n6nHYqnGKSmR0nUxF1pctedfLwpZlMl9ITTHimKE4D7QWOmB+3zEVGT
 SWUG7r6KDIqbZZDgo+hYwXWBIgXQzw6DNysRBawZZJSf/gnNr4tL2SERcw3ANUXqE47x
 g8wQ==
X-Gm-Message-State: AOAM530us+tvVeA94vRcGBJSu+7Cd7A9H58zRr8qPonQ78Abe6QNISFJ
 xHGnlt/Vibs4MAyLUcE8lodzhtc4iIdw2joWTQ/TUw==
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr31321347ejb.250.1620724429359; 
 Tue, 11 May 2021 02:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-12-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:12:37 +0100
Message-ID: <CAFEAcA8nBUhjsZb8vvFmj1zrxL+M_wZ5u_tDNcBfcrY1SM4LHw@mail.gmail.com>
Subject: Re: [PATCH v6 11/82] target/arm: Implement SVE2 integer add/subtract
 interleaved long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: Zi9DCSuxzHB8

On Fri, 30 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      | 6 ++++++
>  target/arm/translate-sve.c | 4 ++++
>  2 files changed, 10 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
