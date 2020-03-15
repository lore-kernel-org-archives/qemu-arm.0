Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2140786lfc;
        Sun, 15 Mar 2020 13:41:22 -0700 (PDT)
X-Received: by 2002:a65:5b04:: with SMTP id y4mr24062956pgq.25.1584304882342;
        Sun, 15 Mar 2020 13:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584304882; cv=none;
        d=google.com; s=arc-20160816;
        b=lKi/vSZc6yemUATXP6MnldXKKzH5Zime8kF+uNm5Xl+C1FETK4afQUoSZpWyjsh95I
         AkdjH61ofDBbOxx8qsv56DHTsD6+uJIObNPZf1Hh1Kq3+P4hdV/YIVLpmpWo6pU3iRVp
         h4ixyCti8ZdjNYsLrfLGDIDg7nTEkq9StknrxP8SK4gFwd0ayE+Q5Dn9Y7FrIhUGt3V3
         SDwyjc5DBi54tCBLOAEwrZK8XRk3h5enyce5W5jGvUsP4uS2w0ABm7vStGm2HoIcc3Vq
         ooAhpCYTeHnQ8YhgmJ7lkK5xcZcBOl6oAN1Pk47H3AqdSIbLmYZR9uOcoLZYdB3uFqo2
         Cx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ptWp7DiJgrQmGpFT+cURd2sayWW2ITlf8l13syF2CGc=;
        b=boSsC0qzrakpHfRxmKxr+BGZruUtX67aWKZIJJ+qqhjZ1LqVsREBm0Fy/VcjdmSdoA
         QOY68Qr4nDyACCPtAYKkKukotxs504tDikm9r9KLVYjoXtKDyCZoWAyodqXtovHp9MSH
         yVkAO1MtmFwHb8RHVQinlX6XW9CIcG0YKdLNN/YDn80txnX77yxitbfzDQBL97ztfyZB
         W/UJq4zMfyNnOpMWrUaHKGo5LXWMXeuUfxaK0Yhm0OjemATstUJr2Ex2fDrjf2UYO5Hj
         w7jONkbX3OvuiBcMgjAVp3ONseZSwN5fmg/PzVV4JZejifPb5Sm7IDXLBVV0plopXUo6
         Tzrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8vZi3qH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a43sor17553453pje.19.2020.03.15.13.41.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8vZi3qH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ptWp7DiJgrQmGpFT+cURd2sayWW2ITlf8l13syF2CGc=;
        b=n8vZi3qH28OwzWiE8KfIc9it3IHgWAxBcK7e2tNBJxkX75+SoaJvHDljDff/UenDo/
         m9oolZXvZfgHYNBtVUmMef6F9arSacrn9QJPuS09zf9zQGVpd1OJyHRG0IA9+hv2YZAA
         WmpKJTxN000P4Dxuc4iTDehOXcbq8UOZCw6ZGHTb3Jx/6EBg4INkIf+0aTneZvSA25mh
         Qw2oCxi/lNq4oHX5ZTh+oZmu63M9mkXvnHW4VnXyvud/OqIfMrCl46yp65zzHGRBmcng
         Yp0o7IVRpDPL9eWJQNYW4VCQQNzTqWywou9jv+XR1ylAlBsqFuHRKi43uEsZN78salYL
         9rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ptWp7DiJgrQmGpFT+cURd2sayWW2ITlf8l13syF2CGc=;
        b=LuX20epGHIHgBCLxuZlK1Upofn3WwVZdK62JRWv7Txd6m8ss+nGB25eqWb6VaFYMKl
         qJhFIjMXFl7wXCo2i4WIuyT5F9TmAk5h+7W+xiIzW/hpfHPt048Dfc5pxOhX+pyOAua4
         LqZgQ1W6nxA/KLkRjaCA+ma7tZ3kN/S6MxyOUClnbojJzNV8AoJqi+DjEuYmt5F/Xrin
         AeC4gJOmW40zCfToPIu0I531G60zdcKyeHG5kWlvW40g50QErUaafTfHk5NvP67KQuxk
         IbKTdHLCVftJ0wkTbrYC73RLfhpHCuOkKBOV6RWMOAaK/z4oESVbTRE7bEJGluO1gB5l
         qu0g==
X-Gm-Message-State: ANhLgQ2237u7Zr9abzyRymxgBg4G7zbjyBRn/CXyhB/mCi2Zd01RPdVk
	THtuFlXxYQ0+NsOxU/Tfau0YkdVqqPu/TQ==
X-Google-Smtp-Source: ADFU+vse27WxJ2ELddAnrCxJTG3eOKRMRKL1GYKnUYoEFJco84s7vgy56r/l5kZbHu0FK6EzKNb8uA==
X-Received: by 2002:a17:90b:1a89:: with SMTP id ng9mr20994362pjb.102.1584304881822;
        Sun, 15 Mar 2020 13:41:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id z15sm29706547pfg.152.2020.03.15.13.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:41:21 -0700 (PDT)
Subject: Re: [PATCH 10/14] arch_init: Remove unused 'qapi-commands-misc.h'
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48b4eacf-e95c-ce1c-e198-c1c9c96b9f33@linaro.org>
Date: Sun, 15 Mar 2020 13:41:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ruNKwwNM831p

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
> this include.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  arch_init.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
