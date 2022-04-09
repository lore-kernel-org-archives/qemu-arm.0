Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp593984lfq;
        Sat, 9 Apr 2022 11:17:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsHyaxxqLlShDLVcdJl3vRqUJYoc8LqjjYNEAbyKwL5lzJKfPa7T9vvF0HH7pQELWDbvRi
X-Received: by 2002:a05:622a:120a:b0:2e1:c9ba:e99b with SMTP id y10-20020a05622a120a00b002e1c9bae99bmr20575123qtx.685.1649528256713;
        Sat, 09 Apr 2022 11:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649528256; cv=none;
        d=google.com; s=arc-20160816;
        b=RLKAHfJdq05cRDJMaU62bI92yJhDhO3qjCnSmaM0cz4VBeMHJ761Qx2gv0SBAKGRGe
         b7dZG2hZjiacfkTZ/px1y4rxc2ihWFDJOR75vu2CLsC0Zzpld/TUxTmfjNfQsOt71xct
         FeY0mEsvci8E3cAr6+2nJGpdPT88eZlfCZmdOZlDq1GO4t1Mwwcy9W7MMy45JZIb64ej
         zb299Wag3OCbsNWmiV1yl7hoynfXZQoh6oz/PjbxBV6WqAP+W6zVIuHd11rzUz91em8G
         OFqrp1cIS4oG4CLrSglDQX3ImCiAliIiLL4bmYdjVHY7ULxDaXUJiFO9W4gqPTqmrlOY
         aGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=iszBu/LpQiqk1ElyZ4IlKvqyXDWwxdiW/CzhJO77gcY=;
        b=YwzTYA/G/fsqF9F98FVw32h54RVFmePnA9FVYlWCgbqBPx8qlK+2dO0iB9nYRPfxAK
         MSir+MTUMdKZUAxULZ8H8ZEPxRmfw3/FczT5WQuyt4IlC+V2/lS6dYgIKSncRI8RGHx4
         LU/rw1alU4b1YmuGE9Yww0JGgsnysEesuE47+OmtBBQASuh5Mz0jALCO1I61j7jfvl4B
         heaiqgKtRkkd2XEWs8mCY9/el/6gBtY4PfRkevMgk1b5OuHL4AEyRPNa0KW7tNUWQt5E
         x9gTSxDozVd+pmJJzuhJ5JMQduSI+sRTKA+MmHDIQDfwWGi5yo+n/967TWSqLQGB/Lo5
         LCWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R84qbjr9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge6-20020a05621427c600b00440e46a7d5csi2358363qvb.506.2022.04.09.11.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R84qbjr9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFeS-0008TA-4E
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFe5-0008Ra-3p
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:17:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFe3-0000D9-Eq
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:17:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 32so8470414pgl.4
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iszBu/LpQiqk1ElyZ4IlKvqyXDWwxdiW/CzhJO77gcY=;
 b=R84qbjr9rjhB4xq1HoVKNVU7gQGGbNdVGFwmivx/Fmf3DWF17zsXHIDIYxr97cFBz4
 sot9tKgXU2sECkgsMyNRmzchsfgg4YRUIJETS8eghl2VBRsMx1vZP/B4mPppxX1OskKI
 ndcLmnxKb71vwZjvcOczt/GCarmPpH+ltqiO3p+TXxxqRZomzueeRTjNLyiKevlqTRpK
 yd5tWiFEVuudg+Rfj8AqGVkhQaeh5u6lFyUTTKss9ovflZeJUFjXSPdoqKzMjjSQGteA
 UVcrE8tx8GzQ0qZuGl6php6DzO3FFwU0u+KB+7dGB74iq8s2C+97YWNKzmP5S9ODYeYb
 OwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iszBu/LpQiqk1ElyZ4IlKvqyXDWwxdiW/CzhJO77gcY=;
 b=SK63FZx3Yq00pbATtGmHZl8MU1XDD1TkvGWJudAlNnH07l3GfNCI697W389Xaulw8k
 ovyn2kxzStvQmICC5orxUxWD30tW7b68O2EQ+/EI3zyEOYDjdIYTr2ytSdDJ/x2fDHWi
 J49wV474H1peuCPMtQb95jXszlnXftF4YsK8jTfH+MW2lE7XkBuPn9z99Qwi9OugARO/
 TKWZ9yLrvjh7STtVHaa0pZdT3+GQA8sA/IuEMQ5am/2sjcZ1f/jG3nPJBbXBPOLPxyqU
 ehBXZucnqdlfvuxSqT78YTeGJaVg4sVxKj/GR22lNu01Pa/BKKUIPhZlELilMy12qHVC
 YhCQ==
X-Gm-Message-State: AOAM531KOcpRr28sbL8Wf8YX01cpfQHJn8M/9egjuR38wRaAV3cl/jv+
 zMnGiJkKSj1ES8dtSuZinxp7EBQKeL+beA==
X-Received: by 2002:a05:6a00:18a1:b0:4fb:27d:54e9 with SMTP id
 x33-20020a056a0018a100b004fb027d54e9mr25121436pfh.7.1649528229044; 
 Sat, 09 Apr 2022 11:17:09 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090ac40200b001bd0e552d27sm14746294pjt.11.2022.04.09.11.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:17:08 -0700 (PDT)
Message-ID: <fb815c4f-8148-5569-5c3a-135ab18b785b@linaro.org>
Date: Sat, 9 Apr 2022 11:17:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/41] hw/intc/arm_gicv3_its: Implement VSYNC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1FjZ00qyTtYV

On 4/8/22 07:15, Peter Maydell wrote:
> The VSYNC command forces the ITS to synchronize all outstanding ITS
> operations for the specified vPEID, so that subsequent writse to
> GITS_TRANSLATER honour them.  The QEMU implementation is always in
> sync, so for us this is a nop, like the existing SYNC command.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |  1 +
>   hw/intc/arm_gicv3_its.c  | 11 +++++++++++
>   hw/intc/trace-events     |  1 +
>   3 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
