Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2395612ejm;
        Sun, 23 Apr 2023 12:02:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350asfcewDruvYlzf0z4hFrhc1Na1W2J8LUQWVOOIdMFdVP7yq1nRnAsI/r9J6YiQZJM9nxng
X-Received: by 2002:a05:6214:2a89:b0:56e:b2ad:e2ea with SMTP id jr9-20020a0562142a8900b0056eb2ade2eamr15396453qvb.27.1682276579243;
        Sun, 23 Apr 2023 12:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276579; cv=none;
        d=google.com; s=arc-20160816;
        b=qpv5zhodAoDj3fQM2DubjfmnzeVQfNdtVVoZ66fyDTFzMAudoSn1e/G4Sn/pFT/BCK
         M2n49kLvdCxPe8wvYFcmhiKv24gWAGTTxMIYis3zCgH7hICjWXA7A1Q0XmhVXBZiL9td
         kwt+C1aNuM+QLXy2gU4BckELBJVq9PfWxnfQubtlFx3Le5+7JnSr9QultqWJGSrjMrZi
         l9k2ReFGbx+89TT6DEsajn3B3wJg6nGBQ8Io1ARPppCn1zptscaIHDWGoC7UDNwrMNEC
         EjXxvVtqnTE3n3Xnhm5XlqodJIQmmGGG+ZvW1pngCQ3N+ZFA0kgZfy3P7r2HR8DpNmxP
         v7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0iP1JdfXPd/1ZMdU27w18Bzl14WlTg0wkF7XKFDM2Fo=;
        b=XNksJsD52UA8HAs7fuYcn197f8uqkeYe0ax98Tb8L+eg86266QrpkYAJTky/1br5gM
         yIbk+SEJYtjfKSN+dBGai4DuvHdZb5VcG301u6sCOsnWRE7sZ+EL3bTKeuHv7Au+Sthy
         K5QjbFUrHk/V8m2WrT/RhUeHzMv8JItRBy3zrCMt+sfUvuh2VPuk26x5Ru9Bh7OZvKm6
         8xKBzNS8HmzaUDFVofE7wYLN7zQrg4thgIid55auN60NAbMtQtzhhlRHOlGYqkO8ialr
         WVnRj98MFD8OimEehqXlBIsvsVaaaAfbqoVVV3IkDuGQqFnkMgt5FIYKr/S8J5dRGYmD
         xjEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/9YRO5K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420e800b005f644c4af6dsi6285678qvk.513.2023.04.23.12.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/9YRO5K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqex6-0000Bh-E6; Sun, 23 Apr 2023 15:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewl-0008R5-0b
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewi-0004IR-9m
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso4082655e9.0
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276421; x=1684868421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0iP1JdfXPd/1ZMdU27w18Bzl14WlTg0wkF7XKFDM2Fo=;
 b=a/9YRO5KKep3+Bjp2Mw17VatwYLUt88twxJNUzRy4OnylB5muPQy2FK6k1sHLfNFIb
 ZpEWoN4TmbqOuWG+uPHImFTsnssO8Nq0ckbRI1lIxREK7fH+ESViznZGkeIE3ZPuEm9v
 yn2EaTV1pXrZySu0N6Fcg2lruJIOQUqINfY1oBRIky7mbpQxxbz9z/CR64hFAJPF+zls
 Nnd3zjA1rK1xffETi4bJC8fAxSdYxjx096NXWF9jzwlxbTAEIQd1BmrNLvY3yT4bs2jE
 fB29a/54oFG4ti41LaEdUq+p0Wg0iJhSSRglIvULWVhZLoHZ7HbmoenKVZZg2ZfYGRku
 EmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276421; x=1684868421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iP1JdfXPd/1ZMdU27w18Bzl14WlTg0wkF7XKFDM2Fo=;
 b=W4BtUe5wVO4WdbXMwPunrVl04Xi07lNahsGfaDXzai7WZtlttEmc2gIIy+SvgJZZEe
 gftp86o6Zuu6opmmXfDbKMzQPiaKZefPv4/KprqBQXjvpIO1qyKjF/2KU3MD/gam2eFV
 IxwIGq9skkXtMk6mWHfmxaq6JxaEEVGvTeZLnYBbKvtox5YOBrR9oeOvAJKewzVkJBfn
 p/IHhYkeK9/8MqhDXjf5bXKS4O6JZ2uyo9PRPPk1QYH1l4nZCsiJNGZj3ojgDVpOgBiF
 8WfSCmpqyrgWwQ+x4iewYjGihsHSCXi7mzmJHkyKhfm2Mc9H3tTIwd7GL0tOGPhvsVNx
 /VDw==
X-Gm-Message-State: AAQBX9dqxYI3H3E7wcwbK1L4OZcTuBynQdkQb6bq4WCOqmKIoXY02FQl
 wrd6iRCjiiVS7Om1kOQHd8gKkA==
X-Received: by 2002:a1c:f601:0:b0:3eb:42fa:39d5 with SMTP id
 w1-20020a1cf601000000b003eb42fa39d5mr5808785wmc.29.1682276421544; 
 Sun, 23 Apr 2023 12:00:21 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b003ee9c8cc631sm13712162wms.23.2023.04.23.12.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:21 -0700 (PDT)
Message-ID: <348ab511-4c1b-6ba5-30e2-c9a90e74bb54@linaro.org>
Date: Sun, 23 Apr 2023 20:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 27/54] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: UUssC1Sdptqg

On 11/4/23 03:04, Richard Henderson wrote:
> The port currently does not support "oversize" guests, which
> means riscv32 can only target 32-bit guests.  We will soon be
> building TCG once for all guests.  This implies that we can
> only support riscv64.
> 
> Since all Linux distributions target riscv64 not riscv32,
> this is not much of a restriction and simplifies the code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target-con-set.h |   6 -
>   tcg/riscv/tcg-target.h         |  22 ++--
>   tcg/riscv/tcg-target.c.inc     | 206 ++++++++++-----------------------
>   3 files changed, 72 insertions(+), 162 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

