Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1830485njb;
        Thu, 6 Feb 2025 13:40:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjqmHIc5UK/nyhavocf5m3Po2btgqIVQEi5ESv2u7xly5gHOx2SgIEHviOJVaKubLYYrv02aBc24fGAw==@linaro.org
X-Google-Smtp-Source: AGHT+IE/9momtTGWI9504DvjeIjChE0XpRgAvOskM3bGVguRZBHUZcuwuiRlCb2kiwGC6y+uX+12
X-Received: by 2002:a05:6214:da6:b0:6e1:a51d:e96f with SMTP id 6a1803df08f44-6e4455d8764mr10380206d6.8.1738878027132;
        Thu, 06 Feb 2025 13:40:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738878027; cv=none;
        d=google.com; s=arc-20240605;
        b=Gtodmvjp/cTDzY8thuhEDvL+xtNqvRALivxyMI9n1lzYd1qh08Ct9BsNWkJBUnjCLr
         n4keqP1ccwXKmn7GamCoNX/5Dp8IVLtrwzqQioEaVJ1toVHNnmS/SSfkojTHIzu+fQO2
         2pOrGeW3/ikgpnYVZfd+LZhOcuBEEmVXcX5yIuNvKg+ocfRBYlOE9ajN82jzecRN+jaM
         WzPXQElss95E8yky6vkMa6cUEg49JW3u2JEH4A/vvg64e+YUqhrs1z0DuIqGHKBksPEe
         3mh5dACI4b7q4GRlwwp/Jccurq/BHXRy6BsNlLIyXOMuysQrqIXD7Tv3yicfqS7IL2Ri
         OXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9FOVl0qr0vk2SnInYf1fGjI43YtY9Sb1L/XnT0IhLC8=;
        fh=lG4uOo7HHznH7LnHMifFAOXqgoMih69KksUkvJaWgIA=;
        b=fL7Roa4oNXLYkELwQr+xZ1CCXGpQ5mCou4FalRrFW7lBVCh2WYrbXKteOpNm8mDm8r
         hsybkfl11pWFTq4WcLTEiB9ST/q8qfkJmlJpdEexxK5mFPefr30n2L0CyLBkJmGOe+Jg
         zVn2vIbmu8yJ+0E9RVGi2YoMO6Q1K60n9mvyDD/OU14zl5Lw7kuK5vqhfHzJMJI96Ji8
         m6AcGdpB+ZPyQh9NMvKSpnGZC3qfIMsKFEt73lSbi1lGr84wp6i0NyaEmq6xJXd4YvAd
         p/dBAXliNdQIZitpV/C32wPtIgZczr406wubLcPOmkQVJ5pVb3Dkaa+95+1+TcKaZuJT
         5fSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bE/FNfvB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba36c07si18425756d6.108.2025.02.06.13.40.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 13:40:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bE/FNfvB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg9bV-00032y-8S; Thu, 06 Feb 2025 16:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg9bS-00031H-Pi
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 16:40:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg9bQ-0000V3-Rq
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 16:40:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2f9da2a7004so2248913a91.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 13:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738878002; x=1739482802; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9FOVl0qr0vk2SnInYf1fGjI43YtY9Sb1L/XnT0IhLC8=;
 b=bE/FNfvBg8qvejs5qx0ErVPqbuFYAPj+87smqTyuo3Qfh9DdOJOm8TMzuxc6QXseCP
 6yLui80HSqOMdUiJUOWv+fYbAisw7+NKEkaHyIGHm9GBiiog7u87RXnjBnUumqKWByZY
 0qa04x74pITmk+agBdFCDstVdiw1vgLjmQLwRxIaz7fZ4zR2U+c/DO+03jBHAhMvHmfB
 HX9PxsAoeKd7LLcBIj2baD0XAybS6Tvn884gCBzrrAnKMJCRZm/FpxNh+xDaKNTuqVYX
 e5WNLMBvhsTzRzn+thnIjRktbgSov0/xQ8ie9adWZqA51cXyia6CbiiD+47bd0NfHJX9
 3ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738878002; x=1739482802;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9FOVl0qr0vk2SnInYf1fGjI43YtY9Sb1L/XnT0IhLC8=;
 b=prvYouxKyJ2dQ/VjwPUg5fuv3YypyRt9yjJk7KfKJhY9J85OVQU+5HULhgI4rhcJM1
 TAXjA7fFKxDgundS8evyVEyCQIX3UZydIFrTgO6ULFRHuRt+XCpi/y4V4mrlULj+6DCt
 4tZPVUbX81/SlHiNgot8zbVMvURAQowGczfzkAUImp8ljnCuGCL1sEZ9jp1SN53jBsYA
 tBoNcRfNqxQUoHHOTvFSep0+vuWnL6AS6zjb3WP4PAM7etWJ5sWN4wVUKaGcnmW/Z2f7
 xBxPqUCNYqbxC/fVqok2Uuby0b8qq22x2BF+fds9iRcIlMokcSJpnGwlyhS7KB5T0g9W
 o1xQ==
X-Gm-Message-State: AOJu0Yxx+l+OZkdscQ4QgPvF9aat6H7gDxtPWSeqiP7G1xjvdhJNNG6N
 kj77GSv7ka+bPt7t0a37S7hQ5ZOfH44uuaMUDnXUG2QXqm6562zC08sfEaOSMIU=
X-Gm-Gg: ASbGncukBOPd1dkfKeo526huVg4CSPFFOzbBH8pavKENV3KP1/exQL3mdCN3R7XopQt
 1Pd9RQN01PJ6Ttbi76/VUBnrSpEfJPnxwg4qCjDnWnAkXqTprf1eRr2jipAa73AyCAro9/OHLb/
 zCezWuWXAyJHVGzEwc22dXxgrjmJQd+K/n22j35lcno0yRgWGflZXTPi9I9sKH+kckkP2hx1OY5
 l37wmQFX0eFD3rxKBePXt93fHEsaDfQRw6LyOm6S+CAPnB3YSf/oFai6G/csawUWkZAfruSmehx
 5v1JdW9kKf/IFPsJVKbBYG/RLVPA7GKYUHWRwU6r0EELgcMWosNfzVA=
X-Received: by 2002:a05:6a00:1d25:b0:727:64c8:2c44 with SMTP id
 d2e1a72fcca58-7305d4ec73emr1332991b3a.19.1738878002568; 
 Thu, 06 Feb 2025 13:40:02 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048ad27afsm1753796b3a.43.2025.02.06.13.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 13:40:02 -0800 (PST)
Message-ID: <5671c7da-324a-472e-a8ca-b6a1a9ea769a@linaro.org>
Date: Thu, 6 Feb 2025 13:40:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] tests/functional: Remove sleep() kludges from
 microblaze tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250206131052.30207-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: BoIRI02lSxdp

On 2/6/25 05:10, Philippe Mathieu-Daudé wrote:
> Commit f0ec14c78c4 ("tests/avocado: Fix console data loss") fixed
> QEMUMachine's problem with console, we don't need to use the sleep()
> kludges.
> 
> Suggested-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/functional/test_microblazeel_s3adsp1800.py | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
