Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3640992lfp;
        Sun, 2 Feb 2020 23:59:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7D1KIWiGd2tmLEtZBpLBZ1fOStqokpDY2v+niB9WhgI5syEqPyK76CediwrwZ1HwEw9C/
X-Received: by 2002:a37:a914:: with SMTP id s20mr22504959qke.270.1580716794075;
        Sun, 02 Feb 2020 23:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580716794; cv=none;
        d=google.com; s=arc-20160816;
        b=02QUZhhx7Var0zW2KRW7/vOuvjS2fmZreJZdTDHW/b++CY5B8025t/BnPIL5AuzpBL
         bqXm/NsVSBJ3nMDvXsEB66q0dShFpNRXD2UCvktKgScozUqHcFej+YM8/xJUtWfVezyN
         Y8ucsiZRrVMeHWV0YsVq2tLuCBtLAJVZMlI/rKulEXpcMesxwvRjbM20YCy6cujbGlnL
         4A5kEAw5Qw/7dyoTOHTyoSHw09AZ0uFErlnb0n33Zcsx6/+DQiDbYlxpZP9VQXiL/B56
         6+e6AL8pWZpEM4qk6a9ZJEer6tmzOV6ME4H82CY+Wu9cq7in5loH5UK1ZsPYdfwCU220
         mYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sBdoRtr8F0Pw3FFJ8U50S8fiBe9PEVWu5K9A4Ul6qsY=;
        b=psMC8rvtJk+aTgaemMV7JiG3Q7vjnl9C2HK1iWUqsBel6KMMgmUj/OHUPCe/AMuPl4
         3w2HkmR9+pwdGhmx8eDDYeXOV4tAhLz/RUkLMl4xZ31zcGtnG2MHSTqx51pFxGZW+WPt
         h3rKlFoTF1ydznEnQmeJBJRJ4O8MgtLIfMhrSV1SukLOWWYtowLXYtX4zcUuH3jYbDMh
         QKuNqflmxMQ27Qa9bS+CzoeFiqvL+/WcTGpR27vNqEJO1Y3XXaRnpGmi7zYMSNb5mBPt
         pp1cdf+M32sflaYEuL38crxoUSy4C08OL/5fel955aMvBgb1utWLpzj1MrWqZny+vwlN
         aTtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U6ZC0s3M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si6056904qtr.340.2020.02.02.23.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 23:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U6ZC0s3M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyWe9-0000ZL-IN
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 02:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iyWe1-0000Z8-TN
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 02:59:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iyWe0-0007Qc-ST
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 02:59:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iyWe0-0007LV-KD
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 02:59:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id y17so16654313wrh.5
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2020 23:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sBdoRtr8F0Pw3FFJ8U50S8fiBe9PEVWu5K9A4Ul6qsY=;
 b=U6ZC0s3MIufiBJ5tEjwWysMaWYuaN0fim8HXSMLBm/qDPLVPMBT1RG1lqc0hEqDTpC
 g6sm5QyeycWtyciY7D7OfXrb0/Et8EK+2rDBZZ+ji5GyPydhNQ7ftzo7OEPabFvfWJGD
 A80N0r4C7Izs4a4IJCF4zp8A9HREtbu5d+OtrnZnihZ9z0gg2dEZu1726qeWVWukKnMd
 2Mo076N8her+aAF8rmSmyX+BeMSNEcwsvmbtT7VdGb2QIuc9BXgaGd4sCMgUj092ECcf
 iB5oQghuZT33+OevoiQUkpEBYCWLcwS5RaBVKuqS5OukAkb05AzLhPvGQBRygw4joEo4
 iLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sBdoRtr8F0Pw3FFJ8U50S8fiBe9PEVWu5K9A4Ul6qsY=;
 b=MEQsghYmNnVtUrkX11otQ6vhsfEz/VSd1LncLI8eQoAEzI+CkrBtZyssULLrPAx5qW
 F4I1FzALyqXdMAMr8T5emNRSD01Hc+XQUyqRoFOqD7p3cgYitNVFoPWpkCI4csBEYHgM
 I+JnfHBoi4hJ2EMvck7wXHp8GeW2pqY9bBDjG0ieZI7xXGwnsiTXaG/rBe8FcN6gmrBk
 TirQjpxthr9hGVyHcDMGc3HS3NB28Yf4nI1ZxVo3Aht2JxHevOde5jXf7AIAsdWy85Wo
 oDQ/loi0PNQfP+U+EHJ1gnR8VEbk9TXwNa2RN+80h9wYw8POicbiRe6C0thMvBLgV308
 +IIw==
X-Gm-Message-State: APjAAAX2Ul4h4rnZRd/HZBIyrRnH1pB88s1ypPz2OFR7soejO9U1y70l
 07tt67qqh/O5kvw7oPYNmxLmbw==
X-Received: by 2002:adf:f606:: with SMTP id t6mr7733242wrp.304.1580716783382; 
 Sun, 02 Feb 2020 23:59:43 -0800 (PST)
Received: from [10.43.13.93] ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id k10sm15968wrd.68.2020.02.02.23.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2020 23:59:42 -0800 (PST)
Subject: Re: [PATCH] pl031: add finalize function to avoid memleaks
To: pannengyuan@huawei.com, peter.maydell@linaro.org
References: <20200203074718.37252-1-pannengyuan@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4fdea63-0d7e-1f0a-b0f9-68bce365dc5e@linaro.org>
Date: Mon, 3 Feb 2020 07:59:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203074718.37252-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Cc: xuding42@huawei.com, Euler Robot <euler.robot@huawei.com>,
 qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Q2HltZJtnZ+

On 2/3/20 7:47 AM, pannengyuan@huawei.com wrote:
> +static void pl031_finalize(Object *obj)
> +{
> +    PL031State *s = PL031(obj);
> +    if (s->timer) {

As far as I can see, s->timer can never be null.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
