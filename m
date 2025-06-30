Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2334514dye;
        Mon, 30 Jun 2025 01:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW++umJvQCkD7DcLB+PJ5yqV45NvirXSHTI3q5RVapRDhH2e2j/KUxsOo6wxaEBcqNnUg24smiR0QdwOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH4kaWgSBIDnzyhXkcQDxb97uO9pA+DEcMiVub0RtP9Dv047HgxWk9WFMQ/sUKhnMz3gc/a
X-Received: by 2002:a05:622a:19a9:b0:4a7:1402:3b1 with SMTP id d75a77b69052e-4a7fc9d42e0mr210783091cf.11.1751273993485;
        Mon, 30 Jun 2025 01:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751273993; cv=none;
        d=google.com; s=arc-20240605;
        b=V/E7j5156xHycmiGOqCOQy7yWCSFsHSr1nHxzirJX4KjBbjUS/p2dPro9l6/Sh2xOG
         D8Fd2lJwG0Uj0PqySUoDnkXZLEFP87a9FPyY8egzEkV58IR28YhouHgkZ9wilY+dQACJ
         s1hcfUgFfEkkJYz3t5yuTHzmAPsKCQXC/Zd/2ajiow+o13Hybr6xU/2ymgRyNs0lXHKO
         0WQ44LOY5BFYDc6n1rQN4Elmj8zhqibBFe1MlMF44K+dVkS9CX5i2khhihQRic/SBCh3
         5LXR12Pd7uQL3qsErNi4maOHs8YA3GL3ETxIxm2aSECUn4QRbgBNpoCrs5l2INNbFK0D
         1dNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w+A3+IebsMaAPwZvp7nKuPH6W45hRJN6sDur+FFmVCk=;
        fh=PWQC65EPqUgmGCYImyO25vXVe8DsQuCCAdw/Joo8ca4=;
        b=Xq+m+HpRNlANRWw0AOFyUbZ5AmmnV3vb/lqCrK+UapGesmsqryAh4wqHAXy1Z5BrL1
         9YbLnrcT9mEC3Bnu4Il+JbN/bExTNAQOvS/DD+A1douj/YqlBjouBngb3gP98xuWUh31
         O0oyVKfStZRrsS8Wxr3zmkyCJsKrQErzMgxdmaVIOTuaYbhj/bcF8H4PrnXEijSuonsF
         W1nSgheJFDIgi1p9iWVTPGySTsAJFXJp9hjLf73FmITQRlbC+F4z+kdaarJnMypFz+iY
         NQMo9FA2z3OIc1Yhc9yInT2Z8XcrdLdzZ4vzCqSYEC+koakaXmj4ahsN4ZR3DJ2vuA7M
         Hxsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMN06SPx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc57d8b7si83536151cf.671.2025.06.30.01.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 01:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMN06SPx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWAML-0006Nk-Qt; Mon, 30 Jun 2025 04:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWAMJ-0006KL-OR
 for qemu-devel@nongnu.org; Mon, 30 Jun 2025 04:59:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWAMI-0006cE-0k
 for qemu-devel@nongnu.org; Mon, 30 Jun 2025 04:59:27 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so2668759f8f.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jun 2025 01:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751273964; x=1751878764; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+A3+IebsMaAPwZvp7nKuPH6W45hRJN6sDur+FFmVCk=;
 b=GMN06SPxg94S/W+TBT23538Mo6UMiTpy8c9aYBpn9eDWgNuB5FWT+37EW3yEoiWWCi
 l1eNiRg2NXUTvOw9qsCcIh/mc1QfsYJbwJ/5PstFyYwMik52JZDo8zgJJgKcWXavI8ul
 CpY2Bp9oHLjX4w5dBrVJpDKOWcEI0b7w/wqA1asrnoWEEJTYQP3bbc3Y8e0mH04cWcXX
 AGeDMigu9kma6p7iL7ya8g0xNNszZEXQ+a+a6a6KDn3esLHG7S72Aadky9tIlexZIftH
 2nEaUuFiWzv1caAgKkKgQCZfQ5toEOm5n3nEMT52HA53dhsLKbHY5kYuz147RK2ko83A
 2hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751273964; x=1751878764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+A3+IebsMaAPwZvp7nKuPH6W45hRJN6sDur+FFmVCk=;
 b=GEujNAQ+yRBWZuzjLilVypFS7+p/+bJRSjOuVmqNPQ6FsbzFV9BRB5FrHxU2ZxugeF
 XUM0eviYUuF2ZzU9lgYrxSGtd5OYmxGeOeNxB+q5VWA89TvN5f/CkRsUWbOtkCjiy7kd
 9c0fPnDYvBwljsdv064Nwoc6/454lh4AlEILXXuYzKNUv8pAjX+o27ypnQBJYumCvdTI
 2JlCg3bybSx7TUsjeaF07bd7Sgk5MbF6seAy/OB/sTxnK9swNh+kyB9LP2LC801tNDSL
 X71tDPun0AXHMrjosDcr9OBTL+zglouW/kM+h47ttM1PkYcqXcxkEVIgiOJ+We5afXrL
 6kFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfxtk0wEO3iaOmnWClQISm9vNzAnHxBya84IG/bATuQ7vZ2o3B8p62JekjChTNj+stsE3hUUOVMwjU@nongnu.org
X-Gm-Message-State: AOJu0YwRxweLc/uxHw/2MT6VpJ4hI7SXxnQ9yZlSG+HExZaoG/HHs4Eb
 pQZ/8cHgn5cNc4yg8anTMnjIwhi1OM5n0AgG6KpmoeJzMm1F4SX4tU5llV5psquaER0=
X-Gm-Gg: ASbGnctlq0fkp/odM8EgNJT5OYQeiAGbwrLj+qsGDJ7sjlrtiJFZJE3R+S3ohNYYUgS
 R8MGAWSW9MNYxcKWJWVysg5uAkpyaiGQlMYNmRd+60t/OKjW/BtStMyzF5cpuT226P91xNPg9YT
 wh74JZCF8SnVKzTGWxrHvKA3vWWIHyUMUOuH5ozdzcUrGfEqDKJzRV1CZHzMtT76VYAiw0sX11H
 FLkwlfBum1WFx1j3VmWwAVGkWbHw7TwDF+kwan3ih3/xZKOgaSog1LVy8+Ih+/BtM36wc/3M7D8
 WdKa/wfO4VwwYRupoCqnO5Sozl4AMGYBeO7gHb5gWVRMutqhcCvsRH07C6z0UAZB/Um71I0oRKE
 XWpEWeKvWmFqxh2vwNmsPGhuZ6VFSjA==
X-Received: by 2002:a05:6000:2a88:b0:3a4:f663:acb9 with SMTP id
 ffacd0b85a97d-3a8fdb2aee4mr8787145f8f.9.1751273964018; 
 Mon, 30 Jun 2025 01:59:24 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390d11sm130380765e9.7.2025.06.30.01.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:59:23 -0700 (PDT)
Message-ID: <4c966437-91b4-4c07-a07e-1a54f51329fe@linaro.org>
Date: Mon, 30 Jun 2025 10:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm/fsl-imx8mp: Wire VIRQ and VFIQ
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250629204851.1778-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: qMPeNJKD8gRL

On 29/6/25 22:48, Bernhard Beschow wrote:
> Allows to run KVM guests inside the imx8mp-evk machine.
> 
> Fixes: a4eefc69b237 ("hw/arm: Add i.MX 8M Plus EVK board")
> CC: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/fsl-imx8mp.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

