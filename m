Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp316491lfc;
        Tue, 9 Jun 2020 02:36:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOHPB1m52AR7GELvoR2ZkdPU/CivLiE+x/GlUz1lKXsw9Hjgph+5eMy6U6ozvLN4iPUEu2
X-Received: by 2002:a25:af02:: with SMTP id a2mr4874688ybh.225.1591695394802;
        Tue, 09 Jun 2020 02:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591695394; cv=none;
        d=google.com; s=arc-20160816;
        b=ihFXKdfeiVK5sNdYRD11MS9HMWrD6Yuqh0GLJ95aBAXvcpZhLa//793dLO1ErOi9HA
         +Vz0FbR/gJjxtH/TeiDiVB7huMmVJ4wXd90jxNvqD4zgAVwxsjiC8imcJUEHLv48e0xL
         pK+CvgYFJmDEcVv9K+45B/Dn/zNnDVWKKup1Etj1QUXHgO1gkI3imXHvl/N9QYIVODoh
         rW7Whp+4zu91dwuSZMTFyYAszcG4nL6yRJApFeCf84v+DQO7yui+gInIWEAd2STv3vn8
         lqkOefk1rrgDa1odazdn5AwlG0TPNBjNh30HiSTCEEjr1IPc17yNujnPfYOzcWyptqoR
         Q1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=BAkIAYYcIXhXFgvFe2ChrXEyl9P97aTeXkxishXYaRQ=;
        b=dmELk3ISVlZtN8NKrjRefOZ7BpileMmoTpKwpFTV2EdQAYP1nBgR0r0xCGBm5adLau
         WW1l0hYG2YPXyBFDAJdLFriDJq5QTwJxy7qqCriInh+EtCC42X2vTn+0CJTsJZgvx9xQ
         GaCqZdqtKs+Xx988fnKiYYJ2zlZt6m48usNeH2tP+XXP/qoKjVQUwZ4GpNCLKcMjeX2f
         D3qaf02ttiipiZwAdnQkmwB5xp6J6jQSpyuKaKG4qmqGpCnZB/xhIiUxt2cHoxvqyCYZ
         Fkws3phIPdXRfDWgEcVTtKNnMBWVgH8KX0OCcuN/Qu06aGcehj7xxrZSsS9js+vK9Vgn
         ivBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JiUClcYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e30si2370262ybi.449.2020.06.09.02.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 02:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JiUClcYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiagM-0000D5-5B
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 05:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jiafL-0007mQ-Cr
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 05:35:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jiafI-0002ow-2p
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 05:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591695326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAkIAYYcIXhXFgvFe2ChrXEyl9P97aTeXkxishXYaRQ=;
 b=JiUClcYc4YA+rjqsc4IySSBOpDAt/i3mhXk/joIRr42Gb48MaMv4FjsRmojSDSQPht4uLp
 MK9HjDB/irl/esGGmYMxp+LExN+bIpW+X0U02AXglZ/UDW5oAxIycTiLjC+Djfq9J3GWXa
 y2Df6pvsP5Vns0cpg9T90IX7692h2iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-8-8_apDyN5yy21xlhZF71Q-1; Tue, 09 Jun 2020 05:35:20 -0400
X-MC-Unique: 8-8_apDyN5yy21xlhZF71Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B936107ACCA;
 Tue,  9 Jun 2020 09:35:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D57CD5C1C3;
 Tue,  9 Jun 2020 09:35:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 68F5211386A6; Tue,  9 Jun 2020 11:35:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
References: <20200528110444.20456-1-armbru@redhat.com>
 <20200528110444.20456-3-armbru@redhat.com>
 <a64bd91c-58b5-1438-a401-5d6c04441c67@amsat.org>
 <87tuzkssri.fsf@dusky.pond.sub.org>
 <18c2da69-7d2b-59cb-619f-0f2d06cdedf4@amsat.org>
Date: Tue, 09 Jun 2020 11:35:16 +0200
In-Reply-To: <18c2da69-7d2b-59cb-619f-0f2d06cdedf4@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 9 Jun 2020 09:42:17
 +0200")
Message-ID: <87zh9cpoob.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, pbonzini@redhat.com,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EIf5L4RNWafm

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 6/9/20 7:38 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> On 5/28/20 1:04 PM, Markus Armbruster wrote:
>>>> xlnx_dp_init() creates these two devices, but they're never realized.
>>>> Affects machine xlnx-zcu102.
>>>>
>>>> In theory, a device becomes real only on realize.  In practice, the
>>>> transition from unreal to real is a fuzzy one.  The work to make a
>>>> device real can be spread between realize methods (fine),
>>>> instance_init methods (wrong), and board code wiring up the device
>>>> (fine as long as it effectively happens on realize).  Depending on
>>>> what exactly is done where, a device can work even when we neglect to
>>>> realize it.
>>>>
>>>> These two appear to work.  Nevertheless, it's a clear misuse of the
>>>> interface.  Even when it works today (more or less by chance), it can
>>>> break tomorrow.
>>>>
>>>> Fix by realizing them in xlnx_dp_realize().
>>>>
>>>> Fixes: 58ac482a66de09a7590f705e53fc6a3fb8a055e8
>>>> Cc: KONRAD Frederic <fred.konrad@greensocs.com>
>>>> Cc: Alistair Francis <alistair@alistair23.me>
>>>> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: qemu-arm@nongnu.org
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>  hw/display/xlnx_dp.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
>>>> index 3e5fb44e06..bdc229a51e 100644
>>>> --- a/hw/display/xlnx_dp.c
>>>> +++ b/hw/display/xlnx_dp.c
>>>> @@ -1264,9 +1264,13 @@ static void xlnx_dp_realize(DeviceState *dev, E=
rror **errp)
>>>>      DisplaySurface *surface;
>>>>      struct audsettings as;
>>>> =20
>>>> +    qdev_init_nofail(DEVICE(s->aux_bus->bridge));
>>>
>>> Eh??? Why not realize the bridge in aux_init_bus()?
>>=20
>> Because then aux_init_bus() is no longer "init", but "init and realize".
>> Instead: "[PATCH v2 32/58] auxbus: New aux_bus_realize(), pairing with
>> aux_bus_init()".  Okay?
>
> It would be easier to follow having aux_bus_realize() introduced first,

Point taken.

> then used it directly here. Anyway it is reviewed so I don't have a
> problem if this patch goes as it. Thanks.

Appreciated!

[...]

