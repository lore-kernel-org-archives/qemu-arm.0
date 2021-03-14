Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2828008lfg;
        Sun, 14 Mar 2021 06:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9wH55qRlmgJXzriFs1q2IzZXKXsjQpK8kXKZp5dNwnyxI7I+53XOCJPRY+uYqn1w8rTfy
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr6122839jad.83.1615727943510;
        Sun, 14 Mar 2021 06:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615727943; cv=none;
        d=google.com; s=arc-20160816;
        b=wdhMxCYllRBnw1GHwplfXq0ohJ8/nGZKHKVjP7xt5Vb4hIaKKmbpRjKaoG10yFdVYe
         7ZGF+168WGdq0gTzM5ymxQZZvCLQEYiH8kBdsrNIAHszaRGECw9+sLgE1Pj1f4gDVn4e
         tdHeKkKVjvYFegChDmGETINx0jMzNFXvvH5EFBSJpG6FU1DALMt125VTzIBOYnosqicJ
         vmXE0mtXLNyGiMRSj1FXWljSqfY28T20jz6al8Xd8VQDbxveHuDIrJrov0jcgsx345hy
         sEkwcwF5ha1OPj3Szhd045TVBczulDU1+sPPz7C3/4AGGHDUYLc9LFiz/SzKSRArbYo7
         iL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=McFs42ILNKixEv2gIpOsYdm7tY2XM7v6iokt0UWP/jw=;
        b=uUMjvISPYLMHOmfmwSs7n4hjTLvjBHtFdzzgS2Zs4CMPwMlW7E0fnjtCFIro3tmysy
         kjDQJL9gQTn2FZC7T5Bf+4er8ikZyRMZgI23RAynC+539vNuvngz2eu0499fCJ6nDMbr
         9+PEG7p5JyB0sw1hEbT79IxzGdvbkdNFe31y5JkV4XMy1aVVHhz414uPiot6Ls3kw/rJ
         hnUB3rw8hhoSpZCP0WhmCqkfjtTXuRH560BJj3L4saZpyD5S4idGI5d8V3ovWnrTxDWx
         wl7uq+2TMWv+0GOaqp9FoO7TXMacX7Dqy0rHpWJVzrTnSzWesh/ky8ssxwF2B7uthgLz
         V6TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=op1Ge9qw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si8632441iow.105.2021.03.14.06.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Mar 2021 06:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=op1Ge9qw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLQe6-0003M8-J7
	for alex.bennee@linaro.org; Sun, 14 Mar 2021 09:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLQdb-0003Lv-OI
 for qemu-arm@nongnu.org; Sun, 14 Mar 2021 09:18:31 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLQda-0004HN-1n
 for qemu-arm@nongnu.org; Sun, 14 Mar 2021 09:18:31 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e7so14143751edu.10
 for <qemu-arm@nongnu.org>; Sun, 14 Mar 2021 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McFs42ILNKixEv2gIpOsYdm7tY2XM7v6iokt0UWP/jw=;
 b=op1Ge9qwVGstGdaxYpuXmLt+TOGylNwm2VHYAH9aiqHA9cWBt+GVdsm0yI3LJfNqk5
 nYKZ3ux0ohxes4fgRvtBDQevgcYfOcNgZKaxXw9SuTidUd9SKnMAWqvZHo5HVKA4TtXu
 Z+nyO1pm4lZWzmnchgDnrIWF1P+TWkJLbG39dD0ilvxoc+st1GZXf8bVLX0lGQm7hePS
 T+8Wz7GCx5daAGR7OcJXCNf9oN3e1qcB57kMa12hUYiN4E20nMwec8SsTP9KeMsvGtcj
 5Lyv1KpTh4YeTTQFk5UJCqJM6UcFsuai0BcAZYJYhuYghwiD4g94OS7H4WgCK8IIfVXf
 f8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McFs42ILNKixEv2gIpOsYdm7tY2XM7v6iokt0UWP/jw=;
 b=JPYF2D0AEdw6kXIcyK2tOU2CInKLCv7REWuhKyZQ2t91ywn2gRW44KFcgHywIo5DHU
 GQ5Z+3V9ku9nuJIgCsnw5XTZ07VPrmN8W+V4hsBzqUfezYo7KcL8FmC+qYDiiroZZ2IH
 2sUmw5jTiXCtBW2TmCy8kSRqW1gsJbEJY1fcO9UuZSNSvAYMjIqpghK8LuC410/JaWOD
 bRRWQx2jMqqkC5Q6Vydnq2ne9PgY6gelzhomNDlJI9sEdx6di4OSPtOXM0HxHHpYyWXm
 BsD9oQ6vu3qVyiUMnWgpQjjIpxZxUc/pRhRFXSYHTPreuFWDr7zSHXTM+RYko1omO87P
 n0Yw==
X-Gm-Message-State: AOAM530GIuqTdP5fUdIvJHIBL80qcslvH9VzhQDNyUWtI289fBmiXW8B
 jevAfAs+hGl07kr4tQL7O6OJvm6k8ZOohr+/CDJjLw==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr24625041edt.36.1615727908450; 
 Sun, 14 Mar 2021 06:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <20210311180855.149764-6-wuhaotsh@google.com>
In-Reply-To: <20210311180855.149764-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 13:18:06 +0000
Message-ID: <CAFEAcA8fHD5jrg-nak=sFPf0CvA0bzYqVEh_ZDCxX+DjPPPuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] tests/qtest: Test PWM fan RPM using MFT in PWM test
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ds8GSAJnQiOa

On Thu, 11 Mar 2021 at 18:09, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds testing of PWM fan RPMs in the existing npcm7xx pwm
> test. It tests whether the MFT module can measure correct fan values
> for a PWM fan in NPCM7XX boards.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


> +static void mft_verify_rpm(QTestState *qts, const TestData *td, uint64_t duty)
> +{
> +    int index = mft_compute_index(td);
> +    uint16_t cnt, cr;
> +    uint32_t rpm = DEFAULT_RPM * duty / MAX_DUTY;
> +    uint64_t clk = read_pclk(qts, true);
> +    int32_t expected_cnt = mft_compute_cnt(rpm, clk);
> +
> +    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
> +    g_test_message(
> +        "verifying rpm for mft[%d]: clk: %lu, duty: %lu, rpm: %u, cnt: %d",
> +        index, clk, duty, rpm, expected_cnt);

Hi -- this won't build on 32-bit hosts (or on OSX, and it warns on OpenBSD),
because uint64_t and 'long' aren't the same thing. You need to use the
PRIu64 etc macros when printing uint64_t values, so the argument type and
the format string match.

I've fixed this up in the pullreq.

thanks
-- PMM
