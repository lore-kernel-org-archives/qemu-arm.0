Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1348090ejc;
        Mon, 16 Jan 2023 04:25:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsB2Wcf2TZVdDhW7dsF9VQ428KlZyS4Us5zbVNnAnPTNOdub6vLt5k8TcSre2sfqH+YLI3l
X-Received: by 2002:ac8:6685:0:b0:3b6:3697:63fa with SMTP id d5-20020ac86685000000b003b6369763famr1706901qtp.28.1673871945462;
        Mon, 16 Jan 2023 04:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673871945; cv=none;
        d=google.com; s=arc-20160816;
        b=f3cKCnxdu+OhGJMGoTv045HDdlhEi24et/nSJm0ywsvyzoUmdIbJxr6PHa9/TmFcnH
         2ZkhsCg83x1v3x7A7JMKSCUPCSa2yWrsj1gLsBScqztXAAx3kyBSpz+SrhQi5JJ2PZ04
         7rafERTaGEBZKZuLZ8ArTRm9Nlk9DJQlqb1b+ZX6dctbPvsh9meh6pGNcaA8bgct50+L
         Z+y0rtwgokY686auRMfJjl3DaTvZEDGV6xoghyu6ueqygtTjodTROBjhy8IylI/pboYc
         C7Pi1ZmnbJoYuw2boY+xBthdEgrmTxBVmmyDuRNs/YKmhsrRVgAFReqSqPdYR1lhQhFS
         Ej1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PxrSwJn3xHYJQzVnpx+GliH7CEhPTpcMAXG6g8beOKM=;
        b=QjzM/o63i7rHccRYemWZj5CF9zx2XNvV1m61LDfTqhefVIH16JcQsMeXFUay8gG7YN
         wkEJwtx+YklOzjutRnnVzqwpDbTImjKDYPHNpJGDfMgOQiW9QspHjaFTWo2ZCTo205Qn
         ZhBnXa5hOk2VQkhv6WYBrw/KMJ4uSI9Yw02Xudciq1IWyWGsa2HxwQdeJhOJcYH+hBjt
         i04FGrc6NYtizsZjTWEbAFhp4wKZds3snrL2GKlVahSTAmIuznNzBezNu9mF7QX67ra9
         2ASn/T8anTMgZX3ulWLnPyyyVhI1NnApYRGScYkI8g6U2qC9jk6X+MFZSGt0Fhf7StTi
         0HHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwAtGXPF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020ac853c6000000b003b3c56ce5b2si4872701qtq.367.2023.01.16.04.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 04:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwAtGXPF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHOYY-0006H6-Qu; Mon, 16 Jan 2023 07:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOYP-0006EZ-Kf
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 07:25:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOYL-0002MC-Qz
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 07:25:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso2118364wms.3
 for <qemu-arm@nongnu.org>; Mon, 16 Jan 2023 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PxrSwJn3xHYJQzVnpx+GliH7CEhPTpcMAXG6g8beOKM=;
 b=iwAtGXPFRK1Nfta1c903tpvdz0QoWXDfW6gcBdityep8NRQA3vr6fgnqwa33uS1jL2
 V0xtL3wrhLi+fyEbMjw5U0zMct8Rn2qxQwz69ZOJeAu+oqfakTY0HJV8190Dqnosyib6
 0hB671UBAA8h7ffAe6UntMETVOfWJoudxqotZ7Ezq4S4IVoFI06fmdQPYDfN6iolHcNR
 zNqE744uLkWJ1LtzEw8oezouwqkm1mAIDS2p94gHM8j7cE6Ndf8SFSrqHJgmQoWj3u8p
 o/RjbuwuHVqyz11JLeodNdxNOKdOiYD6CP6WgfCnSoKQ6pN0sBQtcv2AwLL871yYPab9
 Snew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PxrSwJn3xHYJQzVnpx+GliH7CEhPTpcMAXG6g8beOKM=;
 b=2u8BHd6qpl9vf5KfGG8MMjyqrUg8v2nMrAvKH24E1x8rfwiujqI+nXyhuRWPrmburc
 VroV0N3cpbhl2lOJmSYLT+ZUd6T838j032YJFFa6MVgPZfTgpfVxE4zcvmRi7uWSSReI
 NCf3KGKRuihuA68LIva3iql9mSFxWt1xTTl8AZZrMSm0YqFGt0Uyj41soicvm8oRqCXD
 2ksQUqxiTyNT7/vo9nuDrJ6Pr6F2KETRvXPiCuBsy1E7y1WhEZ03eI99E5QCpHQhDNG+
 TXcx3g8B3RdkFTFWNj26XE4VfBXLnVPCdKoIgvYefVWyvhjpGKHTTmvXunVEcUfbjLZs
 mgwA==
X-Gm-Message-State: AFqh2krqqOLzEBNWq3jSvOZDviztsTLC6lDbXDQnzYKuz5pdqc3+6+8O
 PvIEDqV/7WmtyJh4fEOrRvg1iQ==
X-Received: by 2002:a05:600c:3109:b0:3da:e4c:2a3c with SMTP id
 g9-20020a05600c310900b003da0e4c2a3cmr15815081wmo.41.1673871926973; 
 Mon, 16 Jan 2023 04:25:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003b3307fb98fsm32744728wmc.24.2023.01.16.04.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:25:26 -0800 (PST)
Message-ID: <2cbb102f-2f67-a688-6f3f-f4593bbe8fa2@linaro.org>
Date: Mon, 16 Jan 2023 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/6] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-4-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-4-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cJYNvbGp5c/4

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
>   1 file changed, 43 insertions(+), 52 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

