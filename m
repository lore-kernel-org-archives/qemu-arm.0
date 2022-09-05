Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2590094ejh;
        Mon, 5 Sep 2022 14:08:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tNd1CvI+nItbsHVycAMJhUb+v6tqcyP6uqtLzwuVPmrau3PWTsyewFSVfTNJLMQRWCpmE
X-Received: by 2002:ac8:7779:0:b0:344:7053:ac3 with SMTP id h25-20020ac87779000000b0034470530ac3mr40257724qtu.686.1662412098565;
        Mon, 05 Sep 2022 14:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662412098; cv=none;
        d=google.com; s=arc-20160816;
        b=JynIfXr4JF2Xd1m498l69KTCXETX3V8xrn5eZas8ahZxOdvROL7J1E95+CBskigB6Z
         7DKm+etNJ17UcKtL3mCqXdIdKYfjewnyB+1NEDv5GT8l0RrtzvEaPxc1JTuONUjW+v1G
         /w5ph4lU4YA4uZnlmHVslvM97twCEH9SW4M8ui9r2wL/y7ee/oaSysmOBesbKUzoCEuA
         wCXrTXkJpP3jxaRDCK5XAATXKAW2qWBuS/AF33EOhDMASHWL3pZ1JkbXURDANrasQTOV
         h7E80NHAJVTzngh/4hJ3+vS7WPgOCFmZI77Ug06csAFS7IL6i1kbCe2HdXqdxpzY2vXT
         i6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ysPKYcOYbS8qBkbLjovObQgWFMhyQQrcQ9Fu+ttfIX8=;
        b=oYVDmknSRltPfubhS8cGbn1RaIjAr3ALzNcze+PD4+9cJzP4YNzGZxPMraT42m3PjW
         oMGcRVsNEZjJXHFiEHAvVGaclUpGw8wF2TU29MKNGUgaHQkGBjNmeUWxXBhWNmb8oHiM
         upA5d5XF3GA96wj0L5Fu74tJTpOvxUjbYmyoWFx/Kvi3z3Ehc0R/oDVUetQNOU+wAZKt
         xEyi9A83Wpd6aiRucsw6vsfpDuk3C1QotnA285ShvA4poSssBmKiHFVyeywGEjdbjkVZ
         B1ukrhgSov97urk76Ups8yEfNw8B+JJ3GPycH6kO9zkTnjQOvZ5VzfBJ76qUeIo2hJuX
         G06Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OBg3wmdN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020a05620a0b1900b006bb58bae74bsi5023228qkg.494.2022.09.05.14.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 14:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OBg3wmdN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVJKM-0003uy-2I
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 17:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJJe-0003rU-Tr; Mon, 05 Sep 2022 17:07:35 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJJd-0002Js-BR; Mon, 05 Sep 2022 17:07:34 -0400
Received: by mail-pg1-x535.google.com with SMTP id bh13so8910885pgb.4;
 Mon, 05 Sep 2022 14:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ysPKYcOYbS8qBkbLjovObQgWFMhyQQrcQ9Fu+ttfIX8=;
 b=OBg3wmdNpS04BdBG4JhkAxijYmvMXjBgjj2r4VQaYKAla42JJqkOHbFIukY8f28unx
 c/iA8I5S0KBsfQspPlW1pU4mgYFWyqSY3tV3FsIM3k775nWiXfGL7ouS4iv69dpNreX0
 HvILEbXqKHFpGUOXAel/TFI6F8ryYQ30qq9aIdnGPcYNtfNMRwIFFiLP/VczLzYNS3cm
 D4/xcUqb30h4tBpnNaghXpJKSWEpSn9G1zsGeo+99lww1eNElcYTayJzAaxiT0PtegGx
 jiBrq60wxkrqS9gQJhfxcqe8fcVJ3hrZWJD35gTswDQqfgFSBqC3qLegA5SBaNSkuNyg
 +NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ysPKYcOYbS8qBkbLjovObQgWFMhyQQrcQ9Fu+ttfIX8=;
 b=JLWZV8jvzfUvfzrW8Pxb/O3wa5lKJ3v3i6Im8DlH/QyrHosXGFk651/XvdpRGGRBPB
 6BtVLcoIyOCCb2MX6uzJbngq3UdsXTmBZefhSuFippqmGWnXA4MZr4e3QgrCuLXfXDX5
 KcUXefPruBnXreIRsPLbM/Kj+Dmz07MUxhYQUY83oBfb7X+86K8r48+IcsP1bFhiSAOL
 mxrFEZvEJDh+y/FRjDV8dw9rSDi1GDSpGMAyjvBh+9wTP5LL35HfhyzDHryUSW4Dtw6i
 A7r6ZUrVQw3gSCqWfqfWGTsZMPw8sJJgDoidCo+eQ1REkc5uIvbXsZ6FgKKtmdSKamUx
 CaNw==
X-Gm-Message-State: ACgBeo2p/J7o+M1rtBNfTMiJCPqCsW7dAAzZOG/jtxxtRp3oeQ/w2Ir7
 BXIlp7in11lT/UqjaYGvJpc=
X-Received: by 2002:a63:fc50:0:b0:427:a666:bfe3 with SMTP id
 r16-20020a63fc50000000b00427a666bfe3mr41721480pgk.547.1662412051625; 
 Mon, 05 Sep 2022 14:07:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d61-20020a17090a6f4300b001fbc118e8cdsm1979085pjk.57.2022.09.05.14.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:07:30 -0700 (PDT)
Message-ID: <92abbc19-1ae7-7745-7119-880142a06718@amsat.org>
Date: Mon, 5 Sep 2022 23:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/6] accel/tcg: Drop addr member from SavedIOTLB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-3-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: KnHDAcvvCQdH

On 5/9/22 22:22, Richard Henderson wrote:
> This field is only written, not read; remove it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h | 1 -
>   accel/tcg/cputlb.c    | 7 +++----
>   2 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
