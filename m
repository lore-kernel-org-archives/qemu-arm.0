Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3682782lfm;
        Mon, 20 Apr 2020 03:44:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypLFjr+pmnPuHuaV2Cj5DXTxdvcZaV2YqqniFxivp2qeLkLJsadSaEN4Bk0deNp0JcyDB96o
X-Received: by 2002:a25:9b82:: with SMTP id v2mr805183ybo.206.1587379450199;
        Mon, 20 Apr 2020 03:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587379450; cv=none;
        d=google.com; s=arc-20160816;
        b=XhI/KCAP/K0FWRyPNKc3Wm7M5WYSQiaaSsDd0ixPADJuz+H4jygWFtN5Y+tGO3i0We
         wp7sS1iS7GQ6KxtfzxFCpqidcBbedBVvvGmuunZXVfDzz7JNyOO/s9P4ZZ9HZKBmk4Ai
         xvHkUbGinKeTFJqPlwIM67Q0mHRP6lyd46nxCuUapDFc4V9it2cwtXIWfPPmaR2Rn+PG
         Slp6omir7FG+Opq1Qjz7DAdo08pXh+abM03tyf1CEtZuD8BywjyzyNZ6vYTINYwWMpVo
         0swH6xyl0a8GpvSnxEjMVAAcL/Xywq0ZpxBgn1MXlp0XCVcoUm0oA4qSOg+BIIKr73v9
         reFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Bc6eIxxy3ZCmKxtQ46FNChc6DV2SqQpWx9zlOiSS+j0=;
        b=YjxqI7F/0D9Wc5yVdfnA+AKVTmN1WRgXuPkbQunAtb9EWaQcVzIkpSoAMww0mBkSSH
         /h1RPnM65CeYjJWrC3kxHN85bLsi0GqQG+ewZ9y0y/oPVmYiFJtx4udIBc7Y+OTMg05/
         doGflUlL7T3G2W2lxpZwH7cgNaU/5G8F4fsst0FimH2mEsBpkoYx/Orjwh1EW7f/P2yE
         mouH1QoB1j0lP4R1wSS7An14+ItV93O5FLZd8eoeFkBLAUcA+UMJ4gB3zPUjfMRVCLEs
         3F8q9cCURuB5Qxa975x0pOpZJLQ1aNBL3FFCF9KJNzOoqQ83ysoNKINLG3jiC8btOCdk
         5zOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OELxCaZ/";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id n6si559889ybc.0.2020.04.20.03.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 03:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OELxCaZ/";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587379449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bc6eIxxy3ZCmKxtQ46FNChc6DV2SqQpWx9zlOiSS+j0=;
	b=OELxCaZ/yP2MTucIbcCvTeTirwBkt1GZLM4wADZtMmu4NQ0XE+9nxtZ1+8cnM9N2CuQWIC
	jSWf396UCvSFOAYul7twh9JdCGOY7Gd1YfKgXNkCwYfx4NCPeLfhI/VfpLNIxy9jeTaY09
	xgyCH7WzeRDbyJUQ/QzOqV7LEuqeWVw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-pJwIpWfLNVegpoIDOoZOcg-1; Mon, 20 Apr 2020 06:44:06 -0400
X-MC-Unique: pJwIpWfLNVegpoIDOoZOcg-1
Received: by mail-ed1-f70.google.com with SMTP id w4so205066edv.13
        for <alex.bennee@linaro.org>; Mon, 20 Apr 2020 03:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T/xjJsUgF778LpNzZZV/h2y2cV6lCn7Ce6da2WhB8fs=;
        b=iYuDE9qefHFctVM8IR6FcA6VkQzhPFv31wVCIgOa4YOu7ShU2djQQl9RbF/itJbUdn
         RxKfdJlWIEl14/coL6ANMhI9iFQn2P0bZ7kw+qozRpP4GfWZ8V0KKzj3zmlMoKb8Vvlw
         cCYcIqHaK0oQpSEI8bofMsm9vhgYpjP1/NMDv+Uu8PSbYlV/EsVDhKLWlZUsEjpai3Ej
         dpvw8Pb+xsbyZgQMLZdSPXGGMsowmF23PgF0d2y51aVu+YlSc4dEzqgctn8AQG3BZAKg
         /D+F8GOVcK2OcnNU+WX/bUfSA6NIqfmqUdeeTEFGGh5N1uYoDakxUx7ZRv7cZ5MypIPE
         /uKg==
X-Gm-Message-State: AGi0PuZ7XFwFYh+YYHFBPzKQOAY47l68tn1k6nHFg8TD0nzYEm/XH++y
	Z2Bka0rJh6SnGx+rCneTvgOv8wu/dy/xJmBt+ZMHq5AwAHKPL15/5FVGu93oBBVeCXm89JBxqt0
	4oM1iaffGcYKUfjyA
X-Received: by 2002:a17:906:298f:: with SMTP id x15mr15459771eje.380.1587379444246;
        Mon, 20 Apr 2020 03:44:04 -0700 (PDT)
X-Received: by 2002:a17:906:298f:: with SMTP id x15mr15459754eje.380.1587379444049;
        Mon, 20 Apr 2020 03:44:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id mj1sm107969ejb.6.2020.04.20.03.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 03:44:03 -0700 (PDT)
Subject: Re: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as
 kvm_set_feature()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-2-philmd@redhat.com>
 <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org>
 <3dc0e645-05a5-938c-4277-38014e4a68a3@redhat.com>
 <f4ee109e-b6fc-8e1b-7110-41e045e58c30@redhat.com>
 <CAFEAcA8z5t__ZQQSqx88nMcC26SHowa3AjtDaQQFaPn-p-FYYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7f49bc68-8c40-42b9-7810-fc1f9f6ff904@redhat.com>
Date: Mon, 20 Apr 2020 12:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8z5t__ZQQSqx88nMcC26SHowa3AjtDaQQFaPn-p-FYYQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 1gPcp6XlGpXy

On 4/19/20 9:58 PM, Peter Maydell wrote:
> On Sun, 19 Apr 2020 at 17:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> On 3/17/20 10:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 3/16/20 9:16 PM, Richard Henderson wrote:
>>>> On 3/16/20 9:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> +++ b/target/arm/kvm32.c
>>>>> @@ -22,7 +22,7 @@
>>>>>    #include "internals.h"
>>>>>    #include "qemu/log.h"
>>>>> -static inline void set_feature(uint64_t *features, int feature)
>>>>> +static inline void kvm_set_feature(uint64_t *features, int feature)
>>>>
>>>> Why, what's wrong with the existing name?
>>
>> Peter suggested the rename here:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg641931.html
>=20
> In that message I suggest that if you move the set_feature()
> function to cpu.h (which is included in lots of places) then
> that is too generic a name to use for it. The function of
> the same name here in kvm32.c is fine, because it's
> 'static inline' and only visible in this file, so the bar
> for naming is lower. (In fact, it's a demonstration of why
> you don't want a generic name like 'set_feature' in a widely
> included header file.)

And your suggestion is indeed obviously correct...

Apparently after 19 months rebasing this work I'm not seeing clearly.

Thanks again!
