Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1502276ejj;
        Tue, 26 Mar 2024 10:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0Jx1xjdUpf46HPfc+skouVupgwSfxOk03inMIddma/fs2eaQ8C1BtudAaQjRRiPc49EsT3cLeSma3/j7Wle0QwheyTCzP
X-Google-Smtp-Source: AGHT+IHZ1rSVbrG179EsMCtt7YlFGEOY7VWpjMbLJJ5fG59tKLr/G9o8LkpCbzp2/GUlvC5aVkdm
X-Received: by 2002:a05:6214:ca6:b0:696:8bf3:ea02 with SMTP id s6-20020a0562140ca600b006968bf3ea02mr4397700qvs.56.1711474443092;
        Tue, 26 Mar 2024 10:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711474443; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/8wiyVW+gTph5zKA9yTAmddiK4EKL3s1j2XronD+HKB0WR2F9KSZu/2nMpbNURglc
         DEFmsx3KW26PEfYn1TeH6ikrUVNgGVhIon0wOvREJo7849G+HkE3vCbx0VVSwdMuQy9d
         XDbl/WjXkI4knfA8s9SPnO5YQFhWjsERzhmThOwzPjas6v+mokF/XYGcy3GrjhPILNbD
         9x0is47xsaylzX/EQfwpXTOkrSl4pCJb/bC+2PsVNqDAkLpQSztCKBQQlwzuhE6JdZf4
         O52genfQw3mIXicskhROAqmUZuB2+wi0C7zSnlttnkQZ72aJxEHTrIAhDk3rKuYuzSEk
         XVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BNmhbIHf/9FUdbrPtt+708pmpGwc/VjtsnB+QJiKo+U=;
        fh=JZ1m5+kPk7T3FzL9MwTYVrtzILVXTNvOumyJnYi6F9g=;
        b=G/HdRjBWTDqd1RhF90gJgiN/jgHuio+513LdmgVGrBo9pziCCT9C6HnxOmC4VFK7Cj
         izcBM8UXGXA2Zk8ylQjS9kgjFp3DmBbjhFXBWX4+2yuMKHAQBjE6KFkaCalaNcntMCIh
         7p4Hjt29jef2YCyORZkQ7aBEL8PZ2aPwpbOHriSm1ScD4U/gmbRZKL8aGJNCPLyZrG9q
         QZuHNhLHcHZ1lJuCoHCPNcvGzVK/8YlYreOs7lhpWGHSZREbdJ4fo6+Nx7U4sB1/WN2V
         wygdUnozZ0WAKqSWaIwsaqjWtVe/woAN52L7rEggAE1UF/kQ9xKSaFXOBnII4SixX6kG
         U6vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PeWCJTgj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv8-20020a056214240800b006914cd7a8b3si835188qvb.379.2024.03.26.10.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 10:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PeWCJTgj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rpAg6-00014a-NX; Tue, 26 Mar 2024 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpAg5-00014D-BW
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 13:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpAg3-0005WE-Fc
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 13:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711474414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNmhbIHf/9FUdbrPtt+708pmpGwc/VjtsnB+QJiKo+U=;
 b=PeWCJTgjPwGY9G/V1u4tAflmkbd9JTwxfciZP2cUp2fwJPnrcTOGO3V3gj12fq999+/CLi
 mOzND+CfIIWMbWNXVfjy6Owyi7MyWV9sjtm99z7kmnoofKcJpssh/c5n/aho3p4UyDrDVs
 1UQpcfD2fgoCev6RgAn6CCsai2TgfBk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-EtmwEDaUOmWIj7vm0T2Gsg-1; Tue, 26 Mar 2024 13:33:10 -0400
X-MC-Unique: EtmwEDaUOmWIj7vm0T2Gsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41485831b2dso20633455e9.3
 for <qemu-devel@nongnu.org>; Tue, 26 Mar 2024 10:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474389; x=1712079189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNmhbIHf/9FUdbrPtt+708pmpGwc/VjtsnB+QJiKo+U=;
 b=eqZfZH5wr1sJ62GGwQlJ0Hfct8Bxwe4sG554mn9rm118ZF8dTkCmgeOv8rlvAUu3V4
 hJ3UmtMiyQJz/VKHXafftbrLgm7XCOdQImG8yN097H0nlAlyoYMnCgKeMPLwTr359Y3I
 jbAWhW4yADFPYeFDKmCzu6wSIQ6vRkqXV0FLMr6hyF7BvubpDtovkE23AQynAJaChnZ0
 HFo8bnJDBRSPSTOfppG1Q2WJXueNKDGAAHpxvlqvzGJHTRxpudr+SCcYh7j+CduDMWnm
 uwPAmwqZtmabZuNIVz2gm+gaK3HEA4SqXmwPb0EqpYXtxIOSDcHMM6wkj5OJhSkW6+47
 jtYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt9sSQXHT6iD6+fdIXKZVEwq/UW88gWPGkqzMRhae5IciBAxGNu1/zU5CZjMu1lbdbrBSMPJ5HhTdGulswO7iIitn/Keo=
X-Gm-Message-State: AOJu0Yy5JcoICZkEgrXHVfYKzmBdOiUygpvTucmgnJ+DF1nCi158Fj8Z
 Pkrf410O+ZTE7tvCnYdDc3cmSVP2nDYGdHCJUcpNstYaQlDG8lSQ0D4un2Asfq/Lohm1+Fhfk1n
 +S+80Dbuo0acsJtcgUojXbDkOwjQzEFro6SG7lZckas11y2NDaj9H
X-Received: by 2002:a05:600c:3595:b0:412:beee:36b3 with SMTP id
 p21-20020a05600c359500b00412beee36b3mr267846wmq.7.1711474388716; 
 Tue, 26 Mar 2024 10:33:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3595:b0:412:beee:36b3 with SMTP id
 p21-20020a05600c359500b00412beee36b3mr267827wmq.7.1711474388347; 
 Tue, 26 Mar 2024 10:33:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b00414674a1a40sm12186638wmq.45.2024.03.26.10.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 10:33:08 -0700 (PDT)
Message-ID: <7cc63c22-6113-4b48-9e73-8405a6ddd4b5@redhat.com>
Date: Tue, 26 Mar 2024 18:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0? v2 1/4] hw/arm/smmu: Avoid using inlined
 functions with external linkage again
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20240326171009.26696-1-philmd@linaro.org>
 <20240326171009.26696-2-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240326171009.26696-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tj2mBdzwNKwY

Hi,

On 3/26/24 18:10, Philippe Mathieu-Daudé wrote:
> Similarly to commit 9de9fa5cf2 ("hw/arm/smmu-common: Avoid using
> inlined functions with external linkage"):
>
>   None of our code base require / use inlined functions with external
>   linkage. Some places use internal inlining in the hot path. These
>   two functions are certainly not in any hot path and don't justify
>   any inlining, so these are likely oversights rather than intentional.
>
> Fix:
>
>   C compiler for the host machine: clang (clang 15.0.0 "Apple clang version 15.0.0 (clang-1500.3.9.4)")
>   ...
>   hw/arm/smmu-common.c:203:43: error: static function 'smmu_hash_remove_by_vmid' is
>   used in an inline function with external linkage [-Werror,-Wstatic-in-inline]
>       g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
>                                             ^
>   include/hw/arm/smmu-common.h:197:1: note: use 'static' to give inline function 'smmu_iotlb_inv_vmid' internal linkage
>   void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
>   ^
>   static
>   hw/arm/smmu-common.c:139:17: note: 'smmu_hash_remove_by_vmid' declared here
>   static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
>                 ^
>
> Fixes: ccc3ee3871 ("hw/arm/smmuv3: Add CMDs related to stage-2")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20240313184954.42513-2-philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 4caedb4998..c4b540656c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -197,7 +197,7 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>  }
>  
> -inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
> +void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
>  {
>      trace_smmu_iotlb_inv_vmid(vmid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);

