Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1480174lfg;
        Tue, 25 Feb 2020 02:18:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxosfxcpv/sz9Y3JLYTDQ7bIpBv4fP13Qw8RVXG6BF/tC1A/Z0rJ3xh5KdHkieMPw/gBmWN
X-Received: by 2002:a37:6307:: with SMTP id x7mr13092329qkb.225.1582625913763;
        Tue, 25 Feb 2020 02:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582625913; cv=none;
        d=google.com; s=arc-20160816;
        b=OZY7Kk2gne/6kjW5d5yTuhBTKjoeGh2mNKkC5AaCgdEKCP02lxjxPidoZ9GY2iWJzq
         rjU1PWB1na5uM2WoOPBlIwdYnr5Evs5mNvFucU07AkG73G7j6rikbKj2keuhz1qImKrt
         qG8l2IpXlCUJG6umhGHmHScKB1z50GlWkp9x/aS/Szn94rjpHRKQMAQ+PRB+x0gybTRq
         QCI4PYuMM+X4xIS6gaEsMQR0cruR4QSIcGburdH498CkGAgzIxwSZH8zYgu+oZeqyZml
         yEsR4FNf2wBf3EFHs5tlft4AKW+xb0nCzuHYnCONH2o5y+gqqGgiOc2s4IX4O0JaPiNj
         tpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=XTZdQTomlkthw2VLCsTCkFSiLuYwak21RDh6fDiWJXg=;
        b=yxsYekhzeDvdiuYA4T6ajntKjyOQO2A0NGbZrnxdSjFaMqCifQ0erPNkFz29GSkosY
         RhFisH7Fw38uhxNzy1/IAaYhzH9ZmiTychy5OHdW1jR9UjMA1zu9N/bclo5/3+13Iw8b
         IGh4GxdE0HW6t9mJknxH030TVcvDcAy9A9TTOBKTtvDj7zBTA3rkUXVFyD7O9S2AvLpR
         lJb5CtO1X1TY3Lafsd270DwkDFZ2/JP4DidJhfLnzq9SBr83W4mHUvie+CPu/BhC6UK+
         XTEoeNrzOdZNgAD0m0+cxAHMKIC6WdwwqFVFUuUoRJkhCemooowu78yS7wy36Q5thxnw
         6s3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RI0xXzEf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si7591964qkl.80.2020.02.25.02.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 02:18:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RI0xXzEf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6XIP-0003VI-0w
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 05:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6XIB-0003TQ-Ry
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:18:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6XI9-0002UA-Iw
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:18:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47209
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6XI9-0002Tl-EB
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582625896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTZdQTomlkthw2VLCsTCkFSiLuYwak21RDh6fDiWJXg=;
 b=RI0xXzEfkh5ACvx+Ce8mx/8eAbfllatempWOTKq3JVaEdedNX/b9fOg5eBJJu38ImKay2S
 neEsay3yjkKUMw0Kqhx5JChtm8+Vm18fhf4H9sAGXKuZzQo9t5d+OJ5lsejrRFS1MdPyc0
 Oyy2FGSM0UY/jx7pE4PS3Mjszy9Abgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-tdmU-KszMmuYAqeoo97ftg-1; Tue, 25 Feb 2020 05:18:15 -0500
X-MC-Unique: tdmU-KszMmuYAqeoo97ftg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05CF800D50;
 Tue, 25 Feb 2020 10:18:13 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 431045D9E5;
 Tue, 25 Feb 2020 10:18:09 +0000 (UTC)
Subject: Re: [RFC v2 2/6] tpm: Use TPMState as a common struct
From: Auger Eric <eric.auger@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, stefanb@linux.ibm.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200214183704.14389-1-eric.auger@redhat.com>
 <20200214183704.14389-3-eric.auger@redhat.com>
 <bda40279-016a-8cb5-96b0-cedc88e21e60@redhat.com>
 <cad0ccd9-1bb9-33af-a4d5-0f8c2a521f13@redhat.com>
Message-ID: <240f20bc-695f-97ca-b2b3-50d1f1a54af2@redhat.com>
Date: Tue, 25 Feb 2020 11:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <cad0ccd9-1bb9-33af-a4d5-0f8c2a521f13@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ri9TsXYSMK6P

Hi Phil,

On 2/17/20 7:01 PM, Auger Eric wrote:
> Hi Philippe,
>=20
> On 2/17/20 10:21 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Eric,
>>
>> On 2/14/20 7:37 PM, Eric Auger wrote:
>>> As we plan to introdce a SysBus TPM TIS device, let's
>>> make the TPMState a common struct usable by both the
>>> ISADevice and the SysBusDevice. TPMStateISA embeds the
>>> struct and inherits from the ISADevice.
>>>
>>> The prototype of functions bound to be used by both
>>> the ISA and SysBus devices is changed to take TPMState
>>> handle.
>>>
>>> A bunch of structs also are renamed to be specialized
>>> for the ISA device. Besides those transformations, no
>>> functional change is expected.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>> =C2=A0 hw/tpm/tpm_tis.c | 146 +++++++++++++++++++++++++++++------------=
------
>>> =C2=A0 1 file changed, 91 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
>>> index c609737272..fc6d7ca579 100644
>>> --- a/hw/tpm/tpm_tis.c
>>> +++ b/hw/tpm/tpm_tis.c
>>> @@ -65,7 +65,6 @@ typedef struct TPMLocality {
>>> =C2=A0 } TPMLocality;
>>> =C2=A0 =C2=A0 typedef struct TPMState {
>>> -=C2=A0=C2=A0=C2=A0 ISADevice busdev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion mmio;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char buffer[TPM_TIS_BUFF=
ER_MAX];
>>> @@ -91,7 +90,15 @@ typedef struct TPMState {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPMPPI ppi;
>>> =C2=A0 } TPMState;
>>> =C2=A0 -#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS_ISA=
)
>>> +typedef struct TPMStateISA {
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> +=C2=A0=C2=A0=C2=A0 ISADevice parent_obj;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*< public >*/
>>> +=C2=A0=C2=A0=C2=A0 TPMState state; /* not a QOM object */
>>> +} TPMStateISA;
>>> +
>>> +#define TPM_TIS_ISA(obj) OBJECT_CHECK(TPMStateISA, (obj),
>>> TYPE_TPM_TIS_ISA)
>>> =C2=A0 =C2=A0 #define DEBUG_TIS 0
>>> =C2=A0 @@ -281,9 +288,8 @@ static void tpm_tis_prep_abort(TPMState *s,
>>> uint8_t locty, uint8_t newlocty)
>>> =C2=A0 /*
>>> =C2=A0=C2=A0 * Callback from the TPM to indicate that the response was =
received.
>>> =C2=A0=C2=A0 */
>>> -static void tpm_tis_request_completed(TPMIf *ti, int ret)
>>> +static void tpm_tis_request_completed(TPMState *s, int ret)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D TPM(ti);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t locty =3D s->cmd.locty;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t l;
>>> =C2=A0 @@ -338,7 +344,7 @@ static uint32_t tpm_tis_data_read(TPMState *=
s,
>>> uint8_t locty)
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 #ifdef DEBUG_TIS
>>> -static void tpm_tis_dump_state(void *opaque, hwaddr addr)
>>> +static void tpm_tis_dump_state(TPMState *s, hwaddr addr)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const unsigned regs[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPM_TIS_REG_ACCE=
SS,
>>> @@ -353,7 +359,6 @@ static void tpm_tis_dump_state(void *opaque,
>>> hwaddr addr)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int idx;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t locty =3D tpm_tis_locality_from_=
addr(addr);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwaddr base =3D addr & ~0xfff;
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D opaque;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("tpm_tis: active locality=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : %d\n"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "tpm_tis: state of locality %d : %d\n"
>>> @@ -363,7 +368,7 @@ static void tpm_tis_dump_state(void *opaque,
>>> hwaddr addr)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (idx =3D 0; regs[idx] !=3D 0x=
fff; idx++) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("tpm_tis:=
 0x%04x : 0x%08x\n", regs[idx],
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (int)tpm_tis_mmio_read(opaque, base + regs[idx], 4));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (int)tpm_tis_mmio_read(s, base + regs[idx], 4));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("tpm_tis: r/w offset=C2=A0=
=C2=A0=C2=A0 : %d\n"
>>> @@ -488,7 +493,7 @@ static uint64_t tpm_tis_mmio_read(void *opaque,
>>> hwaddr addr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0 #ifdef DEBUG_TIS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TPM_TIS_REG_DEBUG:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm_tis_dump_state(opaque, =
addr);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm_tis_dump_state(s, addr)=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0 #endif
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> @@ -835,10 +840,8 @@ static const MemoryRegionOps tpm_tis_memory_ops =
=3D {
>>> =C2=A0 /*
>>> =C2=A0=C2=A0 * Get the TPMVersion of the backend device being used
>>> =C2=A0=C2=A0 */
>>> -static enum TPMVersion tpm_tis_get_tpm_version(TPMIf *ti)
>>> +static enum TPMVersion tpm_tis_get_tpm_version(TPMState *s)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D TPM(ti);
>>> -
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tpm_backend_had_startup_error(s->be_=
driver)) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return TPM_VERSI=
ON_UNSPEC;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> @@ -850,9 +853,8 @@ static enum TPMVersion
>>> tpm_tis_get_tpm_version(TPMIf *ti)
>>> =C2=A0=C2=A0 * This function is called when the machine starts, resets =
or due to
>>> =C2=A0=C2=A0 * S3 resume.
>>> =C2=A0=C2=A0 */
>>> -static void tpm_tis_reset(DeviceState *dev)
>>> +static void tpm_tis_reset(TPMState *s)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D TPM(dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int c;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->be_tpm_version =3D tpm_backend=
_get_tpm_version(s->be_driver);
>>> @@ -896,15 +898,14 @@ static void tpm_tis_reset(DeviceState *dev)
>>> =C2=A0 =C2=A0 /* persistent state handling */
>>> =C2=A0 -static int tpm_tis_pre_save(void *opaque)
>>> +static int tpm_tis_pre_save(TPMState *s)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D opaque;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t locty =3D s->active_locty;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_tpm_tis_pre_save(locty, s->=
rw_offset);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (DEBUG_TIS) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm_tis_dump_state(opaque, =
0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm_tis_dump_state(s, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> @@ -929,34 +930,78 @@ static const VMStateDescription vmstate_locty =3D=
 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 };
>>> =C2=A0 -static const VMStateDescription vmstate_tpm_tis =3D {
>>> +/* ISA */
>>> +
>>> +static int tpm_tis_pre_save_isa(void *opaque)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 TPMStateISA *isadev =3D opaque;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return tpm_tis_pre_save(&isadev->state);
>>> +}
>>> +
>>> +static const VMStateDescription vmstate_tpm_tis_isa =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "tpm-tis",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .version_id =3D 0,
>>> -=C2=A0=C2=A0=C2=A0 .pre_save=C2=A0 =3D tpm_tis_pre_save,
>>> +=C2=A0=C2=A0=C2=A0 .pre_save=C2=A0 =3D tpm_tis_pre_save_isa,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fields =3D (VMStateField[]) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_BUFFER(buffer, TPMS=
tate),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT16(rw_offset, T=
PMState),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(active_locty,=
 TPMState),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(aborting_loct=
y, TPMState),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(next_locty, T=
PMState),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_BUFFER(state.buffer=
, TPMStateISA),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT16(state.rw_off=
set, TPMStateISA),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(state.active_=
locty, TPMStateISA),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(state.abortin=
g_locty, TPMStateISA),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_UINT8(state.next_lo=
cty, TPMStateISA),
>>
>> On a second thought these fields seem to belong to a TPMCommonState.
>> Why not QOM'ify an abstract common parent between ISA and SysBus?
> This would mean we have double QOM inheritance (ISADevice and Sysbus
> device already being QOM devices). As far as I know this is not
> supported (see qom/object.h). Here I use the same trick as the one being
> used in hw/vfio/platform or pci.c and also used in hw/block/fdc.c - as
> pointed out by Stefan- : see FDCtrlSysBus and FDCtrlISABus.
Does this justification make sense?

In the positive do you keep your R-b or shall I remove it?

Thanks

Eric
>=20
> Thanks
>=20
> Eric
>>
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_STRUCT_ARRAY=
(loc, TPMState, TPM_TIS_NUM_LOCALITIES, 0,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_STRUCT_ARRAY(state.=
loc, TPMStateISA,
>>> TPM_TIS_NUM_LOCALITIES, 0,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstate_locty, TPMLocality),
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VMSTATE_E=
ND_OF_LIST()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 };
>>> =C2=A0 -static Property tpm_tis_properties[] =3D {
>>> -=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("irq", TPMState, irq_num, TPM_TI=
S_IRQ),
>>> -=C2=A0=C2=A0=C2=A0 DEFINE_PROP_TPMBE("tpmdev", TPMState, be_driver),
>>> -=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("ppi", TPMState, ppi_enabled, true=
),
>>> +static void tpm_tis_isa_request_completed(TPMIf *ti, int ret)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 TPMStateISA *isadev =3D TPM_TIS_ISA(ti);
>>> +=C2=A0=C2=A0=C2=A0 TPMState *s =3D &isadev->state;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 tpm_tis_request_completed(s, ret);
>>> +}
>>> +
>>> +static enum TPMVersion tpm_tis_isa_get_tpm_version(TPMIf *ti)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 TPMStateISA *isadev =3D TPM_TIS_ISA(ti);
>>> +=C2=A0=C2=A0=C2=A0 TPMState *s =3D &isadev->state;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return tpm_tis_get_tpm_version(s);
>>> +}
>>> +
>>> +static void tpm_tis_isa_reset(DeviceState *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 TPMStateISA *isadev =3D TPM_TIS_ISA(dev);
>>> +=C2=A0=C2=A0=C2=A0 TPMState *s =3D &isadev->state;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return tpm_tis_reset(s);
>>> +}
>>> +
>>> +static Property tpm_tis_isa_properties[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("irq", TPMStateISA, state.irq_nu=
m, TPM_TIS_IRQ),
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_TPMBE("tpmdev", TPMStateISA, state.be_d=
river),
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("ppi", TPMStateISA, state.ppi_enab=
led, true),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
>>> =C2=A0 };
>>> =C2=A0 -static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
>>> +static void tpm_tis_isa_initfn(Object *obj)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D TPM(dev);
>>> +=C2=A0=C2=A0=C2=A0 TPMStateISA *isadev =3D TPM_TIS_ISA(obj);
>>> +=C2=A0=C2=A0=C2=A0 TPMState *s =3D &isadev->state;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 memory_region_init_io(&s->mmio, obj, &tpm_tis_memor=
y_ops,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 s, "tpm-tis-mmio",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 TPM_TIS_NUM_LOCALITIES <<
>>> TPM_TIS_LOCALITY_SHIFT);
>>> +}
>>> +
>>> +static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 TPMStateISA *isadev =3D TPM_TIS_ISA(dev);
>>> +=C2=A0=C2=A0=C2=A0 TPMState *s =3D &isadev->state;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tpm_find()) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp,=
 "at most one TPM device is permitted");
>>> @@ -973,55 +1018,46 @@ static void tpm_tis_realizefn(DeviceState *dev,
>>> Error **errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 isa_init_irq(&s->busdev, &s->irq, s->irq_num=
);
>>> +=C2=A0=C2=A0=C2=A0 isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_region_add_subregion(isa_a=
ddress_space(ISA_DEVICE(dev)),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPM_TIS_ADDR_BASE, &=
s->mmio);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (s->ppi_enabled) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tpm_ppi_init(&s-=
>ppi, isa_address_space(ISA_DEVICE(dev)),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPM_PPI_ADDR_BASE, OBJE=
CT(s));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPM_PPI_ADDR_BASE, OBJE=
CT(dev));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 }
>>> =C2=A0 -static void tpm_tis_initfn(Object *obj)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 TPMState *s =3D TPM(obj);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis=
_memory_ops,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 s, "tpm-tis-mmio",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 TPM_TIS_NUM_LOCALITIES <<
>>> TPM_TIS_LOCALITY_SHIFT);
>>> -}
>>> -
>>> -static void tpm_tis_class_init(ObjectClass *klass, void *data)
>>> +static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPMIfClass *tc =3D TPM_IF_CLASS(klass);
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 dc->realize =3D tpm_tis_realizefn;
>>> -=C2=A0=C2=A0=C2=A0 device_class_set_props(dc, tpm_tis_properties);
>>> -=C2=A0=C2=A0=C2=A0 dc->reset =3D tpm_tis_reset;
>>> -=C2=A0=C2=A0=C2=A0 dc->vmsd=C2=A0 =3D &vmstate_tpm_tis;
>>> +=C2=A0=C2=A0=C2=A0 device_class_set_props(dc, tpm_tis_isa_properties);
>>> +=C2=A0=C2=A0=C2=A0 dc->vmsd=C2=A0 =3D &vmstate_tpm_tis_isa;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc->model =3D TPM_MODEL_TPM_TIS;
>>> -=C2=A0=C2=A0=C2=A0 tc->get_version =3D tpm_tis_get_tpm_version;
>>> -=C2=A0=C2=A0=C2=A0 tc->request_completed =3D tpm_tis_request_completed=
;
>>> +=C2=A0=C2=A0=C2=A0 dc->realize =3D tpm_tis_isa_realizefn;
>>> +=C2=A0=C2=A0=C2=A0 dc->reset =3D tpm_tis_isa_reset;
>>> +=C2=A0=C2=A0=C2=A0 tc->request_completed =3D tpm_tis_isa_request_compl=
eted;
>>> +=C2=A0=C2=A0=C2=A0 tc->get_version =3D tpm_tis_isa_get_tpm_version;
>>> =C2=A0 }
>>> =C2=A0 -static const TypeInfo tpm_tis_info =3D {
>>> +static const TypeInfo tpm_tis_isa_info =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D TYPE_TPM_TIS_ISA,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parent =3D TYPE_ISA_DEVICE,
>>> -=C2=A0=C2=A0=C2=A0 .instance_size =3D sizeof(TPMState),
>>> -=C2=A0=C2=A0=C2=A0 .instance_init =3D tpm_tis_initfn,
>>> -=C2=A0=C2=A0=C2=A0 .class_init=C2=A0 =3D tpm_tis_class_init,
>>> +=C2=A0=C2=A0=C2=A0 .instance_size =3D sizeof(TPMStateISA),
>>> +=C2=A0=C2=A0=C2=A0 .instance_init =3D tpm_tis_isa_initfn,
>>> +=C2=A0=C2=A0=C2=A0 .class_init=C2=A0 =3D tpm_tis_isa_class_init,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .interfaces =3D (InterfaceInfo[]) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { TYPE_TPM_IF },
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 };
>>> =C2=A0 -static void tpm_tis_register(void)
>>> +static void tpm_tis_isa_register(void)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 type_register_static(&tpm_tis_info);
>>> +=C2=A0=C2=A0=C2=A0 type_register_static(&tpm_tis_isa_info);
>>> =C2=A0 }
>>> =C2=A0 -type_init(tpm_tis_register)
>>> +type_init(tpm_tis_isa_register)
>>>
>>

