Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp683384lfc;
        Thu, 3 Sep 2020 09:32:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYE91MchGkd0gn5/+zaDBunPG/N52ljTZTpkrXA7CrW7Ful1hZSzLfYw6GYEdG08Ekv8/U
X-Received: by 2002:a25:e83:: with SMTP id 125mr4221123ybo.376.1599150742186;
        Thu, 03 Sep 2020 09:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599150742; cv=none;
        d=google.com; s=arc-20160816;
        b=LikBqmG/np5Zj1XbsHaPD3J1fsIwzSaXKud1JH+1RQY4USVv1wfLAEwXipi1YXJB4r
         3+yMqHaLyrtFq1RMAxypkQWHYPSKT8PpyiOFprBQnPq9u5onAE9IybdyQAm+lfzZol89
         syC+9kZeLR22/R0HbDFL6auh2GvUWaSWbHj+7MSuQZflk3LnrEv57InonkEQH0nxDIvj
         Patj9U8F4CswaP75fPiaHY4o8NCUWxr/cK3qplLLpoDC7akNwozuN1KyLnFvcibz6Q86
         INITnDiVs1d7Ez+ea7IGeBBb7PuTbPyf6qfbiRIm4gyDjJdFmHVuC4wwXsbkA24F88rx
         DSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L831aU5ZmFVbPOJ34eXzeRbro0XWUt8QHQegjM49WvA=;
        b=07VwSVMMNPlc7K8IGXdMq+8TZGM0wf1CwD81x/aig+M33n7LtTOmlxPGQvw5zRpDb8
         UxrEBtGJA4xj1uPS9j+JdjyMh/JJq0oYH/FjuKMdfKNdQUBMU/VW5gM5SxTtwOV8oNng
         7wz/1gw8tM9SFMwXlR+ACbF11OFlaB3bYMjVAN31RS9cXP+locSvI0oPl/ASQ1OqhYeg
         q643nMgkSSZ7we63pg4UWEJ2Bfuoj1d3HwXBDis9NqKxfuJ9z+Nw0aaKKLXSJUUOZrpH
         tvdLfnuuBC+go6GrK2lF53WIkYa9+IlUNC7XkM2vLqBEe8pOyeFqOcmRg0xCkG4PiVuD
         N+gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlOWKZ1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v81si3458988ybv.32.2020.09.03.09.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 09:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlOWKZ1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDs9t-0001sy-GA
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 12:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDs9h-0001ri-Gg
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:32:09 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDs9f-0002uZ-U5
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:32:09 -0400
Received: by mail-pg1-x541.google.com with SMTP id m5so2556258pgj.9
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=L831aU5ZmFVbPOJ34eXzeRbro0XWUt8QHQegjM49WvA=;
 b=YlOWKZ1viAlrSkec0I819gea3M5D+fD67zFaOJbLw4YJe8RbmYnZca0muBfW4AyoY7
 2wmHeVH2b0f4McsBPHKsSq3osPjsb91Z9ll48OTsOrDSkCCDW0RqxO+A3lrrOV5N6mbP
 Ke3uk8mvaL2puZLLS9TIAfUG6qBEoqPXjuwEBLl0hBqMuo0ZrRjAW2LSvK3Y8FK5Jy1W
 whN3kSasQEQCsIor7SgGPqDn4VeOwtO2dF4qy/f4nsrviLzfL8soYYElMc9wQpnD+ggJ
 cJZgdR/8ouAdkkDiSKVE6zgKpAM402EzeaUKbE419TwD0L7iQa0TR6UtR0LFO5zKS1aj
 fenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L831aU5ZmFVbPOJ34eXzeRbro0XWUt8QHQegjM49WvA=;
 b=ryCwrmu5bbuuoleniJ8YkDqQ9DgoF1zGiZvTJslnwL9ZAAzSv1N4pXJFupEy6lHXPG
 RFs8AlNDuCEMn3sUplISJBXA78nTvGpeY/qMIEC2oKyNzTVi0JnJ/Cw58M7PW00tcgzG
 tBSVz88VD5EcQsrwvU8oi+D++GH/ajG79BcL9Q/1Hklpal2PPOD3uPjoyCufF3MrrTsq
 odShawWb9GZdQ8GnOgg+jVi/FsVbSwMlAc2YHv5zfztV3g2NELJjl2GYZOajbTD5yOqO
 MMOYQglhHnjHuRmteeD4SEYPfYHAgV4RIptBwoxXYMjpGxzE5k4WflVGlYLUcR6Vsh+g
 u/Fg==
X-Gm-Message-State: AOAM532U8P+FNQp3xbDBrd1Jcxd+awqkdSoPtjJzYxF4w0n+ianRTv8Z
 GZPzUGIiasoZ6PPlRbJQP87Npg==
X-Received: by 2002:a17:902:7c8b:: with SMTP id
 y11mr2287353pll.10.1599150726529; 
 Thu, 03 Sep 2020 09:32:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i6sm3332916pgl.25.2020.09.03.09.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:32:05 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Convert VCMLA, VCADD size field to MO_*
 in decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200903133209.5141-1-peter.maydell@linaro.org>
 <20200903133209.5141-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b544b983-8836-2741-7380-6a98ce4f4715@linaro.org>
Date: Thu, 3 Sep 2020 09:32:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903133209.5141-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.403,
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
X-TUID: mr67pxUOPVXr

On 9/3/20 6:32 AM, Peter Maydell wrote:
> The VCMLA and VCADD insns have a size field which is 0 for fp16
> and 1 for fp32 (note that this is the reverse of the Neon 3-same
> encoding!). Convert it to MO_* values in decode for consistency.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-shared.decode   | 18 ++++++++++++------
>  target/arm/translate-neon.c.inc | 22 ++++++++++++----------
>  2 files changed, 24 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
