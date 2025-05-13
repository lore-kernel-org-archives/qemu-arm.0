Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp379432njb;
        Tue, 13 May 2025 02:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeGw/kVj0T4dZEvsP3sGz9NHibd3dxq9/SdFMMp6T+fYMls7DeFWB/SCf+tUBws9Ip8/1UFVKYsgT3ow==@linaro.org
X-Google-Smtp-Source: AGHT+IHs7jexK3wXbwHbplNrYN2zOWFgFqxuWM0H08VjE5wb8KZE5+3dwchbIqcVPNpUbnr2L9Mt
X-Received: by 2002:a05:620a:688b:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7cd1de7cb5dmr353448585a.8.1747126966694;
        Tue, 13 May 2025 02:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747126966; cv=none;
        d=google.com; s=arc-20240605;
        b=F03/mT4RIzo1BicmYvHFZ20+oFPK5tyRjPCb+uwjrJLsrzN3cMrNZhU5hx90HUFd/h
         ltTLeUTK4Xm1HtVtoSRWHVqZMkYZxbninAmcKQC3LKDSCM8LpYrIuADYz8qyrsUqPOdt
         fJKExe6R1u5J+O6wKc8UpRWXebJn3/EGFyFsCKpr0V5xji0qUyj/qqGGUQMZCI1WyMrq
         t30QTfId+K3zC3jTNy32P714c/8+Rw83JU0ofqO4IIR39uzc7l0MbuzI3f0bG+AcrAyW
         3+N9YWE92sbQ+ZDWM7p1102uEdc35HsQiW01aJMClgJp1cqg5+co+n/xjBCETMuhRZfz
         t4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=HE5E63A6rmg07JemaPIfncFI01OB8TrlgBKDzNGQzCc=;
        fh=Zavh94HUuPJB5gl0IfSVe2gXOofN1UEdXC5UKXChR9A=;
        b=T+Istcj6i8CUObLtfGs/9fnpwShd/VFE86vTLYMEFmz+cNJ6pxcmWQzLJYIxkv8FV0
         JCHq+G+VcZ+mdnZ/pGOstbKkdxk+EZAOxiY2d4ZInFnZyZ5/NTUJGSWEKXMiJdpAtHTN
         0zA+07PAPwEBcaIBQvxYxxHDjujC+P1IsMC5Hg83/zrW+GuiLfl2upnRa1BStvYeVAeu
         /0viBkdEe7ZbPcxvT/ovC4SLeuKkz+Yde7D0xkI0zrH8mx8pB9TsFP3ofPub2HPZGla4
         VhQHnVU21ZDPegVY8HO6TmE+XgzJEr3OWMpRGVKdLClobDvIr4wW8u5LqjunE7pa1W0k
         0uJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FlqB2w1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd06c5c379si883776985a.240.2025.05.13.02.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 02:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FlqB2w1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uElX5-0006vC-Kt; Tue, 13 May 2025 05:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElX3-0006u5-1N
 for qemu-arm@nongnu.org; Tue, 13 May 2025 05:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElX0-0000bt-00
 for qemu-arm@nongnu.org; Tue, 13 May 2025 05:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747126952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HE5E63A6rmg07JemaPIfncFI01OB8TrlgBKDzNGQzCc=;
 b=FlqB2w1FxAvztT4Ph7UpEnufeCeGaunFAlrLwYroSRoTuEg8AztzMsIn1UJWYEeETyPUwz
 2dcOdTaxcMjNOvj0WJl+2qXk29nv1rk/TuxBfmzaiVEWn/jJ2JiYURS0GWzTSajPQlD424
 LlHTOYAqqRJmEHlZSLiGiD1yukdqm88=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-IfJeIn-ONCiqf3KQ2V0lkA-1; Tue, 13 May 2025 05:02:30 -0400
X-MC-Unique: IfJeIn-ONCiqf3KQ2V0lkA-1
X-Mimecast-MFC-AGG-ID: IfJeIn-ONCiqf3KQ2V0lkA_1747126950
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a1f7204d72so2232294f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 02:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747126949; x=1747731749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HE5E63A6rmg07JemaPIfncFI01OB8TrlgBKDzNGQzCc=;
 b=q/tXTxyT7hu5edoutK9K0nh4uy0krY6modVKoj2uq/Q7ZdEgNOa7TJUiYO/tcmg8j2
 XA0NUDgZfZXX/3rvcTClUKS4dWc2Y2ekXH0GhYX3CVejq2cgiCWazUNhKSr77ASjGxD1
 XmjTkEU4dsgId0MtQy3smA0QJL4oTabfbBhQU+e1NsWYNcchMy00sV2eGvUpLTcyNDHj
 cHcBVfSOZlNITZTVz3sofk8Pb012ljQKfpTdH88vb8io+PcZHYMskJ52ZDTuumhg0bpI
 q/cwQm4mZuJAjDwr7STpTRCHhTj90WdVi3a2Z2112hUNMsUYif+dRm1fclFyESL7YFaJ
 8d1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj8qpmu7//Fxn37XSbvqGB5K48MIRrnJxwfcRcfa1lUvuScy9KFikJMXwXCKL6ifyFx6G1ApaA8Q==@nongnu.org
X-Gm-Message-State: AOJu0YydnPrX+WTkXpwqWljStYiDHSxtouyThBfD/bTmEyjnteMtS2bx
 fcev1IoP7zi8K37NTmhSMp1vSs8QVihm5Ky7q88SBaympvkk+I4woBw3DNYDKgnxiHydVDqnCMp
 HcfPNGfOdHJqm9QwE2KGgo7zKjO9XwKlyrqqBDN00XGnuRunHNQ==
X-Gm-Gg: ASbGnctOwn6PJ31XivmDs2L3f+0JeS4oaRuZUwMjrvb/Y0EUjUNq4v4vNUIi93FweEY
 hVOIJXtSCqlCBcJzYaXyPrmjNeYQQh6uu6scBQJEA+1DDCqdN8na6NQU7br1qRQDmk6EWGajL24
 ZU1CQRv3G7joXeGlZspHtXW81wke09p1PJueONxNW2OQw3APRBzfCDNCHLjkkoPGVSzLJBwILKt
 3b9Z2XGpGqIamRhKP0c6RQbPkM2wQ88xBqpME8TgF/ho+ZdTrgzAAsa9h3+RbXDkmMvb4aVFinv
 MKqPCAWtcVjZMNNb09ATXhPE8KiX3Xx1
X-Received: by 2002:adf:f687:0:b0:3a1:fa6c:4735 with SMTP id
 ffacd0b85a97d-3a1fa6c4838mr8573383f8f.35.1747126949668; 
 Tue, 13 May 2025 02:02:29 -0700 (PDT)
X-Received: by 2002:adf:f687:0:b0:3a1:fa6c:4735 with SMTP id
 ffacd0b85a97d-3a1fa6c4838mr8573329f8f.35.1747126949240; 
 Tue, 13 May 2025 02:02:29 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f296csm15256712f8f.47.2025.05.13.02.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 02:02:28 -0700 (PDT)
Date: Tue, 13 May 2025 11:02:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 21/27] hw/audio/pcspk: Remove PCSpkState::migrate field
Message-ID: <20250513110227.04d709b2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-22-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-22-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TJw3yOOmHLvrR2Xv0bSgcyG2xqv928WU19637Y2hMtU_1747126950
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cjF5iWi184BR

On Thu,  8 May 2025 15:35:44 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The PCSpkState::migrate boolean was only set in the
> pc_compat_2_7[] array, via the 'migrate=3Doff' property.
> We removed all machines using that array, lets remove
> that property, simplifying vmstate_spk[].

same as 14/27, it should be safe to remove without deprecation

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

=20
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/audio/pcspk.c | 10 ----------
>  1 file changed, 10 deletions(-)
>=20
> diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
> index a419161b5b1..0e83ba0bf73 100644
> --- a/hw/audio/pcspk.c
> +++ b/hw/audio/pcspk.c
> @@ -56,7 +56,6 @@ struct PCSpkState {
>      unsigned int play_pos;
>      uint8_t data_on;
>      uint8_t dummy_refresh_clock;
> -    bool migrate;
>  };
> =20
>  static const char *s_spk =3D "pcspk";
> @@ -196,18 +195,10 @@ static void pcspk_realizefn(DeviceState *dev, Error=
 **errp)
>      pcspk_state =3D s;
>  }
> =20
> -static bool migrate_needed(void *opaque)
> -{
> -    PCSpkState *s =3D opaque;
> -
> -    return s->migrate;
> -}
> -
>  static const VMStateDescription vmstate_spk =3D {
>      .name =3D "pcspk",
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
> -    .needed =3D migrate_needed,
>      .fields =3D (const VMStateField[]) {
>          VMSTATE_UINT8(data_on, PCSpkState),
>          VMSTATE_UINT8(dummy_refresh_clock, PCSpkState),
> @@ -218,7 +209,6 @@ static const VMStateDescription vmstate_spk =3D {
>  static const Property pcspk_properties[] =3D {
>      DEFINE_AUDIO_PROPERTIES(PCSpkState, card),
>      DEFINE_PROP_UINT32("iobase", PCSpkState, iobase,  0x61),
> -    DEFINE_PROP_BOOL("migrate", PCSpkState, migrate,  true),
>  };
> =20
>  static void pcspk_class_initfn(ObjectClass *klass, const void *data)

