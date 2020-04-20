Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3589082lfm;
        Mon, 20 Apr 2020 01:53:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypKv7VGbqxJmytGSOtbWgJbTfwuMDk+qo1r8PInmUNDIQnaPYNkSBjw6ViAnJVuzmkXWArSC
X-Received: by 2002:a37:9b0f:: with SMTP id d15mr14951743qke.62.1587372796857;
        Mon, 20 Apr 2020 01:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587372796; cv=none;
        d=google.com; s=arc-20160816;
        b=eLKUp1RVa69ROr//M08dG1BoHqQqGUrE8jDMVPtfNGvvUJwls4zJPblUuSHl9wSWZN
         jlwN9WzU9Eti4bTMYbnMic3sPJyyMbgGddIy77GukCj3qMEkjPxKxZoKU8JEc1+wj29Y
         RXiOB9cP7bnn7kMTvex/t4P2tlyLL10my0nC2pNUJJdVwn0jw8FQhc/CsaMX8cNsEOl1
         SLbjhFySr9DJae5QgisumhEQhKoi3Q9lsSqfnMQQdc9U9viRvvC/bME8blZKAi9fp0xx
         0VbtS4e0DfR74yy0Oxmj53A3WvLiGGS4M3noNhh9OOjI+enRS6VMQW+z6uiwugtOjXr/
         69Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WRYMxskgrGy9xF46PIL9RmnEf6OdNe/ln27iyBtZtmM=;
        b=uYp+mBxECRxyE8thRn3tw00LVKdYaSEOFj5jvooRTU+1olNL1Xg18wpmPgxuWFgRz2
         whPThUZpmjtCcucP3LSt0qFqn7EoV5x6nPAMD1l07QubJ9u3Uw3/Yz4PMS9CAEgmLA3/
         Ll92pIzQMhKRKTT1yYMbqJV8VOG1Weg3WeomkWB16/e1hOS5TG+/l/GPRuSz4SyMaTD8
         GR6vgu290Su0hrP6RIfTpC+MNd9flKYRShLS7KJgejHf55gdZzYX+lTE6dR5iTEDdi9J
         jdwkHpOmK9fXLSO0cyLuc42DYOcr+3YJPbFjyOyGwvGkI5wp3nTFYF75OuBKOhy9g+yK
         RSIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KyJlmeDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si44524qvt.104.2020.04.20.01.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 01:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KyJlmeDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQSB2-0002o3-8t
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 04:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60182 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQSAs-0002lY-Gb
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 04:53:08 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQSAr-0002k2-Rs
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 04:53:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51342
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQSAr-0002iH-AJ
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 04:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587372784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRYMxskgrGy9xF46PIL9RmnEf6OdNe/ln27iyBtZtmM=;
 b=KyJlmeDBMwaaDg1UAiGzNynOlABby2Lu2AhKDxAIjY1HIJV99TqZ0YPBw06Jgy5Y6CcsSN
 +BFwkel8oqOdfhtkNUF1gjVgpIOPeZh+fm7OujGZbn6m4/fzmSLvMAMbFaKbMXMLRooLAH
 nbGkaC8uWh6EZuY2I+4gtE1WIbHEvgI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-A29Ovk8iNuGFDaJpyNBJmA-1; Mon, 20 Apr 2020 04:53:02 -0400
X-MC-Unique: A29Ovk8iNuGFDaJpyNBJmA-1
Received: by mail-ed1-f72.google.com with SMTP id l14so1822966edw.6
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 01:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i0WKln2lNc8dlLBktTLskhKb+KYHB2XbrOEzH1I2Fus=;
 b=ccjMOCwC6GKHdtuEQW0KFey58GM4XHvhMMWRsnzez0xhkkx9GO4SeTtAdmH+W1F+O1
 lScQ3CbMPt7fWNQHo0a4hloHQgBFDV8DQXlr+Wf0P/RjrMz7xgxJ8YZFEgAJitg+/67U
 vinrDaIUieEIarzV4aL+wg+CgytL6ehdTK6y5L6cKUIMnKwMXdQrlTb9rX6w021gAnKt
 Shcmw1o9/T3eMQe2WrhFSfSyXZhRg9R1WgU8/GHtltsq5zy4ndEZgnPOUxt5E7glb+QZ
 UEbU/F3tt5iAghdwN4H7wJ7wtxHEk0l4AQ1zExIBweRxav8tMXmO7gzabvzm/P3FvqTy
 Zhig==
X-Gm-Message-State: AGi0PuYFFV/Cm6rWHV4IKFE0VNW8HDRNdOacFW5LgpdNWJZwDbFVeQRh
 lNJjJHPKYFZuaJIRWzH1SyWjhjrbfJ1axMOkPdmee8LG/vCi5fWbSVs1e5ThUAdQQdxmrI1qW6f
 tvOUOmNOgbiTn
X-Received: by 2002:a17:906:4ecb:: with SMTP id
 i11mr14426340ejv.79.1587372780737; 
 Mon, 20 Apr 2020 01:53:00 -0700 (PDT)
X-Received: by 2002:a17:906:4ecb:: with SMTP id
 i11mr14426325ejv.79.1587372780411; 
 Mon, 20 Apr 2020 01:53:00 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id r10sm20791edm.55.2020.04.20.01.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 01:52:59 -0700 (PDT)
Subject: Re: [PATCH 05/11] arm/virt: Fix virt_machine_device_plug_cb() error
 API violation
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200420083236.19309-1-armbru@redhat.com>
 <20200420083236.19309-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <094f72aa-c811-3840-cfd0-bef7eeaeffda@redhat.com>
Date: Mon, 20 Apr 2020 10:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200420083236.19309-6-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:29:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pP3KQy726jwV

On 4/20/20 10:32 AM, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
>=20
> virt_machine_device_plug_cb() passes @errp to
> cryptodev_builtin_sym_close_session() in a loop.  Harmless, because
> cryptodev_builtin_sym_close_session() can't actually fail.  Fix by
> dropping its Error ** parameter.
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   hw/arm/virt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7dc96abf72..cca5316256 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1186,7 +1186,7 @@ static void create_smmu(const VirtMachineState *vms=
,
>       g_free(node);
>   }
>  =20
> -static void create_virtio_iommu_dt_bindings(VirtMachineState *vms, Error=
 **errp)
> +static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
>   {
>       const char compat[] =3D "virtio,pci-iommu";
>       uint16_t bdf =3D vms->virtio_iommu_bdf;
> @@ -2118,7 +2118,7 @@ static void virt_machine_device_plug_cb(HotplugHand=
ler *hotplug_dev,
>  =20
>           vms->iommu =3D VIRT_IOMMU_VIRTIO;
>           vms->virtio_iommu_bdf =3D pci_get_bdf(pdev);
> -        create_virtio_iommu_dt_bindings(vms, errp);
> +        create_virtio_iommu_dt_bindings(vms);
>       }
>   }
>  =20
>=20

