Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp458695njb;
        Thu, 5 Sep 2024 04:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIAhFV3wEZbDU6RWTftY5JMKbpfrVBzOqkBlEgEuz3zGDcN1wOZp3hY0C5Dbk3rsLkkM5EfTXkPJFNKA==@linaro.org
X-Google-Smtp-Source: AGHT+IEMB6C17VehFZVBjGUlZoVyReSN07PoIWeqD4quEaQNDLCtLaDU+NkI9+JP2iT3sol9wNGq
X-Received: by 2002:a05:6214:3a89:b0:6c3:626f:2366 with SMTP id 6a1803df08f44-6c3626f243amr195168946d6.34.1725537171929;
        Thu, 05 Sep 2024 04:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725537171; cv=none;
        d=google.com; s=arc-20240605;
        b=O+OBGiZEY9g25NEpyY5EBWo3PTY3PFc+LbBd6jsZTFqawr61Z1uNnsyksAhDGANreQ
         A2l4UmpCfi4fecPE9RiYNHDpBWs+7rXpA3EMvlwhF9NPrEXj9370fnvMQxaxwtBRLxt5
         1KA/OF7sKnEJtfAzgCU9BOkhgbncv5fSkdX0XzPVTfnCwJW/OWM8wX4RVFCgl/mMHuhX
         rs7INh3GIPtSIiEbtlW5g4V59AxZMDD7SoWL1Hs14OAQHT0dxw9KDllPYBj2sU1ZGuEs
         ACSXJUcou8kfSojzpYlWlA0fGMgYFVzQFu8OmI2ubfFL5b8x0FZDT6KsFvw4+YEpur/C
         tPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=7T//60NGXw2YF4AoxiwDSZ7IGD32GmFjqE/qhKsrZB0=;
        fh=QPbfucrOXf01Vwz28UbuqXLnYYadI2IX/BgXcx0EUak=;
        b=GGYTRc6DQ8MIPRa8QRuGkhNjypOPs2AZPauDSvgX8TxGhfuNlHDZFm9rem1RY6vkzk
         qeCDTfM830fSTH8pKvfRNsfSfyZvXYfbnX03/lZmEuVXY9XNQXXt8eJuom3HLhdWDTH6
         ujFAdVmH3ke88zBo7piVJ0oZ1cbxWsX6VJf3h7SkXfCuWxtZWUlBUViZzVt4jKd3l3rQ
         8o/SNp+AQCskktmJKE7KU7EFABoJOvO+GPxjsnT49uVjlKCbTcL/ChrRiz/8nBmQySy4
         x01Di94O/OZvSdyudEY09dnoJZuNpE4FvYN6OGRcYFOFAFuspjjwtjxKBGPU6CHcRlC9
         Spmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u7DtZJCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c52051bbfdsi18067186d6.470.2024.09.05.04.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 04:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u7DtZJCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smB2d-0007DP-HW; Thu, 05 Sep 2024 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smB2U-0006uA-Ju
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:52:43 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smB2S-00021z-2b
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:52:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso6858695e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725537153; x=1726141953; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7T//60NGXw2YF4AoxiwDSZ7IGD32GmFjqE/qhKsrZB0=;
 b=u7DtZJCJcU0KgfQBsFcE/gq/6r0rw+HVK7WUY3iOgAzQF/DZQ+Cqi7CJ/1ZLlS2ekr
 4kpiC6wQCSJ5wgVkcl58QpahfYI4pWBXi4ut/o62c1+ESz56QG/JT4D4ziowVZXHWtls
 rLY/FbB8uKCfMs4acz4lbZW/zgFisz3bil78r9NpyNwEripUJaMsPlx/m3aa4ahFUR65
 sFUapOq5FlzP/2w+I4IMu+x0P7mGrTyeywz4yqu0MNFAivIWhOEWuCS2dlNh3sorsSfW
 1R2iLmEmBzArU6kgCTKb0BrjKXO5pWgI3LEf/stwsnUQkUOn69xu57tPKwkn2U7vZLIL
 sI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725537153; x=1726141953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7T//60NGXw2YF4AoxiwDSZ7IGD32GmFjqE/qhKsrZB0=;
 b=OOI113l2Zq4b9l/FFXRdKDAQA8JGxRJKp/NYIjCDv67hKPwYvW+AvOTVbbtwNo8xwU
 HFxHcsu2LleR6gFzm1wDinCXvVKEUeoKm17Y7W/lwahgJLoBObJqo1SZLBo40vZoBFqS
 2r+NrPrOvet8CB1BeeZPCzXppQNrDBfDsexYhpSifVqGWdjOygy+o6dZ9vtbTwP16wtP
 HTwO+1rABWTzXG1VeTSFQwCI7SY/0aEUokjUz332zdEcHtqO2uBGTQ5gRos8hq92OA+p
 LMzHxMadnHonBNG2ZHrAK6a0a6xcu4S/pbvhuwvCgl79i+GcOnvrgNmsPXvjXqlsU/W4
 TKuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBehJrGlG7Of87hhfrNlvAYHUXYc4wo1jQzv9UCitv8mXeI1GbS92iViOhGB1iS4i1AJkbZCzbHw==@nongnu.org
X-Gm-Message-State: AOJu0Yx7xTeJ+a4zBQQ4qtI5TlaQNi3ShcdI479oZfEIjijsdntstNpl
 TrGPU6RvmnADmEMLfwyxwBlyZpmqOsaQXGsMHFWFoHCoCefFbJOuzZtZcmE0iKI=
X-Received: by 2002:a05:600c:4fc2:b0:426:545b:ec00 with SMTP id
 5b1f17b1804b1-42c9a36dad7mr18013395e9.19.1725537153399; 
 Thu, 05 Sep 2024 04:52:33 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374d1dd1e76sm8234487f8f.113.2024.09.05.04.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:52:32 -0700 (PDT)
Message-ID: <11fc4dfa-5f2f-4d9b-8085-9bf8129538ae@linaro.org>
Date: Thu, 5 Sep 2024 13:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 11/53] hw/misc: Remove MAINSTONE_FPGA device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-12-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: 0wCLmltuJL17

On 3/9/24 18:07, Peter Maydell wrote:
> The MAINSTONE_FPGA device was used only by the 'mainstone' machine
> type, so we can remove it now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS         |   1 -
>   hw/misc/mst_fpga.c  | 269 --------------------------------------------
>   hw/misc/meson.build |   1 -
>   3 files changed, 271 deletions(-)
>   delete mode 100644 hw/misc/mst_fpga.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

