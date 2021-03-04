Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6513643lfg;
        Thu, 4 Mar 2021 11:26:00 -0800 (PST)
X-Received: by 2002:a1c:2288:: with SMTP id i130mr5375301wmi.62.1614885960212;
        Thu, 04 Mar 2021 11:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614885960; cv=none;
        d=google.com; s=arc-20160816;
        b=TMSiX1s2/GiST6vEOWuys7NbiqK0leKPizNV45sVgD44wgCuVymPa1O7+NfaQqy8BA
         Hc+ZNYziVdY3kfCymijgeneRP70QHDU/hNG+UqJrlTDGj4fZRlxQ7R6AtKRy/rGANhEQ
         CmZ/8wdlXdZ4tXrysLMuj82f74mjdZM4t4biTK+DB5IqthPXK+HLrsj25/kHTRPuKG2Q
         Xm6PEr3g4PmS3rNXITWoIDH/yXDTNnWXX+Ix/HpZ6OtLzsOJbSmUBgIzXfgnQuGbcs85
         TZuRYk5u4GSmugPwh0Kmv3bjnXaMBgo80icD3x6KKphiGNU7Mtazu8I6fBxeZ6jIKn9b
         lIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=K1rMeJSzwzcq98KjXfKjITR3jsmxskM8W7FX7UnUdWM=;
        b=blp30tF3c686FeMtzerIaW3R0kThKeHjMYscW8V5bA+q80Kyp4yC7AgHSE0W8GVEnE
         +EyIuVB3AC1e/5hUdSykHz6RIk+t5yG95bpmH3yZyvho7LzBQRGDWPUBCQmIrLiAbClv
         an9+jA2ssJH+9m1UfkgrtZglFSaYMhbmQt/MurNMKWJfKLP2aHI3zcV54ZVVDUrouvDA
         sXhUdV9xKxUftsC9lVXu2KFc/FNCLUJqs543YFNuuI9Ml59TaT3V17kMdBUXnpklRket
         D0FM1Z5Y4FBFZgH7xhcqrvsRUnYP0wxr3Vdk5/OKgPppSnkNwnkuDrP2E/MrHrQo+QiQ
         LTvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rs/4W8tP";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o25sor78545wmh.17.2021.03.04.11.26.00
        (Google Transport Security);
        Thu, 04 Mar 2021 11:26:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rs/4W8tP";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K1rMeJSzwzcq98KjXfKjITR3jsmxskM8W7FX7UnUdWM=;
        b=rs/4W8tPuM/MAzTPkgfenRbbFQ6m5CgD1CMLfCmkzwDx6edd20DBZfdu2FVs+csbW2
         zaW+sJs14dqT8/OldzMk4ZszUthHC5efW4jrHjLxIDbrbheBa9Zrrnl76WR6O0SWlg2g
         pnMG33E2WFIW20rwbZ8mYo6lpB8/Ol4fOCtTVL2TdIABnY6bUMeg21x0gmfS+dbBiViJ
         QFST5anZaibLJrEoTrdat03q2w50wJINbxElELmvcfRR8GtdCntct781h+3GVbUKB5l8
         co/VHfEmv0d1U6KrS43SFn3gzRcDBeVeu/C7Fd+T5w4FEUj4QMnq3bjcXBhdYQsJ746V
         M3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K1rMeJSzwzcq98KjXfKjITR3jsmxskM8W7FX7UnUdWM=;
        b=LRmWoRjdyCLA7m8yS/K+N2vidkhqkm/3M6K0b7JyGK4XHhqJFZhH4j61EJ6z+iBeJj
         Xg1Q0pOKO4UkpVnL27fAga7gQyjW8JYdHXsTzD8pdVIOtpLh4v01jBaLw9ayfiCbYGbl
         bDMJOnvGrnH9+DflVow34xSA7Dgb6yUDtWIQInEdTuGGpG/W/0/6c+9QdidZCzlHcrI4
         ZiisW2r8wDecxCQ1ExmRBjQ6zQmbniwpf0oRwr77VoyiZUUOfSokRE/Z5Gvha/Qsz1v9
         Z4xv403ohk6EqGdOXfItoER5627k1SnfOPsvoxWvAJNojk7giVgEPhWAmGa5LUiynq0q
         fRnA==
X-Gm-Message-State: AOAM5311vsguacvCjX+GZe1i/Gwk1CKvc1x1S100CN6wLa1oWnJC1ewR
	ok9UVd1ZDL+H88T5erxXQh0=
X-Google-Smtp-Source: ABdhPJzXyamAlrjSNY+hfTRG5LpIrWByypnuH95AHlow2cjiddxnz8x8p06b5lPMQcGulA1U84Mr4Q==
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr4561826wmg.108.1614885959999;
        Thu, 04 Mar 2021 11:25:59 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i8sm332582wry.90.2021.03.04.11.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 11:25:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-4-f4bug@amsat.org>
 <1f571396-c225-0372-12f2-1a366ad181c7@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c84ad2a-7fb9-241d-c0ba-81ff16269240@amsat.org>
Date: Thu, 4 Mar 2021 20:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1f571396-c225-0372-12f2-1a366ad181c7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: eSKtS5zlCrTt

On 3/4/21 12:55 PM, Claudio Fontana wrote:
> Hi,
> 
> I am trying to take these patches,
> in the hope that they help with some of the test issues I am having with the kvm-only build,
> 
> but they fail with:
> 
> target/arm/Kconfig: does not exist in index
> 
> so I guess I need the "target/arm/Kconfig" series right, how can I find that one?

See the Based-on in the cover ;)
https://www.mail-archive.com/qemu-block@nongnu.org/msg79924.html

Regards,

Phil.
