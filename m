Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp375562njj;
        Tue, 29 Oct 2024 09:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0hzxzmZOWgM2WycLa0spARXIJcEOo/82bntldkfCwJHCRR8unmLBTTPqjSLAQV47ARNVg7WdSfJoZkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEwXGc9y/DUrDIVIEEnohs2Znb5sFi3KnPSi3BJ5K9VbCCXAxs+j8HovfvZxbzHIUa3Fn05
X-Received: by 2002:a05:6358:2829:b0:1c2:fcd0:d20a with SMTP id e5c5f4694b2df-1c3f9f80695mr495531955d.25.1730219512935;
        Tue, 29 Oct 2024 09:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730219512; cv=none;
        d=google.com; s=arc-20240605;
        b=VjfHIvBjPU814bs8lN/Z1fWnhQI/NBseSneknxQZvPaKneHjQ1dvL7IruD8zIMUOpD
         m6Og3F3Bx+sEH8Nz3YScx0fhxp0Ip6fBV3jX6yA2dOtgFyRiQdcu+TBKkYaDUC1Hesdj
         XL7L0yfhnVizeBrJolJXCRkMS5YEWtJmUi9aO96iO+tsTBc+G4awtMgvY0CLN8lHd8Ji
         z7fGo3bamXPw55wJrPl3xKbLFnifC0k+SBQkeEHhQOC0qIq/varS7THWOwo3AeyaSTt8
         XgpjibwyzfG6mY8Rmr4VQP4fB88XozwWrxim0hZo+1ToHzHKnBjfphZmyOL1u8kDQfQo
         jt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GluvrkFpzjprinBJrorJ6GPoWP4Kppr9WPEXb916Ol8=;
        fh=CVjI828JK1ERWJmDL5l77/zkfrTk9Jgzfxjk1QD2qUg=;
        b=WWNqBt7Jg/dFS3FTJ8GT8AtoD7ZYf08ZDw9QDG0wP4CzTByI5scjp4I1pOUGNwyG+y
         LkAoQK7hPKswP+MT/PIdICfF5Wk2qs/n65d3jWkc8fTDajOC/eh3M1JlJYOiIGDcWYgr
         ZuyTWcYiXmP7W3KcOdhGubqjcbAchNAzx44/1vdG8gMfZUM6AQarQdimI6wyue8U6YcU
         TZI6H8/TOFMlfYkAYLYlp5fhOMQE+yxGZYeEXSZHwmmUDYbRdobglbAMt4/LBdl/P/q1
         uVdw7yayUmTu+K63HakRxpfojlD+8fn+J11Rw8xkv/mOvteyKZA9TTZJoaVt8OKvqIdG
         GHZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxhMNeJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4613238e14esi109684271cf.488.2024.10.29.09.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 09:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxhMNeJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5p82-00011w-GU; Tue, 29 Oct 2024 12:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t5p7q-0000zt-GE
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 12:31:22 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t5p7m-0000pf-PQ
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 12:31:21 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-71e5a62031aso4158093b3a.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730219476; x=1730824276; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GluvrkFpzjprinBJrorJ6GPoWP4Kppr9WPEXb916Ol8=;
 b=AxhMNeJMfLItRp6z0s+7leViic04Oz3nynfDuC2raNGgC1z8iIZ00B3nuB7w2hBv6U
 W4EMju7WGIWtSuHFqYmx0Ye6Cl9l26xyf770aWdHezevvQ8LhPXpOGIi/Cidv9v3CgqU
 k+VslFg4QmxFqYv58GztbY3Yz4ZtVlnfFxDq9Ob0jyWRmksP6IDk88F6QwDS6a0Fd3aM
 ddD8GtuIu8EMAbpogQJ6NL3Cc5XVSKDDKO+ubItlusy7pIUr4LY5hIh/XgSqJPE5jkRl
 uwyw7jYG082vU+6sr4UcndRPZkrHKJd5Fl2OGjAppBvhAxHkKGX57znhZFGxHX4XbmHT
 lHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730219476; x=1730824276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GluvrkFpzjprinBJrorJ6GPoWP4Kppr9WPEXb916Ol8=;
 b=T8V4GGtZZB2hm57DIuJgX0BkEtsytj7LCHc+v+fM6Xlg1GI51NRKI3S/Dm6ytXPron
 RIBv8uxVdCAxbE/9RH6bkLl1TRu3qzGlIF7R3UNZKFjIjmQSnngWOqpH2xNst9t7nljp
 5Gxz9qvOhRg+mG++3ziJea/A/s0Af9b6eNbCT52F7mPzeHEGTeSz6JBTsCSgUyFIRfmW
 eSbr3Rt+afm7BdhYkUD34kDJHxGTs2i9lESkm5u48O2pVAx2qRaHYgwDH+XoB4pkDdEh
 TiCh+P4NQOHmZszWwj2c0aD+6WjHolEyRHi6iijMDHt7tggbjq2OMxs5kIz+I4EUh0/1
 X6hw==
X-Gm-Message-State: AOJu0YwLNWmH9LcRMMJqt+sjvT1t80U/mqb8sULWNGyTeBaDxDgdA+y4
 kGnnt1ErGJ8xSbP8aiwNWVmlMKe2Vw3Wv1CGt7TugSxaN4qg7htfhx6XJyDeblg=
X-Received: by 2002:a05:6a20:439f:b0:1d9:a72:87e9 with SMTP id
 adf61e73a8af0-1d9a83a3dc9mr19430899637.10.1730219476344; 
 Tue, 29 Oct 2024 09:31:16 -0700 (PDT)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a3c2c9sm7710532b3a.196.2024.10.29.09.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:31:15 -0700 (PDT)
Message-ID: <c5ff463d-c5fb-4d00-95fc-f3c3ce9178d5@linaro.org>
Date: Tue, 29 Oct 2024 09:31:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Convert the BananaPi and OrangePi Avacodo tests
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Joel Stanley <joel@jms.id.au>
References: <20241029092440.25021-1-thuth@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241029092440.25021-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6+vk+RPhzWog

Hi Thomas,

On 10/29/24 02:24, Thomas Huth wrote:
> Some of the URLs in the Avocado tests stopped working since the
> original assets have been removed from the servers or moved location,
> see:
> 
>   https://lore.kernel.org/qemu-devel/CACPK8Xc=jsz5iT_WR7s-rcu1cRzryiK+-0o=6vUK_D_qMMrP3A@mail.gmail.com/
> 
> Since we are currently in progress of converting the Avocado tests
> to the new functional framework, this is a good opportunity to convert
> these tests and adjust the URLs (and hashsums) along the way to make
> these tests work again.
> 
> Thomas Huth (2):
>    tests/functional: Convert BananaPi tests to the functional framework
>    tests/functional: Convert the OrangePi tests to the functional
>      framework
> 
>   MAINTAINERS                           |   1 +
>   tests/avocado/boot_linux_console.py   | 411 --------------------------
>   tests/functional/meson.build          |   4 +
>   tests/functional/qemu_test/utils.py   |  21 ++
>   tests/functional/test_arm_bpim2u.py   | 206 +++++++++++++
>   tests/functional/test_arm_orangepi.py | 270 +++++++++++++++++
>   6 files changed, 502 insertions(+), 411 deletions(-)
>   create mode 100755 tests/functional/test_arm_bpim2u.py
>   create mode 100755 tests/functional/test_arm_orangepi.py
> 

I have a general question regarding tests in QEMU.
Is the current goal to convert all avocado tests to functional ones, and 
then remove avocado from codebase?

Thanks,
Pierrick
