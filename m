Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp782910lfb;
        Fri, 1 Apr 2022 03:51:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynHfsJzAROoF8ZnCuwlnnvIbk4SSL3431Tldp5Pk+2U67spg1Hl+oiOTopNxM7lhOoeVO4
X-Received: by 2002:ad4:5c83:0:b0:441:4a7a:4ca9 with SMTP id o3-20020ad45c83000000b004414a7a4ca9mr7909672qvh.131.1648810281945;
        Fri, 01 Apr 2022 03:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648810281; cv=none;
        d=google.com; s=arc-20160816;
        b=DsnVRf8sNH11wyNPxpopJUPbb27Hv4wO824eY3O8IfGoS/Ahw7l8PEyf1f1F+oA0cU
         KXde3u230WnPfLnrDZw4iwtofiODeEAcjjC0b7RWbULOP5NYEw97NPzJ/FzsB95CgMHt
         f4fAtm7lJVYEFsuDvxTrli30DPawDThvEgFVunUvsXDOW+gRmmG9X14GLjUVEu8uJFfI
         NVD8KT5oT2clYcQgw7cRiNl0nuWk/ZRzE5Jpjo5dUk6cKrcZ6F/rwCZzj8gGx3v0dVlp
         5qkzSHODkIZaq+t802+OhiBiLEJ15Txp3mU9fWRkLvGowwJKbcCPuHLnU+1hVdNXQbIr
         uNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nGuS1hkH7OFCfnKWl0vBNSvQHA6J4U0k9Qn1XXkDQM=;
        b=xXOqNNQDhEkBSiYzK5Ts409rmw0QvLQjjnd8L/I9MPb0B/NzzE1bBe4GSffsffyzen
         eMrXESThQi/DqrmMkrttWTFpkE87/Mf4830A7tn06zTiLp10d+hqqLU4zgi0zZUv9NCi
         avPBiHIj4e5XQlARUnY8ZcH4zejnjBFjxq6i0N2E4f25+WKKXgUDNkzVB3FoZy/mFDHN
         RTgiZYteuqnf2JqEjjytvcDi9ChDJSEH2yU79VBTkG5l7mjfedUnYc27A7ZGNFujwdxH
         A8r0/e0bCMSw6Xzrc9lKWx1RpBvp+J1YxcbaE2ywIjcx4m/B0iuECdarAQzXPA408c8y
         Vlcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=do01J1w5;
       spf=pass (google.com: domain of eperezma@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eperezma@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eperezma@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id hu3-20020a056214234300b00441824b4b7bsi663372qvb.228.2022.04.01.03.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Apr 2022 03:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eperezma@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=do01J1w5;
       spf=pass (google.com: domain of eperezma@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eperezma@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648810281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nGuS1hkH7OFCfnKWl0vBNSvQHA6J4U0k9Qn1XXkDQM=;
	b=do01J1w55Ey33O9xJJS+7AYb0spJxBR8BEovROYmlyteofKznY0K40lvB+larPA+stK7jR
	6EcNxlCXNRjZkxegMZP0E6Hn6Ug5vH/BDfDhdT2vFliqYkn71Mfzb6JYM2488dkIPm0m2o
	Htsv/0eWWg5dIBoRR/cybsogStQyMUs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-V_2BYXLYNlSOeVlNyS9cEg-1; Fri, 01 Apr 2022 06:51:18 -0400
X-MC-Unique: V_2BYXLYNlSOeVlNyS9cEg-1
Received: by mail-qt1-f199.google.com with SMTP id cb11-20020a05622a1f8b00b002e06f729debso1743359qtb.4
        for <alex.bennee@linaro.org>; Fri, 01 Apr 2022 03:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/nGuS1hkH7OFCfnKWl0vBNSvQHA6J4U0k9Qn1XXkDQM=;
        b=yyhqbbPkagq+drYUfdELzWCQSILvJhzJGpRuzYngrY9XD/piBgQbgF3uRWC4P3n7jn
         ssz75MctxkH3JeJQUiLMZrSCwJeIQocclEXXT/0SepLThy2N1/LGUwLJ2NvTmQhZ2MwE
         gt1ZnqjPpj0cKVgwTYCDmoiTs68iWfWixeIu60jBhssa5br0fM6KwNhLNfu0EOn8pgbJ
         5b5kGhh7lzKSRODSl2QXNbe2KzI7G1nFJzLPO2xQFHWwAYxmUR7F3eg4F5sanQdGv+mA
         EZwm0rn4mQxK1+cfuNn6Fo78zvN3u11mN6N3jkGId1heKua4QUxc6qblaupsq9YZWYib
         Im0w==
X-Gm-Message-State: AOAM530OtKbWrCQfJqv+24KSQokvgoJiKzsODnP1/VPwKCbKbC9OpB86
	PZ/PHmAmOb1lQo/rDgCW22n5HO5RLBIugShMvOxhDTnZbM5PCRys/ncxLTke5z3EzB6N/Dbpp0R
	orba3NZF4SbjiksvgMzKzc7fyf2CBZm5U
X-Received: by 2002:a05:620a:31a3:b0:67d:32c4:d4f8 with SMTP id bi35-20020a05620a31a300b0067d32c4d4f8mr6185201qkb.308.1648810277969;
        Fri, 01 Apr 2022 03:51:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:67d:32c4:d4f8 with SMTP id
 bi35-20020a05620a31a300b0067d32c4d4f8mr6185191qkb.308.1648810277695; Fri, 01
 Apr 2022 03:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210903174510.751630-1-philmd@redhat.com> <20210903174510.751630-20-philmd@redhat.com>
In-Reply-To: <20210903174510.751630-20-philmd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 1 Apr 2022 12:50:41 +0200
Message-ID: <CAJaqyWd9kd6TamcO3qj68J5Dn6-cXAWRxOckbfjwpKnEp0_VzQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 19/28] hw/virtio: Replace g_memdup() by g_memdup2()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Kevin Wolf <kwolf@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
	"Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: uNM4B4Rg3ExH

On Fri, Sep 3, 2021 at 8:11 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>
> Replace g_memdup() by the safer g_memdup2() wrapper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Should we check in_num/out_num in range?

I'd say it is not needed to check: virtqueue_pop fills them by
iterating through the descriptor chain so the range is restricted to
[0, 1024].

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>


> ---
>  hw/net/virtio-net.c       | 3 ++-
>  hw/virtio/virtio-crypto.c | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52..338fbeb8c57 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1449,7 +1449,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vd=
ev, VirtQueue *vq)
>          }
>
>          iov_cnt =3D elem->out_num;
> -        iov2 =3D iov =3D g_memdup(elem->out_sg, sizeof(struct iovec) * e=
lem->out_num);
> +        iov2 =3D iov =3D g_memdup2(elem->out_sg,
> +                               sizeof(struct iovec) * elem->out_num);
>          s =3D iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
>          iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
>          if (s !=3D sizeof(ctrl)) {
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 54f9bbb789c..59886c1790d 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *v=
dev, VirtQueue *vq)
>          }
>
>          out_num =3D elem->out_num;
> -        out_iov_copy =3D g_memdup(elem->out_sg, sizeof(out_iov[0]) * out=
_num);
> +        out_iov_copy =3D g_memdup2(elem->out_sg, sizeof(out_iov[0]) * ou=
t_num);
>          out_iov =3D out_iov_copy;
>
>          in_num =3D elem->in_num;
> @@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *reque=
st)
>      }
>
>      out_num =3D elem->out_num;
> -    out_iov_copy =3D g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num=
);
> +    out_iov_copy =3D g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_nu=
m);
>      out_iov =3D out_iov_copy;
>
>      in_num =3D elem->in_num;
> -    in_iov_copy =3D g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
> +    in_iov_copy =3D g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
>      in_iov =3D in_iov_copy;
>
>      if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
> --
> 2.31.1
>
>
