Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9406586njk;
        Thu, 2 Jan 2025 00:02:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6C8VrpAfrY8GbxredYWVkaWwoATntGZo5LDy9TDbj1cKK71sxx0uicdau1LCKoxEW0uDpx4WjQrZnIg==@linaro.org
X-Google-Smtp-Source: AGHT+IEHGMW5yMLCXPS3K7azJBSc99Ipevsdi6Z/38xBULsoZGFwNc61+ZkaKoKErcXf8AS5fFDw
X-Received: by 2002:a05:620a:3908:b0:7b6:dac1:cb73 with SMTP id af79cd13be357-7b9ba852ae2mr6297462985a.56.1735804962847;
        Thu, 02 Jan 2025 00:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735804962; cv=none;
        d=google.com; s=arc-20240605;
        b=kCgeQzKzqVemv/YOK4o3VlX7QD6FJqTfMAag2gLS7sezVeW0OdOj5fOvHoiw8p4gCd
         LnfYsBMm8fkKjmtKUs9tQJBEYGc/wuSMWGdua/Wq0tHw3Lqeb7mocuKMuV9M8FzkoyCM
         0yoHkVSPQbdJZKebtEbDZIaKv/Nj08+brPJMJYKnIa8tDVO0HUWTPzTeu8TsGNYZcYzz
         dNQPV/7r4I3yN9ZTHOJN9WAkr0GlZglKQNk7R/duddP7EXkGOzd0esbnRR44WfoGQcRV
         uBJOdMGIjb5Wxvp5aQN3CWelL5kjfysJqsdjhmVCnIx36rUXFOLWahZbjp9BsRQ2iy3u
         BVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bhryZLf1EbuooTuy8RwlZFSpnXwVnpUcFGZKdgU+M68=;
        fh=Qr3XVXDRuSegcHfQ7xrrPQgtjRFpRvHoNwj/j3n0k6s=;
        b=gvZYjEcyaIQ2CgtZWcBPVzmf6/QQAyYsCKxs17h5yDgpmiWh9QnUkQgncfBSihEUhB
         0NpDg3z0gVFPjPqHI6AoN0rE4cv1a7oRf/EulrdoXEFN4V+jmW/UxPthtLlZvz8+XG87
         M6970HlY5AJ9hciyWn/VqYbHewmJi5LpDVZlOQwOKZP0L5soi+EwhBZPkwwNBYwhDJEr
         IBQKh5kPYHt1AG/T5kyclzlo0mAzUur/0xcwIE1BrFmMQGSlCDE8+1zMDLoA+94fAlLF
         JseJohfNR3OaT1LnlfSdSqVRGZfT4BdvZUYEa8VxLCpXkBbzUdPAvsN6puT2A0516RQR
         rkWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6L+fa09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4cd551si3317029085a.437.2025.01.02.00.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 00:02:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6L+fa09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTG9w-0000IC-R1; Thu, 02 Jan 2025 03:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTG9t-0000I3-DN
 for qemu-arm@nongnu.org; Thu, 02 Jan 2025 03:02:21 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tTG9r-0001dM-Iv
 for qemu-arm@nongnu.org; Thu, 02 Jan 2025 03:02:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so126189495e9.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jan 2025 00:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735804937; x=1736409737; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhryZLf1EbuooTuy8RwlZFSpnXwVnpUcFGZKdgU+M68=;
 b=P6L+fa090XZaK4/CW0P6dyx3QfIu/0qvIjq/wKwMBoTPr4QafABgm05S+oVFUym2zx
 ugmsblD2g2M0dp6zN5QfJY3bKTpaJ6EFUSQ+47+KKKgBlE2q1c09VmXMslMYehx6V3k9
 GtwTkottvvGh+wtZ97HmBtnhoxo42gIS6+vw9wlJT8LaGSebUJZ51JbvtM0L/hvG4LfN
 s8kfH87yw9brdFx63HoThxeLqiOEvSkiX8nFSs4vaIOy0qkYl3wHOS2kG9wRH7aOyrxz
 atnxskk50CCiAR0e4+lqjn9Zs6jYnlrYc0lszLa4cbHJoRL5CrLt7PH/tyTcYMTUELq0
 3ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735804937; x=1736409737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhryZLf1EbuooTuy8RwlZFSpnXwVnpUcFGZKdgU+M68=;
 b=oryLcceokvF/r/hvQ9TZQLKx+atJ6rabHEeQ2KJKqyd4o7aRSdgh78Q06UJhm78YLM
 FCZ/uxlgRlTP87lbyI4pQlMin3Ic9/er4WtsKN5RwRd4Ze0F7+D1iq7JOfObgDJkshNX
 yzZ4dAJXbISBv/E0kvqZHnIJOAnsrISGbUT6bOwBQVsHqPutf9XToBOec0CVET8+lOpL
 2iQyWbjGI0F0WWAYKsnlu+xz9xg/prq+cBAW18M7yMPYH9VrNCQcGDJSbWL1OkXrrExr
 a9tzh7uFLOmgKtGCdXqjGbH+otPyL0alX0NzuiJx8DXP3s81diDCE+iCmbF9ekw7CDIM
 j50w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULXoSFc8Jx4L8WpPNn5vNctpCnslbpEh6EFVTJgbpyfuDJDQR0RTwID6Y7nu/3c5KW2o0NRnZeWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxSvPYpa765iHzSBVhwMB5oikRy2y58KEkstgDrJoDEBAhgkobL
 ACXBTXzaTittDJ52Q3MNuZ4PR3r/3ZqSYgd7ljVQjb7Zvllj/JQ6i5h1GecMsw8=
X-Gm-Gg: ASbGnctnoqQ1bnlUE3GxYSkps/CtGygYBi6XrdfjKue46P5T6ys9g6solwmAyMn2tsh
 2ocTFOADbVEsONPrErsaLLf4135kOCUJXhZRM/QgmsDmSgaIcst9Qf2e4e2AiSoATLpgt2Ss85F
 dTo6GYnOzZK28XKTxVEZ+kTByzMw7IRpcGcxGw9R2dbEJvZIix/XP1CtWau0tFzyCVY+4Y7KrYd
 vKgClbzFh9K1teCpuJFIcni/1nEcCEdbt0bJ7usa2Tl1J0OarOAYwPQs3ceTU0eI/7PQCX+38QT
 HYECfuQP66ubSoTPEjOTBUGG
X-Received: by 2002:a05:600c:4f84:b0:434:f7ea:fb44 with SMTP id
 5b1f17b1804b1-43668644255mr375854045e9.14.1735804936859; 
 Thu, 02 Jan 2025 00:02:16 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847714sm37757676f8f.54.2025.01.02.00.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 00:02:15 -0800 (PST)
Message-ID: <6402c02c-03e3-49d9-8afb-0c9350e26bd8@linaro.org>
Date: Thu, 2 Jan 2025 09:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_arm_quanta_gsj: Fix broken test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org
References: <20250102073403.36328-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250102073403.36328-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: Ds0NkB+UlM0v

On 2/1/25 08:34, Thomas Huth wrote:
> ASSET_IMAGE needs to be prefixed with "self." ... this bug
> apparently went in unnoticed because the test is not run by
> default.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/functional/test_arm_quanta_gsj.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

