Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp310130njb;
        Tue, 4 Feb 2025 08:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXi4WUHkOX3b4sdVCdkhy6bJROzHNLsyxxJwJuFVUgpOEIGK4Mo3WwwRaHuDwjLlyvWjgp1B3w6w+3cA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0WPs5QVxqDzcH3TxGuErPXlnyhc7UPOd3aMwhQv3otOlj2utJ08o6dKE82MqejtOBMJ+A
X-Received: by 2002:a05:6214:242f:b0:6e1:7b35:a0d5 with SMTP id 6a1803df08f44-6e243b909b1mr420662776d6.7.1738685063737;
        Tue, 04 Feb 2025 08:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738685063; cv=none;
        d=google.com; s=arc-20240605;
        b=AFDNOZlBv+gduNn+f/rrgau8jcEK6NmU6flUaszVpPa72cAcDCQaDuqBA8jDacNmih
         xUn+MLgCv66fbst3U7TnfpmDQQ0XhikXTEghjjIHvV0+F6qoraHqRdLZBhD1h5YRoVvD
         RDYgoP8NJ+JHZwprZ1pDdpf6/OtTG6c1PmiU5FI3mAfaxeAHJNOUTJWAk8mqIpjsv8h0
         2/+H0B14S2dy3cGdjGdHxAu4C2tB+EmRfo3kTHufR7Ll7GdELx0RLDi7BhKZE1KdWhSF
         YBcQLL35RZ/mSfnXOYSAvYGu8K+wxIMQighSRikZCxzGeM3mB1Ms8Uw2pLMr876MpYL+
         I8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BZgFwqNHFMpqZkhlnVMdmPCfAbdtWvVTXyS6HvGZ3+g=;
        fh=OFRdQbieUlU0MQxTIBk/ApDpl2qoid8JE7Cs0GdTsaY=;
        b=OJOAbssmPzE9xq4umGUqflH4WAtKwviLwg20Q9TjqBys4RmO2LOtax3mt41JKZaV5Z
         3KXzhCCm+K9WMe1drhYmQNt7+VRR27GB/wJkKrF0HzFD7NT+OekigK80zrf/yE5fPiLo
         CMvtxf/DS65cVGAzDvUVjIqIPoTsI0UV3CMw9Ph1ELi5KAb/oyAkKz24236XrNugedzN
         gRvsHFzUsKyI+4qKI2y2UgC6bzOTQXcVU1r4FSHw36ZjRzs34C3GZIxsshzP4SMGG2Cz
         pgLaAhq7wugAf/NVzLPHRHTIbRUHtG9dDOlI25YnF8CrvZGRZRZ0ye02lygTghUeHQxe
         4aow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HMdHPn74;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e41fec607bsi29476646d6.321.2025.02.04.08.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HMdHPn74;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfLPC-0005lD-A1; Tue, 04 Feb 2025 11:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLP7-0005eq-Ke
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 11:04:02 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLP6-0003b7-0W
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 11:04:01 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso5166496276.1
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738685036; x=1739289836; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BZgFwqNHFMpqZkhlnVMdmPCfAbdtWvVTXyS6HvGZ3+g=;
 b=HMdHPn743dbtaQRVxKO8tHivyJPLX4CiWt9zYriRxhH4jHjuwRLJ/s7R6x/e2ZycTl
 0ixG8//71JtyXjAm8PAUuWHLmu2jz35EtGYdBIJ25hvyqqItJW2BUEYi/WYcWWy3DA5Y
 Y1B74uT2zq7uqHLBlh2mkF5/eZ1pdCBNo9lW5nzLwuHfYS+K76GEZMq5pnDDbX+N9B8S
 3A3pqU/kx3f84y9PwtplQkKcHY65bcapSEoF+n6UkEpDAE6r7zxQrxEvGoTDvIsDCpIt
 tOZcIm+vksmZQTlDweBk8LM1NQv2Ny+AFfU/5VhvmQD15wWT2kOZGGPzqcJvg6+ZUUC9
 bVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685036; x=1739289836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BZgFwqNHFMpqZkhlnVMdmPCfAbdtWvVTXyS6HvGZ3+g=;
 b=S7ujpwaspomgmTzsyiH4GXRzdXXwnyRlJhcS+jCtmiX8LnR0uQFvEvLw4DR8oHBOUw
 OGC2NhoXFd2zyaqlvoLLifzNy/tqmDJvOut4k59WXjtUbuVJaHSoOoDmUNUcV/76FcPS
 EUD6UChas2j3cPDEUxpuansjDC/8CBEh/+HoeXIGMd/B+zlP8Q7wk21RZhUHMf7h26tx
 /CVOD6OkT7ybKNk+53RPqMVk8YNRrtf3SrOrLfg7ANC6xXMZhA9FqBo4rV2RMm7G/SmI
 bu+xcpULhl4QY8zENZE1KtHlSgEhUEyakOeScuHLukoLXvj7IghA0KpBATRtKqiH61cD
 Riew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVba8/3pwUso8E/g6yl9aqCckvlaMXmKBcWDjY8j8s7Q3htYC3HM5/RffTSM6KZ70FCAPtOVbund43I@nongnu.org
X-Gm-Message-State: AOJu0YwcINausj/VzGGq6Tufmao8gemDYvSH/ykCnKxoOGVATszeLLjn
 KVz4JubfIjnjUJiXjRp/Z72girIpftYJUSGFSVXAqSF4f3jelZKkWHhZ7RF1leADIvZjFJ4cFjK
 qlxoXlJkoDdb697jOP/ZpxBej77jVlrShcFqRU5NXYEOsnq0b
X-Gm-Gg: ASbGncu21d9BGMbzQYLdXeD5r/+8Oad5tsiBu2xyf33TUJcUbxxG9ejJGt4d3RGEQaU
 HVgF9v3UGy44zeU9WzXTp/+edV10E+PSsUn97g1sj92bXf+LFXVuaOKq5KzxUwGsFj/UiiDK/1A
 ==
X-Received: by 2002:a05:6902:1025:b0:e58:2e75:9f6d with SMTP id
 3f1490d57ef6-e58a4bc46a8mr19590446276.31.1738685035857; Tue, 04 Feb 2025
 08:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-13-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-13-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:03:44 +0000
X-Gm-Features: AWEUYZnLr0gYW3uxhUHnEh1EvQBCy-fLMmQC9ATIjcq1zsb0cPd5gQOr6bDNjJk
Message-ID: <CAFEAcA-s+jvKrypP6W8WUJdaosRgWCnZJaB8t=7Urh7nSFVn0g@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] hw/misc: Move NPCM7XX CLK to NPCM CLK
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SR9YkLkNeCtO

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> A lot of NPCM7XX and NPCM8XX CLK modules share the same code,
> this commit moves the NPCM7XX CLK to NPCM CLK for these
> properties.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
