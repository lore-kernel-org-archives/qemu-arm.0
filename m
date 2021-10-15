Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4629465lfc;
        Thu, 14 Oct 2021 17:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdWBAJdI76fWhuVPOOyCXy8G5ox/SHQvkDgNcfgIMmL5d7Wwz7JNzTxUGY1GxFrHDc2FfJ
X-Received: by 2002:ae9:de83:: with SMTP id s125mr7753224qkf.248.1634258996326;
        Thu, 14 Oct 2021 17:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634258996; cv=none;
        d=google.com; s=arc-20160816;
        b=QYYrYPQu3kFeTGiLqfCv/O5XO6A/u3dszCvHl1JWuWGBcMwHEmU6FGE34GFHvvEHU3
         xE3kpRuTlSys+5mYaNtI2WebU0If8mYYz5WzZ0UXN9VV5LBUlsKM5/k4XWwj9w3DFka6
         dyckCTGolOP7NYqu8y/n1fNNU/hj7su9UUCh8aTZ+9TbqYL6TEO3FzCycdSX2DPYZamM
         3x5FeBW0c2JD6BMFwpcYq5JlrDM7swYOxa8dCjn/BL7GUAnuzWUGsspNcmLAnBD93SLt
         quKWtjEGytfmOedCV7Mvg9ehamy9IsJNgaVQDhhmhuP/7DdH8sHS0R2PrnzfzWDW44JW
         v7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2dXvJUXIDzUKubJ7p2xvrWY5CRh06mo+LoGkICzg1Jw=;
        b=tVZYdRJ8Q/sBUvGqu/AmJn83f5zbdVHSr2PhD6pA0o/hcehewy54PQoWIbCaxJgYua
         kAQH4VMlP1iN7RViCRqEQpEe49v8X5lFXjmGmOKz7OLmiWsxsNwzic/e7LYvi7HZaafM
         mU1DvDacHBaL1MoWXF4vqns9FvknyRWgF+FvJ82gSLTWAoLTDSFjumTFNb0GMKAoHUru
         aNbKWB0kCJR9ayamjbT6VGBwLcOcuYVqXrWkKMmNOkXA0xmXu0VpwP9XaRBW49aH7g4W
         4oYYWpQK+qKhqAkWHYUUkwsrZ3OLTRnoPsFxJyZhWudiTpiyKYEBsTBW4hEgwj+W9QAl
         x9YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKQAp9DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si4388910qtc.399.2021.10.14.17.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 17:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKQAp9DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbBQ3-00015Y-RZ
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 20:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBPt-00015A-If
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 20:49:45 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBPr-0007Ew-1N
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 20:49:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6043161pjb.3
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 17:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2dXvJUXIDzUKubJ7p2xvrWY5CRh06mo+LoGkICzg1Jw=;
 b=GKQAp9DC2X9+gxMQYgKHzSPomjCVgCFUrzJN00zd/n/+v+E24n605SOwhekQRQtZj7
 KgohZflkAG63aUt6aNVbHlekf7p7W4ROdFiYyl16sqSWBQgwhIVK6Ftrcl2eriwRzfOu
 tfo3oGQlbcNwBfpQOmOCueJzvY/eiSZPn2ouf4mWsXLkX/juxDKFhEKHfPPS4QiYlkpL
 0N7mE4H7tYTqF4mrHwChUPj7XfNtN45vOhwGSr7f7n4YwWcIsx7nVu7VM5Dozwc2q1ho
 1rp2u2tJ+jdNfJRRaF4oe6pDBokd/BjskVOoiqr1milucyTmNE9I539+oP3aKVHqhOY8
 7RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2dXvJUXIDzUKubJ7p2xvrWY5CRh06mo+LoGkICzg1Jw=;
 b=Z1iREwRSNebnto2dMyciTdhWnxBOS7Dy0fy9l9KT/dreLhuF37dHdGMJ8QTStTnfxL
 UF/z+vj00IrIB4Jp82059b2IBe9opYKmW3vaRp8d5MIsmfwHT0yis8jZ0ntcy+EmJ0zz
 SaOro6hrUjGcU7Rb+yHjzBUWYrJi3N7kd1m5BTbkKM1gGFuvdB0yQ+7Y1F+7rRKBOMBq
 haszwBwBwf9Q4iD99IIANCNw2ehjGZ02dRADXa3ZUdg+/EZuCWfAJQEc4S2L7Qgi2twV
 V8MeZoVUODFogJgYuGGtK4xH2rtEhb3HHRqztdnPdsakE/mfDhCZEOm2/7Z/PY1m0Zhn
 GivQ==
X-Gm-Message-State: AOAM530m/LUNHs5AVKQ/pqkoJrNbi+kpBQCHxbgVMaOe5ip56kEjX9Re
 4gF1Ux4UKabHuXJH9fDYYTLkZA==
X-Received: by 2002:a17:902:9b8d:b0:13e:b693:c23d with SMTP id
 y13-20020a1709029b8d00b0013eb693c23dmr8158856plp.11.1634258980806; 
 Thu, 14 Oct 2021 17:49:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x35sm4199364pfh.52.2021.10.14.17.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:49:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 imammedo@redhat.com, mst@redhat.com, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
References: <20211014115643.756977-1-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81aa40b1-621e-6800-993a-4189345039b1@linaro.org>
Date: Thu, 14 Oct 2021 17:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8OWrjkRyoP2c

On 10/14/21 4:56 AM, Eric Auger wrote:
> This series upgrades the ACPI IORT table up to the E.b
> specification revision. One of the goal of this upgrade
> is to allow the addition of RMR nodes along with the SMMUv3.
> 
> The latest IORT specification (ARM DEN 0049E.b) can be found at
> IO Remapping Table - Platform Design Document
> https://developer.arm.com/documentation/den0049/latest/
> 
> This series can be found at
> https://github.com/eauger/qemu.git
> branch: iort_Eb_v3

Queued for target-arm.


r~
