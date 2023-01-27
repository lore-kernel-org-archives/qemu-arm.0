Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1368272ejc;
        Fri, 27 Jan 2023 10:43:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+L6q8breL0c5twg2YeVW8ClXJTFoCxWz9f4Tv+qAtYkEdq/QRCbrhtl5pUcTdr86yTcufS
X-Received: by 2002:a05:6214:328a:b0:537:7619:58d9 with SMTP id mu10-20020a056214328a00b00537761958d9mr13896170qvb.9.1674845027883;
        Fri, 27 Jan 2023 10:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674845027; cv=none;
        d=google.com; s=arc-20160816;
        b=KNiqKzN97qVHJZ3IZ8rUXIxNkDu+Ho27GSzGBYrBA8VLB5BAzM4j4x0z8NbVRLDh/m
         UTlSrf7HoJXEmyZOnGq6LWwjnZvY3G21vaqxICQipbW6PE230n7/WoubrnwhDlN4tS4j
         7KnbF8uuFUTWq1LR+dE7BiH9Vf1GAAHIRTiUNTohfKusqVbkWadPraSu39IJbimvsiUQ
         00D/dbPY0WcgPSIQ8hrLnr/HmA/eFHFxGHJEAPKHkLVnbyrfs+2DHQZKhzJorIswD1jx
         nAY+vc+pACtreVmzfG2XqJzZbTFx9tqFS5r74mzQylSMAPq3LA3n+ZEFSNEZkJ85bMea
         gbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OV86ZUc92F8TGquSUbq6R2EFmppWugmMY+6/djCBBqA=;
        b=GjWcbOc5BGINg5fn0LjFNc9uqM68Omi2aivNJ/0rqU9VRaHOLPBrH9Yln+GD+2oaNN
         bq+z8AVgZfk1hu2GUQwiKvqece55GX6CoduZ+tLd4oOjRXLfdLjq6LJhM3YB/CTjFd9f
         5LRiwWu1TOemWxbyL+aG1CrycPdrLUXGk1A3PCm/UbHLu8IbryWvodvSDvVMXFIBRxOq
         3UCOiqEZ6KYAyA7m4vQaGrbU7LUcdQQfX8q/O1JJzW6WdGekdxyJvKKlSt1VAdc/UDoN
         yic7Nm0iI1/0bSx/x0qqQq0M96LxPVghF24zQobcVAJXmTCfYuJoyGKzzPPtwvCZzpW/
         HC3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGgU1YdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a0c8e86000000b005355adfd427si2740200qvb.133.2023.01.27.10.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 10:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGgU1YdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLTh1-0006C5-Hp; Fri, 27 Jan 2023 13:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLTh0-0006Bl-Hc
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 13:43:18 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLTgx-0001sX-0S
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 13:43:17 -0500
Received: by mail-pl1-x62d.google.com with SMTP id be8so5901253plb.7
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OV86ZUc92F8TGquSUbq6R2EFmppWugmMY+6/djCBBqA=;
 b=KGgU1YdSiEASgUIKBpdKm9vuX94+Av2o9ZAAYeMp8AK4kjJMFcdBoDIurb1kwjRJJ5
 8/5473tRALXPQEzK7B7JdKvxUlDeQWOeNQog2+PP4+mdLWV5qq2dDNZA3tSFHlcv6uRj
 zhJZcpDbZBhWpkQSJeHZ+RkQkctsGtY6Lp1kNZf7HbV4lZ1SHULJxub3OboGTxQVIn0y
 gDsEycjJfhHFlU7dL1HQ04/J2g/YxZhVNaPCRGvg9o5jYAJo1Lh8M8B03lR7tBX+KkcQ
 Ss4KLBd4mUt+/BxMDIyLl5JdN/2YBOWV+ozaPJhLAdQ2OnwxcnzG4Y7rWF2jeyKYRWNa
 MIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OV86ZUc92F8TGquSUbq6R2EFmppWugmMY+6/djCBBqA=;
 b=6WcN20f2JWEsLp43qX2zWUk8KfYj1EWHJiOWTmQB1qik5o5ZW7qlkubuzYWonLUI4C
 SdbnPShkD9+kBiu2dsx3lzMHtAfyNsunvzRJuL/IcX8LIBX+HmNS7oDRUbDN8A/vpd/R
 24NvV+uRyaN6YjYdw37YGZ1PLehYGmJSN8/y30E67h6ALlTK9rvQCnDYXa3+vyOlmrW4
 nighonNQeVcARECQDXZBqoYOfRzrD38yDEBhN6IPLOcCSLvi6sJ88LG1qDkl0ykicUcp
 eE3zgR3TbypWUs+YV6MiadL4FrtJHeolOnLstvj1BUKk9ISv53wDCzSIa18POQYTBKeM
 SF5A==
X-Gm-Message-State: AO0yUKV1do0AMCP4Em8QPmsRrwizCEV/1YLSnEWEnr9AYM7twYmlvTJN
 SW7LCd0E+/+5lKMyhkDCA9OuCfOC4Wdy7f1tJvt3JgIjwqRccQ==
X-Received: by 2002:a17:90b:312:b0:22c:37a4:6ae3 with SMTP id
 ay18-20020a17090b031200b0022c37a46ae3mr762717pjb.97.1674844993402; Fri, 27
 Jan 2023 10:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 18:43:02 +0000
Message-ID: <CAFEAcA_u12_+x9Dd2mEx9=PuXM6ZbdmhjDat=XAsWoP4jHM0sA@mail.gmail.com>
Subject: Re: [PATCH 00/23] target/arm: Implement FEAT_FGT fine-grained traps
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XOznb7gUFcd1

On Fri, 27 Jan 2023 at 17:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> The first seven patches are various cleanups and bugfixes that
> I noticed while I was doing the FEAT_FGT work. In particular, we
> weren't getting the priority of HSTR_EL2 traps right -- these should
> take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
> The rest of the series is FEAT_FGT itself.

Missing character here -- should be "take priority over UNDEF-at-EL1"...

-- PMM
