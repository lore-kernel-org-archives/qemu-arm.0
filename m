Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3505424lfh;
        Mon, 23 May 2022 06:52:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2Z4B2ZG1GCTtTnUeZ1vlXgLhxZJ0WI7FT8loS2dodXsmDiqnk8vi3X+6r9xF9Z+9IoZx8
X-Received: by 2002:ad4:5944:0:b0:462:310a:b54c with SMTP id eo4-20020ad45944000000b00462310ab54cmr5424189qvb.41.1653313946582;
        Mon, 23 May 2022 06:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653313946; cv=none;
        d=google.com; s=arc-20160816;
        b=OHhWdDx3AOMOv9KxcKJGyHMcRSKr+m2Hql0khU9KGVR7bmb2CDwXE15VTyRhWfiEwF
         FM+htd2kMzhOt7hrExw5Lo4BRJ6evPlILzxwJyV8znBHFFLIF4hfYLFZlOo2xvtOwuZT
         TdzQ5BoyM9WIJmcJx8t3xwoucOhsfhoGmg8SHul5gMNXpMUZkXBdD+oBJmXQjgy+Am/6
         8KwMKLINw6Q2b8oylgGIQ3xiOUWm1USzAwzmG9HG6gKknQYoO9mMNzPnijsmYRLNlSqq
         7UT3pCQXZ6oU078Dzi7VG2QW4SBXCO2VzOA+BSR+WTBdNJV0u6IucuyI8zaJWQQGXNXo
         /6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0fEqwDnkXMzHaJze/joGmtMrBz1RiVRvPrAHSDu9gwg=;
        b=ipoj54EwUuSdJodAjBIp9BGU6QmpoXIn/G563OJ9tJKvE8JgBdlyTAjybukBGl+zBp
         l2GQdXUtsn43yBjuxBrzmPiRMNZkjoHdcECQKu3gwgFT0vVYAsFk8C5HxhZseS+8sZPh
         1J2TY94HCOQXFZ6sny53mjqxXrzhE7lTvaUnKJmXm/6ZxWEtnlBkk7M2ybwLze13w3N6
         b5kEZ7K0fUmXKh+3LRnNERAANjNjU7Q0cCKgyAAJZAOiofp7mPvBwIcqpf1BDwjQYV9L
         VGlgHbFLJmzCUAP7OUwmsG5ufRPF9bzmwmxuVO2k7tXiMWIkuL50jz2mAfJfZcsSIMnz
         eHQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VnWO/t6M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020a05620a244f00b006a353707f87si2732090qkn.479.2022.05.23.06.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 06:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VnWO/t6M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nt8Ty-000740-3B
	for alex.bennee@linaro.org; Mon, 23 May 2022 09:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Ti-0006zy-Ce
 for qemu-arm@nongnu.org; Mon, 23 May 2022 09:52:11 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Tf-0003bS-UT
 for qemu-arm@nongnu.org; Mon, 23 May 2022 09:52:09 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j2so25620907ybu.0
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0fEqwDnkXMzHaJze/joGmtMrBz1RiVRvPrAHSDu9gwg=;
 b=VnWO/t6M7IMxQDVNETBRtqUpaOod4Ja9CXHFSas+9g+IdeT+PRCwlLYPMRwLTn1VNL
 AHKElkzN3AY1DFo7+YrEX9ZFx7rl/KSHm/7311DVvSnzjwBITtNRiT/UBtx6LO2vSFgw
 EEw5r6h+EWGk9Y9edV5W9xnaDClp75VbLYAaO3Vaem/DXDjy5VQVLJ1Eohc0camkpnYI
 XWtxV7MN4r9uXWCYXLOk7VCKHeK4+FyjunGnsqJg9TopwAbDeqfwRbb14Rg02IWqHTGd
 wuiDtHWelJKvV8RMhxvXV5wSxUQoEje8KVq9+YN4cgitw2X3YHUvtGRICh7dqZ+fagQy
 cPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fEqwDnkXMzHaJze/joGmtMrBz1RiVRvPrAHSDu9gwg=;
 b=VY4LbyAGz5+04sb3HwYc/eG5BxVmG+iIMbt7Gtz1lomAP2FqTpeODIyf5mbR4sB6M9
 jnhyRIB9ezYIczbj4mwXY3g7Xvn7OHLr8QXkkPSCOqhspkIzkLOb44/nZi4hiHyGpDKn
 PSUgpFrjl/LSTvK2L8rXmAKllbYuige9lh4IwphdaTDzH5IGFdUWf5Xhqq/y+PCCDUBa
 Qgh8UmwEQd9ZKnZYPevdka0kpKY52cLJn6UaGKFIqUCblnELDSkeWH6rPKAseYPQW3zQ
 xQ8rDBvRLqCGvOsXQiSmuRV0cXD/Kdv0F7pm4VVtYRY6cNFb0WohoJ/tuGdb8e47Mtk0
 tU2Q==
X-Gm-Message-State: AOAM531WwuibcDrb92IxdX8vQLgRx+7JnmAG4YK7Jyk/JVGlLs/jCuO0
 1945PxWzvTp73/xu7bGQh1wlls38KjBSlVekqTH6aA==
X-Received: by 2002:a5b:c08:0:b0:64f:de42:5ecc with SMTP id
 f8-20020a5b0c08000000b0064fde425eccmr5345745ybq.85.1653313926842; Mon, 23 May
 2022 06:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153829.356889-1-fkonrad@amd.com>
 <20220519153829.356889-3-fkonrad@amd.com>
In-Reply-To: <20220519153829.356889-3-fkonrad@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 14:51:55 +0100
Message-ID: <CAFEAcA-v6fr3tqSKNuc5T3X=Wnp8+UHsUHqKFWzYgg41p1_G1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] xlnx_dp: Introduce a vblank signal
To: Frederic Konrad <fkonrad@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, saipava@xilinx.com, edgari@xilinx.com, 
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NtunvRqipcV7

On Thu, 19 May 2022 at 16:39, Frederic Konrad <fkonrad@amd.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Add a periodic timer which raises vblank at a frequency of 30Hz.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Changes by fkonrad:
>   - Switched to transaction-based ptimer API.
>   - Added the DP_INT_VBLNK_START macro.
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---


> @@ -107,6 +108,8 @@ struct XlnxDPState {
>       */
>      DPCDState *dpcd;
>      I2CDDCState *edid;
> +
> +    ptimer_state *vblank;
>  };

The ptimer has internal state which needs to be considered in
migration. This means you need to either include it in the device
vmstate struct (there is a VMSTATE_PTIMER macro for this), or
else set it up again in a post-load hook. Otherwise if you do
a migration or state save/load when the timer is running then
on resume the timer won't be running when it should.

Apologies for not noticing this in my first review.

-- PMM
