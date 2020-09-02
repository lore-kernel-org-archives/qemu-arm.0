Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp578655lfc;
        Wed, 2 Sep 2020 07:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpTOUx/pe0za7M0u4qnmVFcPwFlMrWkgdEBJSOJlqY2jXseT8+j1712X6/zSXCtZdNFFRx
X-Received: by 2002:a25:bad1:: with SMTP id a17mr11414945ybk.387.1599056722566;
        Wed, 02 Sep 2020 07:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599056722; cv=none;
        d=google.com; s=arc-20160816;
        b=CDZeHC3OGpxnqbAbsyiYid44fo2fD9KB7qanVGnrsJHylkFd9KV5FDiUCM3eNlspwa
         RIzwF+ksWjX6BgJC3lQnket0MSdZI1hBFeeoUVZaBU1hLLbXiwiufr7cCXjj4rbJCbBV
         z2TdEgAVZxsL0JT73YZLifF70x8j0L6DyEe373VYuluZTTQRYWQQ3mARmdcIr1BfwMD+
         K5DeyxNoc6d3yZlAI9W4RgzSz+DkHRU5eBOQSTDyYpBs+Q41GnLrQ8sktHJS+3earZ6N
         yNudMCGlKJWKfGQLmjgtwGcz5pkJzmuWGueRKWxt+S+NB4MTA69BQCcFuV16iBU5I8Qd
         z1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=srPJxBQvic1I9KpO2J4WOMdwUY/cW/rd9HKCOJ/i41s=;
        b=cL9aIVrZt9GtgJtEI1k7jidERPbZkB5vz4sPdFbYVp9vRG21d8kGLV1FNu5VI3RrFk
         Fulb6vk8HOjUQ5BchfBylxNey6AO/rbO8Di3JQvxSUTu0KVhhmVPKdy/PnLnTxlNLxPz
         oKYs53fG6s1YaUG9UaL3ctwm4B78sh2ofmU7xhbMew1BnT0vcxLIgJ4fvsZxQ0UtIbIY
         1icy6SyK0/gJkXaSTuKy0ziTqDV2m13VEdSEgpZ/7CkxPAPR74qTn6FX77+Oz6ObZtfz
         UOyuK0IJbG3qujAxM1G1g0KNhRey+iOkmX4BWe19QokoCd0W92hC8XNg2TOIV/vxc/1Y
         ZfNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IqNb1A2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si4346578ybe.220.2020.09.02.07.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 07:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IqNb1A2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDThR-0007DX-V8
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 10:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kDThJ-0007D5-KI
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 10:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kDThH-00016I-Aj
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 10:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599056709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srPJxBQvic1I9KpO2J4WOMdwUY/cW/rd9HKCOJ/i41s=;
 b=IqNb1A2R6cpGnPzuFogvKmDaKjgHRR2AL5O19HlUljlIjgjVR7gSH7Bp7fkWlLrm1UA4GI
 RiKFHObnWee6TLgJdyywUfGgm3/p/nh9ZDIlbGLT+7U9vo0j2FrFA4Xoi9INtHpmSb4s0b
 j53bfSc5uM6/xnbNt8TiLk4Meu02SPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-oC0BXBgJOaizbZ3iHDNtqQ-1; Wed, 02 Sep 2020 10:25:08 -0400
X-MC-Unique: oC0BXBgJOaizbZ3iHDNtqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1EA801AE6;
 Wed,  2 Sep 2020 14:25:05 +0000 (UTC)
Received: from [10.36.112.51] (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C26E19C59;
 Wed,  2 Sep 2020 14:24:52 +0000 (UTC)
Subject: Re: [RFC v8 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-6-eperezma@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <44d9e8a5-79fa-11c8-9ec1-4c3d76929408@redhat.com>
Date: Wed, 2 Sep 2020 16:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200901142608.24481-6-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xduY7d1D/lYX

Hi Eugenio,

On 9/1/20 4:26 PM, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Please could you explain in the commit message why you need to remove
the assert()? I know you described the assert() in the cover letter but
the commit msg is the one that remains.
> ---
>  softmmu/memory.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 09b3443eac..3ee99b4dc0 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1895,6 +1895,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>  {
>      IOMMUTLBEntry *entry = &event->entry;
>      hwaddr entry_end = entry->iova + entry->addr_mask;
> +    IOMMUTLBEntry tmp = *entry;
>  
>      /*
>       * Skip the notification if the notification does not overlap
> @@ -1904,10 +1905,18 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>          return;
>      }
>  
> -    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> +    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB) {
> +        /* Crop (iova, addr_mask) to range */
> +        tmp.iova = MAX(tmp.iova, notifier->start);
> +        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
> +        /* Confirm no underflow */
> +        assert(MIN(entry_end, notifier->end) >= tmp.iova);
> +    } else {
> +        assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> +    }
>  
>      if (event->type & notifier->notifier_flags) {
> -        notifier->notify(notifier, entry);
> +        notifier->notify(notifier, &tmp);
>      }
>  }
>  
> 
Thanks

Eric

