Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp1104646lfc;
        Fri, 17 Dec 2021 18:08:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+OOScrNVKdO7uhB0DSCP6rNzWNBhGh3UWjbTFczzCPQjnrkpQsx/16R/YqlU9eLkUfapM
X-Received: by 2002:a25:e746:: with SMTP id e67mr8051016ybh.476.1639793287842;
        Fri, 17 Dec 2021 18:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639793287; cv=none;
        d=google.com; s=arc-20160816;
        b=ueyze3aDGleRdap4Uux2JZyPmRnAlK6YMzQd7tlDX/sUSsFFbHh4iqLSS6DyAaGfBt
         nQqajLzViRAQsRJ2wbISPgeU2POjH2JJfQ/K4tdwp0UziS7dffiaCXQVEMGWx9oLMrfb
         QfNqBkEs+HhXDR6PP6LYCA46qivZye/cKVALyHGhLxUuhVzK8Gw7mKofB9xvr0q66wM1
         tE0/j/K50YdcTBQYLlAmX24sn6rHnd5UDUfj0UOydJ/wd80MXfSZkrYjl4Lb6VkoSD9z
         JVmJL+BNsBZoaBQUykshaGp6N8HaDS5u3VEsXo3r4Ud85wMMjnqNlOP6L/TeV4JIgpBn
         wzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gZQj35JrnBLu2nfN6mp1WdU+TyPCDpgpwwepktWrsWI=;
        b=sMUIWW+Mzh+Ik87ei8x219kzfgwAogydtMep/7xBAm/jY5NgpevVylSyvAoDlfXG5w
         AVu8ScqY3XLCX+ImNmDVedtCnGJKrqUYQFHXcQKWJE+lN5Ywq7vPk9wJ6jssJFQnpQyg
         mst2AozT9L0+oh5FprRaHRSE8Z5eZ4ZCxTGL2U1XzE/4jZX9mxBMCUegHjQB4qR6dkmw
         4ffKddubeo941ezCiPEEQAvxEHdbFQ6YPU6ccWQtT615FzRWvJ4YriU8mQknhgkF87oF
         86c4xAcsFaRSPs1XUT7Bq7A4y7MMoKNe0cHxIj+xiPqQTIaP1vuhUw8k45cHZ4hH1G2D
         9ceQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FaT69HZr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si12892610ybi.812.2021.12.17.18.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 18:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FaT69HZr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myP8p-0000KJ-8o
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 21:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP8h-0000JP-8n
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 21:07:59 -0500
Received: from [2607:f8b0:4864:20::432] (port=35397
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP8e-0006i2-TY
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 21:07:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id v11so498974pfu.2
 for <qemu-arm@nongnu.org>; Fri, 17 Dec 2021 18:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZQj35JrnBLu2nfN6mp1WdU+TyPCDpgpwwepktWrsWI=;
 b=FaT69HZrh714Hx85vcqYPq/PEzfg5GL9rWtOuUytNm5r9H9sbL+/9ZNjZCeHL2Bmdp
 jU6q9q9JdJVVAYxe+pWBLUUvzjK2N5PQDHMFfXpyNScnR1CUkIFJrmBwgBq5KO8U1zgq
 /sN0SMsnQCujijC9WFOJbAL23K/QnvCYqRDO+y5dVjdfyMUf4MViRxpaxdDobVjeMujh
 CaOnvoRt9MPt3CosQL+UYIuXo391XC/C9rtvoDoys7r4YPRQdSGbn5mKs9V5qPl0Z5LV
 92AEfUsMO3vMkjBIUPdQTIRNXehjhPQec02zv8ozcWFSJq2c4b039BiWRe8vwrvJyp9C
 hwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZQj35JrnBLu2nfN6mp1WdU+TyPCDpgpwwepktWrsWI=;
 b=KkfS3GxQUcDG2l0FsgGYaoBlb2NKsQAXoquQYxBtkx4hokBCkEGw2LE+9Y1u8+5CIj
 YzTWRf2jKe1JN2cRzHsxlcC/bl0L0iL+4DwVUd5PpbQ4YLE9W3IVgSAxl+TVS/AozmQh
 a+9Gqxh76kxK1fCuyTEk3UEypHNiWhOkR76Fc5c3iunv7IXiXdCMFXf7lj9iyduqwdE9
 WkHy4h6Y3VMMiLNeNyomb1T8KKP9+VtYYcItVgGdGRkKf18Z9MqnY6q7TIHpI1M0MqMH
 rS0ystG8+uDhqKz/8l6+vQvnk9jaDASoBrgkAeZH79BjoaXvnD/sr8hoHnqZqOJXnZci
 fIxQ==
X-Gm-Message-State: AOAM531I2qbTC5AdHpsyh3nvxOkHng+NZ9Iw20JtVeSryPsB5xma9e1i
 ZLJT/dcE0VXKSoS7zflVzDnNyQ==
X-Received: by 2002:a63:4720:: with SMTP id u32mr5383831pga.539.1639793275699; 
 Fri, 17 Dec 2021 18:07:55 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d15sm10957584pfl.126.2021.12.17.18.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 18:07:55 -0800 (PST)
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
 <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
 <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65d60871-31dc-1e59-3cb4-34a27e7af339@linaro.org>
Date: Fri, 17 Dec 2021 18:07:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDfsua5NLpK2

On 12/17/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>>>   #define MEMTX_OK 0
>>>   #define MEMTX_ERROR             (1U << 0) /* device returned an error */
>>>   #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
>>> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
>>
>> This is kind of odd naming, because MEMTX_DECODE_ERROR already means
>> "bus/interconnect returned an error" and it generally translates
>> into what at the OS level gets called a "bus error"...
> 
> MEMTX_DECODE_ERROR is "nothing at that address". We want a name
> for "there is something, but you don't have access to it".
> Maybe MEMTX_ILLEGAL_ERROR?

ILLEGAL doesn't convey much.  MEMTX_ACCESS_ERROR?

r~
