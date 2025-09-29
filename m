Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F64ECAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 10:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3BGt-0000Bv-LI; Mon, 29 Sep 2025 06:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BGf-00006U-UB
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:38:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BGb-0003nw-A3
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:38:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso18730595e9.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759142270; x=1759747070; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MAjojh3+fzVJToeRPImJu4+aCgGjbdiTzfqgwr3WcbI=;
 b=sPsVbeMOPZa0LxTt4czL/VO4AJchrcTlfg+xVlR7x/h+q36a7phCEEExz/+ZLlrxcI
 69eg4XW4a7fxWBSpqIhN4OXMUc48VPnMjYirkL8tGQRCtpLupQnKFwyXc+tNBsrMamU3
 bFQaWsKSqw4iqddSXVedrLE4AzyYo1FZqL48iwZlFuUrGd22QIvvTpL2TvHVXS2S+Lh9
 f0MkCrKolRosVUz9b2SwGlTsBMn2OREKzsP4+Rx5hFdxGlen7SBklD6wjwCUJ+Mg0HbV
 M/G7C6BwVHuP/PNClvvDHXqFNu/TUeXMftPlWXmwLCIBXG87w4bxEOmTN+wieGxoCnon
 X2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759142270; x=1759747070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MAjojh3+fzVJToeRPImJu4+aCgGjbdiTzfqgwr3WcbI=;
 b=TKTArP6qeISi6UUZ/Fp8B6FLFJValTCr0oX0sRGwdTq0RE3V7nE30hKO6C3yc6JvWa
 z7rIG3/VQpOqKCQX+9Tz3w/jjvldN2toE/Llp7HawEQi0ktCwlUh0Kcjf7T+R8eEQLvJ
 HlsuszZmEviC1Dlmx5Tkr66/NtcTEgqXG3TrNX7hbEBs9iLWMwWA7fSa+BH4mcUlJCjC
 U1Zw8xq+pOIJcPGBdFpNVH1OuDO1AbqqlBSHLTlCDCabhbdvRE6dz3GOl17WUAYDCRW3
 vapzmAyqSBgRmLuotyX6hAt5cvJLNdCWiuHdS4EsnUS30cEyGRpdwBODBkgSeKsK/nrR
 WePA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg9KCi9iXwwn5adksUTqXBQ699xIW567VeMrxsrUdUYGO/vSj6zqcnwh+G2fOxKn+3jlHtnohXpA==@nongnu.org
X-Gm-Message-State: AOJu0YyoXEFfYCNNyQTAGmVddiicxS7TKfEnegSQL5QpthaSKLMdTQhe
 5xw756jS2nUU8THE4/c3ZMIZNAwtbFriCZSxPjd0vi/SLBzIUtx30YZRCpTUcViX6Ws=
X-Gm-Gg: ASbGncvp0ksreb9EpshIUQnKuwhMvIB/cIK0tr8vFjJR+CIuHX14QZMAtwGiPNQRcTP
 ZhzwJ2f5BeQBXOP3S+locbP35cSrqNs4EpJO3/3OlkYv8azJ7iomI2kTqof2h6uDT8vq+JxqT6d
 i55vyeqqacKaxxbYDQINhCTv/YEwNl5Ah9GiH+riMtJPCZRvQqyUCu9OfhG1cGmZgcELG6ys/oI
 1uno6ypLTuCFp7XGUm6l2Vs33nv7Y/3JbMukdS1mjytyCRUDVklDZPrmoOirfetk/AbxjN2Hz73
 y/Mj+iGmlCK5yKKT1dgjQS1CtLKdp/hQkb/2iMlTNbK7bRjWH4L6O/nHxKkX0tnCPqDfNV1NtGL
 FynPTX6kUd0vvc/JRl+InhkCPebrnifpD8VKu4LWhDWXFrbVr9DvJjpqm+gWlACiyog==
X-Google-Smtp-Source: AGHT+IEjWw5O8IWWBs437wcF5tJzOMjRcXQ+lr1qPZVm5+EgVWyT5y8HlNDnwynHeJt1X95wAvY7sg==
X-Received: by 2002:a05:600c:4e50:b0:46e:3d5a:d15d with SMTP id
 5b1f17b1804b1-46e3d5ad285mr110930615e9.26.1759142269951; 
 Mon, 29 Sep 2025 03:37:49 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f658ffsm7443535e9.14.2025.09.29.03.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:37:49 -0700 (PDT)
Message-ID: <41fd8595-6f8d-4583-8d72-dace695adc2d@linaro.org>
Date: Mon, 29 Sep 2025 12:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 42/47] hw/arm/xlnx-versal-virt: split into
 base/concrete classes
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
 <20250926070806.292065-43-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926070806.292065-43-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 26/9/25 09:08, Luc Michel wrote:
> Split the xlnx-versal-virt machine type into a base abstract type and a
> concrete type. There is no functional change. This is in preparation for
> the versal2 machine.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/arm/xlnx-versal-virt.c | 74 +++++++++++++++++++++++++++------------
>   1 file changed, 52 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


