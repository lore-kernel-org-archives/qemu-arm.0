Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp73334eji;
        Tue, 6 Feb 2024 16:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5XKJSDrC0DInw6Ir+lwfpDePn91yicSozDFGfR9TuiZdw4mUU9oEeoXi7YmEbxHpU+5Jo
X-Received: by 2002:a25:6b49:0:b0:dc6:d9a8:9698 with SMTP id o9-20020a256b49000000b00dc6d9a89698mr3192105ybm.18.1707265949299;
        Tue, 06 Feb 2024 16:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707265949; cv=none;
        d=google.com; s=arc-20160816;
        b=jCSWmMbtHutnP9cZXFBDNtIQHpAlAm1eksuH7+2G2wmcnnm1pzEywLVpOmiR3gELhN
         vGwvcE78puhajjlMtgglhBBkcYEHRpGP4esQfEsZPOEHWw/XDM5/mjhKExMJJVBtFGeD
         r5kgWL49YPfDb5EVnxVD6+glESSJqgwI5nqwR03dF+c34psL8LvXgGvK3d4a3iBT0M0i
         ISm/CRl8cB/YqR6Q6Rmn9BC8iDtiOwDC6fFMYA3hCq9YmTy+htR7RhAsEhhDpNWR81c/
         f3IljKBtwFiYmkOeu21Gu6yhaXsindX7D5b51Y+W+oWhWfHL2g0SKzqofNjGjGInmapg
         s/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BONeK30GqVnoNEUpJM1FuM61R4Zd07UbTKqDWL3MnGY=;
        fh=0DH8Tb6Pc0vHEz0jLJ6zHooEzAnpgxuZrVrg05NR1CM=;
        b=Uwe08tX+leNIuguPVO1efl/Ex1Qnlo2XehtmuBezMz/46jf2rsRtI6/QlQ0MCMsPkC
         mJtjB4wdGmfShatkDgzU05pUSYloUhVIz0M7qs1HysRiyEHR3gyNS70cwjbL36uY4Vsu
         zTrEmY7LhN4W3jgdHHntcq7DcqAvqKXq+uZFOL4vve90P926nuMrS1/jhrMY5eS26Vsv
         567XlZyV758Ab9j9C27IijyJyv88+xardGl9qC93Akl7zGTtgZwHommI62yy416sqkvs
         Pcjq6MPVYZI/j3uCtCfPshq+RVmdiiG+ribKmXXasp2X3CUljI5pk0nJlO8jB0e1vk86
         OpPA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hcNOIJ1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCX78oLQBQOEqoL956mecnSI9tIZp1fk8hH7YirBtspSK94lSBVISaJGzkpMZptSZ2XIHgnCcedgypQN/NncSy51cS0mEHbB
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ac87dc4000000b0042c2a62dd53si74250qte.785.2024.02.06.16.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 16:32:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hcNOIJ1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXVr0-0003vp-33; Tue, 06 Feb 2024 19:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXVqx-0003v2-Pb
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 19:31:52 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXVqv-0000wP-Uh
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 19:31:51 -0500
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso19271a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 16:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707265908; x=1707870708; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BONeK30GqVnoNEUpJM1FuM61R4Zd07UbTKqDWL3MnGY=;
 b=hcNOIJ1/dulqjoNMazLM8FSTXT9ANyJyiYPdNnHdxu376F6Sb1b3e5qBsnDYgIuBlN
 DOc4vpE0h4M/HHMJqmJJkpSgMLDgsavzhbcCohgmpbL7PuqTskyOSc+gVbBiXcmx6iZf
 3Atvx7HLteyK0C3rZ+zW695jZrrZ2to6MJJRL7u9PzpRU8sqTG6V5oP5NvN83qg0NaDM
 ja7oBM2+yrCC9ByCu/E20+x5FRUjb/kWtoXXQZT008q9tcrHtbBgkzFJZTu1Z63UOfsl
 wuEVuYIm/S5NRxMQPBxBvGGdCJxyGQ1Dyqzr9S+chIJ4DKQHwjZRk0r/3Lo6h1vhio5b
 relg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707265908; x=1707870708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BONeK30GqVnoNEUpJM1FuM61R4Zd07UbTKqDWL3MnGY=;
 b=OiIC0qsWrSzMJ0AL+hbjCbzcfVWdg/CeNKBZOmB3WzFeSkkU89Fb1b9Mdg7sfiH9ic
 mPpfgKCpmGM7lHvHqLpz3K1KBDBAl8+D1vQCklCKjbI7TNZgVoDoU4DwhmpL7CjUiCsw
 sS/jzihIx1yjtN+5zRWhh2oPsHQLYkWa1Z6ANo2y/3SlaPKvoWt9MKpxVGdcOtqfb/v+
 cAQrnbnBiT+M7lrd1NlgITuiq7u/n3gD7mvhgidaQTn/1tRbfx2KXUe+yRSwZW5kh1HX
 rNhJZBfITe22TUP5A0g2mWyO8h9J1hLWgfOBZRS1xvByBSQYoxghgVD4C80AZFQn5ySU
 m8IA==
X-Gm-Message-State: AOJu0Yzr6lz2opT4GZhTqC22O+s1U8mr1WjO9kQDREEKEWlLJ58n9Xqt
 ogKJL4/RE5eF680BWWsia2LL0q7u5Z6od+M3dGouNfmRIVc7CVPv7lINzBrwv9Q=
X-Received: by 2002:a05:6a20:8f18:b0:19c:97c3:8a5a with SMTP id
 b24-20020a056a208f1800b0019c97c38a5amr3849641pzk.19.1707265908152; 
 Tue, 06 Feb 2024 16:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZA63gdSmkLEQnF4fNwtdrLkjrAUjYBb0NuN9gJ9Wk+yzjn381UvZsBNBwI4DGir5wLlDeP+LI6hz8m7sdJ36+n6ha7bKbTVSoysX9Z8kdqcgGkBOtrzRwxDXnMJ0g
Received: from [192.168.0.100] ([43.252.112.155])
 by smtp.gmail.com with ESMTPSA id
 sz14-20020a17090b2d4e00b00295b93bfb24sm156367pjb.22.2024.02.06.16.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 16:31:47 -0800 (PST)
Message-ID: <d57a4146-d7f5-4ba1-a11f-67e51d407423@linaro.org>
Date: Wed, 7 Feb 2024 10:31:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] linux-user/aarch64: Extend PR_SET_TAGGED_ADDR_CTRL
 for FEAT_MTE3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-2-richard.henderson@linaro.org>
 <CAFEAcA8AuQZNbT=7WFXVPDzDywPPp1YZ=Bkow7Dgq2pC9=9X-g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8AuQZNbT=7WFXVPDzDywPPp1YZ=Bkow7Dgq2pC9=9X-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: noxci+/sPur0

On 2/7/24 00:23, Peter Maydell wrote:
> On Tue, 6 Feb 2024 at 03:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> When MTE3 is supported, the kernel maps
>>    PR_MTE_TCF_ASYNC | PR_MTE_TCF_SYNC
>> to
>>    MTE_CTRL_TCF_ASYMM
>> and from there to
>>    SCTLR_EL1.TCF0 = 3
> 
> This depends on the setting of
> /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred :
> I think you only get asymm here if the sysadmin has set
> mte_tcf_preferred to 'asymm'; the default is 'async'.

Hmm, I missed that somewhere in the rat's nest.
I suspect this is over-engineered, such that no one will understand how to use it.

> For QEMU's implementation, are there any particular
> performance differences between sync, async and asymm ?

I doubt it.  Getting to the error path at all is the bulk of the work.

I think "performance" in this case would be highly test-case-centric.
Does the test "perform better" with async, which would allow the entire vector operation 
to finish in one go?

I suspect that for debugging purposes, sync is always preferred.
That might be the best setting for qemu.


r~
