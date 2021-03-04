Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6570973lfg;
        Thu, 4 Mar 2021 12:51:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyydECwn+A7XTtYkkYAAZAhXCkt3CbYCBGNgmQRcjeNpy8uAKJ7Op5G8z+NF/VKh5UmTOB8
X-Received: by 2002:a92:ce02:: with SMTP id b2mr5937329ilo.182.1614891088990;
        Thu, 04 Mar 2021 12:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614891088; cv=none;
        d=google.com; s=arc-20160816;
        b=nZh5elq/C5ub8lzDeKOD3ushSg9l1oYQYaS+9se5Ycv3h23c3V/tWEkK63GNTTiyLj
         lBsnWCFI6QcqDLVc6VmgliEqMp7RM1cZD77NrtWo2gi61jCPV3vWDh8cdQyK+0/Cj5kW
         fW+RCLclg2v0BiRnbr9zhaivGBSFP7rvpc3ZHwp9PkKxeW+BKkiLbPlKyDBaufsa1Uoo
         qjqY3nNfYr2E128S90UNCX5I3Z9e6H3i0HLzqWy6u+ow5zFDVX8RKhzuTXugLVcgcn8G
         z5aBNQcwP0Ts28JEp8R69Hqqn3d+J6XUVYKBtCPtGKh0Jo2UKVueL/LJh8EFRBIARKO6
         XvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6pLP5zu3q8CA0s0c4vJ1MAheQbnNV7zP8YCFuWBGM8c=;
        b=f5vYopMek+7xGwZwQpx8bg9cR5lGm2gmQm2em632VPISws037MyiLMJC1QzZhsVZRM
         gNe9b00rV6XDTg1Kh7s9xALS+2bc2K3H6zdrQFWUvEO4isIHo69S5a8zBdU8OCH7tk6A
         tnk+gfNHSfj98hJHif/PyPvfkyFaUkJw5C6xb+WzRsBZz/rXrl82rvYC1QPJsvmY3KR0
         gYEfn3ScU+5XojDK3B1W13nb3vanN/4lAIGDvlJfEu4fBw8ZxJiALad2eLysJ495dBKz
         52StlHDPuv+YCFsbWOcbeeTZj26Fdz3seimiNHsRe/tY5lZZwI+IJauYprD9c6tJtzSt
         y0mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxOENe1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k31si332519jav.116.2021.03.04.12.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lxOENe1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuwS-0001lO-8n
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuqi-00048K-77
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:45:32 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuqe-0000Tt-7v
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:45:31 -0500
Received: by mail-pj1-x1033.google.com with SMTP id s23so7971583pji.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6pLP5zu3q8CA0s0c4vJ1MAheQbnNV7zP8YCFuWBGM8c=;
 b=lxOENe1kujLekYEPa9XI0pl0JuZrrAC68GHE0KSiVDyj7W+gCtjaViEh7vCMLL6Zq7
 cn3Xid5ZsAE9RlfK8lf9Rh6JI8Kh3Jq5hAEIWv2YRL5uoTty1vOS0TASYKu/8FKVtXMa
 SYG6e+uFELMunoSuwWWLCuXwQRbSXw6+jpyx3dGU7tF7RUlqX3uiixmWEnfn1tkpfE+A
 AKsbVM/foYd6KXBtdUHWG2CUVsARSMA7MfxrMkKwyXh8AhYxSUHMd/pGsOBvSCYC47t9
 ydHgEmn3WK6M9QE6ouJ/GE5DVXh89IGKDaPIJxJRAcu5ILp6XGCyXoCH7YE+BaYer0U0
 p1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6pLP5zu3q8CA0s0c4vJ1MAheQbnNV7zP8YCFuWBGM8c=;
 b=SaKORo316nsLhLF1lQc5s8k1b+o30h8zljVKo2HR1qlyBLL7kDF88dVSffSArCDVqx
 71dQM9/eQnQ0s/cyPlDgTwujlSOyES1df33+nsRSJ0MLTyJEoRsj3cy2TUV9tvbMqh3s
 1r6KQ35+Me/0KMmRvfK8Cvv835+mvDq8eFlMu/szhsjFCF8mpVpRgHPIyOEWT6z5gIEd
 IHH3P32dPGv2q0o+HQNqUN7TlhBohYmODoT0RCgqKZBwAMjQ+tt5ySBQ2aManptTJeLG
 pBa7+0u6MiR/ZIDojxjbGZ44vslAea8yVxV9iY4UJW+YrRGefrytmQZuhK+7uVz/k2E/
 gkAA==
X-Gm-Message-State: AOAM5322gdrz9kvcNoR4jcn9jdpi9jlPoSe9wvwaSnKGEXWTRGPF+jgs
 v+S+AS70yVCjcXlP6GUDL0sN0S5FPUF5Cg==
X-Received: by 2002:a17:902:eb11:b029:e4:a5c3:4328 with SMTP id
 l17-20020a170902eb11b02900e4a5c34328mr5723787plb.7.1614890726791; 
 Thu, 04 Mar 2021 12:45:26 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a136sm261996pfa.66.2021.03.04.12.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:45:26 -0800 (PST)
Subject: Re: [PATCH 37/44] hw/misc/mps2-fpgaio: Fold counters subsection into
 main vmstate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b97cf823-0bae-656b-cd7e-3881e0768ee1@linaro.org>
Date: Thu, 4 Mar 2021 12:45:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 85kGGVEpLe7m

On 2/19/21 6:46 AM, Peter Maydell wrote:
> We've already broken migration compatibility for all the MPS
> boards, so we might as well take advantage of this to simplify
> the vmstate for the FPGAIO device by folding the counters
> subsection into the main vmstate description.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
