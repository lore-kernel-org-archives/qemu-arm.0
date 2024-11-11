Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6399922njc;
        Sun, 10 Nov 2024 20:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6H91N+g7L/SmLEHYunJ+1//1ZgNmZ3nSVUtyt0qaI82TZqxgUq5G6xYUz3EMaSfPCNcFtjpcnFhBrZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKw3iheWd18kIRlcr4wqK8K7bnTK/oc4inidgWGSANFXHrGelFmf0+pRPo/NyMxE/s4dPh
X-Received: by 2002:a05:620a:4502:b0:7b1:36d3:3404 with SMTP id af79cd13be357-7b331d805ecmr1831020485a.1.1731300918560;
        Sun, 10 Nov 2024 20:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731300918; cv=none;
        d=google.com; s=arc-20240605;
        b=GO+Phn6e5Teehdg/n4YEN4G/0x3BleL7UmESoKTHZcnnyA6cnkXuk9W7vLrGHaDj0F
         +SQJ9mjeLIUff4ecOXqKweWvHqeJEWtk8DYJjFKGuVSjqpbL5Ib5p3YowmHd6lhhfGz4
         7Jftdmi7zYldrl9jtNfbJGL31RPXyNQbyfNbajgkzU8EMWuwkomLYZnbA0YTZ8j49ZH8
         S/gQDX1dRrGxPrSLdOgguOCk21G9y+7FxaTCwyeTqsUWo62u1PcAAlVgB+9YkWJh313V
         ydc4c/HfHtRx8G56bBEcPs5JCVb3ucnE5ofHvGd+wBD23gR04fcbpNIefV0M/3pcLWAD
         DI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0yweXBd5sbwo/GvOeh4/3/Gq/Z0XExwXwiJcl/TYX4w=;
        fh=GA1RWjnGV3oYCSZPGIw//YwLTKNlvTzumqumQ+yRNEY=;
        b=E6vHDSQvWPFeqXnVViE8PvWkKV2f1ow8OhfbM79rXbxyMU0x8NveFYXn8a58LUmXUU
         sBJqSS8bIh6e5E9ozY3PiUFWogb4qy+OR26+QCBHzGpkcWI8jBqN+5ybmb5YADl5A6MR
         mU1rUol002YjWaDogW50MEZrAn1ZIHzb7hVvcwqcDy9b+pEmNtD2Ib4qWUouZXN46xHy
         JhbEK7SU7N7SgImOKFd0YBbZsStmO7Jju03mWK01m1ekIW0z7ypLJS71uQUiStZTSFTL
         HPoFLxv/xHnpkDVj+cJD+1glBg2TcuMr0a9MczTfMe38v0uoPtJsYPJ9R9RaWCe0mKgb
         aA/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=v3AFvuf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ace71ebsi976278085a.374.2024.11.10.20.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 20:55:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=v3AFvuf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAMRx-0002St-Cp; Sun, 10 Nov 2024 23:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tAMRq-0002RT-DR
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 23:54:48 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tAMRn-0006D0-Tt
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 23:54:46 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-20e576dbc42so44744585ad.0
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 20:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1731300882; x=1731905682;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0yweXBd5sbwo/GvOeh4/3/Gq/Z0XExwXwiJcl/TYX4w=;
 b=v3AFvuf80K1dPlU9pBrJAMborlhOxKamh51HW6BgDVZpJdcTPEoSApT5ktyF+jEg7a
 eQgb2YLcjRhSA5lg/rhjzbpTlCj0/mPGP8RzmL4ld3Tc9bCbqgzDtOX1LJ++ZCsuzO5d
 ijIUI47cBzT2UOag58n8cUakN2IXc7c/nxbolBuDXepOz3/QDBBBIu8va80EHL9ZDw+c
 9wtQcTXN4L7xFm0I4aMSSJ9zpm3YSRvSk4B8vQyLIh1Ex1mikkz5oydeDlI98daSNO0T
 ++sG9boFEMBEdo3XhOLszhGkp8Tk3xrvD2qlZKjgdkMYk8ludG9S81zp9JoA6aV8xsUX
 pdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731300882; x=1731905682;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0yweXBd5sbwo/GvOeh4/3/Gq/Z0XExwXwiJcl/TYX4w=;
 b=XqlyIPy0h0RNchyJljz365Fxaaj/t/DtolRP0mTpUtVF7fKUXjyd7fwalb6SlL0mwd
 RANTdyjto3biIYItkpsgrh33d5l1lGitwoaWngP9bczGBFup7AcC7s6ttveKGEkFvmoA
 W1e1CJdAMBfz9HwCIi+EQTs+GqRAcdpJ8mfpA2C9wxzvZZPhvrT6aIKceTgNmi2AXI0f
 gJDOzF5wtoefHP4AIAqFXTEwA+BRJxG8bggDCumqPkKSSfGecauGWPKIPVe5sjAK32dM
 eiEcUPiFJISxP9+kLOPs9ys972SX4uOm25WFhaSAh5nwg50ck4GFgG9XtPv7amyQ1L4B
 Avaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK7imNVBTdosBbIofIJSkfI/NHhnfp5uIJVke5ilrhYJOlrhNwWm9TjZARwUR43I+ZgbFFKdDC1Q==@nongnu.org
X-Gm-Message-State: AOJu0YyXKJxrAXsKQ3wCliHaKKp4pckk30jMu4dM6pDWtK+9u7CTRclA
 Sb4TGLx+Ga06P0xkRhYpmG2DyNsMaDj6cqLty/mRGqn2RfPvWRo27PDS+7FogxM=
X-Received: by 2002:a17:902:e891:b0:20c:7720:59b8 with SMTP id
 d9443c01a7336-211834dfbebmr151646825ad.6.1731300882225; 
 Sun, 10 Nov 2024 20:54:42 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e594c5sm65728615ad.200.2024.11.10.20.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 20:54:41 -0800 (PST)
Message-ID: <7f62a167-1ead-45a2-8946-7f4c0b982686@daynix.com>
Date: Mon, 11 Nov 2024 13:54:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/16] hw/display/apple-gfx: Adds configurable mode list
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
 qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20241110215519.49150-1-phil@philjordan.eu>
 <20241110215519.49150-5-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241110215519.49150-5-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kYjRRg6BuABU

On 2024/11/11 6:55, Phil Dennis-Jordan wrote:
> This change adds a property 'display_modes' on the graphics device
> which permits specifying a list of display modes. (screen resolution
> and refresh rate)
> 
> The property is an array of a custom type to make the syntax slightly
> less awkward to use, for example:
> 
> -device '{"driver":"apple-gfx-pci", "display-modes":["1920x1080@60", "3840x2160@60"]}'
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
