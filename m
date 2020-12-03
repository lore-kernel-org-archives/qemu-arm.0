Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1658529lfb;
        Wed, 2 Dec 2020 17:03:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyx1Q1YDiAN4e0qifAAUu2VSHf7i1h8BYMcVFZpVnTCqeHqzDAAHURrbcHLsofGcam/d0A6
X-Received: by 2002:a25:d846:: with SMTP id p67mr1230719ybg.221.1606957410195;
        Wed, 02 Dec 2020 17:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606957410; cv=none;
        d=google.com; s=arc-20160816;
        b=eCO1kopGvYvAKX9Uhw67G1Sko60dr9LyOIUxzMx1C11J7CEbGGkNZDEY3O8RcabpSE
         dr81G7ZfZCj6Yu+YNSMJs1DG6GYcXAtj4ovCxYrho5kwDimLuM3nJv2Mt1TwND7tweLh
         VYnrVlNK9fKGO9EAqueC8iXlSkXpUgJptEj3Pq0A4LtCX9wb3kfGn+5JsFIylF50UdV8
         1OklS9KvMp8wjzVyNPCLFbyUtpMRLVcfAr+VhL/57wADNd0zrdxADttsjzwe2t7rdfT9
         nLrTtdvX4Djgn8ALGYkdKaqiGeRPKnQA25DSp4DdNWUJV8MzJrzCMHP/8n9AsSoZ1BwF
         PeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=6Zuo6uk2aAoiF9POk2JjOXIfsVgeozh2iLfxBFEoRCk=;
        b=u1bpL/ItvWIZNI0qvFHm1cU6NrUp1Uw66tbfEqiu3u5hRZU/iB+BaCJsWgRRW0i3Fx
         lIRfFKCZEHvZLf9LfUq9dSH18jUFZH5xZJe9snStNLpVWyThYO97PVUMdTF/1wdpZg+T
         okyWdT6mnUi2ueYz6nwGSzPV+fXqAvVmW1O0n/WTNPaI+0a0YtDW+Hop/i8RiwQj43EY
         kfW91GKNqoKGVJ+A8eaqH/6lTDfMsg9jQwuj1nkbMscsIcCfIdh7Hxt3oTl45kAWBPM3
         86vXhpfQ3WfALGqsJNHG3enOPeknb/X+4AJCmaW+kRdc2SnRdk10M0VuxRvhRfYQw+xE
         zmbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=gzjdKC5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x79si240315ybg.489.2020.12.02.17.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 17:03:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=gzjdKC5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkd1t-0004WJ-Hr
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 20:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkd1j-0004Vg-OL; Wed, 02 Dec 2020 20:03:21 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35662 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkd1d-0001eU-WD; Wed, 02 Dec 2020 20:03:19 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D9E0A41395;
 Thu,  3 Dec 2020 01:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606957388;
 x=1608771789; bh=WfzVPTjNGt9VA93TSpxzCdkIOg5R2xZCuP9WJ/ButXU=; b=
 gzjdKC5H/NsvRUbcAfoRTUgQao8MS0r+iX6TrppRg8peGy0wOKNadtjmwzNn1LS3
 HU1rWBlbLWn9l0sMdgifeiu7ewD96Gm78Edn5Xvw2yDZsi6lSPztOMybPG+x/PeV
 iZOQ+TWDEsXWvccP8zBQbSDL7G9wGyyloVFAnTy7EAA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMnO_hM_SgLN; Thu,  3 Dec 2020 04:03:08 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 05B2841377;
 Thu,  3 Dec 2020 04:03:08 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 04:03:07 +0300
Date: Thu, 3 Dec 2020 04:03:26 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 04/10] arm: Set PSCI to 0.2 for HVF
Message-ID: <20201203010326.GB75161@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-5-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-5-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: glQljcVvpiaM

On Wed, Dec 02, 2020 at 08:04:02PM +0100, Alexander Graf wrote:
> In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
> of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
> that fact in code too.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 07492e9f9a..db6f7c34ed 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1062,6 +1062,10 @@ static void arm_cpu_initfn(Object *obj)
>      if (tcg_enabled()) {
>          cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
>      }
> +
> +    if (hvf_enabled()) {
> +        cpu->psci_version = 2; /* HVF uses TCG's PSCI */
> +    }

If HVF is piggybacking on TCG and they're both the same versions would
it be better if:

> -     if (tcg_enabled()) {
> -        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
> +     if (tcg_enabled() || hvf_enabled()) {
> +        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
>      }

That'd avoid a case where they get out of sync.

Thanks,
Roman

>  }
>  
>  static Property arm_cpu_gt_cntfrq_property =
> -- 
> 2.24.3 (Apple Git-128)
> 
