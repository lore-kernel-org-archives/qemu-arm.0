Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1848202lfc;
        Fri, 28 Aug 2020 16:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm/QHrz1aHOWHFOvZjl0n4DcqiXnBRo8ETuJY/kErgjs8Nr5nk7C1GtHokkW1i8+7N8z3D
X-Received: by 2002:a05:620a:138a:: with SMTP id k10mr1333273qki.171.1598655822074;
        Fri, 28 Aug 2020 16:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598655822; cv=none;
        d=google.com; s=arc-20160816;
        b=un9JVJhgluMY6yFRIVTFZJg1LvYBJct/fwKBuri4uj04YoZ50C+x8I+jf3X7osjs0K
         Afx+HBG5zdZbPxscVt6sfj4+5Ap34Vp62BDRaltgY0+0wzvUEQRq+xOUc/v1cyDoG7py
         ptYe92F7laehw3nTNAJIqdJSIpMBBCo4J3NZuZIfHBrsoMErAUT/hJlo6oTNbiGhpVxQ
         ulvM9jRm2K6xCGmnurWVlJdWX7wayqFHnqrGlG2EJ1lBQ5kx1U1Fixx28f3IkHAXvhS2
         zqFh67WYghvI2DEnExOAMuHy1MyxDaj6X4yOlnNQUKM1lUAwsBKU+Ii3j/DsQCq8+yo1
         oKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=16U5h2+omcHRezP2Z+Rsbzo2H9LneSg5ccc0ODKIVOI=;
        b=IWYYt6NqZfMNmVuAtjeTZRCCQ6rYlHQB9r1NKizh7vQQR1GbIrc8iU3b/K09XNdAOx
         5w3tpsryBe6GH4Bjbj9V+ipK6FPAG/WVowfQiqThZHJdhkw9uXZ5Pzo+o64on58SceCJ
         KMYvJZwoTy8M+/7KM++CsOgU6xeIMkTE7U+1rL4lvWDmNRf/r9AEVtNhusbSnHIij8he
         IQyj+yy9fgXYrQ8Sk3pSDugafvdL/wwjb/U+lGXGwGIFJqfDc8LeptvkgwSLHhueFMG3
         FivF+mr7GNa/oPiMUiC7WKOFDq6M0P4A32ie7/Xpc5veewuzUn7ZWFh76B4MCUHeeEVi
         6Ayg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D066cukn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si479743qkk.370.2020.08.28.16.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D066cukn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnPJ-0005hM-F7
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnPA-0005gn-W1
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:03:33 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnP9-000422-94
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:03:32 -0400
Received: by mail-pl1-x641.google.com with SMTP id j11so336196plk.9
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=16U5h2+omcHRezP2Z+Rsbzo2H9LneSg5ccc0ODKIVOI=;
 b=D066cuknbxZ+bqyVhWCh1voX8W7WqIX5bd1ffNed6o39E3mCXtYKgBjTIfPhXHXUG/
 8zg393ke8gJluATSXFettHd2khOHkeZ6rwWw/yyzlGVkZx6dhZPeNvhsdU1pwOpH71VJ
 Nm8eulH1TJqPlYqfshGOdwNGeG1Yk1NexJKjW5l5EN8YxO8WR84K3HaBQaB+VLKWWvJN
 10nUkMQf35VebA73UW15T98U4I8GGNyBJTg9Lqfnf/U9e+0OW6LNVNWKg9Bvn+04d0+6
 lZiUcsoJ7ARUN6QkM/RRBgMskJO3Jt1FgZN6+cHZibiwWBMMcvaHEM2ng9uXj8EKNKPI
 2Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=16U5h2+omcHRezP2Z+Rsbzo2H9LneSg5ccc0ODKIVOI=;
 b=oADHMMbzeYGkNzyeNtPX+Os7hBpO8asN9N1ekpCC4w1ZiWOYVEv5t+3i/Ro3aiH10k
 NBSbBLEBHoZLI5gxXKZ5pOZFOMazPgGARdzBXfeSmyNG3W9lPndtA4H/Aur+Cu5+P7pE
 VtmroKoQMVh5HnNLQty6dHl1hUI+D7ScZ9iP1uQ4W48SKwC2rTC3Y7qbcivTfhCKuIGI
 YXJhD+D/5Ph3ja23S5RDdszMg1ayde8r3mgbIomG9OU/qMdKYS+fdnQBT7NpGtd14rea
 eEZpemdI8GEJtFb7Bi+PkbJGw0qYDoZF2qpICuabu5ehNDa2YdWBUHpIzJnejP7U6RZ/
 jh/w==
X-Gm-Message-State: AOAM531R1k0Xn23qDldDVPzZGFd+hVfiosxNNl+BctRrBgzkwN8mIQR3
 ljF6Bye13xM1iKc+d40zY/qxjw==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
 i9mr909574plt.128.1598655809678; 
 Fri, 28 Aug 2020 16:03:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y203sm484745pfb.58.2020.08.28.16.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:03:29 -0700 (PDT)
Subject: Re: [PATCH v2 34/45] target/arm: Implement fp16 for Neon VRSQRTS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57f2aef4-5395-f474-c56a-48e81ea0b15f@linaro.org>
Date: Fri, 28 Aug 2020 16:03:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-TUID: jfAiFAWdqUcB

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon VRSQRTS insn to using a gvec helper,
> and use this to implement the fp16 case.
> 
> As with VRECPS, we adjust the phrasing of the new implementation
> slightly so that the fp32 version parallels the fp16 one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  4 +++-
>  target/arm/vec_helper.c         | 30 ++++++++++++++++++++++++++++++
>  target/arm/vfp_helper.c         | 15 ---------------
>  target/arm/translate-neon.c.inc | 21 +--------------------
>  4 files changed, 34 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

