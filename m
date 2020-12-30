Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12268482lfq;
        Wed, 30 Dec 2020 14:10:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJjb7E3l3/sGbTDkSqM9GJODjUW1nc8itNRerSqhjeHh0aabB7JNBcI984luwAKNY+jlKU
X-Received: by 2002:a25:c845:: with SMTP id y66mr75106785ybf.110.1609366230776;
        Wed, 30 Dec 2020 14:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609366230; cv=none;
        d=google.com; s=arc-20160816;
        b=E6Nldz0BAswI6j3XYnaiQyU19ZDHPRRzaJxd3AgWJONqcQ1ptJSFYwtBs9tdlAvIaE
         qWLiBAJpfA5AQj44YAHitsvMFR+mhFSTkh9UpJ+U+mbWwDP1fCbjqgMv2G1NDeOZLbvg
         gLNYrC6N6qqeM0qK1PJlITWjxYJ0Al5ADlKqPByPLFr32um1/GY9WEgdfP7ugbejqeis
         FKRRAjVyE47im40XxFAPdcTuQtI2kRRSjpr3cWfuiK6ZFGeAt5E6YOuDLMqmIUlHPUNK
         T6g2vlU7fGK/9LvYAAmBd7eSo5LzrNj4L+jN8y2OV8M+0OVMCJZPEyjtnZC9cARZtAi9
         tO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8Xa9D8hkDiPC8lrxl3e57tQR2jaDhyJNrSs+US9y60M=;
        b=A0JxzPJskWj07X4R+fVQp5DxsiiQkNv4UJYM/1chQdSs1RYXjSzGy0ze58lenAaAC8
         WmHQ9uefREM/MCkYnRcoX26T4xxaIAigDlCZk/W4htP7ZrJqNCVup8jjSwMgwEfcWCB2
         CRVdWaIv4sJG2SD8wTnLMtjLv1WJ2Oiq3VOWqI1JQY0oEBCqNkiZ1Fg8F2fsRIJ2PMSe
         0lsHK6hHLh1uSZknIBnZoNRX4OvP4CXpNLse4Hj522uuLbaXreoBrafEu4KEKruncTVr
         kpOOHEVHel+Hxz97eR9CUi8yujU7o7NcqCzYXPpdUOFm0biM8AreRV12lzW2rRSxJIfs
         0RnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mVQal34p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e191si41985719ybf.280.2020.12.30.14.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 14:10:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mVQal34p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kujfq-0003d8-64
	for alex.bennee@linaro.org; Wed, 30 Dec 2020 17:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kujff-0003cX-Mp
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 17:10:19 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kujfa-0007pL-AZ
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 17:10:17 -0500
Received: by mail-pg1-x531.google.com with SMTP id c132so754460pga.3
 for <qemu-arm@nongnu.org>; Wed, 30 Dec 2020 14:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Xa9D8hkDiPC8lrxl3e57tQR2jaDhyJNrSs+US9y60M=;
 b=mVQal34pNKTzK5/gW8txkkaYGwOrbfkeZfouy8JJNnL88QosyILpYxZ8V44gZIHiia
 BjJ1ndIqmZWIk/SAoMUkzobkaLwkRa3b3fb41dYrgOsZfTAA8TEjphaGvToTxFzrn2Xr
 02Qle0s5+oxmeV8aoT9SPZ9a/JssPrp0qV7HvIEc257kDqzHgxoHIVsKkeslhJ1ocYK0
 Hz1Q/rPnF0rHDQCrzatj6JL8tcXYWZtZJbkrVSnz17c6cJCOosI0lrfxF9IYXa9HkyyA
 7MbVNYAhIMj7dZrvBBxac5BJJqMeez39ryi8ANTP7s702P9MUUfXolh7uHfzexjNhv+W
 6ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Xa9D8hkDiPC8lrxl3e57tQR2jaDhyJNrSs+US9y60M=;
 b=O/dzO+Z00d8r4n7zrIAuxKPyoUFW1ESM1O/jLtNvRp8NXyguTGoK5RIF2Yfj+APW6j
 OE3aedTgFBGNJYubE03FkHxbXviTPxy6C25+Sl4PCQ27KDYdQg0qFvy0u+tsajWxd2mp
 WSbUG2xPbO4e2CjNRi+TxwjEJHR+gVxiZsekmzmea+alwuiglhf8nqKPBoUsolIjAom9
 1MzLW/R5D6ZWf/OwUfvwG2PDO0tL5KufwUkWQFkvw4i5YDbyiAhoEBMxV949mSZPpfCv
 hUuAjU1wloAAPTyiTqxonkxI3tz88hD/Y1cIVUFi5bB/j8dwVt0Ydt0nfhwQQFM9ZGgx
 em1g==
X-Gm-Message-State: AOAM530KFaYzQ2hlIbHBJiqmxkw3j80quSMioVDfXT9vwTB5GK/l+UwN
 78mHh2RnGB0NH+Z3+N3tChXS4g==
X-Received: by 2002:a65:494f:: with SMTP id q15mr53804870pgs.367.1609366212239; 
 Wed, 30 Dec 2020 14:10:12 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 d203sm44349129pfd.148.2020.12.30.14.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:10:11 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-1-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
Date: Wed, 30 Dec 2020 14:10:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218143321.102872-1-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OMMR2oyI9PmE

On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

The patch does more than what is described above.

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index df195c314c..b927e53ab0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10821,17 +10821,12 @@ do_fault:
>   * Returns true if the suggested S2 translation parameters are OK and
>   * false otherwise.
>   */
> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
>                                 int inputsize, int stride)
>  {
>      const int grainsize = stride + 3;
>      int startsizecheck;
>  
> -    /* Negative levels are never allowed.  */
> -    if (level < 0) {
> -        return false;
> -    }
> -

I would expect this to be the only hunk from the patch description.  Probably
changing this negative check to a >= 3 check.


r~

>      startsizecheck = inputsize - ((3 - level) * stride + grainsize);
>      if (startsizecheck < 1 || startsizecheck > stride + 4) {
>          return false;
> @@ -10856,6 +10851,9 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>              if (level == 0 && pamax <= 42) {
>                  return false;
>              }
> +            if (level == 3) {
> +                return false;
> +            }
>              break;
>          default:
>              g_assert_not_reached();
> @@ -10871,7 +10869,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>          /* AArch32 only supports 4KB pages. Assert on that.  */
>          assert(stride == 9);
>  
> -        if (level == 0) {
> +        if (level == 0 || level >= 3) {
>              return false;
>          }
>      }
> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>  
>          if (!aarch64 || stride == 9) {
>              /* AArch32 or 4KB pages */
> -            startlevel = 2 - sl0;
> +            startlevel = (2 - sl0) & 3;
>          } else {
>              /* 16KB or 64KB pages */
>              startlevel = 3 - sl0;
> 

