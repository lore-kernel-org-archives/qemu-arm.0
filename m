Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2668115lfb;
        Fri, 27 Nov 2020 10:19:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlAFtQJweyjPRCBthGPaY/NVoky8muexB55kTjjAZXUWwbvJLTalWkkU3EC4Lkp13vh14H
X-Received: by 2002:a25:b803:: with SMTP id v3mr15019790ybj.326.1606501169741;
        Fri, 27 Nov 2020 10:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606501169; cv=none;
        d=google.com; s=arc-20160816;
        b=HR6b9vTK8eB89kLBeABMXsmFVvLWDEmKJhQNQNEX9RIgOz7lPqzHVfECOb5R5iBzjp
         jjIJUekDzk436Q/HZvwlhqz2ehsys28YrUYoVPCYpDvZhhD+bxwqTHMBw996/wXUosI/
         dYVC/4vBTVOIC+ficXkgKfCytUtzSu/ksJYX8IbfOlXie913he++ds2X6IAWTnpUP5RH
         MOCyxFqemBYSDfuNt9IuwSXAgTfSwbmZ95Qbb5Pi1AazC8U3nLeszZJfiVOSBj9b3NF9
         Qi3uqFu/p5PMixRKZw/1f4ASZ+rP+N2oCiK5q5sRZHKwg2MEPKf8RYwPBTkCqBwz5UfI
         ZY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtNyEniRpB/eU0S5XP7+Qk/KQ/pfCRKdD+Wh0ljo51Q=;
        b=UE9884F8GVV49DmQtCgYh83X4uZ051WYzKfIgTnAJ/MDGmtDRfxJRFVpdXvGumtGO9
         d/iJEkB3neTTeX76GFrp9BQcw75a2cQSg28fkq3nxkVbxZxdUGE00EhiHZ2q5C0osTVn
         3diGPdzO7wRgwTT7k+CY4B1hk9H9rmQUgf8mUaw92Wa6x+suo27e+kOaAz+HkMf9DSjD
         ReILY+l8GbTOqPgngYwKim8zl2V/mcHDYxToMbamt3cwj3OJmwxwneD5UvjW9O+CgLEa
         f+thLEGIaMGzEuTytrBoxp7ejeN4vxm7jrNCw8OLmV54ZHcXdLSV18qSdmsDZg59r6EN
         at+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GPCTRzXS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si8218770ybj.303.2020.11.27.10.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 10:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GPCTRzXS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiiLB-0001El-5K
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 13:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiiIT-0007r2-Ub
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:16:42 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:44718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiiIS-0002sg-Et
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:16:41 -0500
Received: by mail-ed1-x542.google.com with SMTP id l5so6562818edq.11
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtNyEniRpB/eU0S5XP7+Qk/KQ/pfCRKdD+Wh0ljo51Q=;
 b=GPCTRzXSKBcvOlHwtl9IqLGJp9lhZmbFDIrVnWFgWz1CnOA9ecJ72szqwVBRDcrZ/M
 /JviOMLnbK8yJwu2TYrXKiutZ3kShEnoxxQtmdNTnRms0fNXRU0/FVXaR9oi33P1sPsD
 1VLzIioK33t5zcBj/1Z+tSkAg0dyoMLF/qNNhiwxXk1560eV/J0CqSqHWxSsBPTwKCdP
 lj+dLWReuAg67BnOih6Y0Hp/opsHmqjwKNwLPCp8gYFxMaaG97b6dDHLBc7PjZpJzenA
 LhC5UkQxhxE8SMrNzclll/jQBQfeLJYSrtGfCXYf/VtSqPeW0VEO5/ASJiGFsrePF5c2
 nw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtNyEniRpB/eU0S5XP7+Qk/KQ/pfCRKdD+Wh0ljo51Q=;
 b=Zp/NvSpgBGW4nArsD1/2Zwtxc7AKPVlGl84hZK9kTJyRKZ5RTUrmFAd4csnc2HpjXb
 i1mdtXN5t6a/7qc0JvZYGAtW3spGwWwgYjE7ntGLaToEhb6rTKj2TVuzRcQU+x5PJDLv
 h0iGvCCeo2c+2Ai0e/Ts6O4THJZ+wTlzzF0cZPoSZDHP9CqvAZegABNXCdSTfrLy/6qu
 95sTRgYxX/84dkiBpHUacZPrstyW/DRKqoUKmiAxfF9R6WxoJ20KDkFToKQbQEe5tiV5
 zzR45EU/8UdDWV/y9KtABRoiTWNHvWStd1Neo7UV/nZouzcTyUDiRTIWbFXSYtRl+yTu
 OcgQ==
X-Gm-Message-State: AOAM531dOMoRjjUxlUmbETC1Zf61cCa9I3fEGnsdg+mTtjH6oOJEAdiY
 KuTR5kLbQ76zUmbqihN35gMLJ7nwDqDEsihwMhs9Yw==
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr9307062edb.146.1606500998637; 
 Fri, 27 Nov 2020 10:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
 <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
 <20201127171757.GB2271382@habkost.net>
In-Reply-To: <20201127171757.GB2271382@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 18:16:27 +0000
Message-ID: <CAFEAcA8D3SUMvxXU4RRYxeBAsywRfAvaFhSToJ1jcrH8bn+-4Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hEHXrfmnP/Vi

On Fri, 27 Nov 2020 at 17:18, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Thanks!  Is the data returned by kvm_arm_get_host_cpu_features()
> supposed to eventually affect the value of id_aa64mmfr0?  I don't
> see how that could happen.

kvm_arm_get_host_cpu_features() does:
        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
                              ARM64_SYS_REG(3, 0, 0, 7, 0));

which is filling in data in the ARMHostCPUFeatures* that it is
passed as an argument. The caller is kvm_arm_set_cpu_features_from_host(),
which does
 kvm_arm_get_host_cpu_features(&arm_host_cpu_features)
(assuming it hasn't already done it once and cached the results;
arm_host_cpu_features is a global) and then
 cpu->isar = arm_host_cpu_features.isar;
thus copying the ID values into the "struct ARMISARegisters isar"
that is part of the ARMCPU struct. (It also copies across the
'features' word which gets set up with ARM_FEATURE_* flags
for the benefit of the parts of the target code which key off
those rather than ID register fields.)

thanks
-- PMM
