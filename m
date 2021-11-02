Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3318379lfv;
        Tue, 2 Nov 2021 05:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoTFxmMa7f06B0KT4NK9DTtWbcs2Ia4C9mW+FcD2XFoH7UOd97vkuv4zCytJvWwvDJy9fo
X-Received: by 2002:a9d:a4c:: with SMTP id 70mr27301979otg.40.1635854814358;
        Tue, 02 Nov 2021 05:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635854814; cv=none;
        d=google.com; s=arc-20160816;
        b=ebHqoU53edgOf0Dgom4LW7iKaMOWnfvk6FEgqNvrEOAvQWM7m5KJFS/oi35B4Tbc+3
         vD560a7WNPJPslZnldEObOVN1EQOD4IBk10H1Ck0Wx2kJPu0aT4IuzVtveukZMr57pcG
         rrqPIzVlX6bYZsgvv5Uw3x+GR6AiB5wELca6MwLFl8NZ838vFq7Ouv/qGQZ1WXn1EJdQ
         xEQHoiRhkO5tQWPpdSYgJk/UT55s5UbyQlqrtK8rYFbOafimepSZ6xOitDIBKUIpISr5
         k/4T7xKrFoKbDkz1AA6zQUXLXsCExxZ8Dr/RZyoy7JESnfsC/rCSuTv0v8uKDfzR/16b
         S47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6TlcMPKIxgAcOzhbpuxUmgGUV+AvJ65qkkKScJosyfM=;
        b=ecaXLhrASzgkF5gspVmNqXDf9IBT+2QDPDfDzY88S8vLDsAoijE4zcs+u1YuXJ7H0u
         Kk7Z1oul7EnmdyglKdGn6NIRp7sCdjB6lu1w926HOW/O0Dm3+og9XNGTb4SY+dfEhzM1
         0YFVYiD2qgxoQ8tQ4dhp5o+7iAzPbhMEULLqJV298/WnBl0WwImFp0Nx6j1stbbKR8FD
         LzX0/uhkkMV7NnUH+bg2Xo/swilw/rrZN+arfDLmd5Wcy2wucUDp5b8EJBI4SW3BdBFf
         4kAve1trwLegrp/LcjoSE+0xHaY7b7PtOhPMGwbVh/S/ZxWYae2gDvAh14a9Pl6x/OMv
         msOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eCoi4wlO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si21804827otg.25.2021.11.02.05.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 05:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eCoi4wlO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhsZ3-00071F-LL
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 08:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrmE-0002P3-1b
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:16:26 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrmB-00045R-RZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:16:25 -0400
Received: by mail-qk1-x730.google.com with SMTP id bm28so4121126qkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6TlcMPKIxgAcOzhbpuxUmgGUV+AvJ65qkkKScJosyfM=;
 b=eCoi4wlOCgW4drQyg5Cskt1SdLIgVq8hqFP8yMCbnW4KHn7F+9TLUN1olXAX7ZXAVJ
 Kc3EVjwc4NbyuIF/wey8r+ZNpm4ZtBIj2sVpolhRkcpK9R+DCQELTYA34R8thmHeN4XB
 q1PCa/0xgm1Hn8Zq/YC2O0v6yPiQYa3wamYqyEMcmMJ1v8C+MBYZJxkgnO7bxTKuzvTG
 UuuVJGl6iHdCJ5T5qRiFDjhlTWeW/NeeEnMVnh0kBXuL0XEdp4LM08xwj3Se4cCC5kpy
 KJxjGMyFjz737VZRcyfl9/J1aetghELJf4boIl8BK9Q8CWk+jLLcE0HOvqhEa0a7OIL+
 NC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6TlcMPKIxgAcOzhbpuxUmgGUV+AvJ65qkkKScJosyfM=;
 b=sInhawEuArx0r2TC33PRsNt6LC99P5/rtRz1+9IMh02pjYccnv94xxFKuEjRjL3pcY
 CvUAOV7dxhwwdLJ5Nmc875RfhhoQ6cPhvK4Uk1IB/mZn/62J+kF64pxmVFMLiYQ+wbFM
 qUDWRKy4iDzo+lHFBQNE9S++FOQUuPlAY2LoDKsTSF3uTRVLpLmMOIDWmrCIBTVjM+ZZ
 6AO4TOccWNNT5abirjnI8fw4O+8hwhCp0ihnfCyz9UML2T6ZFIwh0ZDiznLDRcg3B3JU
 wuoPkrGgqcWJxnHGd+vyckvoRtOse6qPKm+nYqTbviHkOZsVz/u/u2YAz2oYXbfKpVXu
 F67w==
X-Gm-Message-State: AOAM533cVu7dlVDW4ZOINhNjINg9oU86qZM5zhc8ArRW1Zsv2yn50PQH
 5uJ9DT/5+NyIq06b7q90d6g/xQ==
X-Received: by 2002:a05:620a:2402:: with SMTP id
 d2mr28063614qkn.202.1635851781915; 
 Tue, 02 Nov 2021 04:16:21 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h8sm8126364qkn.17.2021.11.02.04.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:16:21 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
 <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
 <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
 <CAFEAcA8VnBS=V9BUqGPHg-mXS975SPCsDXQobyJ7P=AwGLeMhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e957178-789f-2deb-04b9-86ca251498c5@linaro.org>
Date: Tue, 2 Nov 2021 07:16:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VnBS=V9BUqGPHg-mXS975SPCsDXQobyJ7P=AwGLeMhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o+xam9VzYPuc

On 11/2/21 6:44 AM, Peter Maydell wrote:
> On Tue, 2 Nov 2021 at 10:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/1/21 1:50 PM, Hao Wu wrote:
>>> Is this reply to a wrong thread? I thought it was applied a long time ago.
>>
>> Probably.
> 
> Possibly you meant this 5-patch NPCM7xx series ?
> https://patchew.org/QEMU/20211008002628.1958285-1-wuhaotsh@google.com/
> ("[PATCH v2 0/5] hw/arm: Add MMC device for NPCM7XX boards")
> 
> which has been reviewed and is ready to go in I think.

Yep, that's the one.


r~
