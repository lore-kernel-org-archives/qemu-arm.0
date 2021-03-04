Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6434387lfg;
        Thu, 4 Mar 2021 09:40:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymh8N5CaCFUwtT42xlGxZ6BYKcC7V9omwo7jKPUbLTbpdUdaW9LUWSJzZwLqLqZCAdErn/
X-Received: by 2002:a02:817:: with SMTP id 23mr5117078jac.23.1614879626610;
        Thu, 04 Mar 2021 09:40:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614879626; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQEZY4WnnXayv9QwvGkyFBm8yBdKMuhsBnjYakgtIw3duxnf6fhN/w6sY2QZ/cWv17
         itOYCAOG5oPP6YKoIs0MVaLUeLWTJ+DmaaSbXLXSV0Y46hwkV7RT/L7RlQh3BU8fbmN1
         /44W5BB/5OBfOVYbjBaXjim2RT9pMM9CvVxSktKR9CusprXw7eCLVkx59DK3oPXuliqp
         ZF8ueTKj1X+jdD+qE2A+p1yDzCqTc7+OlhJYsucTjA4ql6W1s63Zw5PLOaAxi1VShKRg
         1RexF49xBNiXnnEuObUu+SFUB51HtZsM5aBNFM46QpUH4PTY3XGgp3jbLhbv4k6D9YRu
         LBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SBPvWNHDsEbhoJxNIFzVqRxtTF9/e8OCy9RiInJBJt0=;
        b=yeVj6dH2fPiQh5jbdIzedmOtJIaREA8elOVZvSHW77SzKhLyi9Rw4chCCKfZyOfyys
         zkEgSvs7Yb7PQFsEnnvCPk68Kgemhe5Jpr6gmql8MxX3bD8aJaqLWCUM+dhUdEClIxU0
         Mr88hjYyM4TDD4yDzc5sQsuGL8UMpDb7C6ZH3Re9EB9huc6sVPpnrqfC6mLmVCAR3jHQ
         Ar8CeuYstWNuHJ6uV7qZ1YmyjRObLCa5zSImNcE6lyjNMqmZfPhKDZliFhG6X2NsS7uc
         nBocs8EQ5xCQVZhdaraXXyXfdYB09+lBUq0z8B6CIT6dtXQzG0loyLoKTpl0vDEoq3GW
         ygnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OC1in8zk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si1354jat.92.2021.03.04.09.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 09:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OC1in8zk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHrxZ-0001Xe-T7
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 12:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrwz-0001Kv-8C
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:39:50 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrwr-0003Ms-5Z
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:39:48 -0500
Received: by mail-pf1-x431.google.com with SMTP id x24so2217940pfn.5
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 09:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SBPvWNHDsEbhoJxNIFzVqRxtTF9/e8OCy9RiInJBJt0=;
 b=OC1in8zkwMq+QdG1Ew1O29gH9SeX7He3VjifENAQnsgzmFeoOmQ6gBaOCDSWnFbqkz
 GkaQEmvDeOuP+Gy3Xf+PTeSFwWkmf8rllNG2/wAesUD90EqKHzriKeEOX54oMcXiT//C
 4D//h/NRlTshIEk3sNPoV9ukdB13LBLlNFtan5rF+r6tMVrxhSh8Uxtv8uuGqzOk3t7u
 TXdP9M0YE3dXwTFVEoACebMjzOoyfKKQSMJ9EuZ+euEnHr39xhWg01ZscLK5snKcrp4z
 ZEIpShTz7tVeRktkD5s/LczWTonQ/5nrrENjvKWMvW/wwtpYms50ElGRk1nUvCQ9quwh
 YW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SBPvWNHDsEbhoJxNIFzVqRxtTF9/e8OCy9RiInJBJt0=;
 b=kx/ACh1HgNVgZ9jApe43vp2/T0rV52XohRclkCS9ahlMbfZD8CJCyOq1+nUlNuXnzY
 bAixWmbRI4U03ReoSYW8ezGriE9nUJ3hpwzteF88Aa49sS5H9vtCEl2HJ414v0HXIR04
 pwSdE5c5gH/Cmwi/pArmKX8Qpe4bk3htLIu7+BxR7CBEIwQliiiiWwxOBWY6WrqVCJxk
 Lz/bmQxMRVn7iMrPHN2l+LloeRprrfzifj6gDF3fq6fUaJVsoTxPzXckYzo5Y2bOARIZ
 JLBAe/1De3q3S51Ww6d9Lvw6XCHylg51e/lUkhnnUaxPNc8bseqRxi8o5u9UMczAf1FS
 A/Zw==
X-Gm-Message-State: AOAM533lMK1KEfqSydwG2bxiAF/ISnEzciVFDkm25ezzWiL0G26dSbVT
 5rJN/qpl2FSuxmgFU8h1hFxU/w==
X-Received: by 2002:aa7:83cf:0:b029:1ee:f550:7d48 with SMTP id
 j15-20020aa783cf0000b02901eef5507d48mr4784134pfn.12.1614879579834; 
 Thu, 04 Mar 2021 09:39:39 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id u66sm49355pfc.72.2021.03.04.09.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:39:39 -0800 (PST)
Subject: Re: [PATCH 09/44] hw/arm/armsse.c: Use correct SYS_CONFIG0 register
 value for SSE-300
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc86b56e-434a-785e-5cc0-5b7c41714f2e@linaro.org>
Date: Thu, 4 Mar 2021 09:39:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g6fk8PkihBkj

On 2/19/21 6:45 AM, Peter Maydell wrote:
> In the SSE-300, the format of the SYS_CONFIG0 register has changed again;
> pass through the correct value to the SYSINFO register block device.
> 
> We drop the old SysConfigFormat enum, which was implemented in the
> hope that different flavours of SSE would share the same format;
> since they all seem to be different and we now have an sse_version
> enum to key off, just use that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/armsse.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
