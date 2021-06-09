Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5659561lfa;
        Wed, 9 Jun 2021 12:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeVfqVK6SzVR4fDlDOYBCTxMZu3hblzJDdNS1CDkh7bz2hFsS6A1xongcpxVLH18ioJHcu
X-Received: by 2002:aa7:cf0f:: with SMTP id a15mr832714edy.313.1623265390651;
        Wed, 09 Jun 2021 12:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623265390; cv=none;
        d=google.com; s=arc-20160816;
        b=bRvB2sEaCTunWi5E1u7uQxUo/6kqDZ8y8bgsPE9+rKzamLG9nsoBxJPA6IuKRv77Za
         vCl7G/ttsRSC7E9T1Tu6g7JjCdxW2u7k9Vkm3zKU2DJBOsduOpbi4bwmuLbG5FgzdiH+
         kdrRbxTpu1TeyD/B3CneXirVz1UjkJNYTBaIGlYnnCWolqNKuu3kt7AT9OORNxWwELwK
         GuzI63z2/lLSJHJIwHYpig1CSyY1hkCiPJiAJsy2hUgGEVD/ZrqEfrnuxk2dRmkLiZjT
         V7jJkQiJ253xFPB1jMm673aIUZ9KlHmmfxzYhpgEpgY1Noa50cl9171XN83zlPnHwSQe
         va4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Hzbk+TioX4mAI7KAZ5m4tcmP/5nWfYCAIEB8XG1n80I=;
        b=jvCRGcK1mHW897xB7g1lb/nO6nm7EfYxNSaxBVgS1GKA24r/3PRjthYAePE7HewY63
         KeQvcKztCU9FvYpXDxMU/9lyEc2fVZfp5sLnylFs6zPM6zVGXrfuXkU7XzqQwUh++1SX
         XaBTH+Yy01eA7pSPc4C/VqkOWR5qko/6IFfNyE9XlmZFjAJq64yA7qLTGlOwIXdoDGS5
         /zuaQf8w1Tezrs+C/IdbherPZP1QBMI9s3laW3pGBL2WmC3pwFvq5F55jMDVgE/al4gd
         cqj+ia34sSbI6TNzJ+XsDWQ52JvxGgNkTW3bombM+Fk9o6ISesfUUj//bdp4Z5Wkt7mN
         4ipA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ux6rlGyP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si346327eds.420.2021.06.09.12.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ux6rlGyP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr3Tp-0001j5-MM
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3P2-00064Z-Aa
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:58:13 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3P0-0000wr-Jj
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:58:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id h16so2006044pjv.2
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Hzbk+TioX4mAI7KAZ5m4tcmP/5nWfYCAIEB8XG1n80I=;
 b=Ux6rlGyPGciQIYCFnKZUW1NVA1bjEzFI0gKq5+udLPq+cujKFkJ5aCt23/O7uv5v38
 ZZnJrk9zLgLJdoP/41aKwJ1pFdN4RSAC0FK2tZ+UqVOFOidSGsUY2EfnV2+Ub9Ul64xK
 PFVufmnZcCbrSsxg/5Ib/BU6fOELpIcG/L29GGU1DBU7JaYPZnL9+4vZNXU0zcIAIH4W
 XHvTCeAhdEG0Dw5xmsbzWv1MUMCcjLW40QzVmwHxp4kCmnbwGBjAGIPRbTM4j5s1QeE0
 7aQ2G8Nu1jK6/pLtB84DQOOyisuCwunkCwImMr8UNxaOC5AYyj1F/pcT04cHY1BR0mZX
 lR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hzbk+TioX4mAI7KAZ5m4tcmP/5nWfYCAIEB8XG1n80I=;
 b=erdQThlVfjhHCRekHLyZrKHvUOSe15IegpPTAj7GOJ6GMEgbccjcburZJoS1jQs6Cf
 USOgEmOiviH/HkuU+NZ0loGE+Hehd7rJksyWhbjacXRIOAhIQ2W8jXoIr1wOAEhW85Z8
 fVjNfY2c4/Nimv+/RrjKOQ8/iadVsSWUkzUj8EBif7UOgR5RY7cgfoDpibaKzPLw5K26
 SxIIh1rc4A+VSQnmEq2XLz59uN8QlGLhYorOgj7a06+mqYIZMv436pojo0lZG3s2oF2v
 TI3VT6IWWHVWjezzyxFXU9jmuZn/gRSitu/61Az++Pe8aUpSC73HPMoZMmyrnUYfCv3S
 Dq1w==
X-Gm-Message-State: AOAM533ksl+GLi8nJ2yl/l0SHYbvJky+oCRIVfeNtjeqrLe2BEUWghxH
 5HrlC4LHYXxOQ0pW6uyFvK7nCsPckqLQPQ==
X-Received: by 2002:a17:902:7d8a:b029:115:77ae:e1dd with SMTP id
 a10-20020a1709027d8ab029011577aee1ddmr1167328plm.50.1623265088954; 
 Wed, 09 Jun 2021 11:58:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z6sm303409pfr.99.2021.06.09.11.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:58:08 -0700 (PDT)
Subject: Re: [PATCH 39/55] target/arm: Implement MVE VQDMULH and VQRDMULH
 (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad3f525e-4a01-8977-439e-a0cdae802c5c@linaro.org>
Date: Wed, 9 Jun 2021 11:58:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p6jA6hoVvv+9

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VQDMULH and VQRDMULH scalar insns, which multiply
> elements by the scalar, double, possibly round, take the high half
> and saturate.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
