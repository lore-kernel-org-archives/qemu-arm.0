Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4269646ejd;
        Mon, 22 Apr 2024 06:39:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8miSO0218GGAERf5v1WpjE+1RC3px3oqusF1sTvlcpvAuJ13Sm4WU08DBp4qVqfrNvCSvgrnPJit5Zlhd4ThF9+chLe69
X-Google-Smtp-Source: AGHT+IHfX3s5/ksErhDtYi14Q2kRQbjYiALTWXIUMreArVOOri3LbP76H84o4Rtjk1orJT7TPZbN
X-Received: by 2002:a25:4e86:0:b0:dc7:4ad4:c977 with SMTP id c128-20020a254e86000000b00dc74ad4c977mr9252083ybb.25.1713793178746;
        Mon, 22 Apr 2024 06:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713793178; cv=none;
        d=google.com; s=arc-20160816;
        b=QqCfc9oLDN/LVfU5BNYideTh5zZq2lL+Zd8156tvLuVipbbJDbtFwQObC9xmTXhiOO
         BEln0ZmngyOL9U5idd8N9iKZgyRt2T9/2h6jg3BONN8axHmh8lC3IrSJGd45nIQY/+TN
         21itz4rmvVQxCDgT21mRXKpc0//13KvbrADiwZf3ZmXkvaHhwP1cQ0oPzK5+oH1PMUQN
         5vKEdQANZFWU1At1Q3dXqe/LL9kiXmjSqtBlXzLPy9VuLrFtIrJv/38DHeLlKl6f0UhJ
         sz/dG96so1qD2oOijoZVI6Mkp+VnOURRPwhxmYAesJq1Xy9z5P4bioh1Fu2cQutJmp2l
         NTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=M66w4ZMk2jUV5zE9y1t/5ZKvJPgqA4sXDNh2QHRZ59k=;
        fh=b84YdWTdHEByPRzWKyrxPbFjAXAmcUO/nIX+fTYqQBM=;
        b=EOHyPTEX67+adqHeb1BJVylIYHniv8lHqwejRopT5oyNWlaQBcHS6c4gjVQfVqV3+W
         pVJHml7jcF4lGjekxOnuedXBHWXHLtUY2SeSoZcpzXkZUkcP3KS0BHJP/5aR3ZaZumQI
         FNOXwL9MRQPV+7/AcLoG6aqfy6PXFvv5bdE4Rzz/Y/Q273efondnmyzDrlhTswh/YrVZ
         8xKRrFNfo+d6XfBvldIQVcyf7BYM0hwJQsLW/jtxTfz3BhWov9gq8Cm9Q+p7tRasxkrj
         XDmKdTpj1nC+VmoUdir8m9gdrZcmIHh7X+PjMmyT7jqHT2g6dL1LPamkv6R3CpVFl2hy
         LhGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbKTVLC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020ac5c906000000b004daa78923d4si1452754vkl.163.2024.04.22.06.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 06:39:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbKTVLC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rytso-0004Fz-DW; Mon, 22 Apr 2024 09:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rytsm-0004FM-IE
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 09:38:56 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rytsk-0006iO-Gn
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 09:38:56 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-571c22d9de4so5835459a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713793132; x=1714397932; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=M66w4ZMk2jUV5zE9y1t/5ZKvJPgqA4sXDNh2QHRZ59k=;
 b=BbKTVLC3zDg3GUsZN8LIFRHo+0rOLSQNhf7/yijIfBadDvYBdbBkcs9vO+Y0KcueZ8
 uUYeCoEfDRvlJt6EP3CL0X6oiurA9VpqLRG9kN8NvNYnb3hIucJPkiHcrCfzzgE5AKFM
 IqeH7u+sH6mYauKsYTC0KZ8fQPWe1VbLDHFmJc7vNVScLDrgPTeO/b9HTOgIKRhWvpa0
 k/+gGJevaAuk4kj+0HVJaNSVRSVL4qKwmKKGwEvPMljh0EJ0zTZQQ/aDKJr0GqO/lsUV
 5mNkS97JSSmalAvJz+Mkh2HCzAMIgQu9gLuUS7+joUgIblBFfRTa/jEcQEKNuIFsA0s/
 +Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713793132; x=1714397932;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M66w4ZMk2jUV5zE9y1t/5ZKvJPgqA4sXDNh2QHRZ59k=;
 b=p2ttbXFaO/vO10pbUzBUGjQ3ARVpe9ztsnE9SBfc0vAB5oNxSLajXrFBrUbFu2PJH6
 vwykf8NnUMdnH34pGR/cwvKyKd1OFuHymYWYFhFFFv06R+eBBA8PshfYzfIJaCnLJAoy
 kJ0AQQuu4ddlebwuZ3ebyDlyTNiaKr/nRm5FIxeDDZJ4EDSbpdOmlRR0SKdhwRtXn1a2
 ggOvp8Rr+WZPe1ndHU7AoVWt0IWKTq80NceR2VX4kRvSGs4ku7wKEqw/APPP/AKZiPce
 wAnN545x2rooKLRjol5skBJkzcn9/lad2Gd14kVTDNQz6JjeJWKcnpIqCB3rouLr0YiG
 Yz7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY6/uf2JjX+/naq6xhmZLR5IopCibeu+sgKESYuiaOiIly/pyCL5f6CzPgR5CjEsiQxxOjjDYZkAAnq7MWpMPAFURm
X-Gm-Message-State: AOJu0YwU8QKdI2RazTLuzYS9hypOip9xaTP66nRCvvSHIeUkHVjsg3ln
 uail4+vIRxd/ChXl8BnZV6jpKO+a4WfINUwbCBPQenKLvHVlowX7umVPSqUd+k0=
X-Received: by 2002:a50:d658:0:b0:56e:34db:f5ef with SMTP id
 c24-20020a50d658000000b0056e34dbf5efmr6311370edj.28.1713793132353; 
 Mon, 22 Apr 2024 06:38:52 -0700 (PDT)
Received: from [192.168.200.106] (83.11.0.31.ipv4.supernova.orange.pl.
 [83.11.0.31]) by smtp.gmail.com with ESMTPSA id
 ij6-20020a056402158600b005705bfeeb27sm5514568edb.66.2024.04.22.06.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 06:38:51 -0700 (PDT)
Message-ID: <c84bfac7-5fb5-4fca-90a3-93adb40bcf3c@linaro.org>
Date: Mon, 22 Apr 2024 15:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] target/arm: Make the counter frequency default 1GHz
 for new CPUs, machines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <CAFEAcA91ZULEjEgTotevp-epgH_azcwrSi9PVnnOSk8gq5j22g@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <CAFEAcA91ZULEjEgTotevp-epgH_azcwrSi9PVnnOSk8gq5j22g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: BCLNVy67FaCb

W dniu 22.04.2024 o 14:56, Peter Maydell pisze:
> On Fri, 19 Apr 2024 at 19:46, Peter Maydell <peter.maydell@linaro.org> wrote:

>> The upshot is that the only CPU type that changes is 'max'; but any
>> new type we add in future (whether v8.6 or not) will also get the new
>> 1GHz default (assuming we spot in code review any attempts to set
>> the ARM_FEATURE_BACKCOMPAT_CNTFRQ flag on new CPU types as a result
>> of cut-n-paste from an older CPU initfn ;-)).
>>
>> It remains the case that the machine model can override the default
>> value via the 'cntfrq' QOM property (regardless of the CPU type).
> 
> This patchset turns out to break the sbsa-ref board: the
> Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef
> avocado test both (a) takes rather longer to boot and (b) when
> running thinks that time is advancing very fast.
> 
> I suspect this may be because the firmware hard-codes the
> generic timer clock frequency it is expecting. I've cc'd the
> sbsa-ref maintainers: is that correct?
> 
> If so, we can deal with it by making the sbsa-ref board set the
> cntfrq QOM property on its CPUs to force them to the old
> frequency. However this will produce a technically-out-of-spec
> CPU when used with a v8.6-compliant CPU type, so probably we
> should do something to be able to tell the firmware the clock
> frequency (if it doesn't want to just read CNTFRQ_EL0 itself).

 From what I see in EDK2 code we read CNTFREQ_EL0:

GetPlatformTimerFreq() checks for PcdArmArchTimerFreqInHz variable which
sbsa-ref has set to 0. So it calls ArmGenericTimerGetTimerFreq() ->
ArmReadCntFrq() -> "mrs x0, cntfrq_el0"

I added debug output to firmware and it shows me:

HRW: GetPlatformTimerFreq TimerFreq = 62500000

Local tree:
ed0604e99c (HEAD -> test-counter) target/arm: Default to 1GHz cntfrq for 'max' and new CPUs
c0a8c341f5 target/arm: Refactor default generic timer frequency handling
592c01312b hw: Add compat machines for 9.1
62dbe54c24 (tag: v9.0.0-rc4, origin/master, origin/HEAD) Update version for v9.0.0-rc4 release
a12214d1c4 (origin/staging) usb-storage: Fix BlockConf defaults

sbsa-ref with "-cpu max" used. All cpu cores give me same value.
