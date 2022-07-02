Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1995413lft;
        Sat, 2 Jul 2022 07:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6CugcGDY2m2/dBAhbQHhLPSV9NVwp/R2XT5whfn2F+UotVIp45bJgyyFiZhrjoqkAkdWK
X-Received: by 2002:a05:6e02:1487:b0:2da:987e:4e8e with SMTP id n7-20020a056e02148700b002da987e4e8emr11450362ilk.115.1656770967928;
        Sat, 02 Jul 2022 07:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656770967; cv=none;
        d=google.com; s=arc-20160816;
        b=ucGoORb0zef0E0tPIu6E9S96zGE+8cSY//0plz/50QpvwVyTUmGYfhR8Gu1nn9Gof/
         xZULda41dJnxNSv2D38k9MWsRDzjSiDYp5KApW47D0fExhdH45V2bbrxumyrvrZj23S5
         ZVxUlmqYXoKNlNOwsGP2MdDFpOOkiwkqvtrGNe3gGa3Io/vgFfKdQAOT1MH3XxjptGh+
         xaxb02uGVFlFXd5RjS5f4V4zEecuZ5/1XbN1XcDxJUCPtP3vC2P9x0OADB+5VHYTpUjC
         T0uuW5MmkNNmGUKf6h74blVnp9EOclI9p2zzxyVFiRreswcKveiNB6JGzBV+nYZqMzoL
         Lw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PXISK4N2YrRrtTnjOtxCLZcCteHVo1OwGJrOmDCcfdo=;
        b=T1mDYljF1J1mWl+Ck5nCff2KK/zMtjcsxPdTqGtwiRXJeRJXLE/imwKohawoI4C8Sc
         evU9Bpocqc/IhScbjFoG8OpG5asMK5xjnJl5YRUuvfDNLClUSoAsFIYfjQuv3uSXF7iF
         C4HmMYx/JE30zDw760bwMI6fwV4LAtXehdDo7l12TmMXCMNOGbnAu7nK+ziteFQoKOW/
         USe1KjYtV4yol8icZAdpxO45s/JJqGb6JVOAejLMBXvzZuwdfEMGQOo8T2H8TAfW6adX
         bS3DgOOx82txluBndpZWyNSfalAPNmyZ7UIrPj1k674ItCvOjsSlM/jaI3Paaot3lrpX
         SniA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KxX3V/h0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020a05660203d000b0066981953476si8887561iov.65.2022.07.02.07.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Jul 2022 07:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KxX3V/h0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7doN-0000NH-9Z
	for alex.bennee@linaro.org; Sat, 02 Jul 2022 10:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dlx-0006Wg-OE
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:07:00 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dlu-00037B-K4
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:06:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id r66so4921836pgr.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PXISK4N2YrRrtTnjOtxCLZcCteHVo1OwGJrOmDCcfdo=;
 b=KxX3V/h0569JOKkGwBntrTKCQ9DRplXIxS1jAeDU9pinqCfQpNsckL8j7dmN9YW2dE
 37j/ZpgvnvKR2pc/IH8N2SD71a5kY18ouPhXUUP4NcoeHnLZ2y4MpXH13WkCD5EcDhD2
 Ca+mEfR84JPc7TgJnCqG1ypDlur30tkHRD/OvNgYpSAnnKP49zUN+WoGo2mvMtygwRU1
 DgMnngufPEmBOv6y3fxVWLEsSgSZDqO4gx80YSWnguzCxkHFXcSr35XbEGqcckjpHOQT
 qHWro1A5abmH8x7QPOT406fBeWQkjyctWHav3q3Va+QDUHtoDq71ByGUOVIka+2OeB5g
 Rsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PXISK4N2YrRrtTnjOtxCLZcCteHVo1OwGJrOmDCcfdo=;
 b=7YdeYVx0QNcMHblc9v3GcfKrXzfC/B4QEyf/w5tuZrqss0bwFRF5V44BT3Tx2vc3nz
 1yqTk17tKTTIpD2T8288kPULJZ3OGrsJwxiGEIoq3IvZfCwFiQmx7BxlkCW2H/ugourK
 2B/Bj7SWnMIS0WGNFMWaVALJOkGe/56kySINrlalOv9I4VEJzWiKKy9qLd1K7y3VlOUz
 fMrFhsUMtN4hleC0J1fo+N/J8fdL0sPKC4ALYJGJT1d/PyvVUK0BwoenpFlBuHwu0zqO
 RWcHUu4Z68um5ZdC+ZvM25hbGc3NV/U5h9FqbkCNoZuCWl0JJAA4s7fDYAzi3v0rhC6F
 novQ==
X-Gm-Message-State: AJIora9yprwLRYDd4PJfzvZaSGzghG5CgT94NTC3fVrY9QHyuaGvMXMI
 uHjnHkmAVWJPPZ0LABj+ELbZuQ==
X-Received: by 2002:a63:a4f:0:b0:401:a0e0:1668 with SMTP id
 z15-20020a630a4f000000b00401a0e01668mr16527462pgk.21.1656770812953; 
 Sat, 02 Jul 2022 07:06:52 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 nm13-20020a17090b19cd00b001cd4989febcsm6182202pjb.8.2022.07.02.07.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:06:51 -0700 (PDT)
Message-ID: <4212d57a-2465-4e2b-7998-97bc3ab8bbd1@linaro.org>
Date: Sat, 2 Jul 2022 19:36:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] target/arm: Implement AArch32 DBGDEVID, DBGDEVID1,
 DBGDEVID2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: At2n5VO6Jwp0

On 7/1/22 01:11, Peter Maydell wrote:
> Starting with v7 of the debug architecture, there are three extra
> ID registers that add information on top of that provided in
> DBGDIDR. These are DBGDEVID, DBGDEVID1 and DBGDEVID2. In the
> v7 debug architecture, DBGDEVID is optional, present only of

s/of/if/

> DBGDIDR.DEVID_imp is set. In v7.1 all three must be present.
> 
> Implement the missing registers.  Note that we only need to set the
> values in the ARMISARegisters struct for the CPUs Cortex-A7, A15,
> A53, A57 and A72 (plus the 32-bit 'max' which uses the Cortex-A53
> values): earlier CPUs didn't implement v7 of the architecture, and
> our other 64-bit CPUs (Cortex-A76, Neoverse-N1 and A64fx) don't have
> AArch32 support at EL1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
