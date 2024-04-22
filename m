Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4360098ejd;
        Mon, 22 Apr 2024 08:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiaj6TpI5Fe9R5UMuccJjqpz4q/qNBkt0Pocwc/qGHXgKjEKoaTs/L3EhVe+n92q+7b+gwqeIa7RSFDQcaBopO9gb2Uqkb
X-Google-Smtp-Source: AGHT+IEPVEYRFhSiFu+GNFHKmEUNQYqkM9gDlvey71GeJ1pd8zjxWolkisFzNWMDkBfJ/8gzOTaV
X-Received: by 2002:ae9:f115:0:b0:790:7780:73ac with SMTP id k21-20020ae9f115000000b00790778073acmr2931884qkg.52.1713800291342;
        Mon, 22 Apr 2024 08:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713800291; cv=none;
        d=google.com; s=arc-20160816;
        b=gnAomcunW9T4awu6ycgfVuvljgke4Ln9O8Ztgzc78uva6SLwi1PaaeDOhxTaGSQUuR
         QHZNfvBHBFYCc76l9vkzVHUte3TMPPTyVzj3Quz1hXiP8secYUab8DRnD0SkxiWaBPn2
         6wH/ssNsUK6EKbhgrXVespEFd4veUwNvUiVWG2hCmNb4MdP72MP5TG1MqK3xkiSum6Uq
         DiBk26PLwzwc1lV9TEBKes6e6pI9SAgoaztDEHmcl/uqU8Pn+hohfSnEy+Mxp2lxIxXf
         IAzhc1qpZUjM/PFAb42AW5vHoPtYC3uUDOxlsObPS5MxBEgy/i+49nxXNs1crO4kP6ag
         LKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=UhoLDngw5CiwXftE0s78MinMLVHsaWibEwQOSgqzh2w=;
        fh=xfzlD6rL9fVvmwZJMlDhLJ2fkOuX8KCAW7to0hofGPo=;
        b=Jsy69Ylu+WrcxopT3xbPQJHKQmPIE4+S2/jzzJ/kthz/tdsxtjeZTcUf+MPVSVDOGo
         wkwuYAq7TU4/XihQcVyVTUZ2t6Nz8E/me1u9O5bDnVUbLXGqAEbJGPFR+HuBf0WOJVHa
         jkep6DDoHryH8H6KEOxWkm9W+FNQNQpy8bsUpUgL5DGIIw8PbEqNUEo0IqG4JwYseYsr
         ixgUypQEhWLoRl1xOnzRixbxt6wA9JVTvvATcPtdt0Lzce21P1CO90km78cem5BMxKvD
         35Q4Y36Mub8vJQLBGpjZIm9qcndcw7hlo6w/1zuTKBKl4Y9FN7glU8l5mCQkFAm4aCLR
         VCcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aokETHtn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy7-20020a05620a60c700b0078d60472c4csi10312384qkb.223.2024.04.22.08.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 08:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aokETHtn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryvjW-0001QA-HU; Mon, 22 Apr 2024 11:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1ryvjU-0001Po-8s
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 11:37:28 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1ryvjS-0004eD-8K
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 11:37:28 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572146dd1c8so736021a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713800244; x=1714405044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UhoLDngw5CiwXftE0s78MinMLVHsaWibEwQOSgqzh2w=;
 b=aokETHtnHqsWHTe/W0A0sUaf9Np96dSjtbqRZxbrtUtirKEDwDAivNRrXpagWpUlwd
 N/67/uEQs8PwtzDverxg5pObWz7Rj73c/ntUnQ48g8UOc0YQPTMWs14h+Zw3kq8y7sSq
 m39e+bqmp8ycD7ADggKhfNCE1PVs9CZyIdn3xkqUUlXC5s0P2nNpkwORcLkwUtbTVBiR
 KTcZcdFXk1HYwAaMd2cir+HPutcDvxnP7cEhQz9Bp8LDgCNPZbpljGwwKaWXad9oEDQx
 sLqoaVmcfT5sIR17qAkdnB7neS2zZDBlxEVr0vW/Idxx3GCwiC98p0/rgQ4E/mKAxegC
 vswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713800244; x=1714405044;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UhoLDngw5CiwXftE0s78MinMLVHsaWibEwQOSgqzh2w=;
 b=szCnTqnDS0alyu2hOeWwU2BXdvwHUUEF/+V/1hh9DXhQFJ5vRL93j5JwjtsNt3z2tW
 XgvbW8TdMrwoOiXV9dKBnexMo941mD69NG+CEnjdYRtfgzZ6qow9Ea6b51rT0a1MeKwT
 q2L+T+35wvlfg625IZ9oCxhVcXCrlhSSF6NmjwSbAI3klcuuUsfZfdpMUpJc55tHIfv9
 BfhJzU9TaLz0aTsrTYq9uqbLSuwcxDBGXOMErjk2gu07oXM1W04mWp69pokE0p0GeMrM
 MnJW30DBGILvMztHHqEtNNQIbqP9xqzJmVQLN/QzGO7umVS3pnPcTSXc8js2eiwEdu0J
 kjnw==
X-Gm-Message-State: AOJu0YxjkYGdG1BhUuTxyFPICDsvVy3HGXZvkfkXZXUmylWSfH5HgSuA
 blqFMAC/cZ2qEhIeaKC1zVnxKies33MyV+qclLLCBUdDYq/I1oK4hFeuCxHXJ6Q=
X-Received: by 2002:a17:907:9710:b0:a55:b36e:3e15 with SMTP id
 jg16-20020a170907971000b00a55b36e3e15mr3790168ejc.6.1713800243449; 
 Mon, 22 Apr 2024 08:37:23 -0700 (PDT)
Received: from [192.168.200.106] (83.11.0.31.ipv4.supernova.orange.pl.
 [83.11.0.31]) by smtp.gmail.com with ESMTPSA id
 gc24-20020a170906c8d800b00a55ac217235sm2108402ejb.90.2024.04.22.08.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 08:37:22 -0700 (PDT)
Message-ID: <fa0465a4-6604-4ec3-af45-2d329ca513fa@linaro.org>
Date: Mon, 22 Apr 2024 17:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] target/arm: Make the counter frequency default 1GHz
 for new CPUs, machines
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <CAFEAcA91ZULEjEgTotevp-epgH_azcwrSi9PVnnOSk8gq5j22g@mail.gmail.com>
 <c84bfac7-5fb5-4fca-90a3-93adb40bcf3c@linaro.org>
 <CAFEAcA_PWyu=ca-S=qwePDdGqjX95k3oQ+BJUZc541YEyV7i2w@mail.gmail.com>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_PWyu=ca-S=qwePDdGqjX95k3oQ+BJUZc541YEyV7i2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: hmPiWh8K63kA

W dniu 22.04.2024 o 16:18, Peter Maydell pisze:
> On Mon, 22 Apr 2024 at 14:38, Marcin Juszkiewicz

>>   From what I see in EDK2 code we read CNTFREQ_EL0:
>>
>> GetPlatformTimerFreq() checks for PcdArmArchTimerFreqInHz variable which
>> sbsa-ref has set to 0. So it calls ArmGenericTimerGetTimerFreq() ->
>> ArmReadCntFrq() -> "mrs x0, cntfrq_el0"
> 
> Yeah, it looks like it's TF-A that hardcodes the frequency:
> https://github.com/ARM-software/arm-trusted-firmware/blob/c8be7c08c3b3a2330d54b58651faa9438ff34f6e/plat/qemu/qemu_sbsa/include/platform_def.h#L269
> 
> I imagine that value gets written into CNTFRQ by TF-A somewhere
> along the line (and then read by EDK2 later), though I haven't
> quite found where. Plus I notice that the TF-A sbsa-watchdog-timer
> assumes that the generic-timer frequency and the watchdog
> timer frequency are the same, which is a bit dubious IMHO.
> 
> It also seems to be hardcoded in TF-A's support for the virt
> board too, annoyingly.

I looked at it and it seems that TF-A can just read what is in 
CNTFRQ_EL0 instead of hardcoding the value.

Submitted patch:

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/28313
refactor(qemu): do not hardcode counter frequency [NEW]
