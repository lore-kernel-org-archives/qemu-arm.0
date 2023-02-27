Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5124066ejc;
        Mon, 27 Feb 2023 15:10:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/gFxuffjjaYiuCMcln1ZgfYdTYRGlKK92rYpKhj9nU433tAZoueVx17wTdTTZw1doTcqx4
X-Received: by 2002:a05:6214:124e:b0:574:97e9:e21c with SMTP id r14-20020a056214124e00b0057497e9e21cmr2479905qvv.4.1677539400688;
        Mon, 27 Feb 2023 15:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539400; cv=none;
        d=google.com; s=arc-20160816;
        b=mk/V80Qxz3+hkzs8qsO5AJVUWqIcfMbhsPfgMUoXyDlGC3C5zW0UEhtCeKiSO+yLYd
         TkOnBJmf0fdpYFH4z84Qs6FPb4qnLz3gR3tVBJQTmXYWBk8lpP5xwgQQO72WCir5O0dm
         SehY6QUlajWSMyz7QQyFR+SC7i04jjQ3i9B8Co6C/c4DCt2LoR2hJOedjI2dKxynDKd2
         bBa45TSMybsNEag5l9dhPcVYCAQ86C0sTE7RBsL6B8ACWKOwMGREvdV/YX591ELirqVl
         l6i844Ck4FYm7KZQclFxIR5TIm0vf5MX896kVBlV7KAC/8AyJEUq6K4E0J8rAQ92fltg
         jfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s4KPTbdIYBzUpGRYwy5YxUV9SqClrkc04XskluTXT2o=;
        b=pDUun/2b3TTsMpM5QNItOMv+0sPVSx8lgDeiEyTK11aZqSrm8GEs8RxwC2QTTyGgIu
         dMaYTSfZ3NtJM4NVTeb2DV67N04vYG64v/ji8QFelfU86041xIqgsI6aCDNV7gjFJ6Z4
         vfQnYf5XbbTLnZRQeuziHEnoPx762EmqfYxv51vj12b1K1CcIHcsjD/G+qoOWMniWfxA
         c5i33lB9S420JNNcQZHrcbZQjk8RoXaX5/7NI7C/oqzHJcR5Mspkj57BD0Xp4+WtGDWw
         4tHxtHiL0wsTOYUV0SBwXFKMZGZe4nCP4Ype8Lm3lYS7SuHfre8tthRsMqtsGjEc7Sbc
         fICQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3o3Zm8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05620a444700b0073b425f6e30si7267027qkp.574.2023.02.27.15.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3o3Zm8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmck-0005tu-SD; Mon, 27 Feb 2023 18:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmcj-0005tJ-IZ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:09:37 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmci-0002f2-3u
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:09:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i3so8522709plg.6
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4KPTbdIYBzUpGRYwy5YxUV9SqClrkc04XskluTXT2o=;
 b=i3o3Zm8jCN7EIXBZRoqZPWWlj7H6b8bHgy1yEsozft+g3QkDdXc1wPw/XVyj1xPu0g
 sXCGTrYheqqj7sgXoMmtrMIiZpvGmM4phbwVMAVPV4VuAfRCuv1IQlCheUoDS20U3Uvu
 DovepDnbrAOyL3qZ3exRWPSexFE28Zzlc2csYCUTgzWSmZgw95baQ0juQAJEDvBsE55A
 g9z84txoHc2PycesN0P0dOc1oxetzX0CxAUpjUVcDyHmjt7lADR1We9lnlcV7NI/8zo7
 frK1kB3MEEFWRpvvRQ/rkge3A02pHy3G5rQp3f3zq28H5CGJyYWGSBjnu9kaZ24TcvnU
 ZMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4KPTbdIYBzUpGRYwy5YxUV9SqClrkc04XskluTXT2o=;
 b=WEAaWWjvjgpbzMifF/PhvDPhcZqScwIilyozwGMC/EHTtQ4dagHLFrtx5IjF21B3oH
 REuWk/cJI9CCBZJzriSFbafGOqPtsZOFN8Psx/4NLLkUXT0jvgQnPzIxUYOLjuzdjwvh
 EFiStrm55WCVqkO8B4XiXTwuHvy+WUnvI2hSCbqA+2d8Gf4RHQzZLb/+wttkRTyvksk3
 iyXq8Dg5xX5f1+l1QTekzr6Hloq868g1iyQKiPL8LliN7UppbzeYFTBVuEXncnnW2Rly
 oUZCR+wQOGAda+BxNjTGdhjkz3UoKUNrh/6atIJnkDkWdS5OJAttDxAfx1RsJ8tZst1Z
 N6Ow==
X-Gm-Message-State: AO0yUKUNglH/KYNPYKAQhj+FxQPZ5LtkZydSjZTFkGDlqsvPXDX/qWgf
 VIo0i6LQr5hjVBHfJShKG1OcIXzER72NV3ptzhI=
X-Received: by 2002:a17:90b:4c81:b0:233:feb4:895f with SMTP id
 my1-20020a17090b4c8100b00233feb4895fmr830358pjb.44.1677539374605; 
 Mon, 27 Feb 2023 15:09:34 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a0e0800b002312586b5b1sm6601897pje.57.2023.02.27.15.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 15:09:34 -0800 (PST)
Message-ID: <a5b66aee-0c97-96f7-81ca-44fac1289733@linaro.org>
Date: Mon, 27 Feb 2023 13:09:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0 v4 00/21] target/arm: Implement FEAT_RME
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230227230122.816702-1-richard.henderson@linaro.org>
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gvNDUcvDihJA

Gah!  I didn't mean to tag this one with for-8.0.


r~
