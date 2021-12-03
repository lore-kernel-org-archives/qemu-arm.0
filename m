Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp488403lfk;
        Fri, 3 Dec 2021 10:16:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJBGAhtpTDfMi6IFQWeiXppsrT7lmrMQ6JWh1Si8YrIozb8o54q6Ppwmg13MJgWeTPVbdS
X-Received: by 2002:a67:d29c:: with SMTP id z28mr22615404vsi.12.1638555407052;
        Fri, 03 Dec 2021 10:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638555406; cv=none;
        d=google.com; s=arc-20160816;
        b=ifN97qBuqezKSRPbDZLZmSFGQdoso9CmqCKWjl9YLe0Oomzm3R1c8U+bbeDkKz5kbs
         kNEraPo0NybOYycrdgQR72EWkZ0k5TdRvBi4jZnx7GQHbfJVlGIiOhVqJvjeBQ3vLa6b
         qrST380ahZTwC+vIciZWEQG9UnfwbHyPvDHeasYoO6voPjlaEjQt2+ViUTG9UxOpnoGS
         TwgsCJJU5MtkEWoXvdJ6ytzJKibLHk67Uw4bej6Ev4vHtWED18WLCd2If9SNS6gLXirF
         SFIebIQaFyPF6YbKUq86QxGVZLkFA96NpJv2TqJbZVQFAH2H6O/OQjO4Kd+t2QbpSqM3
         2jJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ppBkGJRQ9w4U32spyxVgQF9MT7bP1WtTokxACvGdm80=;
        b=PSjIGC4OI3kWFotTnLm7uGBoroKJTPvLuYgsLtA8pjcQB2BbHI/kdRITzZpF+r+zqL
         Qjlm+HLNTbjCC6tMWgyqrXnlmaS4tEBU+J3OIrfTcjfnYk+No9JGqlxHnpyAL155S1hH
         2UR3cFNmovUXRSAWJyFTDuMSVOZd4WkPsrH8//mLNHqhTbTXRAyv0VgsvK+FkDW4ZfRl
         dR9KBmnj5MDof5TxNbVgL522GBZegK5FIIYS73Bl42oxKjCoFYTHiI66jUn5FndEVozZ
         lKHZVAObxr2mQHMRkNUqXxy8SbFoCh1EoDYV127G2qKCVKu8SAyAQlx75xKRlSiU9Slh
         3WqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="h1/rGB5V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a125si4197213vsa.79.2021.12.03.10.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 10:16:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="h1/rGB5V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtD70-0001K7-95
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 13:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtD6h-0001ID-1T
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 13:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtD6d-0005z7-TP
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 13:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638555376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppBkGJRQ9w4U32spyxVgQF9MT7bP1WtTokxACvGdm80=;
 b=h1/rGB5VN6icUqRkqEwK6rXllh8fAo6EiacHIvn0b7lpsUSrQtcST5u88B2PtHs3z06spK
 Gx0hApCAu3AWDktOJr6U9eRYNOC3YMbNbjKU9AjNjNztoEWOdD83WhXuc3b7HkwAfV6Wus
 /PEt9EyfstdhNg72rDAnk1+JmLaYQ3w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-ix-e4S7YMBeo9S6kwthqFg-1; Fri, 03 Dec 2021 13:16:15 -0500
X-MC-Unique: ix-e4S7YMBeo9S6kwthqFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so859028wro.4
 for <qemu-arm@nongnu.org>; Fri, 03 Dec 2021 10:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ppBkGJRQ9w4U32spyxVgQF9MT7bP1WtTokxACvGdm80=;
 b=mHhW8/eLR50zO+IkmOYvp/16M1pBq09LKRJLq3J30BH3+Pz8HxFvDd/ShjmRAwKZHr
 lWv05709oVbOtPKuoRrSo0wOdsV4uU5FLTYNEgSRBd4Nq4WHYkc9WFaYvUk66Fo0JC1p
 fdVlZxhlvSRBlOrGAtZBF21bekOr1bhXpH8oh5z848fxBys3pZAv9/7rLwm4//jKUTyn
 WwI2fzMPjw+BaPMszEBmKCRvm2UN2xyX8d3dIDgEoWSxbLGgz3odm3HjTIPlJ45bm6HF
 HRPPSS7lXsKjsJgvw4pEba4+IJN7wPs6CncjL+NYa9U5fzzoB3MdKOvtLQX+CYNCyLwj
 BLRQ==
X-Gm-Message-State: AOAM530ofRkeP/qgXxoO7s+bim/6k3YiSUj+ePOhT21a6lxQtUikN0G0
 zRpeuIJvibTEzMOUEmjKW5PoY9NmlWfGutRuE41LQLHw1fMRMXMyhL+RHCbjTE/rV9pIlFMatYQ
 UFli5oLMSp3cw
X-Received: by 2002:a7b:c763:: with SMTP id x3mr16969728wmk.31.1638555374093; 
 Fri, 03 Dec 2021 10:16:14 -0800 (PST)
X-Received: by 2002:a7b:c763:: with SMTP id x3mr16969664wmk.31.1638555373696; 
 Fri, 03 Dec 2021 10:16:13 -0800 (PST)
Received: from ?IPV6:2003:d8:2f44:9200:3344:447e:353c:bf0b?
 (p200300d82f4492003344447e353cbf0b.dip0.t-ipconnect.de.
 [2003:d8:2f44:9200:3344:447e:353c:bf0b])
 by smtp.gmail.com with ESMTPSA id m17sm3175697wrz.22.2021.12.03.10.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:16:13 -0800 (PST)
Message-ID: <cb4ff18b-9e99-b503-a4b6-f2ecce664a25@redhat.com>
Date: Fri, 3 Dec 2021 19:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] virtio-mem: Correct default THP size for ARM64
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203033522.27580-3-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211203033522.27580-3-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ae66rBuvlaQd

On 03.12.21 04:35, Gavin Shan wrote:
> The default block size is same as to the THP size, which is either
> retrieved from "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
> or hardcoded to 2MB. There are flaws in both mechanisms and this
> intends to fix them up.
> 
>   * When "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size" is
>     used to getting the THP size, 32MB and 512MB are valid values
>     when we have 16KB and 64KB page size on ARM64.

Ah, right, there is 16KB as well :)

> 
>   * When the hardcoded THP size is used, 2MB, 32MB and 512MB are
>     valid values when we have 4KB, 16KB and 64KB page sizes on
>     ARM64.
> 
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/virtio/virtio-mem.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index ac7a40f514..8f3c95300f 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -38,14 +38,25 @@
>   */
>  #define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
>  
> -#if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
> -    defined(__powerpc64__)
> -#define VIRTIO_MEM_DEFAULT_THP_SIZE ((uint32_t)(2 * MiB))
> -#else
> -        /* fallback to 1 MiB (e.g., the THP size on s390x) */
> -#define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
> +static uint32_t virtio_mem_default_thp_size(void)
> +{
> +    uint32_t default_thp_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
> +
> +#if defined(__x86_64__) || defined(__arm__) || defined(__powerpc64__)
> +    default_thp_size = (uint32_t)(2 * MiB);
> +#elif defined(__aarch64__)
> +    if (qemu_real_host_page_size == (4 * KiB)) {

you can drop the superfluous (), also in the cases below.

> +        default_thp_size = (uint32_t)(2 * MiB);

The explicit cast shouldn't be required.

> +    } else if (qemu_real_host_page_size == (16 * KiB)) {
> +        default_thp_size = (uint32_t)(32 * MiB);
> +    } else if (qemu_real_host_page_size == (64 * KiB)) {
> +        default_thp_size = (uint32_t)(512 * MiB);
> +    }
>  #endif
>  
> +    return default_thp_size;
> +}
> +
>  /*
>   * We want to have a reasonable default block size such that
>   * 1. We avoid splitting THPs when unplugging memory, which degrades
> @@ -78,11 +89,8 @@ static uint32_t virtio_mem_thp_size(void)
>      if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
>          !qemu_strtou64(content, &endptr, 0, &tmp) &&
>          (!endptr || *endptr == '\n')) {
> -        /*
> -         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
> -         * pages) or weird, fallback to something smaller.
> -         */
> -        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
> +        /* Sanity-check the value and fallback to something reasonable. */
> +        if (!tmp || !is_power_of_2(tmp)) {
>              warn_report("Read unsupported THP size: %" PRIx64, tmp);
>          } else {
>              thp_size = tmp;
> @@ -90,7 +98,7 @@ static uint32_t virtio_mem_thp_size(void)
>      }
>  
>      if (!thp_size) {
> -        thp_size = VIRTIO_MEM_DEFAULT_THP_SIZE;
> +        thp_size = virtio_mem_default_thp_size();
>          warn_report("Could not detect THP size, falling back to %" PRIx64
>                      "  MiB.", thp_size / MiB);
>      }
> 

Apart from that,

Reviewed-by: David Hildenbrand <david@redhat.com>


Thanks!

-- 
Thanks,

David / dhildenb

