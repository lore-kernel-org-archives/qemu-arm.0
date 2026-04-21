Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F87BF94CB4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 22:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFJkU-0006KP-5t; Tue, 21 Apr 2026 18:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFJkS-0006Jp-Bi
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 18:39:16 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFJkQ-0002NK-TN
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 18:39:16 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so21657855ad.2
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2026 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776811152; x=1777415952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b+1Bfe0n3xmz4i8Ycm22g0rpBfwGidicljo+vzxfI14=;
 b=mIfIdVJaoArvd6KOSOQBoYxgpxOxZay7B8anqzXnR4bibao+mN3lZi0VH06K7UkgmE
 Ct9SBhLpVjR68jduGnOqBYRkABfBt+Fz/Tk/GO7OFOj04LYhH2uNYCEUVjpSgMIi1p1S
 7M5++ywFGQRc/zhGsxm792lTvVK8Kj+CLep+UJ37zT70GWyRXkE0ZEMxcBRrvqHdcJn2
 jS4C6YqZbppXJJgIx/FitCozkktTaa5OBsx5Pg20PehOu8vQ6XjFbOt9OJohl+BUf8Hv
 KPerIaezjrtHlcyRSo7NZXnwsbWq7fZc1KE8v7RiJgLXxeFc2KzAwt5W/gcq9394XDgi
 iXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776811152; x=1777415952;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b+1Bfe0n3xmz4i8Ycm22g0rpBfwGidicljo+vzxfI14=;
 b=F3GGr1QQwLSQXzJkVw9n4Y0F5xpsa3u4+1YCa/KktumsaWzcgLdcj5jnyP1OzY3q2t
 /wn/Xy2U2sAoLskLu5QvPXBfFQllVuu18KiSk5ps5j+/2gHskwRfqhLqAmW63psapy/S
 dODbv4S8kvze8D0v+jfi7SCxFBE/TfHjUrAKuOrgz/ptm37vp4LPDc3IeWLbhadY3Yb7
 BhDWxI0wbBLbUR/fiTeyDNRV0jBLcRlbp1rU7fToK6JiYIgL260nEWYPK/7Pko4te8aQ
 N4flmfwgEUyFFf9kLHk40A2/1iuM0IpBcT77CvSGB5k7mabA99o6rOxdS1wALC/exmSx
 +/Cg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/RSnHNI9zE8y05vES8f1lEfWlGzhecwkobuhlWQ/qvLoYPl65vk+3miMmuJfffm+fQAQLyd+EPkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxUuftknuPl5ehgl5WKRe0Ui03TPlj+LbFiJPOok5NrC6FGz2nM
 /vh2qP2LOmUTO5i+x9ZktocsO6oTzR3GyBEwEJQKW1URYpLl5VvYTOgGRow0nE3jM6w=
X-Gm-Gg: AeBDieu1C2lYnbQdqlO4W97FcwcEBggCLz64JQ4iOvLjHa58ULyIBumsP/oUqqU1YyQ
 pdan/vTY4tFYTXvB5BHhURnaCYQ/059l2ifrArhEA9gqCarm2aSjkKqAf3y6ODMtDUfYkrMEJdA
 JMe+vUQ19M0iuouL5/IDOernb1fhlvB1VWbBVjufJZp9jdgAe4f1s/6v8yl/MCiYFK+GexVkF7V
 1jyFZshMinPD6YDd4kmPBRyZBs9jdT1WyVdiYpqNK12qEDEUUr6AkfGLrK+dV8IINsLCf/B9gR0
 wsBF5isN5FdsVEQaWYiaFSr0C+T+lqjcEiDSAX2MgzBUhD856PtWhuE0r/Zo4zhxJwkz3ilUKX4
 B8KS3eEZVH3CToa1yuniR80h3AXqxT6w843MtlS7EuKkKDN4+PgApV+UVEygRmfuifmeiPKCmUo
 sQbnmzoHu4MQCnKDVfTkki5Uu8wnIzyMi6uPDhlOQ4lLxWKK+OSPBX
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id
 d9443c01a7336-2b5f9f3b367mr220050275ad.29.1776811152335; 
 Tue, 21 Apr 2026 15:39:12 -0700 (PDT)
Received: from [192.168.10.140] ([180.233.125.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa2df0asm145459655ad.26.2026.04.21.15.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 15:39:11 -0700 (PDT)
Message-ID: <66b0fb99-6783-4324-a0fe-86dc1087ada4@linaro.org>
Date: Wed, 22 Apr 2026 08:39:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] tests/tcg/aarch64/system/rme_gdi.c: Very basic
 test of GDI
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
 <20260421-jmac-feat_rme_gdi-v3-4-ecd20c77eae1@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260421-jmac-feat_rme_gdi-v3-4-ecd20c77eae1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 4/22/26 00:22, Jim MacArthur wrote:
> Simply tests GDI's prerequisites; that if GDI is enabled then
> so are FEAT_RME and FEAT_RME_GPC2.
> 
> Signed-off-by: Jim MacArthur<jim.macarthur@linaro.org>
> ---
>   tests/tcg/aarch64/system/rme_gdi.c | 46 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

