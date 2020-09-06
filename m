Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2740135lfc;
        Sat, 5 Sep 2020 21:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeAYQFGMuvrigmdIhqw5st82kCw/0+tUbTyxt5ug2UBeswUqqUBRkxsKiJKNNLMvexO7t5
X-Received: by 2002:a25:8f88:: with SMTP id u8mr20174460ybl.103.1599365140145;
        Sat, 05 Sep 2020 21:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599365140; cv=none;
        d=google.com; s=arc-20160816;
        b=K52NkleZgkOzGEsaYUcPbsED77wFEML8WJsVjfDZ6h8ziYqcrL2BEuvIF55zXmXzIl
         AtknBfsFG5zeFsrXgF/OSg7ei5jmSjVdADLvYCxA0zPglZ/Jt8STiUb8kgGwhZCE29Fq
         RNVPq1S7F89fmouaiZvjeD4uErOIF5edBdpTcRo94Lu17iVgurdjMywat1YfgGpwArgE
         5ZyMNAMb3AtX2s7vsBPo6mJjgaOX633HxhuvlKru1/gl1fw3EHVK/jj8vSdK9RpbisRv
         2wMKg5lzDJaz+STBwO1+iVBFzjqIaYPIrrfgvcp6DACH17OZIpz0vsKx0PynjpkEz2eO
         c4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4bOBXnPOHjK+hk6GMPRYVjhEvu4TqfxlUJKnmvGCrc0=;
        b=rAHOmNdPjFQwzYim7dzjBuhraw3/vjHmUpOdv/qDrj04fi97vwgjgvJcTpgavyWHV4
         uVL7xKsRj8Jb7JLfIV6OWZtOXekhIJjqLy9b6vO6LudlFnfFdEZIQ/mcfSmfXsXsF5Dn
         NMTjCmbQCsShypDOcP5eYYaotimhd3JGpEC4WYV+ANkSRF//P8BCAoVPrMpYAByYFqwR
         MnRswlb3Aro/RYx1vsYligoHYSTLhVELv0Jow9Nw50LnZfDkccmJZqi62J4FKYnOBrcB
         Xg8ImAb28J/wsbbLTZI+++KES5A59WqODawuxN2ONQlZWol0tmO0A1ep12USaxbWRefs
         ZEVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q6FOcskI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l65si13323018ybf.282.2020.09.05.21.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 21:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q6FOcskI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElvv-0006Jn-H0
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 00:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElvi-00065g-EZ
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:05:26 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElvf-0005ca-NH
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:05:26 -0400
Received: by mail-pj1-x1041.google.com with SMTP id b17so2707182pji.1
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4bOBXnPOHjK+hk6GMPRYVjhEvu4TqfxlUJKnmvGCrc0=;
 b=q6FOcskImTfD6XnY3Tw7SaC+nUT9c9L+6vJUEyFfyR35lJ6SeJMDpJbLs+XVfVdyyH
 ZygKLBD6SkorPOcLhJivhnjb64MkECQs+ZERAcBzgnG39d5+Go37hDxqP/6Ug88j8OoE
 Iq4iDCwuVX6HMAKWtbYGM7eNxe6fGI1mMdXI7YxHCK9eIwTpbLHVw1kUlxc7cjlb/c6I
 tsAmi765uY3qSHvSsUtsiSWY56hiGkT1K+KV+zAI1P1g4TR/hTHQl2L2XEdEhmiZRuLY
 pJTxuQVegQmpMLD+lZJdAdF6NUP3OO+1CoMwiPzFR7SJs/9kA75O9enBy5tHCOAy9hXh
 PBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4bOBXnPOHjK+hk6GMPRYVjhEvu4TqfxlUJKnmvGCrc0=;
 b=DTo/6kEm2UIw8QDxIovnEL1w+4ELC022A7wkkciBviW3P6sQeuOCMLN5VzJXyWbvZO
 tH7F2YH/kSyz59+9FSbVZMcOtFIIlBj/9MiVqXIREUxUUo8m+lkWXuq5RWNXErER9kDm
 xqZXPb7Zgi4mEzYZeGGaQvkvPZuPAeEeCTfF9xMbp/B0M5wL4V3gkEPiPYY2JUs+IMkO
 P1x3Ggpgpw2UfK7nCD9QrBvBp1oQhWRS6HcIJ+1d1hxUGtzMBEjYBtdhcAXtDb+d+bFZ
 NKIdsOyZizFRVgzcTc12WuKn1ntx9tcGT7UWm5qzWXSbp53ziRKRwUS1GUGwjnk0OUlJ
 JJIQ==
X-Gm-Message-State: AOAM531dnq5HsfIZG2TlHwqtyIE5H0suGe7QwvrFRpewgFJwbfOdAmpm
 I0v66z1fY4MPGvL2XFYPEpT3BA==
X-Received: by 2002:a17:902:a60f:: with SMTP id
 u15mr14637960plq.239.1599365122305; 
 Sat, 05 Sep 2020 21:05:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j12sm9072890pjd.44.2020.09.05.21.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:05:21 -0700 (PDT)
Subject: Re: [PATCH 13/13] dma: Let dma_memory_map() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <950d8fa6-0514-f305-8934-21b28e9bbbdc@linaro.org>
Date: Sat, 5 Sep 2020 21:05:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/yDk0/owKCj

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling
> dma_memory_map().
> 
> Patch created mechanically using spatch with this script:
> 
>   @@
>   expression E1, E2, E3, E4;
>   @@
>   - dma_memory_map(E1, E2, E3, E4)
>   + dma_memory_map(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

