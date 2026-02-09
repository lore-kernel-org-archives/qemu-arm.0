Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F987EF070B
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 04:51:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpJEp-0007RI-2y; Sun, 08 Feb 2026 23:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJEm-0007Qc-S8
 for qemu-arm@nongnu.org; Sun, 08 Feb 2026 23:51:04 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJEl-0003rT-A3
 for qemu-arm@nongnu.org; Sun, 08 Feb 2026 23:51:04 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c6788f3db37so1446562a12.1
 for <qemu-arm@nongnu.org>; Sun, 08 Feb 2026 20:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770612661; x=1771217461; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sYxljEzI4qhILVqWZJsPbUTbIJXqqc+i0wg7PjR7g5w=;
 b=fLIbn2cc9Cz9WvuWZDdxqUIKlqYIpACJ1PM5wX98Up1/SAiBB94xdfEZCA0Ejp755A
 Kh3LHOC0WUQMsvumLvvJAbPe+9ZzxRrHBf/jDmjqXYO33O/hJyLOIkrp0rvYxfmoGNAJ
 nKXSkdOH0mCk8JS4bM1KFuReuKuzNpTuZLFJIx/lL7n1jPVD9Zkj91i+Zy5kxxP/Pqz2
 j73a0i0I7aukj8RwiizMmkt/2X/qweTPTsO87aS84cBlG3T6ctgdNkFXGL3m0QMoi1rc
 VFhUVWpDZ7QjkWYpCLmPQA7sUvKXepCUwr6H3/RWtTLYKBA/Vu5xY4aWfmi8ij+LUDAE
 YV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770612661; x=1771217461;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sYxljEzI4qhILVqWZJsPbUTbIJXqqc+i0wg7PjR7g5w=;
 b=Ckujm8F1tcvcV4jhc8ZDQSReYH6YfmRkucCV+jUmf41BkvJ/EpTsl3WgC5Qma5oZhz
 jCgp7628gNNXGMqyKuYISSxAk6k9sZvLLodZ+zWEE5QrV7wDHR1no2kOqfK3/UU2eq8m
 TySIet7LE50IuQ+wD7JASN+mafm6/e1vAU/kpZ4eVBeVg6rdkub4L3J+5X93fEGWybkt
 s3Kw9gPrhmojSM7iLxYzxsfiandegDGIOFOkWMThbyeqXOSmpp+4iHkK/CfX7W9IlwpX
 io68hhqb/uPai9XFyjcHreR/efWQ53S/BxFkOk6mScVtOohN36sd+BCBxGzR7MO0lKOM
 Eruw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEKEL95MjfVDSUYxBKZ7D9FncNeoKdujkFdCSJx1tZ9NlEJv3JMxZqXy1iGuicM+pUG99rLGBnrQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyn6Xr4T+HThK8LXokQyKSVRejO4uqUcdSX01otIIuJL2WiiqrF
 08IZ7iG1BoTZgczORj2WUWz3hvaka6GUflp/Mgnsb3wJyMOGyqSfHbHkGedWby8o9OA=
X-Gm-Gg: AZuq6aJ9lv0ui5sWiLew58C4e1M8QWOZfbzLhRlj1fCsSUwzU5Z2lLwSWDULIWNn6hD
 hteXB960CWEaB03XBxPngJJ1bi0x6qFHkA1Z8MZAsi1esanYOpfq0LAJcg6D337ChxJXrQnGlNG
 xYifvaceMJxOUaqunDTLqqjYLINzxbrC9Bx7fzGbZXFstKHbXM/tArQmWh1FrI+x9pZkl9XBqCu
 5ByXmlBx9BecPqXrd18g9XKP3SaIIoGulYPWvBDAn5eNfycXXkKe50+LkKh4laPptBZDoDSZb+C
 /PXNqu1BsCRUGbJlmhu5DsExdDxxfNNQ7hlq7Gy8q+U7+Sgy9LBoO3jd8zH7/DLz+a8mwEdhkxK
 lL8xTYZxxyy3wo8oHyb8PmkwqL0ucd9yQU0NHt3YQS+xUuzmAjqbJD6aYVbh6+wk7yX5rzZ8Vv0
 u5/CHy0bU6F8OasWC0Yt/bjWDLCAOCDrQWKgXaHBgcdfcskqCxIoEgHOMcFc0y/Qc=
X-Received: by 2002:a05:6a21:9206:b0:38d:f084:e349 with SMTP id
 adf61e73a8af0-393ad36aa0amr9240615637.54.1770612661289; 
 Sun, 08 Feb 2026 20:51:01 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:9c4:a3d:914:f9b?
 ([2001:8003:e109:dd00:9c4:a3d:914:f9b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6dcb526676sm7792821a12.12.2026.02.08.20.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 20:51:00 -0800 (PST)
Message-ID: <962bb0ea-0dc0-4cf7-91d0-0269ac645bcb@linaro.org>
Date: Mon, 9 Feb 2026 14:50:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] target/arm: extract helper-sve.h from helper.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260206042150.912578-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/6/26 14:21, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper-sve.h                            | 14 ++++++++++++++
>   target/arm/helper.h                                |  1 -
>   target/arm/tcg/{helper-sve.h => helper-sve-defs.h} |  0
>   target/arm/tcg/gengvec64.c                         |  3 ++-
>   target/arm/tcg/sve_helper.c                        |  3 +++
>   target/arm/tcg/translate-a64.c                     |  1 +
>   target/arm/tcg/translate-sme.c                     |  2 ++
>   target/arm/tcg/translate-sve.c                     |  2 ++
>   target/arm/tcg/vec_helper.c                        |  1 +
>   9 files changed, 25 insertions(+), 2 deletions(-)
>   create mode 100644 target/arm/helper-sve.h
>   rename target/arm/tcg/{helper-sve.h => helper-sve-defs.h} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

