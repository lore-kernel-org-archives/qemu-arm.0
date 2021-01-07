Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp506634lfq;
        Thu, 7 Jan 2021 10:14:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHh/l7DTRzN4Z1dk7gXcB/h+XrQzrX7hgCEUirphwiL7TJmD3RUg5p1G1i9E3aaIkLfsMd
X-Received: by 2002:a25:9902:: with SMTP id z2mr14286707ybn.339.1610043271293;
        Thu, 07 Jan 2021 10:14:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610043271; cv=none;
        d=google.com; s=arc-20160816;
        b=qaMghLx/sW+2aZtsqMnSc1X9OJkWsXq/vT8NVa2WsFZHgBXo8C98W2ACvRuh6hE7qO
         Bk2AYbD7mQxGpyph8KZFloIFiGJ1NGLfXqX2lUCkTnI1Yz1o6T3I3MdspcWvDWAngGmV
         hl19D8tNgmtwyf1wj8uqDdnXWSWlsHiIOUwcLKo337rgnhD1U/aA7Ei//2ryWjGhRcYQ
         6zxtyObgGWR9JZxxBbZXwzo7YXy1fO2bZqZUeQKOaOO318qhtnjCMeLvCDqDlhH4yFYw
         ScHOQ3iREVUDOxVfZe/p+zD1iJXBBRugoLe0FP7LAVWTMkjOVwUNnxgdQZqvaKzBka1s
         03bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EevDkj3Eq5HGyjrzEGnkPKUnTQ5NdW9RJ/mZwCBu75Y=;
        b=PVmYpj2KNzBppWO+ER83/wimxs7ttuULjT9Ax2nNZoO0XQF5p1HmQEXO2bVd1BYRnv
         AqGbSwcHuMkP8jhMUVGBk+937zcR9Ye/nJUpPihwvTF0nqa9iarhvaFexoMKj6lshWji
         YouWJTE9PiJXZlx2qnPtaqLEbbFMqbCcRy24g0zd3iSFC08jYmOX2urqT+0ElqVmafn6
         Jw3Fg7CRMTjZyGnvqOaYiz8UVbTyWclpg9V3NBM0vGjDMZs2h0CUFrnX/UY8JOm6+IXB
         TJD7ZH1xyj80JcuvzYUZ+YKFFzpyNDcRhvSJaRLBm6WeNIfjRnvnGjz1oK43t00LGMO9
         iR9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VHnuf8xp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e134si6634755yba.92.2021.01.07.10.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 10:14:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VHnuf8xp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZnq-0006Q1-Mu
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 13:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxZnV-0006PI-Bm
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxZnT-0000gM-Dw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610043246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EevDkj3Eq5HGyjrzEGnkPKUnTQ5NdW9RJ/mZwCBu75Y=;
 b=VHnuf8xpX+gQoe4KSCS3PiBQmYJ1XuqJaZglLzfcwJ+oYl5KZ8/OB08n3yk/nOvAAny4m2
 yCzCqhyb+384IThkskoYVbpCGqEfUufSdPFzjK1JdHjYr9O34tqofhaCXbK01ChTXoVHz2
 ZtONlJ3eApbs7EWClfbWcy1rH6RGPgE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-11My_ayZNWyY5HkLBQzF0A-1; Thu, 07 Jan 2021 13:14:05 -0500
X-MC-Unique: 11My_ayZNWyY5HkLBQzF0A-1
Received: by mail-wr1-f71.google.com with SMTP id u29so2993591wru.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EevDkj3Eq5HGyjrzEGnkPKUnTQ5NdW9RJ/mZwCBu75Y=;
 b=MR/vGh4VywWFL7fJccLusp7fmNVkpJwOLxQHp80vF4B2oVUmSt0NbcMTiB+j8Tnb68
 xiYimOicFogJLGiv/efGxx5XBJmYiqkg6gDUCvepQfn2xrEojZjiWVsrKMc0Iai0s+Jg
 QlAu450t0CS8RlGgDbwslLxpHdn9BfdjjQXQxmWOyQzvZv5PYxSp/0ME8eYFVMg/M/0u
 Z+c27mOqH5mFu4rOxewc0dHcW+e6r7hWBXUkCtk0Rk2oYXYK6HpN42snsZN0LLvnYGxm
 +X5zGjq/VTRVvIEj6ooWJIIstxM8+fnzg7XG3YaU2oWeZ5nR3rLBZ7epwPKg3KRHH5Qw
 08qg==
X-Gm-Message-State: AOAM532S27nLscQqaWp47/F3c2BrvsJ4DIJrIlO4Tw70JGrjo52W1VjJ
 fLQ7lqroDjaWN8yCMgz+BABrSqo6bJ+w4ZmAi118ltgU7U3AG556VED877p+Wog8GrQRLwB1f5m
 o41xDiHoAc5N99x4=
X-Received: by 2002:a05:600c:2158:: with SMTP id
 v24mr8820027wml.129.1610043243058; 
 Thu, 07 Jan 2021 10:14:03 -0800 (PST)
X-Received: by 2002:a05:600c:2158:: with SMTP id
 v24mr8820009wml.129.1610043242830; 
 Thu, 07 Jan 2021 10:14:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j10sm9513535wmj.7.2021.01.07.10.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 10:14:01 -0800 (PST)
Subject: Re: [PATCH v2] Docs/RCU: Correct sample code of qatomic_rcu_set
To: Keqian Zhu <zhukeqian1@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210106071710.15836-1-zhukeqian1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1fc6cbdb-8ae1-efa9-d294-f8412a77c6ce@redhat.com>
Date: Thu, 7 Jan 2021 19:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210106071710.15836-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJdsS/3OBXzb

On 06/01/21 08:17, Keqian Zhu wrote:
> Correct sample code to avoid confusing readers.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Cc: qemu-trivial@nongnu.org
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
> 
> v2:
>   - Add Cc and R-b.
> 
> ---
>   docs/devel/rcu.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
> index cdf002edd8..2e6cc607a1 100644
> --- a/docs/devel/rcu.txt
> +++ b/docs/devel/rcu.txt
> @@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
>   
>               /* Removal phase.  */
>               old_array = global_array;
> -            qatomic_rcu_set(&new_array->data, new_array);
> +            qatomic_rcu_set(&global_array, new_array);
>               synchronize_rcu();
>   
>               /* Reclamation phase.  */
> 

Queued, thanks.

Paolo

