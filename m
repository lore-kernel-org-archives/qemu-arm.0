Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp53496ejb;
        Thu, 30 Mar 2023 09:31:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZM8uvErcW8KYaMlHz+u1bd5OWaoRPHTCBa6PpofCMkDzjN42RopB4jFKijviOhJGbGUyV5
X-Received: by 2002:a67:e3ad:0:b0:426:d40:2bb7 with SMTP id j13-20020a67e3ad000000b004260d402bb7mr8689007vsm.20.1680193900534;
        Thu, 30 Mar 2023 09:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680193900; cv=none;
        d=google.com; s=arc-20160816;
        b=y2hyyEjfXaw/dW22kYGA23S4tChue66Q36qCBUYshlTOR6MF865oR5rW+C8Ke/VX+2
         j4hctJkszz8mKZBzVmQ7ksKJPA1NIgg0dMMgBSMTPnXTzr+clsO7s6Vgew9plCTV4t57
         MvgadFFDCX82D4tNheDpJfu3/UBdifYSFchDJwV0wrlR7FfQl6pSCfVqTG5+UmE2omel
         aKIr4Z9mU+mO5TjKqaNy1SmWtoCp/zH0bcdGgrwV8mhm/v+Levq2QfyUTgRRtQxsDPiM
         6c/Jugna6deqqyfggwQd9LchQB/PpgwfPHU7MScmiZTHmjIdCsdTcGMiOud//dJUcOKq
         JSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8PNdonIV4iHbxLXT7tt0I71+I9CCRTsiaRCVsBkuP70=;
        b=HaXU/G8L2lKgBE7lhz6q4rcKQBxaXwv8VXE0aMh9yZu7Imiim1yIPgiAKmvSDuqghb
         hfi1Kidc129D1iZ6exXi/Vn4MUYrFmhhILqmrUsDQhN8kcI4G4MR7HcgNtpiSxz4CDGf
         EBxeDHeOaNCNr527+W94VzPl76lJya/ZtIkNVYoxcoPD5A7vdsTDR9kpMcqRcvrTg5Oc
         m1q/nhbgA29AqwnFx6hQJBChJtyNwVXOf2/p3IsJzpmT/Dp4b5Btuc8cXhHz/ghNMxwk
         mkhP+naz104C1YZxM85hJz6V2F30ZVz+Zho5/iuuHJQeG6KogAuBDiqUbrTJs2Tf/ryi
         oIww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSn73KTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b26-20020a67f99a000000b00425c8e198e5si8138833vsq.667.2023.03.30.09.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 09:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSn73KTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phvBT-0001Eb-6M; Thu, 30 Mar 2023 12:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phvBQ-0001Dt-8a
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 12:31:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phvBO-00040g-LN
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 12:31:28 -0400
Received: by mail-ed1-x531.google.com with SMTP id t10so78626904edd.12
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680193884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8PNdonIV4iHbxLXT7tt0I71+I9CCRTsiaRCVsBkuP70=;
 b=pSn73KTmGvkY6SCuQt/pKKxqb05gX8e4/U0uc3TEHST1n3xWHWtde+6IAvXJHVyDHf
 tkp9N6qPoHdLBG28yICxbXsBOLivf6X3al5ZqkgcoVd0T4LGO90kNJskb5JRNgNykMcb
 mC7jlOV6eD6geDJtQMzE9nMubbmz5nK3e+CvzHp0IToBmrTxDw6bwOBRHq6ptNDr64Mr
 rORbe1Y+cD52snZBFgxhEXELZ7nnvE2TxMbILQZ2QGZC+698s1pZH6lr3TiJpkvQiYYl
 RWj9ZodvbpNs53sfy6a47NziHHwOyj8pkNBOV090jWwgIY6q1w4TMy0l063Z6Mzv2nuT
 4XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8PNdonIV4iHbxLXT7tt0I71+I9CCRTsiaRCVsBkuP70=;
 b=QVpy6YgZ0U5IfslqybbgqYCWuE3CVGRah7xeoZNNLjYnxQh3wGLFNiO9ixObVuG3UT
 267qYQhp0NdPz3vkUmfrxka8PA8uK6iBe9qDOm5bvp87k0Ah4U1mkzLrCF38JfX67HM9
 w6TyteypYsiSeIksobvU5KmJIJPazAnKgA3ZbbmGASTpeVpkGzco3FeT2isTfHlOPQm8
 3dbb0E9FoPCunMvsqu71J5EwfUco+MKp0/7lJmR+WWa17jIUgqv4Nq68sJeZ38mhIokJ
 iRAiZOFY4sH9EW4upXh8cu5ZJT1+zYcdeX5GVbqUDkpfAnDMVdK85p7/eGZusPDXkvzJ
 tbSA==
X-Gm-Message-State: AAQBX9dqGBVsgOYXox3a1fm4Mr6KYzyDzfiNPGNomVucplKrd7M426fV
 3az2RpLLuK6dZWys1kMOzIhm1cyZ6KKbroXBVyCvWA==
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr12145665ejc.6.1680193884087; Thu, 30
 Mar 2023 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <20230315145248.1639364-2-linux@roeck-us.net>
In-Reply-To: <20230315145248.1639364-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 17:31:13 +0100
Message-ID: <CAFEAcA8=0m-UFj9noTa+J69sEMP5cqTvaMoVoqHVd4V2JF3Oxw@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/net/imx_fec: Support two Ethernet interfaces
 connected to single MDIO bus
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 30sprUZ6OiUH

On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
> be connected to separate MDIO busses, or both may be connected on the same
> MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
> property to the i.MX FEC emulator") added support for specifying PHY
> addresses, but it did not provide support for linking the second PHY on
> a given MDIO bus to the other Ethernet interface.
>
> To be able to support two PHY instances on a single MDIO bus, two properties
> are needed: First, there needs to be a flag indicating if the MDIO bus on
> a given Ethernet interface is connected. If not, attempts to read from this
> bus must always return 0xffff. Implement this property as phy-connected.
> Second, if the MDIO bus on an interface is active, it needs a link to the
> consumer interface to be able to provide PHY access for it. Implement this
> property as phy-consumer.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

> @@ -282,11 +282,19 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>      uint32_t val;
>      uint32_t phy = reg / 32;
>
> -    if (phy != s->phy_num) {
> -        trace_imx_phy_read_num(phy, s->phy_num);
> +    if (!s->phy_connected) {
>          return 0xffff;
>      }
>
> +    if (phy != s->phy_num) {
> +        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
> +            s = s->phy_consumer;

This does work, but it leaves me wondering if we should really
be modelling the phy as a separate device object, so that we
can use link properties to connect the right phy to the right
IMXFECState rather than having this odd "actually use the pointer
to this other instance of the device"... A quick glance through
the code suggests that the phy and the ethernet controller
proper don't really care about each others' internals.
(imx_phy_update_irq() does call imx_eth_update() but AFAICT
that is unnecessary because imx_eth_update() doesn't care about
any of the phy state...)

thanks
-- PMM
