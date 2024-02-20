Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1120295ejb;
        Mon, 19 Feb 2024 22:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3w3YjqfRWH4M+zp66QZALKZKGP+WMyfJkB99xWshoLpSgMdgzYzRUXxhg1i6fE6+iGg6lPyBSTXnyvRHkTsZZr2rPZkrB
X-Google-Smtp-Source: AGHT+IEont1TJFzNlx8resk5U8qRFREpuQnqmI9XKRkpXRHaxFNB80UcX5QLtRlvng0ChytJGpWl
X-Received: by 2002:ac8:74d2:0:b0:42d:d332:c06b with SMTP id j18-20020ac874d2000000b0042dd332c06bmr19051264qtr.22.1708411519804;
        Mon, 19 Feb 2024 22:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708411519; cv=none;
        d=google.com; s=arc-20160816;
        b=aH72m3PhGtCDnRWAZ8gnRmpE6tNmijI3qKXnfAvBu2t2W+9VEn/U/d7XyF63s/+Q6y
         w2tpPufn5bWnVN1lsBJQ14KhzNe2cuOU55lFUj5wGK1V0rJvy3gV39eHekye/VNlGBkh
         XfVdgtOSfbqSFo+iCYByR3+ZM0cTKj3DywlnKKGUKK1ntH9t/RzAejYur+gDMdH5SQYc
         swCuURdvqXf7qyXBhb9PK2sSRy5eiQr+mHqvWf7YYHU8M7A1QJrALvgMY0/Ss1m5NZqt
         iXZIsVlBDeuCPoCUJSSox0Vkd0bOf6F10viSeZ6K2wCmT1B7UdvKIC5xjhj145MUi3cg
         Mg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Fs7mG/i3TNHpShQDDrWk6/AhRJni5OTAbAcGPlZtTOU=;
        fh=CBPUY5kBBaxH8LSeKlgXjKfkYQvbFDvks9G38VjRKeg=;
        b=OlFMPn/jUg9oMz4qfaNT6ggCbqYHis9QzKen3EFI/XgB7OvtUV42FWaVTV8qBuOgn9
         M9y/e96InqVfxbMveKjrthLWSv8jp/xQengy39PXeH3o+OwzaUqBK6DsoSBGD24RXSbE
         9pzFm49+3qzbIrSPe4oBNTpJzwZhuqKsyrVT0azRDoqt3qqyC3h1JZ6zYclcRz3YmFSB
         Fcos18YQuS+uqwje5CgNrEuHsAg1hfWKQvY2sStyT093vpzdopuAu5xN6cNqjlGjXUKu
         X4dMXgzuDMd19r8Vy6bDPlVOVPJ0Gs7SUKs4pSHSYyCUbzGEK5F+GkYN/UgX1oUxtYtS
         NZMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gMzfyJ3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020ac86a0d000000b0042dc8c25f57si7650515qtr.23.2024.02.19.22.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 22:45:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gMzfyJ3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcJsO-0000zm-IF; Tue, 20 Feb 2024 01:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rcJsL-0000zH-0u
 for qemu-arm@nongnu.org; Tue, 20 Feb 2024 01:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rcJsI-0004CG-Qb
 for qemu-arm@nongnu.org; Tue, 20 Feb 2024 01:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708411505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fs7mG/i3TNHpShQDDrWk6/AhRJni5OTAbAcGPlZtTOU=;
 b=gMzfyJ3n12OziJZdX92PjrUfewt7Zufyc//6FRH8F2dQSHYvw4AlWqVyxAh4MP2hYt9iQy
 S4tO1l+WSHzrdo1SJZmAV2zSR4ZmiB4YixQJ430fJOgmYLlYpKZYhUGkLjV8mfHsYxIUdV
 rq/IWUalUhlkUFIs/gDnjIK9gy5Qd3o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-zMvnHzutPfOOswq_6vUPbg-1; Tue, 20 Feb 2024 01:45:03 -0500
X-MC-Unique: zMvnHzutPfOOswq_6vUPbg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a3ee69976dfso24827666b.3
 for <qemu-arm@nongnu.org>; Mon, 19 Feb 2024 22:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708411502; x=1709016302;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fs7mG/i3TNHpShQDDrWk6/AhRJni5OTAbAcGPlZtTOU=;
 b=Pi22ZwO2pTYAwQ22a5K+GRgiLmtSR8+ca/qNJaIW0I9EzjUkR8mQQBmzacIStG1R28
 rK0H+cnftAxp8Az+gS7gv3NKQxZPu+wkjL8F5EUnpwOYcji0q7xW04VOuk3n9v/7Z/Uf
 pfFlJvVTP55nXGltQDJ3sTxPVQkmeVha2jQZ2NgG3HHPHN+zVcH8wmyLPRxOCu++iQ+q
 /eNaaWvuR2dua6YCQ5FlpCiW7Fi6Ja9sUqk2c83YonNXg04Q7F4QdrubB9OnEU6R8FTo
 ILXlcmbhfjBUcqHhjPJzGBNS7ML2djs9kEPL+5vMCyC0u0wtRoj4WSpXYctrrzPMdHts
 14NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxeUI6l8OIiDo0d6eeu7DS9JMCwCLs66QS1nw+JeAnH1uInpf/BJo/ci9893ZgmaCzEY5eVHsLQCmna35oTOcrhc5Y
X-Gm-Message-State: AOJu0YwSOOEdZpBAjCGqTebl2vnadUAJz9pMxEasZMqK+wLULZXCq6W9
 qkCiKJ7Kk1WHQKkeQ4Uk+LUdMYvdNnF1kBXuei3wES3nSGqDmJnSUQ5PWbaNU8bP9JHgadjAx3u
 n+JDeiQDez3uKKvltEgAshilIaKrD/FLuzsif/z/Hl5lJTwZCRg==
X-Received: by 2002:a05:6402:649:b0:564:5150:76a2 with SMTP id
 u9-20020a056402064900b00564515076a2mr3820345edx.4.1708411502593; 
 Mon, 19 Feb 2024 22:45:02 -0800 (PST)
X-Received: by 2002:a05:6402:649:b0:564:5150:76a2 with SMTP id
 u9-20020a056402064900b00564515076a2mr3820336edx.4.1708411502276; 
 Mon, 19 Feb 2024 22:45:02 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-100.web.vodafone.de.
 [109.43.178.100]) by smtp.gmail.com with ESMTPSA id
 h10-20020a0564020e0a00b005641bab8db3sm3167109edh.86.2024.02.19.22.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 22:45:01 -0800 (PST)
Message-ID: <e61e02ee-e181-4ea3-b079-638b50889742@redhat.com>
Date: Tue, 20 Feb 2024 07:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/qtest: Add testcase for BCM2835 BSC
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20240219225958.2421873-1-rayhan.faizel@gmail.com>
 <20240219225958.2421873-4-rayhan.faizel@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240219225958.2421873-4-rayhan.faizel@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.072,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YU9L+JNN7wvu

On 19/02/2024 23.59, Rayhan Faizel wrote:
> Simple testcase for validating proper operation of read and write for all
> three BSC controllers.
> 
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   tests/qtest/bcm2835-i2c-test.c | 105 +++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build        |   2 +-
>   2 files changed, 106 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/bcm2835-i2c-test.c
> 
> diff --git a/tests/qtest/bcm2835-i2c-test.c b/tests/qtest/bcm2835-i2c-test.c
> new file mode 100644
> index 0000000000..6ec15b8976
> --- /dev/null
> +++ b/tests/qtest/bcm2835-i2c-test.c
> @@ -0,0 +1,105 @@
> +/*
> + * QTest testcase for Broadcom Serial Controller (BSC)
> + *
> + * Copyright (c) 2024 Rayhan Faizel <rayhan.faizel@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

Could you maybe also add a SPDX license line, so that it is more obvious at 
a quick glance what license this is?

Anyway,
Acked-by: Thomas Huth <thuth@redhat.com>

