Received: by 10.28.173.206 with SMTP id w197csp1496wme;
        Fri, 5 Jan 2018 18:21:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBouSvMWUU5rs47iqn6zOBjnFADYf3lY0O6r9NpfpP190TE8DXZKeCW1k8yZ5YhhykfgXwl91
X-Received: by 10.37.118.19 with SMTP id r19mr4516641ybc.321.1515205281486;
        Fri, 05 Jan 2018 18:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515205281; cv=none;
        d=google.com; s=arc-20160816;
        b=KoLVTDLQ/jQQ89dcpOdvAY3ev9UlTgKCxO4F0j+JD6z40RWLpk3Ti3qA1KH35PvVx4
         gj5wApRuoqlXjXuesYTQiAVxdQGAK7k/LvbGckCnr+KIxRk2HLQU/3AhuZ4RCKu/hR6B
         +rq5WiV6zcsnkMzWyUyt2qO0TgAD4RvWa+Jrgc19dFdNYUXeYOY8Mmv2/rsTiA4Wy5aj
         3L3X45mZ2+LRU9eprKBqOIqR8mOjrO9AJgQ24x+MZjEkqaB1CNqswmj6tX/8I3ExkQtb
         PFl2tJx/q9eXu74p6PdowC+HfpWcB18MZtzAvtVKHLaHDlFZKgqgclc3EkYvAIRLHyIH
         zHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=igXbI2L5SNqVzQ7rBAItbTOBSGdKpN7n4G7e3FGwnJE=;
        b=Oc4d96I7uwm2R7qW1FXNU+Ktgs8vF9Ar5yM1SH6vI2Gs/qO/TGct0zkNX7i6hWQg2/
         3jxKDWlluNP7J6gk5F6f/bGmHtBc7vsolxtQmcTJG6k8BoFy35g62n/EBb4DS5plc+yB
         Y5bv0dobGcbq4LuTkPTW3xAXjPFj5tggSrDaGNVz4eGqARX2rUCncg8HgdPUY/vSiVy1
         Ptlhv5DiQCfmkPze7XA3vZMKXv8y4DCc07VGHP48wfu0MFDdynMQU2tSfY505/7PfXcr
         7QoUdML2ASsoLqZgQ0fSrS/dN9+mlpDmm5HDiFTV/rSl288iG8IqblDbuNFEUVRA4uVp
         TPDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fNCKpMT8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c73si1456657ywh.761.2018.01.05.18.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jan 2018 18:21:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fNCKpMT8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eXe6q-00075Q-Pl
	for alex.bennee@linaro.org; Fri, 05 Jan 2018 21:21:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe6Q-00073e-R2
	for qemu-devel@nongnu.org; Fri, 05 Jan 2018 21:20:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eXe6Q-0005Sq-4Z
	for qemu-devel@nongnu.org; Fri, 05 Jan 2018 21:20:54 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eXe6P-0005SQ-UA; Fri, 05 Jan 2018 21:20:54 -0500
Received: by mail-wm0-x243.google.com with SMTP id g130so8555348wme.0;
	Fri, 05 Jan 2018 18:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=igXbI2L5SNqVzQ7rBAItbTOBSGdKpN7n4G7e3FGwnJE=;
	b=fNCKpMT8skIY0I4BMr9/qDNvAbt7PXkbnpTr8HF8hW6x2J1fShIx87VblQJWrDAcsc
	+ZG/2pv68nlR4EsAPo9zyOVavosXR6sSvUAmqWiDrsPl4YBImRDrBYOfMqNzRA+cRuQO
	mMtNu7g5d3P3kN4BDYK+P/e7Uh3V69DeEuGXpPwlx/6OW2H3miYtMong3DXHAIHSjZ7O
	qLiZp+Hxl5JapEXy11ORrW+JwyCt/M2vHS3+wGhaaOVoh3tZNxSb0AZRx94iJZ+rLFmO
	PoJLGzeJf2GbsF1M2X9JuoO8iV4zc81GJbVoABFz8xnz+aeWPIblyOHlLB9tMxbvI3gB
	vKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=igXbI2L5SNqVzQ7rBAItbTOBSGdKpN7n4G7e3FGwnJE=;
	b=rB6z0d8ayxj4fFagj659YgfX1Hhlqco/wERUyXVNhwuS4ZmE58M05H7QcKiW/FbAiE
	Th2DpkaDIaJHQTc1ILZvs7Bh7t2EA6N6wBrmECZfaezYY+JUc2t7HBm7iBpkfGCFsAnf
	J7sauxWKvZRvkHgaKxMtJIk/XyXqanJBZAufaTLZu5I911I0JOcep+wEKNPTOiFo8wlc
	Bx2EKPg4THB0F/4gyJlYZk3SX+bLQcjY6Dp8C879mQ5Gbr0JbGVW28KQwP4+KzZXwBz7
	IcEIGLbgTf83lY3urdY7XPrx2AU3b1FECEOf3qcyWSxlYyRwtcMhGkwJxoIF+PRuxLCn
	KWZg==
X-Gm-Message-State: AKGB3mKN9AM/eG0SflzPZRde6r+D/gOjxL7kUKd1krA9yfIB17oBlLTe
	eD9YKuC64g0zLMKVMlmqYiEuapw5xjWvdQwGVeQ=
X-Received: by 10.28.55.74 with SMTP id e71mr3843214wma.50.1515205252973; Fri,
	05 Jan 2018 18:20:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:20:22 -0800 (PST)
In-Reply-To: <20180104144046.30793-6-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-6-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 5 Jan 2018 18:20:22 -0800
X-Google-Sender-Auth: SuzjELX7azHLWNe-fWVVBimtUmg
Message-ID: <CAKmqyKPs2pZh=SSqAsZyBm41b4UkrfdwWrvspJbWdHfPViqgqA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [RFC PATCH 5/6] hw/net/cadence_gem: add FDT names
 as alias
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SlCU0W7saxVW

On Thu, Jan 4, 2018 at 6:40 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/net/cadence_gem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 3943187572..b7b4540d91 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1544,6 +1544,12 @@ static void gem_class_init(ObjectClass *klass, voi=
d *data)
>
>  static const TypeInfo gem_info =3D {
>      .name  =3D TYPE_CADENCE_GEM,
> +    .aliases       =3D (const char * []) {
> +                        "cdns,gem",
> +                        "cdns,zynq-gem",    /* Zynq-7xxx SoC */
> +                        "cdns,zynqmp-gem",  /* Zynq Ultrascale+ MPSoC */
> +                        NULL
> +                     },
>      .parent =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size  =3D sizeof(CadenceGEMState),
>      .instance_init =3D gem_init,
> --
> 2.15.1
>
>
