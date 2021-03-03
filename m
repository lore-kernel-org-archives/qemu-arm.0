Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5662761lfg;
        Wed, 3 Mar 2021 12:33:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjxdoFWBTglb9dUZxy0SzZUJk2XIg78G8WXnqT/MFZSl60xPi5JPgz55SyrEFs9u3UUusB
X-Received: by 2002:a05:6e02:1069:: with SMTP id q9mr1027688ilj.97.1614803615451;
        Wed, 03 Mar 2021 12:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614803615; cv=none;
        d=google.com; s=arc-20160816;
        b=UI3RUhBw4J/y8PSk6P/4u/DZsfLP/limp8Avx+OUtekXCuoKWCS616TtRXT8rVBkkJ
         Wl6cThX9iIX2Ya4YC+bLpw9ppAfXBQI0a+vptKwWnp6nBBvl/TasRmaLgq0npsEO481N
         hIWQQkPfx/Aa7iSXpPBhKa7Me9dRR7rYMSja+mOgAIiBgiBbDdoim+aSsNIrZUz67Fes
         1nR+T9Dn6pHaVanqwTgTYzfDprbswjKBIF90jQmpbwBQgotMzd0cfkg6uZhbRZHUg1c2
         /5GZDpuJ/0dwqGEvcEnXYuWhZVddpplE2oQK7AzkEE3s7x2DcyT8K6RfsXZ45rW1YD93
         uH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=MVSwh+Xusvo5kNnlZiAYV0nY5+h/9ef41h95QX9GlTQ=;
        b=lHRRql37eqCyQ5WutRflz1TVd8e1UEGg0EF4gLbiMG1+JeIY8+YnyFm6kXJxAJOpxB
         h86W5jCwdqvUUxAKqB8NDEMWCpMUTHa7gwpHNnS1VepE3nsHHn7uDzh6iE5QfpaQWiRX
         fTM7qFBGrF4HVLEYmpPKseLYX5SMLDPqazIlfgW/68M7ZO5utu+W9DC6PCA3wPM76GF+
         aYaQU5ZAXEq8RLzLzIeDTtSQhZFX9KDobecSex5Ci4SO7lNMHjJMaUKX8AbVw4+ncDVq
         R489ivdLg9PrOEOkcOJdUo9J4YsZ8OnEEQC5hW++kMEQPbUWrEXwOfDITM1cjmI4fjau
         tU/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kp6Ojeic;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si12900434jaq.104.2021.03.03.12.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 12:33:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kp6Ojeic;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHYBa-0007Fd-P4
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 15:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHYBP-0007E9-BL
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 15:33:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHYBM-00061l-Hl
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 15:33:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id w11so25142436wrr.10
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 12:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MVSwh+Xusvo5kNnlZiAYV0nY5+h/9ef41h95QX9GlTQ=;
 b=kp6OjeicOHNxqwMpIevlGtQZg8J/fDDUhw1Ji/Fkj3c6WRkPANMz1m+n0DshXh2ddd
 /gw3GMUyE/NOuNivRyN6P5yTapZWJ7UgyA+ZEicNoIy2fP0CGDEskUj7ONjhnQM4IK1R
 nKyY9AC6bS0JFo687u1SAO9C/YWM/bHp15tFpeBz3Qtdw6Of0fSOf8ZeKhfz4Y0KHEZy
 nDSaWT9F3k6L+fM8lWv4K905zH5T+LnrbvlghVM9dbrOSM0LOeIU7y0Z2wGdtjs4RKfr
 ltpxRHrd8e7whw0o50gxnPti1Dt8V4CUZb/rVyirlqvrVo3Ll2cgdeLV7olMYL80unAv
 3LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MVSwh+Xusvo5kNnlZiAYV0nY5+h/9ef41h95QX9GlTQ=;
 b=mtCedjvCCoHQFCXztbAKZwiE/1MZ3YhmmQBMPbAN+R5703DlGlzeBSPGmAzKtIEDOP
 x4ZIAsnJJtHgwBVuK5Q4RvTX3rfBX9cK34mrzWYac4rzPN3ofhG3aOGbD3x1dzYR7fIy
 DG20iIjedEJslw66qk9TVPC/YgbZyzbaujGlT2Wr3jPJGrScM3Rw3P5yIDtbqbFf45sp
 YrKog8KslpxW780KfWauLqKEviKfO+myAnL69ulM/nWFvqtyDwLtYfCayV9ElZKiskw0
 56mEK6smNuxJN/5ZsSNQELtobbQPUGU0zEcDoPLxF9zvz6xSqC4CFzwxnoEzniPvF5Z+
 h3Fw==
X-Gm-Message-State: AOAM531+dA83reWpKVKq2yKhWnkykgUSvMRPu+D0+sKeCgPo9gsbNRTO
 CP9WB/yikwh5xWSjaFodSLkHxA==
X-Received: by 2002:a5d:6610:: with SMTP id n16mr390473wru.399.1614803598513; 
 Wed, 03 Mar 2021 12:33:18 -0800 (PST)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl. [89.67.26.161])
 by smtp.gmail.com with ESMTPSA id
 p18sm27358033wro.18.2021.03.03.12.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 12:33:17 -0800 (PST)
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
Message-ID: <95e5a34b-1325-8eb3-25ca-b3e63b4e67a1@linaro.org>
Date: Wed, 3 Mar 2021 21:33:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7WTWA186zH2a

W dniu 03.03.2021 o 19:06, Peter Maydell pisze:
> On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
>> It would be good if we could get 6.0 closer to SBSA compliance.
> 
> How far away are we at the moment ?

Hard to tell me how many of those things are missing in QEMU and how 
many in EDK2 we use as firmware.

SBSA-ACS failures:

GIC ITS is missing (Shashi Mallela works on it):

  102 : If PCIe, then GIC implements ITS  : Result:  --FAIL-- 1
  104 : GIC Maintenance Interrupt         : Result:  --FAIL-- 1


System timers are not present in GTDT so few more tests are not run:

  206 : SYS Timer if PE Timer not ON      : Result:  --FAIL-- 1
        PE Timers are not always-on.
  207 : CNTCTLBase & CNTBaseN access      : Result:  -SKIPPED- 1
        No System timers are defined
  505 : Wake from System Timer Interrupt  : Result:  -SKIPPED- 1
        No system timers implemented


There is no SMMU present so SMMU and IO virtualization tests are not 
run. This one is probably related:

  605 : Memory Access to Un-Populated addr: Result:  --FAIL-- 1
        Memory access check fails at address = 0x104C0000

