Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26176CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 15:40:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9mYa-0001QT-8i; Fri, 17 Oct 2025 11:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9mYV-0001PE-Uc
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:39:50 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9mYM-0002EE-Gm
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:39:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-267facf9b58so14616265ad.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760715574; x=1761320374; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qvnMkWhw0leeHpPTaTx6TsuOXQ4kT0gTDGiEKRId8ak=;
 b=K44UqoP8E1gEJLtcoSuDp0mUFzc6jcf/emd+jTPgS2Tqy5u0Ff7c+cDM9qKHIGRdmq
 tWqjunmBK5CjDR8BNtZBO1QXZnXHzzFEMGaO8OTImWcIQ+tbnJnAtK2vFrgycMk2rMSE
 g+c3eh1/oVpUKUfX7i+v7XU0gAwzN10PHSTFuOJB9NIEVLPQrYN3vBDhYj76Uv+fewhr
 K6wnYimBoFlEcMXlBVdbvnwTD+sifvgkSq1rg7tV+oKl0g02CqH2VVBNaDVQjgHNBWvi
 2CrS1FzP/X8q1BzIk3hHRImnBfVOIdsDmD/V5KAh8QdPsHDvJKHsFsrQZRj1pl0u05pC
 LVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760715574; x=1761320374;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvnMkWhw0leeHpPTaTx6TsuOXQ4kT0gTDGiEKRId8ak=;
 b=XoTdKhhziBqVUjUxL2Hwlb2gDxSBp/xrd0ns/snlL+++yns0HCOiizBhn5Ncu42O0t
 qIMek+izXyI7SbN0/WpSyt1H1wB1WUx3yuY1B0jsJeYhKaJNI5WCWRlufW4lcZ5+LCf8
 tDR3aLW4khKJzcaWHi2bEpnoB+xgULRSZ60Cph7LYXjQiqKD19OaHMuIjdHkfUp3Uk+6
 PgR8l4i+lmyMSjZ9jCJfy7T6L7GJJRZQayrgAEUK30x1FHg2x93qTOQWgGiKlQAxWSe3
 A/0IAmRESr4XvS9HQBEHbXNBTXAAAsZjZYA6E3GS/jPjZ+6LglnUNp93mhmbh6SWVaXn
 PDpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3xwAzb9Iq7/w0tPs9pj7oL1ByIWr1essCcYGZRFDzg61+b6DfqDQDyRZ9hzMZpuyX7Zm+qBCvlw==@nongnu.org
X-Gm-Message-State: AOJu0YwMpYoxywldrngoxPV2HmJIdufa8lyTLBxlgbWtbppXe39bSyus
 3kwOi1ujs+FUOY+Mymt2zHuk8/j/gA5GeDTBSw7NZEpMPmvdYFtnz6iGMUWjU8N4M3Y=
X-Gm-Gg: ASbGncvzenYkEYyz6TZEFw75XdjuG1VAsXXQFR2alh1vp+qrnivGijGTjku1+tpZrEh
 VLlFxfz7KfTK9/tBlFAhk4bJKiTz6haHZfIwoeKJHCxWpoFg7eZrKaeecLBQBunwFLWd5YAJjVq
 1G7j5h0LjRNO//KronSiHb/b62LjZ4NBNvn9RKQtSy/EHQdQj16TZU6qpHiEhCYIW7ZER4JmlVB
 uH0Yeco6hADMOs1eUN7iEbghDq9IwglVw/REnNffODrQFRFlamnzKfWzeHBY2mC6xXyR/qzWrTP
 7u6lbnGtVyDlgNXaEHGiR5Wgg1B0fo+d4uw+VKBQHtY8tM8AyeBBOe+hxDfSZQMAiK8LYAwGN0Y
 1OdvVicjdAMywz827GTpBhuTnUsix5GVzkoNWk1chX9gpwj+NqlNdf7hFCD1P8kgTL8U2vVo7FM
 zfzOOKmZTtAGdIuwtPn5xG24MfsJlfWtQ6gJc=
X-Google-Smtp-Source: AGHT+IFrM+TIv3pyVBAk8nkgPPlMne7UszfrdySdSYrMYqZEIZu8zR6mPimh9AwaO9Z2uk6irZxz8Q==
X-Received: by 2002:a17:902:e743:b0:290:ad79:c613 with SMTP id
 d9443c01a7336-290cb27c76cmr50670655ad.47.1760715573943; 
 Fri, 17 Oct 2025 08:39:33 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099348afcsm67887525ad.37.2025.10.17.08.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 08:39:33 -0700 (PDT)
Message-ID: <518e1d4e-abdc-4f03-a60e-9a7c413cb858@linaro.org>
Date: Fri, 17 Oct 2025 08:39:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] target/arm: Implement org.gnu.gdb.aarch64.tls XML
 feature in gdbstub
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
References: <20251017153027.969016-1-peter.maydell@linaro.org>
 <20251017153027.969016-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017153027.969016-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/17/25 08:30, Peter Maydell wrote:
> GDB expects the TLS registers to be exposed via org.gnu.gdb.aarch64.tls,
> which will contain either just "tpidr", or else "tpidr" and "tpidr2".
> 
> This will be important for SME in future, because the lazy state
> restoration scheme requires GDB to use the TPIDR2 information.
> GDB doesn't currently implement that, but we should provide the
> register via the XML so that we are ready when future GDB versions
> support it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       |  1 +
>   target/arm/internals.h |  3 ++
>   target/arm/gdbstub.c   |  6 ++++
>   target/arm/gdbstub64.c | 63 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 73 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

