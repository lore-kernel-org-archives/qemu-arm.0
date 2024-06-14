Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp175473ejb;
        Fri, 14 Jun 2024 03:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVP4LlwUD536h12G1hF9ny8fR94GUUWviKPJEi1SxZktL3j4EBYj7PQ1tl5RbDImK5DZoSu7BTIjNXLjHPykoKQWYVQFT9Z
X-Google-Smtp-Source: AGHT+IGI8WyJK+9J2iVUzWl9GW3eMZTT/k15fJIkK17JRjO0mLkrukeDRjSg1hdGb8mCuF4IH5ND
X-Received: by 2002:a05:620a:258a:b0:795:b4ec:bfb with SMTP id af79cd13be357-798d26a8491mr200441485a.63.1718362216058;
        Fri, 14 Jun 2024 03:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718362216; cv=none;
        d=google.com; s=arc-20160816;
        b=nhyh911TOdm2GUQncS2u7SkwCfGDBCkb21bp5n/tH6Vmk8H3HBki6640XBRezg5d9T
         xt8sayysUrYSdOrdlcMkntTQwCHWqloPw3SfMUhdIaOtxIlE4Y26iObRll2nXxI2yfRH
         RPn0J/LczlRWgeOa9poAxQKMvRCNjB6oG3cmVcPHi9IGLEA0RRUuTynz15TfN9Q2GKt2
         R5r3cIWbWs+FNwSMhzpnY5IVrQcGAVfj44i2lVHSEQqb/3Wv2UAuN0gMO9aWD5oNfkWp
         719gO08f9Qa06WMfohN0slt76R0UkkxSjTb/kYD/3eEGtNHFB3nylms2xw3iDcLbqssu
         d33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=LyiZLDwZ2ruh2x/3JT28HfUwemba0ZVuFbD6YSVOYC4=;
        fh=uz84LFEX/5GcNj4Iisn24lJ9V5UqlOK8rJqv9bLjCBs=;
        b=0jI0d4GHO46+E8qCw/Icuur7UYPrAiFXw1gYckerwSGMbaD+h0Vzi22LloWKL/SK/B
         CjvTyjWMAuLtXuCRx52BLrxflviujGAcV01RHJG2m5LjH3Tyx+KlYwhf9BWzHCuJVdUn
         v92RGrUcfVS89wFIgp72ADyNGV/28Wt2K6+hUKEKoUBpapl5ukYEytgdIwp4HmfHjaLF
         2WecTtrk1ujruEVvJ1pGB/Sqm8qIKQRzLL2MZkfK8LVT/SAjzCKlg8lVtiOTHKmCX+vH
         5xsCJyFV0oIymT3d+Vr6XKkmBPu8q/Y1eZXJDS6V7MqUtwiClk1dp+Seh6+IhR3U32Re
         D0sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ofcxvrjt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe580d0si372022985a.580.2024.06.14.03.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 03:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ofcxvrjt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI4VL-00045Q-OK; Fri, 14 Jun 2024 06:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sI4VJ-00042x-Pr
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 06:49:57 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sI4VI-0004sn-4e
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 06:49:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f1f33486eso123563466b.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2024 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718362194; x=1718966994; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LyiZLDwZ2ruh2x/3JT28HfUwemba0ZVuFbD6YSVOYC4=;
 b=ofcxvrjtYitaCd2zpRxlSiiOprjwzPBpVuSZBdi1mgAiuaiSyF3OGIfhxTZcLuIAee
 +nOod3VKgYvH4H9oj4ghYdJr/YbWlEGDagPaRCs6zTrCzsDf5UHwZknxAkLKK/JjzchK
 Z+E0VlsUYXpDrud+pBoeV2CI3zIU9+opyyZ5tltqZKXWLlHWjTVOKvaqJpAQqnlCVe5D
 kn8mtAZLFBUO5yCD8lAd8q8jXkpgAmpfCv0cXrDR/BwFiCO7b4ReGMGNkVRTQIMuCMPt
 cusOi+yYCNFeAuCY2Ke82tLc+x4J78Xwtg3nKtn9yNWzw0kOIFVkK+gi7Mso9h6RIzOC
 jC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718362194; x=1718966994;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LyiZLDwZ2ruh2x/3JT28HfUwemba0ZVuFbD6YSVOYC4=;
 b=m6h6drJ3z/yt9jCfgax9nAmwywsL9WMYvihnxyWpT0E9oHS//feSUp/YFQHHTuK2mZ
 4PS4Yh4M6lemnwofnGJh1Oc66RbZyMQzj1Tmks3WGwxuDl/IRwAPePf6YorAW7eZ4oaf
 U4I/YDrg/MJOJollZYb1x3nwxZ1YxRsSSRT23gHXf+ynoUrF3BSUIPbU3IcVXEh9VnuP
 j91Xa+9SbruHAb3ZnlZfrf9pdCODKAIEGOhYWymfatifHb6S9ev+0fjclszf//iECaWU
 0Z7bqpLkPf1xyts5rvLzweDiWintzWV3a45vMhDuFCb29B6OmDyxc/Gggx2iLRmufYVP
 4oQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVULTbQMjQH8DoHPXz0fz0p5SxKo937Lfn+d6SplajmQp3N/gCuuEQnam8NqWLR6/VlBk8yBd3TWg90GxUddxDfwua8
X-Gm-Message-State: AOJu0Ywpc6NYPLB2bZ8xpu5HMVXkmC652QO4wiC39SLr0umY+p4f5NkI
 3pEnFz0BRJqYWJEkONmknp2cpZG/eRVXi2Ml7g5LLzqtphtS47ZKMbu3nkUWrbE=
X-Received: by 2002:a50:ccd5:0:b0:57c:8035:50ef with SMTP id
 4fb4d7f45d1cf-57cbd8b98e6mr1852293a12.35.1718362193988; 
 Fri, 14 Jun 2024 03:49:53 -0700 (PDT)
Received: from [192.168.200.106] (83.11.211.179.ipv4.supernova.orange.pl.
 [83.11.211.179]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e782sm2081458a12.64.2024.06.14.03.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 03:49:53 -0700 (PDT)
Message-ID: <7c28fa29-8d62-4553-82fb-098ed06a8774@linaro.org>
Date: Fri, 14 Jun 2024 12:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Xiong Yining <xiongyining1480@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com
References: <20240607103825.1295328-1-xiongyining1480@phytium.com.cn>
 <20240607103825.1295328-2-xiongyining1480@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <20240607103825.1295328-2-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: UQl/NUdtsgSs

W dniu 7.06.2024 o 12:38, Xiong Yining pisze:
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
> this topology can be passed to the firmware through /cpus/topology
> Device Tree.
> 
> Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
> tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

