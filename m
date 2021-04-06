Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1303930lfr;
        Tue, 6 Apr 2021 02:57:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa42u8fQ67MU5BBXk+n4gZt1NB14XLk8waapYWop94nGF6YQQukv9ePZh0FlnveTNjNGZ5
X-Received: by 2002:a5e:dd0c:: with SMTP id t12mr22504857iop.50.1617703071610;
        Tue, 06 Apr 2021 02:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617703071; cv=none;
        d=google.com; s=arc-20160816;
        b=krvxIzRyAm+dY1pbtHSn7gDzcEb8YsqctpTwtpUO9srKR6QTVZhgRmcEtC+/FZDmPs
         FNUKyck05jtgVuQowJELoo00SW3Y88/dsv90iWyL0vCMqZI0gk4WkgdiyqkLaPdChkbR
         1d0K+JWb11DVGam/HnOtLzkrA443VeHGFeBiFIRpZ4ZDzjVe7R1ifi8uCWBh+tmuiX2V
         3WbCwuBr34mJ9T6m4dW5v6CM20cf8LnS5IXxLlNMD/UBwBWf4QkCRH0HC+qSRZTQC2Tq
         kBvxBRm7sI/+SVP6Ijy3lYeEz5FlSi6Hu8x6COlxIo/558SOAiTxwDA5672kOoSrD3jN
         7peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W/6nFjEZzf5Mt/a4GRZ/lGtFOoV/eUOKpfYMtsn+KCM=;
        b=p/KC/8gxkri+qGGqfTSevjZRPqahOWghhTlq9JYr/ngBXv6HskXPPFPVGUU7n3lvtj
         PB2wBdNSHTzZ5UeRJC42FLcfvk8LwDXpa79vy/Wvq7coZ3rhlzCS57zQD1wwFIRIk0Os
         Qu9gNzBWmlE1dc12wgN/IpRUwd0bO3njX0II40VN9DuwiHXhgrFg3pgFBCGH8DPQvGA0
         dxlANoSxO+ADSB52Ml+eZqFSdMkbTh8b9eBubBBuHsHw/phQ4bXtfo8kr0j3HY1+y9Gs
         ozub2pun/NBBstolWJvRfL++IG0/cYoWYSpVoUesIczAEdCgbW6k01pn0st0ZMhmJwE5
         b42g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EHPfVmTj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si18363279ilu.106.2021.04.06.02.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 02:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EHPfVmTj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTiT0-0005VI-UJ
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 05:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTiRF-0004aq-EQ
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 05:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTiR7-0004g6-SZ
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 05:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617702951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/6nFjEZzf5Mt/a4GRZ/lGtFOoV/eUOKpfYMtsn+KCM=;
 b=EHPfVmTjGwzcD01zibQFgxpFxi6RPhd86rV2+s4fIuFPbViGGig3Yvu1uNPJaLputv/p9N
 fW7z+xy6UrqHPEY3LenPgV02ETlxdQlS1PNQ4dAi5N6WHyzlnwzjA8XgO3OYmv3fyPCjja
 1mhdcJ4qf6pfFEhHRy+6yov70zLFHXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-xUWV8oEsNF-9l2OYk79HOg-1; Tue, 06 Apr 2021 05:55:48 -0400
X-MC-Unique: xUWV8oEsNF-9l2OYk79HOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E603107ACCA;
 Tue,  6 Apr 2021 09:55:47 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B2F7095B;
 Tue,  6 Apr 2021 09:55:45 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned
 range of StreamIDs
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20210402100449.528-1-yuzenghui@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bb65638c-2fbf-6d42-f155-afcdeca6b265@redhat.com>
Date: Tue, 6 Apr 2021 11:55:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210402100449.528-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UoQYixG9vpfy

Hi Zenghui,

On 4/2/21 12:04 PM, Zenghui Yu wrote:
> In emulation of the CFGI_STE_RANGE command, we now take StreamID as the
> start of the invalidation range, regardless of whatever the Range is,
> whilst the spec clearly states that
> 
>  - "Invalidation is performed for an *aligned* range of 2^(Range+1)
>     StreamIDs."
> 
>  - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
>     aligning the range to its size."
> 
> Take CFGI_ALL (where Range == 31) as an example, if there are some random
> bits in the StreamID field, we'll fail to perform the full invalidation but
> get a strange range (e.g., SMMUSIDRange={.start=1, .end=0}) instead. Rework
> the emulation a bit to get rid of the discrepancy with the spec.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/smmuv3.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 3b87324ce2..8705612535 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          }
>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
>          {
> -            uint32_t start = CMD_SID(&cmd);
> +            uint32_t sid = CMD_SID(&cmd), mask;
>              uint8_t range = CMD_STE_RANGE(&cmd);
> -            uint64_t end = start + (1ULL << (range + 1)) - 1;
> -            SMMUSIDRange sid_range = {start, end};
> +            SMMUSIDRange sid_range;
>  
>              if (CMD_SSEC(&cmd)) {
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
> -            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
> +
> +            mask = (1ULL << (range + 1)) - 1;
> +            sid_range.start = sid & ~mask;
> +            sid_range.end = sid_range.start + mask;
> +
> +            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, sid_range.end);
>              g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
>                                          &sid_range);
>              break;
> 

