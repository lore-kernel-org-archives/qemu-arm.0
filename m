Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp262636lfp;
        Thu, 6 Feb 2020 23:38:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLjvICM66X+jo29fjFNHPArKjMqCru8M/HLVfmosfPGW/5ahrRdSOjCaofuo6lukojqBhT
X-Received: by 2002:aed:2dc2:: with SMTP id i60mr6090965qtd.8.1581061088645;
        Thu, 06 Feb 2020 23:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581061088; cv=none;
        d=google.com; s=arc-20160816;
        b=XQSu1RUy3sWjVVyS1yaJRhHXSqOUDmZLVkA+xmHV5FaISKO7EOLPKWvR9LL/SrFdAq
         pf6V7UfI5SwaxsqYu/Vs2LF/pJ1llb0B/zoN0LPxm2gY5sE4bcT9vNqA4OyEWN64LWiI
         sTQ6tW8U1BGx2d+VHZMiYsQRWl5wSXwd+FAewHIGOmnPo2313lvf9v3HzWyFHg5y0Qm+
         atDdr8p4kgQYvz+PhJSCyUe++uoPsdTaARYUBrkGuWtLrNOkttwlfKcm1hpBdiSulbDj
         Iat0VJ/RjciwX0mK5hzTSE/o2dzYqcOqbVf0oI/r+6jFRf8qoBZoiIboOuyGovkytiIi
         MRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=3Pum9DLoPcluppoVUR9e3hm+aPXS0TbibkrITFC+2VM=;
        b=TJq65tLia2PYyAxFZM5isOHrBOjPXGif+3en4dcI+vwloNtTruJ4oCQDRQzAAvZyuC
         atAU966YOqig3mg5LJllFqPalV24YQs/jJW+A4Em+iIfW9lNjaEDUeSzeMuzkvA4oEpd
         6Gj3LQBUbhESLyPv11ZTq7p8iSy7nmg5hqCvonS0Lm644AM/0TTZlW/X5FgasrZ5tNRZ
         4pkYxBNpLQKuZnxw/DFCv1IWiu7ieNzS+zfeoZxftsFXUSEJiISEmc48XW608CQajNWz
         YRQhS2YBnJ0CBZlZdZbVzxUzf+kzV9ALnfgLyLtDsSeKhE1tAUSePbwItSrXfLmwB4d5
         zXNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZKeu/18R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si885878qvo.6.2020.02.06.23.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 23:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZKeu/18R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izyDI-0007CO-4o
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 02:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1izyDA-0007CD-R6
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1izyD8-0006T6-MT
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:37:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1izyD8-0006RS-EG
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581061077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Pum9DLoPcluppoVUR9e3hm+aPXS0TbibkrITFC+2VM=;
 b=ZKeu/18Ri28c58yRFT1m79cCDXoWcQTkPA0FoTZTeDJLD9Jr2AoFnCm7r3v5qQb3hc53IW
 qkdpRAqhURaWCn0u6GcyKFAWa1al1w4FRcpYKGzQhQNCUb1tfLpbhBS/EFNZL549CHpQwW
 +NaZ4yBLGAHc1k55v+biBI0btpWpk08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-SXhL_bQ-MbqcyIHfJuLpjQ-1; Fri, 07 Feb 2020 02:37:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A190DB60;
 Fri,  7 Feb 2020 07:37:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1705790EA;
 Fri,  7 Feb 2020 07:37:49 +0000 (UTC)
Date: Fri, 7 Feb 2020 08:37:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 5/5] target/arm/cpu: Add the kvm-no-adjvtime CPU
 property
Message-ID: <20200207073747.x3rsqxtfbmtlfqws@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-6-drjones@redhat.com>
 <CAP+75-Vt3apV8i64oFTC6pAATXkrE1g+tVskr_3ohBHtZ1LNdQ@mail.gmail.com>
 <20200206124047.o4sy52jgbkqeravd@kamzik.brq.redhat.com>
 <2522956e-5dae-3ebc-76d2-010a918e0d19@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2522956e-5dae-3ebc-76d2-010a918e0d19@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: SXhL_bQ-MbqcyIHfJuLpjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rNYaVhAaLVcA

On Thu, Feb 06, 2020 at 11:46:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/6/20 1:40 PM, Andrew Jones wrote:
> > On Thu, Feb 06, 2020 at 01:08:53PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> > ...
> > > > +/* KVM VCPU properties should be prefixed with "kvm-". */
> > > > +void kvm_arm_add_vcpu_properties(Object *obj)
> > > > +{
> > > > +    if (!kvm_enabled()) {
> > >=20
> > > This can't happen, right? Can we turn that into an assertion, or
> > > remove the check?
> >=20
> > You're right. An assert would be more appropriate. Will you send a patc=
h?
>=20
> Apparently this can be called with KVM_CONFIG && !kvm_enabled():
>=20
> See kvm_arm_set_cpu_features_from_host()
> {
>     if (!arm_host_cpu_features.dtb_compatible) {
>         if (!kvm_enabled() ||
>             !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
>             /* We can't report this error yet, so flag that we need to
>              * in arm_cpu_realizefn().
>              */
>=20
> I won't modify your patch (until I have a better understanding of
> TYPE_ARM_HOST_CPU).
>

Just grepped around and talked to Igor. Indeed we need to be able
to do the host cpu init without erroring out (even if we know we
will in realize) and, as cpu instance_init should add the properties,
then I don't really see a cleaner way to do it than what we already
have.

Thanks,
drew

