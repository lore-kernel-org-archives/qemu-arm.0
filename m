Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp611507ejb;
        Sun, 21 May 2023 03:54:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5rfjfhY1ai8vyvFg1tOKXZBT/zrW4pcXEA1q82mj7p2YwDMJGv5QsCZVaSc3l+pPdqCCCu
X-Received: by 2002:ac8:7e86:0:b0:3f6:9473:7799 with SMTP id w6-20020ac87e86000000b003f694737799mr11985107qtj.55.1684666496634;
        Sun, 21 May 2023 03:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684666496; cv=none;
        d=google.com; s=arc-20160816;
        b=TDXTqc2EQyUZ8faWw6loIMP4oomLwOMrizvFTw5u/4bwVGPqiLdpHeCH3sOrgagtg6
         vbnt0WsDpjQxI9jPA2Jvq4GyhbfQ6K3NRDz8uJz43/GW7OwHzlpm+zPYRiBs8TIV/X7e
         LmM5ehjC6r6zQbt4n+FBDnUz7ABrovwWSsdtMVjfOLlk00cqQxTT3X3M7px55AZ3OWfs
         cZrgZSa2MhiyHuBfcaYooNrgUHpOtXknKEo9SJi0ARJ5dKe8bJYyDCNJUcgvJLwXnYib
         Aui2g9JMMGjp6J9Mb4Vg6WEuwH7LYZ2QYLqelbPgLXUmz8SCbDNJNR5afap8Gb+htGvp
         ipgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=j8+592qdCMoaZlE0TSoLcKETp+/AM2RvWSQ4KMWkHCg=;
        b=VQm5Kx6ROYDT9EA5WBZoYS7Y/GJjI80VUO8IUH5ZDtPAHBUg0mXXmVvEo7wyFqW/PK
         78nzwc/svmd/heZYlJhA4LwPFeowoiOS0oqP+aNPSLGrR84E0HwcwktHFUXtxx2L8Mle
         zQUZmeKbC4+VAfeLfm6jPV6r0rO25NYfKljjqyD+n1Y8WXZVV/3jrj/9LO+Re/aje5f1
         /aRocJdaNKwumgrPSX9t/ii9msRmHQraJ7TOKeKLfpstlJDMuftgMAQj3T0dazAzMJ7x
         7UGsyCCBMCJoYXVS4KtPuABH67F+XKmA2iF3R99c7ETLXXdeyQpmTCn6IO73GMmpMole
         HNsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=figTEWYP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05622a005500b003ef32737838si1624011qtw.716.2023.05.21.03.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 03:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=figTEWYP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0gi2-0003kM-CZ; Sun, 21 May 2023 06:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0gi0-0003jf-9w
 for qemu-arm@nongnu.org; Sun, 21 May 2023 06:54:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0ghl-0000Qb-1N
 for qemu-arm@nongnu.org; Sun, 21 May 2023 06:54:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so32752445e9.0
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 03:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684666463; x=1687258463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j8+592qdCMoaZlE0TSoLcKETp+/AM2RvWSQ4KMWkHCg=;
 b=figTEWYP7WTxFjab/R4iPLa7q4pbdDlCmgn+PlGK8m7dSMqtTYz7MwKD/821BE5nE5
 7zjzSioXj5lsvmkOkA2WoEY0JgsxSuD7WpqHpcWPvDubXqUtrWSWNlcrGErJgfn6TxqP
 9QY3+lDOb/BEVDCbrXpTRI3lyJ81Rhl6+c1FPdcblsPI4twCEvWHroZ+kaylIbSqe4VN
 qSwNKQUw+K2L5Z70O4oSV6eTnbyXO2bqDuMeiKtOe8wMCWAynXwT56Ox6G8aHG7GT+gI
 R1s09ntcxKd7VH0+A+nZN5e98qUO66Nd+KoXyS5WMr0hktHIIOQzXK0zA6tqVpk0cy0J
 Ys4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684666463; x=1687258463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j8+592qdCMoaZlE0TSoLcKETp+/AM2RvWSQ4KMWkHCg=;
 b=lM+eoQI5eHX49QTpG/fpTcMp+yJ9Y3vnecvvnkdbfgUCqRU8cjwbOYGdLeNI29oIko
 O854aj1QNbQqVRMbPpxSfijivjYAdOSX3pQ+ysWnprVWNc3Ut6qLZjbdSnPp50SWCmEI
 cmkD9UTJ9z3jQfKtWSghpJk5vQcnaSgJpO50vC4K4sxMKa+j68Hq0vWz3HYsj+C/+O91
 nXeBnMce1NfhMgrNhFhIo5vxAdHKHIAQm4So/2W5ramtFrM7P2LsFLzBaDprQT3aGJYU
 ee8UYyvVKTIB01Nf9Y7ovj016UTrlhAuZwO78duIavtIVHREZDfxBV8I1WlCU4Vbv4HC
 D2LQ==
X-Gm-Message-State: AC+VfDw2ZpFkTntgW0P+75CKOkbRQHDWHJB6qUX2+IDtLpc5Al2bZPik
 han3QXyT3SfZ2TBvhUnOQec42Q==
X-Received: by 2002:a7b:ca44:0:b0:3f4:27ff:7d48 with SMTP id
 m4-20020a7bca44000000b003f427ff7d48mr5245194wml.19.1684666462781; 
 Sun, 21 May 2023 03:54:22 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a7bc4d1000000b003f423a04016sm8081725wmk.18.2023.05.21.03.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 03:54:22 -0700 (PDT)
Message-ID: <6ff38111-2f9b-b025-5dac-8d98b6911199@linaro.org>
Date: Sun, 21 May 2023 12:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 12/27] meson: Fix detect atomic128 support with
 optimization
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.098, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: igVvuG+nD3++

On 20/5/23 18:26, Richard Henderson wrote:
> Silly typo: sizeof(16) != 16.
> 
> Fixes: e61f1efeb730 ("meson: Detect atomic128 support with optimization")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 4ffc0d3e59..5e7fc6345f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2555,7 +2555,7 @@ if has_int128
>     # __alignof(unsigned __int128) for the host.
>     atomic_test_128 = '''
>       int main(int ac, char **av) {
> -      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], sizeof(16));
> +      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], 16);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

