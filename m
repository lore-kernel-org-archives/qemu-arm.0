Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp279255ejb;
        Tue, 5 Mar 2024 20:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVIl/LYgle56UWtIG9W3CbGqmhh43T7OL4Z/6zFlZ9PHncN7aB5WQFLrldJ1WFm4yepge3UHwdvPrWAhQoe6SnwVCCv+p2u
X-Google-Smtp-Source: AGHT+IHAYU5r0QDJFLlN+KJ33Keio8oPBGpfvDyJ8Y8T0t5Ms9urE3PFbVHy9w8gfaM/c2X0vCvs
X-Received: by 2002:a81:8002:0:b0:608:d5b7:87b0 with SMTP id q2-20020a818002000000b00608d5b787b0mr12821645ywf.48.1709698745528;
        Tue, 05 Mar 2024 20:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709698745; cv=none;
        d=google.com; s=arc-20160816;
        b=e02BRqDhNdDr4OdrZgb4bPUyG/NBDOSWKTxVuDRGqzWyBfiP4DZa8noJQfVJzUpzIK
         tWZ8byY1D+LkpfhXS/2eWq3DOMf+4vFrHPHp9MtSM6mKZA5ytbJEsjR0m4sT6mraFyiY
         aK+Nh4IHECT614UgIymmVC9sPBGBhJmrrkvF7Q5AwqFm4FqKseo5J4qRCaAFfrMz11Yi
         EgB5L5bwyY8PY6XxKvy9vBDP/rZOKGC0uhstUg3JUI7ydsXNeP5p+qUGQNdclu4m6oCR
         32N5Oap/KNLvljlldDMdI6Lme0pxBIof3Z4lTOZtKCgf6pV4s6uC5Gk2k1pZMyqEZ6Yz
         omzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fK4rbnMS4e7wpNWAf3ykzopx7V0lLm+h5DIhfiTUhIE=;
        fh=hNU8xV2YWZLBNBdlsZJJ7EKfb0X5yZvfHKKlY5lmEAs=;
        b=pWyF0vBP2qFmmr6dTSrATMtvkC3LE3bPqGqVvp5gSPI/uso0u6k/Xb4XS65dqNUtUw
         8vahLQq5/EY0UmSmnTbYqnDwmh69LA8pMQ3Zpl6wJwTPi9wRLtKIj5sBalWPbZuDWlKm
         MyLZ33Agit8Y+R4gGGN2tUlZSssEugPEKZTZd+Dmvdr1vD/nH3Eu/yUBKLVLlhmmCAeW
         NlMrH9mQoCnkOeoHRhzdtct5EeCRQpzBbGy3AH4/ErIj+gzd+LJFjqCG9Aw4UPhseDsO
         yMMRjDZ93YZH9rXq4+6qmFqASP2wKXPkAfe5t5b7Uym6h/VFtrpNsbTS2Ahjjj6IUKeN
         RAwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qc3pUkqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a05622a018400b0042eb264b2c6si13664783qtw.575.2024.03.05.20.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 20:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qc3pUkqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhijn-0002cD-NV; Tue, 05 Mar 2024 23:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhijl-0002bf-TP
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 23:18:38 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhijk-0005gf-DS
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 23:18:37 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso4650861a12.3
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 20:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709698714; x=1710303514; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fK4rbnMS4e7wpNWAf3ykzopx7V0lLm+h5DIhfiTUhIE=;
 b=Qc3pUkqsC4OJHebK02bTZ69MH4TuNXMnSQWVUveVCWtGT2fMEPcIBxf5VbDfbEvgpF
 6UOHonWsV4vs8rFAk82Rkm01VmAR6uukWaxOQ6qAdegHsD7ljhBu2Ky4AFEqKQmJe0M2
 q5+qslT6lu+BacFhIPgTxi+qpG19KRCYa4EScQeUzHSMIMh9rHd3yJ/LVZRy/OuvFuST
 OWyZz9fwb+1yfmDXAxexuQZSxG5WcO5s8NW+vKs2eSQutmxz9HfQk9NEbMUfMZae0b3h
 S4le/xNib0/yfJ2a8Srwc97ljC/tjt7u8wMX+wahvsi6j53kCcNZTQw1ZujWdNuUsmkI
 OtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709698714; x=1710303514;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fK4rbnMS4e7wpNWAf3ykzopx7V0lLm+h5DIhfiTUhIE=;
 b=KVJ97f+q5bBl5JNXkV3U1rOD548645wa8Yq7wvCGbslaVSasWXRCB9xnjoAWOZynlP
 O8lQ4N1Sm9HnfU/EzXLih7NHtpFkhm3xLTve16P4iGEJwufN+1vjxl2PwQy45GD4s99z
 PS/E1DX0Odr8VQS15rK/tC+ePMdBdNtzWJMUchC4MxG+ViWQOVlm2GDKwkOM04XJpNB6
 SU4d0v7yfGs+/1QkN4DTaj6N+sGP//5VvTEAYfNp3gxDCIO9BPtkhDh2k6QlKhu6Atsu
 r9It2F64Ge7e+0kOo5YLDtG7cuw5Qt8jnJTiCaAs8kVGLat0yIYINl9BUVjGxptwsSbd
 DBEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3odDdgoy91IbNG0ynoq37EAV79DS/NYxfc86FKQvMx3KJMGXcdHnYPNSw8TYjH8n+836f2Bk4t4bEmWArB/7OIceO
X-Gm-Message-State: AOJu0Yy9P17mTA6apy9OIMopaLFQ1+Z5URGYaofMCuzb08daVlxF2E+7
 SEt9ryI8GqfbRl1AMMrMjiPQw2DDn1cCl1ni5z5SYfTtzIS5+LkKu88ECCk7Z2E=
X-Received: by 2002:a05:6a20:a894:b0:1a1:5779:9e83 with SMTP id
 ca20-20020a056a20a89400b001a157799e83mr2751075pzb.56.1709698713888; 
 Tue, 05 Mar 2024 20:18:33 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 o189-20020a62cdc6000000b006e5597994c8sm10192963pfg.5.2024.03.05.20.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 20:18:33 -0800 (PST)
Message-ID: <c8eb7929-d54a-4ccb-a622-659df8129f2b@linaro.org>
Date: Tue, 5 Mar 2024 18:18:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 19/23] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
 <20240306035721.2333531-20-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240306035721.2333531-20-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rFraK7wl2nE5

On 3/5/24 17:57, Jinjie Ruan via wrote:
> If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty
> is higher than 0x80, otherwise it is higher than 0x0. And save NMI
> super prioirty information in hppi.superprio to deliver NMI exception.
> Since both GICR and GICD can deliver NMI, it is both necessary to check
> whether the pending irq is NMI in gicv3_redist_update_noirqset and
> gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
> priority and a smaller interrupt number can be preempted but not NMI.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v7:
> - Reorder the irqbetter() code for clarity.
> - Eliminate the has_superprio local variable for gicv3_get_priority().
> - false -> cs->hpplpi.superprio in gicv3_redist_update_noirqset().
> - 0x0 -> false in arm_gicv3_common_reset_hold().
> - Clear superprio in several places for hppi, hpplpi and hppvlpi.
> v6:
> - Put the "extract superprio info" logic into gicv3_get_priority().
> - Update the comment in irqbetter().
> - Reset the cs->hppi.superprio to 0x0.
> - Set hppi.superprio to false for LPI.
> v4:
> - Replace is_nmi with has_superprio to not a mix NMI and superpriority.
> - Update the comment in irqbetter().
> - Extract gicv3_get_priority() to avoid code repeat.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
