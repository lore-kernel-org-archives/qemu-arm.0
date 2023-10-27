Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp150784ejc;
        Fri, 27 Oct 2023 05:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEo01SCywVbqnni2g63smv0DUdwGQE4v9eYuWuLDzsSuAD+pe/P7vFzOFyAS6vJfz7842
X-Received: by 2002:a05:622a:199a:b0:412:6f:9ead with SMTP id u26-20020a05622a199a00b00412006f9eadmr2515837qtc.14.1698409147951;
        Fri, 27 Oct 2023 05:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698409147; cv=none;
        d=google.com; s=arc-20160816;
        b=HL28kn3ecY6Wk73JAn8k3rUnZENurPcU/MCNn2wS0IMPO9QoTbak0pSyORv6oZs25g
         sDgc2ixfC+JJVkrr2nvOGI1NkiH3cENGVSQeNlnfLxAyGp+D59pkUJL8PugvVuxFnLqc
         U2vIvoR0KW1igdv6TC9/6Iv/LC+6m0AJewPtU0JXuzQSeUTFZ/gWod8erqfBq1GeRXy2
         ez8cOCtPbcC+tWEQDIBnC6wfXtbs5vDbFoIbtMJAf2UKgYqyo2iL7HLETl8nHL6DA1y0
         3hXHC4rL020wb5IE4VASSWPJlN2EIuCwXVdTWHPVEW36xo0rEY6O/l6w/G4mKD2pHOCI
         x8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LJHAFGdNUhuVw/PfxoTbIpKdsSQ1dyoiqDNoqW7Fazk=;
        fh=SK5x4hx8wvzk6BSdv/2ji2hc+6Da5OLpfcqaB6Bkztg=;
        b=rcJmWJgZJeBWSgyPtGRKcovQZyVOo6N6iuuM8iIvYnBxxUvdodDHkOuEgOABz/HWfB
         v6VdR1XkNDhiCQritXCyq/WafbJLoaZxBkPdP7atqaSUreHCs1SjJlQxTWBSykzAa6cC
         LynQMFR4xIl3o4tlABFKr3A9bHmt3SABOYTJYDTdrTP1oTXutdTHTiXYb1W2YXpLQQfC
         9J3duBlhXQ3GToGoMzcWQY5owQDAckOMHJhpfHg+Xfas7YXQUmxBtJ1Eba2nOsN/hn+9
         2rSe/nUyrxjtH09uTHzUGD3tPW6PcsN3rkga+ib89h4oL8RvEsQF6/SEs/NiefGpEYb+
         F4Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kPJlyFGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020ac87e8d000000b00419797673cbsi651595qtj.800.2023.10.27.05.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 05:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kPJlyFGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwLnT-0005hR-Oy; Fri, 27 Oct 2023 08:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLnR-0005cq-Od
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:18:37 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLnQ-0007EI-22
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:18:37 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so3117642a12.3
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698409114; x=1699013914; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJHAFGdNUhuVw/PfxoTbIpKdsSQ1dyoiqDNoqW7Fazk=;
 b=kPJlyFGLzeuUvOSEY7KGuHHM1dQp9J3oik5lq+FiAYbdunpxADgAKgIhp6VMYrkL/6
 ShHR0fBSUkEI6tLKCfhTiNVoBWmdJnBWGr20/y3Ax2T9++GgvMVsjdkoSRP5Ag/RLWkT
 tLC01CajmGZfurpmBvDziG7eGpemX8YWehcDCv9prsMPFFpRMrtS+G4yiYAU25+P9tDm
 vNsWaP5W8k2gs8HOgZqvoZMFlbrG/Jtq96sZasWKKMUqIUSoNLhG6lx6grC3WkVMBvXw
 0iDi9D7IBmY8ErAH1g2wO5NI+8ZAcbMRrdKvpt7sS+0BOu3HSeIOY5847ANVJSSB9lLv
 tjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698409114; x=1699013914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJHAFGdNUhuVw/PfxoTbIpKdsSQ1dyoiqDNoqW7Fazk=;
 b=epw0cQ6BXpMsudIUZX1UH6bc2NbYvjQwuUHHthG7WhwqBwNfLgJOQ9MtXDRfTzfbrI
 Rs6q7RdizyzSziXA5RC/yoi/JiUAR5mY/SwZNLeTgp8HbPSVRVgF9bSaMgbQktT55Srn
 kia7gsydSRC/hnFaRak27vWFnYcvmM/I3eOzRG/gtG1biznUI6ieMbfGSnQy/cmBuX10
 ee4hK716104NjNfNRYPEK4f6lvWI1FXtNjdn1vCMbvHde9+aNTx8A2ipT+izyPYOd3Q0
 gYbw191fVKt7Ip8mufA4EOpWKbgLDTGwbQWsg5kX94+XicTqulMeEzQsNY34tRN5OzrB
 Yp/A==
X-Gm-Message-State: AOJu0YzP0DXKyxfkjqdGgTYNZkVaeeJ6UWLcZVLy0YSVoG/B8c2020Q5
 9AjSLiIA97wk36au4kDK/N8KLEzdnUmO8nxnNO4j+g==
X-Received: by 2002:a50:ef0e:0:b0:540:9444:c281 with SMTP id
 m14-20020a50ef0e000000b005409444c281mr2137325eds.24.1698409114277; Fri, 27
 Oct 2023 05:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121857.31873-1-philmd@linaro.org>
In-Reply-To: <20231012121857.31873-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 13:18:23 +0100
Message-ID: <CAFEAcA_Ec5ahSbD9-v8o+-WX-4jraRt0JmFDydywDQ2iGhznHw@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw/pci-host/designware: QOM shuffling (Host bridge
 <-> Root function)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 53UGg8V/6hTa

On Thu, 12 Oct 2023 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi,
>
> While trying this PCI host bridge in a hegerogeneous setup
> I noticed few discrepancies due to the fact that host bridge
> pieces were managed by the root function.
>
> This series move these pieces (ViewPort and MSI regs) to the
> host bridge side where they belong. Unfortunately this is
> a migration breakage.
>
> I recommend reviewing using 'git-diff --color-moved=3Ddimmed-zebra'.
>
> Regards,
>

I had a go at reviewing this series, but I ran into the
problem that I don't know enough PCI to know whether
the various things being moved between root and bridge
here really do belong logically in one place rather
than the other.

Is there somebody with more PCI experience who could
look at this series?

thanks
-- PMM
