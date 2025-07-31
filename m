Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923EC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 20:42:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uha5s-0001kK-EL; Thu, 31 Jul 2025 16:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhZ4F-0001Ut-5B
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 15:35:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhZ4B-0005fs-Ve
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 15:35:54 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b390136ed88so699577a12.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 12:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753990548; x=1754595348; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xm1DRsI6oo59P2afvYnyuJByykwd9XwU1EhM5GRqUsk=;
 b=r0t1X9tkNOWfarmCMqMx6dvVjMea+eTaAWkiUffmSyXTrZJmO1NnThv72M1NC48BKx
 Q7JltAqnRJltk85z4xPW1YUyKdtv1teZy2EGrthXx4terb7puI0SZIOD7VxInnpxp5Or
 kQGAB3ND+bcCSWxkUWm+oGv/1NhAJiZgO8S1k7aXLSmUCdeQDKUtQStHLr6q+za+A9BO
 CtAr4X/X511Rfx05y5PKNw8b7XUpI4cLIgeZm7mTIuIoLQkOi5ap6I2sXR3y7wzLFoO4
 x1mmiOP4xlPNS8/x8pnBu6HizM0dwm4Nl4z+NRqXo31bDkrmO1oqjenN1ZtNd4u2cNpv
 M7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753990548; x=1754595348;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xm1DRsI6oo59P2afvYnyuJByykwd9XwU1EhM5GRqUsk=;
 b=ax6p9vWhZsBwWYBImuGlEBaEgKVZ5n5Rf2G4Kq39DdYOu5SvaLyqAHiqRE9gX/AqMS
 f3TbW9+VMHFx7nijyro5BR6Ah18tzBH5ojfk5N25sk7XmEF2ZxnWazQ0w1/rSbNtRAxt
 q39w0GP1Pw4gE8FxGI+VCCyPg7jZiPYlhlCbas7U0QrZ608DioAxZC3XZtIjdb2GFapB
 Mc3axVN8HqJDszF+1b9XHm6cDd6qObbNst4HRFwqhEqVczequJSnbC2e3qSLqXAkPetI
 +lzG3/KVaCxEksTrodkiULBL6aSHg2CjDj8LATMLwnSimoE7QrpuUDEuw/Z0ULbecC7y
 ERWw==
X-Gm-Message-State: AOJu0YxRLFJMqtaKFkHoo274uRKi0nbtF5DfiU/KLi6M8KaHkteQF0Ed
 ZqCO4ysdjuM2WJOpi3R0cVx6y8bH7yDWh4Agt7eBgeLslDNbFpwxiRgN+Sv98rcRmsuqPcmOiii
 fcE1d
X-Gm-Gg: ASbGncvGh3jCwiNblEow/5pTnNiTcRv3iS05XluV1bQxYJnwdtmBfQyfqgxfSrvEC0t
 wZyO7lhv5K23wfLkQL5LLCbJzIijtOV8NTwubhbiUhR5ios/0EpPbr9LvOVvjLudEtOC9PLB1Mb
 86QOSDnI8NHHNc4MykNM6YV+HQULmQ8ndDMuC882tKBR0o4KLU/CShELd5qVZ11DXqmNBFkKL3G
 N35sJSxPBVS+sQlnhlnyFftNl2hR1Tyq0wNmjhg4LbzLfNSrjdKGlsSkt4k4MFSJh94qlRrMvcZ
 6PWCx61yGwSCPXKOw9i+/pUc+sf6DTKj+3+jgFmfL+ataidAvkCMH+E2/BlOtKMHpdORukawDzc
 h7g1PLuLktaeiLJ7+YucHfMIYByds3c3BOwtdfaKNFS9yfw==
X-Google-Smtp-Source: AGHT+IHmovPI0rn/kMuOj5rywMfr86d95Jpf2kMee9IDXP0oBtx3VvnLd4PzEbdNc9z/8MDI8Z+H7w==
X-Received: by 2002:a17:90b:2407:b0:31e:ec02:2297 with SMTP id
 98e67ed59e1d1-31f5de2d582mr8853340a91.19.1753990548272; 
 Thu, 31 Jul 2025 12:35:48 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6eb1sm2703028a91.22.2025.07.31.12.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 12:35:47 -0700 (PDT)
Message-ID: <d87652ec-c0de-4d7c-9e2d-837b54ac2052@linaro.org>
Date: Thu, 31 Jul 2025 12:35:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 48/82] target/arm: Add syndrome data for EC_GCS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-49-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/syndrome.h | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


