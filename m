Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3117091lfc;
        Mon, 26 Jul 2021 11:34:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5glEqKvOoGwvVXwQqA13D8pqSte0lcH327tL7jw5eRY3dEiU8sLLWdViTdugVEaZ2YsXh
X-Received: by 2002:a05:6638:22f:: with SMTP id f15mr17507561jaq.141.1627324468466;
        Mon, 26 Jul 2021 11:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627324468; cv=none;
        d=google.com; s=arc-20160816;
        b=hemz0RPMjtQmaL7Ot0jq9xWRhkEj5Go/LxzhJtWH9OB0KifjkLYDjqXx818w2dUJMi
         wWAlLP+8sz/Vb+OAOaPumZ5Zcdiv9mbbIgtpEEZXAUo+dG620IgMU7LlZD8T/JrVqrfI
         F46DCmL+QlxRqYzzevkBFbZvy62jHAi5eKQpnuDQsNuRoRhwkCfK6gUP47ql6T20qwCi
         WE7U7UUOST+dLO7rRCEXUjzXl5/Mdajhuv7fRYllj2cOLijqbJLO+T05PenNjSDj4TSr
         9uBeBSEBO4YrPaI0wBLA8qhm9Ycl6OwLheqy1nsUqD1tpixr4cjAbXtjrAHGwT23E3eQ
         urFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Cdar4dZ2M5OOVhe0Tv3LgED8iGdbueIMHQpXppNyFwI=;
        b=lYlG/fdsYY9x869xQ49GNS5pUZGKpoVNEqbdHj1W6glCCBBPUJrRnZb7OXelAaz6iE
         nnbJfyH2/+gKXOARBEYfjbWD1kTTBVTfVUHevC0aHXLNrgE5gKrtwGZLGVgzuRRwufUF
         HZEzQmGGAAuYOJu7G/tvTpaTd2GvKBn1tXohpbZyI2Y0vHZ+HksFGzhrtJwUgw5VBIbG
         TzOq7ioD8Oj3FOI5TTpdMGvy3UCmnigJUkQtdG1eW9Oy35wYtZJofhvms4nj9xVOEZjf
         M6sPVVuYnEUgMH501rIQEfoQigS0B0KKKs7LHACa7d24kXlIiaNQwg3OOKMz2fEoNz3b
         fumw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SJ/+uXxs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si587452ilv.30.2021.07.26.11.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 11:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SJ/+uXxs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m85Qp-000116-Q5
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 14:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m85QM-0000eG-Lv
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 14:33:58 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m85QL-0002Jb-3u
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 14:33:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso1313051pjs.2
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cdar4dZ2M5OOVhe0Tv3LgED8iGdbueIMHQpXppNyFwI=;
 b=SJ/+uXxsPNJ0xDiUBfZ/oj4Al7b0p8tqwBewS7Jw5DNZjdfc2g85REwX5AX/R77LhW
 3nyLA+DsXHvDWl2+Sg1BmFc/Nz7Pn7EukGxmbxGgBVJChMvfif2DL99g3NoW5Iy6AmSG
 /PzZt2FAhTpXo/OAnG1kD6Qx/bjJRcErwlMZ6Pli846nUEVCxytnrzc5bPjUSmFxbUSM
 ypwy0Zm7Sy/tMcMtEgeKia1GL/psVAfwMJQedcA69kkbkcPqm0n3e1BIqzwVcW1Ma2BQ
 ElbRHBxtTDJzS2Y4s0pae+4m8P8hGyNPuUnFC4fz8Cv7u2OB6tsrXxLYaZFC/6A9XNN+
 G+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cdar4dZ2M5OOVhe0Tv3LgED8iGdbueIMHQpXppNyFwI=;
 b=OqnkosIawWa/YyTONzc6sP2YBiJhLOMpBwe3cl8b4oRe6KzD/vc1gvnJ65/88gyhbw
 aUuXMgssdWXAi1M4dTJeQpSqFTXytrX5BBQjskY2Ua45Kr/4Wlnm3a5pYyhKRykxcmQo
 9EMPLhc1lnbu2xCAXdHfs7/EjppvmPCrcBFogEYfIjSb1B7b//Gtnsprxnzr6poF+JVW
 DEfcI8PNnWXVV3vBEMWc5R2o8AHRsArhMvRwENvBVS4IAO6pUwQwV6mr1oeaYgAfWqlA
 9tdB5HPPOC1OMwAVDbeXh4q7KBLvCaV8xlaEEziSdDRA6VM2SK3y6d6y40ZuUZ5LHe8E
 YU9Q==
X-Gm-Message-State: AOAM533gOWfueFB+YSSiyVR9UDZAvQidA3+8MB/kuVkof6YJStaRu6t4
 QAQzu/BpaQFcHXXh6H5LqCHm8qgxrLMhhQ==
X-Received: by 2002:a17:90b:514:: with SMTP id
 r20mr6103284pjz.80.1627324435559; 
 Mon, 26 Jul 2021 11:33:55 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id j13sm468980pgp.29.2021.07.26.11.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 11:33:55 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
To: Andrew Jones <drjones@redhat.com>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
 <20210726145951.g3ywwhcfstmsi7vi@gator>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
Date: Mon, 26 Jul 2021 08:33:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726145951.g3ywwhcfstmsi7vi@gator>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cEVav6s+q8Dx

On 7/26/21 4:59 AM, Andrew Jones wrote:
>> +SVE User-mode Default Vector Length Property
>> +--------------------------------------------
>> +
>> +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
>> +defined to mirror the Linux kernel parameter file
>> +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
>> +is in units of bytes and must be between 16 and 8192.
> 
> Hmm. If a user inputs anything greater than 256, then won't it get
> silently reduced to 256?

Yes.

>> +If not specified, the default vector length is 64.
>> +
>> +If the default length is larger than the maximum vector length enabled
>> +with `sve<N>` properties, the actual vector length will be reduced.
> 
> Here it's pointed out that the default may be reduced, but it implies that
> that only happens if an sve<N> property is also given. Won't users wonder
> why they're only getting vectors that are 256 bytes large even when they
> ask for more?

I guess adding that 256 is the maximum length supported by qemu should be sufficient?


r~
