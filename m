Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp457816lfg;
        Thu, 25 Mar 2021 07:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWz2imolgv1TIfN5j6JyTuwlyfQLTk+sCA6zXAtRC8yBIW9F7ZVI+G0mOg/IP3uu7BoW2Z
X-Received: by 2002:a02:8801:: with SMTP id r1mr7912203jai.51.1616681924756;
        Thu, 25 Mar 2021 07:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616681924; cv=none;
        d=google.com; s=arc-20160816;
        b=taDLkzB7tnJU+Bo7icnKlIjmY1u/IUydSw505ZQdyJjdCJvt813y/LsZQWBsXb9YNv
         Ih8v441wHXageLDnR9oDVFADIN3cYUCqUf35yKh91RxUiAw3ka6uuFfCkBudWsigTwcJ
         6xPxvCz6qSnyinmOfCh72jvbh281fEVu69VA032+aCA4S6QqyHQu/+ThQmvZfgBOLNs0
         tJbPJqBnTXxfFQfI2sG/IaNxJKeB8vPpgmrU6+EVYjWqvq+9uILEsOryxFk0xA+/RoP0
         lvaq/drNuQsRMMqZLkHXzH6830BEc2B0bIh6PbNgY5q2wsMNDPiuAL23qJ1PLmwCF2bx
         lbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=VPyegNcCAlxdGkiqWTN5GoKQ04juoez02pRiMPzV5wo=;
        b=KgthBkCAQn8mUU/9gbUvnF7GpePl7q0KK+jX+3fJaYv3qMPfSxiYEzdnCdAS805vyp
         2k4rOGn/vDLtbe1LUSUUa+wigpHks60PixHISWyxpgaDq3irmZ5uCgr0Dgzy+nsETaIW
         oD2Ai9b32aCh0zM7LqdFvwA9K+VRvNEPFSfGX7d4COxsLgsMH2P2t8pS7qv5hvBIuoS4
         b6640LLqz30snTfUDurB19eQ0PaMfEnsWbsLuH59aETz5RBxWjz7O2Mzrr1ZDTkuVxpS
         l9ofnWyY15O2JxNBAkLkpXBip28sIXU3lt8tSlS+5nmOglTbhNmJQn8QnB3g5lDELMdm
         oWkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si3964901jaq.101.2021.03.25.07.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 07:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPQou-0004fR-3I
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 10:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQom-0004f9-MW; Thu, 25 Mar 2021 10:18:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQoj-0003Hj-Sj; Thu, 25 Mar 2021 10:18:36 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F5nFW1t79zpVSK;
 Thu, 25 Mar 2021 22:15:43 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 22:18:05 +0800
Subject: Re: [PATCH v3 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <mst@redhat.com>, <jean-philippe@linaro.org>, <peterx@redhat.com>,
 <jasowang@redhat.com>, <pbonzini@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-7-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7fdc3340-51b5-3a89-7d41-2eac2c768829@huawei.com>
Date: Thu, 25 Mar 2021 22:18:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210309102742.30442-7-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0A00Ju8NDl5c

On 2021/3/9 18:27, Eric Auger wrote:
> If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
> @end overflows and we fail to handle the command properly.
> 
> Once this gets fixed, the current code really is awkward in the
> sense it loops over the whole range instead of removing the
> currently cached configs through a hash table lookup.
> 
> Fix both the overflow and the lookup.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Not much to do with this patch, but maybe we can take the fix a little
further. We now take StreamID as the start of the invalidation range,
regardless of whatever the Range is, whilst the spec clearly states that
"the StreamID parameter (of *CMD_CFGI_ALL* command) is IGNORED". If
there are some random bits in the StreamID field (who knows), we'll fail
to perform the full invalidation but get a strange range (e.g.,
SMMUSIDRange={.start=1, .end=0}) instead.

And having looked at the spec again, 4.3.2 CMD_CFGI_STE_RANGE:

  - "Invalidation is performed for an *aligned* range of 2^(Range+1)
     StreamIDs."

  - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
     aligning the range to its size."

which seems to be some bits that we had never taken into account. And
what I'm saying is roughly something like below (compile tested), any
thoughts?


diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce2..8705612535 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
          }
          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
          {
-            uint32_t start = CMD_SID(&cmd);
+            uint32_t sid = CMD_SID(&cmd), mask;
              uint8_t range = CMD_STE_RANGE(&cmd);
-            uint64_t end = start + (1ULL << (range + 1)) - 1;
-            SMMUSIDRange sid_range = {start, end};
+            SMMUSIDRange sid_range;

              if (CMD_SSEC(&cmd)) {
                  cmd_error = SMMU_CERROR_ILL;
                  break;
              }
-            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+
+            mask = (1ULL << (range + 1)) - 1;
+            sid_range.start = sid & ~mask;
+            sid_range.end = sid_range.start + mask;
+
+            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, 
sid_range.end);
              g_hash_table_foreach_remove(bs->configs, 
smmuv3_invalidate_ste,
                                          &sid_range);
              break;
