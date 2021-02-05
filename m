Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2112284lfo;
        Fri, 5 Feb 2021 07:36:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKGXEC4YjfFjIDmkGH64gxEb5UEfWtmw82nIk9dN44KBWOljReuQ18Cy6K4kDzwMMwbzTw
X-Received: by 2002:a25:cc8f:: with SMTP id l137mr7040945ybf.144.1612539366350;
        Fri, 05 Feb 2021 07:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612539366; cv=none;
        d=google.com; s=arc-20160816;
        b=E3tIwwibjJZkBH69MdWkZkgOLc7dIrHtV5YUDsrz1T5Oi8dJVOqkkBSh9VOLf0/O48
         PqaaePelYxWmMVDZcDf3wwmotfOdgOY2ZHMcGKlr40k+HX0GhrB1pFbPOSIhC/Gc69RI
         Hwu7sPSrRIfoWBZbmsBUvG1EtfDSn5RgXwg4EvacqAzAYvZ4g5l5QdYTb4nTZM2L6NGc
         k7tZF5n34d26BEVqyGQZCjC4zu8Kut0jX7SwuR+hFif9kC+onhRwWrcS+QjoUQTCM7z/
         etb1ntAKbRzjkTKLDaaC20rSWfBzg8wu8NiHKF3j9srpzoy/GNvhQSQnYPipCL02aK5i
         HDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iUVYEIlA1bqVS71WNET9HtQCMJkoNw+Aa1G94lPofQY=;
        b=sCGtk1PzRL5I+ncwH8AHLbwWMUyfUzMthGZw4V0OMoGAtND/JS973gq+SFZX7Jcx8l
         Moig4mFz7mSptwipS9Wsnp8vSFL7h9zI5WgW4jLaJ+fG94Gxmr93HaMhANL10rVmDqhD
         0A7MsZ/3Igqn9ZtOYIePKX/nQAf62W+Vwyr5i5O9T23ME3eb3FVoNZKyB/Kpg1LasumJ
         4y4nbgJVz7DRroIv+W5VXXsovJIx9bFvlbv/tGPKDai6KD0gLDml6wn2j3VZC6NHfLMl
         AqsKlpTXLAX3lwYoY3moI7uXK/7c6qKLi/2kdrlp2APkn8diIKSzkpAEdg6Mh0SYh1Uf
         tQXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=in2L8+26;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si10312245ybj.321.2021.02.05.07.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:36:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=in2L8+26;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l839R-0006b1-NH
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l835N-0003Oy-KM; Fri, 05 Feb 2021 10:31:53 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l835L-0006ET-OJ; Fri, 05 Feb 2021 10:31:53 -0500
Received: by mail-ej1-x632.google.com with SMTP id sa23so12623726ejb.0;
 Fri, 05 Feb 2021 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iUVYEIlA1bqVS71WNET9HtQCMJkoNw+Aa1G94lPofQY=;
 b=in2L8+26rfgMvP8kDg/O/zmDGuZBbheXxJFK/oknJ39yq+W4D4LG01Ze4Arg2xJ0km
 AKf2CUc+zrxFruAyy+raAfiMvShVR3Rs0BsXArSjEDxy8IeBZ4Civmf9mExlzHYE9nv9
 2IhFqRXZBV1Ek7i82Hr+EpNneuy+pLeNLRqKlpQgLGFJnhhR8SxA0N4lTgLoEpqnoPu3
 1WEs+hQiKnUnxXfZERhalAW5wx829VDand7j8ZZ+TwDmxCEHwTwsAvQ4fv6R46zPSVO1
 KlIXxAs3Mgxq/LDjAyDasAeIW0K/YKADWlDyH/3G4VCfCYnCuFlFTpbNTaUHJMm5q9+y
 xZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iUVYEIlA1bqVS71WNET9HtQCMJkoNw+Aa1G94lPofQY=;
 b=Hqp1CIqv5+xwGJ+bYdJgPbAzNtf9VKf9v+b4kq/LmCZ5B7gHTvg9q8M7NVIF6b42+j
 oLCM62Z3p4z6CC/VNMX4GXDW71+PhYc8P+HaUhX8SLREps9HWqYtm30kSugVLx7DMl/D
 Rv6bE34qySIMRW4ub+YAPpsVKxlppkAkA9CPsBK1qBM+0tipwy7+fbBtHKPnmE1DsYD6
 +Z1KmfG5EB5wvCoA5E5lxxr78HxakFDxR8yHi3KDnpSu4SCaIbDz0Zm8B7AhMlJGaM8M
 u1be8tRcWmaNNpV4tV4yoLu1pKJ7RQ8a+bd25SCrP7P8kXeDgajzrhL1YZvCCJdL+T14
 ee5Q==
X-Gm-Message-State: AOAM533v25nQFjmuZM6z8GIyPoHylBuKYmP79h916siaL0L67hGneaov
 wtCLOXYS6Ny2x5NDwrOCxri1Qm72LlA=
X-Received: by 2002:a17:906:7f83:: with SMTP id
 f3mr4468083ejr.282.1612539104551; 
 Fri, 05 Feb 2021 07:31:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ov9sm4073023ejb.53.2021.02.05.07.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:31:43 -0800 (PST)
Subject: Re: [PATCH 0/9] hw/arm/virt: Improve CPU help and fix testing under
 KVM
To: qemu-devel@nongnu.org
References: <20210205144345.2068758-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cdc32a38-a079-9f30-74a6-6ab7858734b4@amsat.org>
Date: Fri, 5 Feb 2021 16:31:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AR4xs9d+pSEw

On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
> Yet again bugfixes and cleanup patches noticed while
> rebasing my "Support disabling TCG on ARM (part 2)" series.
> 
> Sending them independently as they aren't directly dependent
> of it so don't have to be delayed by other unanswered questions.

Proven wrong 45min later, not trivial and not ready yet =)

> Please review,
> 
> Phil.
