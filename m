Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp637757ejb;
        Wed, 26 Jul 2023 08:43:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFnteaSDsKPSbsEjJvIxoaasB/hSbp1eQmSZ6xyaoJQo8AywXLqfYQWSPUYb2Yvi0Kygi5h
X-Received: by 2002:ac8:5e4d:0:b0:403:c667:e691 with SMTP id i13-20020ac85e4d000000b00403c667e691mr3494073qtx.22.1690386214817;
        Wed, 26 Jul 2023 08:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690386214; cv=none;
        d=google.com; s=arc-20160816;
        b=dPgq+2P7zM3rj7j23LtUxpuAksnmK34ZLC7LP6BGik7fxrvqCep68gPtxBuXLrWwpN
         KR5pkIWhhGKaJHT43fAB65pzp9/gohIzFj+nkTeeSA0HvzTdEcw3AjQZVJ90dT2J1FZ1
         Rt0d/SOpSYv5qLMgoGTVWCbLWcUZOKDW+GXceYX0OeLIk2uEIlS0+3L0yhOItZmi7hQn
         2wPMSqi0dNgpMaMqFPz/+uoEPd2XAWAGmNXFGEnYiE4yKxpZVFz5U5YRpZOdPyYxnQIw
         iVtt42SURxjfdIAUuApLfM3/f+PwP3SJV8gX+yQ6997fR7pFX8AME/3WaPkZiBQ3XqLI
         1tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CxCnJrXF2z3RHZjLd4iphHiESou6tBw4qRto528LdQQ=;
        fh=iLQP/BX9WTMz92slfFxqwy/HwvGj/UWKcoxJr2yiUlM=;
        b=XvkD2zeDMAk7pqU5/LlX+JcW1xxpFu1ucOBRlcC4VyNf5tA8tFRtU/N1PtdPPMz4T6
         efT3KC524Did06myEJgOZFMNqgfVpGljKOg83o1EgtnkHNfZkLPAfvIgATsXDuBWA177
         oiO3xY1hXjIR16bulMl8ogrl90NopbsZZjUZ2Qp1hMa1OTdu0QldlTHHNtup+JY1QC8Z
         Y6CLC9EbrqneGnVAsOKB6e4Xd9GNNJo4FaIhpsOzIs7azFyGioh++C+0ILbFShVTFq7Z
         LY0ntC9Jd/eJADRehEpAIuRlNvDA0lpL9aCieGGIiCSivYejy2njA/n4WC2shBVsw9Mh
         nZEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEIVS2Jj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25-20020a37ac19000000b0074acaf141ccsi8006941qkm.676.2023.07.26.08.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 08:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEIVS2Jj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOgIf-00068V-1V; Wed, 26 Jul 2023 11:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOgI9-000649-Mj
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 11:19:10 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOgI7-0002uq-AP
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 11:19:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5227e5d9d96so96551a12.2
 for <qemu-arm@nongnu.org>; Wed, 26 Jul 2023 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690384743; x=1690989543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CxCnJrXF2z3RHZjLd4iphHiESou6tBw4qRto528LdQQ=;
 b=TEIVS2JjdUswU5qOAhX8yM2SUH3MzPQ9xsSdztmyi/vDH6TWERK/i603qXJkakjhQz
 6CgIoW6Df7YhOPO3VgqBWyAUfVaAJ4R1ThdbNcWar/OqlOgF59AyRzhq0OwP7SY2/3zF
 Gbd4WrpLB4tne3nW+HYdEOl7p22sHMEinkwEolIpDd2K+oJ2yeRwDH49zTunPvhtmPbx
 N3pEE8ON1qtqyCkfVZL2mZ2JIopKCn+lS6FC+fZ19foFHfw90AbI7BEQBH7B7GyB3Gv2
 6WfVJVAJynej+q1ANrHkI78orP3fGPJ6JmuRqFyFfgjBZOT4Wa+Mi14yI8sN9BvCIeEe
 3qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690384743; x=1690989543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxCnJrXF2z3RHZjLd4iphHiESou6tBw4qRto528LdQQ=;
 b=Knp+44JQF/1jGvVs1hBiTLS+8fTA2XEd2m3Y7flJCM4EV5uGtD9Fl9yO9Sq54EXg60
 alPrc0ShbfVzuRNLjl+xHRprsFabNGwuvcTvG3T+YEBLQyGhEb5oM/OH3GfR9KcHkzE+
 H3JhrMydq/3RtqCjLqyjCASUj4lpQsR0bdFXnspnqr+LF13f8OeP5DHtSH+vWxzu1ztI
 0q9aulfdbfDXBPaAL1BqK6NyIO3l4Af+tVYDq+8MXlhnc5TYkxsmWyIA2zmQJq2/H45h
 vSDbP9QmRZkGdevkRAp3TierZ3xXARCjDAxMw9YZQsehdYRIpKAZYZHV+rqFLttyT22H
 k8bQ==
X-Gm-Message-State: ABy/qLYcDg0VIBDRn5G1CJjyFlap2G1Fjo+4PWJXcexcVQlvrB/ZrxZw
 op74WM9lEbS2i2Zh7z0Kv/e9lbFPE/wcvql7T091og==
X-Received: by 2002:aa7:d1cb:0:b0:51e:22dd:5e90 with SMTP id
 g11-20020aa7d1cb000000b0051e22dd5e90mr1906668edp.4.1690384742832; Wed, 26 Jul
 2023 08:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690380197.git.jcd@tribudubois.net>
In-Reply-To: <cover.1690380197.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Jul 2023 16:18:52 +0100
Message-ID: <CAFEAcA-s6tfxc1WxnMN-WgRdpmeL88sQNi27j_vi876OWiHQYw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Complete i.MX6UL and i.MX7 processor for bare metal
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: w1etW2MEFvrF

On Wed, 26 Jul 2023 at 16:12, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> This patch adds a few unimplemented TZ devices (TZASC and CSU) to
> i.MX6UL and i.MX7 processors to avoid bare metal application to
> experiment "bus error" when acccessing these devices.
>
> It also adds some internal memory segments (OCRAM) to the i.MX7 to
> allow bare metal application to use them.
>
> Last, it adds the SRC device to the i.MX7 processor to allow bare
> metal application to start the secondary Cortex-A7 core.
>
> Note: When running Linux inside Qemu, the secondary core is started
> by calling PSCI API and Qemu is emulating PSCI without needing access
> to the SRC device. This is why Linux is using the 2 cores in Qemu
> even if the SRC is not implemented. This is not the case when running
> bare metal application (like u-boot itself) that do not rely on the
> PSCI service being available.

Hi -- it looks like you forgot to cc qemu-devel . Could you
resend, please, with qemu-devel in the cc list? Our automatic
tooling only tracks patches sent to that list.

thanks
-- PMM
