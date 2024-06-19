Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1157643ejb;
        Tue, 18 Jun 2024 19:41:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzS1za6LGnDY4gtc8IsD95i+MgVPWjakWgr/M92QIizhL1TK1nKk5FvrIrtHxufRdjUpSCX/u0vMQiZpKPjTj37OhuP/L9
X-Google-Smtp-Source: AGHT+IHBBF1WWnc3tbOURwiImCjzsQMd1otwJDl7Rc/el9tfPNY7MlNmdCCMUJdUp0CYVuU9sB9M
X-Received: by 2002:a0d:e6d6:0:b0:622:df58:2cf6 with SMTP id 00721157ae682-63a8faf2ec1mr13404977b3.50.1718764893448;
        Tue, 18 Jun 2024 19:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718764893; cv=none;
        d=google.com; s=arc-20160816;
        b=a7OzkZu138shO5BrtnwNN/+12UUXtP9+JCvcCXd+z32bHjjjUpzDtH6HUrSFDvYjTH
         m0LPBU47352ytqByoIg50X87JVHy4+/dnY5Yn3pYo/An9brDigx8ZQH+mWEculwzDaSM
         FhDVTpBr0CbLt9xS8c/jXs1f9K+B6Idr0kbMMadrT8SZUEyiDUSbkxq7VyAeZZ4o5Bjo
         EW2zgRPpm/OfWzcNLQI0Cq8JmUFW4S7NC0gwbcXG/GrjYnhbGjSzb9PKh4NcUtJY7qEO
         /ZuQhrSuMHhQ5FkqHcq51A5nmIr3yxUBVY8021uxpdpLwBn6HCh8qNQ5vcypaOvT4gQN
         NQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eey5CwDEoK4Tj9IoIG6YGpUiix2ArYCy4Snf1KNYUvY=;
        fh=pN07si8EITfC/ZQbz8RJmcb2IsEQFZRoFbroMewrkdE=;
        b=RvV5IAatLluG9Rq+m+0l46xb1rP0Wimo61q8B1SCvt0Ook+tsZzHWo/ErscQlB/sNl
         sICbeq38B80oviMv+c2JU7oPSdeSCL/+24LNH98YCedVg4jV+IKDZdVRmISeei2zRb9p
         8d7sXacS7D7s7dq4BSKoUjra+Plder9APhrk0QaE1GAtY5OM/6fnj6EdF7/Arqissu+p
         jRjrKEYw5G8RcmRDU9qEMsgt+8AyVQzJwgs1PU4ueoTcRNlXyzdARkIVj677Zm08c4IX
         XeYaOazP2IRbmWA8q3SQgv05o9wiv3o/W7THA5yp71UGTwpAZ0zboCGCu7MN9JjSKU3M
         wztQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWSw6F2I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5a13fecsi129338106d6.116.2024.06.18.19.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 19:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWSw6F2I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJlGF-00006x-9g; Tue, 18 Jun 2024 22:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sJlGD-000069-Af
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 22:41:21 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sJlGB-0004nn-Rd
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 22:41:21 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2c2d25b5432so4770409a91.2
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 19:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718764877; x=1719369677; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eey5CwDEoK4Tj9IoIG6YGpUiix2ArYCy4Snf1KNYUvY=;
 b=CWSw6F2IAaxMd+/Jv+XYwC1GO54KK5qJedE14PMwUCuIF9tImEvX950u7sj1KhBVqy
 XbNqF8JhQ0+8bdWIR5MGIUNkQW7xHWprdeBiUHt+nYrcBI8g8F9clqGSoWjzyOHkP7Hf
 7Z08tN1chtxGVkXjOveftR12FJJR3csI16Fbc7v/NWSL3vwp1eSLx+4gr9w3NTYzelPm
 i833rnMt3OYxZnklBdSrnAlv+DXEANanTxls+Ap7vp7WV3PoGtd06/wXxz6vJw6TerlU
 QhOinFsohSP4Ywtija8R/2d6qKAGYZXNnhmbFbHQk3RrWYKKpK5lJ9jaAfYT12SJqjdP
 +7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718764877; x=1719369677;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eey5CwDEoK4Tj9IoIG6YGpUiix2ArYCy4Snf1KNYUvY=;
 b=HxI2t3M8qYizoR3tl15ytFH06KCZwA0hQMNZyFmeAcs9KjFwyYDIswC+6IDo1lWn6j
 Ken77VTiGPoxsLmgp8htHRoK3yii7ygXD5nccvB8sdIPVstSXBCPs/SIMLniwGmHfoMV
 UUDngb7tN6RsRlhYI9Zmo9SN2YnHJgl/z/MYp4XzG46Vwhuf7TI14rnnnFeMAPSurjZ2
 iDx18WwAU56wlzcET+09VEJhiuPF5erE3vGMg/19zJ1DkKIMLJ+NDaJUuVbm5BhghgbP
 PqHdeU0GojQWopvaiNvha+kB342PfLcT0JtKNFOlsH/UZi+nuCvhN08+FM53C7+4vXEZ
 G5Qw==
X-Gm-Message-State: AOJu0Yz5wV25DUvWFzpRjcskR4VdSHHehED0Q6c05EI/zgPHEVcOsOi5
 Z0p9mM6DSUWwquK3xNXHXy3rmU0HmOQ8qR5FIPtipqS2tVJQia9bhCiidF4w/0k=
X-Received: by 2002:a17:90a:db82:b0:2c3:7e3:6be0 with SMTP id
 98e67ed59e1d1-2c7b5d6aea2mr1573034a91.31.1718764877471; 
 Tue, 18 Jun 2024 19:41:17 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.132.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4a75ee4e8sm14057149a91.16.2024.06.18.19.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 19:41:17 -0700 (PDT)
Message-ID: <e66581c8-9216-496a-b7c7-7ad92f90e565@linaro.org>
Date: Tue, 18 Jun 2024 19:41:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Drop local iort_node_offset
To: Nicolin Chen <nicolinc@nvidia.com>, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240619001708.926511-1-nicolinc@nvidia.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240619001708.926511-1-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: JhdyYEb0fb0O

On 6/18/24 17:17, Nicolin Chen wrote:
> Both the other two callers of build_iort_id_mapping() just directly pass
> in the IORT_NODE_OFFSET macro. Keeping a "const uint32_t" local variable
> storing the same value doesn't have any gain.
> 
> Simplify this by replacing the only place using this local variable with
> the macro directly.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   hw/arm/virt-acpi-build.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
