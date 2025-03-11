Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2023432njc;
        Tue, 11 Mar 2025 10:43:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqGAqVvdADaieMBzb2SBmt48wf68lQiSqLHHLajHCVXFGiRZCjgR6K2HZYGg+4rrk1ij1MMgcOs7dqpA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/MuW4jnRHgsHuoUWh98czZyR722aFhsFV3Edzzs++gHhg0qe/wzZDgULbB0ZnMrLQblUl
X-Received: by 2002:a05:620a:22ee:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c53b9d673fmr1571974585a.26.1741715037893;
        Tue, 11 Mar 2025 10:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741715037; cv=none;
        d=google.com; s=arc-20240605;
        b=F7xR4SOT+nHC3W59tQR7Bq1++eM7KYRORjmOPk/D98iVFMtg98ueE5fCS51jfCvt5m
         5u/6fMvhVBHXGe4/6XyGQ1B+MpaZYaq7LCIPz6fcdLzczWA35A9/2S16QVN90hkvBepn
         6QaFGTVm69TvKFw0qe+7YavGU3WaWHuU5gGmrS8pxvLgKv9VeysShMgNDbAwucSU/s5z
         Dyj0TP8Vvz7QrKkcIHGv5VawlA0+AOzCXh9MuvEP9NRWzuR2M38eJKsZvPfY6M0VKnFm
         1LPTOt7uCwKojjOXGRkj55caLz7ssoOFtg4n6X2z2M6NnArSV4ElUTFMBAynUVfjsl5F
         psjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=8qSVzPUhDG0GTL4i4RT9PRBYXv6am/UhU/KuTc4E/6Q=;
        fh=A7cdCZ919mwigRXHaHMlDsxT2ttEka9ztKyQuL81NbA=;
        b=ZWCKgijEbxLYLWtxKIiMC90fmh8iE9Bdn8VZHyYqJ2n9RYOMP/BJyBmm8BPOur6K+v
         CahFAcrx+9vxN0s5TpDlHn2GDaf2h6KODBX73C95Otg/AVaA1s01bX+dRESkC9H/hrzW
         LKP545KV7RUkz1sUZuqm90vKuVFb23+6S1t9xss2pclX154Hn0YKrorjsRwgGmd5ufj1
         EcW5peozH+GISbrtOCrrD8xFwYvIGIxC9qYivvBysNe6qRJfuclkXBhIpN6JHhXv02TZ
         AFrdYPvecJVnkrmJuTxN/TtDGhBJaD8/mJIMpMyPzm/tFw1j7vMlDUu9vOf25/Ui+zVx
         i40A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPD1Re1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c551e07ae2si475049585a.416.2025.03.11.10.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 10:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPD1Re1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts3dp-00066k-Sr; Tue, 11 Mar 2025 13:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3dJ-0005hA-LH
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:43:20 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3dD-0008I3-47
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:43:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-223959039f4so117766645ad.3
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741714983; x=1742319783; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8qSVzPUhDG0GTL4i4RT9PRBYXv6am/UhU/KuTc4E/6Q=;
 b=jPD1Re1SI77CxkGtOHh9DdtrixCP965xEN6N+s4TwarDA/feVwg2p/CRCAhIdzxnja
 H5bAqHgBy68OlFix4vtM/jFpX4rIPu4fE/A+KXFi9qqJs2ScTOxCYniqy9bXEFG0uMPn
 dRzDsrHTVuImGnfozVbuOhXf43Q8TXrQEE5YhZvSC2OfaJ+f5ph651+wdIf1SPGV+wSZ
 gbU0pUS5Vy1oIzJf6713J3dAhuKMlPvuUMoZCT/IHhsoc2MHKNjibcc9N2BhPx/59on8
 v2FLTBDQKzVB+nju4VSkz0q6+/50RMEerJns0EU7394u+hmCTlBVhpDdnuUIh5ESknYS
 9KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741714983; x=1742319783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8qSVzPUhDG0GTL4i4RT9PRBYXv6am/UhU/KuTc4E/6Q=;
 b=mLsS00n+NslL3IRPDDPhMuPFbgG5enwjb1sdAUmlx47s7AP9zEa1JAqmtieDHhvQhI
 touH2cbqvfdM+knHhov2/CCSGvrzSYEq10JLeVNgUXRj9KcKBu31YshCG2EKqxvdke2S
 fB71SEO6pzOosMHVnMpkwYRz9YW89xUM/KyHhRRlbqER9rICxyJyo/lABzs8Beyo/0fm
 GdB8S7Pd9GIY/gJg0I7EQf5Yyxf7VAXMVQs1Rqn8MKEAilACM5K3jnPXxSau7Mk4M6UQ
 cISTHF8IXjABp6A76yT+BCz2JncWSkt6MtJkGLswaSI68U5HY1Nh4UOmbqNx4kMiHlHE
 un+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS0VZTP/Iv/28wmOU91U+I4LLSurBBb0Clvl2yHXUwF+oCvWy6emxBDaCVJAesVXxBT6oNLYAOeQ==@nongnu.org
X-Gm-Message-State: AOJu0YwnhMGi87CBvjeRf/a5AcoM5mshBfkkqfBsSHkiIHuiC/7vtPKZ
 UwTJQOzZCuFai8KxnouPCTnmfathKgjLh3x4IUcqnd+ZSICtnk9ypREKMboXSGQ=
X-Gm-Gg: ASbGnctBiU3xAbDidu/c54zJ52QRdK+bx8eNLCzrRbZwgV72wu069z0LoayOcqZ9JXR
 EC1/edRHLFlt46F+l8kz9GriCvmnGMhXpYCkrLVF2QsHTtpGRSBZ8z6ItdF5wUoS9kInB0LNiwQ
 syok//CJi7XFi0vruZ30P1Pw5SF9dl/0NIYo0NSZLF/ZVt92cblU/Ixni5nPY/qed0Mbkjv/Vo4
 tQy1F0dQTLDca0LicREpkmzDmj5IMQzzQ7CfBd/AKAyqwbX2ulWAV3HSJdRH2V7GO7dRxaFnUDf
 8Pn774CU42A7jy9V//28DQ5Us8wkM3I2wOP9+yM3h3J9QsU7TQM+xGm4A+bL8bURwpYsy5HuZDj
 6+TFjefvB
X-Received: by 2002:a17:903:2405:b0:224:5b4:b3b9 with SMTP id
 d9443c01a7336-22428bd551fmr289271735ad.33.1741714982949; 
 Tue, 11 Mar 2025 10:43:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410abc694sm100488105ad.257.2025.03.11.10.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:43:02 -0700 (PDT)
Message-ID: <c04f6007-3899-4286-af0f-e3ffcc930145@linaro.org>
Date: Tue, 11 Mar 2025 10:43:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] arm/cpu: Store aa64pfr0/1 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-6-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-6-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: W39jNRfqEcsp

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/arm/cpu-features.h | 40 ++++++++++++++++-----------------
>   target/arm/cpu.c          | 29 ++++++++----------------
>   target/arm/cpu.h          |  2 --
>   target/arm/cpu64.c        | 14 ++++--------
>   target/arm/helper.c       |  6 ++---
>   target/arm/hvf/hvf.c      |  6 ++---
>   target/arm/kvm.c          | 24 +++++++++-----------
>   target/arm/tcg/cpu64.c    | 47 ++++++++++++++++++---------------------
>   8 files changed, 71 insertions(+), 97 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
