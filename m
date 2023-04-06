Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1348404ejb;
        Thu, 6 Apr 2023 12:36:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350a5bFVU2A0ib8nkOf4/Fe3Cfpak7o0TNF3+w4IxLkZ9FSUs/kSKKVFElkCwIpS59CXB4K9k
X-Received: by 2002:ac8:4e95:0:b0:3e3:9122:78ce with SMTP id 21-20020ac84e95000000b003e3912278cemr14534745qtp.54.1680809770714;
        Thu, 06 Apr 2023 12:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680809770; cv=none;
        d=google.com; s=arc-20160816;
        b=My3VmXOB0noB3NQn6hiAginzWfT4lDWgL/uAUODey6WAHHdv6+Uw8KFWHDCzIEIZwq
         QlkJUtXKiMy1s9j2SUmpNuDFhCKcHh/Dv8oQywqyeRTQhsOJIffc2WhWRkJir3MYzthN
         Ck/aEPlthWgMuXg0TBTOgVFg29QMap0MJT7fIllF/GqqATE1MJDe7KIWw8rUKuzNKhGA
         8eYc74W7veyfu9fCqvm365Rnafs7yMdG4ziDKVe05IXpbNkqaw0Ms55TMQovkEH7xiwM
         lxq4t3hXycxHrAL9utpACRR7xHsd9quEg0iDA97gIy/XL4Vkzolp3cXRUDERyCvRAmrK
         wfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8ZLzuwGqqykiaxEF6DFaoodhCEP5ZYjTzLhoJsO9SWc=;
        b=XHviw3wLzOMexcjUBHsrTepLVVDFQ35KljWyL6XDub64lHN//LR09V752kXbVN3XdE
         l0MCfMawCmlIF4cpDMLsOlTCu5jYZ/qcPeCYxFxcEL85Cs18DY+bD3Gh0JL7hiBbpjLR
         SxKja+8YeKIzhKrTaOyuS/zuJyOz+8YizL2r2Yu1DXI9l84X+xeBBekeqDdCQYRzkS0a
         TSADmvJSRkwy7QOqaCKl0OVA2jC54QAlR7vf4Jk2ctS9GfwTDbQSw1Rf21Ly7QqP4ldk
         /mHTJvnGu+xLe1Hl5nsplBEkF/QWLtePeSrv6rxrVDhJVe/bEHr1I32EMzZhsNALRBtL
         ImbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rztuEfru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r126-20020a37a884000000b00746786b1611si1515970qke.137.2023.04.06.12.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Apr 2023 12:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rztuEfru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkVOw-0006Us-9u; Thu, 06 Apr 2023 15:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVOu-0006U2-BT
 for qemu-arm@nongnu.org; Thu, 06 Apr 2023 15:36:04 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVOn-0007df-KG
 for qemu-arm@nongnu.org; Thu, 06 Apr 2023 15:36:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so41681354pjl.4
 for <qemu-arm@nongnu.org>; Thu, 06 Apr 2023 12:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680809755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ZLzuwGqqykiaxEF6DFaoodhCEP5ZYjTzLhoJsO9SWc=;
 b=rztuEfru4dr/BOHgyJfTgbmzHBxrM3h7J21enzPJxNe/I4lpuNSR8qXb0RvHiTJOrb
 yS2ygQU6CVaQlOGM7eyetXNXR6tMRk4ENaj/so+eKxz32VilTHQNjjJNXYcc38GTBkyX
 +7x/zf+HFxOy2LOMq73aThKiC1dzDlXB/pTkNGP6dOhOXjlmL+JrsXUWXoKUVNpj07KF
 AUuKXV5VJ2katgJzMJt0B7tVRLvpVL+BWOi8iuKKSZZt/UeXQxqRHJEaSzVmL9OoQuvX
 rJoGSmvYaD/JS59sEbIyVihAZ1tr0nLrQnexFkLGJAwjbAWI3TzfGiAjoPZZTvKKa5eG
 OFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680809755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZLzuwGqqykiaxEF6DFaoodhCEP5ZYjTzLhoJsO9SWc=;
 b=WODeSaKex/hltN3L7uGOG+/EJl4D2OQdxbuXIDzqHvILv7sAWg0WVUHVdfBEdIw6CG
 g990/x/IWnbA2fIGddOSY+zWoNYI0GHlJSy0ueIt6xgQbZh/v0AzggVIrS359CO1X9Hm
 9Wxv9jB8xZOepYqdObwVpwgIhB14TyLeBcJQ372oaW+Nm/7YPIcTQ08xyknAS1mH7SfZ
 1aTQag4rSFEqmWlraw0HcVh2qv1NLXxb4yF5DpmGoOm0R08S9SEQD/Ei8rSMPGorT7vz
 EYOXH4Tu9rhKG7jDqK03V4NtL9aEwTpadLyQsZ+VCuA0hhZPo/8mHPR0X1akxyTBuvni
 wtPQ==
X-Gm-Message-State: AAQBX9ePB+5rxFXAeQ+XGg50/hJQkHEgsW7t40SlKZInaAFPy0G9pudA
 Ja9JxFyP6Hfvzi/UgPG7Fj44/A==
X-Received: by 2002:a17:902:e846:b0:1a1:a4eb:54de with SMTP id
 t6-20020a170902e84600b001a1a4eb54demr416952plg.26.1680809755497; 
 Thu, 06 Apr 2023 12:35:55 -0700 (PDT)
Received: from [192.168.0.4] (174-21-65-249.tukw.qwest.net. [174.21.65.249])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902c1d200b0019e8c3cd3f4sm1715055plc.201.2023.04.06.12.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 12:35:55 -0700 (PDT)
Message-ID: <fabfb2ca-d77a-a2a4-1a95-21d466d397fe@linaro.org>
Date: Thu, 6 Apr 2023 12:35:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/arm: Report pauth information to gdb as 'pauth_v2'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luis Machado <luis.machado@arm.com>
References: <20230406150827.3322670-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230406150827.3322670-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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
X-TUID: fOZbsFADwL0K

On 4/6/23 08:08, Peter Maydell wrote:
> So that we can avoid the "older gdb crashes" problem described in
> commit 5787d17a42f7af4 and which caused us to disable reporting pauth
> information via the gdbstub, newer gdb is going to implement support
> for recognizing the pauth information via a new feature name:
>   org.gnu.gdb.aarch64.pauth_v2
> 
> Older gdb won't recognize this feature name, so we can re-enable the
> pauth support under the new name without risking them crashing.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I think the gdb change isn't quite upstream yet, but this is
> for 8.1 so I would expect it to be there by the time we
> get around to committing this patch to QEMU.
> ---
>   target/arm/gdbstub.c      | 9 ++++-----
>   gdb-xml/aarch64-pauth.xml | 2 +-
>   2 files changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
