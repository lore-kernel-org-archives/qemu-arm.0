Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp615065ejc;
        Thu, 19 Jan 2023 12:55:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1OZzXikArdTMDM+KNo1Aop5RT8Mkd0Vwbjg8fp50j8Gf7/p0/GaJVaDq1pg5zvHZNGHNM
X-Received: by 2002:ac8:478c:0:b0:3b0:bdae:d5f1 with SMTP id k12-20020ac8478c000000b003b0bdaed5f1mr16347880qtq.55.1674161709872;
        Thu, 19 Jan 2023 12:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674161709; cv=none;
        d=google.com; s=arc-20160816;
        b=iswefUvvoTTrZ2kAIv4iAoDL0it6IIiinUG33U81ybik9YLgt/7b/YhaJd/xgwLyDl
         Wp1Q/hDdwzIbpLO8U/v9ILmCQ1tgQ3kWVqPfhNGOAj7VCTInE2IlX6WE4h6BPktB+Oyi
         5XwoVZMKFKdWL1z3K/AbOx04CTdcRgACIsU5lCXk/+8rFEVB5pqvMyCCRlmF7BV/H/by
         4gAjipg0bRJXj65VaQfiZ4BpHrIGjoyj6AbZxHFGh90dvyJT36YLwcBgkWrS3Lkp6mFW
         VkNshCBFgiOIRp5enf7BSBHWO2Lsdv4rWCvjfsJ28crbaJbKN+DRrvyB3qky32jockAq
         mYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qAqJhN+YH1QPEp4J/nHqY87NZosZljUHvVOVEhqLIuY=;
        b=F2OmYtL3Q+BRYpfgaAVRTcNub6maXnTk+PzL4Oj4Xul7wRzsOisI47cbG4zO+aPU+H
         MsTu/sVRdqB/LzKu50ScEjoaWJ65Z7jPhPggQHX9NivvioCqmdRLfiI4qwHHsBWPZe8q
         xifi6DsmxaH9mkw+McY7OdeWZwNVmEew5mC8Uw3m49GGCnNLdceKsIaWS9wp0Gc9D/y9
         uFbnHZZXb9A6k2jlZAkBfYvPA4pBJfbGnEpVIzz1hfaTi28LoLeyZDgVfN20WazidLCU
         eWdPd029qvdCWEOnFyP17troh8u3ga8Ssi0sy7hhcduE1DtScLFbTlV7LEvoWwkcTiPR
         CdLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtsECPeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020ac87244000000b003b631045b56si7684660qtp.633.2023.01.19.12.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 12:55:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtsECPeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIbw2-0005S2-CE; Thu, 19 Jan 2023 15:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbw1-0005Rj-CC
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 15:54:57 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbvx-0002O0-6X
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 15:54:57 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w2so2443102pfc.11
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 12:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qAqJhN+YH1QPEp4J/nHqY87NZosZljUHvVOVEhqLIuY=;
 b=HtsECPebBiTizn5GD0k9daMaaGsv0DSWeyw6A/5oIDJDn63nhUtq0t04i03lMrzHUb
 haGHmKF+v1JVAK1D2mwB3Oj/ib8tEQDfaLBi4wkHhOUhpE/nDvN1RwAQyrP4hVdvJOLp
 QwCfIIiyGdw87gJtfODGZG9HrFH+Cgji4uJ8ha6BkbjTKdAsozhif8PYr07jmVgeV/ou
 aDH3VG7s2k75QdyhwoZPQhUg07b/xdBhUPvPxaSip45J8TnsoSlLFZwcHHGmla7m9JuH
 lFzwPxCKV6qJa7NQH6/m1MxXO5CYK99Q0/MFNZDM73xMPfFAWU1CvMTYD1DDhpbzF31p
 tF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qAqJhN+YH1QPEp4J/nHqY87NZosZljUHvVOVEhqLIuY=;
 b=8Rqeb9mbHY9C8n/3zvWMAxx9J7OipOR267d03KRL/7aKt1rT5xRVRXOrWM7EGVvg6d
 A1P4WBxJ9dp1d86PB3au0ICvx89aEWiP3dV6gad2AdNqYmilPh3Ai69oizpL3PYokwxq
 vXh4ZT7HHBTrpfWxFcB7lZzg7g/Li6jXBbcWX3oMCAZOrTVKONQ7sLrUsN3Btkm8D375
 PS0HxTST4PtU6xrJQUdyi1VBIOrdSCQzyV/J/BXY/gBoxxoBFUngqYEDH2VZ1tZvrqXc
 w5jxdnKZWYRPEHGQVjRscIoSWIBxat2dtksnMiCHkOURkdzgUM6mFPcWrO0xB3HFFbV5
 QXVQ==
X-Gm-Message-State: AFqh2krVZVHEGBeboHCYFlTbIFzRH3hG7LkITbIii16UoNYXHdBB0LFu
 ycS/JoXDwkrQDUbYHyaY8AUsDg==
X-Received: by 2002:a05:6a00:1d83:b0:589:5504:1508 with SMTP id
 z3-20020a056a001d8300b0058955041508mr11991547pfw.19.1674161691580; 
 Thu, 19 Jan 2023 12:54:51 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y1-20020aa79e01000000b005809a3c1b6asm8119895pfq.201.2023.01.19.12.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:54:51 -0800 (PST)
Message-ID: <3febf6ab-4217-0d9f-5cf4-ebba1f930d08@linaro.org>
Date: Thu, 19 Jan 2023 10:54:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/11] tests/qtest/boot-serial-test: Constify tests[]
 array
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: He1yaW7uI33g

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
