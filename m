Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1214074ejc;
        Wed, 27 Dec 2023 15:12:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7LUlsC+/mErMGysAkCMAGz5uGFUklNR6QZmrckFis9L+UykEVksAU2N6avktfD9zMuCVx
X-Received: by 2002:a05:622a:386:b0:425:902d:ebdc with SMTP id j6-20020a05622a038600b00425902debdcmr12930610qtx.130.1703718742015;
        Wed, 27 Dec 2023 15:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703718742; cv=none;
        d=google.com; s=arc-20160816;
        b=H14ZYqnSE1UB/yIC0shu7mVkCc9OKKMYK0zepCFUusFxRAed8RtsKfpwsayEGB0EB0
         pqVvMiskwXzhCPz6HMbCtiSMyR9Kjfc5gonSI7hhrMWYE2E9LilX0IoImu/FOmXVYRoJ
         dqfS5jSSzuPBT6kbtdyClHY0fL46rDT4krqpHgqyDDeRhcULG29QaHI4I/sXu/5yO4cY
         rZsW2NPwh3kaZQbjdLaHNkYofNNO4msQPlABSmauWVji9sRECwKVUmi9QOX0BNX2k1EN
         PEQq/OjNMiNlCCZNICUqDpiB7Jrf8Lm9AFv+O2Ct9QphfbD6A4x1vX77KL8fMyKsvTtr
         hAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9KgtAhN/5fiK2u8i/qxHe/WuoM7E9YMnMGckaILBcY4=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Yj8lKXJ/dlSZ8HMXEIcqOVrcyr+OLTnsxROmuT/dmYDMuryZ4jm13VjSPaeEj072dE
         QGneu0WfapAaBgJ6vtvLELPJ9Z/xjaImJUJR23caJVELP6GHNvH8LjOSQMcLzhTlZKHH
         5JZeUqQJu8O43ht9/PXThKQVE4m3wuBmevG0j94kUbS9JPnEW3W3qecOn/6NRoZW8Gkh
         /3AU66ffyKPVTsL81O09r6Ragn4b4MrKVLbVBMsmTGpI4e5fqsFBOBDU8F+xbaq7agpj
         xyzxgOco98HwcUz3ZpKqh3Furu/i+A0NZDeO6/bpurpEp90euPO1fnSdE+MBfq0yXgA1
         lMpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CV9WQfyj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020a05622a171000b00427ea705a08si2964896qtk.182.2023.12.27.15.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 15:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CV9WQfyj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rId4A-0001ZG-DL; Wed, 27 Dec 2023 18:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rId48-0001Yf-Bu
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:11:56 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rId44-0000Nd-9W
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:11:54 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3cfb1568eso45809305ad.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 15:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703718710; x=1704323510; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9KgtAhN/5fiK2u8i/qxHe/WuoM7E9YMnMGckaILBcY4=;
 b=CV9WQfyjsJl3seOsdVRGSX40UZ0p+vRE413sPVdmta9fwwRB4mwc7s5hDUyI+QROqs
 nBU3P/sfWSJwrGXv+ej1Gu0V2CnHLSJ6dbUZuybZiLn4Dr153bv4D3Vyc6hsNXOlL2Yr
 nbLcikL2ZVzB5V6fQ8T7UV9YxEQCTQxwOGXrlMZXOenSN+lvkloP1Y5U0uSQLnKYeRaI
 vDrmXIWCHeXWdEZXPTaHOsy7FGSLAezZVZyc5lZlJ9G0T50Iu7+YMf7evFwM3XP1FTud
 C/rBLBeYlWdeQ9eK9iSUykl6B4mOj/MFWoqftgnqUS02XA2RWN84BP3yNjdW/mmQhh/9
 aCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703718710; x=1704323510;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9KgtAhN/5fiK2u8i/qxHe/WuoM7E9YMnMGckaILBcY4=;
 b=tupcMdEKUAOYAj7iUm0VlxsFqmRmMrfhnDhg5RB15QMlbl81oxFisQBC6Euhjx8LyT
 oz45iFIy6WksSbLi5+ChZrLTeiyZ2A90L0RjEKZzzZMY/PTwsqjU/VZ3S5g2dxslK3o3
 +RQprbbKlK6HvX9zLCiM98MkjdkBoVx/VvULvjSqHY/bnzZWaKEk3jbqzqjndb1tjfZW
 FBvOOtHsdGzCQjrdav5VOHW437bNsWIt2UW6nvTi4qw7PJrvseoQ2IUyYxX6xfjXEJV0
 7SRDNnD3lNOYocfJlsbMrFmUICV+aBXfrkGOoAFOyEtVh/m/yXSSB687Ry0+WXt6+niH
 jlLg==
X-Gm-Message-State: AOJu0YxoHYE7eun2s8fiPEgreDCyN4pTEciiqe5ZsauHlMZxfRqt7fFm
 OxdFMZHUbX1Pi7Fjn+kKEoUox+atxky3xA==
X-Received: by 2002:a17:902:d508:b0:1d4:5939:51fd with SMTP id
 b8-20020a170902d50800b001d4593951fdmr6448642plg.97.1703718710423; 
 Wed, 27 Dec 2023 15:11:50 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a170902ec8500b001d04d730687sm12478731plg.103.2023.12.27.15.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 15:11:50 -0800 (PST)
Message-ID: <b67708f0-f4c4-47a8-b003-ff154136740c@linaro.org>
Date: Thu, 28 Dec 2023 10:11:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/35] target/arm: Handle FEAT_NV2 redirection of
 SPSR_EL2, ELR_EL2, ESR_EL2, FAR_EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: cYien5gsBFQP

On 12/18/23 22:32, Peter Maydell wrote:
> @@ -2173,7 +2174,14 @@ static void handle_sys(DisasContext *s, bool isread,
>            * for registers accessible at EL1).
>            */
>           skip_fp_access_checks = true;
> -        if (s->nv && arm_cpreg_traps_in_nv(ri)) {
> +        if (s->nv && s->nv2 && (ri->type & ARM_CP_NV2_REDIRECT)) {

You've documented and implemented that nv2 is true iff nv, thus the nv test can be dropped.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
