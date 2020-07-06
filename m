Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp179918lfm;
        Mon, 6 Jul 2020 10:27:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOvwTpxNsl5Jlasjg+y5gh5amnybqBiXAwiHKc9ALfK+wkUf4CDvaN+f/641iDLR95ZDSV
X-Received: by 2002:a25:ba4f:: with SMTP id z15mr81500150ybj.113.1594056465897;
        Mon, 06 Jul 2020 10:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056465; cv=none;
        d=google.com; s=arc-20160816;
        b=E+gNYleXHyVDcxGe9ycPkT48RSmOKCwlAV10mQ7nertV7Qvi0IzhEN51DdQ1UCNTNr
         gNFidQXTfJTYUtZ3Orhu7OHmgOyarRfI3SElPeg3/xTGmWd2cWxKDCLVKAUKdfQbhxPO
         X2lE3n65woIqmhbjf+YaCBCzBjwZp9pjf9OnS/51ihgJng5m5vVtNt5TusDvJZkWhz8/
         qMo6AlFQDfaLnRcNc9FJwbj5abj3vbVlTvT3JjdfQBRrEa1ykvTcITNiqHSin3FYE0BE
         3RUF4OGYBjJW74+zouPxHY9JfKKP9PfORsVjsW5rsofULNTFBaxHrUouZ952Dnp9SWTU
         oUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=I5JjQbgCMKS5xyrH3z1UciVv7RD/RqVMcfSKLyhaHRk=;
        b=yj/sPXyWUutPHw4gw6ersNwfE7LTn1pDNM8IZcDVEp+QwGIvx6f56dzzdNZGt2uNLz
         X+qND6eCmittYEQ6YGBI/bBDaRKVhaY00u4964CpIyhFKfcD9CBSXEyKy6as8PM6bOen
         plc3SQrWguFL0X5V7T26j4bz6B+9bdsbw1tMTbBnNfabaMFM5ZlJ3C8UnHuLwGiQ15fu
         n9K3jMTGRXJh11SPngcbgqO+mETRFUkp2rHIA5lo7pdmpVN6Pw0S6IHii2MqvOyUGsrB
         RLFcx5JO3K9JaiLpmSSOWDvgo9osTKeo6z/rjgA6Sjv+qqIQ/3gSQgYCvB7aGAVx7WTG
         kMiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GBL1Hwur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si20446180ybn.213.2020.07.06.10.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GBL1Hwur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUu9-0002Ko-B5
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jsUtp-0002J9-LZ
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 13:27:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36202
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jsUtm-00037Z-TE
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 13:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594056441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5JjQbgCMKS5xyrH3z1UciVv7RD/RqVMcfSKLyhaHRk=;
 b=GBL1HwurKiGqqsdpXNYS1rM4kl7AR9xWRRVP98umySCM0ySSlCE5rjmh1MAOBLWcjbuXW4
 8iFCA2BcQF1N1SRfyFQDQ2Zzrx6eDJzLjMMHOi4Pf2VzQurmYXI3S13fwpwVgd8zvEmSux
 dFc5BvLz6zHYtVVWA4fjQ7Wg97Hx15Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-ZNrF2AfdPgqBWySsdRNgGA-1; Mon, 06 Jul 2020 13:27:10 -0400
X-MC-Unique: ZNrF2AfdPgqBWySsdRNgGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD8B107ACCA;
 Mon,  6 Jul 2020 17:27:09 +0000 (UTC)
Received: from [10.3.113.97] (ovpn-113-97.phx2.redhat.com [10.3.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA9C60BF3;
 Mon,  6 Jul 2020 17:27:05 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] hw/sd/ssi-sd: Deprecate the SPI to SD card
 'adapter'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200705220731.28101-1-f4bug@amsat.org>
 <20200705220731.28101-2-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <40cf7701-93cb-cd99-9b07-c2847e8d411e@redhat.com>
Date: Mon, 6 Jul 2020 12:27:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200705220731.28101-2-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:59:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 libvir-list@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KgiECqoeQBTJ

On 7/5/20 5:07 PM, Philippe Mathieu-Daudé wrote:
> This device duplicate the SPI mode of the sd-card device. The

duplicates

> SPI protocol is better handler in the sd-card, however as the
> TYPE_SSI_SLAVE is not an interface, the sd-card can not implement
> it easily to be pluggable on a SPI bus. Meanwhile the ssi-sd
> device acts as a bridge, but is bitroting. Deprecate it.

bitrotting

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   docs/system/deprecated.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 47f84be8e0..5e67d7f3e0 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -343,6 +343,11 @@ The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
>   The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
>   'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
>   
> +``ssi-sd`` (since 5.1)
> +'''''''''''''''''''''''''

Inconsistent line lengths

> +
> +The 'ssi-sd' (SSI to SD card adapter) device is deprecated.

What is the recommended replacement?  Or at least document if it is 
disappearing with no replacement.

> +
>   System emulator machines
>   ------------------------
>   
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

