Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1244627lfg;
        Fri, 20 Aug 2021 05:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWZXY+z/F2AflCRHIBbRIPBY3szPGX5HvRvu/BgR0qUljCxkS5radLnM8GuEhcbRbCsS5J
X-Received: by 2002:a05:6402:84e:: with SMTP id b14mr21740615edz.227.1629461621287;
        Fri, 20 Aug 2021 05:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629461621; cv=none;
        d=google.com; s=arc-20160816;
        b=qAISMVx4I/ZyOYfl5Lv7OPN5LyhzTh6fQAQlnO0jq1LzQLrZ/z5uI4GVCaKelVfKF4
         XepnvdRTvlukzhsPlZulXvIavX6F88nNgBNHSNsQ9dZP2IkeHlfxAr5QKxqCjemox+rQ
         hgyplC98PGVbqRSNfgqL/etbyD2qk+RAKyAdpFyggNIszYW17cvdWEKz3XqIBFzUFBPS
         P+ZdBCtX2WF+WwiXPlCbI3XYTm9a1IRGg9iKjsd9P6CNMm9HS4yPm5swRVPBiD25JSLB
         Ya523NLuZrTSOofopN0Fro4TD0FVr7Vp6daFhQVDbZOPKlO5EvHnGRPT1NmAeR27UNgD
         GZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=eyZN5CWzhpm/Wk3iDTB+oL/QYFODksW881M4ZWKhYwA=;
        b=EMgL5j1G1ijTcSgiUmp/d18xvboj9tj50PanuS729dqbRH+Lm6CiRv/CQA72cU567g
         1ADvf0Aerhd8UFu7hygoLoPftRqbv8Zh7ClunUfDasbESHJlka0TE0rwzVjooiG43WY5
         ljJUsiLahrzAHL5/1XaMszcE9oo21ZYeTyOrvaT3C2DaErH1TShdqrFYgolqWGMJcJy1
         0dkj1g92Fpb/EmMTZQdtT5Bjo4s/PlxQ9KSYnOYIITFS/c47v3hinuoK9wSiV4tGelFw
         NRyKagN0eFFbxMUsknqrpMmHCqxo7t3a9RBE0AlZUyPnSFDOdGKkTQlQ0BoKF8pdaXAw
         9iiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vHR8YGvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gb8si7976452ejc.36.2021.08.20.05.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 05:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vHR8YGvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH3P2-0001oK-Dq
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 08:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mH3Oq-0001mA-7E; Fri, 20 Aug 2021 08:13:28 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mH3Oo-0003ww-Iu; Fri, 20 Aug 2021 08:13:28 -0400
Received: by mail-lj1-x22a.google.com with SMTP id h9so16954891ljq.8;
 Fri, 20 Aug 2021 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eyZN5CWzhpm/Wk3iDTB+oL/QYFODksW881M4ZWKhYwA=;
 b=vHR8YGvidGR0qOMxqhcsFVwJ8LXOpy49H3BcFr/JrPfabGSloGWSG9RKp+ZYoyfgYb
 KdCHQiLdPVozD4fTapz7oQtMx4hTZ16zofUvHA1ByZV9/8XkEuG22Ma3g3TBLRA/+zCW
 apblvDcrV+5dgnQIUOqjmXVWGQ5hNpk+hk80UFnSC57m52KU8rZwztFl/F6GHYUKrKBX
 LYkhCMw3a7KwXiVIifgMHcJSAKbYZ+T4GOMPA4/dMOjkTRopWqSYKAJmFIboNNw/PtNu
 2nH6/fyI4Wr5BXwtd/QhiCRSVtw2N2yAtqf4OpfnGE+11bR370dy0WvLUTIzIJBCYxzR
 SD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eyZN5CWzhpm/Wk3iDTB+oL/QYFODksW881M4ZWKhYwA=;
 b=O5Nfm+/04Yi26k4uG4SEXqrjn/ddL/PULCkR2ZrEEZPTSYKXU4bwsX2KXnfHLxP8gH
 7y9jSCNLSAgvn4oj3pfxAaI9QexD5u7dvDjWtRivJq839+PfDMDPhO5/0NuhRV0l2KCG
 WLR45oGMOSLQO694Gqdi9nU3apzcBoWLa6N56F7K74nAPFldf2/xf6WTyGjt3ZtbrnsG
 30/1IpXeWiTXPJ0EBWI10AHP0wDf84iFKURQ/kT29+ql5u2TsM+YV2rRInvRI9YeBe7r
 6/oZH6ESL0fszM/2AzE5HTkUQR+1nFQzfEYLHPDOuIG17Q6xQtCNneibD+nUdtZ9XiyX
 sK5A==
X-Gm-Message-State: AOAM5305aIg75fvG/9y1El6J0Ohtt3mRhKIEwJpQry1SKD116cqZTRT2
 bIyxoDBw56Npt2+sPfUPqtE=
X-Received: by 2002:a2e:6c09:: with SMTP id h9mr2547521ljc.30.1629461603710;
 Fri, 20 Aug 2021 05:13:23 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id k22sm615427lfm.263.2021.08.20.05.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:13:23 -0700 (PDT)
Date: Fri, 20 Aug 2021 14:13:22 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [Patch 1/2] hw/arm/xlnx-versal: Add unimplemented APU mmio
Message-ID: <20210820121322.GH3586016@toto>
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-2-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819031525.653995-2-tong.ho@xilinx.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zix+xxpaouYV

On Wed, Aug 18, 2021 at 08:15:24PM -0700, Tong Ho wrote:
> Add unimplemented APU mmio region to xlnx-versal for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 2 ++
>  include/hw/arm/xlnx-versal.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index fb776834f7..cb6ec0a4a0 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -376,6 +376,8 @@ static void versal_unimp(Versal *s)
>                          MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
> +    versal_unimp_area(s, "apu", &s->mr_ps,
> +                        MM_FPD_FPD_APU, MM_FPD_FPD_APU_SIZE);
>      versal_unimp_area(s, "crp", &s->mr_ps,
>                          MM_PMC_CRP, MM_PMC_CRP_SIZE);
>      versal_unimp_area(s, "iou-scntr", &s->mr_ps,
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 22a8fa5d11..9b79051747 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -167,6 +167,8 @@ struct Versal {
>  #define MM_IOU_SCNTRS_SIZE          0x10000
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
> +#define MM_FPD_FPD_APU              0xfd5c0000
> +#define MM_FPD_FPD_APU_SIZE         0x100
>  
>  #define MM_PMC_SD0                  0xf1040000U
>  #define MM_PMC_SD0_SIZE             0x10000
> -- 
> 2.25.1
> 
