Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1635454dlb;
        Thu, 20 Jun 2024 07:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsExR0xMbQGQFYgAnZ+4DStj2vfOhbZbogFouQoqaTg3t5l/C5i6dmln7w8ZXw6cs8RZ5ZlYs0xzraO1pd6J5ivj9II05v
X-Google-Smtp-Source: AGHT+IGaL13owFlr8DgR7pC1wXuaUygJNcU98n5M+QL35ztVfxxdvxTGDyhuaisqBZHpK0tcJPHU
X-Received: by 2002:a05:6102:3bf7:b0:48c:3ed0:fc1f with SMTP id ada2fe7eead31-48f1304eaa6mr5566133137.19.1718892008547;
        Thu, 20 Jun 2024 07:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718892008; cv=none;
        d=google.com; s=arc-20160816;
        b=ENk85Lz+Gl91VZd34JJaUHVraaDELjwkqCLVxirBjvvL4EFspXq5JiJUPqXLrRUtQe
         O8znssWYGXXiyzHKtkmtze/bKyWJ4tWVcTotcS+Bi3QBN8ciMV3G4KXR2k0hQ6d4/80h
         v64Q7vM/cpAMWGUFgAc7XYQJ1otKeIue7sP6Zcw1ylmg/XSDkhHDPlS7eUoDoXtlkNmH
         YRVcYIOldHt7RZiCI1xqsA5tir0IwkUiaCj5Hq0FKOtYfEHEAKsnasccPX6IBFP+j4eb
         P3p0g3uxgbtz0qOXdNszdMTrFnwTrpyTurqJK8C5zBH4btIYD0+mX0O4QIkS2VJISAlw
         Hu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BGsxEaTNuC57O6z4vFE9ymtQjGIOPiXQJYO+Jd5DRaI=;
        fh=ViW9BpcpjPcEH7ZjdVsOiFWsML6rWAAIo72uXkq7a/M=;
        b=RwIcHO4tHO/r2sYd9XYml6BtU01URKm8AfiixwqKq4DjUqZ6KUliw593JfObww1tWT
         zS7eJEsOLIwevY1ppuWwTf9BABiceZkPNVw5ur2pQzDEzBKhVcxJqFnyNmyPOJQXJ+nb
         DyAkgeyQ5POAfCBhZsGB1Rf2htZhnOYYEDQDrUy0Uq/aU6P5103R6S6I4XdKd5uRBjuD
         X2upzrasPqxO2twLcEb1lmCBTRvWt5PNuDbqZFDfkZpA3Xf7d8/KMtuCDYCK/KC1IGsf
         bh+mqQQMlakQQy4LveVMTed92OpXGOINcKduHgs6rATprf16GAXeVD5MMoGSd7d1vWA3
         SW0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEDugNMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abd1d20esi1692546185a.467.2024.06.20.07.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 07:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEDugNMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKIKX-00078W-Qx; Thu, 20 Jun 2024 10:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKIKW-00076P-MD
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 10:00:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKIKU-0000eP-QB
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 10:00:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f8ebbd268so339047466b.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718891997; x=1719496797; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BGsxEaTNuC57O6z4vFE9ymtQjGIOPiXQJYO+Jd5DRaI=;
 b=WEDugNMpngrkelX2io24Y127O8SRT0s8wUSz24Yj1lwqZQBCQxUV2nsb47aoKsRvCy
 aFwizEaEzXRLsYa/iNZGDZXM6O1hiOkxihMmrtZKwR5/fKLYPDbFyrmdADnu6xOLV7C9
 U28ttHdOmVk0s4Yj7pFwYyOnMJAlgdsgpkG4TI2CUI2MLa5DIbIS1Xv3SqVC7Id1JtvV
 IxvP/wlx6K/uoB0DknvuwxqBJrJG7YU2ikAU+oyiBCrUxV60KVlWgUpwJgs7kC/ioqc+
 LxjAHjwbuLfAW7DsM+ydnm8oX2iEy8PHKhEMDFCU7WavLAd0JlksdS79BPgZ0DOVDDeW
 c3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718891997; x=1719496797;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BGsxEaTNuC57O6z4vFE9ymtQjGIOPiXQJYO+Jd5DRaI=;
 b=CqVJCxupm7PXEQNlWeoK2LwoYSsUg7uUXME5MtZWhTPrHCE7RNcV8gr6SUKO9fMhXM
 aHCek8omaedCqXA2zY6RBroOoysse9rEVXCQhGR0HxrFLpc5Ty7lXMkS5gq3LsHNu5rE
 O0rPXM4CMEope9dUGX+xRFtrA27IYCYsx1VyqlgrPpg748c1NPqCx7n2GaQ29TdM2uRV
 t1nQ6lx+UCtURMo9VfvTA2rs7aG2y207KEAqnbfmJXyqJAGWRvOsmfKXPKzHjGMTDFI/
 rYr1pT0eDsyP0hNbu6xAKUWpWIA4w7bD/E6b0NfF9LpImVO21mI23xc6B6DHpLYH0xwv
 1X2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdYLi4vw32GjlMZWvuXP3ZpqmfY8aE855lw/0p8auSFzT0npvfEfw01nRT0mia8DpjuC3N/WG9khLcMNX3UkGl1hSM
X-Gm-Message-State: AOJu0YyANUZkQcddtNzT363JI0REF6p7P4pzdMNzCkirOTb+n2Y81POC
 l3T5z/z3tponJD/uLsV3ubIc3uAgEgvA3WdTqFaJL7MvLX3yRoHTIK64aZLHOzA=
X-Received: by 2002:a17:907:c5c3:b0:a6f:c24a:721e with SMTP id
 a640c23a62f3a-a6fc24a7479mr138545466b.30.1718891997020; 
 Thu, 20 Jun 2024 06:59:57 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.151.40])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa674bsm774690866b.210.2024.06.20.06.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 06:59:56 -0700 (PDT)
Message-ID: <fb591600-31c3-44ad-a621-d14b6d84994e@linaro.org>
Date: Thu, 20 Jun 2024 15:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0? 0/2] hw/sd/sdcard: Avoid OOB in sd_read_byte()
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org
References: <20240408141717.66154-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240408141717.66154-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: SoFKhQp41pnO

On 8/4/24 16:17, Philippe Mathieu-Daudé wrote:
> Since this is Fix day, I went over this old bug:
> https://gitlab.com/qemu-project/qemu/-/issues/487
> It happens to be a QEMU implementation detail not
> really related to the spec.
> 
> Philippe Mathieu-Daudé (2):
>    hw/sd/sdcard: Avoid OOB in sd_read_byte() during unexpected CMD switch

First patch queued.

