Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FBFF531DE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQOg-0008IW-F2; Mon, 13 Apr 2026 19:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQOb-0008I6-Mg
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:08:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQOZ-0006jy-Qr
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:08:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso51469225e9.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776121722; x=1776726522; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kLb00s6LSPjjFGnlDXJgQ+QcEkHDEfD0TtdGwXY1fn0=;
 b=gEYKpdKrvOvDc2m9I7fW1ECK+NGgnO+/dxuFqH++3cPNjWXNQntIp9/jjIEjoGKRlL
 rV05g/Gq4aWEfHZ6cI6HF0faNNrZqBM5BLU44xOry4Z7iErCy8x5YFcKy9AOk/KolNBF
 nyZt8KuTOG7Gn8MrupDMEFqtRfd3EpkjEHUwXWBqUN2ZQaN6r+ZEnaIpG3fqDYb+ERwJ
 e2hJXNJjQmxUizBN8W6q6QvPwecja87PhTNTpnOqqEV/kc6fTos/BWO9pZ7LgQ80R3He
 ET4mFcmsIeiYL7mip85+JbaTm7aFmEW5uIDbTAxTd5bnl7ZNxwqg3N43pGBeUUig7Wlx
 6JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776121722; x=1776726522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLb00s6LSPjjFGnlDXJgQ+QcEkHDEfD0TtdGwXY1fn0=;
 b=pgh6Z4tdhpUTxBASIHVdTPkXo/2F7y3wNFTSAwHwAt6npNZ8EpT0iLqt4TugNkRtQ3
 H8bO7WfEK3GbcaaSENsTufRvrfNG26EMOzviFxQqkbvttJ1kqL0Qw7UDgZEWBSMXe7fJ
 idyM4U5BId5vhfkrV6vG0g3wk2fL7z1EfM3AGzITwo1xC0cFblZHWzKxUe4zVUF9S5/c
 TQxghUO9DRYy4ZP5/Fz4DTZ64sTWvAS6Cnu0tfraPYdvyXZ8SW/DJiGvEjoyZ6Lsg8oh
 5mVWHUQ5ykPtIoy9bHPwGxVm36rnmz1E4YkD/Z2RSWJpnr2D18/OkMTN+J+4jqWHCFGI
 3fmQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8K0CMgAkaIAEmMHp9SbCdp2VUEm4rvZb29U1FJbU2prcV6WmyRMV+fYeCWUW7BmUFe9l7LPNKIOA==@nongnu.org
X-Gm-Message-State: AOJu0YwPI/aLCabzW+/OJSeQyqE/atZGdTwys0qP+I+rs8F2kxrQhHrg
 vkhu2vARvxyzdbLkrxq2pYP53RPAza4uxjAi4Q3tEeg+YuxDHUhrYmuzreAfiRXjYCc=
X-Gm-Gg: AeBDiev+KNCcguRfsq7fpahV9nhohDkD/dKOF0MOadvHgLSfZYuLOxJ7mTqMDCVjnZg
 VA6O02+0VGgmyZsAgxcBTku4gt19KnqiYA7ErehMN3cTm/QNdNIkhjA7x0Q8IIA2VcubcBuWdvu
 2s/3YOj9OYz1o07v+1farQxo57vKGvYLOVvLoq032r2uuAIBVTdVVb4SbC/PvlYj3TZgiTVPheH
 oQMAwM9BxIrR+vO0H5SM4LO9upuDlMDudU1JDil5hoKDBdiM5KeaAQ0mjZNmQ+sZQa4w0VhzbZd
 qoKZVlsJ2kh5pXSCdR8gtx7wAe77ZFyudMIi+LrftQzLFIpkWKRnfLu1pm2Y1Q/jpJZYOvsClpt
 J07wLC4j9uDG8ZEqJIoeqMU5CpEpmgxFB9/7grhPPxHlSp+6LmECzVaRKJW/DNsw0l87y9MTG4U
 0rkJ7YLjiAR1n/+6/ML/LdhCiioE8uKcdtO5eeU1b4k/1qD55LBNjcHT2rettuCXsU7A==
X-Received: by 2002:a05:600c:46d0:b0:485:40c6:f507 with SMTP id
 5b1f17b1804b1-488d689dbfcmr210428375e9.30.1776121722155; 
 Mon, 13 Apr 2026 16:08:42 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede1e050sm3121345e9.5.2026.04.13.16.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:08:41 -0700 (PDT)
Message-ID: <53b5f085-7a6a-4653-b287-7948c26c2c9f@linaro.org>
Date: Tue, 14 Apr 2026 01:08:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/65] target/arm: Set up pointer to GICv5 in each CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-16-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 27/3/26 12:16, Peter Maydell wrote:
> The qdev link property array gives the IRS a pointer to each CPU that
> is connected to it, but the CPU also needs a pointer to the IRS so
> that it can issue commands.  Set this up in a similar way to how we
> do it for the GICv3: have the GIC's realize function call
> gicv5_set_gicv5state() to set a pointer in the CPUARMState.
> 
> The CPU will only allow this link to be made if it actually
> implements the GICv5 CPU interface; it will be the responsibility of
> the board code to configure the CPU to have a GICv5 cpuif if it wants
> to connect a GICv5 to it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/intc/arm_gicv5_common.c         |  9 +++++++++
>   include/hw/intc/arm_gicv5_stream.h | 32 ++++++++++++++++++++++++++++++
>   target/arm/cpu.c                   | 16 +++++++++++++++
>   target/arm/cpu.h                   |  2 ++
>   4 files changed, 59 insertions(+)
>   create mode 100644 include/hw/intc/arm_gicv5_stream.h


> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20..16de0ebfa8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -812,6 +812,8 @@ typedef struct CPUArchState {
>       const struct arm_boot_info *boot_info;
>       /* Store GICv3CPUState to access from this struct */
>       void *gicv3state;
> +    /* Similarly, for a GICv5Common */
> +    void *gicv5state;

Since there can only be a single gic state per vCPU, is it worth
having 2 pointers?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   #else /* CONFIG_USER_ONLY */
>       /* For usermode syscall translation.  */
>       bool eabi;


