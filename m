Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp47300njb;
        Fri, 6 Sep 2024 04:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCkDrwiCeTQ9iqauoYdbg1WB/lxYT0mRLgP+E0NuHqSz8RY1prbtojrqJ9S4CSQnr7/tSQA3vslESq3A==@linaro.org
X-Google-Smtp-Source: AGHT+IESHY8ukNcASFdseVmp9yZMeORc1YoP9/8fS1KTZRQngJohUqcwt9L7pcQoX4qjFt0tSQsV
X-Received: by 2002:a05:690c:350a:b0:6b2:7ff8:ca1 with SMTP id 00721157ae682-6db4515443dmr26631287b3.22.1725623620078;
        Fri, 06 Sep 2024 04:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725623620; cv=none;
        d=google.com; s=arc-20240605;
        b=U4XEgsZTUmXM3aKkPR87IN2RQh07pvUYg3drao1YOab0rCzc9yDEQyoxccSFckqWaD
         XSrKLPVPNzxz7tPbU/vIeCsZWyGuY2ZDsx5Wa2gSGqDY83uuSshBxAMSohqDIzkio8BT
         LHJcQLGNT3tKFckmx83we0BC2qTt+AWjgdd+xeOZfHQOzypYUQ7Dm+ECrUCK2mvAICW1
         v6HF3hDB3sFWb0LKOMnszlZ4pTPTaofFV9ldcSJTHR8EZLLzuD+wfB15v2P+6MSQHPfj
         81aXVHl6YKbDgOYWj4AkcXkof37oa3lLFsuPv4vdT85ItSqruTbABx0qTghwQ6WVid29
         Dp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2tKmW5gOZezfkPf6H5O6iVC54IjBwBT81yUC/ENPlNE=;
        fh=WezTar76MRiMZDeKg4TAidzyswwNYSf/r1YvcRHlekc=;
        b=iLLyMth8dfa5WnUhtuCHNl/8V9KYvkZDJTnEW9GQq8GzD4Q4SCQ/9fEdn8Mow7JwqC
         hsNuO13GMqX+p+7OjnEEkwY98zO+GM2sj5CJIgvfGQIwIrwU9UNDW0Yt8KUm2jdROqQQ
         sZ2IBlmmT1DF+43fU4k221MU1bAEtXUIWMyMbGig7Kxwy+Pl/6oTA8SE2GiAzbBu5k0K
         +233YRVlZfWuv2QO5b6ZVNOykEmMgy50L3Vl03I6gsCFMNyoti+kgSdVbY31NcdwQCNs
         Xlb7Pack/ZrVlcutic8xyiBXD4fNi2ty4F1pbWNRu4NhFA3qjvcBgiOdL1SQs7cApzQU
         v8Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OImhnmS0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a101caf6si13612885a.16.2024.09.06.04.53.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 04:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OImhnmS0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smXWs-0007G6-QV; Fri, 06 Sep 2024 07:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smXWm-0006q6-Bm
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 07:53:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smXWj-00077Y-QR
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 07:53:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso288332166b.0
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2024 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725623599; x=1726228399; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2tKmW5gOZezfkPf6H5O6iVC54IjBwBT81yUC/ENPlNE=;
 b=OImhnmS0oe/4J6wXj3lN5jnJCiMrJwNyrOfWp3GGlj0oieSIk7VxHmS6JfUclouvSY
 J1kWR9NFElQIp8uhlsfONtxDyCHuU0OYR8+zQa4NhE9j55z0UKeJvnTgVmMKycPlWv7N
 nLpfrHgfPZD1w7L2hTn/SFGh61IBeivDGOZr7uahspdYbMaLDaUVG5ZFjmieX57pf1+S
 pK7UOewhT7cp6nXXyANW4U8S20JyytbWLqRIiKw+6OJUlXfPbjRbNNZqlG4ZxgNrqWiD
 izDH5S5ur7+jao8HlZW/g9dqoFFIzI884a8W72ai7WXK7AhzLeOedUIMEwHmIrEWww3A
 IWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725623599; x=1726228399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2tKmW5gOZezfkPf6H5O6iVC54IjBwBT81yUC/ENPlNE=;
 b=PvlLgMiVwFndoZ40OCesIpj/Qv9QEoQWjl/BhyGRk/ZQgt/tD5J/Dl9YLUp9uDHMrk
 fUa1dJLYd14p5IGlo6RB5UyUa3ZHhHmAG5o2hSJ0PiMoh873pbbFByjgQ2Zh4UiSa41g
 dHHs9UrK51nP4VcZ6AFoaii4a7+CkXfVSuKaqh0kXvXBd1XX3cNjkbQqfJTeO4v7g0eV
 uGWHFHTBh2ylvuQEeWFGhDmt0kM1BNyi4q5lB4uyLQUGnxygmu02Cio0c0+CRq5UozAD
 3UQcFULetbp6h1qkRGyqkzVZKNNK1C+ADsVu07a1ZSq+Uk63pqTcPE9wy4rRWqucb/TO
 Sgkw==
X-Gm-Message-State: AOJu0Yzifa4YV7GJkRIyBI64rYb1Si/QSknLzqyzZT7K8YWsjK98QkjE
 ZJ102fF1dRYLSlj/yh9uH3WG27XD/dX+lawCKnbNnrvbHsM4AZF47+M0atQSbcQ=
X-Received: by 2002:a17:906:4789:b0:a80:9c1b:554f with SMTP id
 a640c23a62f3a-a8a86442be2mr289007266b.27.1725623599156; 
 Fri, 06 Sep 2024 04:53:19 -0700 (PDT)
Received: from [192.168.55.118] ([80.215.236.92])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d61csm265884166b.125.2024.09.06.04.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 04:53:18 -0700 (PDT)
Message-ID: <0fa93707-d092-4db5-a4a4-f000df881ccd@linaro.org>
Date: Fri, 6 Sep 2024 13:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 01/24] fifo32: add peek function
To: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr,
 alistair@alistair23.me, thuth@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, lvivier@redhat.com
References: <20240827064529.1246786-1-tavip@google.com>
 <20240827064529.1246786-2-tavip@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240827064529.1246786-2-tavip@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 1b0CrvFY5xCX

Hi Octavian,

On 27/8/24 08:45, Octavian Purdila wrote:
> Add fifo32_peek() that returns the first element from the queue
> without popping it.
> 
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>   include/qemu/fifo32.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/include/qemu/fifo32.h b/include/qemu/fifo32.h
> index 4e9fd1b5ef..77aab488ae 100644
> --- a/include/qemu/fifo32.h
> +++ b/include/qemu/fifo32.h
> @@ -140,6 +140,34 @@ static inline uint32_t fifo32_pop(Fifo32 *fifo)
>       return ret;
>   }
>   
> +/**
> + * fifo32_peek:
> + * @fifo: fifo to peek at
> + *
> + * Returns the value from the FIFO's head without poping it. Behaviour
> + * is undefined if the FIFO is empty. Clients are responsible for
> + * checking for emptiness using fifo32_is_empty().
> + *
> + * Returns: the value from the FIFO's head
> + */
> +
> +static inline uint32_t fifo32_peek(Fifo32 *fifo)

When respinning on top of Mark's Fifo8 work, please un-inline.

