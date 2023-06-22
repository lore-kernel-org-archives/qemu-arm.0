Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp480029ejb;
        Thu, 22 Jun 2023 06:59:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5M9ZEmaKEwTP3ZsbvajVzA2gJncOytdJUyHiR7ocMcoY0QyAIVYDJ+9kVusa2H8/8+wu3l
X-Received: by 2002:a05:622a:1819:b0:3ff:2e69:c33 with SMTP id t25-20020a05622a181900b003ff2e690c33mr8782623qtc.48.1687442399065;
        Thu, 22 Jun 2023 06:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687442399; cv=none;
        d=google.com; s=arc-20160816;
        b=zWPVdul/4VF8crjpOEMR4EHIb75j5M3sis/DdQwqTnFzWhEBiza4VVXJvuhnaINfji
         JSnVyuHIicpfL997MQDej1mrzI647cnj4+oLniDQUus6OJvgBtgVLQKZY8Z3Iw3N+BEw
         vWWkkd64Ew17dCfEXONY8cjdWFr9GlOaLuYJa45CVdKjixP2qgNxiRtIwImUUuMapt0z
         26HjJnSXLNX5E+w9UynMQumm69bhdx1gjIE133itBOW5P5HH8KJ+0EdxkiAxl5cs8Cdn
         4vwy2JNB7jJDCUlQ+k1oY7nyydqdlELr62GURqXwUdOYPJsOFwdrtvjL3imth+Kb3Xzq
         Rs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bhCGK1Udctd5tXAFEWdQfmo/teRerH5/qe8OPBdNwJA=;
        b=GZDXq1sepHPsxiBUHvJTpIizcmUjl42wYFRBmBwjPbnfzV5nNRQPmqG8c1aeSX8Ju7
         ma0r08MCkTJm/2hkqv5bpY5/xbToc69lW5a6LbDZpUAEmujen7VM9rveVVGQO/ll4aAK
         +V+aTRu9pKDPHWhCWfdgOoC4MsRpBDdadP49UL9ZhHlcCgsUa81QYWCqBLphBiaVD6t2
         8BdS4chDa34la5e098Z40nf/X/cd+xdG7Az+7NVMEeN8vYN30ZE5suTp/9+lVf2Er/1Z
         E2mWEh1/xB4fnVld1KQpnsrIHVpapGCHMF1jvPm5w662u4L4vRwrODJIEEXcvxVoJgbQ
         W31g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wep8NQYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac85712000000b003ff23c87469si2672723qtw.315.2023.06.22.06.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 06:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wep8NQYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCKpf-0001t2-Tt; Thu, 22 Jun 2023 09:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCKpe-0001d8-5U
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 09:58:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qCKpc-00020l-6H
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 09:58:41 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51bdca52424so2129594a12.3
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687442318; x=1690034318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhCGK1Udctd5tXAFEWdQfmo/teRerH5/qe8OPBdNwJA=;
 b=Wep8NQYtoF06+cC7hZDTmkqE68iHopq7xFBixC0hEBP8sEBdSxZdqElPV2ZK7nN/89
 2XL3i3hVSbtQYZufLbm6RW9kfpXKUU+QaJ/vWhC0NINnF7fT0Yn6LRJsHmQVEkQZhRPN
 TRIhtDBA6hTCDJGKbecaDq38rCRBg1segGE4O+rnn2U1nbVdDbE1qWKCWvH8ulMKfIpd
 mqMu3kuj9z4d8klfldOPqgQiuVQVkzI4XQ7GtScLPAsZxlNQJ1GGCOzm28/SRe8xDvtN
 /lDl1G10gXBC3IkSZUo8fmm2EIhTZwuMPdEvc8OqNkkA7xW/TmSoa4jVpf0saDSMZPmN
 sQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442318; x=1690034318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhCGK1Udctd5tXAFEWdQfmo/teRerH5/qe8OPBdNwJA=;
 b=bueIFJidteYfcVVA0quxcyPOk0bO7qyqD/TKPqPjQt5K6n3PjNpU62wsk3hYxwG07Z
 FN3308iScrAD5NDJ2piv0pzspZHH9zGxwYIV6R11IYD0OhsCGCSLS1L4wCodr2upqvfa
 p0gDpzPQxUFiuIiEgv82swgE/xSxZaRKsvAoys2UmMCGmPcMTv6ttUp4yqvJVTQpXlnE
 zM1CtK1FgfYbm4g+v5dipNKelRe2kJPaQG+8gbssZBgIa5uzxvIoIcBDb3HilS3ZEypj
 zqkW7EGbe2piNkuzwyRlbUgXO+kINzseIQg5lIHE3hmXoOv6Mijw90pevuNtRdhvlr45
 eJtQ==
X-Gm-Message-State: AC+VfDwceMdwgSBSxbYXiECX5GL1MW+87vm7FkgzTkaYFTnH0giQwPwX
 f8bZ7q0L4wETNS5OoAbyxWSFSW8mkxNqu5+ef8DckZCCAhOg299Q
X-Received: by 2002:a50:ed9a:0:b0:51a:5b89:8d06 with SMTP id
 h26-20020a50ed9a000000b0051a5b898d06mr8296985edr.8.1687442318152; Thu, 22 Jun
 2023 06:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <cdacca34302f3eb2b71addffba1e6b89d7f4a190.59e36293.4646.46a0.a1bb.76c2198a3286@feishu.cn>
In-Reply-To: <cdacca34302f3eb2b71addffba1e6b89d7f4a190.59e36293.4646.46a0.a1bb.76c2198a3286@feishu.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2023 14:58:27 +0100
Message-ID: <CAFEAcA_mdccrdJOUui-4fQByoyyKHsr2ikxRECgtXPEAZwG=qQ@mail.gmail.com>
Subject: Re: No print info when starrting qemu-system-aarch64
To: =?UTF-8?B?5ZCV6LSk?= <xian.lv@enjoymove.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: VAcKYKk10JvC

On Fri, 16 Jun 2023 at 08:23, =E5=90=95=E8=B4=A4 <xian.lv@enjoymove.com> wr=
ote:
>
> Dear qemu guys,
>
>     I've met with a strange problem when using qemu as simulator for arm6=
4.
> I tried to start qemu with the command below:
> ------
> sudo qemu-system-aarch64 -machine virt -cpu cortex-a72 -smp 2 -m 2048 -ke=
rnel Image -append "console=3DttyAMA0 root=3D/dev/vda" -nographic -drive fi=
le=3Dramdisk.img -drive file=3Ddisk.img -nic tap,model=3De1000,script=3D/et=
c/qemu-ifup
> ------
> The file:Image is the kernel bin of linux kernel  which compiled with def=
ault config.
> While I tried with linux kernel-5.15, then the simulator can be started p=
roperly.
> For the kernel 6.3.8; kernel-5.10.130, the result is OK as well
> But there's no output info after the command executed if the kernel befor=
e 4.19 is used.
> Is there any problem when early linux kernel (before 4.19) is used for qe=
mu tools ?

The further back in kernel history you go, the more likely it
is that you will run into some kernel bug or other that
was fixed in later versions. 4.19 was first released nearly
5 years ago, which makes it pretty ancient in the aarch64 world.
There was also some point at which the defconfig had the
extra devices added into it to make it boot on QEMU, so if you're
building a kernel before that point you need to manually
add them. I forget when that was.

If you care about trying to track this down you probably need
to start debugging the cause of the boot failure, and perhaps
bisecting the upstream kernels to see when it started booting
OK. But the simplest approach is "don't use such old kernel
versions" :-)

thanks
-- PMM
