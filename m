Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp6031997lfb;
        Thu, 10 Dec 2020 08:00:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMnXwAC4UfhlFEu9iMgw2N4QtdDtH8lUYd3YhL7ndEao4Oe9iQ5XQ9rw4LfY4E2WioQjT4
X-Received: by 2002:a25:abd0:: with SMTP id v74mr12427058ybi.193.1607616036085;
        Thu, 10 Dec 2020 08:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607616036; cv=none;
        d=google.com; s=arc-20160816;
        b=XoNkTHZoBahYZ5g0r6sLkmojEP2nbysoSL7N5UgO7XjIxvnYj+KAMQOnvLcN+gGLJL
         3DD7/CHTw09Yn+tSS+yNQ8MtGJmrcZ5QWkMCoUjq+Lq53rni4FeNb4U9dBFQb7wWFgAh
         ZsYqcvK3d9UofNj9Un6YmDSx8BH9vZ9rLGokoHw16XNqGW2GqACL5c/6Od4/f5DpzEPN
         SOLIkq4GT2rf8XD6QcwAILkXMdD/UYiKox/tkklN9hSHBSD8dsfDN9C3dvUMmLMW2qzc
         247BKaUX+WtyjI1UQmd8xakKgZUTy0TZtNYxczxyrzDu/q+aXEw0bDTs0QsePdvB3Bj/
         0T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pnMfb4nIrEoo8GL32TDHnNQbihMczpvxnFnZHD1Zv+A=;
        b=FtwpenMGLwGlhn9mHRCQzU7YfPJA7IGKaN8V9hK09qR5w0VfjKuRMp9w7E6xMWf5+e
         ngU7iVVY9IuF9tK4MDSZDQ858b6MhqAMP8HiUscVyW3zXUJAz3dnD2nPfrPrC6gIXIh/
         ZB2DuCFzmFo2nQGm+Q79f3XmqP2PSjmq8PUgX3D6/N7WBMgUkK7X/gYPUqqyN3rJSzsj
         zPRaFB7y7mvUNkus7289O+g/k7hOAV2WTzzYQcfOV7sy8wKiP+upKfGEn10pF0B80cAN
         Cw5t7hDG+cs0+HqroBU2GRMYPgluWRvRpk8wyQq5jfVy2UqcJI2grlvKGX+P3tnV2bss
         oBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0JakkM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b62si3309636ybi.162.2020.12.10.08.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 08:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0JakkM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knOMt-0000aW-Cd
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 11:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOM5-0000Yj-Qv
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 10:59:45 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOM4-0005IZ-7K
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 10:59:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id jx16so8006774ejb.10
 for <qemu-arm@nongnu.org>; Thu, 10 Dec 2020 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pnMfb4nIrEoo8GL32TDHnNQbihMczpvxnFnZHD1Zv+A=;
 b=m0JakkM//DzberOp3cq/6vC3+4HhNVd1dWie1oxzQ8BmnSm5VLqmFf5k28j1/HgMgh
 zt7sm5irW4KMEzP93I6r45zFO+8Wl4Laiqq/dw2vNK1VGy6lpBPAmsorDzJ8ekSnvQtZ
 9YSmBbBCDMfvfdsMY9w3vT7EH9mkSwFL3HRUlN6a9hfImDsMvIvS3gh7RV/kW2nrF6Ty
 1/bsPi5pdLHKo/0VBs/cNkNNwbY8d3esFf6GncJftUb0BpnRFWtgS2pKW54wCmKMxcPC
 ThJEldFafJyBMoxeuI/Nmjp+iJHiQpmuZMQX/hqNnhEdEZTbHYzhwPx9vahzRzPw84iD
 Soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pnMfb4nIrEoo8GL32TDHnNQbihMczpvxnFnZHD1Zv+A=;
 b=JsYwpbynhXYCgRrsmplcG7Fz/fC3frtbfiYGNZCFAJwQjStivGnfwny8hV20Nunv20
 ljzspb4tz6TbnQiV2DeVpP93XZI0wMM7XV/M0JR4WYyHFI1IN5viRVbe7P+yPBukrabP
 znOoARA2vdT9fhtFtU/XlAo/cosAwkNaWY8llVupZXjW6sEVCS5S4e+vUHrszWWQqlxS
 GfSlS5jQOWRqiRj3LcmVpChZP+KzPMFiZqQzXsHF29vqqgO5Hpa5HqDFybVXm6zfAU51
 5hvfyjeCcERzSbomfc8sNtDBl9RW7SzZt3XZSwe+cPvzYDE5fKw4PRvzDPyFpLV8ZhCP
 tpog==
X-Gm-Message-State: AOAM530lywQkyTFl/ccJiQlER/ZnSqpsEGfX4ZOc4rfG8Pa62V6pVGVP
 8RaBT9Hy6S9B8cOh0N7557YMm8ih+4OKhsgop1mPwA==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr7204491eja.250.1607615982359; 
 Thu, 10 Dec 2020 07:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20201210125115.1812083-1-clg@kaod.org>
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 15:59:31 +0000
Message-ID: <CAFEAcA94t7wqLM+g6xzpybRGVCmDOB8YHTEnyFg+ePODreDWqQ@mail.gmail.com>
Subject: Re: [PULL 0/5] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EKzzCPX8kKM

On Thu, 10 Dec 2020 at 12:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f638=
77:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2020-12-09 20:08:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20201210
>
> for you to fetch changes up to 6f5f6507e49df4820207a94f3aeaaeab08092d32:
>
>   aspeed: g220a-bmc: Add an FRU (2020-12-10 12:11:03 +0100)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * New device model for EMC1413/EMC1414 temperature sensors (I2C)
> * New g220a-bmc Aspeed machine
> * couple of Aspeed cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM
