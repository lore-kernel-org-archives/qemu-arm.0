Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5CFC87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:28:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhaow-0008B2-C0; Thu, 31 Jul 2025 17:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaXD-00015R-Cw
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:09:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaXB-0004cA-S2
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:09:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-31eb40b050bso838366a91.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753996192; x=1754600992; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+msUqKeJtOPYHsf2Z8coTdhHyrlU6PDEv2IGL7Fa0Rc=;
 b=wWSlcnd1a17DtcNQ/UShYElP9MQpoNSSDDzOTu1mdyfNZyKymW14a+z/RH6oONfkoR
 S8/QyhIpZoASmdNSvnfUWUuFG7f0OVqoOS62ZcuGfFIxmiOI3Tmtw1L6NrK2P1FqmfsY
 OSswN9P8Ho9Akhao8jmR2+GH8sGF3+rvQMCkvTxDRZtHEmjjLjSw7vu5lQC3s+W72hTK
 A3IEcwJTh1JnAAqU6E/JWKm3/wOUFees2hLrgp4/WE0NlAxcqoMp4oBEkHlMfCqyhawz
 IIC5F6mc4AnpavZDf7D3AnV8popC5+agJKGxfpg5mcK1bY43/3vSpQcOZHRI4LEDwu9/
 iArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753996192; x=1754600992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+msUqKeJtOPYHsf2Z8coTdhHyrlU6PDEv2IGL7Fa0Rc=;
 b=sel6scmuQ3j9wZPkTxhcW/XVT/xZd3IpmLjYBcgRytgUCpYwMDpzetb0GWeXCLYi2p
 TrIZ4Mv5cXbo/YJBFS1kRNBp+IBiPQBs1VcT6p70CQca/LVmomZ42c43SvxH0KBRetYH
 XzXi5ZX+X6Dmmw1nArRaLStUZXWCJNLlbioa1Y6i3LQoIGN6tuk2RtBbtx4CkerHbKf2
 suMYZyf/LRtki6nW3RX8aTUoYcsYVXbyaUudShzyQe7MtzbK+TQEWpQmz7MZdyllQpLJ
 p2g96Iwo+6X4BDnFW6MAP1rKPWkXbgdqKI3pPxNnHMqdiFWGMN3mW8UoEHKKAZ/zfYjP
 K4rA==
X-Gm-Message-State: AOJu0YzYksrgmsXh7sJv3COnEELy7Zm0Yya0EL0dtJONgI8aeVUglqm5
 OavjzrZ+0MkH5+2ZGuSSIH9YyHg5n/0OY4IfzEcjvKXZv+LAAtCYY/KWSCOHSDYnE+TUvnFHrD5
 /6vaW
X-Gm-Gg: ASbGncsBFvmaww17MT4QaxAF5+rNFYb6vv1EBClqfbo1E8trDlC2SA7a/TMpwAY79oo
 Mkg6npQUklzCijI1P50aXUz/lz0NgBlu20MdCbnw1XeoNg+t069VHXHRcu9TeP5gDPWdDdeeYgG
 spfEmRjIB0Rw78MrH2X2LCIGaFBENv4VJqTQ358RpW6ghzRIMVlO4o2qpmKv1iZ0Vh1MIyJkV47
 MGAOArqAYys5EN2po5DeBvygDi6aluy7rt+j0Qx1Jg6ZUaFbUCLrbWe/9HwjZTtac+kiKnDYOje
 ithFcvZR7eCqOb1yHSjMxys6R3cqW0XOdJZ6sOCOyIKLZN1bkfZK/yNxfZWdHSbRop55/KY6zXd
 BOCghhwlVf4C2sPGR40KHHCtPQNMQUxQDrSU=
X-Google-Smtp-Source: AGHT+IFVcVYliSuKnurN83ag1sy5RMIjVt3/ks3iKe1fgaSKIfMmjoI+FGToFijhNyDDVhAOfnQ6nA==
X-Received: by 2002:a17:90b:3ec6:b0:311:e8cc:424c with SMTP id
 98e67ed59e1d1-320fbc1f6bcmr377675a91.25.1753996192360; 
 Thu, 31 Jul 2025 14:09:52 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63f0cb39sm5493816a91.30.2025.07.31.14.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:09:51 -0700 (PDT)
Message-ID: <5ed07015-de84-4e1a-ba21-9758ce2ca5d1@linaro.org>
Date: Thu, 31 Jul 2025 14:09:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 51/82] target/arm: Introduce delay_exception{_el}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-52-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Add infrastructure to raise an exception out of line.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h     | 20 +++++++++++++
>   target/arm/tcg/translate-a64.c |  2 ++
>   target/arm/tcg/translate.c     | 53 ++++++++++++++++++++++++++++++++++
>   3 files changed, 75 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


