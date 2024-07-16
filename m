Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp219207njk;
        Tue, 16 Jul 2024 07:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWg8NLMA/Ep4iKeHWa9gTkwrQYZVNqkUEBFPC5878cJcxxZmS8BrEAD74s4FY3L3Vz49pLwmZMJqxlk4/Lcfo0437Rte6IY
X-Google-Smtp-Source: AGHT+IHFLW1+YlKLcN5iN/IpIsbhuQ4xdN8FaVwiaFITLkT3h3yfVvNtnYxzaqEg5FBEn1R9xphE
X-Received: by 2002:a05:6820:3082:b0:5c7:ae9d:7894 with SMTP id 006d021491bc7-5d2898e6ed1mr2604505eaf.5.1721140669268;
        Tue, 16 Jul 2024 07:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721140669; cv=none;
        d=google.com; s=arc-20160816;
        b=BuNg0qVHSPb1yWjkTymYl1cQhjbOxmMy9CfBSsNXSId78dm6Nad24zbiChMm0ijfdT
         /8AM+bCq5sG6ZwUu+Uec33BA+rXp5+Ks4+J7wDZASg4i0JI9cl/4qOEYEzUEGEF6eapx
         ZSTaeN3H/9GCfiiRIhH9CCkYI2osQExB5XlxHZipAHPXIzXHAjvQYaRlhpiTu4K0Sd+K
         zMpujnjlrw23vWMLNJEu65oHQ4cCJ7XfL1/uf1nGTJu8PmznlzQEA/28HXRKHCChqMbr
         4RdpTsmiax/FACoeZ761CH0UEmjNUYQRTHyOFEVzmMC5JTauxWgRc5RsWKW5IJ9g9Jji
         Qzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tOxQpWcw0LIUguDMbxcPC2388Mn3DGxme+Fp+3lkV0g=;
        fh=4q2Bxz7A7ZDcPRKcyGhfXxcSV/2hIhU+VmnXSnrNFqU=;
        b=RnExRiLwa4oeo1VgDBV2J1M3P8dCXztQ4l2a6nA12mmpTIUti/6QTjJ/DYPSijMkOl
         0s1GuHywLfr6NQdcwyVfhxWkBAabwZ0tJXCrTYwqx3KouBZWJr9GO0Ljx56Rcz8Ggtyo
         W0WCBLh1RX0uiQwo+Qx/KfI4rlJctTJOPhYpdTxsTVHE+D/gfrCfLnVqFsc1iVNaZ9MD
         Pmf4X0YJ4uFkZ2Df/KNeap0a5ZRfUQB5ZPfg+ZaTiHhKfksrhNESE2LadzfbXqrpB5Ob
         2YKHebUj+C2Qq6unkOaRWGrypEBMPR22KoVlr1WzcN+07kkIgjpU27S64ox5DdEfE9/9
         vcRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T38FuQja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4912b0efca0si1244063137.20.2024.07.16.07.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 07:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T38FuQja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTjJE-0002eA-Sx; Tue, 16 Jul 2024 10:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTjJD-0002co-SS
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:37:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTjJA-0001i7-18
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:37:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso39636435e9.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721140654; x=1721745454; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tOxQpWcw0LIUguDMbxcPC2388Mn3DGxme+Fp+3lkV0g=;
 b=T38FuQjawJLyE9uFX+ugtg4HthSnpCdC/qud/p2ZVduYKvm6XU5xNp7CDUyNt43txh
 foQeW5MjKVMIIPGKWkXfD6M398bOJdSSwEjthFH+qgRyuwQm8RYLxaMJIzvcWmSDIK//
 BqPz1RNARiGayvsFsSaMB/5rPQzUK22A62kp/NmWPu9Z8k1vIbA4en6pwgn7qwiFqtS2
 8ozXKsTIq/rK14qHDNipC0hQzdymx9cZv5bj3ZaBK6JP59OdRf/zhP5TlQ9hF1hQV3KG
 TkFKI0RiFoD594Zl1zE2bDxPnFmuH82QSNwRK+ITdxZOIp0qCK1BYNt6Sy0IYTnpLMUE
 8euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721140654; x=1721745454;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tOxQpWcw0LIUguDMbxcPC2388Mn3DGxme+Fp+3lkV0g=;
 b=GMlg8KriIs/sFh3YLPGueSqQjLOwxSUtNvBGIzDgcGFCXFfoFnKC30+4FIej30lUSj
 q0Egk/o/OCtE0WWqQbynV/C+3AjlpFgmnG/DFyLjxDbB/zqCzYdHlVnzfruNMouRRei6
 k+33uFkgVMxJmSMO9o4rLsJHGlfmCWj1742f9mA1Nmz1ntpmGkqrtCx8PAWkgAevBnKN
 nvpVcbgygjX5oO+5g1md0FQz++SKbk4CM+dCgid+Q05CzffmWSg/QzPNFuTuFQAIHJ2V
 ZmDONESJQYsNn9MuiDxkxYWC1HQe/OzSo6BrtyJBtPwOTkHVqkSsXjXx/2as3pP1hhKO
 nFdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtOY2Whfn2/2N1agB1DWkkPuQEqJvWSB9OeK97zBMkXEE2DDj76+4gYxxxX1kakIZ3BiCicT54lhZ/o5LXSrzz3N1T
X-Gm-Message-State: AOJu0YxrJDxGPmkxC1c4VL4Tg9VlMDfU7WBrWiDVeJh1RR/uF2bdx2pQ
 00rbSA5dIr+af34gN172DXe++L0bGWGMKAGWsW9ChLZrIAeWzYcGMzZZOiBhWrc=
X-Received: by 2002:a05:600c:4e86:b0:426:6688:2421 with SMTP id
 5b1f17b1804b1-427ba678739mr15165765e9.11.1721140654300; 
 Tue, 16 Jul 2024 07:37:34 -0700 (PDT)
Received: from [192.168.1.172] ([185.87.38.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25a957sm163011475e9.13.2024.07.16.07.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:37:33 -0700 (PDT)
Message-ID: <3e35a80c-fa0f-41f5-8a63-30a873fb3bad@linaro.org>
Date: Tue, 16 Jul 2024 16:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
To: Peter Maydell <peter.maydell@linaro.org>, SamJakob <me@samjakob.com>
Cc: qemu-trivial@nongnu.org, "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20240713160353.62410-1-me@samjakob.com>
 <CAFEAcA82m+8K8rWDMBehPp=NGUezHZPn1LVoyU3DJ3LWq+ZnAw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA82m+8K8rWDMBehPp=NGUezHZPn1LVoyU3DJ3LWq+ZnAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JAatSBu2dSMy

On 16/7/24 12:35, Peter Maydell wrote:
> On Sat, 13 Jul 2024 at 17:04, SamJakob <me@samjakob.com> wrote:
>>
>>          It is common practice when implementing double-buffering
>>          on VideoCore to do so by multiplying the height of the
>>          virtual buffer by the number of virtual screens desired
>>          (i.e., two - in the case of double-bufferring).
>>
>>          At present, this won't work in QEMU because the logic in
>>          fb_use_offsets require that both the virtual width and
>>          height exceed their physical counterparts.
>>
>>          This appears to be unintentional/a typo and indeed the
>>          comment states; "Experimentally, the hardware seems to
>>          do this only if the viewport size is larger than the
>>          physical screen". The viewport/virtual size would be
>>          larger than the physical size if either virtual dimension
>>          were larger than their physical counterparts and not
>>          necessarily both.
>>
>> Signed-off-by: SamJakob <me@samjakob.com>
> 
> Thanks for this bugfix; I've applied it to my target-arm.next
> queue and it should get upstream within a week or so.

Since I'm seeing 2 times the same patch, adding R-b again on
this one:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

(BTW Peter the commit description is mis-aligned, if you
don't mind, correcting it while applying would be appreciated!)

Thanks,

Phil.
