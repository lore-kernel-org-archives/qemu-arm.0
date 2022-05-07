Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2414011lfj;
        Sat, 7 May 2022 04:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEIMGkt47W95SzfP1gdwNZmE1Wu2YMKsOZNPqNxmjMAe+KSculhGlABjE6BxAJhXwo6VNo
X-Received: by 2002:a05:6214:20e9:b0:45a:84e4:c121 with SMTP id 9-20020a05621420e900b0045a84e4c121mr6134830qvk.96.1651923397610;
        Sat, 07 May 2022 04:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651923397; cv=none;
        d=google.com; s=arc-20160816;
        b=zhgvpEF2FolCVMyljNjKA/xIdPhvvW/b1F/suFVQZuG8AleHyNFhzA8+IiuKymN6K0
         lmwNhqdYphAYICqZ9ZrQ8K1EMlzYJA1Pbtdp2j/cdtJk0YCBncNaqFfyJRbG4Kutf8sb
         JMxzNXkN+duAaWN5X2koOI5FL5edrU/ddd8U9CkamdcSgz1WTRK4A459Gly+pqwGoHVy
         9wcculrP4EdwO6eVFR7PH5bdmq40TdBie4ETuAzdDLP3vkEnnAzlRRYvWKc6TkgePWzV
         jtePA00gHqcR5TP/4qe34vianDpIMGZqsHM8EgziQpkWVH+2c5DeYMdUVXh8oHO9jy6Q
         JzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=u3S4xW4RiaX/z6dxnCaH3O6xG9ZTa+Z7HLRUl3/p0Og=;
        b=OIm5xkeJw4bCR9GgS7gcyRXhVEVzWxGVN7c2rCizh2twH4jWBZqHOmFn/V2vb57Ehq
         Xu2tAeUxUrpQZfTu8C3EYPLPduERhhhHTsQ9zaYnPdC0lOphiKS8DvguvLqRPHqzR/Sb
         z4D6gSHrAYDZCl8Kex2bISEBKGgxUvP1xlFMvLR+LPJ7KgI0us3v64anImBIhT/PnkYw
         W/Q1PA/Nf+W0/F7D4LbSfCIWbjkSBWglv/0U19AFgCLrJsynXipZPbkYU5DW4Svf2yLK
         htagGp1dn4RlShIpmlsr2aUEet1NGz0ibtMS/UCLfDvdMieDAnMpt1XATqw6YfLzhKHS
         yZYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agsh3JPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a130a00b002f3a6ab6a5csi4406170qtk.307.2022.05.07.04.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 May 2022 04:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agsh3JPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nnIjl-0004jx-1p
	for alex.bennee@linaro.org; Sat, 07 May 2022 07:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIjb-0004gq-BI
 for qemu-arm@nongnu.org; Sat, 07 May 2022 07:36:27 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIjZ-000446-St
 for qemu-arm@nongnu.org; Sat, 07 May 2022 07:36:27 -0400
Received: by mail-pg1-x532.google.com with SMTP id r192so3980926pgr.6
 for <qemu-arm@nongnu.org>; Sat, 07 May 2022 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=u3S4xW4RiaX/z6dxnCaH3O6xG9ZTa+Z7HLRUl3/p0Og=;
 b=agsh3JPHZEdC+BHHFHE39Ae7+VNyzWtOPR+ZSPMENOuZH3vYFJgRzRSIfe9X/QjoBi
 lOPaxB12AMYFvi76sV4eQn4qnjc3R+wcV/JehYnzn/BpoRWultuZmb3LXTZYbisaK+eA
 ZzUqNJVmmkgcGaSE/nH1YG3W/mz7fIn3FkOJ6zY5f+q04iGbKV5aSXtpgNL40NqUL25a
 FSPOWjsABEuh2Lra3mlE0zdhlvtymGqmruERPTbW85dYnQzDRb00IkOX31KSSlJRwkmL
 CMYbNyzyciXjNcGS5ZVhAgpXFdIGuJXz5A+uLfsHshfnxgnK/Wn/SiS283FQeFNvXTLV
 wGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u3S4xW4RiaX/z6dxnCaH3O6xG9ZTa+Z7HLRUl3/p0Og=;
 b=UOc0CQXuEmuQGitAWpGzwzYYJ2eO0er7oP9OYrVaITAjz6O3VlYYGR9+7URzZvFfZJ
 zSFGuny+cZXZOTEXHZ7KcuyYx84e9YLtJUoTefS5cYvcD4/MeZx7j0uG70RD4pCziaYA
 ih6Km+yXtByu0Hz+3/EEtslF7lWoqhZTND3PmTh0Eb3+yErYgyUQ+zOOX37TVacfNPzD
 JP9L3zw16gzcnGw3txsle75BXwYqpTdlJnSZjUHfjBCXhN3d6E3GqKZdMRV7QilM5m4b
 U81Yc/vXsIW0v+1AkqbIREC+1k11zV26C+hyCMD0BmKobzhUTLp3dHeUHtLK5oDlli7j
 Rebw==
X-Gm-Message-State: AOAM531yMMaoZ+tKoKtn0acAJWG6qnU9GNciPnt6iVs8KZrPbz1NO8qH
 XnQvMLuJaNNeZoPDgTG+6E8WxdtOUuNzuQ==
X-Received: by 2002:a63:8ac1:0:b0:3ab:199:cbdf with SMTP id
 y184-20020a638ac1000000b003ab0199cbdfmr6225011pgd.466.1651923384608; 
 Sat, 07 May 2022 04:36:24 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 bh5-20020a170902a98500b0015e8d4eb1d2sm3460781plb.28.2022.05.07.04.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 04:36:24 -0700 (PDT)
Message-ID: <a3f0ba45-456a-bf76-2472-9727e94b2ba0@linaro.org>
Date: Sat, 7 May 2022 06:36:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/5] hw/intc/arm_gicv3: Provide ich_num_aprs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <20220506162129.2896966-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506162129.2896966-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oG+lUICA7rhY

On 5/6/22 11:21, Peter Maydell wrote:
> @@ -145,11 +153,8 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
>        * in the ICH Active Priority Registers.
>        */
>       int i;
> -    int aprmax = 1 << (cs->vprebits - 5);
>   
> -    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
> -
> -    for (i = 0; i < aprmax; i++) {
> +    for (i = 0; i < ich_num_aprs(cs); i++) {

Better to retain the local variable for the loop bound.


r~
