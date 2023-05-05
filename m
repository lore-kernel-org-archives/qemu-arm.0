Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp514232ejq;
        Fri, 5 May 2023 08:53:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mZECn9nNCjd6uLLvZtbyxJ2desIBAjKWyB36aTJGRdabiHURBGgANDNDmrnfFdGalU50g
X-Received: by 2002:a05:6214:20e7:b0:616:5042:816c with SMTP id 7-20020a05621420e700b006165042816cmr2255840qvk.33.1683302026734;
        Fri, 05 May 2023 08:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683302026; cv=none;
        d=google.com; s=arc-20160816;
        b=AVtiIX2uA9kNTVMn9nbhECM2BdCq5V1w59K87JTLJSFVEYtNwekyVeeMFEmwK0PbCX
         jIqFbo6iBxn/z46lcpO45NCkgrclKFgUBQsAnd+yk+ECeYnBSH3QbyvuoLGHvMfqFBwy
         gfr2UfriOlNbE2RyMwgECYz0C2/6oTbFxEFBfAfp5LCNK9J+6NnlPUmCR9MN3/ZY8b64
         mP8KV97wNRcCRp6EenyoHZ303N3ys+jIz5307mbsVQs6UNPjGwtXXTOWiSay5t65oIk8
         FRJM6eOEmcIpix2SpHgunXlrEhfU+kXyybXYvuBiVM1MZsdFWCfAN990mbOZE9J3vKBa
         xZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YoCWGVRJfuuh64nXbvoM3IDEF2kLpn/56KO0GAyxRWI=;
        b=s2Mtpc2RH6GqJKe6vtKoNeW+yGNTF3La5ORZV8/ttnC/boyBUh6C7sHRtHI3Mz4T5Y
         4YX90rqaPuma3aS9OmLy+nX6x+sVlmi5Egqe6Op6RfjxTwlIfcGApgMW1Tsh7MsBRqRs
         zKlCwUWa1Yzby5wKdq5IVtY8HwXeVYagY6fPyFnYGqBjfuzVgvRnNQfatfMAIl995DXV
         d5hGZUwbQbAkV5eunxivHK3GTTn9eZPyYJ42o89mxVxpH3SD1OjvLrBvpFNtAmgYEcTF
         l0ZbbhkWKcWHx6uZ9PTXm96omwtWpoTxvmH/jhF2yqMReAcxxcbHoM2e+Yz1IyLCgamT
         REuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u5E4L0cn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi2-20020a056214248200b005e6cb49d3bfsi720137qvb.500.2023.05.05.08.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 08:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u5E4L0cn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puxkD-0003CH-Q6; Fri, 05 May 2023 11:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puxkC-0003BW-3T
 for qemu-arm@nongnu.org; Fri, 05 May 2023 11:53:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puxkA-00089f-C3
 for qemu-arm@nongnu.org; Fri, 05 May 2023 11:53:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so1364647f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683301993; x=1685893993;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YoCWGVRJfuuh64nXbvoM3IDEF2kLpn/56KO0GAyxRWI=;
 b=u5E4L0cnEw0b/bIsqR6HGYoi5/V6dDloDt5WSh4A4AOquv/5v/XMOfMDsqPUnZ2b5k
 NgOcHB9j9dRuYjjwqA8SxW5H8TBH6+AUYWNNX+yUZslwZayskBx6JnzQ9OS3sNlAMvFu
 T2e9K1g3MDi84PeclU+/lzWRIJ5V/2/QeA6CyNSmQt7/prCiQUNpnhPlcaGgrVZQTDDg
 18s7fMYL42el9MmdW+3jnRrjrssDYdDQd/ruzaz9AmLBG2Oo0P5cFlZ4D2v9Bc8469r0
 +auPqvBL59WCogtj2ynvuTIf845QUie4lCK3/1i6KSNPMLz5poXgCq9UyqZRN/jc7eac
 wl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683301993; x=1685893993;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YoCWGVRJfuuh64nXbvoM3IDEF2kLpn/56KO0GAyxRWI=;
 b=NlC4JICQPmHP/UgnSHB0KXAZvEU3YztsTVFy17o8gakUVH8/jTBXsYylnt4PT6IEwN
 tqLXYeVqTqaKViwGAz8HwRcE3pZ9xupgyoEYMXGt0DwGK/Bc9z54H81fxU8V6NJbecAZ
 SwGRIDaW9vUnVcXugEA9EkCOYshLVLMgRWoeHMScgFCzdiQAIaHlvYViZFm/EEw/KbVJ
 oHeDAevOzsnqtXPW18CbS6/nvnOLj4PQOhGq/JQv7GOhsi6wYae28mwK2/pfMN3lV4HK
 1QxlL4T7oBCySYJlTByQ9mRwmcVLUIQsTpg3G4qtPYm8dWU5xFYboALNKzi9E2iF9mO+
 cWQw==
X-Gm-Message-State: AC+VfDxlyAmMLUXd6CCnbbt6VsBRyIjVPuZcFo2aKnymDu552zP3w6xZ
 JWckbjtDbMcvZS6Qa0mKF/YUIg==
X-Received: by 2002:a5d:6e08:0:b0:2ef:baa1:f3fc with SMTP id
 h8-20020a5d6e08000000b002efbaa1f3fcmr1594402wrz.19.1683301992670; 
 Fri, 05 May 2023 08:53:12 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05600c21d000b003f318be9442sm8493736wmj.40.2023.05.05.08.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 08:53:12 -0700 (PDT)
Message-ID: <5674d0b2-727e-a8a9-db1a-c8c06fe72c1c@linaro.org>
Date: Fri, 5 May 2023 16:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] target/arm: Fix handling of SW and NSW bits for
 stage 2 walks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230504135425.2748672-1-peter.maydell@linaro.org>
 <20230504135425.2748672-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230504135425.2748672-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
X-TUID: sVHTnc1wgqtv

On 5/4/23 14:54, Peter Maydell wrote:
> We currently don't correctly handle the VSTCR_EL2.SW and VTCR_EL2.NSW
> configuration bits.  These allow configuration of whether the stage 2
> page table walks for Secure IPA and NonSecure IPA should do their
> descriptor reads from Secure or NonSecure physical addresses. (This
> is separate from how the translation table base address and other
> parameters are set: an NS IPA always uses VTTBR_EL2 and VTCR_EL2
> for its base address and walk parameters, regardless of the NSW bit,
> and similarly for Secure.)
> 
> Provide a new function ptw_idx_for_stage_2() which returns the
> MMU index to use for descriptor reads, and use it to set up
> the .in_ptw_idx wherever we call get_phys_addr_lpae().
> 
> For a stage 2 walk, wherever we call get_phys_addr_lpae():
>   * .in_ptw_idx should be ptw_idx_for_stage_2() of the .in_mmu_idx
>   * .in_secure should be true if .in_mmu_idx is Stage2_S
> 
> This allows us to correct S1_ptw_translate() so that it consistently
> always sets its (out_secure, out_phys) to the result it gets from the
> S2 walk (either by calling get_phys_addr_lpae() or by TLB lookup).
> This makes better conceptual sense because the S2 walk should return
> us an (address space, address) tuple, not an address that we then
> randomly assign to S or NS.
> 
> Our previous handling of SW and NSW was broken, so guest code
> trying to use these bits to put the s2 page tables in the "other"
> address space wouldn't work correctly.
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1600
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 76 ++++++++++++++++++++++++++++++++----------------
>   1 file changed, 51 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
