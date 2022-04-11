Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1752716lfq;
        Mon, 11 Apr 2022 09:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlREa68PZPN7Fw00F7p8LWsyZtMt1pK1SJv/9fhLceQdyo+Ricd6xjzFoLSLwpYdDsYabx
X-Received: by 2002:a25:c8a:0:b0:641:3a02:ee77 with SMTP id 132-20020a250c8a000000b006413a02ee77mr5728312ybm.306.1649695249503;
        Mon, 11 Apr 2022 09:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649695249; cv=none;
        d=google.com; s=arc-20160816;
        b=b7CQcbI8FIbrt9kKUKeK5mefwBFd/sR+eG9q7nH1qu8VLr2ksCiDbtF3lyWIghEmkE
         xkRNSL8ewzzqmi4AoZBvjnmqHibSVX2gwekUmZn1TkgmVL8WZYgPwWxDRDYECDjlsX1/
         QdC/C1BqwN1oW3PnIiIGNXINaFOV44ESCUcA2t7/npBZYgs3QX5O8C6PZrA5eZiP2F7v
         mxCb2NTgtNzzeiabh/gV2j22hh9lDLJbDdLZhc6NhpH3IOLRMwIGN27KtRvP2FlWGrvr
         mLAaz7eRDkg4JrjXrRKcOq/jzpotsJq39d82naQFd0TrE2OyoQmWd2edH8hgJR0Tkndi
         N/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjxKOp68n/kJQTL3fdGKp4vd56Chll9dKNBt9mvhfPY=;
        b=Hyd+7Ca+tXPwzOCLYN2bAamUuLZIXUEfCsddftTVwsdiOgnYrUEs1nTy7GFSoE+SAY
         rCyg0Z+XMqqwBLAr8wpHfMSwzOr6qZZnOxcXwDaKgsGFm1/PG6VYdNS686+oWNb3F20E
         PP5xolZdB/rtGPQVxBPZVeBDJAcqKVHafFhwO4Geayy9NZl00c+MQnEUA5PpaiD32ZLb
         5AbpjYRJ0sJ36aHVjc+SO1xBcCnXOqUOwyi3Vc0oX4DYAHi7lBa2jXh5hGVez1iA9rSq
         m+HRuVKBM4IcLaOoskFOykVK7JlHchqsATW/lc+gnyYb3v0SUmL89djZcep3yA8Og93Z
         EO4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Etm5SXTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129-20020a254f87000000b0063cc22c8b6asi4369854ybb.85.2022.04.11.09.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Etm5SXTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndx5s-00051z-Ue
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx51-00051E-SA
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:39:55 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx50-0001Qq-Cv
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:39:55 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z33so28511497ybh.5
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjxKOp68n/kJQTL3fdGKp4vd56Chll9dKNBt9mvhfPY=;
 b=Etm5SXTKYtx7OWjc8YJoQu3y+K+4+eaCXZKgcTfC7zEE5vu/okHIEJfV3Fq/9ZghCO
 gsbUzMQ8wpcnrmvyOXM3XP6aA5SDz3jEYoF90xiXZjHLiTweGlNlFVzLit4noX+Ug+I2
 aV6ItsmVJPrhR6XLG8PNtdGSexfeOzDq4uwzCxmgEIOv26q8f5D+NlZsVRvdPcjhrdgT
 gqvO6pcGw56FfhHs5mi43bAGjRqwoKHx6ChnBw6uJ3lz4KfhZDncYiDyCE9D3igYZmSk
 ilgGbnFL32ta2gWBBxMM+duhMzSC0vZ7m0PZQD1x851w1s+6wjiRa1bJMBhcuYQWmVou
 8ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjxKOp68n/kJQTL3fdGKp4vd56Chll9dKNBt9mvhfPY=;
 b=Qj2T2EAK0XMnPJ9eT2S+A3xeWdtJQK4ik6wodZMKKT8rxzKtxJo8SULSyxRQ4y1041
 8WINFCfQ66jYzTMOAig7UJ0yEHwms5tq09prNXrs3rsNTSpbKMociek/LDwKyK2mfER1
 cg7OGA7POfgIHynLW91bPzWreOWzC8UabbGYjkYHX95qxT1m4lm/DeGOosTHsGUk4JbB
 rHN4fOJ0bowTMuXDSYtr7nP/A+jGRvTQ85cRhyuI4cVOBEaa/aiCt1SQib4HefAH5EXl
 U5NdOpKzxK6/QAg3ao7NwveSZgaPXW7utMSvIhxMo9TNb89WjVWe/Yw8qLv1Xsrdjzf0
 qL9g==
X-Gm-Message-State: AOAM532eCbqQIfe0iEpHfcZ6knoXzMXSM7m9cH4GXSorbNKQKSFNHOnP
 juLUtfAI09gTX5vB04Tdyw4M1pDLpwlWC0lDRe9r8Gqt3cM=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr22746778ybu.140.1649695193416; Mon, 11
 Apr 2022 09:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-2-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:39:42 +0100
Message-ID: <CAFEAcA94Vzw27yDxDeQqkbOgagH=AcPu68mXV7wAeprjxDztzQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: Enable FEAT_CSV2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yme3+DseT8Mx

On Sun, 10 Apr 2022 at 06:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns branch speculation, which TCG does
> not implement.  Thus we can trivially enable this feature.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 1 +


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
