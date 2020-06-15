Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1331307lfm;
        Sun, 14 Jun 2020 20:19:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf00M50sTALHBgcp5yIXBvFOf/rh2hlMAJD5ZyVu0PU+VtHGoX4Z2NiUcvNW9mc1PW4TR7
X-Received: by 2002:a25:3b94:: with SMTP id i142mr38306518yba.46.1592191146654;
        Sun, 14 Jun 2020 20:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592191146; cv=none;
        d=google.com; s=arc-20160816;
        b=ZA3ZbaEcembzUlaXFI4TeH3GX9ABYqmPNB1fVj0EoGeRwkM7rtC9oEiyGqsI8uUHAT
         9ID+B20jsp7nSnWrnobAs4IQrcbQaB+373S8jP1KjVdqhO/1z5Ev3YDbyGRhnY6EWRwn
         BkW6arQhDuwXypAqS6yowVg+KgMkpzwVkDmUfcsYutmJHLg4DKZ/0Nu+L8gqzc+a9ssH
         UxmInKPRM98h4IS+60h0QcDmjOjNwOcFX3qJS9+eyMWFuqMOT9tZV+uOsESWFDRymVUu
         50GM60q/zz2pQLDqNKQAXzWlGpjrMAPIYz6vVKTY7X8fZlKJuJojxt/uZcF4I3jKM72n
         uIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=mf6EFQsSTaRR9RmOKTbO8/p4hqYkGadG4m1ZTqx2xuQ=;
        b=Otc3pAujIycN7DFf96SIWMBOwOTS2BF8Y7kTLtrHkuHrXA1s+Qxnr7VbYixiIyIwar
         7drghOuIVaY6ohxRmk2AYBN0Y8m5FQ2IXsc9Jo7GBja2bNTzBIq2cn6+aHbIuGos4aaL
         XFWZrfwkMurBDp61PObqTMJAf9WKb98rDXwixKu5eWFlEyJ9K99rALI8cPcAhTjrxeb2
         Rnc+9aLXzbeCHSBu7KQyc0qLywNzAwKHh2Hf8ZDKKT5TXCMHBEgDbwHuYFbX3E2/6WcJ
         IhFogFwT2Z188EJ4gBFiMuxcbXGob0SyztUWG2QD3kglHnV4zaDlLXJwd0wtizDVfe0f
         dI9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d93si12492273ybi.258.2020.06.14.20.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jun 2020 20:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkfeM-0003cl-1L
	for alex.bennee@linaro.org; Sun, 14 Jun 2020 23:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jkfeE-0003cY-FG; Sun, 14 Jun 2020 23:18:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41470 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jkfeC-0004sF-Ge; Sun, 14 Jun 2020 23:18:58 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B9AA485A7CB47FF9F78A;
 Mon, 15 Jun 2020 11:18:45 +0800 (CST)
Received: from [10.173.221.230] (10.173.221.230) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 15 Jun 2020 11:18:35 +0800
Subject: Re: [PATCH] migration: Count new_dirty instead of real_dirty
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, <jianjay.zhou@huawei.com>
References: <20200601040250.38324-1-zhukeqian1@huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <3205abb1-8e47-fc19-1213-ead621711291@huawei.com>
Date: Mon, 15 Jun 2020 11:18:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200601040250.38324-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/14 23:18:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: wanghaibin.wang@huawei.com, Chao Fan <fanc.fnst@cn.fujitsu.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gys9Yx9VBpSI

Hi Paolo and Jian Zhou,

Do you have any suggestion on this patch?

Thanks,
Keqian

On 2020/6/1 12:02, Keqian Zhu wrote:
> DIRTY_LOG_INITIALLY_ALL_SET feature is on the queue. This fixs the
> dirty rate calculation for this feature. After introducing this
> feature, real_dirty_pages is equal to total memory size at begining.
> This causing wrong dirty rate and false positive throttling.
> 
> BTW, real dirty rate is not suitable and not very accurate.
> 
> 1. For not suitable: We mainly concern on the relationship between
>    dirty rate and network bandwidth. Net increasement of dirty pages
>    makes more sense.
> 2. For not very accurate: With manual dirty log clear, some dirty pages
>    will be cleared during each peroid, our "real dirty rate" is less
>    than real "real dirty rate".
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  include/exec/ram_addr.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 5e59a3d8d7..af9677e291 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -443,7 +443,7 @@ static inline
>  uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>                                                 ram_addr_t start,
>                                                 ram_addr_t length,
> -                                               uint64_t *real_dirty_pages)
> +                                               uint64_t *accu_dirty_pages)
>  {
>      ram_addr_t addr;
>      unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
> @@ -469,7 +469,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>              if (src[idx][offset]) {
>                  unsigned long bits = atomic_xchg(&src[idx][offset], 0);
>                  unsigned long new_dirty;
> -                *real_dirty_pages += ctpopl(bits);
>                  new_dirty = ~dest[k];
>                  dest[k] |= bits;
>                  new_dirty &= bits;
> @@ -502,7 +501,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>                          start + addr + offset,
>                          TARGET_PAGE_SIZE,
>                          DIRTY_MEMORY_MIGRATION)) {
> -                *real_dirty_pages += 1;
>                  long k = (start + addr) >> TARGET_PAGE_BITS;
>                  if (!test_and_set_bit(k, dest)) {
>                      num_dirty++;
> @@ -511,6 +509,7 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>          }
>      }
>  
> +    *accu_dirty_pages += num_dirty;
>      return num_dirty;
>  }
>  #endif
> 
