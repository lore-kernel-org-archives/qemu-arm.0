Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp625240eje;
        Tue, 13 Feb 2024 23:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZqsMfdZcpskvm4mcJWloFDSPYfocHyv/Juy2rkihR3ijeyiyyOwuUZyJT+iSeySnkg3aiJl3nxtL1Dua+RXTLbVX5K96d
X-Google-Smtp-Source: AGHT+IHKBckEMKGdnPHbJYMnvlW3HTtM/1JV4IbMfrDEy0/FA9YtkUBpJpVW49pHgFAv3fpXsVjd
X-Received: by 2002:a05:620a:16c3:b0:787:15d8:2408 with SMTP id a3-20020a05620a16c300b0078715d82408mr1668330qkn.18.1707896871753;
        Tue, 13 Feb 2024 23:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707896871; cv=none;
        d=google.com; s=arc-20160816;
        b=vyqUNB6bGMAHFy6YIW3N/1RZ2j8kX1IyLQ9YSMagVO7jPvlQJD8hgO3oJsfPt3djq8
         IdZsFYob2WfiGMrnnjQ77fYH/orVGBb+szz4OjVfOvd5nsRP7eF8jcHm1bh3OUeVsBH4
         r/5yuekcQAcIQNlnpCwe08C8nhXqRs4xGoX/MdVcVzT+c4PtKi/b5wo3WBwMEwk/U5P+
         ieqUPeJfD7FzBvKxK7lQcaVs9GfHCca3Ek4fCmiEDu2JwAFSFL3qVygklYbNbPYlVbh3
         rR01ZIiwxzbUs8sZOgDr+W1U81QozgS8g6XwsA/rkgQIEQ2EhEtSak42gwvGOZEnjo8u
         ioYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xdyVNSK7ZWE2xsfvi/pHs1AiN9OdqAmcdspHZ47p9RY=;
        fh=MwxlWQAFeQv5GFP/SeU9wNkYXv1wW91Iswxum35zw2c=;
        b=AzNBgTETV+byXQJ8HgaD9yL3Q8thuMa+TTnfnBJWKtw8PWOL0FaGMtaTZh/MhwL4i/
         oQZM2hv2e6M0xUDjJQBc2Us4Ujc8P+NyvPzSEpBCaubyFVU6PWckZEAzPs9qnSoMfEpY
         N1gPHpDrjZQTk5j7VTheju7c/69zUdyy/FUL6jwjDhgtU4Iqzp2zJTjFRkw/DKXwIHqO
         PlZWnexuGiLRV4X/hDR8rBM/za8/7Q/yi8g+nm508qu0WXq58EVXz74oFyxRbB5wooKG
         qHkAUZzUbhdHrb/K5P3wuCjGlR5gWeBDojDkfuJcshx3146kInl8acfhr1NKapa203E7
         2Qag==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a7UHKKFV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCWN7bmHqvllVuIIg1BRDgbUOJl7MEOrjq0HGZroCKJDXRYQ4metDKwr6PpYaUS7+d5+sBkaB0B0Fl+CZas8UNXLw2Y+N9Rg
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl40-20020a05620a1aa800b007871fec8208si3199923qkb.477.2024.02.13.23.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 23:47:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a7UHKKFV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ra9zF-0007AR-NS; Wed, 14 Feb 2024 02:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ra9zE-0007AA-Fz
 for qemu-devel@nongnu.org; Wed, 14 Feb 2024 02:47:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ra9z8-00009G-8W
 for qemu-devel@nongnu.org; Wed, 14 Feb 2024 02:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707896832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdyVNSK7ZWE2xsfvi/pHs1AiN9OdqAmcdspHZ47p9RY=;
 b=a7UHKKFVaFXVRozSiOy0tajk6F5UkbJSg2gYVEy/ZD1XB60di1mni0QbD0exuFwzv9+8Rt
 JFAmI2YC67RRekQ8kaY1xTofoogQXB8+XbwSAuatR3MUBvexfUsupgSq7IJpH4PraWN+RO
 BHoRCObyG2yAhUs346PtELzVLti065g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-sLnt3f-FPnGWdnTEz1Ml9A-1; Wed, 14 Feb 2024 02:47:11 -0500
X-MC-Unique: sLnt3f-FPnGWdnTEz1Ml9A-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78718d0097aso94698985a.1
 for <qemu-devel@nongnu.org>; Tue, 13 Feb 2024 23:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707896830; x=1708501630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdyVNSK7ZWE2xsfvi/pHs1AiN9OdqAmcdspHZ47p9RY=;
 b=bUYW7fgt1pSrmngp8ptnPeB5mbIx9xHS0m3JairUuqsRMjqgMuiSS3/ZLwW4G4kzSK
 q1JCvIQTfdnH8SOJvAvauVRxZxfDJWmK7zjlLdsQ8IQ1qLMeaPla5O6zt27BhmS1AB+a
 09P0dDIw5zDxxsLl91pnipvMiy0E5L3ikPewL/S30ZlTlyhh4ifXmJ8EKuh1F7x2oPNd
 NW/H4LoCXTNJZiIqDR1Vx3+ySPLy/WbJ+B3Vl1VfS8O+4Ayw27kgByP4jwvOPyzqlIZp
 bkDclXdnWFT4d1/2bN5rBTWzWr2itEHQLXQ9JnqyxtO1obVWHv+kNYJ5ZKrIdd6GzLp3
 a8vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrGpmiXNiQtZWFyO4Jzayr9X7Iv54mYjZgnvYF8bXz4eTzQdJOP3dGj6NGVWUbH0OMp5jomPDwYXv9mxWpKx1N31c1ha0=
X-Gm-Message-State: AOJu0YyhyfildO72gG+eUhV2CsGn3PoBKcblHWiKfpsgbUfBZ1bCNoEP
 /S8I27tDomhysb3absku0bC5ade96MimLfbWXFIKkZ3vmrTbYj7kq5GUbeigVWVqlHJyYagSrLy
 reh96JdRHP2CN4p19kJj8xkR34izdUCIN/hj7emvVjptF/PuS0qMu
X-Received: by 2002:a05:6214:3bc3:b0:68c:d943:61ea with SMTP id
 ng3-20020a0562143bc300b0068cd94361eamr1970164qvb.17.1707896830563; 
 Tue, 13 Feb 2024 23:47:10 -0800 (PST)
X-Received: by 2002:a05:6214:3bc3:b0:68c:d943:61ea with SMTP id
 ng3-20020a0562143bc300b0068cd94361eamr1970146qvb.17.1707896830284; 
 Tue, 13 Feb 2024 23:47:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVI9llyCY4TS8qArdDR8+4NA/wv+4PHIMNXoR2g2JqpOgzSQalAbN0LO5y3K40za1TzL9+oOjAGUMRdOve/+FPCznYATj3Y8XatEBOj8tOYgrhBPxmaPMdCIvmxzhvin5NljZCNho9Ehsji3H2qhelczbNiUL/XFOOMxYqklgX8kkUNYCRbBXUaOSpbNunCvHjW3OMuoErMAXMaNK7DPr7CTZbqaK/uzNglFpXwn6RRXXE5ae3OIaMBazx4dD98HJEQQc/g3Qt2e/9FdiWgf8j0wxPpBtbL35SPmiYFFftZII2CWGPenV00U7OqOI6m7u7fdsESIzUL8nW73U4=
Received: from ?IPV6:2a01:cb19:853d:fa00:f59e:918a:6675:6332?
 ([2a01:cb19:853d:fa00:f59e:918a:6675:6332])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a0cca86000000b0068f0923ff12sm5014qvk.30.2024.02.13.23.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 23:47:09 -0800 (PST)
Message-ID: <5ac3a845-6681-45e0-a987-48210dbcb3b5@redhat.com>
Date: Wed, 14 Feb 2024 08:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] qemu-options.hx: Add an entry for virtio-iommu-pci
 and document aw-bits
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 mst@redhat.com, peter.maydell@linaro.org, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com
References: <20240213182933.825268-1-eric.auger@redhat.com>
 <20240213182933.825268-5-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240213182933.825268-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sMDAYc2xFyaA

On 2/13/24 19:28, Eric Auger wrote:
> We are missing an entry for the virtio-iommu-pci device. Add the
> information on which machine it is currently supported and document
> the new aw-bits option.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   qemu-options.hx | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8547254dbf..6a8c970640 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1172,6 +1172,14 @@ SRST
>       Please also refer to the wiki page for general scenarios of VT-d
>       emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>   
> +``-device virtio-iommu-pci[,option=...]``
> +    This is only supported by ``-machine q35`` and ``-machine virt``.
> +    It supports below options:
> +
> +    ``aw-bits=val`` (val between 32 and 64, default depends on machine)
> +        This decides the address width of IOVA address space. With
> +        q35 it defaults to 39 bits. On arm virt it defaults to 48 bits.


Minor improvement :

  "It defaults to 39 bits on q35 machines and 48 bits on ARM virt machines."

Anyhow,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


