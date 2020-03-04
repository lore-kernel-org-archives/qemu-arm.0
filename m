Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1630836lfi;
        Wed, 4 Mar 2020 05:44:52 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvIj3KrNGv8tvoFQtSYtlnMD3yQRDb9IYS6qtpsmN11ZMf/x51w8JMG5nSfLsosoOtWkz02
X-Received: by 2002:a37:b984:: with SMTP id j126mr2807405qkf.3.1583329492726;
        Wed, 04 Mar 2020 05:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583329492; cv=none;
        d=google.com; s=arc-20160816;
        b=bcr0hlLHAl3s1Eq3VQZy8AROXHUdcmRO+UcSDlKUFV6PLhTlpY8+P9SdLg92BHcIkL
         ye0qgCylHYqzFK0t5WA2QK+SYV+ElVl31DuEcFAZojZeB8y06Fr0RNlikALj9kXapwQa
         DdHA2myO/sFluu5CSiDMR25WDedQ7CtAkgeb4JLC0P1JMXWJE4uLhjxq+sPqIpFeZHe+
         LwCB09yCSfvCD2Qa2yl3SYHY+uhAIB5slUVVcofyKRmN5GjlhQdn+Eb4DVAtIyRjRkfK
         /Fnh+e/kURJyQNK9jwCGHpgW/Ee5gx6zhv6xJhCDcGXkjDslChIIHUz4LLW7Tfm/wCH7
         XlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=l1KhDTV6bVBYBYHnWDxWWNOY+j5WAiV2buvrkHO4Q18=;
        b=zuReeAiMAXeQLG4bYpRoJNxMwgI2+JdtGOwgSzJR5gdLouq0UH3+I6krKGn0AtKSwZ
         9pFDwaSxxAXkapT8gDn/yhXFY13iBU6vNK7eB5jS+odoiJrQlIiUg3eB1+m/qCqGZdzI
         1aPy8U4ego69s1H3j849/1AoxW7ub+ELDLYvdrQNTFmqLcS26st2MxgTauTlp/iNMS9Z
         DLfKcnNCEmeAFwKNHvKAYuoxl0wPPg8A/a8xX+bNmITH8M8jeEbiZecZC0X0wluAC5Gr
         d4x/rxU980faDO4LjAakC+eYzlEC7tDcb7h19B3ClmjLRJ6gtou4/vi7VCfPud+G3uow
         8Ylw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HJgFkhGI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si944307qvo.86.2020.03.04.05.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 05:44:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HJgFkhGI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9UKS-0004Gn-67
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 08:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j9UKF-0004D5-DK
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 08:44:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j9UKE-00020l-Gg
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 08:44:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51549
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j9UKE-0001yB-Dd
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 08:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583329477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1KhDTV6bVBYBYHnWDxWWNOY+j5WAiV2buvrkHO4Q18=;
 b=HJgFkhGIA5UNCzAXOTqieyydn8Fj2xhUSE71aJ7dOmoWE0WXpiuB5QXmMzkybV0IQVcJRA
 +TPYinMOPWsUynWr8QSpE5tUrIBRmTEelybLr9uRBx5cJH6mBCCClkB/Pox93Myhn0aOyY
 RqjEOUuMzfzBdumoNUQelQQ6p+TzDSw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-iEKa51XHOoG-E_Y_zfKmLg-1; Wed, 04 Mar 2020 08:44:33 -0500
X-MC-Unique: iEKa51XHOoG-E_Y_zfKmLg-1
Received: by mail-wr1-f72.google.com with SMTP id w11so857667wrp.20
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2020 05:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwtpJISE4+PKDpLucCLSKmtD6ahPfpNV5KVXN5QcR7Q=;
 b=lzFI9ums2IfQToM0XKUBRoX11/4PJM//B4MdYRdyNhfeaawQAsobnIfwReA69pJPKZ
 xVeP360W4Mc3d1E8I1GotBp8BmzGEc27M2hlqu8MullazH2u4PIWPHJ8bUKBtJS/hSnV
 3GIZHtN8YUtKXY8Ruf7H6gFsFmkTnDgICskdzptDT9MhGUzPGu3hyu7dc4OGaJmKJm7K
 KMiArAHSkw6WN/IKhvg03j4Cbb8LZWGxyDaDcnZkyx2laeok9cuCZpN7GIFzXLbHNsnz
 cfE+6/GXLPQANAFevzvU+DQv07adABneTefJvU/E0qNjyrm8/QbhfY/zoPqvY1iSTUx6
 aLkQ==
X-Gm-Message-State: ANhLgQ1X2p/3vRxgRFfsUy3wkCC8AtmuaGRXNMMSt2utlMXjCuXPVTqC
 7N8Ll/44Fdzaw8QlddflSsDg7HMsO05FCOpIkKKZ9uAI+9n267UHZ7r0T9WLITd9SDjCnXqFTjt
 C6yLRiD72N5DX
X-Received: by 2002:a5d:6891:: with SMTP id h17mr4104445wru.259.1583329472404; 
 Wed, 04 Mar 2020 05:44:32 -0800 (PST)
X-Received: by 2002:a5d:6891:: with SMTP id h17mr4104420wru.259.1583329472179; 
 Wed, 04 Mar 2020 05:44:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id h20sm18051714wrc.47.2020.03.04.05.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:44:31 -0800 (PST)
Subject: Re: [PATCH 1/2] misc: Replace zero-length arrays with flexible array
 member (automatic)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200304005105.27454-1-philmd@redhat.com>
 <20200304005105.27454-2-philmd@redhat.com>
 <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <38b55649-b1cd-8891-5c13-ec4c6ef3ae5e@redhat.com>
Date: Wed, 4 Mar 2020 14:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1e1a1491-15ca-29d4-8bd6-1bf14edb4ad5@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5eo27C8CySiR

On 04/03/20 14:12, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
> hw/scsi/spapr_vscsi.c:69:29: error: field 'iu' with variable sized type
> 'union viosrp_iu' not at the end of a struct or class is a GNU extension
> [-Werror,-Wgnu-variable-sized-type-not-at-end]
> =C2=A0=C2=A0=C2=A0 union viosrp_iu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 iu;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^
>=20
> Yay we found a bug! Thanks Gustavo :)
>=20
> union srp_iu {
> =C2=A0=C2=A0=C2=A0 struct srp_login_req login_req;
> =C2=A0=C2=A0=C2=A0 struct srp_login_rsp login_rsp;
> =C2=A0=C2=A0=C2=A0 struct srp_login_rej login_rej;
> =C2=A0=C2=A0=C2=A0 struct srp_i_logout i_logout;
> =C2=A0=C2=A0=C2=A0 struct srp_t_logout t_logout;
> =C2=A0=C2=A0=C2=A0 struct srp_tsk_mgmt tsk_mgmt;
> =C2=A0=C2=A0=C2=A0 struct srp_cmd cmd;
> =C2=A0=C2=A0=C2=A0 struct srp_rsp rsp;
> =C2=A0=C2=A0=C2=A0 uint8_t reserved[SRP_MAX_IU_LEN];
> };

It's variable-sized but it's okay as long as the total size doesn't
exceed SRP_MAX_IU_LEN.  So it's not a bug, but I agree it's a time bomb.
 Moving the field last should work, but it would still be quite
dangerous code.

Paolo

