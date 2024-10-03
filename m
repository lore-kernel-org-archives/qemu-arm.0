Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1531352njl;
        Thu, 3 Oct 2024 08:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ6YX8QT8kdtVffzJUeKplw6RFye3XKfytwT2KrZlmM6YFel48JABTGuFP2puJM26sqt+ViAPHalJdkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFhWHfZ3QddkvqZ9Mgdeqe2wQBmR82ZHtH3i1EfK9sQUlmUrOJDoYRiaV+ukioT3JTxYomo
X-Received: by 2002:a05:622a:44c:b0:45d:79af:6a3d with SMTP id d75a77b69052e-45d804f638fmr107006781cf.32.1727970961634;
        Thu, 03 Oct 2024 08:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727970961; cv=none;
        d=google.com; s=arc-20240605;
        b=LEi7cPfBJ+76VEzZa3uw7ewc/d1KDgS7anBcw4K6VkkcuvR5mh631ZUo/nXD0MFGMe
         U/lqfaMYzo6ii3n1Dzacddt2w93Auu7mnIo6kiAT0KpiJQ95+5DYWnCDY1mN33uweVhD
         U7c0hCpi437rSRRYb8LVz9RG+XESogRAgMOuswvrFkXPxsP4XQ+k8ey9fFsj/eLN7sVK
         eHOsO2wOIbAHkTjLTbG/slY9WW7suX2J1XIGOiR61z5jHLO9bUHiOi/xKgVdLTHhaYi9
         bN5sOoWzrckFeUSNxXfv1EeggEmMyZM4ZJT94czZyLK8o1GuxSkPteX/iCQxNZxhYava
         Iu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=haaGdNT5KqDsiLnAxulpThAYXAfTnS2IcHRulTDj2cM=;
        fh=pr4zWPURV1vQc5Oxlaw6esAhm7QAN+5xDuIO1GAwNLE=;
        b=PlprOQM7RaWIM6h5pNxUdl0BSBRQk/Tg4FVAIZD2BSrQ6CYKOBzGyl4RB//GEn/d6I
         X4omNqgvohTOE+kwL828DLaPPOWzdf6hgJt6pqGHmvulUcmASmd0/9tCU5D5PMqF6gR/
         ssRJ8qYfXEkCLrvKKS9Bcd4XFrb/kkY76D8HgoR+lwKTEOqW4hKL2odX8HE7Hdbx/TgP
         L8ynx55QfqmySHleF8X6m+2p/w8CbSX7bDWMoqpFfu8cf2kesn/NAoAo+nxGCr68eXsJ
         yM2mpKaDbqktWeyvdz/dTmoT/5R0X4CXwn4j91wLsI8421gX1030+4NB4zpSIWy6DKZn
         +POA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u/QFcRW3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45d957454e5si10194351cf.808.2024.10.03.08.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 08:56:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u/QFcRW3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1swO9b-0006S0-5x; Thu, 03 Oct 2024 11:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9Y-0006Q7-Lq
 for qemu-devel@nongnu.org; Thu, 03 Oct 2024 11:54:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9X-0003SE-87
 for qemu-devel@nongnu.org; Thu, 03 Oct 2024 11:54:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso9372905e9.2
 for <qemu-devel@nongnu.org>; Thu, 03 Oct 2024 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727970846; x=1728575646; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=haaGdNT5KqDsiLnAxulpThAYXAfTnS2IcHRulTDj2cM=;
 b=u/QFcRW33CzgGNCFgeB8YyllPpIgKIJkcZhNBUvhpeGekykR88TaTK2CI07hcQ8ohC
 UvU3SwMV7vHwjeoV9wLjnfHd6kpGUj2KVaiJfpXel67cz/BnL4XvyupiELfO0lyzttKa
 Px3u5YyUaBryjQuK4uSpkM9hrYPOANAeJ9pt3eQpTlyalSld3gnojKRNcVCjUWYrCJQN
 7dULRO6Qd1EtoDADncar41aKsz6Cyn+R45F4Ka0j0Dfdrrd2av6xTgLLYC50AklBfsLu
 iwSR8t4OLd/FsEt5ZhiwoC/o2zX5r5rP2hg8y95E1M8IgQ+eByWSh1SdyDd+3MsPsDR4
 SQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970846; x=1728575646;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=haaGdNT5KqDsiLnAxulpThAYXAfTnS2IcHRulTDj2cM=;
 b=o35xXbdSzrj/ZzJNe5HUJ9yWBhEs0C56HetyavI+Epdaw1mC0xviIZbkL9coh+t8dQ
 8FEXWi3bQQyOGUnX8IIkOS7gyZR7bfOZAKbKmo+dTorzJGeuzS2e0SEjuhngr/G8S9Xm
 qmnw+2sf+Inp5QxpdyP0LSbsaNW8MvEJ0uJMO36RbnvsCwACdaTBKr6azxiwSRUaTZGy
 htuVVWlEyvyLZvG1q/+nIBIBDQslCreQSE6pwuF6ApXYq7lSJDGPMReS5WS15zowan4T
 MXfqQD88yE0TE+hw43QS7yHtW/c/cKuCHMyyDQ1pgCkWwatnzN2rMt/zx9VJ1TXcpbqB
 5kRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVNmuEF6fhMohc7k4ENVuxoGDg51wUgQN28zzpOfE+LrCcIV+cTMUD6zVgSs+i94/IYikhs9EWRu+x@nongnu.org
X-Gm-Message-State: AOJu0Ywl6KQ+bXSXpIjdEd4YaGfqtt2b8XRtMetHs9QDSHTIEiXXJgL7
 vzv9uUpiXqi20aEL3TcjwGUFNbklR6RGJlXMT3plqyHWRJzQmY+EYhhkLzE/e7HEfl37iq6j0Xp
 Mi9w=
X-Received: by 2002:a05:600c:3ca5:b0:42c:bd27:4c12 with SMTP id
 5b1f17b1804b1-42f777b7888mr50916875e9.10.1727970845717; 
 Thu, 03 Oct 2024 08:54:05 -0700 (PDT)
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082425f5sm1544489f8f.50.2024.10.03.08.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 08:54:05 -0700 (PDT)
Message-ID: <efc4c807-c6e4-4462-847a-e7ea8b54f711@linaro.org>
Date: Thu, 3 Oct 2024 17:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/omap_intc: Remove now-unnecessary abstract base
 class
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241003135323.1653230-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241003135323.1653230-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AKglm9/DmUtu

On 3/10/24 15:53, Peter Maydell wrote:
> The OMAP interrupt controller code used to have an omap-intc
> class and an omap2-intc class, which shared common code via
> the abstract class common-omap-intc. Now we have deleted
> omap2-intc, we don't need the separate abstract base class;
> fold int into omap-intc.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |  2 +-
>   hw/intc/omap_intc.c   | 13 +++----------
>   2 files changed, 4 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

