Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp314461ocb;
        Tue, 4 Oct 2022 09:50:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77m8mBSECZ+D0r77KI4F8ZWmdPLc6DtBSsRPAXz+TkGY/HZcBPpvdNFs25e85Osjr00PAZ
X-Received: by 2002:a05:620a:988:b0:6cf:33cd:2be2 with SMTP id x8-20020a05620a098800b006cf33cd2be2mr17622854qkx.527.1664902221836;
        Tue, 04 Oct 2022 09:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664902221; cv=none;
        d=google.com; s=arc-20160816;
        b=Oyd+wHwvi7er9Pqp6P4NcWUNsPes0gR7ywF30sNCt/hiRm+bLT0P7VreQK/XBAmGoc
         6GQgl4GdZeezrzJ8sRYDvTSi86ZtRF0oAo6yJoW1tv4ifRvw3/NxMj4JqpDECDV+WeIT
         UuSlgC8eg7nJnMTTy4eTmE48BScFMkzXH48jhbEVV0j/linpkmcZWruYyE9OxNaaxdw8
         gGQ0VJ/C9GJkMouBq4jcWzML5a3IQyBJxffJaU68aXKz9n3d72B4JJf6nl8L2DoAL932
         it2ov076GvDs9Kzr6HIp/uMyetiHPMCidrbJ9Txa6ryYrN6sLedQktZKOoxBet7Jj6Q+
         AP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=e2Swmrwj284P5lv+BrgPCv71ReiZ0Tttrt+sBh+fMys=;
        b=roRN7Wdf3XtFBifMwFvkCT1lzgOJH0oc2C4O7jK8i5NJZc4XUzXyOqWz3gta1mDjlk
         SOVp3g+9zgJMLbwvZp7kbcwkI2OYk+tLjTffaQ9RLYzR3aQNUVbUrHI2HbEJdp8lnb2x
         DPab5EewUL0UwgI8bVi0DDdVhhpIi0FwSUwFhpxZmZ5HNgctoDcyUzYyNAWN+cBY/1lY
         xOFS88GKNvdMPTXMQ8l1UAX0D9Bgwk8ShVJggqKbqPxhz8x6MYbwdL2gtLjupkg6oOye
         Eod1rCRIMAeNL6xhqRLapTw/RW7GVqXb9fsTOjuxzj5Gj4GBqrXUBPCPrJx2DtjHIsKS
         noiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBJcSAjz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020ad45bcc000000b004af9cebeef8si1209731qvt.237.2022.10.04.09.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 09:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBJcSAjz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofl7d-0005Ef-5a
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 12:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkUu-0003Iq-9g
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:10:20 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofkUr-0004PI-Cd
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:10:18 -0400
Received: by mail-ed1-x529.google.com with SMTP id a13so19537919edj.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e2Swmrwj284P5lv+BrgPCv71ReiZ0Tttrt+sBh+fMys=;
 b=VBJcSAjzCzEwzeIHQW0r9jwOh+mRleURm7TG/lQMKIEv22VDI8S5osWoncUBeH4Oy8
 wWL519+HlqM2V8HMd9fCNneL9d2gnDu781erREc7Xzv6/+OiPVtI0VeV+f7+9/kLRFjg
 z1Igdnpi+fUTadg7XATiZXNQX4gQZQ4yKlcVvVhJHXDNXdd1iaIjebnJcF9+UdDjZFds
 //jltpiuACUp5i83wZ/GtOspV+CiyNycFz91+lUFxTI1TgdFi+qNpLDbiHX09cFsxON4
 ENF439tVgQ5fWEV1WiQuEg65N24QKG6kJradmjp7pEx1ttfFav+8gWaP2TC7Wd1N6sVO
 J5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e2Swmrwj284P5lv+BrgPCv71ReiZ0Tttrt+sBh+fMys=;
 b=YF61ig6P14Dhqlk7FMV8Xzz0vnBOAc5u9/S4STcWgIt6HIJ4ztqLIcLm0id6Dv6voD
 VmKicFxVwZA94gdksdK3ZJ+7QXLQz8GFvyugt3yAtOKzrjrUqdr3sZZg131lyohG8Vf3
 d+AaTv01Q4S430tfmj3gK+p/vqM/nCwDeBv7mb2dSfSJxmU5JwIjoCBTIt1wmAcuHXVJ
 bl0DWvd/+uvvQBiXp63HTexkxLKF2alUhxabRTuEFW0No6xZaKO7SgD3JspCf2WIh7Ag
 P4avty340Dy6KusCtfi1aRZMEAFZBZXRznUmAhF8EeK6lRnLKQSIoAWMYqy3PmW0sUuR
 pEUQ==
X-Gm-Message-State: ACrzQf1egvvIkO9KTlZ/rQGrnLZvI2p9u4Drot1JTq0/2TOiZFfid03Q
 LOS0tLcr4l17o627jVQo8igQazmppzokbrVhMoKdxw==
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr24002059edb.241.1664899815535; Tue, 04
 Oct 2022 09:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-8-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 17:10:04 +0100
Message-ID: <CAFEAcA-n1Z-yTaBQCm4ChLhP-JXRu1-4mur5rHFZ84ptc8UcXw@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: to6wabk0Xypr

On Fri, 30 Sept 2022 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
