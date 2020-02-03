Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3654623lfp;
        Mon, 3 Feb 2020 00:13:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVfsyfiD4BR5bOFlmVKbBth6RQ9Yp7J2hZJrck622xpiUNBRVICO8IkGfC2rFzkLHekIAL
X-Received: by 2002:a05:620a:ced:: with SMTP id c13mr9696140qkj.47.1580717634536;
        Mon, 03 Feb 2020 00:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580717634; cv=none;
        d=google.com; s=arc-20160816;
        b=zkl8E+hagK5KkvdPKwF6Jmuc0IuNgDeHBFM+M6XocgCIDgaDelclVpYe34q0c1KqJY
         MOORfNs4Z8U6ls7GfMTDTssitl4C5jqrw21UHd5neYtGCBsaGUyDkUZuMeS67jdnsgSl
         oTO9rOuREk4Fem3uNZSyhR9Y6gjdnUaNfhD5SRhOcGQgFzTqsJuWeEHbOSrWtdWM2zce
         F+lFrFUr0FtaLoD+06ZrcSuSW4EVBJHMA6zy1aFEpD+ubQfRg8cC50wk+O7nitZsTnQO
         qbDLoXt1vwVsJ1wvRUAcNYYrJ8UqxEjrobry2D9VQzG7boRiAZjSYHpc0DwRtBko88Vx
         2Kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=Rk2UJCvNkhr0AT/FyLhYTLcsiFC4LYRTZO/jPYotSOE=;
        b=0ysZkQMAWmxe71j44+two2edoQaYfxdyITgehQkmDXHeUwBf18Al2FGqfR41OMltdO
         pnyphWRKR9Jm0/B7PwWLM4+OBDXUDK6Pm72AGk4pfdXX3iazi4pxb5Uo/EYt0iNk5ZO5
         XWGzs7E0I7tfHWysBVKBiOiM37QFJXJsDgS57qaXQacSKQIkGeWlxxB1yD3kyWlqcwQu
         1HUYslobcBKqHd/5DyMEa5COS6tbxuLEqdrCLS6rzZzkHJPBpMhtOAlUT0r9fg3P3/92
         NM3MWYXcakJi2py0hOM3aYMoEudAEeyGf8FAokfmxIB5BVljGsBV6iBRu+WyAHEtFmRR
         31iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si11917153qtv.83.2020.02.03.00.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 00:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyWrh-00058J-W4
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 03:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iyWrZ-000589-GA
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 03:13:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iyWrY-0000aV-Fi
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 03:13:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2748 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iyWrY-0000U5-4T; Mon, 03 Feb 2020 03:13:44 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 10AE775A812F8BB7ECFE;
 Mon,  3 Feb 2020 16:13:38 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Feb 2020
 16:13:29 +0800
Subject: Re: [PATCH] pl031: add finalize function to avoid memleaks
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>
References: <20200203074718.37252-1-pannengyuan@huawei.com>
 <c4fdea63-0d7e-1f0a-b0f9-68bce365dc5e@linaro.org>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <3ca049ac-a74a-2b73-8236-164cbc2739f5@huawei.com>
Date: Mon, 3 Feb 2020 16:13:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c4fdea63-0d7e-1f0a-b0f9-68bce365dc5e@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
X-TUID: TyDXmjtGIDcO



On 2/3/2020 3:59 PM, Richard Henderson wrote:
> On 2/3/20 7:47 AM, pannengyuan@huawei.com wrote:
>> +static void pl031_finalize(Object *obj)
>> +{
>> +    PL031State *s = PL031(obj);
>> +    if (s->timer) {
> 
> As far as I can see, s->timer can never be null.

Yes, it's no instances, just seems safer.

Thanks.
> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 
