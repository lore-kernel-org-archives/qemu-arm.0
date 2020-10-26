Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3047919lfa;
        Mon, 26 Oct 2020 10:04:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa/jHI9L8jMVqYBiqGV83EE/bGpZigC3E3bNCoxy6agPxUMwn+hyFYS2VJJFswxqS5nDiF
X-Received: by 2002:ae9:efc7:: with SMTP id d190mr18651497qkg.12.1603731846858;
        Mon, 26 Oct 2020 10:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603731846; cv=none;
        d=google.com; s=arc-20160816;
        b=0RO0F93RkuBe1YAPXNHjKvQp6QAZQX1gQ2IiP3XnC71PkDQ6B5wKTyg/siFzPf6jOB
         ytp6/maUj/JlikpsCSstu5EzHDOZoH30Jh1oGE+XMS/ah4agSMgnRNho1hLOAd1tGPQj
         o50Hypu6ITPK3swUvSA2CevGjy9tpRYw7EM8moS0FX0HVbcuO4UHmf0sxrr7WtdI1wBo
         L2Oa4TW0fWQ0mC9BB5jF1KCNlwD2dHpfJwpUpKXpil0np7wVShLZD8Wcah7WhlWO/y2O
         TwxIj7vf9hwz5wfW79xsu5GBU92gpocySscdKGwMsvPQyUxQZtF0tzbr3rYoS69uveDP
         1UPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=N7sZbkqlV2qLM4L4n5gB6iixRF31pMjYTmnSrlXB7BM=;
        b=opj5U6QN7PIqSYL/2vpmA1AUWvQ37AQ2w7JBzOhAuCGE7BvVRApS4NzVYjrWn6ar2X
         C/f5fkhNfF7gviq4YZFlGMqGd8Cfbglegg0T/yExKLO8JRPwWKRiMufAbOwzI9RtYpkA
         85oZydTeFVw8gZwJoIdX4DsuQeILT+nKxUTismc9oQWpBeLzR0HGCVFECrPPTzH2FpeR
         +7EJprL66+DyVAyAqn2FsUfSvQRU5C3Dtol2/Em3i2Rj4tWru7/so87qEDDKPDoPTUZ9
         LQgd7WiAROaBTOifaRrq0OAUkXpGLv8tN/2lh8A3ZoIC4ZQH37GEz/RDdwNCWqLxIlcx
         bwHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BytyOR6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si6483151qtl.85.2020.10.26.10.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 10:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BytyOR6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX5ug-00078q-96
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 13:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kX5uH-0006v9-9I
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:03:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kX5uF-0006E0-OS
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603731819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7sZbkqlV2qLM4L4n5gB6iixRF31pMjYTmnSrlXB7BM=;
 b=BytyOR6WQjldyFtnhF6xxXFASoo3VEHOlvsAM0kmQFTSTrcg/KmCR2u7tHGWtLyvvRC9Lk
 oX1iKMC/7oIyV3WWaJuTKD1EV/NCheMRx/Di/x3X5jGN8nH7y+SCGoZK6a8OUEaLkrzIad
 dyixKg1UTDeP4E6KibXwz4phiel/hVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-zxx_lJ8sPmaTTlQoQskiPA-1; Mon, 26 Oct 2020 13:03:35 -0400
X-MC-Unique: zxx_lJ8sPmaTTlQoQskiPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2C6A0CC9;
 Mon, 26 Oct 2020 17:03:33 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 511B775141;
 Mon, 26 Oct 2020 17:03:31 +0000 (UTC)
Subject: Re: [PATCH] [RFC] hw/arm/smmuv3: Set the restoration priority of the
 vSMMUv3 explicitly
To: Zenghui Yu <yuzenghui@huawei.com>, peter.maydell@linaro.org
References: <20201019091508.197-1-yuzenghui@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8afdbde3-5b5f-0237-d311-32974cf58a14@redhat.com>
Date: Mon, 26 Oct 2020 18:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201019091508.197-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rpkkl1vdFeHI

Hi Zenghui,

On 10/19/20 11:15 AM, Zenghui Yu wrote:
> Ensure the vSMMUv3 will be restored before all PCIe devices so that DMA
> translation can work properly during migration.

Sorry I missed this patch. good catch!

Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
> 
> not sure if anything would actually go wrong...
> 
>  hw/arm/smmuv3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0122700e72..2017ba7a5a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1440,6 +1440,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>      .name = "smmuv3",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .priority = MIG_PRI_IOMMU,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(features, SMMUv3State),
>          VMSTATE_UINT8(sid_size, SMMUv3State),
> 

