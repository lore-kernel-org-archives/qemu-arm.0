Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB5DCAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:03:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Mu5-0001U9-HX; Mon, 29 Sep 2025 19:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mu2-0001Tg-Ih
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:03:31 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mtz-0007E8-DS
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:03:30 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-32eb45ab7a0so5911746a91.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759187003; x=1759791803; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lxN8eIP2liV0GA/OhH71MhREW2jz2jTCy0ROEAtWjlU=;
 b=SJcVSEtkre+AG31hvZ2BNvvzuoPtm2+2PVsWocHFm1cVHZN589+ZRlXEreWIwDp8+r
 6krvvSG2ha3aCsjOnPO9T2jI1b/VW8tXk8M4FbXRVUPANrl+GP6bPU0EtofVukEjwpoq
 WFytc4W9e0C1CJwkvS32hUMhMc0oo35SEmvtho2Q5CSzbAQXMGjeFEX8j9l7roJCUnd2
 mijLGAOkRFxSXV1ecA/23ELlVjlk3+JA1AwoucEbDVBXSiuhtccKzCOZGFvT2KfJmIty
 ov1OIFf3zYewhVJX+eLBIG/IEa1ZtVlXQmv0b7fdiVJL0NbyKBM7uirktwdjWwS2VaWA
 Ga9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759187003; x=1759791803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxN8eIP2liV0GA/OhH71MhREW2jz2jTCy0ROEAtWjlU=;
 b=UgMjuJ+T9FxfU3H++/c10WhCuiDiy4TUADPBQkvMJ83hXIU9dy8RM8nks/v4yqyZmX
 gsLcGrD8VKkD4V+y7GpdQ3Ztab/W/SSlPGu7BhohvnRfW8SOcNkYMoScSOvW3N5kJIrH
 5/dvejsvKxDd+n99X4G4LFSkxgxcOh5fIOHp8GD2egS2lkmwtT/MKf2/jGhr9Es9Yx4M
 VFNnNvaPCjn+1vzRK1DH1/VE+CNV1UgA3Bugi7HBSUXP9qpFR6+K+nn5gNu5z06fD5JT
 MRuU4JnoYxRwimBwBA6GCN3rA0FfX2d1lKTcaFy57Plzgokebv7vIDvujug6I85lJZ9b
 9Nlw==
X-Gm-Message-State: AOJu0YwnHcB9YU7yWVziW5jp835xLUWKFdu2Iv0cDavqMKB1AE3iFbqG
 0Tsb/51qbw0s6ZpnXpp9nmBSsC+aTMYpOKBCc/2u8HWVhrx/VjFeuBsDYllpjOf7Zet1PHSq6kx
 cbNrV0Vs=
X-Gm-Gg: ASbGncslHAL5ox/D+22xRLZEDYdwXxp/lKb+IocrokZ9701ZjjpNNEJ+sIQWha/QYzI
 bYYvaPKHXi6c9lT0wo8X8BEX6AmC9fOSkOulB8chjYzERyvWnRQciZgTHm9R+M7s4A4BKD/r40y
 3cMHDYtjk0nVVq0FfDVK2NXNED1I6YTK6Y90AlReeEB59FVNjHrTO4b3P6lLNzhPyFduNXriC5i
 XinZUCRqsbu5PAM6F/QW3QG3MhPVgCkPxC4NOe5lTAcurKZSQyjypsuNMdHQakI+1l6xrfomYmT
 Ujlz0djDci7mX+KevDHFeLdA/Z5AxTimAYbR+0DBrv0AU89pFH3x1CZm5hZ6B+aex0leXg/yJy9
 pjlqpMHwBo3MKVnznBGYp0HdAezQ6gjS3m+YAuj9Aj8PYYMi5+dNnoU8r+MHrgo4BdogidQ==
X-Google-Smtp-Source: AGHT+IGlqobCH5VWoknLpuxJzMc2UVATFMImQyCXWMuXl4TqeR3g7Ch0Y7ecc6KMOloOCT0+SdJkcg==
X-Received: by 2002:a17:90b:3e83:b0:32e:e5:a90a with SMTP id
 98e67ed59e1d1-3342a2436a1mr20845441a91.8.1759187003214; 
 Mon, 29 Sep 2025 16:03:23 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be383b4sm18192859a91.27.2025.09.29.16.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:03:22 -0700 (PDT)
Message-ID: <94d8d92b-cef6-4ae3-93e8-6ce6d4ef2b24@linaro.org>
Date: Mon, 29 Sep 2025 16:03:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/arm: Add cur_space to S1Translate
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-5-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> We've been updating in_space and then using hacks to access
> the original space.  Instead, update cur_space and leave
> in_space unchanged.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 37 +++++++++++++++++++------------------
>   1 file changed, 19 insertions(+), 18 deletions(-)   

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


