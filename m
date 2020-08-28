Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1854932lfc;
        Fri, 28 Aug 2020 16:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKu1GHEcPTLcVd2y/DobVfGmBr6kVW87bls47dQ4VrZwZ3OC9AfMHGrAp91C7r1jjm91Ri
X-Received: by 2002:a25:187:: with SMTP id 129mr5451593ybb.448.1598656527345;
        Fri, 28 Aug 2020 16:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656527; cv=none;
        d=google.com; s=arc-20160816;
        b=OKlGPk8zUGx2yjX1doFBQL2qQo8R3zZJba8uin5Y/5qMd01l5Cv+yYTqEzJGa59RSo
         53Dmw5dUYkqcrHDdNTlCgLxcEw3WGiVbEB+6AI7k0fVSLJeowup5QbRtW1LSKA/YLZ/W
         mnn1oI4ekkIqVi/ddK+AhpXY0NLyKVQGn/OXqbyqnNkvODBNPrp3TIfDP/qa87K0knNp
         mzPfxWDodR0kDgXAgDa0FIqcWeDasxgNVj4I4rvik8yFCFbsstTzWGzxBwI++M+IAlje
         jO/MFLAzM9ktqPd9a+fknnAdjJZQGkDatVbEy81LvERpYfdoww1hlp9gdbOusNmBVRPg
         pa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=43WSVJzarsL3eZt2zG/DYCCayJJNxtwu/41CXWtyY8c=;
        b=MG1yUKrhKuStVs4lzW5m4XhPuqW13EG8jTBJ4vUa1ZtigRDy90uo+gI+J6Yexc8BTj
         DpTbPPoEDPVoH7NeT5mQjyAGSH+sGNooB+xXlb4qNHAGp21O8iOZPxyJMSn+y5ULsSqk
         FwMussSjrxm0uJ7ieFqlKxc2shZeR2IJDIethfLe03GBDic+0yOy7Oi6KN7KQshbvSqV
         vpEXvemvUMExdkgq1LXuqTNbclpGDsyPO/anc5RZYTQi/n8Tl4U3IfMoOB3Xmu5O6Baj
         uos1CvDCqlSMViDtCyQ/XCvlMGJXFkEwRPWROkAiy6QIpsr0miqqmmsvyb5m56px95Za
         CBdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nf9s4MBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si613578ybe.402.2020.08.28.16.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nf9s4MBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnag-0005D3-Mh
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnaY-0005Aw-So
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:15:18 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnaX-0005Se-7G
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:15:18 -0400
Received: by mail-pf1-x442.google.com with SMTP id o68so1406087pfg.2
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=43WSVJzarsL3eZt2zG/DYCCayJJNxtwu/41CXWtyY8c=;
 b=nf9s4MBe+EU/Mx9cmnB7sa4YyHFcm9xv77nJ7tp2Zd9FurISWNWYp7fHkAMAdw7lvo
 ij1zSGe7DHoIOJype3pqGAYaroPWd6J6USy6CqOjfOBLTAgNmMBKtrrsmNeZYTjbUCRp
 H+2oHTmwrqtldJNah/qiN1k4OCdcg7SEpuTSBoqMmt68X3YokOnDU/uJ5JPbh58Hg0/V
 k/YW8gKfVtLGOruMKGEJ9Top2BE6Xsh6t+wszNP8gAhuZHtpbSnVIY7OsMWqFxsz+6ce
 a1fp8ttCxvDzkBhy1cWCRLjxkQcpt03EfJKIUVJxlNIpXnPRs3UivUwBPohvvF/tjsVn
 0yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=43WSVJzarsL3eZt2zG/DYCCayJJNxtwu/41CXWtyY8c=;
 b=MbXtbzzZL7pd0VldqIW8ONMg6Y/MGOCHbbgiHjNFYXaETkLzwU6FfZlC07Bkg6GTM5
 pPUu398BaYHgJ/cKH6AtZst9B0fo64ezqhuna20sFZeijlkWbdygZiFOJk/O+r+xaR20
 y5Ygde8/RqmegY1w4o/pu1UwZ8k3eI4w8T2UEKd+hj307/pQLIzyyA5CzBKx1zMCqg6D
 8otSrFRIp2PaYGuZs+kWYbC78IpeXYo4IHaD4zdzoyRq1XvmejONB2IuZoii86r3UWQk
 2CqiEfqIBu2rcHsY1mm7pPmdmoJEEh1RfOHe6F2QI+9mCT8OPUgvcH7XjJUZsP5918Qu
 x4HQ==
X-Gm-Message-State: AOAM5311AkUpoRHbQj0ZT4mj4pOX6xeG4dFFKzc+3i2VOVW2Z9WUZuLh
 IU99C+NjU+jLj0xMWXzzuGpCXA==
X-Received: by 2002:aa7:8c42:: with SMTP id e2mr1016889pfd.181.1598656515947; 
 Fri, 28 Aug 2020 16:15:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id c143sm497501pfb.84.2020.08.28.16.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:15:15 -0700 (PDT)
Subject: Re: [PATCH v2 40/45] target/arm: Implement fp16 for Neon
 VRINT-with-specified-rounding-mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf4cad38-a1da-ac71-ea60-667b2389abf8@linaro.org>
Date: Fri, 28 Aug 2020 16:15:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QRCYxNGRClB9

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon VRINT-with-specified-rounding-mode insns to gvec,
> and use this to implement the fp16 versions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  4 +-
>  target/arm/vec_helper.c         | 21 +++++++++++
>  target/arm/vfp_helper.c         | 17 ---------
>  target/arm/translate-neon.c.inc | 67 +++------------------------------
>  4 files changed, 30 insertions(+), 79 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

