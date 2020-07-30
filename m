Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2891320lfy;
        Thu, 30 Jul 2020 13:23:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDifloV5ZRI1QBJ2nb4ND/j1chZ3G3GrJem8JEnBG/jOn3PxgjjG7OXozAf8to1iTDjyrK
X-Received: by 2002:a25:cc88:: with SMTP id l130mr1142354ybf.74.1596140636810;
        Thu, 30 Jul 2020 13:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596140636; cv=none;
        d=google.com; s=arc-20160816;
        b=0pm68+pOwjfhJ38UbTk5CuE33kRKiJlpe02jR5ZkaqoiHY8CPf4chNOMiwYXbk6etu
         OGJXz+nedixCoNrnonGauSsWXgvC4NJ9dCqKn934UuzAcSBLEQE55hHoXqNH5CDjOEod
         lRvxh1o2K+h8Mh3wFW9cA6yg7Xbi0PyjdqMHUwW7eZImJ1jNAkFpVWh+sJm5SPwp6YkY
         PB42/jqR+PYoxqAo8fFpIxYAn6FYM1wouRFpHlcBcrXfL5JAYmJjFvZSlAkC989MyIuO
         B0CMG0/2l3MM7nwDfiTv/oIIcCuXVfVRhfnOLLhtwmlJ3kSPTUnqvA8PAtt0Nkl7Und9
         q6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jy+a6XT66sNCAQL1CqUdWC2u5DYxP/Gdw12l+L2mujY=;
        b=cB8KfRYATq0jtMv0R0hnYh4JMSgNNDBbQ9aXv/wjCNkvM10byo/FlYWTb9+cjss2hl
         HF/OaA36zao/AXQ1J92WVnNklyOME8MzA8ggDCYVzRZLr+8tr6CusVUHHDaZcRxFFiI1
         SMmlzqzrvg6zuBGzVhm8wy2K0oiIDvocX1K4YWRa9hNSlpJSU3WmVtzV7RnXeEpqbhtd
         78qLKcmdkUPOUovEyACs5csbalLyG73TB30b6f3pqolplgWzbLaN2THiF2FF9Rltp2mz
         JCpGgR7yIG7HiI/qVKIqOCThBBzfbsww+14/PnUK2THBgNrmEhVY8v9xJ+rQuTK/Q/0C
         bl9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ai19AHP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 185si5149459ybz.301.2020.07.30.13.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 13:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ai19AHP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1F5o-0002L5-8D
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 16:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1F5S-0002Ji-8O
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:23:34 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1F5P-00037i-Op
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:23:33 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id n24so2932281ooc.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jy+a6XT66sNCAQL1CqUdWC2u5DYxP/Gdw12l+L2mujY=;
 b=ai19AHP1BGRpGSxQmVVCi/tHCtQsosw92xJqXed0a7mqVTIVKYaHpgtKuSP+Tq7oQo
 rAF5IKZLG7A2BZYeVdcYU0hQExo8GIsZkws0WloxBjsrTOv6FalKW5rOwtzICHOYkwfM
 f15wdUAf+PBBGlUxSqLzMD2V/tTUMTiD3a3YB4E9mVzaZ49ln9u+NymCgukbH/E2Lfdc
 vxmiR6N8bN2Wdy18eXsZROy1tCLYARc9nySIRgA8/hKhHNckcc16F8ddXxmvDirQVQj2
 nMO91KCqv53wyCbb0zfVAjrzjNLpqbDEk4yXSh/e5xTUTgywcpeqePyGP1rFShaRqjMI
 u6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jy+a6XT66sNCAQL1CqUdWC2u5DYxP/Gdw12l+L2mujY=;
 b=t3onFRstk5QZe1Moj3Hfcg41xo0mEdraF22hQ5foqTvxvjiB0CYnS8zehq0AyNDH3y
 6z6HiIz/kvRd3aDPTpnJl8j55z8X4l5nO3oxq8X73Iaya2SzEmJCjwORpu6Vl6N0jxHT
 +ZgR1yMFvSH8IWUXRq7l5+jdc3+IUmW4JsZEweTrF/c5ZT7PcADdcKEsGeim321KB5GW
 o58yzXRoROvHhC0glZybgbzHTkMl225zcmKkPy9KwK5iEUPFsg4POMa7E2ZnwtdsIp4Q
 I4F2lra/8Tk4iR/4CCSqRFkKvIQWQ462XsXvGSizhzuFx5VZFUoXBAASzFE5LWdNkHNl
 /c8Q==
X-Gm-Message-State: AOAM530c7pA7mmoqUjNh5wwmPIpqIdceJF+dpMMilXGCYJ9UuQQhAMpx
 1FiZnw68Bfmjrkj8wvI1h6PW2zF0IhMk8R9H8KRQDQ==
X-Received: by 2002:a4a:4949:: with SMTP id z70mr415472ooa.85.1596140609900;
 Thu, 30 Jul 2020 13:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHzJq-51dBxP8pniQPd7fy7J+jU2gHwZOkn-NRJzc5uNiQ@mail.gmail.com>
 <CAFEAcA9XmXhp+Crx09k++Ryd3jSL8U36FSMvw6X73sBFEmiofw@mail.gmail.com>
 <CAJoBWHypu+nJ4L3fE-tQzr_EWf294THGQkovTrn+j5iQ+b4MyA@mail.gmail.com>
In-Reply-To: <CAJoBWHypu+nJ4L3fE-tQzr_EWf294THGQkovTrn+j5iQ+b4MyA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 21:23:18 +0100
Message-ID: <CAFEAcA_H5V4EzaDy0C2j8VBYHtPu25vNj0SXuYLbypj6-m9M-Q@mail.gmail.com>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Derrick McKee <derrick.mckee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc2a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0SyT6HKmsWuu

On Thu, 30 Jul 2020 at 21:06, Derrick McKee <derrick.mckee@gmail.com> wrote:
>
> Hi Peter,
>
> I just got a SIGILL trying to execute a stg instruction with the QEMU version later in this thread, but the same instruction works correctly on the FVP.  Are you sure that all the MTE functionality is present in the master head?

I would recommend that you cc qemu-devel and Richard on
these emails...

thanks
-- PMM
