Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp136511ejx;
        Tue, 21 Nov 2023 23:17:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJM87AhIbjt+DvGe23qD4DAaLO9Hc8vVrZueorq6GdyUg675L+eqy8gi1xdJ9jszizgXK3
X-Received: by 2002:a0c:df82:0:b0:671:cc80:c59d with SMTP id w2-20020a0cdf82000000b00671cc80c59dmr1689588qvl.0.1700637473769;
        Tue, 21 Nov 2023 23:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700637473; cv=none;
        d=google.com; s=arc-20160816;
        b=buDaXmrSaOqRGbY3jwMMD7njAJ12YnKUHnMB0YV6dnnx3Jv+ELSn3xRMk9pUBiGGp1
         WUTm/EKKRVGJv7+lDFQj3hQMK9T3FoQQNDWIv3Y85YznFvET0dQZYqbcPNRESn8m6FkU
         lEYR0RH0CdQrkJwP9zh03ZMW99e3GQvLWaWh2qlxgrrM49iwdI2m9cnuBWopeI1gEywH
         TEe5eRd32JRB2T3u75SL9rt1TK2knV0FTE0PWEKAJKr5nRmo43x/azdvPTGAd1imCyZh
         l3elBnHAQHmE0YiqNktHonMrxahLxzliznbqkUNDhEUJGu9xDUkhEJf6xMdNDoDzztgA
         H0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=C68A6TmGxpdDG8NB2o7dqQnjT9klP1QBHnFY4EQLd6E=;
        fh=A6d4BJTkcO4Tb4V34rr2mSX3341RstIj7VsNiQUca0w=;
        b=RXw0Ytrizevx5jMVWembcku09eH/DiQSYH0bl2AEXZhE5SgkBh5BE634h3t0VFHxbn
         /T8TZbPO9jSY/q7PydQVwt31rpYiEnuglHqQEAyCu7q/DUZcIuGEPr5h4qvzk21gLqsq
         C8fmikn9q0Y761slBvfDwdnfHIHhSMnC6beVLUiReJStgqaFuUA1YW+Z05b+7wUeJGDT
         FrwJC3Wdc5A08Gi2zoGGk99x83AR3FKkGf8xr0O2oEdNUMfb4O+0BRgg14fWmZ7LAqlG
         /hgZ/ER7xpAsZ1uNjbTqmynLTSBoiZp9d2vLLq9d7EX/xdJoerPY7jjy2Z+HA/fEI4v+
         /s9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgCB67cc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jh8-20020a0562141fc800b0066d1fcca1b7si10728697qvb.90.2023.11.21.23.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgCB67cc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hUN-0008VZ-Pz; Wed, 22 Nov 2023 02:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hUL-0008Tx-Jq
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:17:33 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hUK-00089t-2N
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:17:33 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a00cbb83c80so305500366b.0
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700637450; x=1701242250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C68A6TmGxpdDG8NB2o7dqQnjT9klP1QBHnFY4EQLd6E=;
 b=AgCB67ccm2HtzMnM1ef1WrOYRZ61CfPhS5tZBoSyL1smb4hQwrY3v9tPNKuOqo6H0N
 0QCh2FuWfoE8RPtiuqPp625o8HUodTAwZcbLrL9wXJzGd6rZ94OyTP+SWgj7BDlPOkHE
 xdS7P5E55XK3+dvKoxrxDjzMkEt1zgOQBh9GoON7GlaiOJMhRcyE7ox5C4HRDY6F7XWD
 NpfbEJt6OhMF4TUEfWG9l2Hcsc/M7D5+1MaHxB4MgMEvRof6lDEl95Af/KQZ3QCeK6Ek
 6lLuPiUUeh5Ll3dLSwF2OsKQH6trofUowsgDvH+7t7jZkxzbNO5oGPj/dTmRSdx9kuVP
 mJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700637450; x=1701242250;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C68A6TmGxpdDG8NB2o7dqQnjT9klP1QBHnFY4EQLd6E=;
 b=lLtX34v6BdJ+BTJ5jgiG5PC2CZm/zCJdwIMgcOjjelHoewE7ybaL3qEPsgW2jdRtVq
 pHytCUv7dmrxwxrYPDaFdiSIxGNLsJsmVIdO/D3RMZvxC7HlFgWgwxwL2e14Lnxx5hc7
 ZrTe7ZeGLm1eXJqJkdQkPIWu0KMlTy+6aJH3MPHrbIcBICVxN1/CXkkvkf32YADtze8Z
 /GE09EdMoogY0QGLZJUtwgHkGM4XQGUTcyRVL8jW0+0pVdIJtyBbusSRuXxhzKxCH3O7
 4IeImQkGH/gEymDPg7y8QyyXV6AujeD3ep5WRAZeRPqJZHlUQ4O+gLx7bMHGtK+kLyEs
 CuyQ==
X-Gm-Message-State: AOJu0Yy9D49o5SSGYRP2JPsmUi67lwZZdeuONorLps+Xg5m0xZ/DmsSM
 +wE766Y710ZxxHxOLV8wLAyyD2kh5+y5x9gxVDDjzw==
X-Received: by 2002:a17:906:c1d5:b0:9f8:2b44:7b7f with SMTP id
 bw21-20020a170906c1d500b009f82b447b7fmr798395ejb.70.1700637450379; 
 Tue, 21 Nov 2023 23:17:30 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b003fe1fe56202sm1169178wmg.33.2023.11.21.23.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:17:30 -0800 (PST)
Date: Wed, 22 Nov 2023 09:14:08 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 16/25] backends: Have
 HostMemoryBackendClass::alloc() handler return a boolean
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-17-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-17-philmd@linaro.org>
Message-ID: <4ik94.41xfq4630py@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: QklD7pSZH0U1

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Following the example documented since commit e3fe3988d7 ("error:
>Document Error API usage rules"), have cpu_exec_realizefn()
>return a boolean indicating whether an error is set or not.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

