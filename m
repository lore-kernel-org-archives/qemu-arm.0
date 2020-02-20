Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp551414lfg;
        Thu, 20 Feb 2020 05:13:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/40/LfYWddhf/VpL9vuxfYHwQV92oYZ5r39S0M6wXTwxJPxL31yW0oKAxArlWHDn6fvJ9
X-Received: by 2002:a05:6830:128e:: with SMTP id z14mr18176625otp.184.1582204404525;
        Thu, 20 Feb 2020 05:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582204404; cv=none;
        d=google.com; s=arc-20160816;
        b=d5j97rvh7x/CrcnuyJ40IxI6uUHMp2zc9ia3IJvgktOqRrzkOcDa6O53CJlXoN1IvF
         PyeGFBZAXmcCXxKhlVcUrzXll+hwiXNCW9NXpnpq5ufpogJC9z5hARb5iv24lljPc0h/
         /e39fXHQT9Dd95rw3vMgJSIL7ib0drTnl2gVy9iRXQDpv9ocEuqNLnn1tqYNF/EUyzsD
         gBYnyy3x8pdux2C1qXMT5MHnxB06CfBvpwSaau8Zn6YKrTuvrwK6EAMJNkRHTl8vg8Ge
         kbjeMF4NIYBnAh2c495v4OvU19TZknk8GP4feOxSBkhilOfAaE4MZNVnJ0K0+xIhhf0u
         OklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:cc:to:subject
         :dkim-signature;
        bh=CxRd66hXArnDbqmniqlydJMWajYnS/NgIxGrt3Sj5ig=;
        b=XteMbmmi7rbrc9ZkXRuVdbwaB1EIsKL8qX7+cEDV2TUnfjQVaaVvC/pgQz9wRkAQ/Y
         jRLoN9R5gFJaZfyWxb1R4zSxJUZf3sexpLI3TttpEGg70EgIF5/ed2aE2truYs88N5t0
         q4ZU3tYCiNQfg+yVDhpYt/LTdjxo4jmVTg7sd8D3LBux/TfKVVr1VcKiGLOmqoX+InE9
         nsFb3eLGR9kgVLgGFImIZTdgx8u1Uvjb9M601lKoNOsW0WlVwSUiImr4aI5LGpSRnf8L
         DixPpH15zGQAKyQt6hzVwZ+sJTOVnJz8xc1j+akbF9hwA0c7GY87tp2SWAWjI+lsCgpG
         sVXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hh+JWc92;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f23si1661119oto.205.2020.02.20.05.13.24;
        Thu, 20 Feb 2020 05:13:24 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hh+JWc92;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgBTNNV (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 20 Feb 2020 08:13:21 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49313 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727088AbgBTNNV (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 20 Feb 2020 08:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582204400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CxRd66hXArnDbqmniqlydJMWajYnS/NgIxGrt3Sj5ig=;
        b=Hh+JWc92QUzPA+Qp4ks+X97+KXSWHP83TvpRL4a6qRVj2teF5XmWrS98Pn3crqtthi1q10
        hRQGZHsfq3dV4Qp92Uz/PtPUw4/vzlxBfKgcExyK/tt4xyY7qXBWciA6Sa6cli/bhKGjO4
        GIPT67V5UIiGGBcfaMDXx5mPaOYt7KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-AEN5JunrODynT6AfB31ueA-1; Thu, 20 Feb 2020 08:13:12 -0500
X-MC-Unique: AEN5JunrODynT6AfB31ueA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D02CDBA5;
        Thu, 20 Feb 2020 13:13:08 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F2C61001B2C;
        Thu, 20 Feb 2020 13:12:54 +0000 (UTC)
Subject: Re: [PATCH v3 01/20] scripts/git.orderfile: Display Cocci scripts
 before code modifications
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc:     Fam Zheng <fam@euphon.net>,
        Dmitry Fleytman <dmitry.fleytman@gmail.com>,
        kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
        David Hildenbrand <david@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        xen-devel@lists.xenproject.org,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        Richard Henderson <rth@twiddle.net>,
        Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Alistair Francis <alistair@alistair23.me>,
        Richard Henderson <richard.henderson@linaro.org>,
        Paul Durrant <paul@xen.org>,
        Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org,
        qemu-arm@nongnu.org,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        John Snow <jsnow@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Igor Mitsyanko <i.mitsyanko@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-2-philmd@redhat.com>
From:   Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6100c5a0-b6a7-4c8c-4284-6387de26690c@redhat.com>
Date:   Thu, 20 Feb 2020 07:12:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220130548.29974-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8CSC7aCKNl+p

On 2/20/20 7:05 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> When we use a Coccinelle semantic script to do automatic
> code modifications, it makes sense to look at the semantic
> patch first.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   scripts/git.orderfile | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 1f747b583a..7cf22e0bf5 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -22,6 +22,9 @@ Makefile*
>   qapi/*.json
>   qga/*.json
>  =20
> +# semantic patches
> +*.cocci
> +
>   # headers
>   *.h
>  =20
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
