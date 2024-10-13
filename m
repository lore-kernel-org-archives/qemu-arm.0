Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1460950njb;
        Sun, 13 Oct 2024 10:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUk+RigwMIXFtzm+1Dphwegy+tLN6JEQ9coiZ/AS3EF1yu8MKWkRuUUBBwkwwAuuDMuwHq+Q5Yd0CBs4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IELYSzt5F2vcQVfxKOEm269QhPVwG/5Qx77klXcReyNF9Ma0+HB3yDWn1CSqy6R14rE5Ees
X-Received: by 2002:a05:622a:1aaa:b0:45d:8623:3b24 with SMTP id d75a77b69052e-4604bc4975bmr145437421cf.52.1728840659843;
        Sun, 13 Oct 2024 10:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728840659; cv=none;
        d=google.com; s=arc-20240605;
        b=d75xa42+fczj9Gd14gynmX0i12a6h/KGlgH76HnEc9ClvY0J6XitaeiaXq70ZG86w3
         RoDQS0BTIyXk0j7lhAK3KWESsjpOsNdpNl5dnqj+HJddIdTbuJfxsa35EGJb83CoiW01
         TGloOWblLuD3yEPLUkkfZ/Axai2xbWOoFxz8g7QPAXiPC34HfvQ2XspiGwt+Nbrurf2H
         xNwVhGZ9+FBnnu26x011I82mvNpQhuZCwlxWbIHczb3Ay7aOJcf7nlf7zAPK5e8k656B
         bu2jQCjmscZ3deaBOA3JWtbz7AK9BMtJ4cw/7CnurOEcszgv0xxu2i7of0/d1o8Xg+y0
         UL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D83f+KcDMnwyLbifqJUEWjwJAIEKpC5jUUm4zFbphN8=;
        fh=IN6s2fJcetDSW2/INBTpTcafjVYrZflfTUv8eX456DA=;
        b=hmDxZeAyfJ330HeXZnHjZ0dOdviPdICuEW0GnFsvvuUZeobUpZ1oVCJusha74/ykzW
         UuLe+r3rstjLjDe0ARSVV8GNIuI/8ZwCdjJJsqlkwsw7X1oGvb3obQO1ikLp3QvJq7tA
         LZaJ2KVsiXN1UdgXR/Rh1BgQsBqDLdAN6ouuT5m7gNbz5zUjxiT1xTfgTxJpSsInbKkn
         SbE+yHUZoRmrp8x6fPm9BxOAWiRWvXTcXhuJodfxb9wwS0Lp4d+LOL04E2yJeTydzrYx
         +knDgzU9nk7rtdrNg1OROSBSnciJoBSk4k6oTpeB9KOLBggGfEm5Wns2XG9ENTr2LlZM
         RxKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0GpGmAJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4604289baefsi81757651cf.422.2024.10.13.10.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Oct 2024 10:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0GpGmAJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t02Q2-00076G-4t; Sun, 13 Oct 2024 13:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t02Q0-00075M-Er
 for qemu-arm@nongnu.org; Sun, 13 Oct 2024 13:30:12 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t02Px-0003Oa-G6
 for qemu-arm@nongnu.org; Sun, 13 Oct 2024 13:30:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-20cb47387ceso12931025ad.1
 for <qemu-arm@nongnu.org>; Sun, 13 Oct 2024 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728840607; x=1729445407; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D83f+KcDMnwyLbifqJUEWjwJAIEKpC5jUUm4zFbphN8=;
 b=Z0GpGmAJ5zHEDjQilxt8Ojxc5RtzxrJJiTTGNGXNxKU5od0ke21lJD08tEgFKOKtm7
 OzKM5QMVIlrCz0YAdyG8+dW8NAinanVdBsNdjuJWVCNGQGqNC76mOQqdMYIBRdJALdWF
 l0I7gyWhAbGHxgTWXIcUAMtK0ZEVIxNL+TtweW8OJRo7v3ZZ9AvlaeEkZE7IqLs+UiHQ
 6ume8Wd0joYVvlAolXxxWs+VeE7q10u2t9QW0RILb7RdIxz4URalClOXl7bmTPR0pNrR
 aDpjn4vk2XnH7hs26HiXRsbWxGLqNssk0Ssi1xDThVlmHkbeB/FmigkcZqZD9acDLNQK
 1sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728840607; x=1729445407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D83f+KcDMnwyLbifqJUEWjwJAIEKpC5jUUm4zFbphN8=;
 b=izmv5g44WIRN2oyNn21JIopQ78V1Sdn8DDJ4AGKZ4gp44Syf3oEFSAGgQxsl2U87m9
 /RD2Rt9LU5XxqhditbOTPrpk/og1lcSDR7Yv5WLk5fGbHbWAtovtSQBUMsn5phm5MI7O
 /MjtdyRqqsLZOn6v0Q4zx1oBMWZhHkbNG7OVtxRtK8XawpLslQ1fbNNeXU0TVzXdIfsM
 XXxV20czcWMkgP2QH1tID663JkADLEXRkOOthA67GwtSVKbbVMwxrry6SnCfzshnotWv
 jn8aMw2er3ZMqCsxwEiRgf9L4PDt1qHDzdgoh4hrNIzTK8vfNe897mDw5Yfo45PrBaHu
 YldQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDZXSY19KBf9wMRSBfz/PS3ts4AKnu62oR7ReHpQdRSxrXLEjuj5dVKjNOnQ4dj4AUEjZDb/cSyg==@nongnu.org
X-Gm-Message-State: AOJu0YwRgBdL3LrYF8t+dna5lSCzyOd2QTv5DnzDm5zVn84pD75HcdUq
 7ei6smAA9FbMyFvjUl67Moofp46deRwJkC9awfg0OeLYkX8KU0h6dsNl01Z7vB8=
X-Received: by 2002:a17:902:d481:b0:20c:a387:7dc9 with SMTP id
 d9443c01a7336-20ca3877fd7mr118200965ad.29.1728840607421; 
 Sun, 13 Oct 2024 10:30:07 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c8c0e7513sm52020925ad.137.2024.10.13.10.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Oct 2024 10:30:06 -0700 (PDT)
Message-ID: <e504719e-aa6a-41c5-b2f2-31e3400807b5@linaro.org>
Date: Sun, 13 Oct 2024 10:30:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Store FPSR cumulative exception bits in
 env->vfp.fpsr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20241011162401.3672735-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241011162401.3672735-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: /Wr6G1bdrEiW

On 10/11/24 09:24, Peter Maydell wrote:
> Currently we store the FPSR cumulative exception bits in the
> float_status fields, and use env->vfp.fpsr only for the NZCV bits.
> (The QC bit is stored in env->vfp.qc[].)
> 
> This works for TCG, but if QEMU was built without CONFIG_TCG (i.e.
> with KVM support only) then we use the stub versions of
> vfp_get_fpsr_from_host() and vfp_set_fpsr_to_host() which do nothing,
> throwing away the cumulative exception bit state.  The effect is that
> if the FPSR state is round-tripped from KVM to QEMU then we lose the
> cumulative exception bits.  In particular, this will happen if the VM
> is migrated.  There is no user-visible bug when using KVM with a QEMU
> binary that was built with CONFIG_TCG.

Ok, noted.

> -    int i = vfp_exceptbits_to_host(val);
> -    set_float_exception_flags(i, &env->vfp.fp_status);
> +    set_float_exception_flags(0, &env->vfp.fp_status);
>       set_float_exception_flags(0, &env->vfp.fp_status_f16);
>       set_float_exception_flags(0, &env->vfp.standard_fp_status);
>       set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);

I will note that this affects can_use_fpu() in softfpu.c, at least for the first operation 
after setting FPSR: without float_flag_inexact set, we will always use the slow path.

In glibc, when manipulating FPSR, it tends to come in pairs: feholdsetround + 
feresetround.  With this, half of the time we'll be setting the exception flags to 0, and 
half of the time we'll be restoring old values.  The latter set is reasonably like to have 
inexact set.

It might be worthwhile to set float_flag_inexact in all of these when IXC is set.  We will 
still sum to the same result when reading later.

That said, this fixes a bug and is not wrong so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
