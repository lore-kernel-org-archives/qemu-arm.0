Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1431198ejb;
        Mon, 23 Oct 2023 08:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdU7fDY+RPcY1cnAuyPRfANBBP0hY6HwqfSuxd0wqfKSJ/weiw2CAH98H6ME3XnXbclRUh
X-Received: by 2002:a05:6830:2058:b0:6b9:d224:1a1d with SMTP id f24-20020a056830205800b006b9d2241a1dmr7646815otp.19.1698073857204;
        Mon, 23 Oct 2023 08:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698073857; cv=none;
        d=google.com; s=arc-20160816;
        b=Yp9/zeqf5el9yiPose0AUJZcbi0TNxk6JIRpSMaIbcahO8CsikBV8ys9j4sUxgDdVX
         bOGJTL2I5O9MEdSRmCU0XWO+os7pT/7FzsilfUnLvpQuDl3KwoqRBj1YekDXhJZJ9HTC
         VyEn4yxVkCNpKpOp40r8rMBLkx5K5oUtRAj95cmfs7qhCkKPq2WuUr1GutTH0HXulyQv
         Pd5/h5KY1W9R2eAt8uR9gc68YOUU9YaugWiEJXPdj0ENfwWpODNUivaLRoZ2Cdz8CUMj
         77lOKkSiuE1RwOQy43UouLCA/F22EHwmp3VU5j2wpiSrHLofGDn1EGrwhzXTK6yln0PR
         dfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1BSfZ3HPCVJO8ucVdVcap2gfnIDLmVl3Gh7KHBH7GHg=;
        fh=63fuqXWdafnbqVGIWl8IQUGmwh8qKCI6VosO+FSh+Ss=;
        b=toeMm+W0sM5AriR4/qazn4MFN4XUMwrAwR8YjUpguXWgtg/vZADbzLQTGcXwJ+DWM4
         qzqJ34FMAKyqgoElJYJ8DuC1DSYSKIUdywVrtxNIBjRqOwt8VDjtBtwJ6CILuwb4Ebb3
         90B4od7v6GVcxhxkH30ENrjt3a8WFzqCpldvuTzdo/16MTKc04jyjooIBhXVO5H4sYnB
         jJLXtibJLsN1NxacdZr0WOXPC/V2/BIDp0KrWZhIaG7zCTXgy4crjSWzwgAZC/rm4jOG
         V3mQSSzN1L6PkBpkqvwNf4K6L8CuLLx47Cax4VeXmZ9Li03adjrHCfnkGa4HNUNwpQp6
         ZTdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pMW9/7lJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020a05620a095300b00767e994ff18si5321541qkw.143.2023.10.23.08.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 08:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pMW9/7lJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quwZs-0006al-Rl; Mon, 23 Oct 2023 11:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwZn-0006Xr-4q
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 11:10:44 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwZk-0006Td-FE
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 11:10:42 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso714619566b.1
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698073839; x=1698678639; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1BSfZ3HPCVJO8ucVdVcap2gfnIDLmVl3Gh7KHBH7GHg=;
 b=pMW9/7lJ6tLQw9ymU9v34MhKdrnFKYycZjdVY3XCsQ6a+9aPuXdWBbz14mnRs+YWFT
 /HwOopx+G/r/A8tleJjUZ/zvjMO3GQIvSq8RcdXtGTvtI8IdhNHm8Q4DkXIT9SbBNIUm
 P3igHU+wT4x/19vOas8MDAYEvRp70hxGTueal/yX3W0WEhrn8thc1E6l/KDrfLxytRJe
 qs6OnCJxpKjsyrAQC3dxxR5xK1ItFJ5L8TWabSM71YLRceIDnTN2KHZlaorqRdMpK1RJ
 AY3xCoabElD61xNmwKq4p6QcuQnqxV54sfv3XbIi/36V2Ks4S9DoVUv4lGmEwRot+LmD
 2Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698073839; x=1698678639;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1BSfZ3HPCVJO8ucVdVcap2gfnIDLmVl3Gh7KHBH7GHg=;
 b=lra30jlK3UPS57NAdwaeBp6n3Von6oHowt8DFrQxxuV1mMCbbfx8073c/fL8KFgwyq
 V229wHD3nkXh8egb1jDdQ+9Fx6rV8wVil+1KqGDz7VUwFDK3OoIOzRQ95+3a71+xpjvq
 AW+ZTxIFxKSuFLDHVO3v0iXj35CfpR/6TEdAXFPp/CLqVxWdMMeC+H8ify1Bjn4q3w/w
 WawBT/BxHg5MfsW7rbIidMAIwr4yRDhh90jsouastN5TEHZu/B50NiBe7+MWwsZY+D/O
 9f2OryXJeGdny/ybAFYcXvU4w8hax4Kka0Q+fdDvDfYR7yBMqxW45bInKHras7dgcqXL
 CSYg==
X-Gm-Message-State: AOJu0Yz3pYUF8q91qyg5gnTJc0rFdivfBq/2jpdJQc7yj67Tv7hZDvV+
 gD7vF08ynjzyq1Cmi9svXhsDJw==
X-Received: by 2002:a17:907:6e8c:b0:9a1:b85d:c952 with SMTP id
 sh12-20020a1709076e8c00b009a1b85dc952mr9394835ejc.12.1698073838951; 
 Mon, 23 Oct 2023 08:10:38 -0700 (PDT)
Received: from [192.168.69.115]
 (thr44-h01-176-170-216-159.dsl.sta.abo.bbox.fr. [176.170.216.159])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906088d00b0098ec690e6d7sm6767475eje.73.2023.10.23.08.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 08:10:38 -0700 (PDT)
Message-ID: <9681f796-b5c3-f981-eb26-e738fb1f52d5@linaro.org>
Date: Mon, 23 Oct 2023 17:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 7/7] target/xtensa: Use tcg_gen_sextract_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019182921.1772928-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: JrZPDtZlfUYW

On 19/10/23 20:29, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

