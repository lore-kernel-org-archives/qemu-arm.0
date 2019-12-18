Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1298499lff;
        Wed, 18 Dec 2019 12:33:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwNTJtZTubPkyIEd5NHbUFAqcH+406LLk4d5L/VrOQZIx5hDpHnv2iiuQAZEhIX94Q21sC
X-Received: by 2002:ac8:544f:: with SMTP id d15mr4010717qtq.53.1576701210571;
        Wed, 18 Dec 2019 12:33:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576701210; cv=none;
        d=google.com; s=arc-20160816;
        b=FDqzMpPRFA1RRgHupZf4yiVAntqWaj+fX/vU0PT69zIosKm+ggdoDCNXh3okBNpLXy
         osH+aimYUI3ag1A1sGnrSNBYqeijrc5ZaHxKFizg8aO1pk2St+FQ6yVPQssU4wrEC7nI
         Jwr/wSODKWwxez1wzOYVND5S2E8WgLRuX+A7KFAzYRspKkKIfZEccGC1Xt0YwMi0ehz7
         sAqeR39DcVO0wQXWZg37q1ewKXtc28VGH9HW5pmpodk0Nxj25fUOyKq/eMBSQsskKqtT
         BtHwq3H8AHbrQg6DE60Sn1ghu6UpYrN0zvKw2egOOjwd4qW1paIVeKD5rbIcKzVub4zC
         0M/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EgquuMahjEW5YEjdy3ojcA50VUIAktcr/XHmJSYUEiA=;
        b=YJvJjZXUIEE7z8p4lQoiHzqeAOHqczrb2rQ47u8sperV1e8TVnhAjP/ghDjV39cZqn
         G7ubAaez9lO6p45QLR50gwsYZAX2ZHL1EGh8h0Kckq51ZMrDJ11xMb10V2WtIXfj0/v0
         HbPuV3/8O9pNA532CO5auw7yjvX90YIKS8i9ciW8GTZn8+lv7urK4tKPtVENDfSGpe5w
         f4JBx00lT0AuCEihI3ylf8M9Dk8FeVgoA3t6bva6c/JeVaZmpbai9L0108213T6yQzVI
         Gzv/Rgr4eEhyzmKvqtshDgDQAce3xbW/JJwjt4BQ9cdoLC5W9oJAz/YoevZMTmlm/w8j
         +arw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="o+/C0LqE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v36si1551049qtd.23.2019.12.18.12.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 12:33:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="o+/C0LqE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihg0f-0007v2-2s
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 15:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfyn-0006yi-6E
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfyj-000659-HY
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:31:31 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihfyf-00061s-UJ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:31:27 -0500
Received: by mail-pj1-x1042.google.com with SMTP id w23so1408832pjd.2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 12:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EgquuMahjEW5YEjdy3ojcA50VUIAktcr/XHmJSYUEiA=;
 b=o+/C0LqEINS+QtcNH/yIGAolsHPlUAquez6q0HgFiwy7J3Y3tKgV4JSKiBOuiupnjF
 YTzkN5WgaKYmhQb6qDP6zQjiPJCbsVFIVj+siZKqZCMhwUnC0HAME93OuJhG1owQhxI3
 I8sTlifa6jncQxO6Fgbw+vhdXvcsK9vZdrpL7N6rC6nt2dg1m4Aw5PsJC4K92sRVOgkp
 qx/SYpURXuLMFC+KWRSpOBCGjKTUpbBWK88lf28W/RhrQAf6NFp/HufOggGwCxRXPC73
 ffzUAt8Km5qBPNoNLc8V8ynKy4Bg6yUA79HYhEyp43iG7oVPcRwHoz8mSngC+QQ/NzoO
 XwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EgquuMahjEW5YEjdy3ojcA50VUIAktcr/XHmJSYUEiA=;
 b=uF1X55xeqiQ9f3hPkk02ZESq2/eaMg4KHBJPsBjsxHQM8x99qUqPYOp4/6zNB1d7UK
 vlTbPE5MSBLmZkN1i8RehAIxsZesz6yjRkJahyQXpJDPwhMich8zrhfUsDGeDQu6PF+U
 VIbSCWDaauYcl0/myNWfNCsZoieCePM/RUG1joGGEBlPeKVqofJGxB4J02TWO64aFt6W
 9aH82vAnUtRvvpbnqyp3YmTPFR+FghzcvsWJd4LWy24SE+hD90kcpfHZLS+AIUu9pzSu
 A+ykRqRYs+s2JETUpeoBE2rDGI9ifGHlbpDGxWt+5PU/+mDjIbxpZYndpKPTrQx8+2cx
 Vt3Q==
X-Gm-Message-State: APjAAAVwghjB7ZqZviqZLf9tzpTCHpsu3mU/G8O7rV7R30pXw4W1PYbP
 krb9PhfOM7cE4O33FiF93vLtmw==
X-Received: by 2002:a17:902:b902:: with SMTP id
 bf2mr4817097plb.137.1576701083484; 
 Wed, 18 Dec 2019 12:31:23 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id m101sm3955868pje.13.2019.12.18.12.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 12:31:22 -0800 (PST)
Subject: Re: [RFC PATCH v2 6/6] hw/pci-host/designware: Remove unuseful
 FALLTHROUGH comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c54c1c5f-efd4-0a7a-6275-c265997f45a8@linaro.org>
Date: Wed, 18 Dec 2019 10:31:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WAAgyGRPXOJf

On 12/18/19 9:25 AM, Philippe Mathieu-Daudé wrote:
> We don't need to explicit this obvious switch fall through.
> Stay consistent with the rest of the codebase.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/pci-host/designware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
