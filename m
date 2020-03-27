Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3063024lfi;
        Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt8jnEGxoI9vbQLhXQ4hQUWW1M+C+kGSi274p1FWpVlMACdrNgbrMMnDuN5EoqIresBjf5J
X-Received: by 2002:ac8:1add:: with SMTP id h29mr13336832qtk.258.1585306019504;
        Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585306019; cv=none;
        d=google.com; s=arc-20160816;
        b=Jq391jFEp7UpOw2AlIEZ/F69IvfXGyIthM6+SJat7HKG24FDFK7aiMuNlEzb/dEw1L
         hOHJPHUZNh56TnMcp7wbc60TGObXp8TY9RC7YdxqloJ4F4rz6wkooNp5U43TxYKt3VDu
         WkGliXXDc6ZwYOUr7ePg7mGjxfdzrnRvzRRjiNlxnKy+6sNrp6HEl4OtAmu1pIQYtXPD
         P8qyAk7Py87Av17obwF6ZL8QQL5G8ewrfeDUprpDGJSA1LmTqKYYUy+tLD/w+bWVFm0I
         BAiYxTiVE7m/5YP5UFpiThwj2L3M3wrxNwhm33kpG+p20YserKSspTLQON9sHsk8n0C5
         yg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KhTFMgo8h1+QdoBuKedKfKX3ontpLPiejdIY0Iz/hfs=;
        b=FUTHPEHLR7Imh6y/J3cSbzyARRnNVRWzWyUJpjretasH69I0u5MLL7CBa0XTEmbm+i
         Q9qEdpUmMfX3eV4O9vl7Hx/TmQS1wKVq4kHLvS13M96/Ak8rggatFZGtifoddSMUC2h6
         ReZu4wmLmZy7tP+p7dKPGj0ABCVNA//+m50+H3eNErCYIZB9H3xmENTF6rqapkkZMJ4y
         9CDCFAPi3Lb8OfqmgcyMdSgZVngrxWUfrm3tuyZ4ehyHtjlGJ9NYxG8QAWQbAr0pWXNQ
         l2eFT0+S5g8Q0OQ1i/h9p3k4vawb7cD5VPs24V21WXI0CNc2QCJAuRSKEDYVY+4VPw72
         MQFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MnpNuCdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si3011411qti.145.2020.03.27.03.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 03:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MnpNuCdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHmVu-0001kc-UP
	for alex.bennee@linaro.org; Fri, 27 Mar 2020 06:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jHmVm-0001kQ-Ia
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 06:46:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jHmVk-0002JB-Of
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 06:46:49 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:45194)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jHmVk-0002CD-H7
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 06:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585306007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhTFMgo8h1+QdoBuKedKfKX3ontpLPiejdIY0Iz/hfs=;
 b=MnpNuCdErp6HoRzsMiYRGvqDiAbfxWgWLkMJUxK7IeIo5r+DWlmUy3WACnkKYzsmcHLcbZ
 9IJhAEqfn8TJPHYh58BfmZw1GL19MBwvPpPqbzfC8jWn/OXd8HBVDD2/LNHEz1B+/tgtD3
 QI3IGEyUOL7XgcGdVkh88RKfounhUC8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-AmIitTAhMxSEc7v0hlEoeA-1; Fri, 27 Mar 2020 06:46:45 -0400
X-MC-Unique: AmIitTAhMxSEc7v0hlEoeA-1
Received: by mail-ed1-f72.google.com with SMTP id n15so3669865edq.6
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2020 03:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LSu3w7xHAQvUU4bmCQ0WTdiAhq7MmDp55Kt/G+XHoA0=;
 b=f20jprrfeYnpUIG+o5yfId2y42zogZu+yzBdGUAvVCAW+lmbENViqCMSkFuT5UsZTr
 DfaA2taClJ5URIeMnY0OXY5gk8kMYShMqdVL7cZzgQzrpQrWjTGptCzZiPb//Y16M9E+
 CAGbPB2A4KOGFFwGPhe48Ld3PLfYaSG6vbJN1UCSVLLbt1I8BaVdnh8tFdfsfW4NJflp
 kq4sZPb0Surqt1akl+CtR/jYVd44NnEQQmIAQlfJ8vYlio36MaaC8BZsKMiXldOnoqhV
 KABaP2EGGd8CyUxa4qjRWcTBOptXRCpue0gyzltlg9flGAr1H0076ogh6fT5tViDJIFl
 o5Bw==
X-Gm-Message-State: ANhLgQ2ivqg+jTK9Qd7YOi6VC4lzB0/9lU0xZa7rOkkGC+jzycThcHAo
 em9meIkP8/Xalwu2OyNaddYy6Qnt8CjLZpV65bG5stP62c7dWqmqAMRmwPyTfiCPzyM8prMlA5m
 6uFKFRmisidmz
X-Received: by 2002:a17:906:d1c4:: with SMTP id
 bs4mr12057983ejb.109.1585306004649; 
 Fri, 27 Mar 2020 03:46:44 -0700 (PDT)
X-Received: by 2002:a17:906:d1c4:: with SMTP id
 bs4mr12057942ejb.109.1585306004071; 
 Fri, 27 Mar 2020 03:46:44 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id y10sm692587ejm.3.2020.03.27.03.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 03:46:43 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/collie: Put StrongARMState* into a
 CollieMachineState struct
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200326204919.22006-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6ed008aa-552c-6341-b0ee-79054bdc86ab@redhat.com>
Date: Fri, 27 Mar 2020 11:46:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326204919.22006-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CpOirkR2xbAg

On 3/26/20 9:49 PM, Peter Maydell wrote:
> Coverity complains that the collie_init() function leaks the memory
> allocated in sa1110_init().  This is true but not significant since
> the function is called only once on machine init and the memory must
> remain in existence until QEMU exits anyway.
>=20
> Still, we can avoid the technical memory leak by keeping the pointer
> to the StrongARMState inside the machine state struct.  Switch from
> the simple DEFINE_MACHINE() style to defining a subclass of
> TYPE_MACHINE which extends the MachineState struct, and keep the
> pointer there.
>=20
> Fixes: CID 1421921
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: folded in the uncommitted change that fixes the
> arm_load_kernel() first argument.
>=20
>   hw/arm/collie.c | 33 ++++++++++++++++++++++++++++-----
>   1 file changed, 28 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/collie.c b/hw/arm/collie.c
> index 4992084a3f6..4b35ef4bed6 100644
> --- a/hw/arm/collie.c
> +++ b/hw/arm/collie.c
> @@ -19,6 +19,16 @@
>   #include "exec/address-spaces.h"
>   #include "cpu.h"
>  =20
> +typedef struct {
> +    MachineState parent;
> +
> +    StrongARMState *sa1110;
> +} CollieMachineState;
> +
> +#define TYPE_COLLIE_MACHINE MACHINE_TYPE_NAME("collie")
> +#define COLLIE_MACHINE(obj) \
> +    OBJECT_CHECK(CollieMachineState, obj, TYPE_COLLIE_MACHINE)
> +
>   static struct arm_boot_info collie_binfo =3D {
>       .loader_start =3D SA_SDCS0,
>       .ram_size =3D 0x20000000,
> @@ -26,9 +36,9 @@ static struct arm_boot_info collie_binfo =3D {
>  =20
>   static void collie_init(MachineState *machine)
>   {
> -    StrongARMState *s;
>       DriveInfo *dinfo;
>       MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    CollieMachineState *cms =3D COLLIE_MACHINE(machine);
>  =20
>       if (machine->ram_size !=3D mc->default_ram_size) {
>           char *sz =3D size_to_str(mc->default_ram_size);
> @@ -37,7 +47,7 @@ static void collie_init(MachineState *machine)
>           exit(EXIT_FAILURE);
>       }
>  =20
> -    s =3D sa1110_init(machine->cpu_type);
> +    cms->sa1110 =3D sa1110_init(machine->cpu_type);
>  =20
>       memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine-=
>ram);
>  =20
> @@ -54,11 +64,13 @@ static void collie_init(MachineState *machine)
>       sysbus_create_simple("scoop", 0x40800000, NULL);
>  =20
>       collie_binfo.board_id =3D 0x208;
> -    arm_load_kernel(s->cpu, machine, &collie_binfo);
> +    arm_load_kernel(cms->sa1110->cpu, machine, &collie_binfo);
>   }
>  =20
> -static void collie_machine_init(MachineClass *mc)
> +static void collie_machine_class_init(ObjectClass *oc, void *data)
>   {
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
>       mc->desc =3D "Sharp SL-5500 (Collie) PDA (SA-1110)";
>       mc->init =3D collie_init;
>       mc->ignore_memory_transaction_failures =3D true;
> @@ -67,4 +79,15 @@ static void collie_machine_init(MachineClass *mc)
>       mc->default_ram_id =3D "strongarm.sdram";
>   }
>  =20
> -DEFINE_MACHINE("collie", collie_machine_init)
> +static const TypeInfo collie_machine_typeinfo =3D {
> +    .name =3D TYPE_COLLIE_MACHINE,
> +    .parent =3D TYPE_MACHINE,
> +    .class_init =3D collie_machine_class_init,
> +    .instance_size =3D sizeof(CollieMachineState),
> +};
> +
> +static void collie_machine_register_types(void)
> +{
> +    type_register_static(&collie_machine_typeinfo);
> +}
> +type_init(collie_machine_register_types);
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

