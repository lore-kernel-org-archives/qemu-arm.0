Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3431776lfh;
        Tue, 31 May 2022 05:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx71JhHt8MpSNeUaSixjj3MchTQd4cZyxuuWcVgXuoSfDQiXfgVkclZrU1tZ8dO7XE9ZUqr
X-Received: by 2002:a05:620a:2956:b0:6a6:5397:b231 with SMTP id n22-20020a05620a295600b006a65397b231mr1473883qkp.541.1654001613503;
        Tue, 31 May 2022 05:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654001613; cv=none;
        d=google.com; s=arc-20160816;
        b=aix8wXvdliJB7MHVJeqKM8OpbJWEAKi4BOa1m5LZK4Vz78effbRwxVySEDOM6RxR/F
         bl7D5Iio1SBkfsVWdEVg1TdDtCrgQVCKIDlrRfRcgEwgnetzRBw5p1TWtI7ggwZkqXwQ
         k5NgEGsWy7uvT5B9IPrqpdLrcNRvG/8hdFkhMWuVfwTs1529b+6dmBQBotSMWrRK5sV/
         7knQouN58uMYPZeYORbTTqxvMMdPkHWNC7D5fOi1rEqAAuFD+9mnVoHMsAZfocFG5hdL
         g8rZ7auE3WcZSVDCbClU6tImnoPNUJtuCHl00uWx0eQdef2mBryjncqNwBzDagMAfk1a
         i3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wAtGSEgm4qsc5Mve9MccJqDOEATehtP/hB7mZs1CT2s=;
        b=WaL7S1v7ldoKSEaeeZkWYJL6DHwSRrrtQpGvU+8qWRm3hfviK6Fc/Py3mM5Uo3qsIZ
         ZUXf0bug0WadCZNKJZnCkqVCrt+cKZne2/YZq5U7T61qmgdYiv3SOpbDJC9wUCWCRdCC
         G+5EbCSMNg/2Ys2+Lym6HgQWLtd6ZN8nXxOg/IHc1WTnm8AND1KEkbBrKDqE+oIxLKGB
         GvV7MSx4CjGPGUf0+HvAp1STZPKl3hIKT1ZXD/5BWEqVvYsWVgmeucjLZpQnE15xigtW
         +aM1cmYyGXQpfv2Oe81dk3zytvpLMqX7gVll2OT1iYqXK7ZMgNWJyKzbb4Aw3FiPuW9A
         SMZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V637RKVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a118a00b002f9442ba2f6si8232602qtk.265.2022.05.31.05.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V637RKVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw1NM-0007xp-VM
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw14y-0004fJ-Ql
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:34:32 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw14x-0007DG-CJ
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:34:32 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-300312ba5e2so138263267b3.0
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wAtGSEgm4qsc5Mve9MccJqDOEATehtP/hB7mZs1CT2s=;
 b=V637RKVEBYbNl02hsGOWkNTMoStf9GKUww3K+W0/sunLW/0cBC17Yv49QDLEOSwYeU
 Xx1NJ6X4b/AUFSE1RsLwPGV9rMGtWC0K+NLjar+NfFAsCowHY82Y64bBNKlFlbZRkVPY
 gwv/H7Ez4qnm/maD0rG59I3YXEU9/qbrNrzgJzpsyL44jj68lNyptAB/HuYsN61S1roG
 sWE3e3NZE4DvVQHu2xnK7MsZ/NRzvDt0QeeK4LU/DmO2kgY6Ywvx6humjLlzZMKSJnjK
 7G/d9xeFpx9k3iNDTjAnPWCH+Oc+EP7Aiv8eYeC1wicjnc+SOd7QwSdYaXwQtC3Nf0Gu
 LKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAtGSEgm4qsc5Mve9MccJqDOEATehtP/hB7mZs1CT2s=;
 b=ATWfaX0Koz2HgALs1H/MMH0ffV0XKoXd6iOeAyvVDbO2mpMT4j/bXquKmeH97+VY9O
 uYw2zBu82sCUQ6q62F/3NXBXsQcHL0Je78pikUDVlPOGUyqadjlzH2M1/7OaphwpxL2z
 9Zd/hiKSIHw9c6zg94lWpeWWOtbbaFQUFCBN6G9esC+lh1w7bc3WN83IzLA7PlErSS3n
 2RfSDO0BkaWIgcHZuprfl9Mpmzc8hyo4p/lXSIpk7qBm9ELt9PCwSEh988JCVj4jxLcR
 h2ObSQO8FIDfevdrZwG0Dfr+N65kzYTQSV8neT7jpfwEqsQtxbAUZ0+zqnLkSJRzsMJr
 /Pcg==
X-Gm-Message-State: AOAM530gcCLF30PU/J5x4j+gqxjV1UF9r+CGwE3v1KKzAlxYZxgw6ETp
 Jixb374sYx3xIW5rUz4swBsl+CcO59rW0C0NEVJuMQ==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr7188148ywa.455.1654000468269; Tue, 31
 May 2022 05:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-15-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:34:17 +0100
Message-ID: <CAFEAcA8xkm9hKPu6-XNGBJYaDj-EwUdShJjDmB5e5ZZ1XMjvVg@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] target/arm: Move expand_pred_h to vec_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
X-TUID: rAkrfnDcubss

On Fri, 27 May 2022 at 19:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the data to vec_helper.c and the inline to vec_internal.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
