Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3068021lfp;
        Sun, 3 Oct 2021 08:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/0Uvy8a9we2YEYjNsCQxTR+17vX56AFAtmp5y33IBt9nMWWupV/N3WF+dDVCktPvAXHtm
X-Received: by 2002:ac8:7959:: with SMTP id r25mr8816220qtt.29.1633275823554;
        Sun, 03 Oct 2021 08:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633275823; cv=none;
        d=google.com; s=arc-20160816;
        b=WCbSrIdL4Bip9rqSH2nXsdnVKqf1w8d91fBbJcZ9T8OTh7H+lv1cevRc8IoaXaPIvb
         I9zI9RysVjr9uLYAvBxVTTSjCU6l4k8jkF/a9tfgV/cCVD01p/wed2Xa7T74XuZDr933
         8Go+I0ou8gHOaAlW9rz/x0FeLOgzmpXCEQIQvsToZPMWFeQOdGEnaJseihhoRONVKp4I
         cj4l9FnNzZ6JtaiRuZFBl6yNENb6SyKU57ve7PFrbGpNsHtYzGnWB5B3Wb3w6+nCGG7w
         bfxVbVkGMiC0c5HVcVFpFQePSpx2YRkR6dBWzejzFLBqpWA6lTQACVtiZ7z/4jguv2KO
         7EFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qm5JAsyx0o1NDeWlRQcQtvlTyQZ8BatY9Ij4Ng68XDY=;
        b=QuSTJ3rk2vHzaeXD/S/EYRNyep0tMZ9VK9/XOBiGjFBJmA0iYEbIHKxqy5zBt+YKF4
         S09nEe3wZb7ObLrXlqM6YTDwM8YUNqWQDpmXrySkMiNzOpT7O2dWsenar6tAQ7J9pay+
         +vG8phU+XAN/yv0aRWYvV5RNxRsvoDmSijhMW+Vo5Qv+5oy3Yk0FQQoEbSPobmF+KvC3
         qrg4XNGSCDEEbz07YQNHEGyA3SE5BihF88E6bnq2qI0godabdhtfBMQjmg8QasVMGJDt
         8LfwyV+V/xs2DpvF8HfDem2/czkI+ao09eAGGOIR2/AFhcP2NuP7JnkhD3o8tg8SfPSZ
         mHbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+y2kkyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si3960656qko.143.2021.10.03.08.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 08:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+y2kkyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mX3eQ-0008WP-UU
	for alex.bennee@linaro.org; Sun, 03 Oct 2021 11:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3du-0008Ph-K5
 for qemu-arm@nongnu.org; Sun, 03 Oct 2021 11:43:10 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3di-0002s5-1u
 for qemu-arm@nongnu.org; Sun, 03 Oct 2021 11:43:10 -0400
Received: by mail-qk1-x735.google.com with SMTP id 72so14136290qkk.7
 for <qemu-arm@nongnu.org>; Sun, 03 Oct 2021 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qm5JAsyx0o1NDeWlRQcQtvlTyQZ8BatY9Ij4Ng68XDY=;
 b=J+y2kkyRZeBsCwAmXFBfjxR+XZccpOgIOkGdX7ZuPKfdVXjJ6dxMrW+DUPbKA2XcHA
 2jESTubC80BOe79jpcyFPcqJysI1BciTSNfdjme8RW0nVXVcOQzikbSHoaUJM1yzQIIO
 tcLQFOQUMy5Dm/JDwuoQa/fbYth2d+rPUnDCLxTYj/gCtajITXX+gJoAZj1HQSRUBG0s
 A3eUOygurqH1YHK/1tG6U32BKFMpybXGX/oe6fGgKxyw/p96BkrRhoN4+MkAPMaQKURE
 IvuQe2d1CBHLEmzcjzBevwu46XOwp0QLd4hfbJ9e7yz/cMC8E78LywkiSDxrpWu5A6Yt
 CDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qm5JAsyx0o1NDeWlRQcQtvlTyQZ8BatY9Ij4Ng68XDY=;
 b=GH2vIleGwHgGD8Id3CqK4vhbGLnumJhXSAhUOMCEFbyaAoOqcKM8upFl8pvgkm/l3N
 70jxNwVeY+CXIjpdjz5LlUZjPuuUTSr8SZXsT5BuxZvHq+A7MOnm3IMf1FeaqogvqVse
 4OntSxW5rgw7pX0CIj0h5seo8aw6YPTOAmdErOhKxt91sYgmcPya6Va2hhHFj4RHNkAm
 Yu1QOtrKTPnbc2QEJPF/g4kD5MFZV8EHWH82L3Ym5f2t/FGNIGtPdwp6RCr8zxuloxln
 khEam1OdENn3lZ+WEkCzi5aP9GQwgQfKzv/d0ygheDmwl7x8Si7yhFz4lc8Ht8WcVSJ8
 AjGA==
X-Gm-Message-State: AOAM532zzi1dKg/STpQmSgca5Xamvb2JBcp/gmqc506BmEoSZmwhtwLU
 JMEcqd4l3MJay4ZxKkKE2imvAt0UOT7RAg==
X-Received: by 2002:a37:68c8:: with SMTP id d191mr6208621qkc.446.1633275776673; 
 Sun, 03 Oct 2021 08:42:56 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id 75sm6260367qkh.121.2021.10.03.08.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:42:56 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Use the constant variant of
 store_cpu_field() when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c5c2991-e209-8321-9d98-c57027ade894@linaro.org>
Date: Sun, 3 Oct 2021 11:40:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003143901.3681356-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XY38uFglk0Ls

On 10/3/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> When using a constant variable, we can replace the store_cpu_field()
> call by store_cpu_field_constant() which avoid using TCG temporaries.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
