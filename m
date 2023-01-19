Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp627921ejc;
        Thu, 19 Jan 2023 13:19:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvcAZwXgzgMpi6uWE4Jla1TpnyZB2WY+vpNgtujAIWIYDd1l/TpphhWzlDiT24ypBbwCOWn
X-Received: by 2002:ac8:5405:0:b0:3b6:2f31:efc4 with SMTP id b5-20020ac85405000000b003b62f31efc4mr18559797qtq.66.1674163184121;
        Thu, 19 Jan 2023 13:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674163184; cv=none;
        d=google.com; s=arc-20160816;
        b=YfrZztpLeK5kviYFAGLwU6HNuB0NlVjjPBDp/Im8CNgRNQieLnmwSIYhf4S5BMyPPA
         1I3qwAO66OSSD2Pj9VqKjsVURoGKZGBVqiP/4rZe1S4BWKf9c/YqDemSjHXO5ZUMCA88
         Wyj8pNbDjxmYObTjDh5CcdUvHTuK9MlIJcezYmKzEoo17rQh9w71U850UQ8mGRMW+4wy
         WuBgYwF+NgTsYlLG0s0FXESl28KgM69DE6izqi3xUVBK0a0E2Y9L43vleYt0FYj+Sjrk
         NOXXultGnAZLh4n2BDfa/88f+bZSYhV2WCVHm9JLRxxzWBljQVGeKb01Ir4X2bnoNmic
         WAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6EdajB0ZvjP7Zu9Iyb4IL6EwU+QpucYA288YltO4usc=;
        b=JWDz9gngkQyljxyahgG5sCKKpz22vgolCitsthBBqx5vGTTh43YCtzZ4cnKRgpK16n
         Orfb+h0hkf8c381lzAWxU+tiZyjIsKARaN0cY09r9eB8cCKXYMy2HpJuv6SupVj1Vmbg
         8W2CIWgb8y1ZozEMa2tNINWzK/wxNBU13rxFIxgg4do4iPurnqlQz23mYdRuVNUCft5P
         6oVXtfZrPxV+ZRQ3o0VYde55lBlojaEOU+/w0U2Yc8e+OnGvp4nA2NuIcQMXJEu8P/26
         PeBMBySkgPlL8GDLXY5FlQV0EzqYdiHFwDzhxN6kNd33MX1QnwQMFk4c/H5DrtKDnU3B
         MNSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMVaAf7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020a05622a124e00b003b682ae020esi4471602qtx.705.2023.01.19.13.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:19:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMVaAf7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIcJn-0000IJ-CI; Thu, 19 Jan 2023 16:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcJk-0000HY-NH
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:19:28 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcJi-0006nR-5U
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:19:28 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so124081pji.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6EdajB0ZvjP7Zu9Iyb4IL6EwU+QpucYA288YltO4usc=;
 b=SMVaAf7fcvynyQdT9R+2j7oiiL84Xq1+qoeuI8mQ2kFXfjFZXB0hIG+frx3MiX9wYW
 ZCQ/ntIzuvhAyzz7oBkLvIOn2VKoAlnnzl8PMAtFVHcjueUPFCY8qkMnrjUQZ1NohhQ5
 vnpUpZdpUa8Go3C7kavkIOLeOLQ87Vjy5G2ZQrc+RmPq+h2hw1PJfhhFH97L3NUtZSs2
 Pom/OCdJxQZNozLhAZxrrg4P6WDj+5/Hcd3D7hM/HHrNhWr7zJeVxEA48bElSOmiB2dw
 UZcwtBs97UqBFkpj20vXFiLEkUHi9Vf1XwjDbTG2O6pxVQBomEY6IV4hnKwyHd03oyP2
 x6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6EdajB0ZvjP7Zu9Iyb4IL6EwU+QpucYA288YltO4usc=;
 b=o+sK2BBLDM/TMrbpH7iLSn46QNcD5sE6Th2uU4olHg/xloFNC3n6Glo7WEiVX7wnFu
 gp5FVePJj7W3aE6t3AHDcESxWg+y3aFYrIBCJy8tPRRHBZBVLy+aHGywbPJgSqNPLej1
 WHlPE2F/9i2Uui5lEqahM34alZPAhB4s44ChcQB/S6bJFWNeME6KftKaIELzbCDq9rkl
 F21ucpnwjGDYlmnaI9blcVPKkRys9Y9Gd6918CPh6dhX7mwF0MeW41SvXT71XnKFVifb
 il36HTdESJEnlPjJD9JyO3zYta0VlBTCkYFawfOA5Wc97yTzdYCD0tHLR1KptC/0Tgcq
 0rtw==
X-Gm-Message-State: AFqh2ko+Wn8zIc/jSm8Ftsb/+9HkCHo0hMmT+a8FhbKY1uE47omPPXJa
 A3HM0sAsp3jUZV9ylUCPk1QNdQ==
X-Received: by 2002:a17:902:cf4b:b0:189:76ef:e112 with SMTP id
 e11-20020a170902cf4b00b0018976efe112mr14500713plg.41.1674163164065; 
 Thu, 19 Jan 2023 13:19:24 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j6-20020a17090276c600b00194b37940edsm539919plt.268.2023.01.19.13.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:19:22 -0800 (PST)
Message-ID: <a4e3d2dc-452a-a924-7504-a295f6ad7abd@linaro.org>
Date: Thu, 19 Jan 2023 11:19:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/11] tests/qtest/migration-test: Build command line
 using GString API (4/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: MRkn7G2FpeB6

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 4/4: Convert rest of options.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 50 +++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
