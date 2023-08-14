Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp2925743ejc;
        Mon, 14 Aug 2023 01:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5bNBUbUGaC5/TffF4D7X2/FQRlhXCKyCUf/HpwnWH2OKeUR5JVJz22+y7vA0EeTwbBLxV
X-Received: by 2002:a0c:e1d3:0:b0:641:8d74:7af6 with SMTP id v19-20020a0ce1d3000000b006418d747af6mr10481082qvl.28.1692003008023;
        Mon, 14 Aug 2023 01:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692003008; cv=none;
        d=google.com; s=arc-20160816;
        b=arR76yZE4FPcEmwmuFxf3aekT7wWrKTXI2pNZjBjlw8X8mUVua8EBHv56+WSFVuBFc
         n9P9n3/2f0mAzCLC9a877ic2g+LFRrjJGg0dePQ74i31uXhc7b2v297p6n+BuTwvjqVW
         EiFXuzcaXlUefrotC1uAjR36ERDnW9uGuvFVLI5wv8iOhWhhz63RgjKX7/Cm1h6TyDbh
         pGNy2N0l1S1mQsGiUaCKT7kvQZ6w/2Q0ZMeLGerS/abFYEcqsLA25Nh27RZS68TKh6xA
         Z1AyoLVV2swXuURyiJSnrOTzWvVE/M73V+0+0QhC6Wp10TubpkkFfnNXQp7grgDlth5A
         89kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=vHed+cI8WwN0W75+6FogRDEwr6sVO/ERyhD23Ehy2uA=;
        fh=dZdyJ/nYT8f5SvPg0l70MfGWhO3Vfr84rpEeTFdCz9I=;
        b=kF9mbiDm7efOdbHgj4OZRGD/DQCrR0aPtxfpqSK+EHd4EEAIgwNQ4PcXyVc6NqwAzK
         vU1L75POzsIOFfOci7uJHXKXaiWPEWgKFCNthk0ikzGRxhqar4A5PVx0mn6Of86g/BYu
         nJ9srMZEXe470GAaEcPlGEMfD5cbtBr7ugQ6yjIrRCKiYV7ANqs8zSYpzsyiC1VzSDm8
         UPWuNmXgCYfVmmoNMBdGpiLtfucePjFKHsN1oSkBDg95w1cT/vc2DP5QKkvzS1MA1MAQ
         0Nh35ja2NOYDTqMEIuzUZ0AJWZpjjCCG1B/IOv1TyXPkKSN/BDdbFC2e/d7uHz1LzQon
         Wcug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vv8aC07A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020a0c9cc5000000b006471ebac7c7si1095046qvf.379.2023.08.14.01.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Aug 2023 01:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vv8aC07A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qVTGt-0000FZ-Tx; Mon, 14 Aug 2023 04:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qVTGs-0000F3-Fg
 for qemu-arm@nongnu.org; Mon, 14 Aug 2023 04:49:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qVTGq-0004xL-J6
 for qemu-arm@nongnu.org; Mon, 14 Aug 2023 04:49:54 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5231410ab27so5221778a12.0
 for <qemu-arm@nongnu.org>; Mon, 14 Aug 2023 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692002990; x=1692607790;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vHed+cI8WwN0W75+6FogRDEwr6sVO/ERyhD23Ehy2uA=;
 b=Vv8aC07AlvUXlwc94SvlB8hLicOG9UtOQMB8oTjunEMN4O2Qo+aVa85Va8AXCwaP4L
 ztjex0Gu38bs0t61iAfY/8WRdt7omceFoGNd5oRNDWYQI7XPz4qEvw4bPVWx0RQ54xr+
 tLV8Uj5BWIiBQlKqDicrmi51hukmbO4UH2/JyspgkxTaT5XWUOHtYxvA4ecThvugeZrF
 q+fz1rzOD4uvstCWaUhwj+xmy6kEO9ZeVhI3Ht0HXzCk40kBtBoU+5mTeHfE9s1VPwwU
 ZwJ6KcT6GnuXZ6aHRpXsUbH5W4tVL5IHRXlrhedS/alQSp99/nisD/PkCrVyxHCvoQjU
 hBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692002990; x=1692607790;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHed+cI8WwN0W75+6FogRDEwr6sVO/ERyhD23Ehy2uA=;
 b=lz+GxYMaiVO3e3S6rHKCvzZ5qu5KVeSFlxfbmmxsb+yl54F+ul6iWN96zc0XTDIN/O
 6gnagR4f6NkPeCvUtayXRWquv9UnOXDyD5B3+XZk8e0EzNAwhv+h+GILQIOb1KRh0b+7
 /U3YpeBaVZwEM60NtNMYsVNk6SHEdRi9p6a3Npy7DLQMpf02a8K53V6/XEfn9ol7GEHw
 nl4qU6LjjoqkMuTIt298w5Z+/uHQMLf7Tm6qSs3FBQ9glWbrf0UmMwF2Md0ZbMABRvby
 ghJhvQbY/cdq+n1iNAQzOFvfRBHU34iKTQlaRNdZSlnR3JysIYLDkZPl467Rd9dNIS/B
 JTGg==
X-Gm-Message-State: AOJu0Yxe/8ZIGW8TDXLDXaqvjaDTyOVIzg7eh2WQtiovV5CsSgCmCtqh
 zfV+OAwmCN3KeBBRfOiTjXc6tQ==
X-Received: by 2002:a50:fe99:0:b0:523:1a09:4e2b with SMTP id
 d25-20020a50fe99000000b005231a094e2bmr5137837edt.40.1692002990398; 
 Mon, 14 Aug 2023 01:49:50 -0700 (PDT)
Received: from [192.168.200.206] (83.11.3.31.ipv4.supernova.orange.pl.
 [83.11.3.31]) by smtp.gmail.com with ESMTPSA id
 w4-20020a056402128400b005232c051605sm5211269edv.19.2023.08.14.01.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 01:49:49 -0700 (PDT)
Message-ID: <05428cf5-c2b9-7e4e-8add-1085cc97a8fd@linaro.org>
Date: Mon, 14 Aug 2023 10:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] target/arm: Implement cortex-a710
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-6-richard.henderson@linaro.org>
 <CAFEAcA_Lzj1LEutMro72fCfqiCWtOpd+5b-YPcfKv8Bg1f+rCg@mail.gmail.com>
 <17230fdc-6daf-82be-e665-97ca64d16feb@linaro.org>
 <CAFEAcA8viVtMGqBJ9D-2rehecb7QB7-F8PObhNTY9U-D=aNMTg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8viVtMGqBJ9D-2rehecb7QB7-F8PObhNTY9U-D=aNMTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xvrJvzrUpOO+

W dniu 10.08.2023 o 19:12, Peter Maydell pisze:
> On Thu, 10 Aug 2023 at 18:05, Richard Henderson
>> On 8/10/23 08:49, Peter Maydell wrote:
>>> On Thu, 10 Aug 2023 at 03:36, Richard Henderson

>>> Will sbsa-ref want this core ?

>> It only has 40 PA bits, and I think sbsa-ref requires 48.

> Yes, it does want 48 (we ran into that with some other core).

sbsa-ref needs PA > 40 bit as memory starts at 2^40.

Cortex A57/A72 have only 44 bits for PA space and are fine.

 From v9 cores I look forward for Neoverse-N2/V2 cores.

My "AArch64 cpu cores info table" [1] lists all/most of Arm designed 
cores with some basic information (arch level, 32bit, PA/VA, granules, SVE).

1. https://marcin.juszkiewicz.com.pl/download/tables/arm-cpu-cores.html

