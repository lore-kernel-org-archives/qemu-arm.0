Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2620317lfb;
        Wed, 23 Mar 2022 11:31:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqEOCVyk4u6GDZPfbkGq1ZEYKCGtSdpQ8lDzwX2aI6+irlfDMNJ1cgwbDrt1rkiZusbn5P
X-Received: by 2002:a81:5a57:0:b0:2dc:374c:4b92 with SMTP id o84-20020a815a57000000b002dc374c4b92mr1260835ywb.385.1648060316644;
        Wed, 23 Mar 2022 11:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648060316; cv=none;
        d=google.com; s=arc-20160816;
        b=OnRD3IhMw68eoNL9P17Ju8DigGB897XIxxURnrkkqFWFK/ybVCwqMc5fASmYa0hgGh
         cCPGEMlvcszsp1ESTThDrtzOjFlbTlLeXFdz9vd8h7T8L9BoE/qCYBvSk7SkAPVTs+gp
         53kbN6khr7ANgP0vtpcAjzmzGoh5w9XWfdS4YvWyCcJbThwqqBzl81/47eNAFBKbH96k
         GWKghY6bOtNr5CysfKJTCUZvQZvD1ABFpzeZddfjeN9owqbNvTmpZouHsDk5c4FE80km
         bg4vUmThomdJTb4vPZjcdrYAGK+36IIQoR6xd1bU6lKhxUdZB0DusALeU93c6shynHdn
         A3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=aArRzOVKL81IsS8tCXPW0PXbbh/Tp4r4LQPIubAuC0c=;
        b=SOsGXRQ1AL/5KpW7XjmYpdSNA7BCldpAz9mn8iwmy1mkrCDG+Tg+0Asq07fce0sEfU
         N1ui87c9FEVEnTDy7NkiWnxYqcjaH88YgXvchXyK3KMnboIMHmjLGdrNljl561cgiEKv
         wXgYpcj3TwtcGNEz8/iJaOU/gSw/wKTc1dZayo0R+0pNhuFdIJZK2pFoclHzul5WBYno
         NawJOCzf9AiBDQf8Q06nJD2iqdWv7Ljh6wu7ouw/+rg5HxyNqqpyHXKSep8qgiFgFEkc
         ootZumnBgizcTeWR3+N7BBLsCIaG09oz7CoRzv1h2o/U0n6ig90BHNK30YFfHP+a3J7k
         ZeaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GIQ0Po6Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a81d54c000000b002e5bb9dcb66si12607084ywj.495.2022.03.23.11.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 11:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GIQ0Po6Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX5lz-00083Z-VJ
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 14:31:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5ja-0006Gk-PP
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:29:26 -0400
Received: from [2607:f8b0:4864:20::430] (port=40731
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5jZ-0003JX-9E
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:29:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id d19so2113948pfv.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aArRzOVKL81IsS8tCXPW0PXbbh/Tp4r4LQPIubAuC0c=;
 b=GIQ0Po6Zmncg7Q15p7+5+hWjKXaDwHv2VsHIss0JvJZSUp4V1AexwLLWkpJPQKcl/B
 gMu3HkvJY+89eaLBW5r5zbs+QSagni0nH252ostoLN6Sx5pvbgdU8/oHMUOa3p5mc0Ez
 gQwNZvGoNUUFYSKOUuxGeqTshkjrpYNl1+SqstrOnYUhmqaHoYKVd8yFR5pQ+83G678C
 Gn4GNPiwRWRc+neafnFET6wMn9Ige+zLFwqBfCwA4pns4jiPPeuACltqz5iOakaUEnD+
 ek6KV3xB4xKruZegij8w/LIO/taubS6xmqEZffpLpk05W1ttT20QkyWBufllfgNgK2gg
 5YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aArRzOVKL81IsS8tCXPW0PXbbh/Tp4r4LQPIubAuC0c=;
 b=BkNX7P7aU1so1SQreIrrpHU9Jn3VjdYKj+XkYruxIlAPg2PonSl1F1azyiIak4P0qx
 myXH3dBn5J6uDeOWSu/Hf98bkYU8oBitWnkyJupZu6g4a/IMjWnZyWIAcQrLb4sQfp0N
 D58WrXnarM3OlqrsL2Aug/rfg0M/37vV0pEJpPCx6lZXWiDk8ATHtGrjR/Xa5j8GnfuY
 y0tO/OL2N7fvE4YEcsf4sK7+Zo6OqtsmS/0rf3A3m7MZEHm98dsAgbWV1BEiklkQal6r
 6COX4EJ8Y0O8TJo7xg0XQcozupgA6pN4KfYz3ji5B5YBWlVl6Axb3aMb+2fmDEtJZpBU
 kUbg==
X-Gm-Message-State: AOAM532reZ/B3zPkEnwUECnIgH88mMeV0FkVueVxJ4FS1Lh6komWdnj0
 FXrrVo6GNyQN8sJeWNjApKZeIA==
X-Received: by 2002:a65:550a:0:b0:374:5324:c32d with SMTP id
 f10-20020a65550a000000b003745324c32dmr923331pgr.61.1648060163731; 
 Wed, 23 Mar 2022 11:29:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm571214pfj.128.2022.03.23.11.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:29:23 -0700 (PDT)
Message-ID: <bb0e6b91-f1e1-e92c-af25-31978eb3131d@linaro.org>
Date: Wed, 23 Mar 2022 11:29:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 23/32] include: move target page bits declaration to
 page-vary.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-24-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-24-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 31IO1vUqDou0

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Since the implementation unit is page-vary.c.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/exec/page-vary.h | 18 ++++++++++++++++++
>   include/qemu-common.h    | 17 -----------------
>   page-vary.c              |  2 +-
>   softmmu/physmem.c        |  2 +-
>   softmmu/vl.c             |  1 +
>   target/arm/cpu.c         |  2 +-
>   6 files changed, 22 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
