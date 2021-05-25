Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4096643lfm;
        Mon, 24 May 2021 20:30:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKmIFgXlppD8uHsFH+t1tITPxVASUHi2HTXC8ynGM/4NlMBoQfjylrkQxShFNKRGDMqRlp
X-Received: by 2002:a05:6e02:13ec:: with SMTP id w12mr21021600ilj.285.1621913425399;
        Mon, 24 May 2021 20:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621913425; cv=none;
        d=google.com; s=arc-20160816;
        b=l6YX2RVxL3c4PNLY/XT2IYmTJ7J4txO56hyakSrJstzoWluKkHpFgXV4Rb++EUAyoU
         FdW7axi16Dscj7wfyuRPcaM521u6+VaDaM6JVMO8ZaXMdcR3C7hkXpIwIOibktVDBHQh
         IgJQ33viFxL7yQKsDEzuQ3lBHqj4OkGKPyTsE8wsF9imHWZm/6H+sX6Mm91Y9e0y4Uw4
         cQPmnV8rs1TY/uaog/JID7k+3fJVVFXi2GQG6/CyQIDtfdoMlgsBODWEtPDoyHj8E4Mn
         Xt/i2QF2tcjzAoKu1y9v0fUHcNtw7MZElMOAczllFc7Tz5Bl/VRSWQbRQuVhwRGgX/Gj
         2PVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wc2h7QKpQXXgsYCMjll55SUow5NrWE63Ei2Nd/mLazw=;
        b=vL/Ygfo41aKmy9CZZsIF+5EiOzInoicnr7GK8EkD40mRWywrV5Xuplgw/t28DYheCQ
         qDXflb+YhAVf1YLvif4yW7KBpPnQYH77LWbXnhQ+qgc1EL4M0jSpqlj4R3k/j5bI13D6
         0uzq3mVAJX65cvgAsiujgDN0DJixNcCAe6qfW8MJs6NhFUq/KbKuiY+BnXkKbWrQlW/G
         PjnWUybU6YKzIuP3k6c8oktwpSm7cM3pVT0BsYMwN4xgh1weBIWcf/QSegi6+HnSkB3D
         ne6R8ar1NPWRCCSHgqzzvc77lrOxZfyNMt1VkoUg+0cY6IkLsSmq72V3l2geYShOfIFW
         MWmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BWhDH3+l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si5068554ill.101.2021.05.24.20.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BWhDH3+l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llNlw-0006qI-OG
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llNl0-00062K-Lp
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:29:26 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llNkz-0002mH-39
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:29:26 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n8so10433510plf.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 20:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wc2h7QKpQXXgsYCMjll55SUow5NrWE63Ei2Nd/mLazw=;
 b=BWhDH3+lHxPRv2Nk5f7Q8MRKPfVl5O0VT+44wAw394D2GQLreKt6hTCT9UVQr3lzkE
 sNpNcrennmLBAljDE0gP34QxV2Jkf1IYNsLo1kDudqEKym6NE9ZMN6/YaPTeFwazw/ON
 GJKN49tf5wInWEhIWOqZRj/XKnxbocEqmXHz4LeUu5oY2l0tYRGMe+6datKKsQmWpyR+
 b4GUzv4H7VxkYi6dZkaVkOaKspfBrAyAdabzBVt7uzfOJKnPbeUvpRx+skMdRgwpFfIR
 CETyHYplajL1j5pv29RCnch9cmasYubze0wtc8KvMbFvjzjuvkEzWzkJ8OkIgx+3N98Z
 cNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wc2h7QKpQXXgsYCMjll55SUow5NrWE63Ei2Nd/mLazw=;
 b=sval7JSN8tTh7fe47jaRhTEs5L6DvARuARJL5QO/mXLwsbgjBeODY1bF+vVazcSPyA
 SYWs8oLFt+gX98KhyY/n80VWaE8ZEhM5NhwfA/lNFqloGaZk+QufgVwr29u7NS0W3/qR
 JtTfMAEoWpwiMLA3qBFxxr71t/y1J4Zw8C0TRTYdQcZ/6YY+joe2Vtc4K++5oUc6UJxo
 Yem/AHElf96OoBoOFeLfPG52QCsnMEVQBjXFGc4uBUxSoYb9ZVqo+SYT/f4HEprfFqLN
 SAO0BvlkH3axYsqDX3jhKmqzUstLceFt9DTv5eHOeJ/LpjK0VS9qdP0WSJJKEq+Xt53F
 qAhQ==
X-Gm-Message-State: AOAM530xxuMsAkp3PMa46axpR11wPgGvHL/Q1zROiWARGCztA37xDB1z
 W8APB8kC5nRLsqSi6aBOXaa3vg==
X-Received: by 2002:a17:90b:88f:: with SMTP id
 bj15mr2584371pjb.46.1621913363163; 
 Mon, 24 May 2021 20:29:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 lp13sm723255pjb.0.2021.05.24.20.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:29:22 -0700 (PDT)
Subject: Re: [PATCH] target/arm: don't clobber ID_AA64ISAR1 pointer auth
To: Jamie Iles <jamie@nuviainc.com>, qemu-arm@nongnu.org
References: <20210524084306.1666265-1-jamie@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e65bfd0-545f-4b38-c043-65c2e90e0e5e@linaro.org>
Date: Mon, 24 May 2021 20:29:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524084306.1666265-1-jamie@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, leif@nuviainc.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3TYyaFnCJWGI

On 5/24/21 1:43 AM, Jamie Iles wrote:
> The pointer auth properties are added to the max CPU type but the
> finalization happens for all CPUs.  It makes sense to be able to disable
> pointer authentication for the max CPU type, but for future CPUs that
> implement pointer authentication and have bits set in ID_AA64ISAR1,
> don't clobber them unless there is a property registered that can
> disable them.
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
> ---
>   target/arm/cpu64.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9c1..81c9e494acb6 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -575,26 +575,31 @@ void aarch64_add_sve_properties(Object *obj)
>   
>   void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>   {
> -    int arch_val = 0, impdef_val = 0;
> +    int apa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, APA);
> +    int gpa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPA);
> +    int api = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, API);
> +    int gpi = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPI);
>       uint64_t t;
>   
> +    if (object_property_find(OBJECT(cpu), "pauth-impdef")) {
> +        api = gpi = cpu->prop_pauth_impdef;
> +    }
> +
> +    if (object_property_find(OBJECT(cpu), "pauth")) {
> +        apa = gpa = cpu->prop_pauth;
> +    }

This seems overly complex.  If the pauth property doesn't exist, can you just 
early exit from the function?  And surely the pauth-impdef properly would exist 
if and only if pauth does.


r~
