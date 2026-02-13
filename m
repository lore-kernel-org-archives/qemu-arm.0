Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061B6EF99C8
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 18:42:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqy73-000512-AY; Fri, 13 Feb 2026 13:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vqy71-00050c-Uv
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 13:41:55 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vqy70-00038D-G1
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 13:41:55 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2aaf43014d0so8462525ad.2
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 10:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771008113; x=1771612913; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lA+9PSxdVr4wcWbcMzPXq1v+E13/a+Amk52oXDVGTAo=;
 b=t9Xw8TfUb6VcH6dZ+xtJMxXbvfXReF+DRsz9FUV1AILIeeYQOBn3YuHmk+asByijiW
 rJAvk+mRKKOpaYytrML9VqVO4H5yKZgjWx/csy8mr/NxRh1KqaFFseeQvNlTFxLgMlbe
 HoQSMH9RUIY6ExPBmSOk7yiUwibsG023HMarIcR6Ts26PNV/8IlZI/ygtfTdZS4yl1lK
 GABL8KreAuDEHmWSGzdTkosYAuOCy2PLUv8a4F0LJqnrmMMj2ZFwHnPpeLqGj5a51ENt
 uD5fTBgPLLI59gS1dW6zYfTB+kXtSe5s0RSlglyNbXkRWNa7V7ltLqGQlxIrVC7jWnGm
 gLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771008113; x=1771612913;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lA+9PSxdVr4wcWbcMzPXq1v+E13/a+Amk52oXDVGTAo=;
 b=KBBQkUqkJDfTd5yCgi1rppoEImWjTBjv+oxDfXvzQ6jCMWAbtF/PSfvWos8699Fllp
 qG11+WxelYB1r/cpTU9UOcaxu849QUGySDBPj4zRawaXSN3XvVcjLLUNf41LqkUEIRo7
 MzpwjAO6psDDhqjPtWnHO/lKF4Rt3UWHpHM0pQhUQqAoRDZLJQZgDmuJODjzN/3cCMOm
 lN1siZxm0S+NJJHrsLybMkjINvjcFltGBx1M6nG1nxx3QDeahf4LzKvXnGAtvceIbVad
 UZ1SrsDsMMO1fP2XiWkfymIVORWhviOJE9/x3TSSyt5ow1GJ3wPbfmXu3VwX7z/EMEqS
 prZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ8xojmjyUzpTYZ5ceVhWSAISvezU+oavbl6sHI9/lBpdz1zoLLTgaLH/dIN82Hnch84eS9W7FVw==@nongnu.org
X-Gm-Message-State: AOJu0YxQ81zWMsRNnstq04Y+E6ndPAZHLskaXC4vT39nf3jR8fCIBT0y
 QvbRHDmabpCLVy87+KS39cxtKjqnjSQed1ePz2J3M/50sP8Y4qkquKGFylQ0Ho24RNA=
X-Gm-Gg: AZuq6aJ6SqZb01JDwSFgCjYdgWqJ6VzblZX4y3TcCn+e+KHIF8K2MRu+jmI6trWgBgb
 YgOOhb6iUKy8tLE59h3CTocMb2NMRPyMMDEnM9RxGvUdwA8NhmK3MjwnU5t803E4GC9hGqDNME+
 vi1yJFnzGlHMIh1urmiN1ljIYRjwwvvCxejghJ2KBP4g4SVXdI82HBXn4VsYcBTtMlelF8AJ38Z
 Y9I2DewsozUojrmELmA6gdVLcgBYnegddYqffbp6GcpvXXQPXs76etaSbmD0PpaLwJf0I4IRLFz
 9YHkp4qNHF4NPcNZCmlXHlACAFlE1prHjHY7+oBpk59aMqKxfsg+c1QGMt6G0/1n/2P+kkVpCrL
 WypUqiTr8f0IN8GbpVlsojSVX5JJSNUiuZevQ3HT2tspWuUACjrUX/+KFh6b1gkwf7cQkPAmJ5f
 yVqiGSDm1AJ9+n5RtDNSsSWeN/jqe0e6xLp1muBjU/qu0F9isBQ2DW7BX1qqKfWeekAsit
X-Received: by 2002:a17:903:380b:b0:2aa:e6c8:2c70 with SMTP id
 d9443c01a7336-2ab4d0b78e8mr33479865ad.60.1771008112716; 
 Fri, 13 Feb 2026 10:41:52 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2984ab0esm89105135ad.9.2026.02.13.10.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 10:41:52 -0800 (PST)
Message-ID: <b600ff91-3b67-43ad-84f8-c0d1192363fa@linaro.org>
Date: Fri, 13 Feb 2026 10:41:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tests: bump libvirt-ci to latest state
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
 <20260213154859.1551283-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260213154859.1551283-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/13/26 7:48 AM, Alex Bennée wrote:
> This entails updating alpine and fedora images to more recent versions
> as well as the missing macos-14.vars update missed from last time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker        |   4 +-
>   tests/docker/dockerfiles/centos9.docker       | 240 ++++++++--------
>   .../dockerfiles/fedora-rust-nightly.docker    | 262 +++++++++---------
>   .../dockerfiles/fedora-win64-cross.docker     | 162 +++++------
>   tests/docker/dockerfiles/fedora.docker        | 262 +++++++++---------
>   tests/lcitool/libvirt-ci                      |   2 +-
>   tests/lcitool/refresh                         |   8 +-
>   7 files changed, 470 insertions(+), 470 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

