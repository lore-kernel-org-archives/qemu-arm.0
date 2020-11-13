Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1726084lfb;
        Fri, 13 Nov 2020 13:28:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxSRahq4xtR1yqF22WaMWBA13IcLXk4kOx6qBsgWmvbmTpHS0cSgPrvFNE6gAQztIV51mD
X-Received: by 2002:a25:786:: with SMTP id 128mr5313089ybh.19.1605302915395;
        Fri, 13 Nov 2020 13:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605302915; cv=none;
        d=google.com; s=arc-20160816;
        b=XXsihXDZG+NGv7MEcdEN0czDnAxpM/MsM+jJTk11aIebcjlXG/ofPo9DG3aLHss8l/
         Ci7N/MZOLRWX82w7+qrloaLYjMt4zCkFFdCahQCjE8wlVxeZVlhEXc9A+iWB5SD9QMYx
         MpMjlRTPRoczPaZ9eUMKJXWBcAFNs1c7dyOLKhDqrhNNC5rkpZM/mKWO37LFKUPPr6Wi
         hs8qr3NlsvjBULzNoGUcj940Kf7uLq3UT+OOSVaKxTPoAnbdHgD/LgWjjSka7N2VSKmI
         4ctw+3AjoEaEX1671UwOsZeLepbJNgyHEJ4XQj9GeiTs9PFkOqZnhjtgRsPzuPfDgedg
         eM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zkrnqIcBAUCTGXusmainKd107oengVqmGW7MiQG/UkE=;
        b=AIWLgo9j0rPAo61uAVl0U+QQKcoVRbM6TvEmoZAui6GWnF1v4dPZlptjOsAe087x6v
         w5O6WevoYxGpcGkLw9cvPThBeTKaGExDzt6yNd16nbJgdOVp9vbndba8/bzZWvDK5BEw
         vK+7Zc4rHcZLkIAEkUYaONmsC+qnIcJxSwIRkKbjwzw2cebUwmsltd9KCpbhfwrq9vxV
         XBrz8XJVLLUlrD9nNfbQ1M7+6DdYDxWhQJReLR6eYecCnI0Ri6c1ONWyfsyuyQijdyF2
         6ncuIfbuF/+2+tejXnHVN/NCytP19rMvmR2XPkktasWp6SY25qxWB2EMMxkz0sDIjv7g
         kFfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zAxbwA7s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145si10332141ybc.160.2020.11.13.13.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zAxbwA7s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdgcU-00022g-O5
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgc3-000200-7V
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:28:07 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgc1-0006oq-IS
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:28:06 -0500
Received: by mail-pl1-x644.google.com with SMTP id j5so5154978plk.7
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 13:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zkrnqIcBAUCTGXusmainKd107oengVqmGW7MiQG/UkE=;
 b=zAxbwA7sI1/NW3GCCb204kaIgoUATr2Cjh7N9cwasx9SNJxYA9s5paTRMRtTNFf4VD
 Qm5qgCV6L0hvay1cQyXTfJeBG01krF02CO/Avi+HamBBmJ2SRXOvYFDFKBELYoMwsR2H
 UAIVR8grVhX5SBUEQW4bhEOOxEFT54AThzzTqcBQ1l0TwD7Y2laCyhwKM9/KXXHrCpdi
 TS4cFl3W6j2aZd8cAcaILvvLH8PJnMLPc1Sl18hngT6ABZbgE3VwXFKTxKMHOTKL99HW
 /mLdtGRUsN0gapFlL4dJipumdNkz0AgmeR5QIA7tJGCymLh1iihc5NW7BHxpTOb81FkM
 pLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zkrnqIcBAUCTGXusmainKd107oengVqmGW7MiQG/UkE=;
 b=EW7V5ny7586Q4A99L2ugWtXDyfm29XMAdmq/vnnXVBJofBo+MDHFI4p8OKactrTNJt
 pWhO1syArzn12G1CtgwYU99QKy4qvOhpkEJYT9HWAfTsnwT8jHRAJE2Fc0xO/IC8VF8m
 ovdvcO+6A69n/EjDdpXgnaWldvFG28ldWTeaTjVUVn+KHJPJdxyGlLB7R8d65Xs9dDl9
 G8KLbl/sRXVzpuMzcCvUanlexIXEidOCQ7N5b+r0OUOppOyYnu8F/y1vqfVrO4ACwEDr
 hnuvkzklWU/0KZ7I4ceJFRPQM5EC9OcBO0k5E9kL5SmeMzfTWIHx+R5vwZ+S6725vVCr
 PIag==
X-Gm-Message-State: AOAM5323JvlqVQkpGLDQh1U0oPcoKc8y6+8c+Ma9wpFl2A1p8UsGr22G
 55zIcNyOz8IdBnMUW0WLHSsj1w==
X-Received: by 2002:a17:902:6ac5:b029:d6:4e05:8343 with SMTP id
 i5-20020a1709026ac5b02900d64e058343mr3523281plt.8.1605302882805; 
 Fri, 13 Nov 2020 13:28:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a28sm10743392pfk.50.2020.11.13.13.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:28:02 -0800 (PST)
Subject: Re: [PATCH 11/17] target/arm: do S1_ptw_translate() before address
 space lookup
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-11-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cc2a0d2-e8f1-ee35-3922-80e19e0b8a57@linaro.org>
Date: Fri, 13 Nov 2020 13:28:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-11-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: LbC58csVT94W

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
> bits can invert the secure flag for pagetable walks. This patchset
> allows S1_ptw_translate() to change the non-secure bit.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
