Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1108143lfu;
        Wed, 27 Apr 2022 09:07:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhyxluPo0Bypk0CGVeFmlSHx2pVBF93jfu+9aZFBPax47ARYo+C5JEj//zzqWU0N9gQuJx
X-Received: by 2002:a25:2f03:0:b0:648:3d2f:6e66 with SMTP id v3-20020a252f03000000b006483d2f6e66mr19038759ybv.9.1651075658702;
        Wed, 27 Apr 2022 09:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651075658; cv=none;
        d=google.com; s=arc-20160816;
        b=TQYUMbctngcFClQjwNmEqVmokgyfqF+sKIP2dqDUWwjCKaHK6Tt4XAdlJqgkfLkCHR
         i740LnI7VqdirpNSDqz08nlRilPScMc4EKFv/JSEVJZs/eRr8glj0j7KSjgCeADKdfPZ
         NueauX53Adky4v+Wydw0tI7CIusgmLNHCK0c1L+uyQILDWY3tsXqFQiWye0PGbrYVLR/
         3NoqU/QPdySe7EJgRsW/GT5XQ107igA8Xfnvx2YFLSQAIoAgIB1JS1IuDbR3OhkhuVU6
         P3Juz6wJiMkE2FJAhxBMfEp1KKO9AOE65+oCesIAEj2k8S6ge5ahGceNsvl4VctczZr2
         VyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=KTj1anzyIy8EpmxdNo8bsTZF19d1L0/4kWXS7+k75/Y=;
        b=iuIE+n9iQRWJwK8lRHvinoYYwgiMbDhxMxtLGp476BV9ok313afctjR1nCszKuv2T3
         QngrkiQlatoTfI81MVH7kNmcTkOxS6qqApKVd90LqCvYOkb7yh7Ks5fc2uoLUrliVswp
         Wr2qX1LmLh9UZ/43yqjUlPBQtVC+Wve0x/VBwAWTK6yEMX76L/V5LT+WxKoVFnX3ZZge
         ObQ0CLieZDsU9fH7fp2s4aTfcuJSkrqmmvhaLrhGzQczFZ8lZipQfdXXDw7EyHenGYMT
         KQ2PS3x7sv1jIShW6/JoG5j4SSODbwBjo9Ny6Cej9xq+85md1suyLySDis8okPPgZgRW
         Tlqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yNJF774a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e125-20020a253783000000b006483bc686f3si1272374yba.694.2022.04.27.09.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 09:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yNJF774a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njkCY-0003T5-0B
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 12:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njk7P-0007TO-Et
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 12:02:19 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njk7N-0005d4-MI
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 12:02:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id b12so1940668plg.4
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KTj1anzyIy8EpmxdNo8bsTZF19d1L0/4kWXS7+k75/Y=;
 b=yNJF774aG3ZE4jUf6RBVAukl5mkxy+iVI/cLkWZryi4xL9ST+IpnBevVE2qIFk0iw0
 AAQOHmaDKhFqJIsiAhf7Pnm3IbNte09vmu50dboUTJKtdkTf9rjuaQA6C2MVXelbUEKX
 rzbC5JCVUdKrB1BvZj+0ChAF9kf82oOZrwXomZr1FUzO6EaBe4FK6QC2ZWGwtnzUh0Vc
 lQagdR+CgebKFcpFo5rBFxB4WfBH3XT3DAboA6HSHJ2fHHfRIOYNqMD00518NHhrcptE
 LEYDOvrQXY/SdEFxKOnu5iEkEJIoJl9P2EByqW9wjMSsI2EVcLUBhE3qrgTyHLveTdxp
 Aiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KTj1anzyIy8EpmxdNo8bsTZF19d1L0/4kWXS7+k75/Y=;
 b=0pDb9c0XgoKujjKDBPATYsYDSIs/eXnW7qh6yLZI+TjyM0PzfjS0J2GEX8jghhB8dG
 vH0Xd1ms0DsKpUmcr0PZmsL0i9ZyLUGwHcjLxTFK/kQqSYT3iRosN126UuUUoPVpiDLp
 f2hFFISrb77AXR3xTuGWWylsVQl4FxKJ0Hh58EeJhgFd5gH7ME4pfRDOdLXD0okaU+sF
 eRqv/jLZszdw46wHnfWrGLJ7Mge7hRYYRY3PpghLmec/nq82UHo51XSKESwEJZ3bVrys
 JBKBrDFGTg/KbRLNokvvA0S2b/zvuhKjI6qPlIhfHRelUr/S2rsE2NkKbHAWQLDJ4Ve2
 v/qw==
X-Gm-Message-State: AOAM533mqUYKR3KK9xr5aE0GGGJ1KvrJBj2LObCWLEhIDw+8d0SqfBkn
 1jYT83OpVt6OgpbPt55zeSpA+A==
X-Received: by 2002:a17:903:22cd:b0:15d:1e6b:4363 with SMTP id
 y13-20020a17090322cd00b0015d1e6b4363mr14247599plg.36.1651075336055; 
 Wed, 27 Apr 2022 09:02:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6230c4000000b00505cde77826sm18900135pfw.159.2022.04.27.09.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 09:02:15 -0700 (PDT)
Message-ID: <33a13867-e31c-5f73-7a2d-957da471e0d2@linaro.org>
Date: Wed, 27 Apr 2022 09:02:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw/arm/smmuv3: Add space in guest error message
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
References: <20220427111543.124620-1-jean-philippe@linaro.org>
 <20220427111543.124620-2-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427111543.124620-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PKnePbk73pXF

On 4/27/22 04:15, Jean-Philippe Brucker wrote:
> Make the translation error message prettier by adding a missing space
> before the parenthesis.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmuv3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
