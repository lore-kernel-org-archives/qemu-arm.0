Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp872108lfc;
        Wed, 26 Aug 2020 08:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAw1Ud4PXDvL/wU9CKVviFVi/UY4CjQy8wwvN71sJnhTMqn13qVlPR4DuSanuM6nW/lfPG
X-Received: by 2002:a25:7509:: with SMTP id q9mr20750587ybc.317.1598457040693;
        Wed, 26 Aug 2020 08:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598457040; cv=none;
        d=google.com; s=arc-20160816;
        b=RAuuB+gmrjSwNhywaWQS2NsgEK3IjhJS+EUr0PjdmP5h9L9N6wUMe/PNItuxmO1Ksn
         8KFepnO11to1JsYYGMklUM7yWNV1jjCEk53hYnquYFbBDJBOLv5JXvrpfpgGxxrQlzag
         mbDiHTHegzqt5thZdypj6o0VpyqwO+b3Fk/gD6xrr2R/8Y10q7CXttVJVKZ3BXDc2IPU
         08oW3H0SdmpDE8DX3hLBVv4FBlMYWh9QeBMO2cNdK03KlZg62aZTSUnZoMJvFb3x/PJW
         luM2mcakipLpjLr3MQDe4dGEGDPxy7xHsxkFMS3+jK6TRHTuklBFF4bwPTM8JZMRmoLz
         rZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=x1g0Fo+q2+qxb9tVugJhPh6JiZquv/69NfiCPRwMqjM=;
        b=hd57uGyDXL0V5jWXYGndNmq+rs/EjXK0qkeOfzxzxHyY7oO+WruZN68UcrX88dPoRy
         E01miNmrgqNm7uIiR/jukVvRlUdzVXL3sedyQZI17pH/E5RxUGpCuZHgTQ8NZ2IgF10e
         IZdTIdVDxQsBnCeKpLkJZ+IfP0b9YcKGVlwzL9M4Kj3QiFqtZJHELc/4DtWVqJJ7xmSg
         DOo1GeCyF8Z8sKynpSbhEz4zS7hX5f9JqZqFZ274NPAijH7kIW/T+T2Sd4fiOE9jeo4e
         NnF+jGtQ4VFsJpgroSps22FnYnPRokIKNTQ/n9jEtdtFiauFQvMksayI1SQtZxcjSiU9
         MnqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ed1PTkNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o197si422258yba.199.2020.08.26.08.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 08:50:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ed1PTkNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAxhA-0005qu-25
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 11:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAxgv-0005pI-Q4
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 11:50:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49897
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAxgr-0001B2-8O
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 11:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598457015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1g0Fo+q2+qxb9tVugJhPh6JiZquv/69NfiCPRwMqjM=;
 b=Ed1PTkNmZQKblWH5JW9b9rW8nXy/s3eCFq8uDawedWWTLDKCvYtx38ZDXDaCkVJDGvKSmG
 na3sVbJA2RF1L4lfPKJ8zK8QM2hDm6dGZ5MabBMCU1np+U2r1j7PyJKqGJEPyFY3c0EytZ
 QH+JtxikF36/5nn+Lnv9qzHqu9oNAi4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-kn_i_3rZMm-5RhT4ffAMNg-1; Wed, 26 Aug 2020 11:50:12 -0400
X-MC-Unique: kn_i_3rZMm-5RhT4ffAMNg-1
Received: by mail-qt1-f199.google.com with SMTP id k1so2029198qtp.20
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 08:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x1g0Fo+q2+qxb9tVugJhPh6JiZquv/69NfiCPRwMqjM=;
 b=kmDRh/bt6iaqR31bJww1IOiEIxPUrMFCEEYV8esfWZuyE3wpme7kjmNo03ZnRxnLw/
 Bg4+TbU7KIFpVOk+wPCha7rElnIIrmHRhyKQxL60nPGJjoIlxKt658jgyASlXwXOVCbe
 ud3QX4/jlJkGROGA/xe0ewhfq2Cx21URra3ZohrgHRkp4pEGxvcNG6GGW6G6mh74S0Vv
 ZFLEvmsLvxRBLHrKQlwSBFVhHfjgWvNXQM6hO28/AdZ9/wmcdvuYiRqla5HDTYq9mfGB
 vbZPXJyByA11RKYmYGhC31M7pOp7r0XW7JLMt22M81+bFK9hcYqs+39ozoRvAYl5J48o
 OA1Q==
X-Gm-Message-State: AOAM530QivTqkzpfC4ghQ/9GVAnwHCw1y4lGB2zqYO7ht/CMrydUMhaH
 WkBZhSIbAccSuZYa4RXpKQCuVER7uMT2J1vKRrB2d3xODDUOeSFSz4W8264nsZ7Sdembf3Qhhms
 vEu4P7k2fKRCu
X-Received: by 2002:a05:6214:1910:: with SMTP id
 er16mr14302348qvb.228.1598457012446; 
 Wed, 26 Aug 2020 08:50:12 -0700 (PDT)
X-Received: by 2002:a05:6214:1910:: with SMTP id
 er16mr14302330qvb.228.1598457012234; 
 Wed, 26 Aug 2020 08:50:12 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id j4sm1925068qkd.129.2020.08.26.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 08:50:11 -0700 (PDT)
Date: Wed, 26 Aug 2020 11:50:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v6 03/13] hw/alpha/typhoon: Mark all IOMMUTLBEntry as
 IOMMU_IOTLB_NONE type
Message-ID: <20200826155010.GF8235@xz-x1>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
 <20200826143651.7915-4-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200826143651.7915-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +lApgeH9Tv6/

On Wed, Aug 26, 2020 at 04:36:41PM +0200, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  hw/alpha/typhoon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index 29d44dfb06..b1e6c4e929 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -615,6 +615,7 @@ static bool make_iommu_tlbe(hwaddr taddr, hwaddr mask, IOMMUTLBEntry *ret)
>          .translated_addr = taddr,
>          .addr_mask = mask,
>          .perm = IOMMU_RW,
> +        .type = IOMMU_IOTLB_NONE,

IMHO we don't need to touch all the IOMMUTLBEntry users, but only the callers
of memory_region_notify_iommu*().  We should also comment at the type field
that it's meaningless except when used for IOMMU notifications, because these
are really two different things: IOMMUTLBEntry was originally a translated
entry out of IOMMU hardware, so in those case it does not need a "type" field.

To make it clearer (depending on your preference...), we can introduce
IOMMUTLBEvent to be:

  struct IOMMUTLBEvent {
    IOMMUTLBEntry entry;
    IOMMUTLBType type;
  };

Then it'll be clear on which is which.  Though you'll need to touch more things
(all the callers and all the registerered notifiers).

Thanks,

-- 
Peter Xu

