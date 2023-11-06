Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2809951eja;
        Mon, 6 Nov 2023 06:45:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFriV68PKX/yvyadPIrofoTbkZAwf5wGUBZwBtTj9AoaNw30CI3zbqsaC3TgiEKKutWk5B+
X-Received: by 2002:a05:6214:2506:b0:658:26d7:72e0 with SMTP id gf6-20020a056214250600b0065826d772e0mr20820880qvb.4.1699281957818;
        Mon, 06 Nov 2023 06:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699281957; cv=none;
        d=google.com; s=arc-20160816;
        b=I6g+pCjAASIVgJ/SFgp7VSbVM7g0yeXRRKJS+7xhoTA/3pd47yfdBlZZQJlgwsBk9e
         fzrrjNrMTsFgJmSXPlhcKDBx9Do9+a+FrlFZ3x1H2r5RhfhMKqujoGOztIxeEeeiD8aY
         1X54piFk6Qm+cW6/K3UtgCCiALmapHI9aAXdWTV7gfyLBEXeCfOaZJzoJcJF2/xZXd5X
         Hc+Xz//GYNN+vPWl30WS7vN75dlvdaktfldmZiGFGO9QQ3qw2NIdwIx1qL0+kyZJgav3
         FkeC9Vg3/dOcPTURORLBJWwxiBq9iSlWHi4RYm76OQ9uq8r4c4wSnOs3+pZ2OlDFYY3H
         V4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=G3rsMhV/YnelkiihUeLr8dh8pLDdvO1fBGxovLhiCmU=;
        fh=SxJTzwBNffJMSCdN3WpofXNBkeoTS78o2VJdrdNs6co=;
        b=sHSX9vuh6ueDE3ejT4QbiD0Vur/KxuhjXjxVqzpftHV43jwkieuS59yz54B4d8tBLv
         VskrvQvxS4Ah2h3fAUk9wAI0vmNRdZVZ/56csEdULT1Urmzxbgx0wZc2QL+XgK6pb6y3
         XZ35VOGxip0uxtFTt6/H8gDLKrDnIq+4QcmigYPryFjHihllwRdlvkjMzKww/ZLjbsl7
         gc4C8fbmAHWX5fz79rZ9WIm+Yq/qj37mD/DqHYj99aPrCwC26uWhEqN+EHxa/s/WHx9A
         oWJQN99WHD6A+X7c5UOGaAud1xl6kr+2Tgotcj5hST028ZxHCAwWLg8THvMMVBIpXcpx
         AMXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MKhA+pHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx6-20020a056214188600b00656340f901fsi5948891qvb.56.2023.11.06.06.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 06:45:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MKhA+pHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r00jO-00056A-2v; Mon, 06 Nov 2023 09:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r00jA-0003mL-80
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 09:37:20 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r00j6-0000r7-D1
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 09:37:19 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so7754755a12.2
 for <qemu-arm@nongnu.org>; Mon, 06 Nov 2023 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699281435; x=1699886235; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G3rsMhV/YnelkiihUeLr8dh8pLDdvO1fBGxovLhiCmU=;
 b=MKhA+pHljxelbWGX4pyGDmP8vbrvdcuOAvHjdrB04FOw4Mzk+XP81qEEDZjvStI7sb
 +8vZRzMzVBJmovDbQFI1R/rXlHJvSJOdhp/M53v+KjD8Qb/m/FEwlvx5VJru9MdD1RP9
 qYO4oUhBKMkRey4Jyx3JDqMqIlmQUbZpoXwmjgQFi5UCPWeN/MVJPUwDg0l2UyEo/QwA
 WVlpPDtOo1s2f2FxuP+sEOPPO3jdkMxJ6D+t53MzCNh39C7GqxP8tiHhzVpjuSUWsDXp
 Fx2VXQX2pQbFmgmIMKeQbXXkO7rqkQDMg+Aqo5TGY9t2NbrkfZft8HocoolBTIhFwMms
 u1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699281435; x=1699886235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G3rsMhV/YnelkiihUeLr8dh8pLDdvO1fBGxovLhiCmU=;
 b=Yv38KBLr68qczeQOCDPyfefHP9rVWqGTJ9RVaVliNQVDEK4iSPDcIIhH1gFMq4qYdp
 xCypQkRg3ixd+qlC+7mzufg2ByGRjFH+pfZwvEnNcDy6kuXANs51ghPr5VAxoQdKNlEp
 r7btiL1XjcZ2bzlDuvCdMnxE+SZtWdHgwaZesTjKGUvFB1rWHBcZEsZgoqkDLISWgeWq
 2OjxZY8wN/7zAgC2EanbJrhgTdPheP0MEo173rOF2t2ZX0UkssOiG2mhodZYoSF9Kc+z
 LOO8V+d+l9x/T3pLpS2MFiam6mlwEntGN0ZOklWRo+oOweboN3KMJOInAAM+T3fBknnU
 Dcow==
X-Gm-Message-State: AOJu0YzM6Or60Id7+IG9HykHXGt2A2eT5L7mWQnEvI6sAl4x6B1DNN+7
 8H4R0EpI/bp3QZDmq/mfLkHMUGw5kNiZxvJhAq6lhg==
X-Received: by 2002:a05:6402:14cf:b0:543:8891:e142 with SMTP id
 f15-20020a05640214cf00b005438891e142mr14815485edx.11.1699281434764; Mon, 06
 Nov 2023 06:37:14 -0800 (PST)
MIME-Version: 1.0
References: <1353832942.8123338.1699279035562.JavaMail.zimbra@enst.fr>
In-Reply-To: <1353832942.8123338.1699279035562.JavaMail.zimbra@enst.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Nov 2023 14:37:03 +0000
Message-ID: <CAFEAcA_XpfjUvM8Gb+NE6V_qreG3pEbNsUzKmBsKfnGZnsJObg@mail.gmail.com>
Subject: Re: Adding support of ARM board B-L475E-IOT01A using STM32L475 SoC
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yIA5bqX/jT9D

On Mon, 6 Nov 2023 at 13:57, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> Hello,
>
> Along with my fellow student Arnaud Minier, we're looking to implement su=
pport for a new ARM board for a university project.
>
> As of now we've have implemented a minimal version for the machine and th=
e SoC without any syscfg, timers or usart implementation.
> We have looked at the relevant informations about the procedure to submit=
 a patch, however we aren't sure if we should submit a patch now already,
> as a way to get acquainted with the procedure and expectations, or if we =
should rather implement more peripherals and submit the patch all at once.

You might as well send an RFC now if you have a minimal
working subset of devices. That will help you get used to the
process. If you haven't read
https://www.qemu.org/docs/master/devel/submitting-a-patch.html
that is our description of how it works.

> For further details about project, the end-goal is to emulate a maximum o=
f peripherals and be able to display an emulated LED matrix driven by the Q=
EMU-emulated board.
>
> How we're proceding for now is replicating code designed for the stm32f40=
5 SoC and other specific stm32f4xx code and adapting it for the stm32l475 S=
oC (both are Cortex-M4 SoC).
> Is it alright if the patch commits reflect this copy-paste then increment=
aly change details procedure ?

Generally speaking, no. The patch series as submitted should
be a sequence of self-contained changes which all do one
thing (eg "add SoC device framework", "add UART model";
"add new board model", etc). They shouldn't have extra
"fix this bug" or "change this thing" patches on top that
fix problems in earlier patches.

thanks
-- PMM
