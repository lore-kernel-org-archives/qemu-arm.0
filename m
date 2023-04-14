Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp355314ejm;
        Fri, 14 Apr 2023 13:24:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTzFgELjTYQ/nF/FgGiCcUC7WQ6cysr7RdhOJv0NejFaNAaR5gyZ5mOo9l4S/36VIHJyia
X-Received: by 2002:a05:6214:2022:b0:5ea:a3f0:9fca with SMTP id 2-20020a056214202200b005eaa3f09fcamr6619389qvf.26.1681503850119;
        Fri, 14 Apr 2023 13:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681503850; cv=none;
        d=google.com; s=arc-20160816;
        b=gvKh3TR6jjJCIx4uC54V44f8WJFqfGk+n4bxAbg3XI9KIo028Ty+icWsfBmvgsqVoo
         hAf7btlP56thsdn6lqDpnBnd5bJv1HBEtNbJU5qlD43Z/nWOXz2QmRdLAuPkOeUtFqLo
         UbC46jYZ0qxVzZf1kCyokPMsTfDRWcnykPxLuKzX5Efqxj4unUXEBJ6v7KJlWoHAETuK
         3HVGDyOG8/cm4FsLScR8zyCKGoWhF7lMged2yCh6HF/JQ6Ruxng2pj/gspHUOUz+eCm7
         oceL6MKlbwz5oXJFcphgtLLH7LzwvHGqbsQxrjiTPW3FxxYtsT8qdRi8tHCkvHGCZdUJ
         M/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p1gBang1D1DIOMN5v6J1El7h9fepywzzKIQHDxw+uWQ=;
        b=rXweKKvhJHU5DM+/Rni5KtDzOXKxZZ3qeQIZumN01jjd6/M+9fj8oImZ0obMCHvHFv
         s4UkcERLg3PhPlKeIf3pndYXQDY+PeVtK5t0EzESoqlQI1j6bWqqIEWuIdGuUDYEBa+L
         dPKgZ6a3kRHn+3SL6WP3VHxLZ3o7JAUqCgl8UMzoAeOb31Nfy/6eKR36s9Qk+o6VKpqQ
         DNInvgKDOs4kdsqZjLqYb0ail99LyoJjiBudQUvCQ2z5sLGQ0cn9zH/zEEuQwsYTwmnq
         jPGZjJfX3139IOYzwr3ijK/kBDw/PNnz9UjpOYwDc9VDrC5ZMiFUc4ZUkKwAUBXtxKB+
         B4bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C07haq/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a056214212e00b0056eadb85952si3064187qvc.211.2023.04.14.13.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Apr 2023 13:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C07haq/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnPxL-0005iM-Cz; Fri, 14 Apr 2023 16:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnPxI-0005fe-7M
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 16:23:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnPxG-00088J-5K
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 16:23:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so184935e9.2
 for <qemu-arm@nongnu.org>; Fri, 14 Apr 2023 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681503812; x=1684095812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1gBang1D1DIOMN5v6J1El7h9fepywzzKIQHDxw+uWQ=;
 b=C07haq/J8Z4X6M9clg652AjNCG5AdkzMZe7POkBg652eR81HS4AKlMuEZDsSrsfElC
 5KFfmAKOeSU3ySLhza0Htk/mV+f4GfQunctwILnyoU9rbctKjhYq5FWjg/F0gYE6PTcl
 pzsh+00wAArQFE2zKrAfWoW6c850GUnMoa/LHRybq/jvvnTbNzRhx4vhK9ho+5EaDCaJ
 4dJF8vyVe7gM0zc83WSx7z94KHDhS3qomoMaTFSJzsYu4g7qneLijWwHyW9yCilHJjPk
 aHi1aZrCNhaxr11pYz54vSM2JdB0+IRvuZYJw6TW9zWviGRIGcSOOa2FaxqbDz7YCbqU
 BZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681503812; x=1684095812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1gBang1D1DIOMN5v6J1El7h9fepywzzKIQHDxw+uWQ=;
 b=DOVNQvAC495Z4XTTpM9kS9a7UsASJ8h9sHpNIFg5CLlXhG2IptMHXtMrBMBVU9ldSD
 1WYcycpyHUW625QXdlc+07gJiwtptu/7pwUgD6vNyFyxPz8i9+512UJMCh5KVMYUCM3A
 Fw5OwCK1eUxUMkN3gLJhcKVLofPgAGhRdZDcQ1kbbXRmNtoleMblPEFlIyrJyQVeNXQ3
 kdqujqwr+XjfWCnMipFAyoy9pxdHVjrrioVQun0emd6ZK4OFqzwIjJqTnCgFJiAKnM/q
 2axwOXxl5fLz38Qt7EYxG1w6uFass9ulNDNl6tA+53JxoPqZy3DY1Twskhq3ativJ71x
 Pz6w==
X-Gm-Message-State: AAQBX9cb29jTky5z7lZGI8500MebMOOClTce9EmeoQv2A2xEy+i5x2kS
 BmBVcaOdh/NK7hyNb7b+sa3GhA==
X-Received: by 2002:a5d:44d1:0:b0:2f7:caba:3de2 with SMTP id
 z17-20020a5d44d1000000b002f7caba3de2mr74219wrr.24.1681503812178; 
 Fri, 14 Apr 2023 13:23:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.249])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a7bce8d000000b003f165472e17sm642988wmj.7.2023.04.14.13.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 13:23:31 -0700 (PDT)
Message-ID: <5a4a754e-b772-84ca-4ed9-c663b8617eae@linaro.org>
Date: Fri, 14 Apr 2023 22:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414160413.549801-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
X-TUID: 9PoE4xfXJzDr

On 14/4/23 18:04, Peter Maydell wrote:
> Bit 63 in a Table descriptor is only the NSTable bit for stage 1
> translations; in stage 2 it is RES0.  We were incorrectly looking at
> it all the time.
> 
> This causes problems if:
>   * the stage 2 table descriptor was incorrectly setting the RES0 bit
>   * we are doing a stage 2 translation in Secure address space for
>     a NonSecure stage 1 regime -- in this case we would incorrectly
>     do an immediate downgrade to NonSecure
> 
> A bug elsewhere in the code currently prevents us from getting
> to the second situation, but when we fix that it will be possible.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

