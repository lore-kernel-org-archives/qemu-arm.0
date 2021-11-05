Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1901497qvn;
        Fri, 5 Nov 2021 10:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQQ7/j0xE4DUakDznGBF/W+7dKRcgx63GeFUpRZJMA1JKjsYkB5coc/aKMPza1zRSzhCh+
X-Received: by 2002:a9d:4c99:: with SMTP id m25mr2155639otf.318.1636132030302;
        Fri, 05 Nov 2021 10:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636132030; cv=none;
        d=google.com; s=arc-20160816;
        b=G8gSCruSQ5acuW1dLDOajKVWLhKwh576R90ettBayrXky3SMmVqQbOyFYubaqSyNb9
         Xsq/VI++bGr2y10xAXEy20+RiIC+OAiUu8Tfdk6IYZa5oSe95RDsApWIjzaT905qz6VH
         h3zBgHAFmezNnFVe2GHxA7l8i4YalaxesuNNzhA30oTTUv8DeIw5mwWd8GnQ+MZ2K0tx
         YNLqF4DUtlb7aqXonoVCU1clHc7lUddVsRIsZN1e1fNat2x1ONtVm0bpylvta+iIoGoH
         zX0mn37mfu7j1R+SX7IXP0ix8AgWVHW1mwXOY5x4/z6Mh76miR8B584l5oV3ntaxIO+T
         wx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqeUxz6IogvV4pFJrCA00Z2D5aQn4JX5w71IQfKuhr8=;
        b=yNmCxG5U7Zaij1AeVUMoq5bATdah9qgn6SiFgv5hG3gn7YSPL1b9nh6NR5nP1+N2em
         AsKskQ71KNVu5L+0PEMUdOtHm7AAzP9aXdSTAZYVfUYSoDt0b1rItKYBv6r7CKSwxqUq
         KI1x4nRr163y5UjVo7deIDN1+Xw8wykYDnqriUZrJpmzFhCLspZk1D3/16TDYBF8XaXH
         DvzHHveclnTRnogustl0lbQpbE3j5LhUwPUEggdwtSG0e471e4jyCAr3C5oxMqSj+Vh0
         VDvrvrZ7oCIcJk0H84FWI892IlAaSykaU9yYpDUmAPCnKBJPWtsKfm7ADmuYQFknzMyw
         7rhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WUymZBfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si7611019otm.187.2021.11.05.10.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WUymZBfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2gH-0001QD-LS
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2g4-0001N9-RR
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2g3-00069v-33
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id w29so3189987wra.12
 for <qemu-arm@nongnu.org>; Fri, 05 Nov 2021 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VqeUxz6IogvV4pFJrCA00Z2D5aQn4JX5w71IQfKuhr8=;
 b=WUymZBfG9sbDUlvCuRxN92mjKYJol9X9X0dLM4pfmzYznpY6BjIJoEMoiklAbBpNCm
 s6+FKUqQZ0z2NPvH4ceAM7X21BC7Cf3gzjkIAvQniJBxMFlt/gyHFFnBVdB5T9ys9WcR
 Ocf7+Pnu6q6v1Xm1z5M/NECCLoNKAMRnpz7zNX0wC3bpNDY5Tzb29629tch2HzFKma0s
 QKRJX9n3NoCB9lqFAHxAWlnabtKucu0j4yxapbK4DHQ9OCETU4s1MVSoz7L63eXNSREQ
 rsIPeEOcIaTMeKAAROTMu/ONHnMags53WXQMjc/B3s4Nkc9RWzBa2ZSxdk8I1HHzNY4d
 0cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VqeUxz6IogvV4pFJrCA00Z2D5aQn4JX5w71IQfKuhr8=;
 b=5DKPNleHdrMoGFNt5d+kOiA1r/KzWVHlL8OuQI7nkDLaFP5N3lmplOPcWQUatLxsXL
 ZSh3i0P9D5eYIGmFi/aYWSQjlg0mu5/C6zHCXplJso7raSsJO2l9HRZbVzIJehC5EeBY
 2tpZDeowN/gzsh409jKm3XFpzFYpNWUw7FWydLrDPH4haik3kU+N/etEJjjejdr4dkg1
 w0bzfwa1TbBDodM1NFwGMQtdFsR9yIMHs/sKIlgJrIbeD7N801n1PRECby1VIHaFw/mB
 Fr9/r3ZMR0sA6EK/PLELw99L8uUem7qS8UivfrQvnTSsQ3cYEFaS+WLenIrAjKOEX64b
 tZzw==
X-Gm-Message-State: AOAM531G5J8bRRBsWGUnsX0c50KqVcGUxumwbAhkioHceH/wfJf1UuIf
 Zif9yWV2TYFqXslPJJQk3R0zaPAMTGeUuwx37axEGnBiOfc=
X-Received: by 2002:adf:e984:: with SMTP id h4mr71610612wrm.149.1636132013421; 
 Fri, 05 Nov 2021 10:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-5-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:42 +0000
Message-ID: <CAFEAcA8081OO6TO8KNwJwjxEOOK0qsYo9JDmRtm2mpT3YXjL7w@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] target/arm: Split arm_pre_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSryVolhT06d

On Wed, 3 Nov 2021 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create arm_check_ss_active and arm_check_kernelpage.
>
> Reverse the order of the tests.  While it doesn't matter in practice,
> because only user-only has a kernel page and user-only never sets
> ss_active, ss_active has priority over execution exceptions and it
> is best to keep them in the proper order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
