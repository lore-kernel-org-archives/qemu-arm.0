Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1487663lfc;
        Fri, 16 Jul 2021 10:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDx0S4fnPml1JPaoLmxkOD7Irq3Zwp81M/uvdxIVDqhbpJcnjOtZ8/3oF+tIjzu7QvY7EJ
X-Received: by 2002:a2e:9cd5:: with SMTP id g21mr9737317ljj.99.1626455694944;
        Fri, 16 Jul 2021 10:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626455694; cv=none;
        d=google.com; s=arc-20160816;
        b=kul+fV967tX6rpw4UIJZvW5QKi7XBXLyBuYhEz+ZF9W3Zbs5/6rkqdC1j7+4uQmpkQ
         mdj5H5RaabGil33ny5XxuKu4vYsc9hfkrY6V8O2n7dy+bYinos7q6Cnyc8zDqOpi+1xg
         ryU9owGi1yPlprfb06CxF302ai2PwsVZdyegBu9tMK4o8hxzLB33Xg4Tx5+Q9J+RUrPd
         P3lJLv5iYDxElxJiVoEB2apFQR2AQ3M2vK50F0ex8P5snTjBI1//u+RHM3WZZc4BFF5k
         /7T+T5ssM1XUBvQCc3+DxZAx28mM9SK/qeXXim2+4223eD4vdKHc9d0ydhqKTBfAyrgA
         CDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=R6J2a96iBCrBCZ7L2u6WV78KqOA1yJ63V1u5u7JjtPA=;
        b=DGxyS2zKuHvJ6cfk6zMtU1RX+kAnYk/mCu8WHFQkppg9ZgQTKKSrtqTcVV50OyXvhG
         vWXneolnEIamae7p0MD6Si9TxWoMxVT57nOyiEN/2PKe0JQ4esmIXmcdqsamdPc7RxGi
         OHEs/+tmGP6GjV3iQf8a9tewL9GI0dspagmqXfdLtLi53LnQz8AYB6X409252viXLbj0
         mI/5SG1kQln0g8wV7Riirvrgo5ar3WTRgR92PCsCS8zYvB6EePtlMdqlnvv+PcFttDpU
         iOQFyfer6SiWpTckf4bySzd5qeAlaMBlgxB7XBKa75biWG2GtTIijgWlImaqzH2ElOxR
         TTQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hKjgJ3ig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si14618608lji.166.2021.07.16.10.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 10:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hKjgJ3ig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4RQL-0000eO-VF
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 13:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RQD-0000dZ-8h
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 13:14:45 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RQB-0001Tb-Qi
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 13:14:45 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so9224365pju.4
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 10:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=R6J2a96iBCrBCZ7L2u6WV78KqOA1yJ63V1u5u7JjtPA=;
 b=hKjgJ3igzN47yVr1kN0ZKYZs7tX01+WEPg5mBMPhEQmGlQeSFCyPPyX6Opq031Rn2Y
 BF7YK3Awv786ZTVV6xC2JssTD98H+l5lAbJlb+4d8OLqZD0WtuO73s1Q3nE3AcmTOUKm
 eIXSnNlu4DJN6NgczVLBa4wyM6DUb6+dEIp/batKIoUEG4XL1dJPn76dDfJrCd/Pzne2
 jLfnfIiXknfhxnZF8z7MbgEChAy+YDww0egIcQkABCdMZAO39nNHk9AKs+/neI4lQPqr
 zm0pCQikQiV6O871P1lwI0+U3N6ihedOwfM3DXwO4/Epx/PxzP+N/I15pdHpTkgGS8C7
 W0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6J2a96iBCrBCZ7L2u6WV78KqOA1yJ63V1u5u7JjtPA=;
 b=cSI45QdHH9Lxdagl4sHlx+zn1yTfg83Ns0UUh2JB1DXjkSATjZ4VwsxKiB6P+1aS9Y
 gcpHKQNoeoYMOgXpdk0Q0Z1+jUmWsu0G6ppVK1ZQa2LfOsQnMH3vDBQfEDGiuFf6GNno
 zxDynAP1GVXSBgEW5H7eoBj4AO3suZpKYWrrkp5ZH9sqjriKIsstH7WLtRQv6WNP06ZF
 fo72cRZ+Y1SwffiDiRcq7jh+1MCaVheJOMbDtGzIZwsW7/w4JHMGcbWdsE4veb5wDujN
 vYKbQ7zAv43jxk5mMe2/+rUP0Mwj10GknBUcMBkLiPwUT902CTBY1N3MtmNhSG0fqTzR
 8D7w==
X-Gm-Message-State: AOAM532wuYJ9ue3DF6B0dsivP6B1TpLK/IpLDdavki0DufWOTxdot07l
 0rmGwPuv0FsquuTe++DtG0OEXA==
X-Received: by 2002:a17:90a:5896:: with SMTP id
 j22mr10314208pji.125.1626455682047; 
 Fri, 16 Jul 2021 10:14:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w123sm10783394pfb.109.2021.07.16.10.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 10:14:41 -0700 (PDT)
Subject: Re: [PATCH for-6.2 11/34] target/arm: Implement MVE VMULL (polynomial)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04056c2e-04eb-bb9f-584f-ef188c2b6e03@linaro.org>
Date: Fri, 16 Jul 2021 10:14:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ap492odYwAwQ

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE VMULL (polynomial) insn.  Unlike Neon, this comes
> in two flavours: 8x8->16 and a 16x16->32.  Also unlike Neon, the
> inputs are in either the low or the high half of each double-width
> element.
> 
> The assembler for this insn indicates the size with "P8" or "P16",
> encoded into bit 28 as size = 0 or 1. We choose to follow the
> same encoding as VQDMULL and decode this into a->size as MO_16
> or MO_32 indicating the size of the result elements. This then
> carries through to the helper function names where it then
> matches up with the existing pmull_h() which does an 8x8->16
> operation and a new pmull_w() which does the 16x16->32.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 +++++
>   target/arm/vec_internal.h  | 11 +++++++++++
>   target/arm/mve.decode      | 14 ++++++++++----
>   target/arm/mve_helper.c    | 16 ++++++++++++++++
>   target/arm/translate-mve.c | 28 ++++++++++++++++++++++++++++
>   target/arm/vec_helper.c    | 14 +++++++++++++-
>   6 files changed, 83 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
