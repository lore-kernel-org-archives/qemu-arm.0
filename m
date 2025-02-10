Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2202237njb;
        Mon, 10 Feb 2025 12:33:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyjltTzrrcijSOLThfxkOyT0eucjwW+XFKMgAPaRMiNYkBYFp4oG76f8I6IbjiBH4aHB+spgVxCmv47g==@linaro.org
X-Google-Smtp-Source: AGHT+IHThJAmmYKDI3M3BBIdgV2SZDA6VHh9opxnGtHuGY6RJ/E1n7G8Z8x6WFaTKjzwzuvZmTE9
X-Received: by 2002:a05:620a:4448:b0:7b6:7970:651c with SMTP id af79cd13be357-7c047c21207mr2341523785a.41.1739219605648;
        Mon, 10 Feb 2025 12:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739219605; cv=none;
        d=google.com; s=arc-20240605;
        b=VNE0OqlUnMUaJdRVvQpPvYtkRRhbJLIhcr0cjZ41ToKnkENrOt8qCUsYSxoBdsFVlp
         qZXNJ+UyxnxQHs3H1NzyDRC9va8dDxo/wpdOvBRUy31f5BegHebjJFi8XXQ6Ea7uemSt
         gIkVAYsNPAbwjUoPMxplkltg9w4JhD5XJ80DD6082Dn8wRkrpzS7HW4CWhJU4ophlosS
         ngZKbH8ls1V7ra6940h3gJdk+Ewo/HIHecAr4riViunrd+DjOFpSvow8zvlALy61SVUm
         kzYYxTku/yBz7z7/Wws0FljeFQqPMYz2Z6IKk5FP1GrQc4oCYEVIcUF/pkrRmJdcXqbB
         hlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JO28UvwJr0bHz8S59EzQAGb7sFlG/PKWfO3E9TxYgy0=;
        fh=mnzIXJdkQrz4KecpN6UkPJ4Q07Sufevl39Amy03IqPA=;
        b=kJACn7IP4EunGcopXgYsDT8QRcFn+bNJM6YtUiyKnnzn4c43V9hiGJklRuIwo4C7Uf
         zqcm+cDt0ohV701+rZiPneaxYNtFhY9jV9GnGgVh5Cfl+M2GusE4bN8CTuJNYdJkW5Sb
         PvHqhatlvV7OxOv1pgYqH768Tr+3zUS7817SeRTvnCsh8PBg72NmuVIbkeQ8Sj1b3QYx
         FJEzhHQS24rCW5kxqnut1KpPUbDm7BnFFwNJQF807jTdFaSw9cr75FES/RHQ9H9O0mmx
         HZp4upIyW+DCsTscmpm+7+haJMSX3Hejkyo6M+zhIDD4qHS64UYgp2cBC0a1BMbs5nSF
         M3Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFuOvVEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4718397fb51si48933591cf.637.2025.02.10.12.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 12:33:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFuOvVEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thaSj-0000Pq-Hi; Mon, 10 Feb 2025 15:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaSh-0000PA-Oq
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:32:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaSe-0001x5-Jq
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:32:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so56469455e9.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 12:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739219574; x=1739824374; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JO28UvwJr0bHz8S59EzQAGb7sFlG/PKWfO3E9TxYgy0=;
 b=QFuOvVEUILUvSeI01nk14rX2vPtFFe3geDTJjwzpLxWEhQ92IT12IFhbfUGGvg0pCB
 EOwdvNgnz7VGqoeZJrnytM/Uv1AUd8DrfnDDc1q5oBz/j8WvZemxq/qO7UAQAnAt1aJf
 KBSEKTRntwBQYazX9D/1EVp3j6D966gSjQEXIZxHQCmZcb/W7cK4iuwOdQkbL523cxi3
 vmiPD/qPCPBfzJ+aKzXwWXV+lds7D/eDMNrO29jaQXIbpiWuiWNe3E1cHs6ZyjCMF6mb
 PFttL/K7JvMcyiKtAKcLYFu6Uvnne3S0vc8tAmsjCLcUVoNDH/PVYQOb86PK45jfa7D2
 7REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739219574; x=1739824374;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JO28UvwJr0bHz8S59EzQAGb7sFlG/PKWfO3E9TxYgy0=;
 b=G5IJ0cRafyrA9lqMYteMrFkyxeMGkyeOnYU4CCqROd0FsvY/nAKQ3gzo2CMWthOa9h
 snFOhecJ4H9DB63Wt5GhYA19Qk1ZVHDNmTP5i/DCh4L/4qX5u5KxK2U1L02CFmNYjBf8
 7rOx1Eihn2SEJJ9QPn3oVafxzV4ublp2I+IDda5Qd3+YG1MkR/jd0rxaPxM3cviXiJet
 U/kj7RwFZDdQaE+g31NbbgaTP/ms/xJ2un6YeX8adlrb08rZCvFpqGMxk5B7YEkUbLqe
 qvY6VThhpbxDPReK6RIsz/bq5lWtMB+FQ5cjRpXBHb1xW040D+H+absPFML/y5FM/+7w
 2txA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5oYJ1UPwXg9pknCBK0E6AXDkW1nGTfuliF/lbhdPMZiNkh9wODBJHO9oTFAwmofugZZ7rS/jMOA==@nongnu.org
X-Gm-Message-State: AOJu0YwXhMclaB2Xr7PhRZWemHErDvjMahqzN0sdvAuDXd0JwjgQ04IG
 S2IGt5xBxVlW/M4hd/mBqD96KqjxGv+NGz+w1Jdh82G1uvJ5AodC0rS6gSN8PWo=
X-Gm-Gg: ASbGncservphSXe90Ko84bVt8f+4NLr/4IU+yvNgZmbeBgCoHxpoHjD4iKT00hpIUc0
 tqU2c4hmoj06Qy6WtQ0u+/N9/fSzlwjPUDF9SLrxnt0NxWhNJJpmafybDmlZ5+Zib1Vix7bf6V9
 L/HxEBUesjQHzxFzCX1ufBoRUz5A6CSwENmVaa4youLgPmQUqB2zy4MMLdxPFg6Vcek2jFNdUEI
 i9lP0Pu7M8rUeSw+E4bgrnq5ks4gHplXIQJQ6GkHcfFftsQTjii0ECmZ+8DgOTf0Px7OMGaDJ6W
 RNg92qbYvCnxvcNUgLew8LjvfIhGs8sohLJtIwhpf6AlrHWi353pdeSYf9A=
X-Received: by 2002:a05:600c:384c:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-4392497d1d9mr138833155e9.4.1739219574105; 
 Mon, 10 Feb 2025 12:32:54 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dca004esm153571025e9.13.2025.02.10.12.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 12:32:53 -0800 (PST)
Message-ID: <ad2548d0-962e-4a32-8ea2-0af4be45f008@linaro.org>
Date: Mon, 10 Feb 2025 21:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/smc91c111: Ignore attempt to pop from empty RX fifo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20250207151157.3151776-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250207151157.3151776-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: RcyGJis0eWVT

On 7/2/25 16:11, Peter Maydell wrote:
> The SMC91C111 includes an MMU Command register which permits
> the guest to remove entries from the RX FIFO. The datasheet
> does not specify what happens if the guest tries to do this
> when the FIFO is already empty; there are no status registers
> containing error bits which might be applicable.
> 
> Currently we don't guard at all against pop of an empty
> RX FIFO, with the result that we allow the guest to drive
> the rx_fifo_len index to negative values, which will cause
> smc91c111_receive() to write to the rx_fifo[] array out of
> bounds when we receive the next packet.
> 
> Instead ignore attempts to pop an empty RX FIFO.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 80337b66a8e7 ("NIC emulation for qemu arm-softmmu")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2780
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/smc91c111.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Patch queued, thanks.
