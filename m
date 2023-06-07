Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp92725ejb;
        Wed, 7 Jun 2023 01:29:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69jKaUhZyjqHF/EWMGlKSOenagMcINtZDyX4DCi4Ir5p5dVysTV7Dw+WfqmBkS20TY69O6
X-Received: by 2002:a5d:5956:0:b0:30a:dd15:bb69 with SMTP id e22-20020a5d5956000000b0030add15bb69mr3487502wri.18.1686126548053;
        Wed, 07 Jun 2023 01:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686126548; cv=none;
        d=google.com; s=arc-20160816;
        b=AkyFugzk9zUza2/TGTa9m1tKbkrfnnNKpacL27B6Pn9+qEh2H4bfIEn2ZCajjITBKz
         iefopwMLX4EtTIJECpnUGJTZcFFFE+mUCJKyh322esYvfjMGe37OSqTKsI40i/qEEAJc
         GIZGx96uGgOROfxuJb0PWA/5oRZNpS4KBKvY4VpOnZ2FRgeO96G3xFyjozS6E2pGse81
         7Zcygw8ecRKJkcu/W0BjF46+BfD3qOrBb1sFEQdlYNF2vB6LUtnTofdYbWVBWQ5ukxSB
         9TmRcQRe3m2Uo18a6MU7k3aT1y0WvDaBHQqPVOMGMH9Jk9HmqNpJOdSYQA9BmMRQ/qwB
         kG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8ymjBykz6oPkeD2DnN/+SlsP633S5A1gJPG1IcrUGQU=;
        b=yIaJMamd+sNndQCPTjXnRS6WuaIE0Z6ktPsWh+LQrwYnZAaLyCGQphwQRgxUZ3ndhU
         sWlwlI0pbSu1GRrUjypPncTGQuIoPonShFUqVPYg+yYJj5RnJ0l3Tu+mMfTRJrEhp/sA
         RfQxziWzF7qPkBYV3AUcG26gzm4P9fGR3HHXqS1iGBbB7HwK2vI3zGxXwgDu3/6Nkerb
         XcBTupPgxtkW+0zuulQFIimKM33j8z1fU2sYUKhjsbM5L1t4Ewj0dsYZozF877nwVz/K
         OFZawUcKn6+ZDSN0b4WcJwPQLDNF7pFoCd7XkJaTCeAGfBqTxl9D6CJNpOcIQLa+3ChH
         WVug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CMNu3B2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020adfed46000000b0030ae3aa1a4csi6326694wro.37.2023.06.07.01.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 01:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CMNu3B2i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6oXK-0000tt-EL; Wed, 07 Jun 2023 04:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6oXJ-0000th-9T
 for qemu-arm@nongnu.org; Wed, 07 Jun 2023 04:28:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6oXH-0002Om-PO
 for qemu-arm@nongnu.org; Wed, 07 Jun 2023 04:28:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so59323335e9.2
 for <qemu-arm@nongnu.org>; Wed, 07 Jun 2023 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686126534; x=1688718534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ymjBykz6oPkeD2DnN/+SlsP633S5A1gJPG1IcrUGQU=;
 b=CMNu3B2irewPXFGkFCykjhzSkjfgLf5XHuLQqIM29C/N71De//ASQzev0vxJYlmBrR
 2oMlIt4YunpjzwX2OOkwOMcEswpcGOx0sTBluTb+13rXsfoxbOnx3NZ4U0Bkrlb51q0o
 MlT15Hgk8mxEKZWt2ilBVd2nZsCvhooi7ky7EEA9tuIMb5m2vzyEFj5eHZrHCeqOLTc/
 4shAkMjmbEgB0PZDDrQnodmVQL095BtKDfHeFYMlV3u1o8Th43EFkaz2pDsV49Qu6Ros
 zAy0ArKD6ryMYey7lGYVgVPo7krMcpooJOWHmsDelNepkKCC11AZw+OZ/771Is7uQncn
 X3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686126534; x=1688718534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ymjBykz6oPkeD2DnN/+SlsP633S5A1gJPG1IcrUGQU=;
 b=GXq60TcPqn/0QqW/f5kNtJhkraBXRYBemUw2apLquvrbObrGo+xS4xMTI4siEP0TCd
 jRF+jXKlbakDAsQlpXvZjs1mSS/TftnvLN6F7ZoZvDJjZHmmetClkF3CORAn2GPxNHjI
 R5a71wySQnvSdT8thAz8nfTR+wly2R+PcJo1O2Doqc/5rFi06IM9CRvQjn02I301I6zB
 sMYd8aHF7zgvtNhNTbcZ8yhLzvb36ZMR/Rj+PZ3tKGPubdS61ColDeXLzxf033bK/duW
 WI5NqxSBn4dNQv6o+SrL8zB0ePJSI6nYwZ4CIYTcOMcZgjh33//ZZRKv//nosCTwAyMQ
 9QxA==
X-Gm-Message-State: AC+VfDw/Ly0SItIJdfDQk8R558UkS+QimrCWwbJQn8Y+/cND7aNCn2qP
 7qvgdMoi5NFV1svtjdfu1FtmHg==
X-Received: by 2002:adf:dd05:0:b0:30a:e378:76e with SMTP id
 a5-20020adfdd05000000b0030ae378076emr3358951wrm.64.1686126534031; 
 Wed, 07 Jun 2023 01:28:54 -0700 (PDT)
Received: from [192.168.69.115] (bd137-h02-176-184-46-52.dsl.sta.abo.bbox.fr.
 [176.184.46.52]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d5386000000b00307c46f4f08sm14797784wrv.79.2023.06.07.01.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 01:28:53 -0700 (PDT)
Message-ID: <62e69c35-4869-8cc3-5983-9f83ff649da9@linaro.org>
Date: Wed, 7 Jun 2023 10:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-5-clg@kaod.org>
 <CACPK8XencE5MMgYdQ5H6iV_rTHaynv-UJYHZy=y-DaCXYBWWXg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CACPK8XencE5MMgYdQ5H6iV_rTHaynv-UJYHZy=y-DaCXYBWWXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: BWvkcF2hUIEF

On 7/6/23 10:06, Joel Stanley wrote:
> On Wed, 7 Jun 2023 at 04:40, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Boards will use this new property to identify the device CS line and
>> wire the SPI controllers accordingly.
> 
> "addr" and not "cs" or even "chip-select"?

"chip-select" is a good suggestion!

> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>>
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/ssi/ssi.h | 3 +++
>>   hw/ssi/ssi.c         | 7 +++++++
>>   2 files changed, 10 insertions(+)

