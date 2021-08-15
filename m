Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp756955lfg;
        Sun, 15 Aug 2021 12:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhqXr9qSpCl+8tzufGBCWrrWwhtlAuxETuQnXOgoyTUVEVTkNMb5T44czxM58U/j1lRsKj
X-Received: by 2002:a25:2008:: with SMTP id g8mr15799805ybg.502.1629057239912;
        Sun, 15 Aug 2021 12:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629057239; cv=none;
        d=google.com; s=arc-20160816;
        b=gqEAHV/wVcInCWpZXbwHoIGh5BeAw4B2ZgdytUHFEkIpx9yst2LuQOUhnstfbtlrPk
         rdYAOpu60HyorLM0XuF4aj7HA8LaOFOruEM9cn9SPd8pcQsEIRhQv74FZus7W/9NUnBF
         9eKPtxraURpxNZcsywi5i3OJbt0ZEv4TjfZNcJI/MCh/u0K+FVl1a5hQkDUHZ2HqymaZ
         yRPcMTgMCTa8E3lYF7MhvYH+cCsYNR/xh+4gQURfl+74KJTgo0H1imodIk0OTbDnexKf
         z1x0p/l4tpxFIJ32VN7FrtX8Fnsn/uffo3z+2vWJC3XaCdj9SVM+wEepdjP5b07fUDmj
         yFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0qkhmpW5VfmWP/SFxE7w1XwtkrhERBX8GLkvHhHhbWg=;
        b=Yn6cMYiZkVHietdtzEU3OEID3nIq7tVeKf4hev9jO2J/LIwfjDpquDGn60XMHDxz3M
         qP8DpLVg8yntZdsTzmV/mTjU/AnyIWopC/fTwq1eKxu9tvjUnYFIGmfW5em2mqn+mApA
         tE8vonYPscNCtYPeAVOztfznLaIRhN7CeRr7dOU755u6UwZOZRcBtw/3w6PmBVhziRW4
         N9OixVNsvOXk2DMLnl1ysYy/hFV5OW1ke6/31maSbCKNd1eulM9dX1YwlSf3SJb1Spcw
         SJJ56hVYhk2sSb2uPDDhxyngUjrfZs3asXku5bToCWVJX5sQqx+OVu0PuiMkttW7pCFd
         jtIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ze6yGpah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si9607646ybe.355.2021.08.15.12.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Aug 2021 12:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ze6yGpah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFMCl-0006GX-7e
	for alex.bennee@linaro.org; Sun, 15 Aug 2021 15:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMCM-0006DL-5v
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 15:53:34 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMCK-00064p-HE
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 15:53:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id j1so23248064pjv.3
 for <qemu-arm@nongnu.org>; Sun, 15 Aug 2021 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0qkhmpW5VfmWP/SFxE7w1XwtkrhERBX8GLkvHhHhbWg=;
 b=Ze6yGpah1L/tLQlMhVyVzF/SGSZJtTiMltZmzQnl2wl6qzo6QXYB1o5Skx4LV+i/yP
 qxfS/jfb89lTaQlDm1Xp5UMF41ssSj3VTk2U3eTIZiAAYnQ+Gd6F+KDHBFXiJJdEKNJm
 c4HjxGfTHCP7IITRV/1JGpG/VY/2Z/kDlgw2i8K6ttFXj95iBoHkDuJljhmmuHf9sQ0s
 HjFEcYdLSYowDxOGiYufG+7RW0BbF0EwhVvqeiDwpihHHscRYfkkbUIBMKsczUpeOPnP
 EfpopvPDlH8chtW5Ul4RipNR7Ve+IQmfh7SMuoVPUtnY9Ay/KcYFOBa0hXXCZfO98tr2
 de6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qkhmpW5VfmWP/SFxE7w1XwtkrhERBX8GLkvHhHhbWg=;
 b=FDqPYZIOwn4JwUkDKS80ZggT9KLxOqObp2xjLaUlVMFN2Pu17KnmimdbdoagL1W/ph
 fNGWQLJUaeG0fVpOgkUO68YqLj+bUzH/zcGC7d44oiJo0Ip0hPIYXvm4VtGFKSosNews
 zSl1LU9IhOaqZC0X78jrrn1kft1T/zvzQAKwVaSy/I5zY5Om/kO/oJDXJbGj6d7cRMB/
 1vmQ+LBYqhidhHwdgT1Ngjbkx/SY2oZ3ReGtkxwiEQSwvgj5VqyLOQATjkgUVCBgXoIB
 gVgIr7ZTZDFznTk14lPA44u9TZb1akseTySFq5bfCplxdGJe6Z6z/LrzKziO9TCnEH1u
 XJ8w==
X-Gm-Message-State: AOAM533PfL2nn6GoGXyzhtxX8O6gqc7v4alf6NSO8LXskbz+nj4a6THs
 UqZpkvU0+pEV7gpwZLVsaVmIGA==
X-Received: by 2002:a05:6a00:1808:b0:3e1:f8c5:3436 with SMTP id
 y8-20020a056a00180800b003e1f8c53436mr830513pfa.3.1629057210884; 
 Sun, 15 Aug 2021 12:53:30 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id d198sm8778649pfd.101.2021.08.15.12.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 12:53:30 -0700 (PDT)
Subject: Re: [PATCH for-6.2 2/7] linux-user/arm: Set siginfo_t addr field for
 SIGTRAP signals
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8623d078-57e5-57e2-fdf9-f26bdcf29079@linaro.org>
Date: Sun, 15 Aug 2021 09:53:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: umaUKClytLrv

On 8/13/21 3:18 AM, Peter Maydell wrote:
> When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
> to the PC where the breakpoint/singlestep trap occurred; this is
> what the kernel does for this signal for this architecture.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
