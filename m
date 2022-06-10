Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1112725lfb;
        Fri, 10 Jun 2022 05:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJDysyyGo4q5/Z3asts6inpgBr1ydI1IxpdQXBGkzwbk3qkMk6pkIQEK3A0NzG3fUM4aUm
X-Received: by 2002:a05:6214:4245:b0:464:43fe:c019 with SMTP id ne5-20020a056214424500b0046443fec019mr50286221qvb.72.1654865613774;
        Fri, 10 Jun 2022 05:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654865613; cv=none;
        d=google.com; s=arc-20160816;
        b=flKqtMd2pxQ3BOiBWCeFL1HCk8MDybC9keLLIoz0mxE96VfSg4X+96eS0r9mRVzoOH
         mWE93rVrgSK0d5wU0u6ZX4ExQWT3kSH6A95eQBtDHr6irewRrEN+pjKpWtZfQnAbQ7iV
         24RdEsvDsUx8Murd60blGX0EszyUxl2PbWRTcdXF6HA0ERXMXt/InIZkRYaqF36r4/dm
         xAqZA54z9OX8A8ZIhWg7r6i9fKuQ0pFdKg5eOb0MFpgGgR5aDGXYrUTj284i5dX/oxZ1
         mh9+jJtZB9QG9+sTYhMbY9W2q3T9ZasCmuiYHdxElN9KBrVvuqIk13jtfkt9EckC//i4
         eIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=C352zPwY+y8qyLidDVABt3DBbNONoM/YbKmD+TaPkfA=;
        b=GvQJPufn/9V1BvyY8lTzC4PA9qnKclH3GmVvHiQdUAyymuSHLNYl0aBGRUMr9uvy0C
         QH42fadwiUM//O6cw8t+IJt8UxHLi9wNb8z7i5zkkm873dW/RXqGCsiBstOtHmuBeTn/
         64gVY25dLkOfGRe1tQiTV9+ZICThtUJFDfQ3vLh3l/NDSt8Bz59gBui7FhYS2VpqHYb2
         fiQIu8V95GeQneY+6ucp9DLfiwAAKPTeSHSIZ4+tf/dNu8dhR+M3UclJgfHPHVpRjCsu
         BGsMKJMIZSsN3dHiCMbJo/ZMgRGAWTHxU+yhdzI/F/IH7UkQYnU0v47LsCNcQfq0vTvF
         9ymA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C2C5I0IE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea16-20020a05620a489000b006a6c372eb4bsi6979187qkb.119.2022.06.10.05.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 05:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C2C5I0IE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nze8r-0007rT-8Y
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 08:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze8Y-0007qe-87
 for qemu-arm@nongnu.org; Fri, 10 Jun 2022 08:53:14 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze8V-0001iG-H3
 for qemu-arm@nongnu.org; Fri, 10 Jun 2022 08:53:13 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r82so46791492ybc.13
 for <qemu-arm@nongnu.org>; Fri, 10 Jun 2022 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C352zPwY+y8qyLidDVABt3DBbNONoM/YbKmD+TaPkfA=;
 b=C2C5I0IEVNjqT4G9J4BI2RiJ2/k5RTTx5bCX26WfKoVmuSLj82Q0mUxX68zcodVAjL
 o5T7a/o3ccwLxpZ9IcOZXcQZE5QnYWp8KhZ6+YG7IxfmBO5u6HlEdjDUkh4AKzZOBfkP
 OiSzkABblv+/62FAKKhyZKlk7JlKSJDcOjBwqysNgeI2R6zzTT2Ajz+M/K7w7yWrvrXr
 d3z1Etj3Blz4h1ZUURj4C/C/ZYwHDhptSVCN5dVdokKg/8B2qzV7Qu69e3f0LB061B+6
 gFzwAFcRJBT42KPh7nWZWU5OB8VupzVseHeMX2b57NPWbUUhTiWycHxfCrsyJAq8ljM+
 5i3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C352zPwY+y8qyLidDVABt3DBbNONoM/YbKmD+TaPkfA=;
 b=73fYhzFyICPuZaJj02hsk8UFMw511WYxAjVQtZ6nQLtt6DlG9T/QVEX353RHXXvgg3
 DDFSyhfEJwUCfLlM/D9NJb9el70DlG3ddItK5+VBfDMj+RcYDAQKtWpIN8Ibrhfh1/bl
 KHFKCsD2kD91vGIzbLUv46UqQtGud+i00pJIqXqpLBHA26VXNIaLdUmH4dZbeQSSIyJt
 PzM6wAePehoEWzwqPjftRAnG+ioEm6Ix/e7x0o6IVcpEDMtDhzTcQ9FHYq1s1sKLCd/6
 8tqks9j9azB1/9WGBHeQapxh8Z4JVK/fH1JBfaionZ+xwkl9FbfbPfHO/zqjGINB3vbs
 G0Cg==
X-Gm-Message-State: AOAM5318Nhjv3Ltt2icafQGSpbJ0esHh4X1CXk1XxNIFRoPBwXtjwgBr
 Yjsm0jpWv7RNMChGXIeUMa+BC7C7fjvTtC4w3cSWWw==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr42541436ybb.140.1654865586586; Fri, 10
 Jun 2022 05:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:52:56 +0100
Message-ID: <CAFEAcA9A5SZLuuScyAvYnCc-4aANKr7b10FEp_o4aN43WSbH=A@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] target/arm: tidy exception routing
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQfHlFs0mPj1

On Thu, 9 Jun 2022 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is mostly code movement at this point, out of headers
> and into op_helper.c and debug_helper.c.
>
> Changes for v3:
>   * Drop helper_exception_advsimdfp_access.
>   * Drop Rearrange Secure PL1 test in arm_debug_target_el.
>   * Improve patch comment for helper_exception_swstep.
>
> All patches are reviewed.
>



Applied to target-arm.next, thanks.

-- PMM
