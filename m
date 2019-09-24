Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4165765wrp;
        Tue, 24 Sep 2019 10:15:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMH7gxK+0G4a8Q0nTOSudxeTQTElC7aublqh0gyO4O/XWbuv7Uyz4l/zt2rjvVvgNo0bcx
X-Received: by 2002:a05:620a:16d2:: with SMTP id a18mr3585805qkn.104.1569345356813;
        Tue, 24 Sep 2019 10:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569345356; cv=none;
        d=google.com; s=arc-20160816;
        b=wHmRcon4Dys+/caiBroJwIenNUHSNwKEsSuu6BnQIkYHMx1DMhceMeyQgYCV/1LuyE
         4CC8GKALFkQ2LZaje7UhaQcjSL7L8JFGWbyZWitsXf3BUUOs8FVG3ShFP1prFAzbPa2S
         Zy8Lhsr2/0/iTi2FVkD/IzGwDHnWs0+0aPpm6dCsiqUe5M5GPYSt/fGu77hsaFBqUtzm
         9Pg2v0PlcWeV81GVC734/ax8HkHcV+pyvm30E/cNH4Cc8p3ma/3EBSMa0+WZ5/w+8KWP
         e8JDfrGAdtvcHNO+FH6108Ntoovo1YbGmd3h6SAXgOiOJKmd2bNj9JKifkp3s7ZPNwLP
         JxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=dcF8WTJf1FdsqtK7JaRa15A8rHmVQlOZFjgElD0eE3c=;
        b=0hcOHytpNeAye6nCS24CU8PNHMUGlOqgLSIeJG7hOStysRlCWSpMBFK3xf6Wu29rCM
         ZMIuDfXha6litxzTdZAI57CZqMBSGfpH3dwIg2HYNGz/JPiBudqInWmyYGGQ/quY5qRp
         uJ8P/LRsNon84+tFEpY+2gLklHaLmCM1GPRcl/TPQ7IRdaMgf/ZsNISgIEdqUFJk8Xp2
         mRK2bma6YGA2EPFE1MA6A+9cp71+rgY0tel/LAkO+c+PmqSbCatPQc+5wSHCzhIzMKkp
         kbUTZ6a45xel6WGvzWDHtQzPZMXzlfH1t1JNYCKnpCcLp7zAOLNLsi4AzmSe9aAX4sRs
         5MrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zqZ9NC9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h128si1652560qkc.149.2019.09.24.10.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 10:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zqZ9NC9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCoPr-0002D3-PR
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 13:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iCnhZ-0002CH-8o
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 12:30:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iCnhX-0006WR-P2
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 12:30:08 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iCnhX-0006Vd-Gg
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 12:30:07 -0400
Received: by mail-pf1-x443.google.com with SMTP id y72so1659015pfb.12
 for <qemu-arm@nongnu.org>; Tue, 24 Sep 2019 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dcF8WTJf1FdsqtK7JaRa15A8rHmVQlOZFjgElD0eE3c=;
 b=zqZ9NC9Xc38c9xYG5BzIoDuGSLSc4NTCD5wmcJ3syAEOSesf3jVbkM/BJ5L59GpUVD
 iZxWFpsPUSeSzAYCAQ1jd32kwZqyRJoO6tbveb5FroftgIytq4snqmC1+b5HaYbAvzsp
 L/nOo9Key5QodpZc/1Hhys1uetQYgCg264dPHDAzdWgfJpdaQY9Iz+oz0jUj9b5+mCPu
 otUS/45nd6+EA2s1eyEMxsANeSeZiEcRRI8ri/nqpaXUFsO3aw/QzgiqXAJmY0OuG0Oz
 t/1W8DajLrBOC6ZXsvPje2NO5JONEfE01hCRhKR5HfjVmIcmRRwEDVGhQIc8+ptKbt4/
 5hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dcF8WTJf1FdsqtK7JaRa15A8rHmVQlOZFjgElD0eE3c=;
 b=BzEEI3rq6pMqm822OxfWeBO4IrRQC2ez6Ij2WFDMwLGr+Q40HM1FRVlrgzuko3HeAv
 FlrLjT1UrRMCf47ahx9v1vFGLpMmMJlnzV7OZXPtD3UrpZ2V7UNOxaNtrVHbH9XFJxkq
 55ugnSWnDZV9HbPV779tDcyoyN5j68SODL2/9R4h7jE0L5i1L/no8Q0le40t4mkptZUI
 NMLdQKfew59Ber3gjJII6+RJ1viaFAPbk/SJRYJUdAdtv0EYyJIZJATC3SWhPluGfeEU
 Vqdu7SVAKTu7CmhSPzPJUYPQe7oFho99f3Nicp0cGiqrJUCMeqhnbS5r2piV2gUSmKwa
 U88A==
X-Gm-Message-State: APjAAAXLP8mlGkH+9eeZq33KR77lc7sInNpFUrFOYB19VPzBm3v/to06
 PvrFT52lQIl8cBWUFBsTUADtwg==
X-Received: by 2002:a62:e916:: with SMTP id j22mr2866488pfh.210.1569342606374; 
 Tue, 24 Sep 2019 09:30:06 -0700 (PDT)
Received: from [172.20.32.216] ([12.206.46.59])
 by smtp.gmail.com with ESMTPSA id q204sm5751112pfq.176.2019.09.24.09.30.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 09:30:05 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 2/4] Memory: Enable writeback for given
 memory region
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-3-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e5e66d9c-16ee-a700-7608-69ec19c32b47@linaro.org>
Date: Tue, 24 Sep 2019 09:30:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910095610.4546-3-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ima3mIaNmTMi

On 9/10/19 2:56 AM, Beata Michalska wrote:
> +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length);
> +
> +/* Clear whole block of mem */
> +#define qemu_ram_block_writeback(rb)    \
> +    qemu_ram_writeback(rb, 0, rb->used_length)
> +

Inline function, with its typechecking, is preferred.


r~
