Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2525245ejc;
        Tue, 17 Jan 2023 08:34:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxBuWqnTt8I8RHD3/1eq1FfPFP44fgmqbYB8Fwmp1errZt3R5N8vcDzsQ71OtW0x3kpFPD
X-Received: by 2002:a05:6214:21a8:b0:4c7:b0f:675d with SMTP id t8-20020a05621421a800b004c70b0f675dmr7672695qvc.9.1673973259176;
        Tue, 17 Jan 2023 08:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673973259; cv=none;
        d=google.com; s=arc-20160816;
        b=KXZY0l5GAPzqzCPVzIVCp5MpGJXjKY2NMUlARmaCJz095H/IHGQqxZ0tjWQIAfsykw
         C6We0F3kWHStG/8wU1L5QkhS7b2fTtAAy0TCGXhI6tSiC2ibaX4H0VRnFowUZSZTx464
         oyPINDfX6Al77esjwvd4NNtH5GFj07QFAPpFCK3iKuCuuaYgCtgTTTj7M02fmAg+ilR7
         ikFcVTMOonCFE4z8nft/7V7WUNRQWwvaQLd1iFTeDUaqrET+OS3WsJwd4i+fgErgq5Ui
         M+NCRIFQIihsfK0gAA7z8KPRS6dC3q5q9GPRxZH1P+Ph5cwq899fvi0c07tJ+fMKcyiz
         QLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zCHQthptMD9COWK/x9A+Jezs9vlui/I8DoyxtLjm8Uo=;
        b=EljTi22KaTs1eGGtR+qU/1yezpNXfFqhF9PTZ7bYsRqi8v56ZdkhbCpNuriVQLJ4i+
         S6a/x8F7NsVhAhTN7Mp50o+LpVW68gjWO92C7KjL6KRbE+T3an4QCetoCuymz2DOuY01
         gl1WW7fZZ67T7LfQmBceCFeF1wdwiu3w1BcUki6KCpMaC6ZZs2E2dm37Xy1m6e/7JZ45
         QcqM/lz1fjcm7nzco4rbDesko3yIKfiybkab+eMppJtYtAxZySDAgu0OxrbiYxd7hnLJ
         5OmmUWpUzHsXhOZSrxYr5vVKWpG/CTcaasLOs3IInMi/IH7McuYWW/MYQPvJiFqVlEhd
         ftkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BC31TN8+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a0562140c2600b0053523cfdc37si1887723qvd.382.2023.01.17.08.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 08:34:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BC31TN8+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHouG-00083Y-Os; Tue, 17 Jan 2023 11:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHou9-0007uk-7N
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:33:51 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHou6-00074S-EH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:33:44 -0500
Received: by mail-pl1-x62d.google.com with SMTP id jl4so34077725plb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCHQthptMD9COWK/x9A+Jezs9vlui/I8DoyxtLjm8Uo=;
 b=BC31TN8+fpwB7t5MbLBQlHAtD1cfE/p02m+oqYpC3kLhB3ZiJBfh0KYq5XuClF3atk
 DlG7xBaHCGZEUin+Xm5x7tE9KFU5BkS6F1EnEN6G0zGoq5kzs6WZMEvrFlSLMDIcXRFC
 FA6F0kYsMEuXewId1S9lC+UkpyTHBK1a9Fm3zqp2E1rLvEKeDknRsaNDz29stKX9F61d
 S7PacqgnTzONZY67/Z+iTH0z3225NPb1wKpWQIMsRRngBws46SoCPj7RkVQAtdnmo9Y4
 Hbq2ybKHMcN7wxNY3qRI1x3wTpU/XU9AXZzyzEpbyu6nc106gA6pHulx/YTWeaNCCKN/
 TWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCHQthptMD9COWK/x9A+Jezs9vlui/I8DoyxtLjm8Uo=;
 b=c8ClEFKKU6cTah/0CnAqnWSveX27fw1uPIcT9I+W4d10HpZtpZ5twEghfTRv5AyVyj
 rpACfcXoKd6iCvUawdfprdrc+cYGLcSDFLn728cOcEa5fAiVRWzomCQ6KBXjvJDz+ASy
 V+WgamKiVdFOOwQpf9OT94fbvqC9L1fFwFavBY2ORtz5j6BHBq/lRj7iPrT/6YMVsFFr
 3IwmPe7gWVO8ouzZoNlzpulVH49mKjtYtX6i4lK9Z6MQYZFTdSIS6y6NambWPyjRyn4o
 g24L9tH2G/lW60PcQb5aRvvZIqWpq7Ie/poB5y3H3syCyNM/NAZSLrHg4LeNw1cZqN4q
 m9kw==
X-Gm-Message-State: AFqh2kpEEHcpnoH9sKwFtGbQvy5T8GkbH1RHhrdZyZESQHesBjqYkVPm
 H13WbAK9AuxRQYWgh7mhdwksANpXGJiSYiLE0FKoQA==
X-Received: by 2002:a17:90a:c784:b0:229:2631:e8 with SMTP id
 gn4-20020a17090ac78400b00229263100e8mr292547pjb.215.1673973219279; Tue, 17
 Jan 2023 08:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20230112102436.1913-1-philmd@linaro.org>
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:33:28 +0000
Message-ID: <CAFEAcA8PawKOUftR+kep1O9LY8490GXuy9PeWvEXe_5LjooGQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/arm: Introduce aarch64_set_svcr
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zDdSgbXWbqr4

On Thu, 12 Jan 2023 at 10:24, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> This is a respin of Richard's patch
> https://lore.kernel.org/qemu-devel/20230112004322.161330-1-richard.hender=
son@linaro.org/
> but split in multiple trivial changes, as I was having hard
> time to understand all changes at once while reviewing it.
>



Applied to target-arm.next, thanks.

-- PMM
