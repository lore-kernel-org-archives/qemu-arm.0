Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2278329eja;
        Sun, 5 Nov 2023 09:13:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7uh66w0Ph4udWY8qGa/X9yoo6JnntsRgYo2lEsNAD6cpjiKszj2S4WUeXr8naJz7gfAs7
X-Received: by 2002:a05:622a:180d:b0:410:92ca:3dcd with SMTP id t13-20020a05622a180d00b0041092ca3dcdmr11441941qtc.9.1699204438286;
        Sun, 05 Nov 2023 09:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699204438; cv=none;
        d=google.com; s=arc-20160816;
        b=CcLxCPlDfM04JxOPBwqWlbclN6TxbGHRqbjuFb+2WRQO/Yz1eGHmbYfw3ypu6TvuNt
         JGrdmzxuem545vccKGUNsE6cdJjwnUYkGOUMc5SwjQ2D+YoQg0a3wNg5lh5grnarNLRg
         U9+FhQOXxKXSHiDg4BVVskhtxvdb6t7a0Wtv+VTuC+sNfTi1WJn7jEtZ91gkUT0dAFZH
         kKQazEcjMNJmt9QbUDzHFDkUAzrG/9Vk06bgyZYnYhuDbbWFa0idBdQ9Q6TSN6rzdAoM
         n6E7GyiVHm2n7d4qFpZc4jTvl64P/6MdNBJeov5IO2Jxe06tiEyJRk+PUsLJJNZAyqkl
         swCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sT2Zy1AHMXQyOBzbST0Y1JWWLDq4zjSh8twGjwpeI5U=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=j6yujFqL3LXA3xC0mrWpce910g+JAz6lYReZM8F3eBo7ARJ0TOyOV7+igY6IPEMf+M
         MuiY9K2idbRHBroIZYlOiHeZyBKrV59sH8SFBLbmS8eGEP69K4c/1M9OTLr6tBtg96Ib
         HpW0qqK8uriFKsWxJjnhaB4gRb9NJW3fhQFoW1GFp5qb6XROAUzqRemzd4LnvW637GjS
         eyQzSWS7Bfasl6u6yt0hrBLTrOWMO7c61ILDEDH/y63SoyzFwoZm3mPoButQNBdaRTXh
         wyh/mZGc8qmmuu/t4uOO4/ZxPTr3iIUNfJW70tNXrWa6bTh3gcwMgWfHiwSG2QoUasXe
         sNNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=az5IXI8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020ac85f48000000b00403332e2e31si4250035qta.559.2023.11.05.09.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Nov 2023 09:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=az5IXI8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qzggp-0006e3-LA; Sun, 05 Nov 2023 12:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzggo-0006du-RM
 for qemu-arm@nongnu.org; Sun, 05 Nov 2023 12:13:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzggi-0004wA-PF
 for qemu-arm@nongnu.org; Sun, 05 Nov 2023 12:13:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-408002b5b9fso27989325e9.3
 for <qemu-arm@nongnu.org>; Sun, 05 Nov 2023 09:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699204405; x=1699809205; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sT2Zy1AHMXQyOBzbST0Y1JWWLDq4zjSh8twGjwpeI5U=;
 b=az5IXI8+NHARxGjFkVp8pH5LV9lz0GXyJ/B+yeJFf5tG7w5pTLkZk5uniObGVypHWF
 yyN827jac4uKp+n1efw3FJ10mMsawYTiTwxXor4TiXwdFj3/qsbAGJWqwNdXyUPUeZin
 gUspKoEv/6zHQpbyD+yLy4FSsovXXjI+GUlR894OVpcXkWm6oBRmU5vn9gZtNVeWi+I1
 9MK4zGta3Ut2CgP9wvQCQF0wuAWR6DDpFn55fcGENUiH316JWqkpI8maWV4Gc6Eb4zjJ
 ja5eSPSkSAla04exqBEP7C9VQdZxAf2XIqjlk+9lLwyAHFXSV7IFdgBZyMzWJKE+Zc8d
 A8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699204405; x=1699809205;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sT2Zy1AHMXQyOBzbST0Y1JWWLDq4zjSh8twGjwpeI5U=;
 b=AtEK3xsm6Q2VLe3tZs4sxro9OgP5bDOzCSTgjbrj3Dkej494MN5WUmOR0WFV77wzZ7
 +B2pR9c8uTBe0+KDeq5oc2hzUggYEpIn8StzmI+w6QdSBZOFX1y32ZetXSfmACkuEpvB
 rJfpZCYiBXnPAbyUhrMazDrGjQcmApJztTwJF9f2aHdRsRLgYJoMqyNRw6aGFerF/fTs
 9WDd6NZyDazKoSMk9/iA3elYhF63ucGL2M/TrL4akz02P2HhBkIgjYgc2nCg9pT2mw9t
 vzXyk5eQOehpveHfKWYyiD9SYupCiKBb5aFexnS5ctATm1dq6iMchmHYFGHBNAFZAdmj
 IOow==
X-Gm-Message-State: AOJu0Yyi8JetkQZuutDa1HX9i/oKkfQoE+CmlYYP2TbOTT2jv2o0fqUn
 JU6m3cRYVHw+oi0PYxOgxtgGip1F7B/GYa1IBtk=
X-Received: by 2002:a05:600c:1d0e:b0:405:dbe2:df10 with SMTP id
 l14-20020a05600c1d0e00b00405dbe2df10mr22301906wms.35.1699204404920; 
 Sun, 05 Nov 2023 09:13:24 -0800 (PST)
Received: from [192.168.69.115] (176-131-220-199.abo.bbox.fr.
 [176.131.220.199]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b00326b8a0e817sm7220183wrr.84.2023.11.05.09.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 09:13:24 -0800 (PST)
Message-ID: <dfc2f9e9-0098-2f22-3925-94283e30a71b@linaro.org>
Date: Sun, 5 Nov 2023 18:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] hw/arm/vexpress-a9: Remove useless mapping of RAM at
 address 0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231103185602.875849-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231103185602.875849-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.137,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: zfTkUPC/X0qG

On 3/11/23 19:56, Peter Maydell wrote:
> On the vexpress-a9 board we try to map both RAM and flash to address 0,
> as seen in "info mtree":
> 
> address-space: memory
>    0000000000000000-ffffffffffffffff (prio 0, i/o): system
>      0000000000000000-0000000003ffffff (prio 0, romd): alias vexpress.flashalias @vexpress.flash0 0000000000000000-0000000003ffffff
>      0000000000000000-0000000003ffffff (prio 0, ram): alias vexpress.lowmem @vexpress.highmem 0000000000000000-0000000003ffffff
>      0000000010000000-0000000010000fff (prio 0, i/o): arm-sysctl
>      0000000010004000-0000000010004fff (prio 0, i/o): pl041
> (etc)
> 
> The flash "wins" and the RAM mapping is useless (but also harmless).
> 
> This happened as a result of commit 6ec1588e in 2014, which changed
> "we always map the RAM to the low addresses for vexpress-a9" to "we
> always map flash in the low addresses", but forgot to stop mapping
> the RAM.
> 
> In real hardware, this low part of memory is remappable, both at
> runtime by the guest writing to a control register, and configurably
> as to what you get out of reset -- you can have the first flash
> device, or the second, or the DDR2 RAM, or the external AXI bus
> (which for QEMU means "nothing there").  In an ideal world we would
> support that remapping both at runtime and via a machine property to
> select the out-of-reset behaviour.
> 
> Pending anybody caring enough to implement the full remapping
> behaviour:
>   * remove the useless mapped-but-inaccessible lowram MR
>   * document that QEMU doesn't support remapping of low memory
> 
> Fixes: 6ec1588e ("hw/arm/vexpress: Alias NOR flash at 0 for vexpress-a9")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1761
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/vexpress.rst |  3 +++
>   hw/arm/vexpress.c            | 14 +++-----------
>   2 files changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

