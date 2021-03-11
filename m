Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp282015lfg;
        Thu, 11 Mar 2021 05:22:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5LanCEY8PHCmCiJKufjlIiBIppuRBY9TwwEUV43VCpPY9B9qk7fFUNDsL0Emo1FDGO03/
X-Received: by 2002:a92:b08:: with SMTP id b8mr6860519ilf.13.1615468975609;
        Thu, 11 Mar 2021 05:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615468975; cv=none;
        d=google.com; s=arc-20160816;
        b=Cf3Wop2PX8a9p70/RF0NwyqpCARBYaQJRPzGQNCblya61d/ukBfricwCSaNo+1/PcU
         +rXQHOmDd11ZeRpPgBZTSRUb3F78E9pw8qV7RV/PfNbPT4evApzGU/ihBEklrC2YSCE7
         bJfpNxUNmPcNHTJukywJYIffdpvLUYo0fvhsWJr/o0iSK1lj0DtSCCmj+sMDoPAx09Ey
         ccAyq14FLMue7PuvprWK2ulUu59hsDX2vdIZx+slwiBZ2EaS9gpBH+nyclbHQEKrTKDS
         5ddlbj5/cjawBE3RCHrCqW3VKY06vKWm5JyKbKZ+AgefUKJNVCLtSLTXmFlFFPL9JW9S
         UV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g2qf1auwqgFAwhWsO5uoVF1AymNgQO/Vvu396aZ6C5o=;
        b=gfQ1pYHQEqblERKN0qSKCWwyAbm+aTT7obbvQFYYs+M4wQnT1bLrV9ttTvdvE9SFWO
         +AKmz6ljb9GPWmyZSnGvawnqClONUV22GKlOkem0wzt2fRynQvfJv3mdaLRQCey/DUTq
         5YNP4ACquhfFXyz3RWsTgL/cTaEyQzQPANjn6XB+byQqPAB+DmI2hI54/0vKzkhTqAaZ
         Sq8kQJPUtqmqzcIZA9lcyRvdRnjk/gwlyH02xSLiF6yd0LnSBfd9qJyfV4qosMmKz/jR
         8deA+q2aGYM8XfldUzkHFJkxRy4t1xUjA30yIJvNLtJBlQyRcmD3ZHpQjDUO3i/iNwyV
         Yu3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B7Qf/OMO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si2700581ilm.72.2021.03.11.05.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 05:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B7Qf/OMO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKLHC-0002qk-Un
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 08:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLH4-0002pX-V8
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 08:22:46 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLH3-0002Ec-Ku
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 08:22:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jt13so46251816ejb.0
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 05:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2qf1auwqgFAwhWsO5uoVF1AymNgQO/Vvu396aZ6C5o=;
 b=B7Qf/OMOxKxsUZuBx67RCbGUJVauPVRNE1NWxV8qP1iqHyuDppnHErkCJZaOX1nE5k
 PnqdoKmwuUgxA3HWuU++QpcqEG28dqOIpoCPopKRDE7Ozc6jn6ez8MAkPGZChf6dlf1R
 YYCPUrhAbxeNoLq0sqjaOoUHMZmx8Xfk7tEqq6dYLjdKG2p47AoLnasHmeno/PeUSsHm
 Xp26I1vaP5JHIg1dpJxy6u6mMHM0aSHtts89Gib/BGkoD11xSPgOEt4j8x9rd30lf16Z
 3lpxshiKAbh6Op854l61ybjQu9ogkfENlOjrfiwl/UmKTaUWcQxJbIHVsdFLriK1TUpc
 Z8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2qf1auwqgFAwhWsO5uoVF1AymNgQO/Vvu396aZ6C5o=;
 b=ErzbJ1CSuETmS93si6BMkj044m6ROA1Hi8bvJ3k7aEym8U/N8XyxUDamiaxsjWEe8I
 BEAAs7UDFdpDWDCVyxTbOkjzNMKWbZSjOklrwMgGZY3U+GnQCcXe9UaBhy2C87KHJDVl
 IL4UMvFQ3QrfEgGJ0lefxjBBpAtWVl5XhNdsm0toP0/CVLaUrizlrtzxRFhdDrubgPEI
 Pewsm5hfACpkPES79LMLXlAvR5MnIUm/50SPPrEKDiIz5aQxNLstLdCptmWhvjwOcPZw
 PYkW2dijoYwhmX5jub+odtk3fqV1pYiennd3wtURSXtslchKEv5uvf7LHYGoTC9hjzay
 GKYQ==
X-Gm-Message-State: AOAM531GUpwhVG9wRdUho1W2qRFDV/bwgFknyPPm+VyrawlFUxnYiY5s
 7614fJdr/IYBD2m2AVkSUsSttcPQWFU5YUP+KOxMyQ==
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr3005666ejz.382.1615468963868; 
 Thu, 11 Mar 2021 05:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20210309102742.30442-1-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:22:25 +0000
Message-ID: <CAFEAcA-jKEGi_EUo2OH1uJWz7cAGP=uyfMjcOAAiB6XWaPEkrg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Some vIOMMU fixes
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 vivek.gautam@arm.com, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UOdxWSOIoLO

On Tue, 9 Mar 2021 at 10:28, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi,
>
> Here is a set of vIOMMU fixes:
>
> SMMUv3:
> - top SID computation overflow when handling SMMU_CMD_CFGI_ALL
> - internal IOTLB handling (changes related to range invalidation)
>   - smmu_iotlb_inv_iova with asid = -1
>   - non power of 2 invalidation range handling.
>
> VIRTIO-IOMMU:
>   - non power of 2 invalidation range handling.




Applied to target-arm.next, thanks.

-- PMM
