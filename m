Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2664788ejn;
        Mon, 17 Oct 2022 13:46:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Azk/Jq6BlchyilZntVjQxrOcdyw1ADPWgf1ZvLBBdo+j9uL+/2nSPMedZKoqmNQEHHwNO
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id s12-20020a05620a0bcc00b006cec077acf3mr9112873qki.263.1666039599528;
        Mon, 17 Oct 2022 13:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666039599; cv=none;
        d=google.com; s=arc-20160816;
        b=HYi2QA3YJGsVKMH/OkTMblGPRdQaotAEuXzU1f33Qmz3zG319aOSLXk5HH2eHFoOBx
         labrPsMgMQBqfqil1pdG3GSZuCmM+VaImU7S7/zMkr8mHTsKG7xb+VAGpYw5H1kc02TP
         0FAKMHpl1XZrDdLV6MSE1pIXpNHjoTd7/6C+rDY15xJjuOQBFnnqZXMqQGK07w8woVu8
         UK1RnFAAwW+rLrKIsXCnOXZz9Y4AIoA8UGBHt/7JK4FHfe5wZQibQuLXP84eepvEXm+Z
         E1H3wMt7/edtjpS6lALJSAy26zkMet3pt2Ng9zLpIoWejxeehEwTWhgApaTQzqSCBmZI
         5khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QWiTd51m/v3mDWYBe646nWHgeRjWJOKrhD8Vq6XYif4=;
        b=BAWMbnb0rhLn0BIY/hv6e/iSxDGW1I6LxJ7fmC0SMETSAHuc5oc24nS5/+5/BKJd9U
         aphyJfWW2BEouxBpvOC3kfeZH20B7EVITMpLfIgIoI9pVNzPm5AHE2eZn11q9RSUR3Dj
         9IJHh+RLIgGBGzFslOc0DdfZ0wwY/LztfraeNpxNVklzlqSK7f43oZg0rWqAlu2HIJt8
         KuFUTJgxIAvrxkNd8sQRMFnZehCmIADg1XKYUoc8jY25p2oFs8P/3W+al2asUC+aQCzn
         LerCsfF0OgeWt3tl9N99/yNTAH/0jjMuD2TxdZAt+l17jX8ipz03/GV+BSFLH+RDlppz
         d9cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+RcBrPP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020ac85989000000b0039ce3dd630esi3884178qte.649.2022.10.17.13.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 13:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M+RcBrPP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okX0R-0002ga-1x
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 16:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okWxr-0001U0-Q5
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 16:43:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okWxq-0006gn-Bv
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 16:43:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so13585265wme.5
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QWiTd51m/v3mDWYBe646nWHgeRjWJOKrhD8Vq6XYif4=;
 b=M+RcBrPPGLUTYwmvVXISm0GCcsTxS/V29ul4uGIfj2jmudXFdeAvDsMiJ+a1UrKzHe
 BZ4f3Yxnvs4XRvp/ZluArZDr9zeG77hlb1PNwbFVV+eDVqLX4Lfuhj1rwHAaaugP0vbq
 HGJXlrMbcpAvOuPbuAIgavcwVEpqBzE8aKB25udoPfvVLNL7rsMYouTj1acG/WF2qVDW
 CRi1QS73wKhWJOOJIih5iTUV23y5Yt0Eq6zvObAc5vqgW41TgLz2Ht3ku9dbIyrTB/zq
 n6+/meqwAeB4v5v3nPvXBH80QKyhH3iqR4mokrP1aTZo4Md8+98/9QI8N3BkQUGW0d/q
 czHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QWiTd51m/v3mDWYBe646nWHgeRjWJOKrhD8Vq6XYif4=;
 b=XOMBbg1obsv5kxT0Xp+j+j6bwP3hYm7x19CGrGH4bwXVWekh2MoNYDTUeitR8Socl3
 fePuV5CNE63PV3JgAnValvzRHeVaRNTIAKX0todHDYOuV3ePkwGTAi1AMCBkBWQQYtvH
 WLgaonGT2n2B2FtcIFlosKo50813jFj95RleIlxqZiw5HMH5ruh/09AjWnDXvX45tJTo
 N6nr+QxWfmJs+pDNtXM17ZDniAvGd/4KFoHpfQE02N4WtzUaiFbc0zMyhJZXHII7LyyC
 h0AxFG1hxmnjo8Ox5BOtPagB6F512kiEksfCbNlSfJTSKa1rNOWtsFbYPulToFsAnSdP
 F8HQ==
X-Gm-Message-State: ACrzQf3TGxWgvTc0JkdABcnjC32F3rdj7xXMcOxaR01zkmz7P1H1hbPN
 06o6LQvk7inuQSSG0pYwyS9zuQ==
X-Received: by 2002:a05:600c:1546:b0:3c6:be44:d3d2 with SMTP id
 f6-20020a05600c154600b003c6be44d3d2mr8729849wmg.63.1666039436527; 
 Mon, 17 Oct 2022 13:43:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003c6f3e5ba42sm6449513wmo.46.2022.10.17.13.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 13:43:55 -0700 (PDT)
Message-ID: <d0734271-e6b3-bece-be43-365cdbe5e870@linaro.org>
Date: Mon, 17 Oct 2022 22:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] tcg/aarch64: Remove unused code in tcg_out_op
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, WANG Xuerui <git@xen0n.name>
References: <20221017020826.990729-1-huqi@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221017020826.990729-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6tGbiOxWsmpf

On 17/10/22 04:08, Qi Hu wrote:
> AArch64 defines the TCG_TARGET_HAS_direct_jump. So the "else" block is
> useless in the case of "INDEX_op_goto_tb" in function "tcg_out_op". Add
> an assertion and delete these codes for clarity.
> 
> Suggested-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   tcg/aarch64/tcg-target.c.inc | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
