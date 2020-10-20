Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4675808lfa;
        Tue, 20 Oct 2020 04:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS2l0p6caovzJMLCHgLUg00mjFMx1qET6FbT2KFAdPh989hBAR8kNIyhmx1BXt6mWIkwAe
X-Received: by 2002:a25:664e:: with SMTP id z14mr3015686ybm.161.1603191603237;
        Tue, 20 Oct 2020 04:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603191603; cv=none;
        d=google.com; s=arc-20160816;
        b=BorYoyRUyJIE3teiawCQTuMdn9esTGdEYchJCwBerlY7qTAaxPoaSjSTVSliw2xNZ5
         L8FdAHPU2vnIDuTajP4lNLtJsXSncS2J6E6YnBjMjutPJCrnzasGf0jWMJNaw/9r7TJP
         Je6HVshkOr01DtUHCsk8xpT7A9EOnPs62KdepkZz+dvXNYvM+nVXcC+lvIRPCriGE+GO
         SUBl92sFiwCYnZSdfa9fu/zsexw2pdfeh+nsSz4JpIK8Dn/fG+TpCwgmMV4VMsRiHxuj
         6+aor6OtKHf5xPDWFePIUjW4U6/ajbxyiIUuASBGLF+nedfegvzgcBWuaRSXHo1ucU0n
         5dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sDl3SIP1eENTcbJOMSeeKKGZN4KlER055QA4Gw6BRYc=;
        b=WEonTlam2G7Mjq+qUCiNak5qbVkZQu2lDLBDOP429WaWz4bjNyDgoBFTCtq4oykY9V
         Dq0N834hpCyJBMVwjPvdYh3T0VD3S8Xboa5IK+5F6CBFaS1lkXTSls+wMf0c0WuTxgyS
         4zaGqKrS6Mcjqru1ASYrgH5L5pJ8SBqSxM+VC1HxONFUBb8pl0kZ74xMzIx/9gyI9qnX
         4ht7PRRLBEVOUmUlBSpyi747FY1o1HssCl2n01sPC0t2LhjQ8gTaGFBsmlBg65kXQWtL
         dMiPU1ClNz96mNanNSfPQJR4PCbAuuV4fI6mtI0hCy9Sj8vSpUnx8k+7nHcAiCUeNjSX
         Axiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UqyHngJF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si1490209ybc.228.2020.10.20.04.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 04:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UqyHngJF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUpN4-0002XS-Fd
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 07:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUpMo-0002Wk-4l
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 06:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUpMk-00064B-TI
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 06:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603191579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDl3SIP1eENTcbJOMSeeKKGZN4KlER055QA4Gw6BRYc=;
 b=UqyHngJF6IL/vQGWWlFN+9YGjkHn1h0CFcTI7R1cnqqTw9O89x0yHv7EJU3U+NS6WmHwhL
 V2sXGezKpAOtZzjzk5gMySGBNwZB3xjk1mgxvvCrjt1jSLYPZClkD6x44GpqEHKsfyoJLH
 0xTaBwTtGATpvyYd53i5Nn4e5upQTsA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-mqV5RIcpN3CnnGkyuaEGmw-1; Tue, 20 Oct 2020 06:59:37 -0400
X-MC-Unique: mqV5RIcpN3CnnGkyuaEGmw-1
Received: by mail-wm1-f72.google.com with SMTP id v14so319506wmj.6
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 03:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sDl3SIP1eENTcbJOMSeeKKGZN4KlER055QA4Gw6BRYc=;
 b=jar0FN3SGRKozcgrfST+akqw8hLoljbj50NtmPA//hpeqp1tc5XzDhAOA6rSPLWFJd
 Jfw7x/A03VU6eXYhkXwQbRas+hk/65nv8KVRSdqKgJuMheiYDfV9j0cwA4DHobB3nsBw
 an2pMLpMz1f24PWRZ6hhwW3BGzzZ3X5sTe3HpreZy+FL/mDa2Fsg0ae0irFn6m8xA2eR
 z7tvhAAZVp5krtG+ZVXBgLThs7/3QwodOsYf/VEaCcoM7aefx1goLx/Mdu9wyZoi7+Dq
 GRtXFfsZxnYsBywTKxDD8ZsvZVJcovGmo1pW5Hl6YEYtHmsn7pkZ+Io+W4wykftd4fCB
 PhZA==
X-Gm-Message-State: AOAM531+goXVHzxBdverKJJB7J/uVjyYr7pXZjlgGoKZR+pTQn0M8vzX
 bH3QrNVV5BEo53K9AapwbnApcOTmQcFpW106l7jy8Jig1tqFOn0BHXG3UionsY8huv4Zqt0QJe1
 1PvcLrdg2QNIm
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr2737422wro.136.1603191576395; 
 Tue, 20 Oct 2020 03:59:36 -0700 (PDT)
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr2737401wro.136.1603191576164; 
 Tue, 20 Oct 2020 03:59:36 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id x22sm2349428wmj.25.2020.10.20.03.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 03:59:35 -0700 (PDT)
Subject: Re: [RFC 2/5] block/nvme: Change size and alignment of IDENTIFY
 response buffer
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <20201015115252.15582-3-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5fae4be4-2d62-7fa3-acbd-7da3154fbc47@redhat.com>
Date: Tue, 20 Oct 2020 12:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015115252.15582-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ECKXm6TXkzd8

On 10/15/20 1:52 PM, Eric Auger wrote:
> In preparation of 64kB host page support, let's change the size
> and alignment of the IDENTIFY command response buffer so that
> the VFIO DMA MAP succeeds. We align on the host page size.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   block/nvme.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index e3d96f20d0..088ff1825a 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -513,19 +513,21 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>           .opcode = NVME_ADM_CMD_IDENTIFY,
>           .cdw10 = cpu_to_le32(0x1),
>       };
> +    size_t id_size = QEMU_ALIGN_UP(sizeof(*id), qemu_real_host_page_size);

Do we really need to ALIGN_UP if we then call qemu_try_memalign()?

>   
> -    id = qemu_try_memalign(s->page_size, sizeof(*id));
> +    id = qemu_try_memalign(qemu_real_host_page_size, id_size);
>       if (!id) {
>           error_setg(errp, "Cannot allocate buffer for identify response");
>           goto out;
>       }
> -    r = qemu_vfio_dma_map(s->vfio, id, sizeof(*id), true, &iova);
> +    r = qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova);
>       if (r) {
>           error_setg(errp, "Cannot map buffer for DMA");
>           goto out;
>       }
>   
> -    memset(id, 0, sizeof(*id));
> +    memset(id, 0, id_size);
> +
>       cmd.dptr.prp1 = cpu_to_le64(iova);
>       if (nvme_cmd_sync(bs, s->queues[INDEX_ADMIN], &cmd)) {
>           error_setg(errp, "Failed to identify controller");
> @@ -547,7 +549,7 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>       s->supports_write_zeroes = !!(oncs & NVME_ONCS_WRITE_ZEROES);
>       s->supports_discard = !!(oncs & NVME_ONCS_DSM);
>   
> -    memset(id, 0, sizeof(*id));
> +    memset(id, 0, id_size);
>       cmd.cdw10 = 0;
>       cmd.nsid = cpu_to_le32(namespace);
>       if (nvme_cmd_sync(bs, s->queues[INDEX_ADMIN], &cmd)) {
> 

