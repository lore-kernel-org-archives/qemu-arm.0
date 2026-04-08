Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F5A10F996A
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:44:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXqS-00046o-7L; Wed, 08 Apr 2026 14:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAXqM-0003MG-19
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:41:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAOLz-0000yN-Q6
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 04:33:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so16014795e9.3
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775637218; x=1776242018; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lTiyfeoSbM6oi9Y2ehhT2k0lqRLvboHUmVyhx3Xj1x8=;
 b=vf1Hral6nd1z1WluzDaPsFtTHl7QAWNReTJVOompq0UAkIqrdXp7qk9gTtlpKVVMZz
 XmhH4m6zWY47j7Uxs21779zCgtzDDb1K0MJp/pFLudwNKKC9MlCrcCvzByuNd5pKtUug
 zFDutwY9JnpIq3zwpPifsqXIQJnrwULDgQNgmFJcxair3F7KnJyypiVWbrOVT07W8tf3
 w4QXzlbib1pkRd4kOLQwfI3qJRSVIpzsEpMiPxAV0HCqykEmIFaFofNbqECvJzoBJZpN
 0P9zDn4aC20W3WuStCGAaFZssG5N1SFqHqv/uwonohSX4ZocDFIeWTlYd5kbWsqrmISj
 gK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637218; x=1776242018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTiyfeoSbM6oi9Y2ehhT2k0lqRLvboHUmVyhx3Xj1x8=;
 b=pUqKy85008odAumujBC2LwT1y9KmLwjReTwGnlKw+hme1JqYBwqQdCXtYJcxc1tqrK
 10RnmMKB3ASRqo6gvUzDA868MkQ+wCr6ZxtPK28lVQa++X8nUCqzY2+61CzSrftpZhAW
 RvejEMRhoqlAenn2qRxKZT/vtZ1SYmi/fRdiU+Cpz+PVSM3H7Lqwuu8H7S6ps8DfM2w2
 TNULnCkh4fmWTvQFCOoWtlCgx8jkSTglzJoQPtJHCy+rjXMGSDq9CPEOoGN4s8+QVpWc
 ehvs9sy9dnwWLuiBS4r87GISxJcl4KCoF+qrduC6O0qK4vGTsvaP5ZVv995RAeS26Hpo
 xi5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAYp8bxJEYq3PIkCf44Ygit18ngb3JswRtYr6IOkAzbH9n4fjkEi4iu0W2Y/51bxwudxmyXOLiEA==@nongnu.org
X-Gm-Message-State: AOJu0YyU7cFcmWeOIsehUiPfXlhg1ec9eXkRNg28y+pfdI2WiP5pe7Ze
 BKXUvx/nvb0+w0Z4YFOX3t93hHBYJXJY4yxqoir+eI4DIRDCVPVX6olw4Znh2RSlNjc=
X-Gm-Gg: AeBDieu85dS+1Avb9tABSh8xXfON5z7meivL8TpVTsBO3rnho+67qwhw+aRF+yvROKk
 I6zT79IY5ZzAGBuwZPaZDQmvs/bYGzVwe6j0JzeLdJ51zICw9q9DfhBW7ddnRwPx0+f3flHAdTQ
 a0FQlIj36aYSLlbVVGlZka4eiACHasqPh0NAwWRXdXvcQ322yTqddBB+gHE7BU2l7qIi9ab5U2A
 3uLDx4PdCLQDg7lBDTIE0X1SXwsmLsnyDHh4ZI5v8uucAzVoPIg55NVhnxInXjn1ev/A5+nYQBG
 GErKT5iojHgsxrYgexJWsusISCObRa4TD/E14DUUqihfY4BQ0PGW4kmNfAsPEjmiNe8eenhQXjv
 LgzfqVjwvilbFyiIzIZo2fS6YaOyqjVfLMDv5TTgomojVmetmKvtH6uEg9/IFUndBtfadGb0YG/
 WIdeQJxYopt1y9Cxl7An4uNsUHjmD9EIZP5ZMxBtm113osrRSZcIfEFmecFNepbuf4nw==
X-Received: by 2002:a05:600c:4886:b0:488:a797:f0ac with SMTP id
 5b1f17b1804b1-488a797f2d4mr115435815e9.28.1775637218067; 
 Wed, 08 Apr 2026 01:33:38 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5d854ebsm13106715e9.19.2026.04.08.01.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 01:33:37 -0700 (PDT)
Message-ID: <6e4dae05-7d24-4cbe-8653-97890d87706a@linaro.org>
Date: Wed, 8 Apr 2026 10:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 17/21] target/arm/tcg/arm_ldst.h: merge in translate.c
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
 <20260407222208.271838-18-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407222208.271838-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/4/26 00:22, Pierrick Bouvier wrote:
> Only translate.c uses those functions, thus move them back to this file.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/arm_ldst.h  | 47 --------------------------------------
>   target/arm/tcg/translate.c | 24 ++++++++++++++++++-
>   2 files changed, 23 insertions(+), 48 deletions(-)

As per v10:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


