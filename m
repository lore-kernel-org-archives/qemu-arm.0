Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1206605ejc;
        Wed, 27 Dec 2023 14:53:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkNnLgPwb5/h0MB2kXFk2ZFx5vQH9eh60DCBwwbKJ5VQXG2GkbTb5crUMkzGkIVSGz4sKe
X-Received: by 2002:ad4:55cd:0:b0:67f:bb90:73d1 with SMTP id bt13-20020ad455cd000000b0067fbb9073d1mr6456643qvb.84.1703717633782;
        Wed, 27 Dec 2023 14:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703717633; cv=none;
        d=google.com; s=arc-20160816;
        b=D299pb4ZebyWqYk57MBucBnrMgjXp7XyoveaIu7E1DirRTpt+Krip7W+0IAKRiOU6H
         uok1a+E2hNzQYbsOhgchAZSgSA/JfQs9pupqzYhPzlMgj18NerB0APaMdcQsyanu+fww
         o7+Nm/vQhKpent3Pg59C+ZaZOPlYQ/f8iJmZ590IbXfw051sv5QUD7hfzZsI5rn9Ihgm
         u3tbfcqmyqzcUifY2k6DafQ/bSKFbRWuiVSao3cs4XM8hdFph3ZkOTL/zFVhGs7c5NRT
         BU12J4JOHAy2xg9XDNbP0S+W4bqrXOXc/lX4R2IIMpSIQxPrQW8dQokQx0TQTsHxUtV/
         eUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=365qb37Q0DAEuqITeiMUwz6y92ad6Qj2aC2LOO58cWQ=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=GFDAHBdjD4aAT9YQ3kXRsviHUN93gBaBY9N3rY2j2MHe8gX6lE2Xagm9fIws3psZ8J
         0WL2IrfL+1Cu3fIol5XkSEyvV83/+Kz3rP/L339yAKfnjvQXKybqprtZ6Atm0UM8H3J3
         mLG/K5VUlI+cdXrrPlO70PFLASf0sgW7oFomvp2HQYN4u1pCASmye1epGB7gUZclyTIv
         sAyzhtQ/+4RkSdeTy2BGH0D/B1zVm+4Eyj/2pMYpDubOARwgVnS/MXD6Tk8kkC5nla+k
         vnsWAp+U1af6rr+k2bPL/ed2snBdPTuE+Waqa7kjlS0EjAEOEe50rf40m2BeySobHRgC
         +wcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4gJ9tZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a0ce10e000000b0067f32e92d37si16246312qvk.31.2023.12.27.14.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:53:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4gJ9tZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcmT-0002jV-9b; Wed, 27 Dec 2023 17:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcmR-0002i2-LM
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:53:39 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcmQ-0002ro-9c
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:53:39 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d408d0bb87so39952015ad.0
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703717617; x=1704322417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=365qb37Q0DAEuqITeiMUwz6y92ad6Qj2aC2LOO58cWQ=;
 b=l4gJ9tZHaOMkgbZ7hBSBdNQ8XifSzBjMd4U/iOND4U3M0KxRQkrC9b6SpNOiPgNCl6
 OcTn6KgPycZTjnoHvtdvW7AiyZiyVi6/GxJnGAjIDoGxcHv2imN23L3H0P1FtbGLxKPS
 AzyxquxWcaynVoIXY/DmkfZ5jPlHdikg8cVDB5t7JlHw9I6AZozhqCZa0IDw7baMijmE
 ckbLWj+730B03aMzzed0liI2mEK/GEse5hVikd2iEZl9vfIQ8J9a+72CvpvmT+/bMLc3
 pCokxqY+6rOpKzqE5NlEBvcE2hBIz94/3WksuuzFUiVZo1KVnJrhalFQcgVKW+puHB3c
 h5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703717617; x=1704322417;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=365qb37Q0DAEuqITeiMUwz6y92ad6Qj2aC2LOO58cWQ=;
 b=m/XWns06eJQ/qIdKAt9OOm7WFfVnwwfQZQNYjX+BKko4GzCQ47W40jZVodF8rDx/MM
 ouKHMbpyy0GxVbhJBDq/tL924cdXGJqS0x2L4tqZHccK/8A6wA4DW8xjXRpOjDTA54uj
 sWxVLHwhpMSHDgrduarzB9FGYhym7sBOkOgZBOSeeAx6XTGjK4+JJ5slCoTmboOtkJHB
 1KyLOaEiAbeZa70gFlonpPOIsHWAi+VhUBOr8B7Cq2W5M1C+N9rKRKqjT3u1jw3opnXE
 KrboBkp7b1XPDE7UUeYQ7EJFiQkboGlEFCFpVwLnElBwHtKqAfeGgydHQnmKny9ItrEf
 kvrA==
X-Gm-Message-State: AOJu0YynN5nQ5i81Pb+WjMk58gh1uYzBjcRZz7IGRNFWNJmnoL0TWs72
 amvAFvN49gdruV9+WuKesXE4U2WDrmy6oa1vUW3LopogblXdqg==
X-Received: by 2002:a17:902:7b81:b0:1d4:6dea:9ad9 with SMTP id
 w1-20020a1709027b8100b001d46dea9ad9mr3621541pll.51.1703717616918; 
 Wed, 27 Dec 2023 14:53:36 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a17090264c800b001d1cd7e4ad2sm12800875pli.125.2023.12.27.14.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:53:36 -0800 (PST)
Message-ID: <578cbece-f2e1-4330-954f-43865bec639c@linaro.org>
Date: Thu, 28 Dec 2023 09:53:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/35] target/arm: Treat LDTR* and STTR* as LDR/STR when
 NV, NV1 is 1, 1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: n33STX0JCFeV

On 12/18/23 22:32, Peter Maydell wrote:
> FEAT_NV requires (per I_JKLJK) that when HCR_EL2.{NV,NV1} is {1,1} the
> unprivileged-access instructions LDTR, STTR etc behave as normal
> loads and stores. Implement the check that handles this.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/hflags.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
