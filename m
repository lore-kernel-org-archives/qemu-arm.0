Received: by 2002:a05:7022:6382:b0:8b:e46e:3391 with SMTP id q2csp740609dlq;
        Fri, 4 Oct 2024 23:14:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVY7O6Aoc9wzmWeEqY6t1erR/U0lrzw4dAqasRTGNkZw2SNqSW/9mRj0HF2GIlB5l7VQO9drXjmxhxzCA==@linaro.org
X-Google-Smtp-Source: AGHT+IFlqIbijQ2qdQL0XDTRzNK2SaYsCzp2R04PJW2Fz7yK4ijaYcETwDMAtzanObi6knz1gpzP
X-Received: by 2002:a05:6214:4885:b0:6cb:7d35:5e31 with SMTP id 6a1803df08f44-6cb9a45caadmr62872546d6.20.1728108878150;
        Fri, 04 Oct 2024 23:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728108878; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5A2RvNvqtwcnJVInSKQXjmvVaMFVdC/F+VXnukuyieiFNmPwGcCwx/hbKLWpsP4B0
         fMQL17m8A/0ENJfnZkQdVhw6wAh83otNOCxds6D18J4DQiAdYCP0IQ1Au6N79/jwEaT1
         8i8w68Qx93B1gwQ0mbBAdc18WxmXOXbV1asdDAwSYDQyQMe7N/36qJRr1zCKuO+3SX2Q
         6rd0C/VK8bBc5Hg8tPtoRu70/GvB3gj+4D1jCfVt3ExusImQv1tyup6TXNMOkzZPf8qa
         H6xn5/23ihkkJPhlXy4NmCSWRi1cg1xkfV4yhhzQUzRQAuvbB93HczJj/nQKrTRNCFAm
         D+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oucCD6GmvM1AxZvz00WRd/F6EZ16LhJ5WCAB0EFZax8=;
        fh=3DjTSSIoIV9MnBQ7g6tQLY9SGwE8w9px537eQk3+5DA=;
        b=St8pO3NclFgOc2VlrQqoLk27WWRxVgxA5LQfXkWvQvIVuf6amyAamKAt/FAqsjQNaa
         3o3mWko19bnRNbNtjUjp3zNntxVrjM4RVTnFGMIWv61dokl8G6vMXbmyOz1Xh3KzFroB
         /0t5kbnXarstPzegjQBWaDSfmv8PCJ/u+mzBk69a9QXrjo1DshdXJqPqJ+liqeGt66+/
         6xD19pI9err/ST6Ml6jgOwm/dfB4n+8OHRMofoJEfllkYx8MMS25oTl7+oM1spxiDc7n
         X9fxFfMxr5Gg33O4pCwt0SDB86j3WdVY/qMMZoa1LOPuYrKOfgQ11eDZ4Rxucf9b5YwY
         XQfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UKONea8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba46e887esi14706516d6.153.2024.10.04.23.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 23:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UKONea8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swy3m-0002AD-R5; Sat, 05 Oct 2024 02:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy3b-0001y3-Ov
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 02:14:24 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy3Z-00019N-AB
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 02:14:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-71dc4451fffso2826392b3a.2
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728108860; x=1728713660;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oucCD6GmvM1AxZvz00WRd/F6EZ16LhJ5WCAB0EFZax8=;
 b=UKONea8f94iRc7xRis5UO5Mhc50Lq0Ci7AAORzMIJqmFvR4Sj831btTEnsaorDGF17
 FFv5MslE/AWmwMGdVsiFZwsL6jPUXXObjbhvpubYHaAidvWyb90Eq5N55+JsxVwDUpjm
 xN7YLrr8LFA7CxZgOMBsQjIff7YPL+Rh7rwT29qKf+e80U9OKISE2lS+RT4A60h7H55S
 SnqWfuzhfIB8EO9U3fb+JspPrSYRJoTtnPm1ZnMhM4U/6x2uFS6b/UQd1E8sHFEkx5+s
 7QKzP0hiRKFz5Uusy/ihuxzwQMgXQuo3WLVYCWqyFBwnF49Y4w29Yibs6Nf2hbAvYn1e
 ygNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728108860; x=1728713660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oucCD6GmvM1AxZvz00WRd/F6EZ16LhJ5WCAB0EFZax8=;
 b=YAxlUrUnD6euWWAlaF/yoWJN5RgoU/E3nFU2fLV13wSf+M4jPuo0JQlJM9RvH9yw1F
 HVjPxhkXUr741p0wDH2Fag4vhsjZu3SPw9s/b+vyHmupe5CiNpNJMhU6Ov3kyL8gKAl6
 jKGHs9bl+Fw19eqZJMOk85azyZTX2M0nGqFnFeuU181csWbllNaSJXFtRPxG/R0itKoh
 gIF2cj+TltxkUBrLaya8kfK+wRTxKkix9dXQXi3OqEasklmDrkCbvsh8HybsDsyzzxJ7
 poQjcKV9tE93VnxUD5vJSke2/fzgpeeBgMDkMaCZ6G/otFyEsgaTh3RJ1N/etGrR4RGk
 wvMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuat/ruCjGztWIJdR5k+ZO6ICL11OaqU9ub3v/E+rS2etOcrI14dTxhw0OeHCViIY0kYFbHHeaJg==@nongnu.org
X-Gm-Message-State: AOJu0YxwySU9Izsx4S09jDNe9b5unj7jJEi8U8W9OENLsBVxERXCtlTb
 vB3P+CblYJZ/wbCye+WlyF5KUHVsaW3q9sBsON4TrMcz27eWqf2PudUdQ3KuTqs=
X-Received: by 2002:a05:6a00:3c83:b0:717:8ee0:4ea1 with SMTP id
 d2e1a72fcca58-71de22e8399mr9376019b3a.0.1728108859995; 
 Fri, 04 Oct 2024 23:14:19 -0700 (PDT)
Received: from [157.82.202.230] ([157.82.202.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d69246sm834048b3a.182.2024.10.04.23.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 23:14:19 -0700 (PDT)
Message-ID: <a67552fd-f304-468b-bffa-9d2a98ce5a5e@daynix.com>
Date: Sat, 5 Oct 2024 15:14:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] hvf: arm: Ignore writes to CNTP_CTL_EL0
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-9-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-9-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6KssmzMvjRjs

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> MacOS unconditionally disables interrupts of the physical timer on boot
> and then continues to use the virtual one. We don't really want to support
> a full physical timer emulation, so let's just ignore those writes.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
