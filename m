Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1853976lfc;
        Fri, 28 Aug 2020 16:13:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWfbnXSxW2yJJEm/qrt1DoK96Bj/cA6+RhvxnMeex82P4VbEBn/+ae+mTzFrqd+7SrXeZ7
X-Received: by 2002:a25:14c3:: with SMTP id 186mr5963644ybu.114.1598656418240;
        Fri, 28 Aug 2020 16:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656418; cv=none;
        d=google.com; s=arc-20160816;
        b=tw+RoOLr2AB+KtXSpPy95MD6/zybEFW4PbB2mf3SEzeZkWfOAJeZ+MkbpX9FFh/hEa
         WIo9KlxZl0Sxq+vHXuNvroV3BC1eX2jU2sXVVS2f4TUwJBTK+P3GGYgpibaXo4mtLRtm
         LcmNw6CW/Z9NnYgbxMEUhjOpDjDZ5c0YpTLINN4B0VAHj2VI62M2naqybLy4n5yZN4Yd
         uKV+oBczUGP8MRGSPi4wRzV5CD8t/v2bfUTyjtdQKLNTIRiIiOUGOuM7/mHOTXk1bKl0
         K8lUKGUyLOJdp161/l+0VRhxyYK/otCGQS0kSvFf0j6gNxhG05M+goO2TaUrj7pl8/24
         0JdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=G96Swk1Bj3MHCv5uo/EPexivUAIliibw0hEPmaMVLWo=;
        b=fsAoXCBfOdIq5sk+IwIcyw+UYrnj5hyMziZFzi2nMOJ+KI1Q6OCgqU+QI9BwC66r1M
         JYVvwdnngc/5Z2ieMvgRP+CKP84gI+HeGRba74oXNQmKtvd2/ARv7vN+/WIOhGay11rv
         Fh0n1xkfuU2m/YlK/uvANUeWHvLo/2hOGohMowKm3n35noIihi2s+1BInmHvRLT9qDfN
         iTRgyfGNaBcccjbqLf2/NYzhCXwY3JQPSrvsR8Ta53xSaHWmdpgeD1IPgXa84nszf7bD
         BnqLHaHI8EpRTL+l0FRkHN+b3q4jcMg+r1jzfEguK4EQFEomqVYNG4K1gCkO/HrruKyq
         VN1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gW55q9yS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 200si648243ybe.193.2020.08.28.16.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gW55q9yS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnYv-0003iM-Ll
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnYo-0003i9-DW
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:13:30 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnYm-0005IQ-SB
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:13:30 -0400
Received: by mail-pg1-x544.google.com with SMTP id i10so1143562pgk.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G96Swk1Bj3MHCv5uo/EPexivUAIliibw0hEPmaMVLWo=;
 b=gW55q9ySiu1bS3RLSRJ71G8Q923l9JZYXrRFJ2eeQze0ySy7V5a7qqoNdri9WHZVu5
 H3ZNWMAekWCWcstQMj/X1WPk1Q/mDcXVnBKr9u8gQi9NvU+D4dEOjh4wRg4TFHCYaHWE
 t87TK7Kj7v0POCN8BeLVCKyCk/h2qxdae4ssrsGO1fMmNscvFDOr3cxUhBkrTsrARd4D
 0RvzmQc/dBoqJzKdwuHp3jPJ+JQ/qcKX78ycalkYMr+wh3Hfhi0Sf5g+2GecitZUgD6y
 H4XTsBpRyh45xfGH+qAHIER4CBegrfS984ntBEFbJ2XKSqbTWuPKdsQZSgwaxM1wAq23
 rTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G96Swk1Bj3MHCv5uo/EPexivUAIliibw0hEPmaMVLWo=;
 b=fY86XTjYOWSQXs+4TlL/urXXxOrB/rECwvyylhP5kOEVwkus8uc7e3SG3/0yqmbeIU
 Rhq1nSj+K23tchVriXCLD/IH8zk+FtdzfSM7CmxXvjJPTqluzBgK4hkQkMqgwPZLUkkS
 Ourhjvwqxuc8OIjxHqId9WqgHPNADCg4F0zuPdAAhJ6Q1dqgjGTK4CGriceWou9RP6p9
 WHo9rzxMpss5JdHcPyMXTMpBId4w4ESwS6jNKQGM7DmIbQpkF9QKYI7m1eWIPDCl6wLg
 fKE1fNUMG3hnY8wub8+rnNC9WCj9/IB7HsWs+QRAO5FzJG6XtMT9GKooNKdEKIY71RyY
 FzHA==
X-Gm-Message-State: AOAM5306eQYosB0dB1ecRGTzvNDNl98kCkeNbXfNd794DRCBeflVuk+w
 A5ZBwPhVoS5lALWfVPoOY8XnopjkBU6eow==
X-Received: by 2002:a63:b24b:: with SMTP id t11mr737266pgo.233.1598656407582; 
 Fri, 28 Aug 2020 16:13:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x19sm505288pfq.43.2020.08.28.16.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:13:26 -0700 (PDT)
Subject: Re: [PATCH v2 39/45] target/arm: Implement fp16 for Neon VCVT with
 rounding modes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2321e5f-a96d-57fb-aa28-497b213df11a@linaro.org>
Date: Fri, 28 Aug 2020 16:13:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: Dq7EHA76UJM1

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon VCVT with-specified-rounding-mode instructions
> to gvec, and use this to implement fp16 support for them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |   5 ++
>  target/arm/vec_helper.c         |  23 +++++++
>  target/arm/translate-neon.c.inc | 103 +++++++++++---------------------
>  3 files changed, 64 insertions(+), 67 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

