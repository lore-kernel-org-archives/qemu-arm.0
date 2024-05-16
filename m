Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1447317ejl;
        Thu, 16 May 2024 08:26:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC7vfFlr3JLwSJrobo8BfE4sfCe0jqxyCfIo1VAGbfhWhXriV899+SpWuwyA6gbijcUn8O6dZN4H0FnTSqzzNpIn7lqTCq
X-Google-Smtp-Source: AGHT+IHc92YdXlvaZDEhJypDzoZ93afIcwoquLhLeLRKUc/WuP1T22jFAQqKw8cNqh1EtUTJf9+n
X-Received: by 2002:a05:622a:1354:b0:43e:1a17:10f9 with SMTP id d75a77b69052e-43e1a1746a4mr127590061cf.52.1715873188381;
        Thu, 16 May 2024 08:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715873188; cv=none;
        d=google.com; s=arc-20160816;
        b=w5NbfLjJbl+DWOTrCMMNAbH3ivd9YP+yMbu19BFVOnbQR35DwDkL+DMhyV3DpMO7P+
         7JYFHc8/8LwlwDxFASz/ZW4ND7E9atxuGxNYrAtRLChBczOf5mXEcXfz2VRqgZhaqZ6q
         ngn7xwoQbpDqE8chmBgMlT/jnyv5TfOIkv+qlQdgK5aRtKSzX1m3KLevh5bl8zsknpaL
         FagsVFsVGR0P1vDPh5eQJod1jF8ETIHmSXUr/XmeEZTD3ty/6TnYO4JR6LjBMyVMgWeU
         tD5N1CyG3its1JVPVS9FukNnx28LKh35FavjOg0EvmDQgI+VVrJBS7VtfjJ9dIRr/o5M
         3Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IYdMWOF4Cn/jq10inMPb5g39OtCoSDX7MqpcXyJIx48=;
        fh=OrAbs+5FNS/8CM3sP/CUPjsHmV4PD4ldPwGTIZYXeoc=;
        b=Ae8WPQFJqjQkkCCLl0I3Xyua0ES12CnFKVqLuh6iGY4pLufwQqFRfe5dPqXZfCu46l
         NNtTArEHbbkXUmHHzszTutUtUwXei6+axhWY5XW1RyIQjxR0MWxjCHlZnmCkfBjEKQh3
         9/DK+mNMNWwp4GhCjpiXFDwFFfHPoota84xggKFZRw+s6CoAtrD/g4xu05h22P6InhNn
         5X+niHVluuEkE2Sq6YV+hzHU3yUH2orNa/aPb1G8Yp5YzrxS3fFBa9k7O+X2vWs18QeU
         xK46jqa+Gv+dZQI8Hf9q6zrkaXrUIZ32wugbvM6LDnl4AtpWR3H/DS1eZbamlDEQdECV
         NMkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4T6KdRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df56d061fsi168170541cf.652.2024.05.16.08.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2024 08:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4T6KdRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7czl-0007Dm-5A; Thu, 16 May 2024 11:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhexu@redhat.com>) id 1s7czk-0007Cd-FR
 for qemu-arm@nongnu.org; Thu, 16 May 2024 11:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhexu@redhat.com>) id 1s7cze-0005fo-An
 for qemu-arm@nongnu.org; Thu, 16 May 2024 11:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715873163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IYdMWOF4Cn/jq10inMPb5g39OtCoSDX7MqpcXyJIx48=;
 b=a4T6KdRrAGLMLdRzmkmnvwxInSbN5lc2DUCce3XuGLktoijzxcRShYoGpt70ertgme2d9r
 09DxtTm6VdXjhs6qUZpeSHXJB94Ne1/9eNZHn/D99FyIXzZMF6t65aPmuVmKPPA6ccpP4f
 ujMRi+JyBO+kjN9Gcf6ahhV0CWtf+ns=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-VW_1Mk6XMPeJndhEuiPRRQ-1; Thu, 16 May 2024 11:26:02 -0400
X-MC-Unique: VW_1Mk6XMPeJndhEuiPRRQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-de5b0b420dcso485026276.2
 for <qemu-arm@nongnu.org>; Thu, 16 May 2024 08:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715873161; x=1716477961;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IYdMWOF4Cn/jq10inMPb5g39OtCoSDX7MqpcXyJIx48=;
 b=C4rmNXBdfchgUfpptehWaAZYfgu/FMr8n4/tuBXXGWuwFs4NLkOUQtn6ICAyAa5WWd
 8Z8rxvFf8NDTQUWP/WlFnpilypM4dQ51V6j5JA6G4rQuc0/ufxodKbqJwQuLzrShylXk
 7cvlIuUmPEf6IGl35psse0BMUfkvm85IVgWERSw6+SM1zL8jIjc8F04eSx6vFdxZpWYH
 mSRTxYU2bOF/v7kI46RY7NI4xBVvkkc/amW6HxxaSz67QD9f4jZZnTdLGrfgj+Xuai+A
 y/PsospHKEYUuXjwFeY7dvRgq0QcrZnAlb7eq3JYP9a5qNDsY/LCN4qgnSuO5CZhjlBU
 sRLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU97R1FsaHpfM6gtFGOk9WOK9e/uNXiAGjUofKwWuC3+hTmUB31aheI5BuWGXHqYroUrsO+ofG3Lvhj6vJ+VLgSnkf1
X-Gm-Message-State: AOJu0YzkzPcs+IIXZfTOfdB65BVT7A0MrZ6FSeel/AbOYbmp12pYcmeO
 AVyw3L7GmdDisza+L81soY4OeogGMA1eI/Yy+vs2oYt3LwlcpcnoMe6pEw49BxsYTH+hL4U/s9v
 QWPZjK1drOfoZ359jjddbsjS18NobjrPXA9IkTgHI5cJjQOrDcPw+vtM7wuofC2/U5eVoojYgZr
 dShyTa4gNkg/mZoWADZksx+k7t
X-Received: by 2002:a05:6902:220a:b0:dee:7ff9:a053 with SMTP id
 3f1490d57ef6-dee7ff9a1c3mr10661629276.3.1715873161382; 
 Thu, 16 May 2024 08:26:01 -0700 (PDT)
X-Received: by 2002:a05:6902:220a:b0:dee:7ff9:a053 with SMTP id
 3f1490d57ef6-dee7ff9a1c3mr10661577276.3.1715873160642; Thu, 16 May 2024
 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
In-Reply-To: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
From: Peter Xu <peterx@redhat.com>
Date: Thu, 16 May 2024 09:25:49 -0600
Message-ID: <CADLectnt6_G9trMjfEVZ7tn--bGfEy8iMAdjntjDSTeHUw2cqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Fix "virtio-gpu: fix scanout migration post-load"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fiona Ebner <f.ebner@proxmox.com>, 
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000385c24061893dafd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=zhexu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.022,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J4yZ0rtnlBYC

--000000000000385c24061893dafd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good here, thanks.

On Thu, May 16, 2024, 2:40=E2=80=AFa.m. <marcandre.lureau@redhat.com> wrote=
:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> The aforementioned patch breaks virtio-gpu device migrations for versions
> pre-9.0/9.0, both forwards and backwards. Versioning of `VMS_STRUCT` is
> more
> complex than it may initially appear, as evidenced in the problematic
> commit
> dfcf74fa68c ("virtio-gpu: fix scanout migration post-load").
>
> v2:
>  - use a manual version field test (instead of the more complex struct
> variant)
>
> v3:
>  - introduce machine_check_version()
>  - drop the VMSD version, and use machine version field test
>
> v4:
>  - drop machine_check_version() approach
>  - property renamed to x-scanout-vmstate-version
>
> Marc-Andr=C3=A9 Lureau (3):
>   migration: add "exists" info to load-state-field trace
>   migration: fix a typo
>   virtio-gpu: fix v2 migration
>
>  include/hw/virtio/virtio-gpu.h |  1 +
>  hw/core/machine.c              |  1 +
>  hw/display/virtio-gpu.c        | 24 ++++++++++++++++--------
>  migration/vmstate.c            |  7 ++++---
>  migration/trace-events         |  2 +-
>  5 files changed, 23 insertions(+), 12 deletions(-)
>
> --
> 2.41.0.28.gd7d8841f67
>
>

--000000000000385c24061893dafd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks good here, thanks.</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 16, 2024, 2:40=E2=80=
=AFa.m.  &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lurea=
u@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: M=
arc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" ta=
rget=3D"_blank" rel=3D"noreferrer">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
The aforementioned patch breaks virtio-gpu device migrations for versions<b=
r>
pre-9.0/9.0, both forwards and backwards. Versioning of `VMS_STRUCT` is mor=
e<br>
complex than it may initially appear, as evidenced in the problematic commi=
t<br>
dfcf74fa68c (&quot;virtio-gpu: fix scanout migration post-load&quot;).<br>
<br>
v2:<br>
=C2=A0- use a manual version field test (instead of the more complex struct=
 variant)<br>
<br>
v3:<br>
=C2=A0- introduce machine_check_version()<br>
=C2=A0- drop the VMSD version, and use machine version field test<br>
<br>
v4:<br>
=C2=A0- drop machine_check_version() approach<br>
=C2=A0- property renamed to x-scanout-vmstate-version<br>
<br>
Marc-Andr=C3=A9 Lureau (3):<br>
=C2=A0 migration: add &quot;exists&quot; info to load-state-field trace<br>
=C2=A0 migration: fix a typo<br>
=C2=A0 virtio-gpu: fix v2 migration<br>
<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 1 +<br>
=C2=A0hw/core/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 +++++++++++++=
+++--------<br>
=C2=A0migration/vmstate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
7 ++++---<br>
=C2=A0migration/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A05 files changed, 23 insertions(+), 12 deletions(-)<br>
<br>
-- <br>
2.41.0.28.gd7d8841f67<br>
<br>
</blockquote></div>

--000000000000385c24061893dafd--

