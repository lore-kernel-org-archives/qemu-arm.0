Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp478438wrw;
        Fri, 16 Nov 2018 06:51:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5dkbEEZ6NWwyUnUKXFXJ304cfTwleuvcaCM0qg1ghvlOGwc0sJ4JNuKBprcUkQUyXHuMMfg
X-Received: by 2002:a37:ea0a:: with SMTP id t10mr10191553qkj.273.1542379916932;
        Fri, 16 Nov 2018 06:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542379916; cv=none;
        d=google.com; s=arc-20160816;
        b=zoQW9KtoGdrEhzgmsnCU8zkvLdlm3mTt/ynJsAkVFi1wRo2xRxFKUtnVlDXCnBrUU1
         rNcUYPYz4t18Qi5h8+WeyDJtAc5LG6s+eaDALyyjsSl0h8D8OaDT7CWcXgGsqxs9diDY
         Eu80idFm8eUuluSPd1tnVMOdgOzl9Nn/Q0Pue3wWBc9/CzWaHgUKIIUWDkYKaH4NZiIL
         0edNxYrbiLLD09XjOUKnM0jltlpJiOyOkwsSMO411HGU3BOiR6caqhkPc5AEpefv9wpL
         y66m4tXkuCJ4FwxoSZTcSTehPjiba2q8W+u0Y8ztTlEkyrwTTQ6gSbyymCtfGDmN1k3n
         124w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=YP/35K0lYm4uFdT8+q1D9h/ee64jqjT+/GPEVe/MkaU=;
        b=TVn4fsyIqGYJlJQUiEqJl6UFXaIef1JfwQ0quQI7GUHu1bBc3GgQge6CSstZHP6ELZ
         Ax2revknjlVkD7Sj6yB8VA9lRWDcOg84tbD3hVcCtyECZXY/8w2u6ZTlqs0cVIbt1Hzt
         Ta7z1f7e0qecET1dD3zzHEfFXkZj8DZRZVl4AuTbhGoPmvofiPwpChzBGjdpZ1eMlahN
         JAzy4lFPzl/rlTBvf7YH855R3sKKtXm+paKLktXuRlci427lS361eWokX2Snn2tUIc8h
         0tuEVvnS6GIOEO2cq8Mz4W6zd9y7SXQ7PxjJVFxwZDTtqBReskxBlNmfzL+9tVwj0tar
         Xv3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SAa1UyCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k38si11735005qvk.220.2018.11.16.06.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 06:51:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SAa1UyCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNfTQ-0006f9-AE
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 09:51:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfTG-0006eD-7L
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:51:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfT1-0004sZ-JU
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:51:36 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNfSz-0004jq-7g
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:51:29 -0500
Received: by mail-oi1-x242.google.com with SMTP id b141so10809704oii.12
	for <qemu-arm@nongnu.org>; Fri, 16 Nov 2018 06:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YP/35K0lYm4uFdT8+q1D9h/ee64jqjT+/GPEVe/MkaU=;
	b=SAa1UyCW1nj2rZ36idK1cPl5EYYSsrEpHN/zVDlfkllEn8pWpUhHJUc70H02jP9LBH
	szPXtqYRhz+mBgKrp633d9WPkM8+R4EQteSRigE0i62/UGI6fZheG+m4cECs70vdCuMj
	5VZOrcaHvxfhPrPxjHWC4V2wMmVYM2G0xvmW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YP/35K0lYm4uFdT8+q1D9h/ee64jqjT+/GPEVe/MkaU=;
	b=uYm8xfWQU8ZmIstJ1OaDalEWvoU+7ZyCTJxdhOL/wmBpmejXYdp7a1mnQetaCQhVdx
	IX8JbVJv65KgEtUgTytRbg+kU77uSrPqV9uQVfOO1MVjQ16ym9YzhvVM6Rj5cjRASSdV
	bE8mlIThLrm21yK4H5hh1QTBC1XQcQuStYY/HeCwz3UMCJ+ZcfbYGPfZe8aXsu2AyAB0
	Tzqm7uu6kRJdhY9q7wHR8gslrcFP6MMaevhoO2VlimFZSaipDfky1CLa3OqDx50eFpo8
	IGFSKqYN7moAFawDYOs5MEPe0ANPuEpQss5TOISPNM7VTeLjDL/4VHlQMnx4H+Qu2rUB
	qELw==
X-Gm-Message-State: AGRZ1gK33cnjcBvViSG+4sWPY4NKis8YpjhkiqAZfXzWB7DzYSrgvb3l
	+a99xas78iHUKcEUwpQOIqbbaUqX/AnxtlCZOVLBDg==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr1152143oii.337.1542379879459; 
	Fri, 16 Nov 2018 06:51:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 06:50:58
	-0800 (PST)
In-Reply-To: <20181105185046.2802-3-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-3-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 14:50:58 +0000
Message-ID: <CAFEAcA-ryywQJsequ9F2Yhb2So0U5XuojF5B2o6ttPA3hN732Q@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v7 02/12] target/arm: Reorganize PMCCNTR
 accesses
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QqZQw2pZvfl

On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. Consolidate the duplicated code into two
> functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> c15_ccnt in CPUARMState so that we can simultaneously save both the
> architectural register value and the last underlying cycle count - this
> ensures time isn't lost and will also allow us to access the 'old'
> architectural register value in order to detect overflows in later
> patches.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>


>  /**
> - * pmccntr_sync
> + * pmccntr_op_start/finish
> + * @env: CPUARMState
> + *
> + * Convert the counter in the PMCCNTR between its delta form (the typical mode
> + * when it's enabled) and the guest-visible value. These two calls must always
> + * surround any action which might affect the counter.
> + */
> +void pmccntr_op_start(CPUARMState *env);
> +void pmccntr_op_finish(CPUARMState *env);
> +
> +/**
> + * pmu_op_start/finish
>   * @env: CPUARMState
>   *
> - * Synchronises the counter in the PMCCNTR. This must always be called twice,
> - * once before any action that might affect the timer and again afterwards.
> - * The function is used to swap the state of the register if required.
> - * This only happens when not in user mode (!CONFIG_USER_ONLY)
> + * Convert all PMU counters between their delta form (the typical mode when
> + * they are enabled) and the guest-visible values. These two calls must
> + * surround any action which might affect the counters, and the return value
> + * from pmu_op_start must be supplied as the second argument to pmu_op_finish.
>   */
> -void pmccntr_sync(CPUARMState *env);
> +void pmu_op_start(CPUARMState *env);
> +void pmu_op_finish(CPUARMState *env);

The comment says that pmu_op_start returns a value and pmu_op_finish
has a second argument, but the prototypes disagree...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
so if this turns out to be the only problem I can fix it up when
I apply it to my tree, if you provide suitable new comment text.

thanks
-- PMM
