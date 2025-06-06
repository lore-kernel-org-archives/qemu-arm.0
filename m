Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp731393njc;
        Thu, 5 Jun 2025 23:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTk4aeFM0DhWvq923tYdmaI+JzLb1TWQtOGA0mPzQthBb14SvTq34fj2+7B1tPVtWVE7xmm5Zkmx8qmA==@linaro.org
X-Google-Smtp-Source: AGHT+IEnOJq3S8qoL6YfiMHLvlhZYC3nh+07p5yp8qvMiJIFV5lPrf5ulyY1qsR+MbQlqCdUBnFP
X-Received: by 2002:a05:622a:4006:b0:4a4:2d64:a7e4 with SMTP id d75a77b69052e-4a5b9d9386cmr38885781cf.35.1749191836825;
        Thu, 05 Jun 2025 23:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749191836; cv=none;
        d=google.com; s=arc-20240605;
        b=aFNWXjJd6O/loAlnuYZF9xKcFbuAKU0zYbPhX2HFQ+91X/+vUT1cqLNGHrZLETmNyj
         I/myWBAe43BigtItodiRaKL9sQRjVytzlHMc3UogT5vYfFRuApkZiYFFCrQSITyMeK+S
         8e7G9T8dPi8s4QV2i79M0FK7ni/pqPIrbgWs/vHlASpRtft7AI7jlJ91P9BSUVDePnFY
         yligjxljb/SBHV8ISmfS0ThhhbyQ4mgMo9sBisstJKG1g7pyRjtKjF8IPAgi2DMRv0uU
         aX4yoSRSyFU1BdSGxP8cOUL8U+hae95K7aY4QiWJsqhFD0eGu0Ty8MUITdldltBVBb5G
         bDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EclWRtcrb0Q+hON4p4OsPSgCqUPpnAb49ByzGYVoxKM=;
        fh=6qiprCOVLyD4dYBc0u+4b+tihsd2EvPlrWCuUu3Fqpw=;
        b=ajis96V1JnfOkcWHS0VaYyaYwSVvI5/uCdFhjDDdNe6kOhg34IRoY/djD0jXv4LqCt
         jaFztohlRLCTGwEGHuzVn/4psto0/wpfw8h3ae+ulkuRVITgfMstDlKUwgWp7GCDCVuL
         UEC1xyWWGzEyq7APuI1Otf11Uv0PbY+/UFk8vmxtxLJMH/0lJQlZGSt6F/fW8o03Qh7U
         23JbZm1Cx8E/olTySGtYwMWI/OiV0QQqVU/d5Q2rHycSQXLl6uUWmlExL5aKLCoJEcyG
         1vdeHovs9eVrz+UNtzYf61YbOTNmHjk/UKnWtCjqIgcGd9nr8J41O+0YMD3olMuR5BdJ
         c0pA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fI+Ukaj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6111686f9si11396961cf.119.2025.06.05.23.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 23:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fI+Ukaj+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNQhF-0006mA-QC; Fri, 06 Jun 2025 02:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNQh0-0006im-9s
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 02:36:42 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNQgy-0008L7-7U
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 02:36:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so11747745e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749191798; x=1749796598; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EclWRtcrb0Q+hON4p4OsPSgCqUPpnAb49ByzGYVoxKM=;
 b=fI+Ukaj+cDEFr7WgNtR35DjDcUv1v+vGXleyezekobRnYzGPPDFkl9R+OsUACg4LZv
 wMAtbs3DE84MrSMIWkqdbThw8Qdpr/O76V6pCrjD8XdeVPRXJ1HzewXSPeNLH7xuTU3B
 xAoeebhTA9MGuCTI9RC6cFDK6t4mOqksQPOf4R0hsZz/7R9GH74FxhmVoxpG5OapbQtM
 tiL1+h4jwYgt0QD4/T38RSijbVpR+MGqCdd6EhggtDTTO6F5htvxCCkvNCXc9tvbagps
 eKC0A6zkDuW3ZFjXjl9P39XvRjSroZIbnzZhsi1ElComufrUyVB8EvBf8j07bd0pACE/
 6Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749191798; x=1749796598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EclWRtcrb0Q+hON4p4OsPSgCqUPpnAb49ByzGYVoxKM=;
 b=bvPPJnPyU4KhTI5BJeUF10E7enNwh3k7OVtAovNBfkxXCSmVBpjQZ8bBNVLWrW38KW
 xkJZf5G0aq+n5UistEX1gKTlCDpePuWldh8kS9FqjgOuoo4jHbpAYqWser3pjRbU1nQq
 FXbQlGOAQwB1GL57CdIa+YmGiXmTvV+kIHiv+IgWUNS/iFW75FqpgH/+VAcNB1+GoM7s
 2SE9IFMo4BvLmqlMhEhl/ZEIrO6A9f/tXOYAI4kUD/I0B2vKmhi6s+v2hJGq2ll1i5Ak
 kr810EFvQnM0r51cBlWtI283xInAHmDaP4/Lw4ZZTpRJCIS4GFnfbStKo4ZvQSE5+mIt
 1YtQ==
X-Gm-Message-State: AOJu0YwfQDm363Hdnn7mP75YKUZi5zTh/f1EDmaZl8Z5r9ZCMepqIuIj
 Nq0sdw2OAoyNDMAMbmmEH1b5zmqT4q2qM11ktGzxQg0RktcbAzwVAeTvKz17XH6pNg8=
X-Gm-Gg: ASbGncvCVRIiS6yCJ6IcQbVH+2eOk9ZqiOVJskdud00o0vXQXnGxCNN9IzT2PjoSQ65
 haSgF0kZ1uf9/JFN23z9nogyYS69Kd9PdvGgB1r5WYt2LbjeI/ldsUnSJ3hBrgeWDy6UeaC1csj
 iQ+q+4RBZBJCeYeHEXqKbjNBiBndOqSb1yUvTD8v3DMM8h+cyVsAXvVhA1OoeB86UCVVC5gMV7c
 yuieSNGHFSnYQrITxkM5gnAUCQFFN5FUjwVej205Yk8+E6F2oKPEsiCRVFCo0aeCygPM0cAgokV
 zHyQQqNnwW4gL3/dTaBG2IuhnG10sHeNrvDSkTujZ40dv+rhBFoIjS23KzoYbZjHw025WzN+CmU
 xO6BO7kE72BuPOzDpAZTii/n3QX91DA==
X-Received: by 2002:a05:600c:3e85:b0:43c:e467:d6ce with SMTP id
 5b1f17b1804b1-45201337374mr26827435e9.4.1749191797787; 
 Thu, 05 Jun 2025 23:36:37 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45209ce17f9sm14152595e9.11.2025.06.05.23.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:36:37 -0700 (PDT)
Message-ID: <7439ff0a-7e38-4b26-ba15-3770148f0694@linaro.org>
Date: Fri, 6 Jun 2025 08:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ramfb: Add property to control if load the romfile
To: Shaoqin Huang <shahuang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250605030351.2056571-1-shahuang@redhat.com>
 <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
 <kep5frpl24d74evoyf367pqkyoj6xez2pirk7xlzcoompyzq4c@ouxab77sdm55>
 <68f4f244-db07-4f65-9ca5-3cb9b70c9e61@linaro.org>
 <27ea9c1e-61eb-4ea4-b3e4-e9d06b4b4ce5@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <27ea9c1e-61eb-4ea4-b3e4-e9d06b4b4ce5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: NCKZI0hb+gd2

On 6/6/25 05:20, Shaoqin Huang wrote:
> Hi, guys
> 
> Thanks for all of your suggestions.
> 
> On 6/5/25 11:11 PM, Philippe Mathieu-Daudé wrote:
>> On 5/6/25 14:21, Gerd Hoffmann wrote:
>>>    Hi,
>>>
>>>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but 
>>>>> only
>>>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>>>>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>>
>>>> Simpler to directly pass the ROM path instead of using a boolean,
>>>> so board (or CLI) could pass path to non-x86 rom.
>>>
>>> The rom is loaded into a fw_cfg file which only seabios will look at.
>>> So this rom logic is x86-specific.
>>>
>>> edk2 ships an EFI driver for ramfb, that is how ramfb is used on !x86
>>> platforms today, and I don't expect that to change.
>>>
>>> IMHO a bool is perfectly fine here, I don't think we will ever need the
>>> flexibility to specify some other rom here.
>>
>> Understood, better then! Maybe name the boolean "use_legacy_x86_rom" and
>> add a comment explaining EFI driver is expected on !x86?
> 
> I think the "use_legacy_x86_rom" is good, I will change the name to it. 
> And I will add a comment to explain it.

Maybe even better could be to only register (expose) this property for
x86 machines. We'll discuss that on your v2, no need to hold.
