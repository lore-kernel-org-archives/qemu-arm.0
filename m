Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp761699lfg;
        Sun, 15 Aug 2021 13:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqZXzW4QJCoXUAtsIKgUoHtPDK9w19SVJ7qbnHGyvFGGEgh3nZ8ZbVpjmc/763k5syVivv
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr9436839ils.282.1629057772087;
        Sun, 15 Aug 2021 13:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629057772; cv=none;
        d=google.com; s=arc-20160816;
        b=AWgoyaZVG4nANzc8n1FR70MnzhnPbQPmn4Xinx4zFOIpfDwLg5xgU/zUqvhsBvxtTP
         iHRn6owgZXGAA+eiOysYTHyI16vujHa2m6Z/AmUYO9jNajtOfhacJ7Idp5oOTf79Cv4K
         dDZK0jq2p9Vaknv4FbB45xPmFP7PW7YgXTs9dv0OrXBcpIgGzOQB5+cO8P1xluGTfbkj
         0o4azmG4fawPOGxbPsNXLKjSfhB66gfk9tRGlp1JecHgXYLaLWjqxehCwl+QQWfPr2iP
         I3GJ5IIAxMypVd3TxDMKav8TQIFa9WLRVzmIOEbyFX7G/PtHsq8NGkX2xzwMSv0IHj/c
         ryWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/4toCiHyuNDrC5O23EgC39m8GgNwq82B/0Or2hqVnEo=;
        b=jnIVKh1Dczq/j8MItzFPq+ZL8H2lk27yDTDLmixz1LIn05BmbRgPeeSC0rNN48zTr/
         jgpAJ/Z5KwPc4D3oJAE9WMouwkvDDUQLVQjqQ2Jy6x7Ev9Vf6CQZ2ggMx/0Hf3CbfZQ5
         cOfPFLDBkNt+ZeM9jofPV5pF2vLUWm7tHFtVPq+4jWWccn7u4clbiWsIXUmzY2dyNLht
         a72hwO6Zgi6h3UVN/OiJSZJ5DjzqkE8Jy5OQsZnuZmtg6RN4URaCNIyapGko741dUyT+
         P2a2uLYK52SeXhdonYZfXKsz4b9cECFaHX612izdpLBQJ/DgymztD4fMDq3YjWuKvorw
         CWxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h40VAY/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si6859017ilo.33.2021.08.15.13.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Aug 2021 13:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h40VAY/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFMLL-0002Q8-F1
	for alex.bennee@linaro.org; Sun, 15 Aug 2021 16:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMJB-0000dm-0W
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 16:00:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMJ9-0002Tp-2n
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 16:00:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d17so18447023plr.12
 for <qemu-arm@nongnu.org>; Sun, 15 Aug 2021 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/4toCiHyuNDrC5O23EgC39m8GgNwq82B/0Or2hqVnEo=;
 b=h40VAY/fSUcEbqt98Wtf537XEmOgAEtvbfzQz+Ldq7xMo38hNAS18aJZIV9bt+g0HH
 itC2BqgIZPA4wWYsgNZG6rE31EcrdIL+OwBVnockgjlYRkzM28IXH9Bxa9Zy49Em74Dj
 ryFXkcFIbZLq/qMBLpAzgrceqQqUx126DILUeYAlPHEWRPVaVm7VabTGRjstrtZ5zZkX
 dDWU15efpxvQomufRYPRwvWCUYzslwcVLe/xQpDAj1YxW3yFv+yW52XnM5xyQjn7h60+
 lucN4FmMQE8xS4E/oCga4AEJQfPcNx3t3gANlbtMTfDuxDD1IfbWz8zVPjajDBrRIJuL
 DYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/4toCiHyuNDrC5O23EgC39m8GgNwq82B/0Or2hqVnEo=;
 b=d3XFDpyLFcmGLGJZMMQt17XLsnx1n0FjAuSPeZ3W0VR97dqVTaOlLa2XgYE8qDEzJ6
 s312uYVBGsF0vQMwozYH5dIYnjGIJGKz3t8AY3A3io8CLzHOEcHW883TltzGcfUZN6o+
 nqnJ0It5/kwX53/17Oyo2O+f2LD1wWpaMOy3ck0wAFGKouyTCP9ax2x6dFFClpcySERe
 lCmuHbSnqsB9wz4T+lDlxhUNCiA9MrPYMP8HguTDsXhbO4ewAqbieT4jDag8dEq1UIA+
 OTsOLx+bnd/vzJaa0zBR+HyUa0yyzU7txYBzpcRyOAIRD+yjyYoF9XK0DuqZp19aYXJb
 eP2g==
X-Gm-Message-State: AOAM531zO0LW8vQEpxUydwKCQuhzEF7ZeT0OEObtsYSkiQhnrUmeOgCH
 4mvUtxCb1m5yZpx833JT9JYvO5F9FgyskQ==
X-Received: by 2002:aa7:9dce:0:b0:3e1:3c5d:640d with SMTP id
 g14-20020aa79dce000000b003e13c5d640dmr8332921pfq.25.1629057633423; 
 Sun, 15 Aug 2021 13:00:33 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id p190sm9175945pfb.4.2021.08.15.13.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:00:33 -0700 (PDT)
Subject: Re: [PATCH for-6.2 4/7] linux-user: Zero out target_siginfo_t in
 force_sig()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <115c040b-8357-02bf-1483-3b3f5e56d20c@linaro.org>
Date: Sun, 15 Aug 2021 10:00:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZS6lczjYi7bA

On 8/13/21 3:18 AM, Peter Maydell wrote:
> The target_siginfo_t we populate in force_sig() will eventually
> get copied onto the target's stack. Zero it out so that any extra
> padding in the sifields union is consistently zero when the guest
> sees it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/signal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
