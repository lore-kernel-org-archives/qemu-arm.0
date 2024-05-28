Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp50273ejk;
        Tue, 28 May 2024 09:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLvkwu6CEMlzP6Ua6lum6cb6s6N/x9Qug7T6VjUFNGez/kY83MBVQz4Uv8VffWclDB9M0fy2UDH9fpgtdXVEkuSsap5sSr
X-Google-Smtp-Source: AGHT+IERY8BZlDHQRrQo1dM/1SK8lSTv7PK0yCkAQ0zvo7YWMEe/ewkS3dQcCNcf3cSCcoY1LgsB
X-Received: by 2002:a05:6214:4b01:b0:6a0:e54b:ab46 with SMTP id 6a1803df08f44-6abccfad6c4mr160596796d6.47.1716912297227;
        Tue, 28 May 2024 09:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912297; cv=none;
        d=google.com; s=arc-20160816;
        b=wQlbDioIr2SY8LU3oABqxfUetNf3fJpvgI+Mh0Fkj1aw5i8k8m9wylGB/dJbgsvyVY
         W7y7Z/sHRQUQPXP2UgtPWPNcb+AA8fiYn0u4W4WttuAK/EBxgScmyOYFhr0kyQ7Cs7Y8
         BybIvkF4qFWc4f5726WaWGgTS7y3DgKI8bZz46XTBnU8ir8S0VsemtA2ChJ+bfydPacD
         LmdetLI5m9jIkDeEM9CW96Va+31LiXR/HM+Q+rH8BgcTvaoba7veTRT7M79CuGgnM9Qp
         e6Y1ECRORj75kCO8Ud8TMTj3TMkQtBc5mUr18sZVjY24+juWEgdSNM3+YlZMicMU2k4f
         IkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nFxJYvNldHwZrVCu+fFet6j2GNc53uIscAyjPU2nE/0=;
        fh=fbvsKDBENL2YPYurhbA1JjNfgQDDJXYKEsFgphHXtbI=;
        b=NA23Ub+8DwU3QBnTJ2r3gmHSIR3893P6pMTKIz87RfBxw80tf/mN0K626In9+jB8Hn
         peUxKI4MXguq9dldpC8748yG1mGc8LD0CAbJfE1r4mSBormNMk+Wxaa8bbONpInzLxMm
         jBND/PYjRl9UkDKfg+vEcNtCFqmcrIIm4gRQ6lpBN6to6YvUiOQPnRmXljwdXgrGARf6
         proycwqNThqzgCZXyw2QTOdJMW2FW8jQ4M3zRu4g0ihgDU5HXnafGIxopK4POPrzyaj0
         2o/pdET8/wECUQpTrXlqrLdxQc9TfwK0WVtgRrlSllATFbjhiJlvDkeSaUibJWlQtZBp
         JjqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4ZV6FRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac06f53299si108311966d6.32.2024.05.28.09.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4ZV6FRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzJZ-0000rV-1k; Tue, 28 May 2024 12:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzJE-0000Q0-7b
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:04:25 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzJC-0007ve-9d
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:04:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f463so580029a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912250; x=1717517050; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFxJYvNldHwZrVCu+fFet6j2GNc53uIscAyjPU2nE/0=;
 b=F4ZV6FRYB+9/PiMeSEmE0DVbFwPkfZIxVy7IMDk5biHHVx16j5mJ1qz/TSQsCBcuaz
 tiMJEUgHpu8DxGV9aTVHQHZ0PG30W75hoyEAq84nrEC27vLMMS6n8LflJc2O1IaHxNlp
 4MkfEtzlTvnx5cjGxGIk3ziS9irY+rpENqnq+1Qk+2M5YMx7Hhei5Z0/tzlIpjFf172A
 shQCrkqNUJ7ImT8HsnlaAlYtHvHNJ30JxygHCs1KOzD1lgUvXi3XrHkhzA8BqJHYYz6r
 94uWZkAEGJmHnGbLQZsywLPZ+OB99pKIYpTbdPaAUrhfgJVr1SDBMMYptSjgq2ylfWWY
 35Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912250; x=1717517050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFxJYvNldHwZrVCu+fFet6j2GNc53uIscAyjPU2nE/0=;
 b=U3sFp/FJAopAFcSQcMIwNyF3ZEkfH8ymPNcV7nobAscBhCcc97ZURRuBGL73XZmraa
 Hqf6c43W4vVNviox6oUgQ0ZUtKe4OvoKxC1ODu81IPjB4HXRQa4wsRwTwi9uhbQw1PbR
 iMod+DA8CQCsSkDLGriQtqlB9tiqjT4fqZMsxvB8LEdmZYIHqDg4zaT/TvlXVeyvzrLT
 YNlYJmVggVwXj66vB/7SFcNy7sG4UzGBuhPcaemGGi5r2aJqU3VaJc5OvYmiTqfVZ1dj
 NwFI2XI1YDgCT0bbDILuSBY5PRRn17eZ4+pEJKWuI1NmBBC62f+SWdVFR0W8Wi+Zyqy8
 4caQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOLg7BuTl9v7O1cvUVBo+IyYcThEDyq0pJw2J8RPi71+Jx/P//mCJIas8abKNIAJ2uxl4pIvqDG6nxrUSmWgEwG4jg
X-Gm-Message-State: AOJu0YyDpAE7WeHsz9pFRxwUyEHDMaqnFUs2TwIYzgafnn1VSOxoOdZG
 WodQocdlKB1P8q1Fj0n9XSYdkqTR5c80t7XmZYL68hHOBrYJcSnR5z43vArQGdOBbbAYJN+K25I
 Zl+oWYgsqiQCz9JVMHr5+9D3GmRHkVad0d6XFkQ==
X-Received: by 2002:a50:d55b:0:b0:578:631b:3090 with SMTP id
 4fb4d7f45d1cf-578631b3ad1mr8469202a12.33.1716912250292; Tue, 28 May 2024
 09:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-59-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:03:59 +0100
Message-ID: <CAFEAcA9sNmyL=+oQwvJCf+xUu=5=NHRxgWGZNFgxVyTZM4gpxw@mail.gmail.com>
Subject: Re: [PATCH v2 58/67] target/arm: Convert SRHADD, URHADD to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: FrYZ0kCSMF3j

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
