Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF9C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:21:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiMTP-0006ql-7Z; Sat, 02 Aug 2025 20:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiMCR-0007PE-KX
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 20:03:39 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiMCO-0000qU-Gb
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 20:03:39 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-710e344bbf9so20696337b3.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754179415; x=1754784215; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cqdTsJsQpSAF8yNj+ImSJNXn2g68v69bka0DncLxVPI=;
 b=dFmsZdRjGzUd9yByRm2K0bQCX6YgBZRW/oR3l/5qWjyf+5SezJzg8I1KyC/OH/M6U3
 8K6upjV6+KYbJyrNE5+vRSglZnRwyX4YArAY7ULDfiWNLWaN8JsF5kLNj2HJY9zfSeDe
 1JyKg9gFxsURsrpF9ZUOWc1wa2NKa26CXjbEGPmVTvLA7jXZmg0A0wpdT84g0Aez5R3Q
 BS3SuU3xHo2dy7SbHcHJpFgg4MjaypwaAPS1/v86HEWfsCay9gcrSvRi3G8c2/v2eaUE
 5VEB8E3FHgcG81JuVPJG0GlZvgv3n1zyWYV6hbxLhhU0tTrz3N0SMpt+0xaWIIDFrnlc
 0eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754179415; x=1754784215;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cqdTsJsQpSAF8yNj+ImSJNXn2g68v69bka0DncLxVPI=;
 b=l+nziz7Ht93Q8muwQJDwvgtzN3AGf5D033APzaDck4p2CsDXtN295YR6h8LtBNRtLI
 /CP9zcc3WEoAJEs3itBmYYAiKvsLdWj2JlBer6skhWONKINS+0ytaqMkmMso946Ci3VS
 5RlEXw/XGqwRgZKSR970B5BSjl00nxugobZTwnj7qrncBQGXRLaciaQlOgP1leM6FpUP
 FcKhyZ6Ohx3Z6yF8x3Z25/Z8mjdL+NEYQTWGACqZW45P87rTL+Z5O7CCrFlLlu77Zwgw
 IzZMZmeYYKeFhIm7tGGmxY08WYnvYTgjFW4omHRwV9ryOzA3q0LvUlxq0yBLknmoYspT
 h7SQ==
X-Gm-Message-State: AOJu0Ywzn+6GQhbAXVt3x7sIEfrhfcRknlD7mSIvLkwy2o52eWacD3Ui
 Yjko68Zj3wfXDpOPRTx9kEiIGBGPSfRNG+AUPvuhf+dqqBTyxobcnOtn7piBauvCHudWtvgbHjv
 y9tCzEu4=
X-Gm-Gg: ASbGncsiFBrURD8dMBKFHMzY0A2hDq33SZdyvWPI0xtzkx3nM5Ek509xSHftiaWvky7
 +RUm19o0zCnEb7Sl5WFb77JmS/YqI5g2RV33w5K0m//b+jONBxnhAv5PtffMJMUXBEsU9u6LTtm
 blvjshmHxhOJpc+YlAgHr38Kisg7iThucndoaKlGiqsZHy/xQr6IDeIIQBcymqrDXr0AZlmruw5
 G6rkvD9Is/gt85gpwUcVpDHDzk+dAaoX3vj48hVTqbnig35JrjCFZSqj3YBfdxCypZgP31EoqJo
 URhzbusUKWMBJK5MqjuC7zFK1KSxwvARjWN+MAsqy9F7Y4ZRd2/a6lqyeUCWcACDdLCcbmDdady
 Vh+tn5Vbwbc+rqKjdLidh38aQKVDPJBboI+ayrQ7cnJ/7s1iM8917hffl1Vvb9SjXjTcdmpEbmz
 o=
X-Google-Smtp-Source: AGHT+IE83T21+t2TDeD9n6L2wyCglZN8kQvcanAiXx10oRMgNM9BwG395ThBA2Nndxfox8LRDYuf2w==
X-Received: by 2002:a05:690c:2e86:b0:71a:28aa:3283 with SMTP id
 00721157ae682-71b7f08f850mr42388237b3.33.1754179415028; 
 Sat, 02 Aug 2025 17:03:35 -0700 (PDT)
Received: from [10.153.194.227] ([172.58.111.133])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a5ce7b5sm18521457b3.71.2025.08.02.17.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Aug 2025 17:03:34 -0700 (PDT)
Message-ID: <23a34997-9fcf-4b0b-b5ee-0a49972897f4@linaro.org>
Date: Sun, 3 Aug 2025 10:03:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] whpx: Move around files before introducing
 AArch64 support
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: "open list:ARM" <qemu-arm@nongnu.org>
References: <20250802081800.76030-1-mohamed@unpredictable.fr>
 <20250802081800.76030-3-mohamed@unpredictable.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250802081800.76030-3-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1136.google.com
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

On 8/2/25 18:17, Mohamed Mediouni wrote:
> Switch to a design where we can share whpx code between x86 and AArch64 when it makes sense to do so.
> 
> Signed-off-by: Mohamed Mediouni<mohamed@unpredictable.fr>
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS                                           | 2 ++
>   accel/meson.build                                     | 1 +
>   accel/whpx/meson.build                                | 6 ++++++
>   {target/i386 => accel}/whpx/whpx-accel-ops.c          | 4 ++--
>   {target/i386/whpx => include/system}/whpx-accel-ops.h | 0
>   target/i386/whpx/meson.build                          | 1 -
>   target/i386/whpx/whpx-all.c                           | 4 ++--
>   target/i386/whpx/whpx-internal.h                      | 1 +
>   8 files changed, 14 insertions(+), 5 deletions(-)
>   create mode 100644 accel/whpx/meson.build
>   rename {target/i386 => accel}/whpx/whpx-accel-ops.c (97%)
>   rename {target/i386/whpx => include/system}/whpx-accel-ops.h (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

