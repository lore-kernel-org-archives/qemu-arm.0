Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4105FF364AF
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 19:07:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAuid-0007Lo-0x; Thu, 09 Apr 2026 15:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAuia-0007L4-U6
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 15:07:08 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAuiZ-00033m-4p
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 15:07:08 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64d5a7926cfso1255231d50.2
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 12:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775761626; cv=none;
 d=google.com; s=arc-20240605;
 b=TEQ9QSQVPPgBhDsedW2X5TXv4kElL2tJYQq0qX/Paw5FuafkHkzrXXYEXgsZk2tZ8C
 usZmVfO5zg0q2wvPmvbuJpuR73dbEon2J7Py6z02CpPTD77Iso+Rm8/4SLHejYb6REcO
 lK2NAAlZDEN4+7s0l3l6zfnG8CMP6+QpapCTB5TwLx6ohcC887tOrRDSCjrR1QMf2Gv/
 QI8kiA3UC1cmW7jCtLjP7R+h5pz8/WwW0jMmcFJ+pnIZOrZrkSffZ9DjXf9TnbbDJBDL
 yb3K1YCUQe4glMxAGQiKzuYCZK5LI2lFjrLbISSu2XofEwxdMcRFCZ+sq4Ky6ggLH41r
 GG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VCDUOnUjYsgKHbUr94QqzMix7XhtwcU4xW+CD4gMNVg=;
 fh=hOWnywY/Ah0bwUaL64slUFKtPHQ3FQqX1Yop4XcCwPY=;
 b=i+RYSmnrA7cT8hlykCRf4QDxVvLIhcZhn9LCigiUIAmS671soUY6VNaIcXBPImlIDJ
 FD1jjkqbH7Thag6KqqWDaSg7laqJc0HpG/66qmFKQPVTqK+7JPDZPLbNVqHzfJcLYi2Y
 ybu+GPMOR2zl62wqccGrjIVPRb65PYrEu0IpDel3GKZx9Ws28F5yc1mEcchgkHGW0L82
 oICwZzBRNjjsdMKaN75iCkzICQdbKGM8o5oy+ekyyt8nIO/DpAPj9driWS1UKfAK/qJh
 3ZvBxaca3VoFtcIPE52BXStm/KRkIkchJBZh55eNSJ4L/qtYQo4IwGnYyoLJDkFvjAR/
 Rwhw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775761626; x=1776366426; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VCDUOnUjYsgKHbUr94QqzMix7XhtwcU4xW+CD4gMNVg=;
 b=Xo0hcWTkS5OAZSMaZcsGOc93LOPCRdm2k3pmw158rmxsiaELhbagpIyrE15Hg6YVaD
 nG75owccc/RfiJ1ldTfFW3p0Oazs3GyZmBRKXR7QyTC/yx3gOcEJgBaC4emzKpN3tpm5
 yeRObIU6ENgO5xM8443aOSjDC9cuD1P2FnS1mjqi93kWrXqI9i2QGgLp42cPFza8l4Y7
 RdTdJvh5LjF/kV/gs0bU4wgKmceiR8XCRr0FwHIUCCTav6bDlgFapShY7s9toUWue3eL
 AmYlOm4GjpT+dI2jAvCu+VKagoS8+Ggmaaf0XUC8VZb6UokVaGZkECOe8zfjgVeJH77I
 x/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775761626; x=1776366426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCDUOnUjYsgKHbUr94QqzMix7XhtwcU4xW+CD4gMNVg=;
 b=bbB+HSQNTPIM9JaKNbvBDkcywvSYGkfu74rGgrQqqU1Dh5GO7XFkYTeCSxd1HHp1A7
 NlMkua/PUfi62p1N1PfgnX98zTp/bJOSUCfEJIDV+GOAOnEJdhakS8HEq9K9h0jvq6Cr
 KlH3s670hp4SwBFrFUC5G+DGR49Anj3wc241C9uLx4vjtjwYVq3zlm67/cABxpdeMU8D
 EutR33cpCF9LnHcXQ1BJ0wJ88wUZ09MxqGGHoY6LYxCw15naCEFgdSLbBxqooxvgGPoM
 eqekIY01vftd6kZL1DI/Ha/hoHi7OLCJFwVC8l5wYD+S7j2DXqgyRSWRl8qgXAIoY4Dv
 0i4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0u8qzrUcC6Vh53u1LQoRZTfrwwYVt9OYV9W02X4ANIBawkuUC/inLsR18fV4Nu7WdfWmYY2fo3w==@nongnu.org
X-Gm-Message-State: AOJu0YwVl89ANBAZ0dW9OqgkxBxFbbf8wWMD0FZN//1A4HE0YZz5HrNb
 IpvYR+KvUQ2V6MhYCACHSu0Ot/u6ddIfuNyUgmtNlQ3g2yssEkD3K56ja0BSjCIS9Pi/LPW0/1s
 c2E2mOHVIP9hDn8lbo3DJSF0WvyL+38i2e8oIuwvNgg==
X-Gm-Gg: AeBDiesnnOfBT5040lKsTXYCIe+W4k5k3mXQA07YbbgjBVz3U9Jehoy1KZNsj3GrIfm
 K1b/skcTWXzvAnwsisCuhxRcOk/CX+DFV4/zigOqcwPPNj+nkb2hTKVHtkzeur32+9qJZ3meWzL
 VoXjW4ne0yBEvJPUxbChdLlMhvm2d8PmErQGao4nh+LYdwDqILiK8wrGN2rG3tuxGX14eBz/Ygv
 SkQM3sT0uAuwsQFznjgTm7spoXKHG2bC8/j5kdFJE+IKswidlGD7lT+TuNUQhXaTcHwlweL8cNG
 k9ndpD8s793M1+lnmYp0uzzw58ux7u76++579QzES5o6/BQ4AtNUnZTLO/XpS05Nbl4=
X-Received: by 2002:a05:690e:d5b:b0:650:7511:789 with SMTP id
 956f58d0204a3-65198b56614mr187656d50.32.1775761625740; Thu, 09 Apr 2026
 12:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <20260409175234.40792-1-lucaaamaral@gmail.com>
In-Reply-To: <20260409175234.40792-1-lucaaamaral@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 20:06:54 +0100
X-Gm-Features: AQROBzATEW7_n-8rIJ_dlFdmJLtfB8kWhpFaZ2Te9cl9Ji6HKCB-46EM42_U7w0
Message-ID: <CAFEAcA8rF3nuUTd7ARkcGpr-sA1DYJEJc-2E_URQt6nr8u6cGQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 mohamed@unpredictable.fr, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 9 Apr 2026 at 18:52, Lucas Amaral <lucaaamaral@gmail.com> wrote:
>
> Ping.
>
> https://patchew.org/QEMU/20260317175744.32469-1-lucaaamaral@gmail.com/
>
> Mohamed gave Reviewed-by on v2 (nits addressed in v3/v4). Patches still
> apply cleanly on current master.

This is on my todo list to look at; I've been prioritizing 11.0
work while we're in freeze.

thanks
-- PMM

