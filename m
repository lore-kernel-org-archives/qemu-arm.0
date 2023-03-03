Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1344357ejc;
        Fri, 3 Mar 2023 09:32:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+jpLs/wrHrNsVBWqhaOsoGiNtW8cs8CosxDUhswE0gVpAAJM/Fv7Dzs55mKo/SjjOnfOzZ
X-Received: by 2002:a5d:4c52:0:b0:2c8:cb7b:930d with SMTP id n18-20020a5d4c52000000b002c8cb7b930dmr1952757wrt.1.1677864727000;
        Fri, 03 Mar 2023 09:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864726; cv=none;
        d=google.com; s=arc-20160816;
        b=FUJ+YBtGrD2yAV7pba5taqsaK/TLWQI/3deIfD6WSpneocicfhe+GDLZIjtzesZ/tD
         XXPjvmXn72KLvoqWGF9ePANmycUxix6vUeqeLZx9eO8TioqwRbKoJIgdqkdG2aqmEGIO
         ndZlYSAu0QO9Js+ZY83PRWNfsn3ffHrgYaPcr3bnG+xsZApderQEBQDelgtu/Xe2GTdo
         gOWww3zlx7D7cfOe9ZzhSd76SfZUZIFejl46NtkWHYfEK1rcBMbbxKd6p/qvztBPhhnf
         oIUwYUdYyd86aBJAF0fdg8BwRGIPoPhp3dCp4IqOM/PF3+AaOzbhrMaPthSFh+LgMa02
         Luwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=krSc7l70xY7dnqBNWAzGumQOCMWgGjAAkQshh4BmM3o=;
        b=fLU899wpsdXMKDHX1CMpVF4FazAVOJk0bzJ6yoleM5nf9Nre7DXKj2fk2nLxY13aog
         NiZ4nMNFxZtg73LnhMEpWP8KvAaOcfC8co/hX8ITtlfiw0GxJEs677xDiRvWeGw5+xk9
         ODplCzAypl7i5cD2rVHxkyBXKArwkkR1My/lykQs4B4p/icXmxinT+GMD0FI13egH6TB
         UbsVa76dLJI1Gp+0lpM0loJULP4xymS5UtpZMS7fKECekGL91rXEGWmBex/dv3yf0WXg
         Gck3j4jvbjA6zss30nkJcfZlieeiC0g31fwSBj+ZXBfrflvz0RG/D+tkKYfZwttc1PBt
         xDHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K0ivzmLb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020adfdb50000000b002c706cd77a4si2119798wrj.715.2023.03.03.09.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K0ivzmLb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9G9-0003cb-H2; Fri, 03 Mar 2023 12:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9G3-0003Zs-Kb
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:31:55 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9G2-0007qG-1k
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:31:51 -0500
Received: by mail-pg1-x530.google.com with SMTP id s18so1950504pgq.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=krSc7l70xY7dnqBNWAzGumQOCMWgGjAAkQshh4BmM3o=;
 b=K0ivzmLb2vnD5NAjEYPF9S6XnGN/7WM3wIpFlrteoT9lss3lXJ7BSXJW3H1xMMeVdK
 Km0uTjMC0mwuvNDeMq097zk3V0O/u8jAtMKdCXoBjnBKGAmdbWJI0w5+HLYm+hsN32b/
 TdnPpBCoTFdKysMBDoafAaG4FYBqupVHyfHZPbkNnYhyHt2LciNMWxXG7hx1WFXWisQc
 fRXelE1EyVqi9Irn0jw0nqm+Lx+fBFTXgPaCtOS6SLt5OlL9KslKZQsVG1pK1PvNXSsR
 dTN0BPHRD9h95a3PT3vFFko23SX4nRAUmKqz/pOO0gVTmIYwTW+Z+KzyaTYSFrXnFh1O
 W2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=krSc7l70xY7dnqBNWAzGumQOCMWgGjAAkQshh4BmM3o=;
 b=vf5At1edc5mLp8ki0Zm+MJie0CxW6Zn7doKsLKIyx1BVGxVS7JLmYykUMjoSpCJoj+
 QqKdQRjrGDfgrMfu+jT7DXJSrzk9hpsuYUK9OSByWmaKlLH4LuY+n93GQimiiWjCEYXw
 TuNOFeZBQ2B9tozSy1cxC+TIpCvZHnwq5cxIQopI7dRmTukxWKMuNQjRXaEJEqdX7xMA
 eMi+7w322k5XQ1e5ceMkKiIEEUGcwNOGOfd4APIcFD3W9VM0YLnbLRXfUvNSvocWRFB1
 VUx7dUIq9KIViqzCbnZP9+s7pF4ycfkj0Y4DakTv2pgG/K7YxCKoizGjafFBqjpyu2s1
 wYEg==
X-Gm-Message-State: AO0yUKWfI5ZvRd/mcBsjV6IZIhnC/8C2CLf815KvKCuLQ7uJmKSZ28P+
 YTS9F1EPSTmGymyFTN6/Tgt7axltKuTEhWG/n5KCbw==
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr817586pgb.5.1677864708643; Fri, 03 Mar
 2023 09:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-8-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:31:37 +0000
Message-ID: <CAFEAcA9RER1TP3XLsfeN22_B9UO+TPVxi1HOQaBLvxWtgnKG8A@mail.gmail.com>
Subject: Re: [PATCH v2 07/76] target/arm: Drop DisasContext.tmp_a64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MQf8k2YXkeIL

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
