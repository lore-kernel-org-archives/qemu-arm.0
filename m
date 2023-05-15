Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6646166ejq;
        Mon, 15 May 2023 09:54:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TIdH2QTAQAkSb2O3kEq27igRe5RNYbBcMi1HIs8zhSJHNE3LiUWdyLk36E1DUGmmzzSKR
X-Received: by 2002:ac8:59ce:0:b0:3f5:2788:8adb with SMTP id f14-20020ac859ce000000b003f527888adbmr9058198qtf.7.1684169689558;
        Mon, 15 May 2023 09:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684169689; cv=none;
        d=google.com; s=arc-20160816;
        b=Ma/klfZqLy90D4/umN327UtMBBYSJz1FCCVXtjj25tTBYqfo37vHq4m7IGqVLseEWV
         7WIMVAKdtitQpM/pQ/uIKNUq7ompq4MQ2ZVcEX1kY3ddnRIMnti6YqaMgx36nWTvTgTh
         p37NnygJ4Tq0CNhUl75HlIcuiX4+DYQQvN3EE9IuWKV/cN2mG/bS6L6BcqtNbUteI7wc
         5JEMuiZHgYrDpeDfe8XWncXPHjpQqYHdvMhZh6pCkDTBxdVnAISKRuuKaFj/5Tm22Hjl
         V/Gb9wDPz2+JWM1GP4/bWUKTFa5SspuFbnKCgCd7Pvi6TDXGRAnkz+fE0+vcWhI+lwZh
         Bh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=L+CxrV89IkCmnKnEFrSX2ZYAi09id4f5Zn78gg12roc=;
        b=0H5nd0EIX/+8uyvGYGs31+ykjMgRvezjMY2nuGOuvqjTU07vm2hbNB3dhoxb13ny5Z
         rcKlyoo8s8zEBeVORX5RnUeD5+X9qIHUq+vr/JW0RdkkEywHHzBvy7h7rSKq8zu2jXY9
         OZTYH+AqlQCpJXS9iTnq6RK8BAE+RLS6n+YCffKmcBbv1hOSVjxCodo77xA3mCD8tbVh
         8YXf2pXObMFsrC+HIHK7gUWu1mJT7NPaZH34TQLc80K2Tj7C2vWMkqh6NfB80+QAgswo
         ZrSdPKoPpaWAKV0yMEmGlo91g6hAfQdE7/wDSL8R0W+gprx8wO867xPGxfCbJLahNub/
         nKzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kd3/IeJ8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz36-20020a05620a36e400b0074e0144148fsi109917qkb.763.2023.05.15.09.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 09:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kd3/IeJ8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pybSy-0007Oc-8t; Mon, 15 May 2023 12:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybSv-0007Nn-Pv
 for qemu-arm@nongnu.org; Mon, 15 May 2023 12:54:29 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybSt-00047D-8e
 for qemu-arm@nongnu.org; Mon, 15 May 2023 12:54:29 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc4b88998so22991344a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684169665; x=1686761665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L+CxrV89IkCmnKnEFrSX2ZYAi09id4f5Zn78gg12roc=;
 b=kd3/IeJ8qNZtiKpidpVvnX7xNhopvMZjkHJBr3UNEB0PJoCc/nl/SRu5Toal++NbVs
 6XimqCfZDsl055BpT1sco2o6bvPDuP8uPQPDtH/pyYA8NJQSPkVZudxfR1XnLmfd4oAc
 EFflms7brK3BCRumbdmNYfPQlKDOHcFCQfWM1bfEHBl6RXTEWTIpE7dDcJ1QEeYbfz/p
 0qRrRS1p6qEW/12lEcD4dNfUstIaK3QhwWXUCBaJbn6bU5RUWWaX59lK4w3VftzPmHwB
 D53Mg//Oj7SY9j1kaHp4i17DQTx7xgqvvhmIwJiUImzRilXj95ELiDCwvYViWD8qbcfV
 QqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684169665; x=1686761665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+CxrV89IkCmnKnEFrSX2ZYAi09id4f5Zn78gg12roc=;
 b=CYMm8IYekbZDmRQZIvrFOGYThTSKnkyXdfIqPcwwi7o+vVbwM2LyHPd3U8aXSSwAJK
 wY1QtLQtomeMAD6lIiyM3mSS4a2nigDa3dE47Jh6yDmJeuOI+bQ+q/NQs4kr0CWJCEv+
 5bN6Lg1tbR0Di/A8cXqNjYUUwoONojN28d4UsN5b5iTpeMinA4jL3Gfsqy+mbafAjWXF
 /6l5b8XWv4fmDit4x+j9ghCTZuJt3lBn5y+44pNuAzy0Z8UzrFKicTEy38EIz53L22ix
 wtVCZaJmYwkH2+IfWKE1oyt/OIB3dnL7OZzZusKLEBXWnZAfa6ZneCM18HmneslJnVK9
 ViYw==
X-Gm-Message-State: AC+VfDyi8PBkn+V7WsQvD1JjtkKnTaoVZtbxwCb5uoAKBycimqkysbIi
 /Bau0gUpO4Q6jPhxnSvmMoHFx+meQIwuXhv/GHjzHg==
X-Received: by 2002:a05:6402:1347:b0:509:c669:1e93 with SMTP id
 y7-20020a056402134700b00509c6691e93mr26555405edw.23.1684169664762; Mon, 15
 May 2023 09:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-8-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 17:54:13 +0100
Message-ID: <CAFEAcA_9TYj9+Mrz8tjOYWKMt3-JvL2t2nMXLje--FsWvB1oWQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/54] tcg: Add 128-bit guest memory primitives
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E1Ebu9waCLRN

On Mon, 15 May 2023 at 15:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Dropped r-b because of MO_ATOM_* reorg
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
