Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp509962lfg;
        Thu, 25 Mar 2021 08:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjkRJqpPcum9vp86D/dT/u941+bhEdjfKyVEUnx7qLkOyU8KREIz/LNRlTByY6HmOckkxb
X-Received: by 2002:a05:6e02:1c85:: with SMTP id w5mr6521485ill.193.1616685395692;
        Thu, 25 Mar 2021 08:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616685395; cv=none;
        d=google.com; s=arc-20160816;
        b=ewj6I4c1c8ziLUyTOs8fZ5J+IlquFTlWLl0uWkxiGLmhTpEH4WUbc5JulcfcwRG0CQ
         1o5/dOkK7aavZ4nNyzErgISMq/88UhE51OUz9dxH3nzE+arfvBDYxJwXd6qQbiozusz0
         /O9umJv3UDlKg/msEtG6LXpUARUC5zS6e3MPsHRLFSOB7RxkHHIDZ6xi9DFg/tvaV9bE
         PhCVncYN2YH3Ph1WA+4tSpCKSanQdwNM1i9cLxDGwIUkrAeuWlKrvw51Zm+3hJjtejae
         zyOLcqKdowSK7ZeAP8LQk7ypelUp9OjUo7hjy4pJErtSBN8Zje6ErmcHDa+yyNcVbmM9
         W2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B9T/lViAMjp4/d7mxjgoavMCZ7hYK9/Bkrjek+klZIc=;
        b=jUBK3vtQnrEwixrB0tGRzWad9Gm/NSmqyRc1OzcMxLSdVGA+2VAoMCrYE6sSanxaTF
         wq0LhbD0XQbpFXu8jGhRXmNsHUg0eRyz8Cs1z+H6Yc2FbVHnZKV3ASJml5v2b6VwJdl/
         6d+bSKVZ00CZFOHZKfn28uXJIDWhSCF4n37jryvNkNhdY9lAw2j31ImTbvf6hNFY7L8x
         SjwNF1DtYL8DMBC/Pi96DUZV2PIVYtNaluVSVYKfoxG1atcm4JYAN0OwKoU5SH9o+qeE
         1pc3NTpHBses+LTCX/ELt+SdN+thd8oC9qT3Z/PJspH08CfwYXriMfdZ7Zit49/CyLKF
         vfcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EGJjfsV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si3999754ilg.43.2021.03.25.08.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EGJjfsV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPRit-0007PY-07
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPRdB-0000SB-W4
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPRdA-0000pW-7j
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616685038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9T/lViAMjp4/d7mxjgoavMCZ7hYK9/Bkrjek+klZIc=;
 b=EGJjfsV8J8rY+oNMjMXCBKYFGFDTgDUMzhE2tLyPRueRk204m/Ye12EBi2L0yuBkJbtKqq
 yra/BqON4EHav6umbaN326Y4n0fkm299Erroz3ry2ySGgeM3b3Tkjis3XULqySZEbp8y6Y
 2eg2iUM5voHxY7k8FpRst0rSKEaKjkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-beCqQWw7PVSrPw4dZJDJFw-1; Thu, 25 Mar 2021 11:10:34 -0400
X-MC-Unique: beCqQWw7PVSrPw4dZJDJFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB4B8E38A3;
 Thu, 25 Mar 2021 15:10:17 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B39F279459;
 Thu, 25 Mar 2021 15:09:45 +0000 (UTC)
Subject: Re: [PATCH v3 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
To: Zenghui Yu <yuzenghui@huawei.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, jean-philippe@linaro.org, peterx@redhat.com,
 jasowang@redhat.com, pbonzini@redhat.com
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-7-eric.auger@redhat.com>
 <7fdc3340-51b5-3a89-7d41-2eac2c768829@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7a616c80-be1e-3c1d-2192-c8f4662760aa@redhat.com>
Date: Thu, 25 Mar 2021 16:09:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7fdc3340-51b5-3a89-7d41-2eac2c768829@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Js2PlhVQK6ds

Hi Zenghui,

On 3/25/21 3:18 PM, Zenghui Yu wrote:
> On 2021/3/9 18:27, Eric Auger wrote:
>> If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
>> @end overflows and we fail to handle the command properly.
>>
>> Once this gets fixed, the current code really is awkward in the
>> sense it loops over the whole range instead of removing the
>> currently cached configs through a hash table lookup.
>>
>> Fix both the overflow and the lookup.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Not much to do with this patch, but maybe we can take the fix a little
> further. We now take StreamID as the start of the invalidation range,
> regardless of whatever the Range is, whilst the spec clearly states that
> "the StreamID parameter (of *CMD_CFGI_ALL* command) is IGNORED". If
> there are some random bits in the StreamID field (who knows), we'll fail
> to perform the full invalidation but get a strange range (e.g.,
> SMMUSIDRange={.start=1, .end=0}) instead.
> 
> And having looked at the spec again, 4.3.2 CMD_CFGI_STE_RANGE:
> 
>  - "Invalidation is performed for an *aligned* range of 2^(Range+1)
>     StreamIDs."
> 
>  - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
>     aligning the range to its size."
> 
> which seems to be some bits that we had never taken into account. And
> what I'm saying is roughly something like below (compile tested), any
> thoughts?
> 
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 3b87324ce2..8705612535 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          }
>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
>          {
> -            uint32_t start = CMD_SID(&cmd);
> +            uint32_t sid = CMD_SID(&cmd), mask;
>              uint8_t range = CMD_STE_RANGE(&cmd);
> -            uint64_t end = start + (1ULL << (range + 1)) - 1;
> -            SMMUSIDRange sid_range = {start, end};
> +            SMMUSIDRange sid_range;
> 
>              if (CMD_SSEC(&cmd)) {
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
> -            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
> +
> +            mask = (1ULL << (range + 1)) - 1;
> +            sid_range.start = sid & ~mask;
> +            sid_range.end = sid_range.start + mask;
> +
> +            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start,
> sid_range.end);
>              g_hash_table_foreach_remove(bs->configs,
> smmuv3_invalidate_ste,
>                                          &sid_range);
>              break;
> 
Thanks for spotting this discrepancy with the spec. This looks good to
me, please feel free to then the patch.

Thanks

Eric

