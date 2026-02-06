Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52668EE208C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 11:33:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voK5X-0008BM-Ch; Fri, 06 Feb 2026 06:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voK5V-0008AY-2F
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 06:33:25 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voK5T-00023M-0d
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 06:33:24 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-794d58b892cso19928647b3.2
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 03:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770377600; cv=none;
 d=google.com; s=arc-20240605;
 b=BtCvTfrJMso8CN/uqbHQxoSIkAiT56CSUxpLmzgl6+X8GXYSFYtof5z6RCawzP+vpW
 9lvg5YzN4p8tRu8GYbm9DBJGFDS9JRSvS90GOPeIv8BwSM6vI03us8qwvX+V1QXPkVC5
 uBsIcQcQfD3uo6dufXw3M9mg97tw8nj9yVw5u71bATm5VbUOSTysL4BCvF5DeAM7KIMP
 PjnmDx8RSrexJfhWMOKt9WIknqqKUS0igYTOSv8RbMbLQpFDqcu1lPLP+8jPo5f7K052
 qFyoViapZ+tAcigSgG+CBY+D/QS4aDRfRbFh6e55AG3Bvh3yEsRPCwYpUlwlG0tz5hUD
 B0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=T++GV8RpjxB1iEtwc+EYk3ASVHUyL/7ICkMQtMIUrgI=;
 fh=YdnhiOnhqrLJWlOmkuJeBjn5dpOUu3abuhyc0lwVnlM=;
 b=RJvlnm4CTWRMKiHzm1wajXpPA5ulEn08CP0n0AZFgg71wT7TaynKAUqxkl10g1s7/z
 oygEjTti6gz2l6BhCk+FlkcxSs32qHadAQHzbNtiqbpmFPHWIW2p3j9yUd9guP5P46p4
 xKAA34Nl36vNIVAXkcFKI3bmiKFLMhaHWTIz8e9EAoDfPohO8L+etCJ0fp6hTXiqoBx7
 fzyvOn5Dk9nUvVMTha0MvfHuEtMvpT7UdjYm92WC2H8yIiBhyow1cVZpIJyOlK3zuV0c
 SlT3tlm7wHq8XD46fUKXE6yzRR0liYH+rknOFHw+ksh3ijZnXG5U4AoZ2Nh+VyxpT/2Q
 PLtg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770377600; x=1770982400; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T++GV8RpjxB1iEtwc+EYk3ASVHUyL/7ICkMQtMIUrgI=;
 b=LztvEooDArF+AkPO1fLlzGhX5rUCNudRIB8/xhUuj9YelvBUu95qDDaSPya7NyaCR/
 tX0i/GHq2KJRUrsZL0JWEE1bKqYhngNviT9K0YACqZJBXcoLgNf7Hrq+R/+7yCkqKNWz
 U46/ZT1HzPY2QlaZdTJRnPbj5EA5eOqK70tbZA169s10rzQtk9YuvCYY47uG30LfeNa5
 VrJ20GufO/8ByZXA0frCVOXUNEqBMlIzW/s5eLXfO0qSAhzuFU+pbhrelnNMLcZK256s
 3eMb9c2fZv24BfTGliEcqyM4pFHkdENRwHKycxkRoQ/FolSH8XntDjMZCYuUxSPvQDlk
 EL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770377600; x=1770982400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T++GV8RpjxB1iEtwc+EYk3ASVHUyL/7ICkMQtMIUrgI=;
 b=PBEsLQc+oK5qsNoyZtNaXBL9eaE/+XrbGqKJyTjQlgkuEfUJ6w8chT+d2IBH+kp4jq
 sxNdduCLLQ1RHC/eOr8Kjc+HGXfyRd84ntJkuqSi+I9rxiA7iXwzjaNSqxdjxgmqKzG8
 /o7H8cfiD6aBt1g1BloLcMDy9gv4TsWdUy8qlyJitxq1Mvg7Hb2/Do7AGIFrKHYjWzPi
 OxqsuDBoYO07RB0kwyU56SZqDE96v+R1DSOOngxi2si7/SH5m1j25PTBTP7nN/KGbhN9
 w0J9juwalfWJYYe9j0iGrbhwrm7yS0ijdAjqFCyDXsKXt/zyUN+f19MNNSXqsCkkr6j1
 kgJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt9XXuEI0EmElteJrxpsugxD5uAGF0SH5e/Ekw946L6bkJlAS6L91Nf7Wd309bZWEqf8SDymuL7g==@nongnu.org
X-Gm-Message-State: AOJu0Yxh2VC6bZ6d/Sr9jXMeUVgcxIMilsrXsGeRTg+Qp/J86PXeUeXz
 JNPKPGkTS1SYmUhHaoPoM/thXfrbj3i9Ux67kHZkPJFZKMubUtOVH6C7N1H1tM7q+1dlpo87R+0
 xVhSBUaOsb5lCuElHntOJeYvOVf/dlHWSk70Bz1wSOg==
X-Gm-Gg: AZuq6aIxbACFrwxAQu4LpnEni45q2Z3puOIuJE0eTqNEBtlIlvpCGnhLpk6/XKvaqui
 c9ryF0ORLTN/kVZU9vSm4ZKVM0UlQVDZ8HPZNdeMMa8vWHXOFjTmhT590gOeWh0+O203Y3kcjm/
 DMs8LHfySuT1n4kLcpuNnJOieB2OJBdrzcF7dgBozecb1lO1cSZXN2FG+6bSR+tq2uVlvHitUOF
 2j2t16tjL+kJVtO8EmhXK9g3uTo6RFvgtv/Tb1DLpqsAa7vR9aj3/o6uVjfei8dfkTnTUd2Ynl1
 Hc1NuLoTskITviiZmrBMOz63obZldL4Jqc6QfclslHxyLk9I19Y7L8Y=
X-Received: by 2002:a05:690c:61c2:b0:794:de8:cbd8 with SMTP id
 00721157ae682-7952aa89570mr24373067b3.19.1770377599718; Fri, 06 Feb 2026
 03:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20260206053340.3716041-1-jamin_lin@aspeedtech.com>
 <20260206053340.3716041-10-jamin_lin@aspeedtech.com>
 <83d409cf-868c-4a2d-b1c9-5741d3e36adc@kaod.org>
 <a6757611-32d0-4451-be0e-724648e1654f@redhat.com>
In-Reply-To: <a6757611-32d0-4451-be0e-724648e1654f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 11:33:08 +0000
X-Gm-Features: AZwV_Qh4_xk0qWbaqx5val6sw-HIjvgmLMSCldlNS-__45PiYHH6K6SrTnAks5Q
Message-ID: <CAFEAcA83c+ZHANxxKQBhCNvX1ObTp9hk+Wb0Yzb8ezx7HqDxpg@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] tests/functional/aarch64/test_aspeed_ast2700:
 Add AST2700 A2 EVB functional tests
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 6 Feb 2026 at 10:40, Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/02/2026 11.11, C=C3=A9dric Le Goater wrote:
> > + Thomas
> >
> > On 2/6/26 06:33, Jamin Lin wrote:
> >> Add functional coverage for the AST2700 A2 EVB machine by introducing
> >> test cases that boot and validate an OpenBMC SDK v11.00 image on
> >> "ast2700a2-evb".
> >
> > I wonder if we need to test both machines. The test is already quite lo=
ng.
> >
> > On my test system :
> >
> >    qemu:func-aarch64-aspeed_ast2700             OK              119.68s=
   3
> > subtests passed
> >
> > With both machines :
> >
> >    qemu:func-aarch64-aspeed_ast2700             OK              219.79s=
   6
> > subtests passed
>
> If the machines are very similar, it's maybe better to mark one of the te=
sts
> with a decorator (skipSlowTest maybe), so we don't have to execute it by
> default, but we still have the test around if we need it.


It might also be nice to have them be a separate top level test,
so that the tests can be run in parallel. AIUI having 1 test
with 6 subtests forces all 6 to run in sequence, whereas with
2 tests and 3 subtests each you can at least use 2 host CPUs.
Or does the qtest subtest handling include parallelism?

-- PMM

