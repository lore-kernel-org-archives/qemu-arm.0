Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1084627ejy;
        Thu, 2 May 2024 04:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXD/VGCEbGCxsaze56PsoqgXq8iqwXbc8sHHACD23nyM5+VnD2KFc6npf2Dp2ElwMXAoUUGNINDeInmYzNbdCgTiZXNEnig
X-Google-Smtp-Source: AGHT+IENVktYh+odGRK3LWeCkPFn3Sjk77egEWvVOojJ6LhRe93sVnbRAyG257Lzw4QyLDwiREEC
X-Received: by 2002:a05:620a:10b2:b0:790:abdf:ce13 with SMTP id h18-20020a05620a10b200b00790abdfce13mr5690238qkk.15.1714647959525;
        Thu, 02 May 2024 04:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714647959; cv=none;
        d=google.com; s=arc-20160816;
        b=SuySGM1ejGeNUFCzSiAx3tiTgx9x2Hv/egN3crV5KUcVDzo589shDE8lHzsRfQyfVJ
         L+813PIgKSASF/1ZSrqHCcEob0ghFPhs9JfTcp3Uf9SxeI7GfbziobegEJZRMpGdvpjj
         llC2c86qY1eKXXY+flOAVoru2yq2dSj/nIE4OTkeAcB2domyxAXpCsLcBfbNiRLUCrqe
         GPrkyghOdsx4e7e+82Er8jcRLvBi8slg3/C1WJM/QruC94WYz4WQH6f67EG0Zr83icOC
         N6iddbMQDseuqUMtZM9fVqa3jwNSyG4G3VuXF7CuUvbkzBE5h7hQ/wwVaCKCQbMC38E/
         quDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ia1wg53KtmoYcLskoGz4iuKc9iw5ahYOShe1HXlEl1c=;
        fh=0hEpqSStfxzzZhrTJlP6OL2D8IjiTo/M9ijlNfUubLg=;
        b=wjcHDxlweXasjXwI1SPN3nk7l/tSmRprcwOqM3d0rSpKjm0aMe/wyvlTv1O6RxgqmN
         CfJhayV/l3eSa2x3Uygxx9p+eCqd7OblBgfEoNSnzC+C1hFANRcyYntp6NqVyflsuoEb
         78svf2858wHsTieeU1gXEPfM6VGDUGwH1p72wiDUdshhsZRVaQG8PAuiS3PeVZvC+tLH
         6St6aJ+asF0yro+b17HFpseBYkDh5A6gLO7tRO1Etn0vyaU7sraQ9TY0yYrUzzIfXAab
         noZtAF+J+LfPA8apqGx2tVz+/JduoD0ADoZeJobe27ZR2m9m7KwS2NMhT+gXy3eQmzBw
         FC4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOzWWQaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wj3-20020a05620a574300b0078edb45f5acsi669153qkn.391.2024.05.02.04.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 04:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOzWWQaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2UFk-00068Z-V6; Thu, 02 May 2024 07:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2UFk-00068O-65
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2UFh-0004SZ-TK
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714647925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ia1wg53KtmoYcLskoGz4iuKc9iw5ahYOShe1HXlEl1c=;
 b=GOzWWQaBdNUmjsOS1aaWJWYK6udaQca/28PUvibPOJC68kAaMf6CujxpIfymQsvZcrgPXJ
 600Rb0sxMEB+9M48zaiCB1EPpdTy4WmTef7jZ6VH3SMdfivxP7ryRa+i8GSi24x4YA6jAz
 O8j8EXjYR4JihS36yIvuSZnlLnZK3WM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-HPQZ-vrgORe0fbCzoPTixg-1; Thu, 02 May 2024 07:05:23 -0400
X-MC-Unique: HPQZ-vrgORe0fbCzoPTixg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41bf6751b28so23170505e9.2
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 04:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714647922; x=1715252722;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ia1wg53KtmoYcLskoGz4iuKc9iw5ahYOShe1HXlEl1c=;
 b=rmgzy2FBThlWS5wlwIueBnZdpn7dv00fXmKUEuY+Lrk7jm7LJ/T4ABz3SpioEzDnCC
 KblazgU/ElPpp/IjxLcZtcEa/BmBUN6CE9jJ2UKDN31CF5hhYpqp3H3NmMRKu+XvCi8I
 nvGfi9F/AKdyu6Um9UErL4kkbmXgbboMhvh7QtqFoOByaSjSy+NaclwEMKt5JJY/afzn
 SzSJDFlgaMRpFUOh2wmhke7DOjkGimCzR8wz6MGlnkirohAQoshdfTFiPUJMbQSwDOBD
 tfnYLAd9M+0Im6YgJEYEG+AuRwukxMPnBQ6ntyD1of21EAMlzzXJRI3eMKEym8xIqFOI
 KYRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPmS3NomTA1px8q/UfNXq2tmOTOsmmt/rWAmyIOVtNtMSqj6z+HygfF/EBTooaGCWfMTvbhKGI+vA06/Msx485Nwqr
X-Gm-Message-State: AOJu0Ywfh381GfINh1p9mPIxCwHKrWVv/DszxvDAf0Sacf95UifGjqQD
 x6GhU4t0Ub9i67LebSMfNc+v/oLqHbGXQVYqsuZAMEJ4SXRTrQqE+RIOPNpwG4+bkgApoKgnW9t
 +f68YjMUcjJGF6exeZWi/G8nvNB8prxgIjjb/GlwhpqnddN40Fw==
X-Received: by 2002:a05:600c:242:b0:41b:85bf:f3a8 with SMTP id
 2-20020a05600c024200b0041b85bff3a8mr3885556wmj.35.1714647922440; 
 Thu, 02 May 2024 04:05:22 -0700 (PDT)
X-Received: by 2002:a05:600c:242:b0:41b:85bf:f3a8 with SMTP id
 2-20020a05600c024200b0041b85bff3a8mr3885521wmj.35.1714647922042; 
 Thu, 02 May 2024 04:05:22 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b0041c097e20f9sm5309476wmp.25.2024.05.02.04.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 04:05:21 -0700 (PDT)
Message-ID: <48986ad1-ae23-4ff1-9494-cae9b485deae@redhat.com>
Date: Thu, 2 May 2024 13:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] hw: temporarily disable deletion of versioned
 machine types
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-10-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-10-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1R0XUTOaL4Rt

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> The new deprecation and deletion policy for versioned machine types is
> being introduced in QEMU 9.1.0.
> 
> Under the new policy a number of old machine types (any prior to 2.12)
> would be liable for immediate deletion which would be a violation of our
> historical deprecation and removal policy
> 
> Thus automatic deletions (by skipping QOM registration) are temporarily
> gated on existance of the env variable "QEMU_DELETE_MACHINES" / QEMU
> version number >= 10.1.0. This allows opt-in testing of the automatic
> deletion logic, while activating it fully in QEMU >= 10.1.0.

If we include your patches now, the old machine types will be marked as 
deprecated in QEMU 9.1 and 9.2, so it should be OK to remove them in 10.0 
already, shouldn't it?

  Thomas

