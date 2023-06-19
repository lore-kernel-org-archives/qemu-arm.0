Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2810207ejt;
        Mon, 19 Jun 2023 06:27:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sULCeJtU9ugY7EE2U8k1iRmhKBT6GSH76aU+HyK4EEE3omrcjjysq+qCXu6fyaSuA3FJ6
X-Received: by 2002:ac8:7f93:0:b0:3ff:2919:e731 with SMTP id z19-20020ac87f93000000b003ff2919e731mr72728qtj.7.1687181251031;
        Mon, 19 Jun 2023 06:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687181251; cv=none;
        d=google.com; s=arc-20160816;
        b=t5U2Q37ZRQjdvkwDiV/xmRzo0wI19nh1aQRYRH2HPicFNg0hqZBhTcwGmctoArvQl3
         z5QF1qPZgysltVgmwFfzhmxE1zscp9+AwpfsoyIJ8/LUePGaFdp9t+eYDSWWNwpjlnjg
         lF1R2HwJ7mZFbeNuo4GliJ+qsW6JD+IGRE23oZpFRvf9eBMuPJRuCyr+K+GhF9KKoM+9
         HdSiIB7v9Ii6kqeEJc2BCBjwxYK8H6KeWMsSKUQGgWWJrR7CqTT1TKGtBkx4/m3tLAdx
         RCwPteH6FzZIutpXfCN/K/t1LUm+DNrgoKuPNkXpCID9LU1Ed2W46qcO1oIgGAYx9QBz
         t1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=RhowFXpi1cFZ7sxyOGnudnNyzi3VjFDEKyZY08LIEfo=;
        b=qQORMGKu7JjBuVWU/6sUc6tTmOaixjlxQHgCQrrfkWJfQWFz+Z16WAt3V2njFQydOO
         JkSDN83n1QKLXQzMqml0U7Qj3J2yQz4AA8LfydDHA8glzInGm/8QE09QeAsRvW8FYmFj
         AI5RUONWCB5b9csybTiqNVnoeC5Pyu5naT41y3IR5TtJ3C9Ygpif7lXPdhEygYp/Pr8l
         PnEqdhPsXr3SDL6twrhFLw70JhUTsSFRlCOELA4gJkQuVVUGIXOz3wNQ15r+Z6HtI0WQ
         RXlBOapRrsSlQehZUcpoQGyLKRhz+qCCen8bboQqowIZNN4Gh3lb591/tHlyr4DvZalb
         AjgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kc/teJsi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a05622a024e00b003f871a13686si13253606qtx.713.2023.06.19.06.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kc/teJsi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEuT-0001gS-Fx; Mon, 19 Jun 2023 09:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBEuR-0001Xq-Na
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:27:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBEuP-0008Ax-Du
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:27:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-519608ddbf7so3554128a12.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687181222; x=1689773222;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RhowFXpi1cFZ7sxyOGnudnNyzi3VjFDEKyZY08LIEfo=;
 b=Kc/teJsi/arOMSxQO3Lhkpxi+sYdrU5SPtvv+QZ/4kc+brJxRwagW79C8fehmJQoHS
 LjkO7xQ4c99a2ZdqJD7271/s0Jsy92UKPYkYQFXyTiGGLCl6l0ItZVHZddOu0/1Z6MWg
 bcoEKwEMpmGPSDAH78zOdSz3dyA30hJT5P7picSmqe23pdi6lfi/sZG3RhHyhhFl/TU+
 R+IaRmwedIpkCNRDw8W+NA+ES4gQyskbLBNgVq9VEWYNUIL0U58sQk2lUcjVXrnpEMUn
 bcdIb4wzylY2dK3PtAZZWu8ohMkQaJOINtuh9NPx8HI2LIIq7Ig+0pL1Ozv5Hx1k2zpm
 0jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687181222; x=1689773222;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhowFXpi1cFZ7sxyOGnudnNyzi3VjFDEKyZY08LIEfo=;
 b=bA8KAOmr735S+2nfAWW1rhUKANHbC7yeCx7jsKPrj/cLhi2deZkyywQTe0l1VGxELr
 QAvtAixvHwH2fJ1jLvwq1TnvXwcEL0QZBye2SB1H8DuFApgGIvjLXrN/YzI4HvjE5scL
 4KgHDPabTa268dYIkihT8WXEyW5pJR2aq9fi+UT6ibG28oHCnmpwcjR9wJbYyojurOv3
 KUwkXppuJax736g+qolCLmTdfZ3E9g+znVtQjflRhel79BQca5EHtLIDwLl20QN07sXo
 V8ebPBs6QCnuzu0/g8cTsv8AV7rKTmmyaQFeypsCteNiBbem72GsnhZpy0YqEGKJsZ1Q
 3tSA==
X-Gm-Message-State: AC+VfDw5tWao636CCEjvCn38fjHc8mpMAf6E2GFaimKxfaK6K1eRFB6e
 baqdowKtMstiQtJ0tqKQERm30A==
X-Received: by 2002:a05:6402:3da:b0:51a:42b2:cb83 with SMTP id
 t26-20020a05640203da00b0051a42b2cb83mr3610249edw.42.1687181222535; 
 Mon, 19 Jun 2023 06:27:02 -0700 (PDT)
Received: from [192.168.200.206] (83.11.39.176.ipv4.supernova.orange.pl.
 [83.11.39.176]) by smtp.gmail.com with ESMTPSA id
 u8-20020aa7d988000000b0051a4c1dc813sm2263007eds.82.2023.06.19.06.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:27:02 -0700 (PDT)
Message-ID: <dfd62e0a-6fb5-e93c-c2c6-d68025fb9999@linaro.org>
Date: Mon, 19 Jun 2023 15:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] hw/arm/sbsa-ref: add GIC ITS to DeviceTree
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
 <20230606182414.637467-3-marcin.juszkiewicz@linaro.org>
 <CAFEAcA8eGEeMJwUSe5Ok9QvYUReO_awe3-+R5Vbc9MobDc2JLg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8eGEeMJwUSe5Ok9QvYUReO_awe3-+R5Vbc9MobDc2JLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WolObnPPkAYq

W dniu 19.06.2023 o 14:55, Peter Maydell pisze:
> On Tue, 6 Jun 2023 at 19:24, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> We need GIC ITS information in DeviceTree so TF-A can pass it to EDK2.
>>
>> Bumping platform version to 0.2 as this is important hardware change.


> We should fold this patch into the previous one.

Will do. With "Co-authored-by:" tag as ITS stuff was done by Shashi 
Mallela while I did DT part. And S-o-b too.

> If we are bumping the version-minor, we should add something
> to the documentation that says what the difference between
> 0.1 and 0.2 is. (And if we can remember what 0.0 was that
> would be worth noting.)

Will rebase on top of target-arm.next once you push it with 
documentation updates.

