Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp465281lfb;
        Fri, 8 May 2020 13:16:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKTOfmIKC7j7Ejg3bxO4PMxMPI9/c84worCW1LNtMPzY2lI4SEBL0+gKxSn6RQLUTvNxupj
X-Received: by 2002:a0c:df03:: with SMTP id g3mr4596974qvl.240.1588968980821;
        Fri, 08 May 2020 13:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588968980; cv=none;
        d=google.com; s=arc-20160816;
        b=ZxldtGl0YRsbkq4pxiCs/+kn+MM1M+FHAd62QMJpk83HVDkVOb3YCqFIOxoq4qzOfr
         AJSnEUWnLbrc0GWZPucQ6pjNOn7Jvsa3Z2NuBdG50Mxt9jpqZk0fcT7gaFH6tuX5NXqn
         8RwM31zSaSfSRiYAbCH2OUV9YzjO2zjevjyctugPzjomOT2c8hgdrfCaHuu453h9+ZhR
         4KTKOY0PfYtUZ3CKPP4HlzoavX/5g+IS5N75g8Q+kRRtO0wBhfwiihTqour7ISnxcjhh
         UVOl9L9kHKTynB04FHpVi05pW0lTdsh1eYKwhB56mIDPKY7meDcRz/fzSbjIw0l5iOC5
         CEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bIGHQvRQq5Gcv5I5cSvS3nAGK5+TSbCAkAa1j8XYBxI=;
        b=p9fZLl7doqGlFZkC+lO4C0O+MYretzNxDLekXmw/8SlEpelKhR1xfBP7dBTWoCouey
         y72GA8SNB9IFB4bMwHp2q/TDQR4DTJ4YsLej37Jp1iRzUfps1bhSP7fIgQml+WdkiCd+
         zCra85klsQ8UM8iGnOhmNs8xsgamljWYkz1u+R1kErPOWF0xErN8EKBWv6H0PNBOdKPx
         WZrWL2Pv+3yLsElYIGjR3Q7IlgXKES20YzyAtWCu0RiYLfWNoKqB7bLUgGq+dzfumaC/
         DzuocsO7JKzihdak/c20MbIcIDVrbnhdDPyoykkvpa8PBn19cETmNdmkZpkE9LpG02yo
         ev0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wvg8mDQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si485823qvl.183.2020.05.08.13.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 13:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wvg8mDQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX9Pw-0001tq-7G
	for alex.bennee@linaro.org; Fri, 08 May 2020 16:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX9Pj-0001t9-UT
 for qemu-arm@nongnu.org; Fri, 08 May 2020 16:16:08 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX9Ph-0001mJ-De
 for qemu-arm@nongnu.org; Fri, 08 May 2020 16:16:07 -0400
Received: by mail-pf1-x442.google.com with SMTP id 18so1509125pfv.8
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bIGHQvRQq5Gcv5I5cSvS3nAGK5+TSbCAkAa1j8XYBxI=;
 b=wvg8mDQr5bzooh6M09TPXQrc93AXvGSxc9D9Nu0MD/jZYpFMrIqXisXDU5H3IGOqjc
 J7a1ZXUfMEHpuVZb49KHOiOAE6SZPn2w31KMk02CG2f17l6ty1mqQUYx0MwIEFNC4625
 SDbxp7U38dlLtjToKfqwBjVA2YLc/ytQgQpCCixZJr79wI8ipcjUUdk6cdTlAVgub+p3
 cPBFgLlvlqyzVC5xHIDIYEXD4C5fT3fyxNck/jqn+Rt1P7RQcoKSkoI/E63yzycOil8m
 i0Z9P8lJyU4t+uVZKZkdwv86hsf2wzbRaGKQn+6a+ZfLWIj1YybOnbFXpZfSaqM93+Uf
 z90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bIGHQvRQq5Gcv5I5cSvS3nAGK5+TSbCAkAa1j8XYBxI=;
 b=JKDwljk8kcl/qkkkXBFNcv74+XgxsR1Rdz8bDc7NikoDeaZjWXCwuzl4BmNKcIpjHL
 yOIBqenXaVKGSiUhnPc1VsojZGz1aRAkY4B97kW8TyMygVFpuHpwSYj5F+Ah2J94XPP2
 egpnsiciTCe7wO4Ps8wsyas+D6VPIc2bgUKIcIM64qeIYes86ig1GVd1LRqdkIvfBsRP
 Wviv8Hn1PJP5UbZfI8/xJ4Fen57MkrWOawL6H3W+NUPHNW1SKzQqurikOw5JdOGBjDhS
 tI8xK6yxgsRgzcl+HDo+HTcdsHt1Loi/Yh8SCH7agZ8SRu2iUKNZiGUpfqZafD+CUipS
 8fVQ==
X-Gm-Message-State: AGi0PuZ75hiz9JkQzo7oUJtw/tACrfcLGFYGB3QwMUQv27sim3r+E7V+
 UsVS/hILE89Z4u0BooH1Aks7VQ==
X-Received: by 2002:a62:3287:: with SMTP id y129mr4771046pfy.167.1588968963932; 
 Fri, 08 May 2020 13:16:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a15sm3067236pju.3.2020.05.08.13.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 13:16:03 -0700 (PDT)
Subject: Re: [PATCH 1/4] memory: Rename memory_region_do_writeback ->
 memory_region_writeback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200508062456.23344-1-philmd@redhat.com>
 <20200508062456.23344-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df18d27a-7a87-32f7-fe62-115be72a08a5@linaro.org>
Date: Fri, 8 May 2020 13:16:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508062456.23344-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ee1OeJLcILJ1

On 5/7/20 11:24 PM, Philippe Mathieu-Daudé wrote:
> We usually use '_do_' for internal functions. Rename
> memory_region_do_writeback() as memory_region_writeback().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/exec/memory.h | 4 ++--
>  memory.c              | 2 +-
>  target/arm/helper.c   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
