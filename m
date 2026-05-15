Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23919CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:21:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtPb-00026a-Ay; Fri, 15 May 2026 10:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNtOy-0001uu-RO
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNtOv-0007EH-Ug
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778854828;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3jJlzzgpDRe0nKg33oaFu46l0y/vmLScvSFm/S/f5E=;
 b=MjUrehdrkHLx5ArAkynZIR0tcVSV8VNwoj29qdNhm3fnFFJgl/byTPFzGDkxHzLUqiK8+l
 aNu0h2bfvd2kEZT12Gr/Wbz0vlFRt46w8I2c6CtZ68GWPev2BweDCqE1m0Trl7vVS5ihUu
 glAcLKB+I1nJEVhZBbW+yfFqkkREsU0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-Ryvng9PFM9-bW6C9TzjvZQ-1; Fri, 15 May 2026 10:20:27 -0400
X-MC-Unique: Ryvng9PFM9-bW6C9TzjvZQ-1
X-Mimecast-MFC-AGG-ID: Ryvng9PFM9-bW6C9TzjvZQ_1778854826
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48ff0eb77b5so4527585e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854826; x=1779459626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3jJlzzgpDRe0nKg33oaFu46l0y/vmLScvSFm/S/f5E=;
 b=LDWm384xyYZPFRv2jUunRqdzpJNVywKXt0e10PqUEAnJFKcBFgDmttXvl3rmqaAOgX
 5O7Z1Cz85C0/1J69/7lhK30ckjdQ9ord6yEIxXIKAYrm03Va8qyZtKz+wazi3wyuX+LP
 yFQ+uPc6QA/dL2ZdiyS/jeplzXcYSlk/8BX0/FanijdvSdkV5zHEaWfGwm6P/47ZKvG4
 TQCUFnfdbRKTfftDDzSoeMY7UrBH12PynjdBWpunSJkkuXhvbdvBR7SUo97GJNjmENpe
 JPtdEivCWJ3CERgRD/BAuAKm/uDTXxdozxOfl4vz4BtepQMCGe3yaIhjLbPw93JEgG78
 8GQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+iEcpFKEbznC2+Fk1nAx5NjxLetEImsFG24cPgmWf3rPRAGLIYaHAEPPk+7BFmK8TAZblBpDGPJg==@nongnu.org
X-Gm-Message-State: AOJu0Yx4AUkBG8a83B66RX2lqC78K2IQJCLqdRIrWyjnSX/7hCCO4ILE
 Kj4QbqOka7CW2hErkKjvAEiuiyxo2pprL0OAa6lmI25slIX3n4ZC7o+B8xcCHbwaHO1e2hB2iHE
 J6LYHwvGl+lV4ruHnVC56kAm00LoEP/nWnH7//I0SLfPAeMd2oDdvOg==
X-Gm-Gg: Acq92OGFE/oZACNqFXk9yIPABHVEPdj63X8OPiS+mWSI9CKOhU4WuHDmvhS+EGvL6Im
 /vGGMKziFXI2suOKmeILtHRqVsBvPB2iIJdirFj2npiyTS8TENJHUQU5osOMD045Qd60HxLgl3D
 GoBgnab3Zr1sQQmqC1Jf588DqacF3jEPTm75xOwXiCuNbov8Nt/7BRzeadbMLA9SPNLOpjJiguB
 tFUU3olz5Z9bxg2ejfmilG7XjspfekxGyMjRUaaOi+OS6Kds7t9pFje5cBabeMOBrUb2/sKHEGb
 N7qc2wd1Z9ITjEEeG5MCJdgOlVjgvgf9n9qkuM/pM/1DYvGzqbF5ekxAdI/9TzqPUs11RCgwemN
 wpRIgl3N78FtUIGXTRiTogjXyGIXM/5JH/xTOY/cB8K6h3yQxIIY5+Z+uSrpOdtX/lcrs122ipy
 L7j+P2
X-Received: by 2002:a05:600c:46cf:b0:48e:8974:c377 with SMTP id
 5b1f17b1804b1-48fe6626ba1mr57267195e9.29.1778854826009; 
 Fri, 15 May 2026 07:20:26 -0700 (PDT)
X-Received: by 2002:a05:600c:46cf:b0:48e:8974:c377 with SMTP id
 5b1f17b1804b1-48fe6626ba1mr57266545e9.29.1778854825433; 
 Fri, 15 May 2026 07:20:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2c96csm16508605e9.2.2026.05.15.07.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:20:24 -0700 (PDT)
Message-ID: <a2e9e975-5fc0-4045-bbdf-762c4809b704@redhat.com>
Date: Fri, 15 May 2026 16:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 03/13] target/arm: named_cpu_model: initialise
 additional sysregs
To: Shaju Abraham <shaju.abraham@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 skolothumtho@nvidia.com, philmd@linaro.org
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 prerna.saxena@nutanix.com, jon@nutanix.com, jond@nutanix.com,
 Khushit Shah <khushit.shah@nutanix.com>
References: <20260513163356.3033159-1-shaju.abraham@nutanix.com>
 <20260513163356.3033159-4-shaju.abraham@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260513163356.3033159-4-shaju.abraham@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _5oZqVacw7PeKYRcPhiXjk6pPdCJePouU1-6vD_p4xU_1778854826
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 5/13/26 6:33 PM, Shaju Abraham wrote:
> Add entries for sysregs MIDR_EL1, REVIDR_EL1, AIDR_EL1, ID_AA64PFR0_EL1,
> and ID_AA64ISAR3_EL1 to cpu-sysregs.h.inc.

Can't you reuse
[PATCH v4 03/17] target/arm/cpu-sysregs.h.inc: Update with automatic
generation

and associated python script to automate this. I think it contains all
the additions you bring here + some others.
for 
Eric
>
> Co-authored-by: Khushit Shah <khushit.shah@nutanix.com>
> Signed-off-by: Shaju Abraham <shaju.abraham@nutanix.com>
> ---
>  target/arm/cpu-sysregs.h.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
> index 3d1ed40f04..82a83d9d5c 100644
> --- a/target/arm/cpu-sysregs.h.inc
> +++ b/target/arm/cpu-sysregs.h.inc
> @@ -41,3 +41,8 @@ DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>  DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
>  DEF(CTR_EL0, 3, 3, 0, 0, 1)
>  DEF(DCZID_EL0, 3, 3, 0, 0, 7)
> +DEF(MIDR_EL1, 3, 0, 0, 0, 0)
> +DEF(REVIDR_EL1, 3, 0, 0, 0, 6)
> +DEF(AIDR_EL1, 3, 1, 0, 0, 7)
> +DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
> +DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)


