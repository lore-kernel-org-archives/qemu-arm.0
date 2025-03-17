Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2337928njb;
        Mon, 17 Mar 2025 08:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPq7V2UhqLWshTsCDfJUVjabB9CkndZHuZiq/pEnytIXEAe7deMj7Hcnlw332CVTQTM3zYqc0hhsClQw==@linaro.org
X-Google-Smtp-Source: AGHT+IGj6Vl0ejhwLl2PguZnEwatgKd2o1wZMHzJlnCacxk+UfzZVi8htr6KyJ9ZgCZEREyr65di
X-Received: by 2002:a05:6102:304c:b0:4c1:8928:cefb with SMTP id ada2fe7eead31-4c383161fb7mr8498830137.12.1742226363270;
        Mon, 17 Mar 2025 08:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742226363; cv=none;
        d=google.com; s=arc-20240605;
        b=Mu6sLArdXWigf3XuA3XQmbZjclcOd61gCZlc0RxccF7T4KKt2NBTsvanW+gU2YY+vj
         sT7QgyzPFTAUCYGy/o+OAXS7aQeuDlXB+LLblDpk0YJBhYAn8/X5FmYQsnnYAi2UC77h
         vb8Y1hUDssV35S+oJHn9EnKacUTuKw6EOSCIsD8QNDboEovoHV7kumG2XRpai2ICmfBE
         e2ORdB2DUIvf1rEAh3IdrDkgTUe0D2h9e9dx+VbpgYxiBY60T9e26Ubzhx9k9MlACKMq
         WtxSOkVYRC7CVKXKGKV85ROpk/btK28ShP31SfBmkesBBBqN8W5dOIE/UPDTfwFCS8IV
         t27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gMg8UhcXQHvIEqIXGuOtUyJGW27mx+wg6KBctft4FEM=;
        fh=dcKof7F957NRHJQkYzCtFfQrUHqeiemDbs4YZ8QUElM=;
        b=Tz6XzIWOEiuvrCI6G8JajQJM4bXFUSWuH/R3rxUuImo63+k3epzsEwaU8n/T4lwvDM
         43tpI8yxoYyJACXvktglK9s8A0CQf3Tl4AcZ+75h7gBUGX/3VMlObxv0ItO/Z+pzUDDV
         8cOaik59DybTvl1SiukEocFAkofcnghnLms03flTSeS01uqaQ4MaSiJIBwj/kbMDLEdH
         iQIQQV3WDdLyKBWlCMescI4dLwLK1cd1TimeSM7fopOR9mkZ8jYHiRKeErF+WMK+ZO/N
         UWF4+c12II6KluhJ0gJvTkE5AMb+WVq0PiuLFNojuZa3MpES3sV2F7+IeImFaJArMVlX
         hTzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MtR//itH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c374a819absi2414430137.330.2025.03.17.08.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MtR//itH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCey-0005cw-2r; Mon, 17 Mar 2025 11:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCee-0005bD-1i
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:45:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCea-0007CJ-EO
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:45:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so10967045e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742226320; x=1742831120; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gMg8UhcXQHvIEqIXGuOtUyJGW27mx+wg6KBctft4FEM=;
 b=MtR//itHsUlhEYQQeeTT8xDcNGJPXab86WfzLBDTGR8ENtZ5hykscUDNwcHBjBfXco
 WM9Jar4BK/VDA+VIaIgDDURelNSF00K3HMq4R7SMZfkoR7rxgnQtRTQ8fwCNvhhpYuBv
 fxlfTyvIUFJP9EIMdiUMHeC+kERGZV02BxQR1jJz0BzqTcYuz2/iGL1pYCorqCwLVjft
 14VW5mM9pZx363tJv5cD7e4PSabkTE+h3/fOjt8Qiy+OpZXe0vzTEBJvVYJC72H9SR15
 xvU09bPboMk3AVupH0otV32+IRsg7DlK6bZpy//4WjAAQaIVyfCRmqHq/z2BKpBJxDEG
 Wcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226320; x=1742831120;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gMg8UhcXQHvIEqIXGuOtUyJGW27mx+wg6KBctft4FEM=;
 b=V7mjYTrrzLpjKKKWiiVGwIQEifxrHjvfrWqln8D6Mz7b0OHczvZ/KAv33vyNY1fBSj
 uXj3+Pc4HXkbRhaF10WVgZabkxFv8+15a5A5ETGKizdff3HVgUXZ3+SxfSnd861G7eC9
 +E4exQgytASEtm4pInrtkvrIIPIME88pBclLr0AxlD0GemcOucDUDWbaJEF3ifYK2M47
 h5/191pCZ1N8Y0ffQP0c5B2tdRbtr1ROmwrZR/AHAofhqmmY6Wmy70Dp4i64goNBcnhs
 WE+WMV7GNqBg6DRuZahUKDaohCzJKMQyQjVSIv6xL15UkkkPkGp5veEqGyr0/mVZv0xG
 d0Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKK+vxEvXIuD2wPlL2V5zdDTM2FE9JB4c3ddZOXhgCdoYkskboemvIPbE8tF+eZ1Y3vO4NSPnJYw==@nongnu.org
X-Gm-Message-State: AOJu0YxvfAqwLvugaoKeMkMgC4SqYeCfNJke2zc6QFiBT1VAfZyrXZyn
 Yo07qk6dI1tB6OhlAn7JBq7ybuQLAURyril1HsXBim2dB0WNbjpVOnwK0l1F2k2hQqRZDb74rhl
 m
X-Gm-Gg: ASbGncsAaMDJZFDDYXXwSRpi0OTPHK4IaIZfClC8CaFRkco4qvBEBQoelmHmuCxI95d
 uJT3x+xKoEuPr2+NbvBvCUlMhvZ0JlmNW+kbTUt4WhPF+XzlK5uTRzQKOCNYYHt4YD9TAfklotx
 9Rr+wOXTfgofIA2EGBh9998Q70E3KHOzyJx3dQKJj7tWgXtAzz99WGLUPZuFrOcOSrpJ6ttkXKz
 gXtwkpH6d6MbztTzOsJahK1ieqdPDbGj65YU5a/3UtaODAZ5U02WORTLgWLGqVcJJosYUE+QOTE
 jrO/xE6MtFlrhPSp+d4j9+YSxDZ3bNo8Xl7L3tnOxOs3CPzwKd2XCWw2XShjtZYb3nHyaukAV7s
 wpua4PAFCQxhlqh1nDH+/
X-Received: by 2002:a05:600c:3c8b:b0:43c:f332:703a with SMTP id
 5b1f17b1804b1-43d1ed22601mr131368045e9.31.1742226320172; 
 Mon, 17 Mar 2025 08:45:20 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ea197sm15103229f8f.84.2025.03.17.08.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:45:19 -0700 (PDT)
Message-ID: <6fdf3825-bf14-4054-a7f2-a2cd78cfcabc@linaro.org>
Date: Mon, 17 Mar 2025 16:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 6/9] target/arm: Present AArch64 gdbstub based on
 ARM_FEATURE_AARCH64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-7-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rrzLbYWqSezK

On 17/3/25 15:28, Peter Maydell wrote:
> Currently we provide an AArch64 gdbstub for CPUs which are
> TYPE_AARCH64_CPU, and an AArch32 gdbstub for those which are only
> TYPE_ARM_CPU.  This mostly does the right thing, except in the
> corner case of KVM with -cpu host,aarch64=off.  That produces a CPU
> which is TYPE_AARCH64_CPU but which has ARM_FEATURE_AARCH64 removed
> and which to the guest is in AArch32 mode.
> 
> Now we have moved all the handling of AArch64-vs-AArch32 gdbstub
> behaviour into TYPE_ARM_CPU we can change the condition we use for
> whether to select the AArch64 gdbstub to look at ARM_FEATURE_AARCH64.
> This will mean that we now correctly provide an AArch32 gdbstub for
> aarch64=off CPUs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index a14c269fa5a..a18d87fa28b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1694,7 +1694,7 @@ void aarch64_add_sme_properties(Object *obj);
>   /* Return true if the gdbstub is presenting an AArch64 CPU */
>   static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)

4 uses, maybe worth removing (directly inlining) as a cleanup
patch on top of this conversion series.

>   {
> -    return object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU);
> +    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
>   }
>   
>   /* Read the CONTROL register as the MRS instruction would. */

