Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1036567lfm;
        Fri, 19 Jun 2020 16:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkGM1OII97FHia0hAC+nHzveshBDtdYgN4NNMHLwTaqzXuKhP/Dr78Ovx1CaTnbe+ceNtF
X-Received: by 2002:a5b:bc6:: with SMTP id c6mr10244914ybr.302.1592609156249;
        Fri, 19 Jun 2020 16:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592609156; cv=none;
        d=google.com; s=arc-20160816;
        b=WuYm7RA+xeYaXHREnFnlChFUdDzI6dkfzFZHwuoisbAlbhPZCNNCX1pkdXY5blXVf7
         LLh6iRFAVGqol1jU6+nTHfRIgNNEIghJszcUXDIb3ctySCOdGUgi4HRixHV7CkKNhYHa
         SRfmfOUxYKazckmZR6Knq/ws9wjiPpPrZEUk/nnyzpfU7G2TVBMSx3rPUsGQFPhboGIC
         phaPe933eFBB/MSNzPW1mdZzgVmpwDDpbnNwZwrmW5eBWl2WYx/PwSmX/r9T7tyBGibB
         JkUOsomBM0Dt/pHgLFSa+2L6+fAka27GtgGYBY5GF/AMAkXVGWvDARaF3KXEsf8KytMh
         2Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DqXxlhHR27zlDc9QEEVbgZK6UoWz4beRS3JzYE1SPnY=;
        b=tWngWpzvEjQZa/6UpOUWHIABDT+PpKyoNksGkSGZA9AmeLHhf7O8iPv0NPyPW4hhEH
         Pt1lbUa2ZKjT7KRq119VZbOkGz1iiL+/ZZlOZ8RFRaWkQrNFQRljeU0MLa1U2biuQASC
         pSl6aftu6IZ7bdhV+oFx/1Btl5PSygY987oikQFxB+VQzlm6qW4rf9iq7cc/601FVv0C
         zqTvg7kj8E/PIYUDbT9SN25V/c1vNNiz9HHx4mh9qoeG6NOnbOy6sV54uZFxifNS3kfX
         RCT3UeqIkcf+2Mny5724q0ZGvAGkzocQNUaOG6iU45an4+rD3ue+sIU9X9HFEu4x6K02
         WhQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4GBPsvE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si6237752ybj.394.2020.06.19.16.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4GBPsvE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQOR-0001LV-He
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQOJ-0001LE-4z
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:25:47 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQOH-00086u-Fs
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:25:46 -0400
Received: by mail-pf1-x442.google.com with SMTP id b5so5117237pfp.9
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DqXxlhHR27zlDc9QEEVbgZK6UoWz4beRS3JzYE1SPnY=;
 b=N4GBPsvE3Ou9EUohfNwTCXusGGVwzCc3cEwNOE0eVd49iv/FvlPbNtuILvwollIomI
 8UE+auzTWHfS/j1eheemPPGGTw6D1k0E9Ira+kujMHkfcErLyR7HVA7SyFAqfkYC0ATD
 A5GNOdXfp9ne1+3xQ1K5yVf6dOtnJZ4ZTVjAbXp58IyDcNDGlhMPOR/JFsouN1ExkL0Z
 YSlPlcF6yuA/R9O9kZFAMDJCgeZL6tMZnOeoXcut8WQ95WzOw2WGeRTsVTI0BHPTusHn
 3kKxg/vcdz4K06ODeQ/17hHb/XqttRKlXfJlFjVi253Rah5aii4ae3CRrOPBTV88tErI
 YJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DqXxlhHR27zlDc9QEEVbgZK6UoWz4beRS3JzYE1SPnY=;
 b=ZYrfOOHUI1sUd528NT4niAWsCvOQEMyVLl6rh9ZcND/v14wlKTG2s9n8YiL1kaUIal
 6Y8iN8kWCShCIW4qk9wnvKYWfseQq0tG078E3jdo3vvJkO6TXxs3AFEMiOd2meYhEA5v
 OLCTSMPiFoHTtA6bv/gBqEuLtbQCkGdd2g1Y2gNsBLihqogHG9N1T6nAD9HCe/VRSQsT
 duqmiY3i4DDI7EuI+t+IBhlQUBZdymKUn7SiPUI44PxFDEB0fzmSerImUtBqkEYE6LYJ
 rhfnbssUkvn6z/07EOmDzPUmMgsVY/SOTvBMR6eIIAvGlxqBdyOyHukKLuG1/Isl5oF5
 yb9Q==
X-Gm-Message-State: AOAM530MsXeAzIUhp/naikaneTVaHt6tgKHQJJXP2FC+a28oKW68xWat
 +uRVNTW3sUQRF6DNo6DXRf52Jg==
X-Received: by 2002:aa7:8490:: with SMTP id u16mr9669640pfn.259.1592609143860; 
 Fri, 19 Jun 2020 16:25:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a3sm6772630pfi.77.2020.06.19.16.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:25:43 -0700 (PDT)
Subject: Re: [PATCH 08/21] target/arm: Convert Neon 2-reg-misc crypto
 operations to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64570e3d-a89a-6102-b4a6-b157e06a897e@linaro.org>
Date: Fri, 19 Jun 2020 16:25:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: db3fM0pj6Lvq

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon-2-reg misc crypto ops (AESE, AESMC, SHA1H, SHA1SU1)
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 12 ++++++++
>  target/arm/translate-neon.inc.c | 42 ++++++++++++++++++++++++++
>  target/arm/translate.c          | 52 +++------------------------------
>  3 files changed, 58 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

