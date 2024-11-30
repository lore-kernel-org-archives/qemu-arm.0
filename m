Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1308583njk;
        Fri, 29 Nov 2024 22:19:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU18AlfY0iHoY4XNVOw0ffHvAaYe1/p/JHHZku5YmQnWNd003GwQvZtJwDVirpanJnuVSySr6Efiqx3dw==@linaro.org
X-Google-Smtp-Source: AGHT+IGhC1Tas/rZNlS5u2m+dl/YL/VgNKXFse/F2S0jmHDzebtVWSnTXc7vOlmNFrK8IfoqKSuh
X-Received: by 2002:a05:622a:250:b0:466:9ab3:c2d0 with SMTP id d75a77b69052e-466b3654159mr209200541cf.44.1732947566150;
        Fri, 29 Nov 2024 22:19:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947566; cv=none;
        d=google.com; s=arc-20240605;
        b=DuRUh+0pH8SFo8cbzA22FUJx8BBcKP7bKRuB0w7aBp0qjyIYCyumWeHBagPrx7GqKn
         QY3JlaYjq8ruLb/42z91AlpwouWTQ2zaFi9LzDm0eRoqnEJlUdGMPyJjOw+qMHpGS7Mg
         BaeFAhgKdhS9/a/rFxJ6jn7+ZU0loMKL+O/lJOz0m4EtODeLYgXU7k0Bk51btmVSDtnp
         3Fi9+okATO+p1JmHCTO1eg6vCcZSCwxkmrne70Mjfi8e1tVGOL2IXb2+dQRgIAF4WH1Q
         oSMJL1a/gywvveIQXc2OoouwNbschCqL+kNnJuu7R4G5bq0/KvsegrAnXl+LV9QmnR9l
         MvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F7eEVoPnO2WKUyPFuL4ubctiQXe1HKtwH5FMNFuU+30=;
        fh=XxpW1CZungO98kc5Ah71FNXSuJuqsdOAQenO+AScliw=;
        b=Nwg/DJYDC1rkzLGA8OEIoq/yKxL4nSlwMvh2dnCyfwcvgPYqWp/DZgipL85Y1qz6Wp
         FdZ35nRez2cAXccwxXwN4J/BZWafbPuUhGB1m6t7R6JKfR/MMeWkOf2BxD6q0Iqeug2a
         y3HRtxkdxd+yEV2RlKleJ/o/JlHzZwOgt0DXZJrHiTbK82T1mNmt5XJdVHbAHcJIZZ9c
         XTcrixnGECd1yeeJOGtqphGD/eLFcGA8NsC1ZSpWSrWopvMHW2NzNusfJfR6waemA0B/
         f/HNmdmXOhMhQ7DkPWGWaLZhqgtP0a+XzNyzuLMy0zHBUMI9i0mAHx0lGHZWEk+HIv2h
         K4hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TIxnsgtV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4258dacsi42836301cf.625.2024.11.29.22.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:19:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TIxnsgtV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGow-0002M8-7c; Sat, 30 Nov 2024 01:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGoq-00022D-Cv
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:19:05 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGoo-0003ze-Us
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:19:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21269c8df64so22003915ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947541; x=1733552341;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7eEVoPnO2WKUyPFuL4ubctiQXe1HKtwH5FMNFuU+30=;
 b=TIxnsgtVri2untZh4/5G21XY7/c7cPfWBY+XF5dyH86Zl4uunz9/cU/DPLMvXECxKq
 PK1Q+g9XSnL7Byn3a270S2yZ0eXa/nBTY0Hv5TTbgq16lVQkCoRPcTKUYECqbkJieiH8
 9Z24PjOPJj0bNPa2Vsi1bqyuirard4xqsR2nZg6mL72YY85BWjMOaWNJYBkbrhgFLGQ4
 a3Jfo5MlLMGJbQfV+ZwsTaKMdifsJpxd3Q6RxIswIEeBdiqZ7SQhyKDqcobAfaQ0g5fz
 4vbeXIeQPmt78oyvBgkyU8Nl/xQskYRBL3UN2Xh9PUCE8DQ95SS1BoYYJsUTU9iJqPaL
 kqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947541; x=1733552341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7eEVoPnO2WKUyPFuL4ubctiQXe1HKtwH5FMNFuU+30=;
 b=ZKDxUD6KzK8Q5/YB3oqR8+wliRED3wC924velR7YArDvzmiiuL1NPOCRAq1pcZjATE
 +XsxAIKZvHclbmyxiKknYHDctneQKS9ye97nwcwyvL7tTjtfmV3lsE2V0LMFKR/6jxOC
 IgQft1dyUZ4LbbMP58zAXCUL1yt/EYy8lmYpYBLuFyzua96wBp/k7cF9DXP/6/AnWhah
 ktugjVTf7U02TjtFTqxZAoIGIR+L8MMLIULEHLpRtSlIDnnYfFXwUcLw5vD3aa/sJRQN
 80Q6miK8cDBsozBoqumd2ZXq7i+OAyXa1luYrDTjqfSlfh0IZiVzwJpeafiz4bl8BIaV
 4xmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZP3Qdz/tNN+v+8tkGU76ehz+SDypgJQHCyfTTSP+hwgLAQC46aE37IumJTmxzS9ZxsF+I0TAWqQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAiky+/iKh8M+uN2X0u5mA4I4zC+oWSIgvbqr3OrU/47iBr7Py
 xEPieezFlkCDFvY5v8yJgirH66K53kAsZ6J625BX4WKXqO1dvK4xIIeBegNlq2A=
X-Gm-Gg: ASbGncsZgpLjWm6sqTmGjUgaAUzsyR9QbwDEGOSmT4ptgqq51Y/uZmKXihblQutDt1H
 zfdfRrUOlkqduG6TkTtqyxkQaP+58cRD+TwGP2jyCFoqLe7wekHvtnT1IYly+98NXjZ6mwc8XXp
 k4J3eLgFWgchSJ1oBUjLpolVkfM3z7ZEkNFHzyUWhNHLORCYUmEPJTCADOXY/dYTuW3YgEsX//N
 mrwNIfH6J0V2mRA8kbqFfxQzlxtWow/w8ZgQglcQ5Ua9/gxx4CERJPftqGqbbk=
X-Received: by 2002:a17:902:f60c:b0:20b:5645:d860 with SMTP id
 d9443c01a7336-21501d6192bmr215183985ad.36.1732947541473; 
 Fri, 29 Nov 2024 22:19:01 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215341064e2sm32108515ad.137.2024.11.29.22.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:19:01 -0800 (PST)
Message-ID: <64c65beb-f79f-482b-b239-f050960b01e0@daynix.com>
Date: Sat, 30 Nov 2024 15:18:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/15] hw/vmapple/virtio-blk: Add support for apple
 virtio-blk
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-14-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-14-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: zwnhyrTpzJ2W

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Apple has its own virtio-blk PCI device ID where it deviates from the
> official virtio-pci spec slightly: It puts a new "apple type"
> field at a static offset in config space and introduces a new barrier
> command.
> 
> This patch first creates a mechanism for virtio-blk downstream classes to
> handle unknown commands. It then creates such a downstream class and a new
> vmapple-virtio-blk-pci class which support the additional apple type config
> identifier as well as the barrier command.
> 
> The 'aux' or 'root' device type are selected using the 'variant' property.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
