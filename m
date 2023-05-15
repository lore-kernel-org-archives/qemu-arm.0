Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6409180ejq;
        Mon, 15 May 2023 03:32:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ru2DQZgLUfkdL+oW68UShIhRjtKNiqiWXip3ipWUv24AGHKao1Aiun2h3OXrTF7XRfonz
X-Received: by 2002:ac8:5cc8:0:b0:3f5:2831:7429 with SMTP id s8-20020ac85cc8000000b003f528317429mr5443303qta.25.1684146773086;
        Mon, 15 May 2023 03:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684146773; cv=none;
        d=google.com; s=arc-20160816;
        b=WPwFKztlPrlP7HUoJ3rira9BTSCkzSvaezd6B840s9EcgIuvX/w+W8pMpHlemSgTgR
         BN88A5maU5YiqQD2YoXqqYfGhpdKXw8LQ8xYmWftK2qzpj5c2o96ZkdYw+nMgExYXYka
         YIxvZwCKecKgw+6HFeRA9jJOaJuoURG21SUfLIk8Ygo7PZ7inMWHy2qjFSQOKQJSnOkR
         JJKZBWtV1LczauCwuQAlqtUGH12QGyKu/L8wlYvMTRJVQU0st5AeZns/yKrUwNealh8G
         VCdPVklA1zLxX8LwlGSNTdR7dEqdPhGlyV6Q9oQa1hx1C3INoMIKsA4rhcwdLvulOd2a
         kl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=1dQNzAhAMICyuaUlp3QZt8dpZVBzS0bz4gGXnrdBr7I=;
        b=GYSVNC0vkz8TdRMEgW54ZOTcr2kf6rMTGTZNtN+PyYK3TD1Hq2ppy2Ad/3gV3VZfps
         7pTKm03RZjp8K4t0xBdEfuvLEtuPaoC+0GFW2c44C10Bvffm+NG0wCoDDnunG7vugyG/
         uzhYi9QI0Kufz7WA7vlxqwj8I1IKpsSRVY4URBWDrsw9CO5ofY3GWhOWeDpB8T3J9uW0
         xLkUx6eJQKjLibJApa+Gqqnx2wAi7Rw3c8lduRIj2AGYO7SzvC6wEwtJv/Z/0V4VtgY/
         pkcIkSULzP/3OrMF6qm0rHgAsIopue0i1YMlJecO44++Iyar2tBOIHpaY26nWPqz+rrH
         EQvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMXKozM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a05622a024100b003f43703e2c2si8547293qtx.400.2023.05.15.03.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 03:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMXKozM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyVVB-0007Sz-Db; Mon, 15 May 2023 06:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVV9-0007Si-Uy
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:32:23 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVV8-0007Yk-BP
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:32:23 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96a2b6de3cbso1039517566b.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684146740; x=1686738740;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1dQNzAhAMICyuaUlp3QZt8dpZVBzS0bz4gGXnrdBr7I=;
 b=NMXKozM+7TzkJ7fKq98DSA/t6N6Zjc9dZ/fUlwV3OoPDdJbRNvVcoy/jxvBGDAERD4
 c8AkDCs/1q/Gm2Agr4/ky7lj0dU77pnlD4lW+O8kzevhQIJiWVq3ronLv5veT9WAJ+k4
 YJOTv/mjTUmQ3LzGKSljtsLAgZbiTwXO/d5nL1p2WjvwzlzlFPGuEiUK/J0dDxFhslG5
 c9GyWHBTQe/RCxwzoSGnMor/UsPoL0VSrY1bgmAighfXbH0fGDkaAc/pS1Sknoms0g7W
 kqwzzzavunO5jbTXr7BsXOckEGcutdkVtP/Y6TyY8tmZ5JK/fTRn5C1T0Nhjm8lwzgNF
 jVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684146740; x=1686738740;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dQNzAhAMICyuaUlp3QZt8dpZVBzS0bz4gGXnrdBr7I=;
 b=iSQJftJVc+1fbdrubwFr9WJK1j4xiuwQvRWOA6KsGNNrtYgAez+c8tvB8SCJaF9qsh
 nInVtB7uMLQv4h3H6tKD9jwnsb4PpKnppwujt//g6WbQNBNOcfeG3c5MOUigIWyVqDeH
 UBTvFFsfeky0XTIr+O5U8nB2ceJk3n8WAU8Pm+R2/kWWGGHBn8OAdPWJV1zMxf8SXkK5
 t6m4IU85UJuO+Gwiwn1snmPiGJlLmpDi5hivCPo6NAyw+wxyxla/0b+k+yByTZWq3a2Q
 l94iMTY6/M7n7ssnrhTktf6CXc4wBeJk/03iwF96CljcpbN/8OqeLTg65qBsp1QNRFVW
 YhxA==
X-Gm-Message-State: AC+VfDyuKjW35aqQqN7h3NLbogpEjM39TCWMUAgNxGISyJOi+fbEmy8+
 I4CPYY2d0L+dhDHOqPZBbmz1sc9RbHuqv0wovN0Kvg==
X-Received: by 2002:a17:906:db07:b0:94f:6058:4983 with SMTP id
 xj7-20020a170906db0700b0094f60584983mr26121119ejb.76.1684146740392; 
 Mon, 15 May 2023 03:32:20 -0700 (PDT)
Received: from [192.168.200.206] (83.11.34.59.ipv4.supernova.orange.pl.
 [83.11.34.59]) by smtp.gmail.com with ESMTPSA id
 tl14-20020a170907c30e00b00961277a426dsm9166244ejc.205.2023.05.15.03.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 03:32:20 -0700 (PDT)
Message-ID: <5ecddd25-09ef-b6b2-3673-70e819e8cbc7@linaro.org>
Date: Mon, 15 May 2023 12:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
Content-Language: pl-PL, en-GB, en-HK
To: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
 <55d7cfbd-7256-2780-59e2-11e532e08cfe@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <55d7cfbd-7256-2780-59e2-11e532e08cfe@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FHiSq62B9u3n

W dniu 15.05.2023 o 12:27, Leif Lindholm pisze:
> On 2023-05-15 11:15, Peter Maydell wrote:

>> Why do we need to provide a full GIC DTB node ?

> Longer-term, I want to be able to present different specific gic 
> implementations through this interface.
> I believe the 0.1 variant needs only the Distributor and Redistributors 
> base addresses.

TF-A uses only those from this node and ignores rest.

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20953
