Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1140780wrm;
        Wed, 9 Oct 2019 09:24:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyT6nZi6PSi/MdbgbdHzhAxCBi3mk4bc4IXifKX++XK3wEJYeFw1/WueL4r1X6l1wdl7+il
X-Received: by 2002:ac8:435b:: with SMTP id a27mr4704766qtn.242.1570638289890;
        Wed, 09 Oct 2019 09:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570638289; cv=none;
        d=google.com; s=arc-20160816;
        b=WJIu2Kvs9BbFCGuBSr1OShrhQCAmB1dENKZ+6VPEfEmypfSVO4ObsxH+R3w8I6qglI
         KrhgKcTH0556fJlVj6XI8QK03lUx9K9XZe4kelv4xrjs2x86HPbTjnPh6ngfKfdImjgP
         wXKZDx0otS7Ao2YUWyceAJkmKvcLNNbeOa7eRR+DFmi0gK/ioLkvcshb2jQ8N5l+nDdN
         s6Gt70adReO6GjFKyUwvAwy//VC0xjfxGYOqqihhtXQovgqtMDfoZFYT1NXXmmPQpuyj
         huiJcqu9cvpMcuvcRoUoUv91nbiZljybePYQrACnXQ0y1tNpxiABvUjHEBQ11PA9BBJo
         z3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=KgvMEbdhTtgvvv1qwZwFb0OJP2Tb4E0OinKBcfN1thw=;
        b=rZY6VMpIMYedkFoIe6yel+aYC5TJun1FiSNFxIJH9n0jeq0U6PdPY3FoclIy8F1EPo
         1aLxRQUr8uhIFBZpHTH5cZ+lnCg22CYQXdLfmG/HKop0n5GbaGwHu/nHk1JGuwDMC+CU
         1ylJDfNBRlcr8SnSK7K4G+30trVxbcr9HmSSG3vkHMSDu6+zZXwxQ9Q0FVgPaTHoPqw6
         ouqlvXnovNArpwO5Lu6dSvhs6VP1J868pvXPh/h7UqQcrLLmkD3g++Rq5G5KW0AO+ehf
         Urd18Jn9eox5ErOY2ozgX/H2vnHYaXfZ8Mch3kzQPh5xoCZi3rdlmJq7wiObET/awbrn
         9/WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jSqLmJy9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si2310927qvf.175.2019.10.09.09.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jSqLmJy9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIElc-0004AR-Sx
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tj-0001hy-DP
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI19u-0000D1-OI
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:52:59 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:43467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI19u-0000Cs-HA
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:52:58 -0400
Received: by mail-yw1-xc42.google.com with SMTP id q7so223072ywe.10
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KgvMEbdhTtgvvv1qwZwFb0OJP2Tb4E0OinKBcfN1thw=;
 b=jSqLmJy9OxgdDiIwg/ClL6h9j+YsQiFsj4O0Z5eV804cRcsNbJ8cSy3JdlO/Uop6zI
 bN6PPVAq2x8q+AzBPdWpjnHJHnRtNCZrras1rHHe2RVTqYzkcEZ9fuJt1HIHqDTMPcUZ
 +/HPFfg2/ZdhN6WQo6a7v2woMoVq0CO5itRkXzeLt1pB2u/j7NaUeZ4Aj74pxL+JiDSM
 c71cMd2K2KyBhZwTRHGjwswI7jUPwSDjQa5eK/eycWFMmyluC63SJZn2sSkzCf3f7VnA
 rT+xQXV7um4vZNuHvMpApYzd4vtyCl4ZPgQxvvRbUd/RVsvWreFZMFfLXwRlr1NPD+iE
 vy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KgvMEbdhTtgvvv1qwZwFb0OJP2Tb4E0OinKBcfN1thw=;
 b=pHUtRltzUmEeJVdP/2YxIAdsvMctPQWt7EjoKG7D/BGDSpn4v4lwY2hkWrugTX5YHK
 0DcAid3qxpK3hMo0DwwKHm8FNdFWmk2GtdC8qW6TU7V66SCk6GDQzQ+vIMSdz5Aj5L2Y
 1+PNJZckcWXPkHudG5/1n1g7vGJelzHQQaFpA4cKA7nZEkbnPekUlrzP/5oetacOcyRO
 oSgu/W6iNAv7LvSid6waMldp2wvUcsILPbpnRysFJlgapXp/Y+zxx4ePybzCtIKFGn/+
 bU3xKoGzB5b9ifTfX9w5JyV9EGV0lJ8YA3SkiHSFMItqjcQrJl5fIQ6X5TF/YhcCKq96
 BURQ==
X-Gm-Message-State: APjAAAUV2og8o3Zg5Q7Q/JwATwkfQuagiGsSMS4c8RMUCsyBQXudHsJ9
 8ayRAkO4wfgC1n2uVo+uXorFUQ==
X-Received: by 2002:a0d:dd8c:: with SMTP id g134mr977310ywe.303.1570585977926; 
 Tue, 08 Oct 2019 18:52:57 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id u138sm211977ywf.7.2019.10.08.18.52.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:52:57 -0700 (PDT)
Subject: Re: [PATCH v2 09/21] hw/timer/cmsdk-apb-timer.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7a7fe093-917a-5622-9a2a-dcdae3489b3b@linaro.org>
Date: Tue, 8 Oct 2019 21:52:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uFEZ3bDkgdBj

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the cmsdk-apb-timer code away from bottom-half based ptimers
> to the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/cmsdk-apb-timer.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
