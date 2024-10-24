Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp533842njx;
        Thu, 24 Oct 2024 11:00:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkfIZGpnrRpNf69bdrBid5EsQs29nQd3JW1jeZ4hO6tlvVQC1PIvCMrmdJggp8Yoxgo9sfYshq46Xz9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGoC4eUXprlzXvy3bwj+gp3hCvR70Hr/Kbcx6WjXn+DkejOTzHSK/hfsir5jLRwyV0IkaZa
X-Received: by 2002:a05:622a:1e15:b0:460:8941:b5cd with SMTP id d75a77b69052e-4611473f928mr91904651cf.57.1729792807525;
        Thu, 24 Oct 2024 11:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729792807; cv=none;
        d=google.com; s=arc-20240605;
        b=AU3Xkqk79w9JQXuhbYOsuDRVC6kBVuDCKnHL6sqS/pz8s1BRWjRtI93yt/7n0i9f7r
         RFBjpf9cXPvWGuIPWKSnWHClaVy+aEGW7tvVJZqrprlrH+nM3++2t+5C3LSh8bSD8jNi
         qv38ZVFSW0fzM2SPkNIK3izJNQDtM8n/oyjb7C20qJc28nVQ4qSC6kIHvZJgHfuh4HzA
         h/Cp0taJevCvzAzyUV+Nd+44CNS8HgVzcCCIZsA1EdeTeTJW4qjHpOHkkv7wg11VlSKf
         isog+XoQ/YIr0r2juO80HhR3P4MXT5YzkTBaIYT4pkoKcdHTUaqQhl6MOC2Plw8DoEmZ
         Z2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tIqDcNbYTVZWbfAuK5MioxEwio+QdY/1Sd/0q+D3CrI=;
        fh=LEtwlkwqJQx8e5dXSslZzZQRBLv+0MKUzvjKkh6W6Nk=;
        b=S6v9kV+c+9hctBRt+ZvhzqYq23HLCQWef79TSI1KRmfUvJyWkRRuaCX0d7VSxTxOFB
         UwfNYwLbWDgvmv65LsFw/SBbvPg1iYvxXNJtbWaQWJD+O/k1zVkvWejKPrxJN2BVUvVv
         zgWQeM3d4cbslHibAVPkSFCDGmzSjurfcgjGbFKUYYEcUPHdnk3Fhr1eb+mT0Voqa28L
         PgcHkjQcLbVZXhygMQX2qm2xXf3eZhh79w4p6g2VaHiyLXDMUWevvX5IrgMylRf8CgcL
         ZABfXv81+KdS9wYzqeSuslnQJEmnebw0g4bYoCkzHNaSeUZmzE+PlgdjE587vEXWjsDN
         KP0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkyShw3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3b878a7si116225141cf.214.2024.10.24.11.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2024 11:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkyShw3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t427p-0006ld-TX; Thu, 24 Oct 2024 13:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t427n-0006ky-OO
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 13:59:55 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t427m-0003Kx-3T
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 13:59:55 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7ea8de14848so674652a12.2
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2024 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729792792; x=1730397592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tIqDcNbYTVZWbfAuK5MioxEwio+QdY/1Sd/0q+D3CrI=;
 b=wkyShw3pN76cfjQddU7Q1p9Lg+ciBs3N1JARU6KJAWDdr3k4Cd40PDdWIENYFB9tXE
 VBF2W2uxkRxejKXecL3H0zk87KnhGcJM+K95wz0Llf3OCrUjc3zZNQtY1VXAWz/c0NS1
 Dx9Hp5Xr9G5JkBzg9xvz5KW2FzgQ2pSs68JQXej7I0mOKTLAXsHmAhXKYS1bN8C3tqZu
 5pBcxMGseaZvvad0RtfKVKcXrSTsE4shJKIolCqeMfIuvyeBQgABK1NWKA7xX7ZWr2FR
 w7kICtd2pPrMG8vxuue2i3zOXf2KP8nKJ7SauSyiT7sE7o6zOFqB42VclV/G3SaFzJWp
 jk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729792792; x=1730397592;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tIqDcNbYTVZWbfAuK5MioxEwio+QdY/1Sd/0q+D3CrI=;
 b=R64EZHmAUskVIjMgoPM/K/KRA6hsKstUTFlV/KfnnCnbK7uzKYEkrYfCNIuPLAu/7a
 VUXmt4rJpc29JV04OusE+/J5OO3oo5uVKgVjdbZFZLBQQt149LzuD8Xdac2VWi3JU8Dl
 Xyg0QOCRwiTZnU6xPQvj2qKvqPDkrhIefKTFBMFzNkGhhksUMaji/VPgsB9F/6GNxwBK
 ZQMgysxLLzfJx64yMy0vR8vlYrZ43APXQhtGxC8LdBfT+RFC7wp4VxA0dBw4F74aVyrr
 xc15kzrrTHod2VL9Qq5nsXlCWnGIgDaR0QHU2udNkV9xHSIm2EwgF/i+921jYWJyIkQh
 2xOw==
X-Gm-Message-State: AOJu0Yz2jUXCq6IZVFxpAptJcYEscCMDLPKYXvwKz6wgnPiraVrG8tCt
 lE7Ua8yBrxt6peTQbkZtJnv/iMDC6cN2R6yrCBGFIQAa/wYNnyVpAIM3JdHJCU4=
X-Received: by 2002:a05:6a20:d795:b0:1d9:69cd:ae22 with SMTP id
 adf61e73a8af0-1d978b3de45mr8419283637.30.1729792792292; 
 Thu, 24 Oct 2024 10:59:52 -0700 (PDT)
Received: from [192.168.100.49] ([45.176.88.171])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec1312d6bsm8226672b3a.29.2024.10.24.10.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 10:59:51 -0700 (PDT)
Message-ID: <5262a33d-d0c5-452b-9869-f8f482b1c857@linaro.org>
Date: Thu, 24 Oct 2024 14:59:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
To: Guenter Roeck <linux@roeck-us.net>, Jan Luebbe <jlu@pengutronix.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
 <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
 <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
 <a65a224e-4f54-436d-b555-734a8926d941@roeck-us.net>
 <aa7755a2-e6fa-4d23-bcac-a630e6da98db@linaro.org>
 <d9f18091-aee1-4b32-ba72-e1028fe433c9@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d9f18091-aee1-4b32-ba72-e1028fe433c9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: WMVwhhUJlWud

Cc'ing Jan.

On 22/10/24 12:04, Guenter Roeck wrote:
> On 10/21/24 21:09, Philippe Mathieu-Daudé wrote:
>> Hi Guenter,
>>
>> On 21/10/24 11:02, Guenter Roeck wrote:
>>
>>> Unrelated to this, but I found that the sd emulation in 9.1 is also 
>>> broken
>>> for loongarch and sifive_u, and partially for ast2600-evb (it has two
>>> controllers, with one of them no longer working). That is too much 
>>> for me
>>> to track down quickly, so this is just a heads-up.
>>
>> Please Cc me with reproducer or assign Gitlab issues to me,
>> I'll have a look.
>>
> 
> If it wasn't funny, it would be sad.
> 
> hw/sd/sd.c:sd_reset() calls sd_bootpart_offset() t determine the boot 
> partition
> offset. That function needs to have sd->ext_csd[EXT_CSD_PART_CONFIG] 
> configured.
> However, the value is only set later in sd_reset() with the call to 
> sc->set_csd().
> One of the parameters of that function is the previously calculated size.
> 
> So in other words there is a circular dependency. The call to 
> sd_bootpart_offset()
> returns 0 because sd->ext_csd[EXT_CSD_PART_CONFIG] isn't set, then
> the call to sc->set_csd() sets it ... too late. Subsequent calls to
> sd_bootpart_offset() will then return the expected offset.
> 
> I have no idea how this is supposed to work, and I don't think it works
> as implemented. I'll revert commit e32ac563b83 in my local copy of qemu.

Jan, can you have a look at this bug report please? Otherwise I'll
have a look during soft freeze.

Regards,

Phil.

