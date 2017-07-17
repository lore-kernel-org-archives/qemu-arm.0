Received: by 10.25.44.15 with SMTP id s15csp4114284lfs;
        Sun, 16 Jul 2017 21:12:06 -0700 (PDT)
X-Received: by 10.55.101.139 with SMTP id z133mr21165147qkb.259.1500264725966;
        Sun, 16 Jul 2017 21:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500264725; cv=none;
        d=google.com; s=arc-20160816;
        b=o0Spiea3o790d5VqZvdNdwMiyRiUQns/foZqLk4hyOxafpBHgtNJu9eS0WTp4Yx/1A
         oEJCpVHLCw4xBXR0d7TJAcbJiBRnGHjCZIujnkzWfvAxSxyGi2pm/hTE4uliF1Wh9SH7
         P5ELC/O2wSUmJCyslnSU693Aig98wTZ2jw3B+aSWJEa/YqFxkF34HhUdTsuwkIjwTpQH
         gnJ3BmH23+ciRG7VOYLUAoupX/SjJsfThb5y2Vwx7tyzjVg8G2goGvL0f0Iu21fM2Mcl
         3hmgXV0/1U4XpUmKoznu0bxNyRz+4PvmzRpgzxll0GRto+/NrkOEWHKqFodBtjbSYvDn
         a2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ZjjjUT7vuL2jwpbCpLPPSzTjjs19aTBQiWyb2qInBLk=;
        b=anZ8ZzVMEIzFEuP0hObEp4MZDkRS0mUbuEP/iem+9RCpEo5KstUZfC1ucKbtegpdI9
         e0iFA8zRdlQiSll6MRUcg5oYs5ScZL1Q5yrwhNVV2iUdZlnm3lO/5p5yHISbcGNsM+Nc
         7dFlZ+bHKSviUkAcKGtcdpYLSXcXQU0NUz3YZTG+GNhIA3yhyZQgwUNTutaCQw+NgPYF
         0dG4w4kbrKo6ifDrJYtUn+WBWo9pNR/y4IrUwkJG5xE+e23DioZZTIqQlbyO7PbDvEwl
         6E6UZwnn8SKHi3FMLARt4dGDW2FAIpfHSal3t9j4yrwC8CChQof8y9qC4nzWtm3+7rR9
         9Wqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=S7YrI7aX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j93si14896162qkh.131.2017.07.16.21.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 21:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=S7YrI7aX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWxO7-0004sF-80
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 00:12:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxO2-0004qp-VS
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:11:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxNy-0001fE-2m
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:11:58 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:32829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxNx-0001f4-Ud; Mon, 17 Jul 2017 00:11:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id j25so3257381qtf.0;
	Sun, 16 Jul 2017 21:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZjjjUT7vuL2jwpbCpLPPSzTjjs19aTBQiWyb2qInBLk=;
	b=S7YrI7aXc8g5b6PBy0YVSPGSEIWYJbprdHg+1yt7JPjTtXuQC4U/PFB5Pxh5ImsBF4
	6FM4GYAKFbg6M7dfd7mmSmYHh6z26ZKD6VCI6GY8mo6f4t/yX5LJZNKRHHahgwxCFTrn
	1ogcrUshHP+fyLH3HmpzNatp6dkKLFUZBmII9dyHcxqis10DE75KAU2OYQdWLXdreptt
	3Z4I5OVkKaVoAEVh75SaeAON4m9CaQVPwLHU1Kl5FA5SstGIIN/7joO+9QatZm7mm9JW
	TFgnIXh+XDYL+Di4e85k23e6Db9+b0R3m+XCTjdxx8+C7I6aiTfuSI2rOKE0EauuZxnz
	k2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZjjjUT7vuL2jwpbCpLPPSzTjjs19aTBQiWyb2qInBLk=;
	b=CL6uYmcn/zDJK+6wyGKZSLdK7/g/qvENgBTt/wIvGcSEB0qo/f6S08z6GUUUk9C05s
	ca8V2eDHpqoMNhXu1YgZmtMI23RzJKy4z9VBY51O64n0HC3kgX21ZEe8+Mwvl/lob5XU
	kH3oyZ4czwSg7mTuJIWOvhz+6Rk15dIDTYNITU55SgRORiusFnm2rIgTAfCrDOnnI5IW
	9NoVsNfSEPqteBTBbS0dePI4JlzI9ZFJeyCiQssSWlYrn+LZAKWqjSz2rZH1n2JqG4ra
	bDc9c7tQkDHzlCaimZJhrpC+cAT+QZyPFGpvpBGc2WyDbR7RCyVUhOTti5EsjPif7byi
	gX6A==
X-Gm-Message-State: AIVw1125f5PMcAtvopdAVZS7UDsTWBJxwoFfHD7WncJW1icn5Kh1TDLz
	y9vFxo5idTdiW6C01tY=
X-Received: by 10.237.47.230 with SMTP id m93mr26645898qtd.103.1500264713382; 
	Sun, 16 Jul 2017 21:11:53 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id 131sm426296qki.23.2017.07.16.21.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 21:11:52 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170717023824.18796-1-famz@redhat.com>
	<20170717023824.18796-3-famz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <266263f5-22c5-1b91-937a-9c08d5034ea5@amsat.org>
Date: Mon, 17 Jul 2017 01:11:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170717023824.18796-3-famz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v5 2/6] armv7m: Convert armv7m.memory to
 DEFINE_PROP_LINK
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g9Soec8oWAJ9

On 07/16/2017 11:38 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/arm/armv7m.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 8efc4e8..1c837da 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -132,12 +132,6 @@ static void armv7m_instance_init(Object *obj)
>   
>       /* Can't init the cpu here, we don't yet know which model to use */
>   
> -    object_property_add_link(obj, "memory",
> -                             TYPE_MEMORY_REGION,
> -                             (Object **)&s->board_memory,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
>       memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
>   
>       object_initialize(&s->nvic, sizeof(s->nvic), "armv7m_nvic");
> @@ -248,6 +242,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>   
>   static Property armv7m_properties[] = {
>       DEFINE_PROP_STRING("cpu-model", ARMv7MState, cpu_model),
> +    DEFINE_PROP_LINK("memory", ARMv7MState, board_memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 
