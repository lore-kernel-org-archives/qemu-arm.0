Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1255471ejf;
        Fri, 12 Aug 2022 09:48:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6mYexL+NADO+Iyu5XmUd9iQzCD8bcSMfhhYCWBEOpt/N776UmdSH95L+7MUpw/tes1sqmG
X-Received: by 2002:a05:622a:346:b0:343:5eaf:43e6 with SMTP id r6-20020a05622a034600b003435eaf43e6mr4413163qtw.110.1660322884280;
        Fri, 12 Aug 2022 09:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660322884; cv=none;
        d=google.com; s=arc-20160816;
        b=ODZnmMQFBTx4fSgK4pp9wrgvvAwK5jgyyb+4fr2EAY77EW4dwUrNh/QLVxdE4IzgRI
         Lavb8D9eyReuOjhdji2cpcBB6WNs0fXXCD006wFX+vCExTz4WEA+uj797GpdoIJeRg+e
         og6p8Xmk3xuPVuZWgQ/JxlDT7Hp/qlS5HyXmECG36vZo9WvRW5EzAh9Myc2LBylTdf8e
         nNiaQfQW4LJOP4jzk/hzGNiZwFje1Kh/Gp3pnoXxvF+Fwjq8afsXrPN8zbNDlltoE1p4
         JVOZm1kPbslXvzdR480nmI2j/6FOqIDK5ptlk6qz4o7JI8J1gwkKfSWXMEQwmMPTEFMR
         e4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EKUCmZ2o55rayFYvbyN7ScQTJ/yPWqRuqFY/2vQ1xE0=;
        b=IM890gsJfIbddih2gLUsFjFjq+0MnMPUSc+dbDdxsvKW5Aw3hKs1HE4CwnVEKQMeZM
         szOTYrifRSLZzaggMUk5h3PNtt8VMWZlLYVP7FvvaeQ+H9YKvXz4Z8HcMsPPmSIglXgy
         jGO/SHM7qdt9HHEaFPj+fCd3fbD4gAlLDjAaiscECgfyIADpaj1AulxxG+JOTckVQaRk
         XC38HRieMGH8vIr1He42AVYu7tP1LuAaMfMq1ScgvbzZsIp/mHzHqFnbuiU6YP8VhhzK
         kjH8lKPS3fHBEHI29ZNtXVxh4XNXATD76kwkKLbhYrrNzkaxriNgvQHBmv8AdCI7I3Jq
         YSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NeYmXW+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf9-20020a0562142a4900b00477163bd59dsi1400656qvb.16.2022.08.12.09.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 09:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NeYmXW+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMXpL-0005ZA-PL
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 12:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMXZi-0002jx-VO
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 12:31:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMXZg-0000PW-4H
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 12:31:54 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 123so2268558ybv.7
 for <qemu-arm@nongnu.org>; Fri, 12 Aug 2022 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EKUCmZ2o55rayFYvbyN7ScQTJ/yPWqRuqFY/2vQ1xE0=;
 b=NeYmXW+NcVBlLAzhN7rc7RvKQ5GmeTsZ5OBK5VzG+Xix71dp9EP+43HLKahU5mxE3u
 ghqV72AQm3DMO2nG8lAlJgMan/a8tKvTP9h9lQsRUgLb9Darah35Skn8zchid7zT+rG9
 dYFIXRf7gflvPzy3VFi8PnWiY49wdDxM/tunbUPoRfpkbZd2JM3hBOUynzfETrcG94Wu
 cei05m1varLxzu7bJO4QD/VjKCvw0sOOJxrvLqja7x+QciR4ndv95sRicnbFDK8qWkAH
 G2ZRVrfxWS5NqyWCvB2Rjpr9Rzz/LkRscmi/XWHN63MM4U7V2y6ODOQ3pRKMD7yaAJEC
 7F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EKUCmZ2o55rayFYvbyN7ScQTJ/yPWqRuqFY/2vQ1xE0=;
 b=FSRN2xzt00SVVvNFbDA5aW2rgGwSZpu63V4apD6bkgsHJBKeqKTIarYUMbmAvRFq2U
 MA7Vm/pL2uiaEk+oBxA9/3KlpNcVtHlUoDFSD1c1PHkIIMtJ4DX23Rn4v9ebcQUIyOlk
 tUlN3X+/jcGB6pw1Qy7IvCnrvHi8TwLe0l/P3NjlRtvEdrTQYPgHQJqyUpzKdqZWl7jV
 WyRWkkGnj+6HQCaNg3HM5k5EsaBk+EaaegomNyPwA6aC2a1l2/OA+dpSK9cYWDId70/q
 LESQVKwdEgfRHn/3lnJe1AI20koUOlH0uRLioL9CSoqRKBsm1YVgLh49xc7+TzMWajlZ
 dhkw==
X-Gm-Message-State: ACgBeo0n4vns+e0uj5JRBHtlx8Z9aiz2DTEc8BS2rNkYyGqgv063Mopn
 tRVqvcmGfiwIgyrhTDu+VkRqtvVvUUKADMdZ0E0L9g==
X-Received: by 2002:a5b:10:0:b0:684:2180:a637 with SMTP id
 a16-20020a5b0010000000b006842180a637mr1592714ybp.85.1660321911086; 
 Fri, 12 Aug 2022 09:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 17:31:40 +0100
Message-ID: <CAFEAcA95O5N_gOJ88zkaPx5BvTFYSSOLF=7XMFc3egCU+s1RkQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vUuY34DhKhNA

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).

> Richard Henderson (62):
>   accel/tcg: Introduce PageEntryExtra
>   target/arm: Enable PageEntryExtra
>   target/arm: Fix MTE check in sve_ldnfff1_r
>   target/arm: Record tagged bit for user-only in sve_probe_page
>   target/arm: Use PageEntryExtra for MTE
>   target/arm: Use PageEntryExtra for BTI
>   include/exec: Remove target_tlb_bitN from MemTxAttrs
>   target/arm: Create GetPhysAddrResult
>   target/arm: Fix ipa_secure in get_phys_addr
>   target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
>   target/arm: Use GetPhysAddrResult in get_phys_addr_v6
>   target/arm: Use GetPhysAddrResult in get_phys_addr_v5
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
>   target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
>   target/arm: Remove is_subpage argument to pmsav8_mpu_lookup
>   target/arm: Add is_secure parameter to v8m_security_lookup
>   target/arm: Add is_secure parameter to pmsav8_mpu_lookup
>   target/arm: Add is_secure parameter to get_phys_addr_v5
>   target/arm: Add is_secure parameter to get_phys_addr_v6
>   target/arm: Add secure parameter to get_phys_addr_pmsav8
>   target/arm: Add is_secure parameter to pmsav7_use_background_region
>   target/arm: Add is_secure parameter to get_phys_addr_lpae
>   target/arm: Add is_secure parameter to get_phys_addr_pmsav7
>   target/arm: Add is_secure parameter to regime_translation_disabled
>   target/arm: Add is_secure parameter to get_phys_addr_pmsav5

Is it possible to rearrange this patchset so the easy
refactoring patches that do "use a struct to return
values from get_phys_addr and friends" are at the front
(ie before the stuff that touches core code) ?
That way they're easy to take into the tree early while
the rest of the series is still under review...

thanks
-- PMM
