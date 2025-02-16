Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2598890njc;
        Sun, 16 Feb 2025 13:03:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsnVpOy8dzZMdUHPATa75EuHXCivRgHcHihdzg/H2NyIuxAopa/xg3rRfZwxllhei8us6a7SJcZtmYqA==@linaro.org
X-Google-Smtp-Source: AGHT+IEYylYTKTsmil/SlLQkZFcSpgBgi23snl4W5paSuma9Ka7x3Uk3HkTtGr0FDLlWU7kulcGZ
X-Received: by 2002:a05:622a:1a23:b0:471:a079:a500 with SMTP id d75a77b69052e-471dbe6d49fmr115554781cf.38.1739739839113;
        Sun, 16 Feb 2025 13:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739739839; cv=none;
        d=google.com; s=arc-20240605;
        b=IhDozzHYTLaH34o1pKsGeOoa7pTxPsBWWO4/H3VpbmzX0GDsyaY9eost0ggrIrUi0g
         h+LasHgYrzfte+PZ5C15YBQGgq0M+8ezQmNcgzkbrnyAHc4K8YJGoCPPh7gW3CJYFal9
         YFmriiCLvzYBF0T7h7IhgVJi56UkkTWGAP/7HTl4S6c97BDtmsvz+soQhOr8+4qi9CpJ
         SYR8gLe03BWRZYGij6m7JEvPJfahA3bY9m8EtxMfCZ30qOCQAHs9Bt893ItruURDMH33
         dj6MpARG5JoZqDraZhFHAblg8WLqh2+1k05uaan7Z+O5BgHw6dvMLK3xQAPXhabJ2yDs
         Nm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IeocgUDFSCXeJ49cGzVV1VW02kSLwEXMPC8k31YONFc=;
        fh=sVNHvgGQU5LMIpEr152GVdrdyz2IsL7Jzg61QCckELo=;
        b=Ew3aKQAbDkX4IAj/knOrHLR0f+8bxm7523D0pFcMxIbKi7qRPPOcXjxjiKeEv1gQK1
         tYR42DXG2p8eFx2z5FhvkMa3SvBRK2UUZnIj87N1mAUie0rxsOgnVdoBGVhxhEA69NqE
         o3ypQ50n5WItHqMhCDbVICvjfd2S/c2FMtbTfEhXaCf52e8lrd4NBRs+6JSGklWzgPfU
         Qy1XRZ36veFAzeKsO44bFpgAZVrDp8AY/FwKAA+nF+oI5akWGBv6q/KV4PaLbharRPKm
         88HdOV+/9+b0F46w5br/nKrzouAZSlxvk1QFesS0n/i4QaeufrCzPXjEz/A/aKDTzzFn
         ZauQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EC9Hlprg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c29f3302si77526651cf.81.2025.02.16.13.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2025 13:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EC9Hlprg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjlnp-0000eB-Al; Sun, 16 Feb 2025 16:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tjlnd-0000RH-HM
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 16:03:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tjlna-00080p-P4
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 16:03:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so24363365e9.3
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2025 13:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739739813; x=1740344613; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IeocgUDFSCXeJ49cGzVV1VW02kSLwEXMPC8k31YONFc=;
 b=EC9HlprgHYmlu8k4TvLh/IUKV51mcy/oNsFfJJ6QYcWnZxhIBHE03NAqgTHzNO7hCm
 r8hNMUD88qdye2IyRSFA9u+Xjv5/hUJRhd5sUcYIDTP8nUMtlp21HYDxkqjl39G6vRqx
 e+dHNhkH/6en6J7A/e7JTqvzfkblbJZ5FNVyobsOI/6Eu5yDxtSTuApJDhPp1JocSTDl
 lojOBvXrzr4ks1soWFADCX93cAuGaLufInnUSvbvsbVgtbmjxXN0awARRNWALZ2/TLZK
 NB6G2xmYtEz+NkoyPA13KGQ9pEI/10q/VS90BoDk3VhNM7fZGxk0Wh2SCKElS0Re78wV
 smBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739739813; x=1740344613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IeocgUDFSCXeJ49cGzVV1VW02kSLwEXMPC8k31YONFc=;
 b=AyDOES5/7PTS/BQlU2zkAnsy6ZH2x3NkXL7Yq/2JJ6fmiM77Opq5bvmXt6urofozjI
 ddD2XYxE4kWpCW7lUcsNdaSr2ZqAjk2uDSqrTGLp82uvZihbxIrmOm9NbfgwqQ2VyH/m
 qGBD/Zsoledv6B2BULQxaaf2ruu+tXqHoKVtxidfpC+4SsDYmPKvP8A4ijBlihNLBhpq
 yWbmyfuOG5m5mtAuDXzUgdRE4Y9Dv6f4kGebeIALLSdF5hwDtGDHvg3G9pUnQX3iqBgR
 BM4OdnQRvsmWA1QgFjTDB90OXwB++RoOXaIlPsGIWsTHn4BTP+v+BnwDCQsu6jd8cXRP
 92Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNRTC5OugBoNHKdgGHYxCPAQg7YVDQ3s0M5pzaQSZ09LeRWDh7UaHekVLhL/BBJGtg7HoIR6TQOA==@nongnu.org
X-Gm-Message-State: AOJu0Yznsn9ME/9HQbUgPb70Jit1/NsbUv6AOmgK3eNPABM2UekaeTno
 ZNW1MqlCOQtT2r7ATkF8Ib8jrooJKKJo0AQhtT8dYLTx28/IaqNlLlW4obEZEV8=
X-Gm-Gg: ASbGncstKkhGtmX5gx2dSxzkhYFwfI0nChZU/0c7BPHkM1mkL5TOEYuEMYfeBM9f1t5
 +lZCIs7ITphuDDwO09mQgA6u2iZ+r7NQhP6hsBDx1GIExMxkPcPcD9F+Nu86BICC5Fit+ZJLEAn
 Sphbem2r5IUN/slxTQI0UGWMvhkTj2IRgzo/MiFldiwVpvd6W5d5wUwsz0ZoJU+w6h3SvQ11cVO
 hMsbg/N4JtF+f4UXUj3D6GbrtkD4ILPtwa0NluOEuT+LY6cKPxOmRTi6PFt+J39r7nEf4ZgC01T
 5tiUZgFg7cQjt3neKDBKtsCf/AOl1LK8+KS64fi9ttFoz1fhyeWMg+1MvOeA7HLQ
X-Received: by 2002:a05:600c:46cf:b0:436:f3f6:9582 with SMTP id
 5b1f17b1804b1-4396e6b4cb1mr66810445e9.8.1739739813127; 
 Sun, 16 Feb 2025 13:03:33 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06e309sm134006185e9.24.2025.02.16.13.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 13:03:31 -0800 (PST)
Message-ID: <cd6878c1-805e-47ce-a659-64b6bb51c0e2@linaro.org>
Date: Sun, 16 Feb 2025 22:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] hw: More DEVICE_ [NATIVE -> LITTLE] _ENDIAN
 conversions
To: qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-arm@nongnu.org, Aleksandar Rikalo <arikalo@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20250212113938.38692-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250212113938.38692-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: +pBj/YTt98dS

On 12/2/25 12:39, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (5):
>    hw/arm: Mark Allwinner Technology devices as little-endian
>    hw/mips: Mark Boston machine devices as little-endian
>    hw/mips: Mark Loonson3 Virt machine devices as little-endian
>    hw/pci-host: Mark versatile regions as little-endian

Series queued, thanks.
