Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp390862ejb;
        Thu, 8 Jun 2023 07:51:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6E22fmZHpFhdJaRckoyI8C4WnNoSN/WcXymziYDMOqXIWWccuNdQf7exYu5Wy5EJpkDw+q
X-Received: by 2002:a05:620a:4148:b0:75b:23a1:3612 with SMTP id k8-20020a05620a414800b0075b23a13612mr8406030qko.35.1686235869218;
        Thu, 08 Jun 2023 07:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235869; cv=none;
        d=google.com; s=arc-20160816;
        b=0ypDzQmJuqJvVmg+dQPs/QqZ+J6WkzrHvM3uXkKNGKh5BNiZYTrs3xLUMXlI4RBFel
         jXF7S88ZqsS3EJtd9lzA93JwW+7xcL9lxgpRKnX1TOsOGkdHyLy/M0+BoX1z0KPGgb+k
         xA+mowpoYE58zGssU7SE+9M9HKLyl+UXouL6KKfVyz/xRrI1JtDelVik2maEoTurvV27
         rLxwGOMmjPMbLiesvsuN6ZR2gdg4ErHwuaTZjF6i48NbPrh+99Y7XdT98L/yYIOOrLBD
         lVPhWG8M+D47MVPcNHS005HJs/BYspyjls2i/9PH3TbsII3mG/Chu6FWJxElTGvidw25
         8sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LUrgKfTv8Fa0kUZRIOFLzbM7D0qyiL629ChnveH6GcQ=;
        b=qJRFj3hDaQlkMonpjFmSH+wJatCSqNUlO/FKtM8ac85DW+M2LOf52IaY44DTJnebw9
         0qMoiDwnD0UeRcUimsKBGHqg0wNc+wfbpJsLOwF+6sOlHHmw9yM1pJ5GCtTogHOoo0/n
         J1Kl0S6erdVIWjXhp9Arb93xE541KXr+Aj5OO6KaDhuR2UfGVxgMdFloSSvldYDHJt/u
         6s5GJ8mU0Tix2tJc1m5k9Wm80sAxs15aQ8pISYD1MSSj05aKZueMALjj3I2q7cD+mDiJ
         MAaYKTziwRmpGmG4O3/Iw3wv4JpaxbB1bknoDizv3toXoEFlPMfehGeTR4MiHPlzJaF9
         HBSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nbQkf9IH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05620a123500b0074e121164fesi688733qkj.610.2023.06.08.07.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nbQkf9IH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7GyU-0004HA-7W; Thu, 08 Jun 2023 10:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GyS-0004A6-OP
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:50:52 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GyR-0001W2-4J
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:50:52 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-514859f3ffbso1083028a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235849; x=1688827849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUrgKfTv8Fa0kUZRIOFLzbM7D0qyiL629ChnveH6GcQ=;
 b=nbQkf9IH5HHokgCJOlUr5TaGWlmThIzM2QK8ZW0nezvhlWv3bxnn66vV2PCnKkpmb7
 OPVamJ4fkTTB3oqJclVmovZJy5lRnbzfrmnuPZqTanrKx9akp93dP6+SwtOI/y79KZmX
 co0k7F/NSnrts5YQ696cQfc7+UB8WrOZ5jPBsA3qDVwL+sbqbGEmbvKQ/a4LGjSKmb52
 XZDuclIUjF62UsT4DcilGWlOTWOIM5N8+GVIJK/5aGNNrgbgy9t7ik1Ps+OQYZw+GtGs
 CvLtjQBSNKuPnvO/Waof1CQZG7PtTSLbSIRlBKEQUCAUe/JkjbYjztHizJsgpJh1Clvc
 caCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235849; x=1688827849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUrgKfTv8Fa0kUZRIOFLzbM7D0qyiL629ChnveH6GcQ=;
 b=ZAG83XNGsEd3sXLmOi4iGGeYfbQq4C3Y6RDWsLh4Ib/KUuY9MdcaZ4HNrcK+FXZsAc
 pfeZaEYLEkNIDTKCYL08eLrEfuApZ6JHK1p3x5FwVT13iLlh+YxK+x8+KrVYFvrB8/cS
 Ogh7tClotNpdYAQeqkUsu82OoN2UZk9fky9EIXcdJAN6JsFebABnrlM94+GRxRlKfQmu
 7D2PubmPCxF9fgt6DN7w/f/ojbHN9rwClOUJXPahd+fX30+DaKW7UsqNJ/lwJcK5MO5W
 +gw8Yi2A7Z16wpaCb/K0dPfb5x5rF51H2lNEiQH3ZLPl0m0x5w5NInRXbp6aik9ECfMv
 0rcA==
X-Gm-Message-State: AC+VfDyoSwAKTPLWW4c9ZLRW6DyhPLenhrO/MweDTakpjJK/+vg0lQJN
 fRTvQwpuwDSJCr6WTTL1gGqzqh2jfStCXaYfsyuMvg==
X-Received: by 2002:a05:6402:1ac4:b0:514:a5f0:93c4 with SMTP id
 ba4-20020a0564021ac400b00514a5f093c4mr6492797edb.14.1686235849611; Thu, 08
 Jun 2023 07:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-11-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-11-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:50:38 +0100
Message-ID: <CAFEAcA_wj2qhhnJKWGEWf0DGmS4wAiRcWFfLdb-Gz=pZ6a=9OQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] hw/timer/arm_timer: Use array of frequency in
 SP804State
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: aPFlJ1kTSWP7

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> SP804State use arrays for timers and IRQ levels. Be consistent
> and use another one for the frequencies. This will allow to
> simplify using for() loop statement in the next commit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
