Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp731253ejf;
        Fri, 23 Feb 2024 10:10:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUo3xVmLI+htVWC4yCGw05ipwh/d0iRTT9v7TUuD9k4jwEYw1CnOEKo52Egk3W6dz2U8/XoSW3WkGtlU6rzgfEiryey4MYk
X-Google-Smtp-Source: AGHT+IGFc5MH0A85qczYC3YqUARV50rWWPVWEJndLULBtf6SEt42I869ARmS8XAANGxsbOtWczen
X-Received: by 2002:a05:620a:1342:b0:787:2e1c:c076 with SMTP id c2-20020a05620a134200b007872e1cc076mr563473qkl.47.1708711822843;
        Fri, 23 Feb 2024 10:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708711822; cv=none;
        d=google.com; s=arc-20160816;
        b=eOXv39B/ix43ZmEvrL16FyhhVL1hg6MqldFvVrh/TtENaHq88Lg26BRfdo+6hW/CBq
         Z/iwXINSKVhamI47AEDHVsCTuB43WcVX3ZQdP+q1mIqGLFpAkuG8yCRmhXsn46BTwtxg
         Ba+BQ7GGeOtD+hKAy72zOONA9MKpT5MrqLvP/p6MQZq6whPAkFdYs1HFq12p06aSIM3X
         kYTyYirk7Jp3M2hNUZIkhCcFIm9am5xjNN0x+KAbOK2E8BQY6x0ytJep9xG4zTCuuoo6
         jy2kTb0s9/GBE8mrAboa4V4vrq/aZd37qGKgDUUk9H8mHlKkB6y4LhONZDBiCyUeziwx
         gGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Wm/3VqJy4JV8D9Jtr6AJYVH6S+lLPzfbWwpJolkV9H8=;
        fh=zMDzlnXHaBSkqJy84g6y9+eu36Ml/2RQbflscoDklyU=;
        b=ZvM4gRK2HyjnWxMtDbEog9nrexYJgZLG6sX4X6YNLz9jbeBTOga4k+B4Lw91F4mvJU
         tpnHupzytbHpWpAOOElxeDJWAcKSBjBvtD2C1s2Z6ToypbPQC7OvA9Vb69bjv27TZK6J
         ejVcBbxSU4USeEhcRs0DYDY83Fb5qpHqZiV4SCDPF10jC/H/4HxOPWq0PSgIBzx00OsE
         hSwTpdZ2oo6ikqY1vyzeEVlLNWfGBXZIWwDvwKZ2SdJyu9HqFDeLnLh57jiLawTXpKT1
         3W8BzuzW4I5VvOFG/RYxOIspU7KyZoBlFH1bqjb7AnFjsBk0UJnKBp7Vhr3c30Giv7VK
         BQ0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tdKGK5lt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020ae9e60d000000b0078735b271afsi16046400qkf.135.2024.02.23.10.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 10:10:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tdKGK5lt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdZzh-0007Zp-Pg; Fri, 23 Feb 2024 13:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdZkI-0003O2-2X
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 12:54:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdZkF-0005z4-4U
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 12:54:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412984360faso1720555e9.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 09:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708710837; x=1709315637; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wm/3VqJy4JV8D9Jtr6AJYVH6S+lLPzfbWwpJolkV9H8=;
 b=tdKGK5ltVgOm2k6g1hrIyRg+ys2PIJLY6qJKgh7EUwCueQpvExy92J/PlZTBhDF+6F
 OiBnUw8Dp1Bg6UKkHmcR2Hg4vitMh1sDp850zSHMMsBmjrzpnKyRBBktLu8N2JR7tPVh
 MEk5Jyar4gwTSrVPcVKrhISR7+GvyZWgRcXS2MF0uN8x+IwrwJS88ooEL6a9TyMbCOLX
 spgXpvg9ZNje0i3XqYM1dTWIZWX08kAHzNuBd+CDhGsNcil0BtfDng5R0sU5K/IEplq3
 21yHeptmlHKossriaB1Bv9BMJMhWZ0MsxsPOWd9dTmn1/9MNlYRj5jQB2rjncTFniVXX
 xrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708710837; x=1709315637;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm/3VqJy4JV8D9Jtr6AJYVH6S+lLPzfbWwpJolkV9H8=;
 b=v2kUbKgmPhUKolRQNCMz4FvHl7hOTeANb0EML0a53NRPCovdnnwdjDRqcZhYzui7rY
 NKiMrYjmdM1Rnyl4S/9hLWcvCrNgPdFIAthtqfbd2Px1AOZ4Che9L0JU5n032/je2I0h
 bSOUnpdAx0YawVa6MUHwtMJTtgQPKJBRynPGVa7S7Y6a6tlxAoa2ei/YIkpdN7ozkB3Y
 84sM16dp59Q+gooyMhlH2MagMD3nUM4G84B7n+/EetqggLIx9ouCBtB63xCjsfys1uBL
 b78+YIoymmBH3djhhLbTJHG1Je1OKl+rixdgvovTqDhPHGF4D2ayTmSiBYoHeFc9zLlw
 hJZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqGciczM4CQi33IFod3N26n4opsYqzM6iCjfnxV1kfJTkFXxOO4KH18wWHL+fdoGt3ZEflcBqUrsPeXnJIKSxWKtUQ
X-Gm-Message-State: AOJu0YyRMwWxYddtUppHw3j7BQ26OiFE1T7VhvDDVR81TYlNToQscwQn
 Ybhh6bHD/eggNHFTtdhsXWDSHGNlQuEm4GTRRg2QrrHKP/N4zDCRS4JqB4bnM+Y=
X-Received: by 2002:a05:600c:45ca:b0:412:9051:9429 with SMTP id
 s10-20020a05600c45ca00b0041290519429mr345105wmo.26.1708710837298; 
 Fri, 23 Feb 2024 09:53:57 -0800 (PST)
Received: from [192.168.69.100] (xbn44-h02-176-184-35-109.dsl.sta.abo.bbox.fr.
 [176.184.35.109]) by smtp.gmail.com with ESMTPSA id
 fm23-20020a05600c0c1700b00412952d3cc6sm2858181wmb.7.2024.02.23.09.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 09:53:56 -0800 (PST)
Message-ID: <f5c5a0f7-c7c9-49d2-abe9-da94c6f05d19@linaro.org>
Date: Fri, 23 Feb 2024 18:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] hw/misc/xlnx-versal-trng: Check returned bool in
 trng_prop_fault_event_set()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-5-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240223085653.1255438-5-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TE2I/H41C+Pc

On 23/2/24 09:56, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> ...
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
> 
> But in trng_prop_fault_event_set, @errp is dereferenced without
> ERRP_GUARD():
> 
> visit_type_uint32(v, name, events, errp);
> if (*errp) {
>      return;
> }
> 
> Currently, since trng_prop_fault_event_set() doesn't get the NULL @errp
> parameter as a "set" method of object property, it hasn't triggered the
> bug that dereferencing the NULL @errp.
> 
> And since visit_type_uint32() returns bool, check the returned bool
> directly instead of dereferencing @errp, then we needn't the add missing
> ERRP_GUARD().
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>   Markus: Referred his explanation about ERRP_GUARD().
> ---
> v2:
>   * Add the @errp dereference code in commit message to make review
>     easier. (Markus)
>   * Check the returned bool instead of dereferencing @errp. (Markus)
> ---
>   hw/misc/xlnx-versal-trng.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

