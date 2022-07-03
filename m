Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2457796lft;
        Sun, 3 Jul 2022 02:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTJsozArkvmChaXrOFPMbwnILO54XpQZOdtR7tRgYPQA/mGzi0NFic9lsnQpk1nImRYwpq
X-Received: by 2002:a81:6a89:0:b0:317:ab58:ccb5 with SMTP id f131-20020a816a89000000b00317ab58ccb5mr25737873ywc.393.1656840444750;
        Sun, 03 Jul 2022 02:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656840444; cv=none;
        d=google.com; s=arc-20160816;
        b=N+KHPv5W2omC38Au63WnUMCKluHTBkGL26J+xz9rEyEFOv1uHKMHhloeBig1Joehzh
         oTnaxQdgqFgCr00fN+qdo0lG2tG0V9tTNdc0YQHakzOD1ShrMVWdx4+IcWUnHQjUVgaM
         041djwCJJpTP3o9miq5/bIEnRQ4en4lZnsVl57TaaxRSmcPSPxLEYE3MIALEmhcD0/ig
         cWcIsy1KjtZ3D6/cTOHycfUMlHKj/jim+nCkowBExW3acgQCN5WNyDId69VPaU79yBvn
         ph+EUIVaPmFQlG+LNEEGP9LKv1iw2Mh5BH6jNjFd07r4f++1BFzIJAvaVQ5Z+GXMKsiy
         7pgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3F9dj4cwxN/aZHyskYVEFvQdozaXzYOgJJuO1ZWk7Yk=;
        b=EFe2L5Yr37hTunxask+CPogI3N3EP9NvyCvXIpG4miRi2+TfuOEEXFr/FwOHJA0slp
         i5R2MQmTr++It8pVaz8obK+ZL8WRs77amce9GqpiXpe3EnVT9MnG5+wGg9u18qW29T7b
         ZPvmF/NjOt8hp9o+hm7R4e4wzg06A0BFxYb8cH1WbAZw/V+H2SkKxZ0SdTcEqdkUfFcw
         H0KvDsauCIwCMO8Rv2fBCpVMSE1mRANJXZRo/0zRP4uunymjO8ZwPCRQvOG23+/a/YBX
         A51Ga+4UQq8cB9ZUIKclOHdr1iORaUujP4UTFDxxz2oLCCnvNuPtSATkKwlQWbzpX28z
         RQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B6LxVobU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203-20020a252fd4000000b0066e35b3c28esi1808251ybv.259.2022.07.03.02.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B6LxVobU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vsy-0001u0-5A
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vCG-0005zk-06
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:43:18 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vCD-0001ul-Uf
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:43:15 -0400
Received: by mail-pf1-x42e.google.com with SMTP id r6so2042895pfq.6
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3F9dj4cwxN/aZHyskYVEFvQdozaXzYOgJJuO1ZWk7Yk=;
 b=B6LxVobUpFezzyVzi1SWIxt7UptAHW6VsANW2dPdgJZHpRrBofiUq4J+3E+Mfy/HBm
 NAHmK4ob8uzUHI8/HTNwaZT5kVvcS8IyTxBDNeSAOdqH4qVj44Y+JE2vPZbhvauU+/6X
 eOxGDxowERcKeiZ0UGZbvfmSKoWUbP+9FJytFNRJKWzf12UMCPSMErHckuZwS+r04OcF
 hLfTRAY5HY7DWGTrxVRi+175AHMkMw1tOPE3hHVkhSK/CZW3T/odBkc44suUWHfHqG5H
 aYaOR5RuorvQ76DOGLkycKBWyk+bYtA53cTEBGVpZKU07n4snEpQBukhkuOJet6oTUit
 DRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3F9dj4cwxN/aZHyskYVEFvQdozaXzYOgJJuO1ZWk7Yk=;
 b=LEy8Vm1XUQyTOUbw8Vh+gSrMfP+3SnFALAM/wycIKTY7QX++djWIJ5n5bvHMxrJu/r
 ibQjrz//KDk5l8ugeN+oiJrZwC/6aSgLLBaZs4ADrw5T4+nnw8z2EX4yrboblQ9TjKf2
 e7MbVIcrgIMbMtK9REepVRsmtDYU+LdBuVi5ZgWpchaZJHmEgRrNpBCjBrWw+PzZOGAP
 rFdhdcmWalfLiv9QwgejU3b9BNlyzkLZOmsKWdF7R10am2nfaLS3jz6lDoCssuB319Gp
 AKAOUvHTKYRUNZgTDURr5ItbxaTl8Qpc5KMPAtC/LHYpNQbmZh3s24UIzl04cw+l4UFh
 J80w==
X-Gm-Message-State: AJIora+ldHpD06IZzk9CF3bmQ/8zIYb/QTwvcH/9OBKhno9Lv51fFVDP
 c6o10grNmYwaTnIcDK6ul19ZRA==
X-Received: by 2002:a63:d751:0:b0:401:9f40:3fcb with SMTP id
 w17-20020a63d751000000b004019f403fcbmr19907153pgi.311.1656837791679; 
 Sun, 03 Jul 2022 01:43:11 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a66c200b001ece55b938asm7360557pjl.32.2022.07.03.01.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 01:43:11 -0700 (PDT)
Message-ID: <f19cef5c-239a-cf92-79f8-878c4252777f@linaro.org>
Date: Sun, 3 Jul 2022 14:13:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 01/45] target/arm: Handle SME in aarch64_cpu_dump_state
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-2-richard.henderson@linaro.org>
 <CAFEAcA_vso+2SFgzr6h2-TxrA0XJ8i7BkANX9Cu2j0oBjR-0Sg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_vso+2SFgzr6h2-TxrA0XJ8i7BkANX9Cu2j0oBjR-0Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yHynG4TrP4OW

On 7/1/22 15:41, Peter Maydell wrote:
> On Tue, 28 Jun 2022 at 05:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Dump SVCR, plus use the correct access check for Streaming Mode.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Dumping the actual ZA storage seems like it would be more
> annoying than useful :-)

That's what I thought too.  ;-)


r~
