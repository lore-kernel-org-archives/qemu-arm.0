Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp533777ocs;
        Tue, 27 Sep 2022 05:48:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5XdilYKlNWK8Wj56bf0tJXduawcYfExRnxdkEHstRDFlLCr8MRTpUtDiqpDNeBWtVjXqi5
X-Received: by 2002:a05:620a:a4d:b0:6cd:edea:39cb with SMTP id j13-20020a05620a0a4d00b006cdedea39cbmr17639340qka.392.1664282907379;
        Tue, 27 Sep 2022 05:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664282907; cv=none;
        d=google.com; s=arc-20160816;
        b=uDPeUFwF1fV6gw7nkfmO4zOfBOzGNCo6YH3Vtwo6w1FpcXeB5qs2EsmRbdg9ZkfY4W
         qNOItWxSxT5uazeo6c5JnqEsUmJu/cI8bpVq/geGWdebDMWPeq30t2f66CDtoz1+/4sT
         px97sjzfn5NAiZTCOJ6eZjWG1SVqREDyb+F+W0O2oITEc1OczhvGapsTRPadBMxDLIkI
         AJrefXPIkwxNGEM22WgWwyUvieoGMGUjT+9U7jCto5zBjo5AzANLDRoRWXgT9ca0QHFr
         p8Iq5ESZZj9MXhfMepmpsTD/w3Mte59wwkV3rf4Q8uSaqB/RUVV462irmuzNjuw4eqBq
         0PqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fyr3HBxQzrlGmi7Goxs52hE5WCcTMKbyWhepeUcM1QY=;
        b=qUQpEA2HuUtnG9uPCOzwiAyRZAYXnIDrvbyMdzwDZqfGLaLphT9aX/PodpobA8gGMz
         +0eHeASR/gL3Z6djIFVSPsn2+bQi5SnFPb1YbGiJTX59a278i5FiDmNA0SvIwmEdPNF8
         j+dSQTGVSv/NEcJ/HYKeZPa1eR1O5jtAX2ObpD2JsQf67Z4U/5hlMq3UtPCEOh5/aWzM
         Wk2gL8fjxS+E6yvE/0O0wxHrlKzYB85rXqWq4Mq4NRy7H0qHWyZ0313oRMqquDqYklEB
         c5p0SQOTUc0RL8tmA7kfxGSrivjJky/4hHFFdi9woNcH0l/yfSufU7jaUkCNUeTN0AUQ
         E5vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIEhepmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a144b00b0034450c9e55esi798467qtx.173.2022.09.27.05.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 05:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIEhepmf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odA0g-0000zJ-E2
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 08:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8l7-00020t-PP
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:28:17 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8l6-0001r6-8W
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:28:17 -0400
Received: by mail-ej1-x634.google.com with SMTP id sb3so19971245ejb.9
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fyr3HBxQzrlGmi7Goxs52hE5WCcTMKbyWhepeUcM1QY=;
 b=UIEhepmfY9j8ufXvJBuA5VyB8Fv5Ttldtf5GMpz1pJVX7DzyHxDnolLOu2N2tuuMS7
 2XiUtBQ3Gyx4ooPaQwCcMlVixv2KDgfvX1heEKPSOCRX3+SXdstMIzP8hChLp3jDIkYn
 xeeXMlpGlYCgkE1bqgqWpnrn96f/4p7dfjxsNIdbU1bghs7eRhCRSXNpv/5O7HtYVdXA
 WQ2zSpCSOjozOgsE3RqWJ6alu4h7wKyaM/Qd0dLdEAvEeLUwGs853rc0kIC/f8Io5iFc
 2COvdRI+mMagBaI/Tf3Gfrf35tapleRhGCvgU2D3xVZiW8vt4N6qfiNZ/i2k4ruc+UCx
 AWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fyr3HBxQzrlGmi7Goxs52hE5WCcTMKbyWhepeUcM1QY=;
 b=WgNJ3LlhrdZ/ESTnagEKGYkqC4vSaUGmhxeyuCm4CiGXXgFzhuGETkt1Tmz4mjI1pY
 uvRsGQJLDhjXZpSSlsaMFs3YQclX6mHLGOfiDPKx8eBDzEe0oIpMiiR6RajmvA8/jAh2
 45gKnft0MmYRSQiF1C/TMuSU7J1DSmfN18F/PFsjoChUXHxxMqsBKTy9rAjE7hIFpxEq
 Ne8qhyKd3S6Bi0z3eqkRTF6nw4w7xxRcgp0PkOngY83zPq0pIjsDqTUvXwH5YLXmVWac
 wlHSElx/1aZfNtwjX8RMHvA9Sz+Iuduxi9/8suZpOiAWL0HB28UTw/amM6QJjlQzCe0r
 Z2Tg==
X-Gm-Message-State: ACrzQf1wDq3rJ1IOdLlBg425zdR4WZGFsD8FdPvLPuDAT4tz4ybSkfBS
 wTgMCO9k/3XxEjjusg9BGh+WwKUqpI+aaP+xsP758pdjEk4=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr21816379ejc.619.1664278094911; Tue, 27
 Sep 2022 04:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-9-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-9-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:28:03 +0100
Message-ID: <CAFEAcA8uuzcHS3B3VY=J38gSrZUhnaTDKq1ei0rwtJtoG843bA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/arm/virt: Fix devicetree warnings about node
 names
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8h5czM9C+6s

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The devicetree specification requires that nodes use a generic name
> where appropriate. Fix the corresponding dt-validate warnings:

Either:
(1) guests are looking for devices in the DT by node name. In that
case we can't change the node names without breaking them
Or:
(2) guest look for nodes by compatibility, in which case why
do we care what the exact format of the node name is?

thanks
-- PMM
