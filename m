Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1348484ejc;
        Mon, 15 Apr 2024 09:49:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4kbK/MAuj7SjrEUalK1pqJTpUW6C8qY6nKJnPb3Ij4462L8dv8s7MmPnyH2gS7zk2LyJsrEaDBXJeWzG7l4Uy4CnQip24
X-Google-Smtp-Source: AGHT+IG7/KYNAVCUfEfxCNzSqhsDv9cciw/yW3Yy7w7XflMEeGHZ5K4ZTkZlHbaMlpzHowaOjjpi
X-Received: by 2002:a05:620a:21d2:b0:78a:5eb3:8e3d with SMTP id h18-20020a05620a21d200b0078a5eb38e3dmr12546559qka.8.1713199760571;
        Mon, 15 Apr 2024 09:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713199760; cv=none;
        d=google.com; s=arc-20160816;
        b=DHnPqia2UoyjMTYfF8vlrBPD74Xl/+UC6cLE7ofsIyqqEljhBzo4QTYczWAOd96dVs
         ijv7bGfZzt7OrUmu3gWlUI0gVIRaVjSG76rYh1oa1Xtd37QlzIk6JtW3e4uZ2CBf9aI+
         dzYTvkGwlImxe3G6FhWPFv34ZnPnU8BIBq5GwENRFiz4jSwsPFs/fMepRw2PtmlT4ZAG
         xZ9wXeXcCWkOvcWHPBUxQVX78FYOdYyd/m27O0k4REHSZtI8bvEjm77r95n8uye7oigA
         QQ4XK7/+p98jDJA/m6IBg9w6GEe+Y5Vz+/F/KvPmomGBaYT/jvZNT4U72h6hOngbocfT
         ghOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AFzuPWBjHOi5jfnpZTkVNprL9qWgrCLYxanfJmaFGOc=;
        fh=Kg0/Me3tpVJtH9/d0rYnDSoW4orhjxoGURIkdNPqa+k=;
        b=p89uAgyiicWNLnarLEqStPlOn/Gl5S+GykRBIrZoa3hC5h7B2VE7Os3TLdWqn13lTB
         PEsf4Fh+7bZrd7bj9hveN+Tm9HAAYBPin80Hxx9gfhB+pl1aRkbbmb049ZgS/Rjet/1i
         /fYDjql8hTpdlpTXcPHxUvF2syhep95+AG7s0UFhqdEX9oXsA7JLcBpksWR35iOBXYjf
         hIkA3EIfhGJcon/6LXTof20/LZgExrRp+3wQ2NU8U+vJmyJfbCbODei/g/rMNaM9cDUG
         +h75xQQpr5uqdq9P2fRNW+4mfgqiRI0A6ei0lwXF42eMhUV0MOkBpcGmhBHC7s01iQg3
         CccQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSRoALAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23-20020a05620a147700b0078ebe617b73si10390868qkl.761.2024.04.15.09.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 09:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSRoALAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwPVx-0007EM-Bu; Mon, 15 Apr 2024 12:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rwPVh-0007AF-H8
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 12:48:50 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rwPVf-0005KL-3k
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 12:48:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1e651a9f3ffso6949945ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713199723; x=1713804523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFzuPWBjHOi5jfnpZTkVNprL9qWgrCLYxanfJmaFGOc=;
 b=MSRoALAbbOkJJ5kkaPk4Pcg84BVCL0olUESrm+qe9Ty0gLP9Z67KoeQgFgiPKKL7zn
 3CYWvYyFX3bWApzYj/3buPGQDuMQUJwi2kaKC63O81Fwizea1E4/eRkTT14FUdP2SUu/
 80FegsP2tbjikey8r+2EWBLehcpjlnwrNOAbXPRRjhwak19n5jmI8z/G9rYgaziKDkde
 5JjzlB8d/APxeY/tLJbFI04GupaZlxU2k/7rsxONHFVO4CZw9nadXlpY+edr81rRfxJH
 OD1JMVeVX4t3HWwc43FS/qA3OAttiIzmkodYzXBFiigxIFdvlrrnO1YGYj5f4M+65qxf
 QJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713199723; x=1713804523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFzuPWBjHOi5jfnpZTkVNprL9qWgrCLYxanfJmaFGOc=;
 b=m2wts+G10tNNrWr27aAcU+UZvurhdisy7h22c35eKHAqrbtVkEaiIffDofYvV+C7Ls
 dLq0pn0PwV/5KyK8IIRlaJpDyOKDnhWE578z1vy0yUkn9D765GL0nU0Nkm6OQNSxik2t
 P52rChEV8x76UG0+HDCBBb14MxnOeIHtkK4nbWTYiEWyl0oz6Eg5hyAc46ns8M5o3VG0
 brMn4HcpCybKmCNfPN7HiEry2fX+oDTVaIAGU+e9EpSz13gSnaota+Wka4AOymcNm3I2
 EYd7zdRg9tdxr3j43Ks8rJh3fVz/LHbc+3aCGJ4YBSutKbFp9Dr3Ox0X4XdLA9p8Dh4X
 ziqg==
X-Gm-Message-State: AOJu0YymbRKEmC3iVw8nQWeD+XgH0j2Kqu3jotDwOopdvEPmRO8iTsEg
 EPL6ar4H6bbmQ1/VR6zLAeoU39hEcoR7ww+QaWytyMdi873Wb/yBEYjn5/i4eCc=
X-Received: by 2002:a17:902:7609:b0:1e5:10e5:b675 with SMTP id
 k9-20020a170902760900b001e510e5b675mr9091584pll.32.1713199723288; 
 Mon, 15 Apr 2024 09:48:43 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kw7-20020a170902f90700b001e45240eca4sm8150401plb.196.2024.04.15.09.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 09:48:42 -0700 (PDT)
Message-ID: <0a3c4f12-96d7-4f32-9dda-b349ede39f25@linaro.org>
Date: Mon, 15 Apr 2024 09:48:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Improvements for switches in hw/cpu/Kconfig
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240415065655.130099-1-thuth@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240415065655.130099-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: jI3tDugeJ0/e

On 4/14/24 23:56, Thomas Huth wrote:
> Thomas Huth (2):
>    hw: Fix problem with the A*MPCORE switches in the Kconfig files
>    hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
