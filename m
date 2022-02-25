Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1624453lfq;
        Fri, 25 Feb 2022 02:03:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf+tmB81DiEKLVJxX+o6PxKSekzu+f5KaXUzNi8lNxj4gCpGwq0hrSgeGuE2gBZylaqWlR
X-Received: by 2002:a05:6214:2524:b0:432:5935:94a5 with SMTP id gg4-20020a056214252400b00432593594a5mr5025390qvb.41.1645783417968;
        Fri, 25 Feb 2022 02:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645783417; cv=none;
        d=google.com; s=arc-20160816;
        b=YbGgodsEa8GIjLP7PnktTJUd60uPncro+ElsUzv8Qkyyl2lLpLd217jQFg7BX04fdX
         5iCmc8TDuInj0NTFcrVzyyJiSUFKNsyIT/LglVE1+y6+YZAfiUeAod+TN8bUK/u1fKU3
         Dvmyx5P2Bgrdx1wlNFzci4ZiYM2VzBj1/wf4rtDp7kEeKKgWCIQ0fOU+oeRTSLje661q
         KqE+PYq3m4gQ0JcxIpJ4MbUwwwTwKS/0TPTuENfjgBrcGYtpPb54WL1V+mXWBt3KrbFi
         ris2+rmjcfr8LnKV4YIPZvEg2CZzr9F8RamFTTIcPFXz5d5aQY8Lm+7iy/t5Bv3tRO0j
         vwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=0QpDZZ9zcm+ba2+0bHgj/wMBbqmVTiGXQtGzP5wY/o0=;
        b=NoSzrmvAVQEITOa+TI/dxXC4SoPvN7aDofakTv7NNZ1IR8aPDjEzNi+fqKTgTIH7w5
         iXOjLbZS6cg9x3vhWzyRPdlywbxSEFrzomR1+Era5m7+TEDCd1IFS738jsk5FCQpsFBj
         HNqC8gCxsBOhLe1gerWRuqS4yh3wPUi++P5RueP4/NF+NFREAVvTFS4NKuIEuRQZK3ZK
         JbmvcsTNXth/S32pTdC40rmXRh2AwvnjRtb8N/UAG6MJIdsiigfEJgOXftF5OvV3GkBH
         6cYUNBqiru4gqIdx1UbCFAWLnXFPVKlQI3+HecsG0SL8UnYE6JT40oVGvCFEOswRuyr+
         C6wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g+kUnfBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020ac87a8a000000b002de065385e0si809392qtr.492.2022.02.25.02.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Feb 2022 02:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g+kUnfBX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNXRp-0007Su-D0
	for alex.bennee@linaro.org; Fri, 25 Feb 2022 05:03:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNXRX-0007NE-Dz
 for qemu-arm@nongnu.org; Fri, 25 Feb 2022 05:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNXRR-0006ZT-R9
 for qemu-arm@nongnu.org; Fri, 25 Feb 2022 05:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645783391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QpDZZ9zcm+ba2+0bHgj/wMBbqmVTiGXQtGzP5wY/o0=;
 b=g+kUnfBXbAj1JnNbtGuorNJAvh1qne5zM0r4p7AN1F+ofTyUaG6nhBNFTFFlfAhQLi8vBG
 QH7nz3r9MwTWKPgfwTv1VAo6WdJc4t6/vPL7k7vlwVASrcYmdFP+WeO2x3WpG8ZrPzWlmZ
 7tp7GDXgkvvLotnfGDgwlO1TCtTDVCc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-Sta2lma7O5aDzWbAo-TC5Q-1; Fri, 25 Feb 2022 05:03:10 -0500
X-MC-Unique: Sta2lma7O5aDzWbAo-TC5Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 x22-20020a05640226d600b0041380e16645so182886edd.8
 for <qemu-arm@nongnu.org>; Fri, 25 Feb 2022 02:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYEPkFG7bDFmR8hkVktZy+dkB9jmBgDfiakigHNzvv0=;
 b=CIQAeoq3W4nJcbVtV56+tuZVoIFd9jP9JEflhwBh+ei8otxGikMSabAwKkaAjWJ1Iz
 ovIx5lr2tv9QfFcPtFchOuN+iT2iblA8cFcRwBdzxVoz9iBkZG7Gzlz5eG3snOVVv207
 zjlpUmnAwmp9SPFAGdZfBfejsqjedqgDhX/9lXlKmci1/pAfLFKIsl97vs2xInF31/b4
 /wdjbXiErlL/UAKENrSNBX2lRGweFLB47wWZgDAcwaRyFrx+OROHcADrZi4DK+eRblAO
 uI9w/fkX6QYEy4LmH+7fHDgbbv9GYmQimvAAsmMper/K7XNSZSRtYq+FGyFmX8EQ5yMt
 blZg==
X-Gm-Message-State: AOAM533i2tPei+7PYMf/VewHXxNdDbSGT623w03M00XjYvD5Gafe3QIk
 8mA0aFZx4m8Nss3Ay1hBoh5To7uRptYxg1YYWzsR0H/WevtQaZw+b9mwFkLqhq1F8NPnCfimtZZ
 CpwYLwWtaAzrN
X-Received: by 2002:a17:907:7613:b0:6d0:ee20:8a37 with SMTP id
 jx19-20020a170907761300b006d0ee208a37mr5401157ejc.316.1645783388758; 
 Fri, 25 Feb 2022 02:03:08 -0800 (PST)
X-Received: by 2002:a17:907:7613:b0:6d0:ee20:8a37 with SMTP id
 jx19-20020a170907761300b006d0ee208a37mr5401137ejc.316.1645783388450; 
 Fri, 25 Feb 2022 02:03:08 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1709060bf100b006cf2730b5f2sm821931ejg.30.2022.02.25.02.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:03:07 -0800 (PST)
Date: Fri, 25 Feb 2022 11:03:06 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220225110306.6c3e97a1@redhat.com>
In-Reply-To: <211c23f8-b5bd-219d-e584-20a0b700919d@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <aa22b9ba-6b5a-a728-870d-e5efbea67c5d@redhat.com>
 <211c23f8-b5bd-219d-e584-20a0b700919d@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s8vgcWMSWVEL

On Fri, 25 Feb 2022 16:41:43 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
>=20
> On 2/17/22 10:14 AM, Gavin Shan wrote:
> > On 1/26/22 5:14 PM, Igor Mammedov wrote: =20
> >> On Wed, 26 Jan 2022 13:24:10 +0800
> >> Gavin Shan <gshan@redhat.com> wrote:
> >> =20
> >>> The default CPU-to-NUMA association is given by mc->get_default_cpu_n=
ode_id()
> >>> when it isn't provided explicitly. However, the CPU topology isn't fu=
lly
> >>> considered in the default association and it causes CPU topology brok=
en
> >>> warnings on booting Linux guest.
> >>>
> >>> For example, the following warning messages are observed when the Lin=
ux guest
> >>> is booted with the following command lines.
> >>>
> >>> =C2=A0=C2=A0 /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 =
\
> >>> =C2=A0=C2=A0 -accel kvm -machine virt,gic-version=3Dhost=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -cpu host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> >>> =C2=A0=C2=A0 -smp 6,sockets=3D2,cores=3D3,threads=3D1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -m 1024M,slots=3D16,maxmem=3D64G=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem0,size=3D128M=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem1,size=3D128M=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem2,size=3D128M=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem3,size=3D128M=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem4,size=3D128M=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem4,size=3D384M=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -numa node,nodeid=3D0,memdev=3Dmem0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -numa node,nodeid=3D1,memdev=3Dmem1=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -numa node,nodeid=3D2,memdev=3Dmem2=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -numa node,nodeid=3D3,memdev=3Dmem3=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -numa node,nodeid=3D4,memdev=3Dmem4=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>> =C2=A0=C2=A0 -numa node,nodeid=3D5,memdev=3Dmem5
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
> >>> =C2=A0=C2=A0 alternatives: patching kernel code
> >>> =C2=A0=C2=A0 BUG: arch topology borken
> >>> =C2=A0=C2=A0 the CLS domain not a subset of the MC domain
> >>> =C2=A0=C2=A0 <the above error log repeats>
> >>> =C2=A0=C2=A0 BUG: arch topology borken
> >>> =C2=A0=C2=A0 the DIE domain not a subset of the NODE domain
> >>>
> >>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 t=
o CPU#5
> >>> are associated with NODE#0 to NODE#5 separately. That's incorrect bec=
ause
> >>> CPU#0/1/2 should be associated with same NUMA node because they're se=
ated
> >>> in same socket.
> >>>
> >>> This fixes the issue by considering the socket when default CPU-to-NU=
MA
> >>> is given. With this applied, no more CPU topology broken warnings are=
 seen
> >>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but th=
ere are
> >>> no CPUs associated with NODE#2/3/4/5. =20
> >> =20
> >>> From migration point of view it looks fine to me, and doesn't need a =
compat knob =20
> >> since NUMA data (on virt-arm) only used to construct ACPI tables (and =
we don't
> >> version those unless something is broken by it).
> >>
> >> =20
> >>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>> ---
> >>> =C2=A0 hw/arm/virt.c | 2 +-
> >>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>> index 141350bf21..b4a95522d3 100644
> >>> --- a/hw/arm/virt.c
> >>> +++ b/hw/arm/virt.c
> >>> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsig=
ned cpu_index)
> >>> =C2=A0 static int64_t virt_get_default_cpu_node_id(const MachineState=
 *ms, int idx)
> >>> =C2=A0 {
> >>> -=C2=A0=C2=A0=C2=A0 return idx % ms->numa_state->num_nodes;
> >>> +=C2=A0=C2=A0=C2=A0 return idx / (ms->smp.dies * ms->smp.clusters * m=
s->smp.cores * ms->smp.threads); =20
> >>
> >> I'd like for ARM folks to confirm whether above is correct
> >> (i.e. socket is NUMA node boundary and also if above topo vars
> >> could have odd values. Don't look at horribly complicated x86
> >> as example, but it showed that vendors could stash pretty much
> >> anything there, so we should consider it here as well and maybe
> >> forbid that in smp virt-arm parser)
> >> =20
> >=20
> > After doing some investigation, I don't think the socket is NUMA node b=
oundary.
> > Unfortunately, I didn't find it's documented like this in any documents=
 after
> > checking device-tree specification, Linux CPU topology and NUMA binding=
 documents.
> >=20
> > However, there are two options here according to Linux (guest) kernel c=
ode:
> > (A) socket is NUMA node boundary=C2=A0 (B) CPU die is NUMA node boundar=
y. They are
> > equivalent as CPU die isn't supported on arm/virt machine. Besides, the=
 topology
> > of one-to-one association between socket and NUMA node sounds natural a=
nd simplified.
> > So I think (A) is the best way to go.
> >=20
> > Another thing I want to explain here is how the changes affect the memo=
ry
> > allocation in Linux guest. Taking the command lines included in the com=
mit
> > log as an example, the first two NUMA nodes are bound to CPUs while the=
 other
> > 4 NUMA nodes are regarded as remote NUMA nodes to CPUs. The remote NUMA=
 node
> > won't accommodate the memory allocation until the memory in the near (l=
ocal)
> > NUMA node becomes exhausted. However, it's uncertain how the memory is =
hosted
> > if memory binding isn't applied.
> >=20
> > Besides, I think the code should be improved like below to avoid overfl=
ow on
> > ms->numa_state->num_nodes.
> >=20
> >  =C2=A0static int64_t virt_get_default_cpu_node_id(const MachineState *=
ms, int idx)
> >  =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 return idx % ms->numa_state->num_nodes;
> > +=C2=A0=C2=A0=C2=A0 int node_idx;
> > +
> > +=C2=A0=C2=A0=C2=A0 node_idx =3D idx / (ms->smp.dies * ms->smp.clusters=
 * ms->smp.cores * ms->smp.threads);
> > +=C2=A0=C2=A0=C2=A0 return node_idx % ms->numa_state->num_nodes;

using idx directly to deduce node looks a bit iffy
take x86_get_default_cpu_node_id() as an example,
it translates it uses idx to pick arch_id (APIC ID)
which has topology encoded into it and than translates
that to node boundary (pkg_id -> socket)

Probably the same should happen here.

PS:
may be a little on tangent to the topic but chunk above
mentions dies/clusters/cores/threads as possible attributes
for CPUs but virt_possible_cpu_arch_ids() says that only
has_thread_id =3D true
are supported, which looks broken to me.

> >  =C2=A0}
> >=20
> >  =20
>=20
> Kindly ping...
>=20
> >>> =C2=A0 }
> >>> =C2=A0 static const CPUArchIdList *virt_possible_cpu_arch_ids(Machine=
State *ms) =20
> >> =20
>=20
> Thanks,
> Gavin
>=20

