Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5282763ejc;
        Mon, 6 Mar 2023 16:32:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+GLddHmZlxq0Se9dUByKYhN4ElxXrx/wNbFhPIizwFuRNwDgJnrnInbRq/iUk48QJTH46h
X-Received: by 2002:a05:622a:248:b0:3bf:ab9d:d322 with SMTP id c8-20020a05622a024800b003bfab9dd322mr21879591qtx.10.1678149164289;
        Mon, 06 Mar 2023 16:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678149164; cv=none;
        d=google.com; s=arc-20160816;
        b=YMB3RWISMpcoA22wbaV1bEqKdIoSixvQ2Oxn1T2t2MbTwzG3uM0IELFxggmGEB30/3
         CGnocfMqi/U0FjPyfJaKUptX09ds8szYmVAxsxgFCjH1q6LjD7p9TFWTBTyt5yg81JZJ
         HiBf31pR0TOPnmfo8Ok1kwX5wRRez1H6i8XkQ33AEKP1CMcJDn5rcB4bCE9DeumI/N+Y
         g18pSRvasqIS49kYERUdEtPvLYBOM+8SaouBH9nTcIkAJTIHD9abdFiGg9ASTRaQ5YZK
         gLZME8WcfA0xVcC2Lz4KNAH/dvgWv9RFFhuFEnzqscKCtf02qws2flEW3qblEnHBMp/W
         +CnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
        b=NLsN/OgHgdmqnTzpyir9oqt7uu8VSQTnxvCSGlRDtqX/U40ub2AwyccyxGNw3b8TWd
         30LUwPZz8o5Z/z4Ti7KYCM+U9avLDFHVnBQXeJbaOIBvCfzbKQLiE8AfC7RitQ3buwWH
         WyzomE0YQ0qUQuUS8uAi1IzTaiA5Efe/0B2IiCBH6Mvy+1hgFzAPDUuO7HCN2+EcbykC
         A3b7yfkiqQIvcIuPb8jXAQ8KGOSaE/MQhrCohMRxDO9JICN7rdQdHBRWVBxvWSl1WxC8
         4NFv7UIt+y4NIJWcSJ/cwNT5DFFBsy2LetFhSxEoVkx46ZA2AbOsw6gR39pppfciTv+O
         T6Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9SvHaNq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05622a14ca00b003a603561e0esi8552104qtx.485.2023.03.06.16.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:32:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9SvHaNq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZLFk-0006dM-7U; Mon, 06 Mar 2023 19:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLFi-0006bT-CK
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:32:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLFg-0007rV-Of
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:32:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id c18so6802710wmr.3
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
 b=M9SvHaNqPVenACAukgW0dZLxO+S+PURldLFBQSe69KsWjBidotxl9f7AEJ2ylbwz4+
 vAOgWM9sgJHn8lojQjXb8JHEliDpAwHQzLFIZ/mZIxb0HNGDGmFwlnE0KyWRq1hoYJeP
 QHsI7cPXIzursAG0wJaBVpfhHNLK29xO3SlfsTqMAJIDvZ+nYN9GihIScZtqmcGr0pok
 lS5/SRJXai76hrdTn5Vj4km67bCdamAP7vWpyaAJ37m0JqRPdxJL3QGVhT32kAAqMQzp
 vNJF1Nc7X22+yAo+uS5ilINXzkSyWgylBk7sFcGMypLu3RqVGHhlDpxHnS+dGnWwiRwM
 6Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
 b=nngt/6SN7OMDDT0+lzxXahx/jsMPCiBCbl9tK7GxKiRzOzFbIyxUgiZhCl9H8mwtH+
 WjOXj3XWuSe7g7fsT1RR8ikettOFwoKJqZjxFcWBxNYmzeRGHhHRjSeFaAqY9TljYIhE
 Ey6leuZa0egZoEUXb6qRlWA5ayijdhmdHXE5O+DAlimzxvXsCMw6zeiJFo9eobFBsjTj
 nD/kg1U78lrJ0RgUo8JnKpOvPODGcfD+r9BPNv8RwICpVWQuOqyE2rcYqwMzjiplzeDH
 qplASTUcKy8Nh5l1zxyDheDEOhWIcyAJzYyvx1KwRYakHzIhbuExqNUZqFPHo/XqVuA4
 uiCw==
X-Gm-Message-State: AO0yUKW5zwsG0y91CPGk5QYuBJvM/5NANawimeUJ4iqw1NY9oJCVvvvX
 C2g7+6Phbx5o3JJ6Nk0/bTxpmg==
X-Received: by 2002:a05:600c:46cb:b0:3eb:4cb5:e13 with SMTP id
 q11-20020a05600c46cb00b003eb4cb50e13mr11138169wmo.31.1678149143380; 
 Mon, 06 Mar 2023 16:32:23 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm16618566wmq.5.2023.03.06.16.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:32:22 -0800 (PST)
Message-ID: <cfd598bf-1276-eee1-b4cd-6030a06967a9@linaro.org>
Date: Tue, 7 Mar 2023 01:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 47/70] target/rx: Use cpu_psw_z as temp in flags
 computation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-48-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a6uXrgycAEYG

On 27/2/23 06:42, Richard Henderson wrote:
> Since PSW_Z = PSW_S, we can move that assignment to the end
> and use PSW_Z as a temporary while computing PSW_O.

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Use tcg_constant_i32 instead of tcg_const_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)

