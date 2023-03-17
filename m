Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp99862ejb;
        Fri, 17 Mar 2023 14:51:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set8MXpIW7SuFI3tnZ1a6CzAXLUSE/L86Jx5ZcDleK/92bWphfFJ4xYoBwDd5ndzB1M3YNi0k
X-Received: by 2002:a05:6214:cae:b0:5a3:2e65:69ef with SMTP id s14-20020a0562140cae00b005a32e6569efmr42147309qvs.49.1679089870062;
        Fri, 17 Mar 2023 14:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679089870; cv=none;
        d=google.com; s=arc-20160816;
        b=LEdvdPDkl1DkAfCyL9P6bhqa1PIwE06RjYiBkkhaCgyYTBEqGwFtpVW1+oX3JPbVUw
         CGH/gvgojuwRJDQG9k2xF6ewFCPkkUwSONlf3EQX0intTwyr9NEAiSHlfzFp8EUTZBTo
         5wo/UJHavfd8+pTI3D/N9yBDWqMdR3SUaO/WF0XQ1kCby91Wc9LesuKSYwxoYCa1FQct
         QYx4599RKGCupHokSa7fRtSVxvrFUwbCXmsYszPeQdepp4SNygrcLAmQnQsb+g1nR7Eg
         l1p0AKAzNHVVRMRqD6rvXQdQnvn4xdUlPSsYQqmt+3oResLX1/vqAuqPoOaPZS92C9zO
         pd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QKOzz9+XOqO2JsrB5MqPMuKAaIId5RWJhgKBQZsKY9E=;
        b=mhbZXBi//mlhbPCdu3N2dyXmpXridP0BMRSv++QqPtU5gUTGEFXSifM/7ys6MOUT/F
         vgFpzuPOdhKHi3PUeZvxo5tR4ZbbWKqnkXhXClF6igwIf06SNO3yzMu+9rFdp4lhEjMC
         lizyY5yBcaNZzZg3vj9dJWbkOOfTNoaZS3EhMzjTFmnexE0F4XjSAtoxCQ5T88B/B9QX
         jUWeBYjxNha5AEBOLQQreH/i3M34bfXt0Up9TKhWCRvGBnkqd4cbtGhvnPhwh/QObDZi
         jMhwJ0GIwl78igm3wsoDyRIKFu/Mwgn0uZ6ieY4i+a1X6HH821Cn3S/uxKHE6nSTMq91
         7l+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GCtl5WWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a3704c6000000b007456a9e37cdsi2392865qke.747.2023.03.17.14.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 14:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GCtl5WWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pdHyD-0007zg-ME; Fri, 17 Mar 2023 17:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pdHyB-0007xz-MU
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 17:50:39 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pdHy9-0004Ph-J8
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 17:50:39 -0400
Received: by mail-ed1-x52f.google.com with SMTP id eg48so25449631edb.13
 for <qemu-arm@nongnu.org>; Fri, 17 Mar 2023 14:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679089835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QKOzz9+XOqO2JsrB5MqPMuKAaIId5RWJhgKBQZsKY9E=;
 b=GCtl5WWiLP76CcCxz9X9+ZMXwJDay/pagkAjIyW+iCusLxOZhhEvYN3Ri8ey3wmfKp
 5xb69fcRcq991z4Dd//fjFimSexG9ZWF7jXCQe2rfm2VwMI9DrM0Bdj6UFh3korrz8cw
 i8e+llkr6glI6EL1nK/GncjzO5zd9thWWxKV8hH7JfBakN4L2aoqirwmf7+nksQEEazz
 Yh6ZVufbuk7Gh6OIf5mt+VfYqIgooxvfw1O83NHHWWlp8qxiCqZw6Qfxc4iCqzMj6BVY
 onFr3Ou6/6iz7vBqHPb5bwUo7TzZMA5r54VnRxtCu0uoioAHLfkoXrEp4QSc3XhIZvwR
 L8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679089835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QKOzz9+XOqO2JsrB5MqPMuKAaIId5RWJhgKBQZsKY9E=;
 b=X9fU3g2smXQY/aki5PSfPTdf27VyYeiSfYxhlPbLZUyxiaOK7Tb5JdROoT5GSKgVfK
 r07cWJH5Ipt88ouaW1Z9hW15Cb9WgFi5DA8j1QbUcq6dvaIUw5OG34wFsFKiE8TmjZvh
 XmdYez/K2w1ZWELA/aKXApDREWEdS8kgoFMdLNKWh9XPoO0X7BcKj2H0In0UpEDdkeiz
 5VMS7iHwiVf5Hczz8b1m4XywSn74EEoueUagQx2F81h7ilnfGo0OMAuqCymeJI7JAVxB
 slAVkcp/+Bw5BBhW1/3rdsaPz0V+yt5cJuJml1DxZqCWMYlZHHwLmj07ki7IUQADv+IN
 4+hw==
X-Gm-Message-State: AO0yUKXQc015u3Mm27q5xwttB2LlqO6tPTsDrE7owAys+HrHcqrxi44M
 enYLFISjLNlyvSJnxBqAvVpAjw==
X-Received: by 2002:a17:906:7c4f:b0:90b:53f6:fd8b with SMTP id
 g15-20020a1709067c4f00b0090b53f6fd8bmr874954ejp.31.1679089835590; 
 Fri, 17 Mar 2023 14:50:35 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.193.198])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090626c400b00924916f9c21sm1393030ejc.87.2023.03.17.14.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 14:50:34 -0700 (PDT)
Message-ID: <bb8827a3-78af-3c0f-1ae2-7278204c2b7e@linaro.org>
Date: Fri, 17 Mar 2023 22:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
References: <20230316234926.208874-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316234926.208874-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: bLuyTD8Oam/+

On 17/3/23 00:49, Guenter Roeck wrote:
> The i.MX USB Phy driver does not check register ranges, resulting in out of
> bounds accesses if an attempt is made to access non-existing PHY registers.
> Add range check and conditionally report bad accesses to fix the problem.
> 
> While at it, also conditionally log attempted writes to non-existing or
> read-only registers.
> 
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
> Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/usb/imx-usb-phy.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

