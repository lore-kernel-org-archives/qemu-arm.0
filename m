Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp719863lfb;
        Mon, 4 May 2020 11:29:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKJEAFLKH8c165e+zb8OrdF9hDnx+GelFM1/NlutDKs6RmACp/TbhzHpkIMeJDOR+BaK0M+
X-Received: by 2002:a37:82c1:: with SMTP id e184mr620231qkd.186.1588616961587;
        Mon, 04 May 2020 11:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588616961; cv=none;
        d=google.com; s=arc-20160816;
        b=k0hys6DWHsJHaplF1fc4sIW+sZvKcr5TBCy9o2PvQ8wjsSgR8jqpvPXPkauCYY/ysn
         C2VTXvUtU67SZhIXGbB3iYrVoeQEeM2Tu9kP3B7NPVhxat44Mb9Y8y3JbK9tWi3DdM07
         kJYD6necuuCydTONPuGVeDYOhxxd2TqEfe5pDacSjgzmPx42Qi27wyyr3vScvjlwQqCd
         jAhNf3k4hVImciIuzAzbjSXIsx3e1tauUAREJ5LcgoSMtX+Z1PVd1wRERYmaxchJFcZ7
         k4JpGrs07jucNYLy/1a2Xvw+So9X0d5T+zb63PViy2JvWLxZMuG9ps3BKBcI2kCrwb/T
         TYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FDFaqNjDiTGcZFNI3Tzq7LAj6PmovCGuhIGIkfAy8e8=;
        b=GKAYmYoE2+FYgf+Qotd4g5yBz3mdDaab48U7Er+0+Zje+RX/eQp05OMgvBYPEiI6KK
         IoLVvd2H6/I6Dgz2s50JwjY4mA/6GU8AHRnh6Pc+yd/b22BhsCOeUpnu10sv+8J6gMhS
         Q8mBOKiBrlXiG+bntrfvJgnoUe2eaWr4T+XSwQGFWxwl77aZ8CaYMCoDOTqKImciiNYm
         IMEihS3ndXbpHTyF1Zh9FB8hcHvdgGTFit0BdUJJKubd9OVsoJEaJl6nRMXPBA7750iO
         k3Fgvhy7FjMFSGGlZq1K9OkMz6QDWWsiTEcN0fxZXQ29YkSMz39+fkOEbQzyQotO8AP2
         BCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwHIGzx9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id z4si7326842qvm.55.2020.05.04.11.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 11:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XwHIGzx9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVfqC-0004JK-UV
	for alex.bennee@linaro.org; Mon, 04 May 2020 14:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVfpg-0003XO-7W
 for qemu-arm@nongnu.org; Mon, 04 May 2020 14:28:48 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVfpf-00059y-F0
 for qemu-arm@nongnu.org; Mon, 04 May 2020 14:28:47 -0400
Received: by mail-pl1-x643.google.com with SMTP id x10so87559plr.4
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FDFaqNjDiTGcZFNI3Tzq7LAj6PmovCGuhIGIkfAy8e8=;
 b=XwHIGzx92vAz9/vIaMaTbAIDkjPXDEHK74e8ssshcmRd1Pn+FIqFxGtgnaZ0sx7dNJ
 PiTXrjKCwvwYGTMF8DqWma1mjoGBsoCWxlw3kx91CazGzR/gipzIAPi+bZTRg+ofNFU2
 vYxLlvRpqLsCuNRtA7Hl1z7FTI6iU7AJaY2jELO89Grg1/kewMKUuJz103m40n+EqyUj
 MA/KEB9O9Q+fiK73lB2WVkestTtWWh96iXjyw6DENz5EMk/L7/arO4C/FcJwOIMpFXEd
 rbhf92aqp+Ue+z2WAiNSUXyfYgfu9oeAJ4InQZvueBdTkvIHsydyBkHI+7cxVXdbROh2
 CCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FDFaqNjDiTGcZFNI3Tzq7LAj6PmovCGuhIGIkfAy8e8=;
 b=m74ar4da+DvliixvXDwEW9Cc1tPcuDa/PW3G6bJlTSG8ackxAwo079TS3HE5xFLIQG
 CFAESFPsS0Fn2VO3VyTBHxk8kCvKM4PNSrUfll85Xsaa4QCwa1jI1U8ee+IZfGeD25Ji
 quboOKe4CEXJTkOM70Be4SndJSYDeXEOFQxdM+2g/9b/KW4hQRu63a7Han+DN2gxdK/2
 4h0UBQsKKYeso6uKmyKQ12q/lmekP0lXnzAYoi3ppTBsFajaMwCN8tglgG54mfjIJCVn
 wVDpVewfBnJaO9tO98xog0FMRHr1HxdRuQTQGFqEDZ1yaHOg03Pty3rzThc4dspeBZEN
 VleA==
X-Gm-Message-State: AGi0PubBO6mBOFoLjhgx6U5IOxgWmqns829Wg/bG7VA5FSGvlhzbY99+
 VQTbXGKx7tuL/8iOoCqxVVg9DVC2frc=
X-Received: by 2002:a17:90a:3ea7:: with SMTP id
 k36mr303844pjc.125.1588616925060; 
 Mon, 04 May 2020 11:28:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b20sm9691272pff.8.2020.05.04.11.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 11:28:43 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] target/arm/cpu: Restrict v8M IDAU interface to
 Aarch32 CPUs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200504172448.9402-1-philmd@redhat.com>
 <20200504172448.9402-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8fe2ecfd-5c9a-5f52-c312-92592edf3dcf@linaro.org>
Date: Mon, 4 May 2020 11:28:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504172448.9402-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7tlmuZAjrBUQ

On 5/4/20 10:24 AM, Philippe Mathieu-Daudé wrote:
> As IDAU is a v8M feature, restrict it to the Aarch32 CPUs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -2898,6 +2897,7 @@ static void arm_cpu_register_types(void)
>      if (cpu_count) {
>          size_t i;
>  
> +        type_register_static(&idau_interface_type_info);
>          for (i = 0; i < cpu_count; ++i) {
>              arm_cpu_register(&arm_cpus[i]);
>          }

Oh, I see.  I guess you can disregard the suggestion vs the previous patch.


r~
