Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1115833wrm;
        Wed, 9 Oct 2019 09:03:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx53pdctXOX8Loil/e3uRvPibnVmZ9sqTpf9EJx8SIpIFCcTvzxqcSIICj9dxzHOQjJyrUh
X-Received: by 2002:ac8:550d:: with SMTP id j13mr4411167qtq.37.1570637037190;
        Wed, 09 Oct 2019 09:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637037; cv=none;
        d=google.com; s=arc-20160816;
        b=RZvLcSOf9X/V//J3TuxFl4WgQ+dBXxMkxvhhUsdkDWf3bDsuVn9332ISlNyv1oFcZG
         y9XghNQlz1eYkVhBYofFKRUQIcAKMskHRs5MydY7m4lFpAI6Rqki0WjRPwi97u5mYs6f
         /Ho5k4UKfO36dYV57yRYp7UHmuAsgpZ97F0lRMRPTfTgM7o+U7976AwxdHS9+Ll/BrKe
         yykpPs6hv+q0Jfom6lkF8nsNNE8cblgUjI0t5L7cWkFsGjGMmXg7nd0rBz5gIF5JpHcG
         l0LTVrl1vI3y5YrJVuNNvhfzyp0XGWZzrvPoop211svDQxN3mi0X04lAz+pRuQt0xRRG
         hlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=5lsty+u3GGo0ciZD01kvqbZylMlzwcQX3SLZQAqU/0o=;
        b=YsSVTz/UUZKdQQwpOUiZw0LWA9AvYny3HAc81l3oDW9avgt1ZMXOHNJWtzNlRib6/M
         TTKUkHhxkjLfNkq6w5BKQWlv2l850pKnYGV9Ant3PAzcrDZXnHE1uKuPBgLUMbiVtBwN
         AwYI5YurgLd9vjpRjncM5oK7Vry409ErkrT1Wg3peYbnIfuaUgUJfUM6DYmOD7B55F8+
         o5bT8taPvGSksWhqOqDB9Lxtk0nC1HwOHVoAB8mY7zZZvsMJhrC0FL1BA6z8eKCl1oXT
         FZkNjFD8xlZ/mcn3BH1lbHpQl/FujCagn2+qsKxyPGVT+HL9RpETQQpyFTOqz8Bnxt12
         p83Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sjq4qw9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2328553qtq.17.2019.10.09.09.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sjq4qw9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIERP-0003UX-Sp
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tN-0001lf-NZ
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1Kg-0001rh-BT
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:04:08 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:35417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1Kg-0001py-5q
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:04:06 -0400
Received: by mail-yb1-xb43.google.com with SMTP id f4so224816ybm.2
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 19:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5lsty+u3GGo0ciZD01kvqbZylMlzwcQX3SLZQAqU/0o=;
 b=sjq4qw9ZAEUHeEFBLKIuPjRqLC9DO88kN56zEQ9HD3K49xhCgZpMuTY/KoKeyKpaiD
 jYcZMAxeSACuwlae+YQK/KDcwir2J322xPe1LLdn8qlhd0sj0fWfNEpsUJ+c4q2CHVpX
 PLzPMmCH4xB1otrIbbJS1QDzcrT01YaNHVXQ87qJ2A3zseGQ+mG6RxrnfTKc10COhVnq
 +Y2D2+3EkjHKYwQlJMlDVWmXXPJHHt1xRjVy/5Ge7lzwClTVtGJeeA7zreesty7f4zGL
 e17hMBgjF5s428rgg50xROtCCstJLoK+0wMHv6q9RTyM5xwQhqdYlvgBH3tDFrOP+qt4
 caNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5lsty+u3GGo0ciZD01kvqbZylMlzwcQX3SLZQAqU/0o=;
 b=VJ5O7hvlnuHD/DzMI2Dg2TAEDJ5SIxWy9PrghADXivyQMor+lUN4qIOuqZkFEbRFq+
 JfZyUoor9sbhHHk0syhe/F68qIFua0HpqhQw3xIsKLftPQpGL4mGsPTMBZh1kNBPdqco
 buht1JCo+exxX+KyUchdmv4poex33ZE0TdnIX9C7zm48rmhI+H21JPmDI5fCVUtkV3Ji
 XJXvcwBuMdFJvmmeE9JI9ev8JTwGEkoT1tVPkW99LvJJTKdH7dKBiWMKXmCilBXvKU5j
 AadNTM2YLdUH2asRnpnytim1yT0/9xGYA3/lS4pB89665+UZfF/Ftb9tA9xwaonYsuFl
 o33w==
X-Gm-Message-State: APjAAAVWxZhffApraMSuZ9i3R7b6iFsRLVzoLDJ4hFdMvOng9ZPm8pp2
 nTj0wGdZa8T3TcCKONX9y0FAxQ==
X-Received: by 2002:a25:1802:: with SMTP id 2mr445666yby.369.1570586645109;
 Tue, 08 Oct 2019 19:04:05 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id v63sm210325ywd.100.2019.10.08.19.03.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:04:04 -0700 (PDT)
Subject: Re: [PATCH v2 17/21] hw/timer/imx_epit.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b872442e-f728-44c2-3138-83d970f65e22@linaro.org>
Date: Tue, 8 Oct 2019 22:03:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Sc1tTivKYQP

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the imx_epit.c code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/imx_epit.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
