Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1411716lfb;
        Wed, 2 Dec 2020 10:51:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJXlru3Tz9xVL68/Kn+aBptkChEIn9Rfd6z3hM7bJ1R3EuL/q7Qyen8X3RWZxZIQRBDKhA
X-Received: by 2002:a25:24d4:: with SMTP id k203mr5126963ybk.62.1606935076362;
        Wed, 02 Dec 2020 10:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606935076; cv=none;
        d=google.com; s=arc-20160816;
        b=EdTO4wlGwrfptHDV0Zb3+Ui/IposCRkma8M2Xg9FkrSCH1JE2ig3sF2QPxX2MF9qli
         TLvs6sYxtVLKy7XOe/9h32fHFC0an6tzQT+fDMkLijzMJnYvk7pwEpkD0pHeMYs437sl
         4/jiSPyNksoP83mYTy5HP8IErAPj0mKZep0yQeXmyUN1aZd3ZGwbVB3UVQicJM5RUMqE
         sEz88/sn/W+RMk2L0eONkWuuncDMt2JVDCaPPo/gq3EZqOC0gFOQn/GbmqOFafeA8UmO
         yWzeEAbs/badnDnyJemVi+QcHEfx991QvbSSSB868gH6FGBzzKl+ULmhQF83FXBvs8Nm
         wpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+L1LdjKLZXpPtT/FwGd862fRRCryfoofTWElcvqHGQ4=;
        b=zAWyXAN7PkWWPH2V2LJtOe4JwgkROT8u8aldRQ8xrEBxuuttgzL37dvCs7mmJGbPdr
         u5/hr5kNt7idLHBEyBQrQ/Dx/0loY+b67w2ugOTd/2vmJ5OxhzTdTXzlaYu+gMWKkd1i
         RdKE2Ilyr6hnFUM3PZdjcfVc/8tTGiZ5JG9pibzt6GPqJf0HwnpC+11hNmaRUnpRzdgQ
         X7P7RwMStXNUWCxREOEL9I45GBCa/tzcc2UdF7w8II+BId/CSBDF3evoMwNEN1t55lFM
         ejHZzitaYZMeRRTPLUiP5q/wnfj+zl4bM0S/xqDIqO0NEy0gjoGLqmEQI4crvW2pzDaF
         ruow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e76si2238556ybh.268.2020.12.02.10.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 10:51:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXDf-0005FT-Pt
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 13:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXBd-0002o3-RP; Wed, 02 Dec 2020 13:49:10 -0500
Received: from mail.csgraf.de ([188.138.100.120]:55626
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXBb-0003CX-DZ; Wed, 02 Dec 2020 13:49:09 -0500
Received: from Alexanders-Mini.alex.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 32189390036D;
 Wed,  2 Dec 2020 19:49:03 +0100 (CET)
Subject: Re: [PATCH v3 3/3] arm/hvf: Add a WFI handler
To: Peter Collingbourne <pcc@google.com>
References: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
 <f01281f814ceba088595917eb06d4cb21db820f1.1606884132.git.pcc@google.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <23335280-d732-4bf7-af49-068e00601414@csgraf.de>
Date: Wed, 2 Dec 2020 19:49:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <f01281f814ceba088595917eb06d4cb21db820f1.1606884132.git.pcc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rI6RG/j5ahJq


On 02.12.20 05:44, Peter Collingbourne wrote:
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> v3:
> - move the simplified locking to a separate patch
> - spin on sleep <2ms
>
> v2:
> - simplify locking further
> - wait indefinitely on disabled or masked timers
>
>   accel/hvf/hvf-cpus.c     |  4 +--
>   include/sysemu/hvf_int.h |  1 +
>   target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index e613c22ad0..b2c8fb57f6 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -344,8 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
>       sigact.sa_handler = dummy_signal;
>       sigaction(SIG_IPI, &sigact, NULL);
>   
> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> -    sigdelset(&set, SIG_IPI);
> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);


That turns set into an unused variable, no? I'll fix it up while 
applying though. The rest looks great, I'll push it as part of my next 
patch set.


Alex

