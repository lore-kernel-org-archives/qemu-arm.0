Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp615912ejb;
        Thu, 14 Sep 2023 08:53:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs5eejxWACIxvLht3bGqd6xzzPVFJrA1pfmPkW2HYPC7SB4CUzVTftWBjHAGKub7h6RXxV
X-Received: by 2002:a05:6808:168d:b0:3ab:5e9e:51f8 with SMTP id bb13-20020a056808168d00b003ab5e9e51f8mr7418888oib.9.1694706815845;
        Thu, 14 Sep 2023 08:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694706815; cv=none;
        d=google.com; s=arc-20160816;
        b=mtC/1Epq1JDLAz7e+R33mCHSqWWoWsvRD16Zl8QPykQgez3NA0hrrTQqQ65TPx8qWc
         vJdbDB2woizJrcT/C4CI3FuwpTKvb3ro9omAqlrdGr6eY+clLgp6YI4CqfMc4RJxwiFY
         5JwKXhjNyz2x00aEsOUeY7cSMRag2Nml6jqvLf0I/EmEx+tR4a5/W7Fv3dqYkEr7iq+9
         GcvJGRn9nid027Qi9N9RozplLMl0hjY7zNfN/WFuODWm5hT9G6xmTjiBYiNfX5oELVc9
         oDwoxfgVsKrLyvx39UvTqhm4IplomQIRAD0Ej4Y1T794CMPTwi0QfV5O02y3R6Au3s5E
         vxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VW0seTdjEBZufmuDlKj3ShatillH4T0HkLHJ0NM4rfk=;
        fh=Ybo/Drbux6EwnGYm8S/V8LW82F+rMTc/OadPc5agQqw=;
        b=L9rgUeKP9j5LrGi5t+TINnKhEDyl6XjKdbsnE6KDbe3N8gRk3WzuaMXTETWnvnrAIz
         egG0nOxjI5ewCxjURns7cWhO84FPlKmiZzercNBAetkDrOyzBFbFoqXFYBQPW+Y5ibyx
         NkVcf1jfHwyKDHB93XVfECQbOL8MebPO6Up8eTdpsJGK40qVqyUzxVStpZN/J8FpF6HR
         NgxwngFHLzNWUyol3uPC/Ar51UTVmq2zLifVUx848phC28FcIK+0lwZMHlaNQ8QQhdRF
         GZtAhruTIl5abBKIQgfFi8Ek4IyQMEEh6fHERggBNrqQctDqTi6NLb0mImqwbKAqGB+o
         t8VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyTH9ecA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020a05622a104700b0040362bf7530si1053323qte.413.2023.09.14.08.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 08:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NyTH9ecA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgoem-00012P-Ug; Thu, 14 Sep 2023 11:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qgoel-00011q-3P
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 11:53:27 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qgoei-0007ny-Vx
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 11:53:26 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so9820195ad.1
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694706802; x=1695311602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VW0seTdjEBZufmuDlKj3ShatillH4T0HkLHJ0NM4rfk=;
 b=NyTH9ecAPVWyeeWHiJRagmD4G+eprJm/KcpAKoMi1nF0lvzCwm7VQqLwg8Ff5smpsk
 wI8/Y0T7yzidlQH0yWhhpDD3TLMQ9Agsi5wUP18Xv7KTV+N9takaQIKp18E1Uej66IzH
 uhYaXVEBA1Hq2AdhXVu4BaA57mg0e+bYjQ/1hdyAQ/rPgp73gR24zpSc/XGDxsUBe2Th
 NZ+tZYEPSybWLd5McsV0xvg36zZ9ZhlfAbtO3PVNeod0CvDeZLj7ppdbwKCHXZkfYWIY
 l3oZ5pTs/b8AMHtkODGVCjDhYqz/v6vyGmC7+8eTkj1R7AGMe+fk3T/3ScR7F4ACvS78
 raMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694706802; x=1695311602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VW0seTdjEBZufmuDlKj3ShatillH4T0HkLHJ0NM4rfk=;
 b=aCgIuP8kG/1EEhluqWDFDl+FYhGritMmpKZ7WHx8XPdoQdDSsDMbCgMSl2CGdldxFi
 oBq8q8TsKNIJAp+pLPUHwD26o09GCc9Qmgx44N72VtrTDnBwV3oq0ermwQu5taCPOUrd
 ILyQBWvW1nRGs8BPZsSye8B3ykMJJV22vbXfiUvycsYmxM2/4cxCieXqjJp29D6PnpmH
 2X62jjyJsvCsah41zYJhRsoK3aN+54n+i3INyEh2q4nNkgcubpF1xIfsCI1pD94Mohpe
 iDDUMp6bU3iNIrgaOXbW7A0+ibQaEMK84aQqRO+kTgvKzPxWSyinK2hT6ydT7CRnfFR0
 OuWw==
X-Gm-Message-State: AOJu0YzS68ZNQg0VyZaaQQ6dpV3miaojNFAL1yJPXYej97SC0dh5VGfh
 sUJy0iwqOExelWNMCoVLFsqJWQ==
X-Received: by 2002:a17:902:b697:b0:1c3:d864:d6a8 with SMTP id
 c23-20020a170902b69700b001c3d864d6a8mr5669061pls.23.1694706802366; 
 Thu, 14 Sep 2023 08:53:22 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170902968700b001adf6b21c77sm1761478plp.107.2023.09.14.08.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 08:53:21 -0700 (PDT)
Message-ID: <ef057c7f-6340-3f79-88e0-605171e2ac97@linaro.org>
Date: Thu, 14 Sep 2023 08:53:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 0/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Mostafa Saleh <smostafa@google.com>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230914145705.1648377-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: His2vw2PVQ2Y

On 9/14/23 07:57, Peter Maydell wrote:
> Peter Maydell (3):
>    hw/arm/smmuv3: Update ID register bit field definitions
>    hw/arm/smmuv3: Sort ID register setting into field order
>    hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
