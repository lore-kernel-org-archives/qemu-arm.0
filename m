Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2335071lfm;
        Fri, 3 Jul 2020 03:37:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRH7jvxvLTOz4om0QumElZOmsAeHJur6PAvaHgrj81dol8P+hg900feXfHthYeIpIp4wa7
X-Received: by 2002:a25:aaa9:: with SMTP id t38mr55897233ybi.312.1593772647114;
        Fri, 03 Jul 2020 03:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593772647; cv=none;
        d=google.com; s=arc-20160816;
        b=GjaYJb7PNFXBYO7a/WxAd7TrrfKiSmjtuTQ9A+8+JcG9xDbNlIh97AHCM+O9d6UhCF
         R23gtBo7+Ei57JrFVOvldbTE/LHnWof5JQk42pyzY3v1ey2VDBSQ2U9C+H6813+TRCAA
         L5f5H8jJ+V95niyXbGYFLjmjhJuy35f6wBd3ZzJ3ALIHAdzOxwVkCkB3JbpwLadcunwk
         7IIFnlu93x4TPWPzWkduguzC9ND0qiPgTAv/G54PJYHZkby84Uy91tLluLBsRTghG8Nd
         LZ+T5kM6kBCaT+XhhmU/M+I/rHK5lOFRhfABLIG92buvafLava+gSLCL9RcyB+LCVguk
         Hqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZcX3ndpVQgJvadTxo6qh2NP64rCXUcYtfO0TglJILvQ=;
        b=eQBx+mhEuv3xbae3V6MnXy+Ej2R6ww18dh5+7Itrf4XhekoinR0xmKf1iAGWuDus1S
         eqzmsk9IviY0CLsTVsLFiRnDRIGjttAMQFGunxXGVmmUB/l2yo1kIi/P0Ujmdd8g9CrV
         qwsMFw3AARSRGiMGodJtQmnhp/Z9pY4o2hpc5rh2FqaE7K4y3e7KG9FMEf6To9q7mnIp
         DkmTUwlFP1GhtgfEToeNb6rC4kv1kprpCCdJUx7V4/MkJX5Zdku2k9NVSXE8TlDgOduF
         t88EUNQ0uyJ2HnSazM6RY3QtcQuiqD/piuJm12YwAammAGl3rjXfCML1OlejvA0MDFdt
         8S4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CFzXIDMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r128si11019334ybc.354.2020.07.03.03.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 03:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CFzXIDMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrJ4Q-0000Uu-Er
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 06:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrJ4G-0000SI-J6
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 06:37:16 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:37816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrJ4E-000553-O1
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 06:37:16 -0400
Received: by mail-ot1-x32c.google.com with SMTP id w17so18508952otl.4
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZcX3ndpVQgJvadTxo6qh2NP64rCXUcYtfO0TglJILvQ=;
 b=CFzXIDMfsOOAKs+cwvSq+CPlYoAJLrTRh6O9z8t4eQ0NvP+Je4IBz3IPJNfpn3cxAG
 DkhhQ/3groUsjTWuvniWxubiSqN2+vqyvaJoCSEMABBTgyH4x5q0i8Rin5R6PPoilyk2
 9Uw/kWA/Ny+IJ34Ztyo4FfMvaYYrSFaHFWxe89LXITqJ9Lolp2MpArr91z7UsFChdwMu
 V8glk8m73//yOnFON+MbHNBFSnjrMzYuGmuVYN1TaSonpE6pcKDcp83tP/qKGELpQhyX
 lF2HTEVMoOW2Nbh5hqqPmoolLU7nq9cPtzsNBUQCYzywLXTtIiEMLBpoA+GUATOvBTu/
 g69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZcX3ndpVQgJvadTxo6qh2NP64rCXUcYtfO0TglJILvQ=;
 b=aPYwERL2ar89sBfltV8usQTpl6E43WbZMQSgydEcd4AztFswXNrInckp9RqtNYOEna
 s0jQ2cGdnOOxy/TMZMA6D5KbBJfwJCbde716554PZkmMpFcMczyPz8HYYT950p+2Uxl0
 oaqcZ6MmrEWhr5W3BNYROWTROI07ImuAo5RJ8CFq6HTGVSyLJawmkiTp8fdAwirrSTKC
 gshQ2/LUwGgR7uGZLULqAL19IY/U685WyR52qeLsI5+bwQIiz6EpczrRbeJyeAMtmNXg
 748r+mTsO47kk7yPVmDaK9IsQV1FPCMlqabS48Iw+Ct/b0roWMYNrsiHTnMfn1VuEa1o
 dGOA==
X-Gm-Message-State: AOAM530DR0D1r/V87Qoq4WgH20MYizPZT35GfnvfHBRSzOSRAP61YqwG
 xzhqYA+WPadbbN0bT4sqG9xEgREsJehLhWvISGiJoQ==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr23952809otk.221.1593772633484; 
 Fri, 03 Jul 2020 03:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
In-Reply-To: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 11:37:02 +0100
Message-ID: <CAFEAcA8RU6fS8PX7LMhn4U33nKoRvcO_mnyBFcmW3iOpA40sCQ@mail.gmail.com>
Subject: Re: [RFC] virt/acpi: set PSCI flag even when psci_conduit is disabled
To: Heyi Guo <guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: yitian.ly@alibaba-inc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RjD7eKSql4Pp

On Fri, 3 Jul 2020 at 10:44, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> vms->psci_conduit being disabled only means PSCI is not implemented by
> qemu; it doesn't mean PSCI is not supported on this virtual machine.
> Actually vms->psci_conduit is set to disabled when vms->secure and
> firmware_loaded are both set, which means we will run ARM trusted
> firmware, which will definitely provide PSCI.
>
> The issue can be reproduced when running qemu in TCG mode with secure
> enabled, while using ARM trusted firmware + qemu virt UEFI as firmware
> binaries, and we can see secondary cores will not be waken up.

If you're using a real EL3 guest firmware then it's the job of
the guest firmware to provide a DTB to the guest EL2/EL1 that says
"and I support PSCI" if it supports PSCI, surely? QEMU can't tell
whether the EL3 code does or doesn't do that...

thanks
-- PMM
