Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2135737lfb;
        Tue, 20 Apr 2021 06:49:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEw0YPHtxmejFVYE3WJ0XBGhdwJZV8B+k8aBDRgJzjRFJ8nVuE93Q7BdDOJ12vmH5RHseU
X-Received: by 2002:a92:d688:: with SMTP id p8mr21578518iln.268.1618926559457;
        Tue, 20 Apr 2021 06:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618926559; cv=none;
        d=google.com; s=arc-20160816;
        b=0GVXT9wCCZUGNJemFv/YFCrRBoe8/BJlaCi4N0TTaQZJcYjI7UrFNfvpBty8U8f5JM
         0s+7WxX/4uD7thQUN4trg7yP7CAH573xy00y5/TfWoLpXwZObYgbXojRvBYYxAd0d3h7
         NIp4U+8bK8+eB9KIo4gvB24KGxXlrmH+S2F8yQZDWktg1QiUxsYBPDuEkq8GaG/CqfUL
         P9o4ZMMkoUOLNTfySitjsdau0WVMLaaKC7Vd7Ywng5O0dQaf+dA5yF/+x0penTMMLIjc
         pPWhCD8t+gCGKruZ1hiprpb68zZmUs+tsR76ICIn/QG6iIrAnt5CpYyyXogX69+8anKA
         5hBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LvkpkY5KJdJUvplp80QAEfKZKhwkydoye7tz53Sgu5k=;
        b=a5QdC9Vz4fxPmP+md/WA21ea5WXr8eKZNoe4/N5V8b9U+aBNnJgfMC+2330Thz31Yn
         ehlzebc9itQvYE+MywSl3SdfjToHry7PzX7r/dzywUlqd3XBjEzqhDAC8VMbH39cxeVE
         xYo/cAbaRSCKodtuBIllH02SgRdbIrZ3LcbxY0OdfIbjA2hcN8g2fduyD6vePmCO5b+V
         Mr9R/6AIq4SMblzOrwKxME+EmscEQaB+JHSrGq/OuCHmEQJSpLbysazXMjp5pFWoEvOJ
         yZCCRZGXFyUfFc0mUmY+LQM0oWWQGG38bK60KZuMZT2Y9rwFjHQaG5kosBJMp4iup32s
         Gd9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Ovegm4AW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si18458821ilo.12.2021.04.20.06.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 06:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Ovegm4AW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYqkg-0004Zr-Oy
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 09:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lYqjt-0003wN-2Z
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 09:48:30 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lYqjm-0005XS-2u
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 09:48:28 -0400
Received: by mail-qt1-x82a.google.com with SMTP id c6so28680213qtc.1
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LvkpkY5KJdJUvplp80QAEfKZKhwkydoye7tz53Sgu5k=;
 b=Ovegm4AWSbg7x0ierMIyWc8jzE7GieoLNvX79bDgu/4WPxOmkM1JhP77/4rYdHjhRf
 I5Uzwl/S7A+tpUVSBK8nX63btYgJzTKuOHO7GfThSXNE7JyjsNpKDBZThHJcnURJgybQ
 DPAotDbLjGiWXnuOHWZX8BGmmUTZQH+XSySHmw+4W1l2d0nhgdzOsgxBAo0R21ab4mAP
 GkCVxGfsz3s0ouZWuD5o+RPmLv6FJjAgVnVm7Vz5kOjFuWDlEPPqX26WnWqZYr24zbTr
 VpSjd05mn2gaCT+BqQtN5CruifnrvqDKKcYxe8qBzk41T3w+5r54VRrYM2dGRpQVDaTW
 fC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LvkpkY5KJdJUvplp80QAEfKZKhwkydoye7tz53Sgu5k=;
 b=nfQxaAjIYqPrCzlbbzzYWpYpxauevVQgR6whG8VHzGEIIMMeRPCRJ++ZCfs1RUHda0
 qT/iZczARo/TnwRQwfHnXz08ArirHjn65M+6EKQpQjLHc5Pu5PhU6wf2y9w6d57NjoZu
 GXgvCW5QAeBPt0PAQdvoatE+Sbb1gen9TxHWonPpPn+Ab+Qi+DoEyiQGbLmZkdU3t37X
 5mBeQlJ9tK1e/TBOFbmuN+/3HDBb6bOsZBFV/8fwdgI7Ru1/yuoBKuxatQF0iVF055k4
 LJ0maQkm2KUznl+LDQTQSuQ6lLON+3w0OTYHZuLp8Wb4Z3YHRSIJndQ4yscNjm98TotZ
 3QHg==
X-Gm-Message-State: AOAM530fn5hW3Fd/DDStZCoU5IYqgWCxKzLeM9frKE75faPV1pY2jGeR
 wDG5LrYKELcwpnHoiHgY4teQzA==
X-Received: by 2002:ac8:5f10:: with SMTP id x16mr17218030qta.6.1618926498798; 
 Tue, 20 Apr 2021 06:48:18 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b3sm10178463qkd.29.2021.04.20.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:48:18 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210420123106.10861-1-peter.maydell@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <d4a6e840-9b5a-6417-6dec-201976c5efbd@nuviainc.com>
Date: Tue, 20 Apr 2021 07:48:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=rebecca@nuviainc.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHCZq/wDYWHN

On 4/20/21 6:31 AM, Peter Maydell wrote:
> In tlbi_aa64_vae2is_write() the calculation
>    bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                              pageaddr)
> 
> has the two arms of the ?: expression reversed. Fix the bug.
> 
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d9220be7c5a..957f4247010 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       uint64_t pageaddr = sextract64(value << 12, 0, 56);
>       bool secure = arm_is_secure_below_el3(env);
>       int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> -    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
> +    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
>                                     pageaddr);
>   
>       tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> 

Reviewed-by: Rebecca Cran <rebecca@nuviainc.com>
