Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp693314lfi;
        Tue, 3 Mar 2020 10:46:42 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuL4oxd1QQz1uFh4DZPSs8Lf38aPg9TTRKeNro5tEoXv93NvIukCQtdASU/XPEUQ2VlLZ9A
X-Received: by 2002:a37:68c6:: with SMTP id d189mr5593908qkc.307.1583261202803;
        Tue, 03 Mar 2020 10:46:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583261202; cv=none;
        d=google.com; s=arc-20160816;
        b=ykh5OrNM3RR4cQ6vYhrei7r9C02N8GLoa8cO1BPuu+pajOagsgZ+8YIob0Lv9+hf+Y
         Ur+eTLqbUaMWY1htM8lO6a50VigcuQUaJbXTnid2ifEPxn4jffiH/ubgx1Pu8qrlOOFr
         BCd/JS1UoP07ck+Ua1VOYFiR22a5RkfIgAxY7O083DdVEo8u8+2d0o3KmzQfjLXVMdxV
         DnsCdsSxfeLH3aJafUOaeix2J82Zoq8ydif9iyc2cEkgFDLvpekmOybKrCGSyTrt6+61
         H27hi7OAS1O4MprmQi9mIJL/8YPhuKbUs2w9xCD6stBZ2QCsP4r2bPEG8pZ3LzXV1bXs
         dtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=wdaek6mH06AiyslCL6zYAbFOzmlp52saOdk1aO6RPWk=;
        b=qcY+nGQrA4PZXHtIbwamaGIOypdYa3mPeOstuS24BO1l7Outsh2HkRnMVWz9IrMgep
         ZWCJliSSD7K7cBwonwTZ/tbd2ivpJbGrzmlW+u+ed8mf9t0RbADfu47d+rdS1yqDnVIt
         3C9r0hF1WD3iQWi1QNC07o0AUqCMSaTfqLjEVgZsYMjEvlnqbbiKVhjS3q1j/539RRTp
         9qA3MJU74oeVYGFQzeukZHxT36xiIqxtuIXgsvFIUlXVze0u8Rg2sbDAITdKPvufzYWv
         GaNL5Cp8xdoa9w63G8vjZ/+NvQ0GIv6smtrSjgLc32XtzpMyr9x65CBAKMfmZ184IUYj
         mnYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L7vfY7UH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si7606934qtp.76.2020.03.03.10.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 10:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L7vfY7UH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9CZ0-0007Wf-79
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 13:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1j9CYn-0007RY-Qw
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:46:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1j9CYl-0006c4-IK
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:46:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50961
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1j9CYl-0006XJ-Ec
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583261171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdaek6mH06AiyslCL6zYAbFOzmlp52saOdk1aO6RPWk=;
 b=L7vfY7UHWwrNrLeyR6NjXBWUcF1S3idPp/wcDznkPD7FOzhyqxPf7rEaNuyU/ANh9FdLCD
 1ydvEHUNz015qw977PFVeW814L8eCUJJQMCcWYh9H1BuomnCTUeFXcPkatZWZBpfz1p1zC
 VPGlivHfO7cVwJZMl18aFU+5hnSARFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-VEHNHEayPreLKV5sshcqLA-1; Tue, 03 Mar 2020 13:46:07 -0500
X-MC-Unique: VEHNHEayPreLKV5sshcqLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B88F101FC64;
 Tue,  3 Mar 2020 18:46:03 +0000 (UTC)
Received: from localhost (ovpn-122-157.rdu2.redhat.com [10.10.122.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D69A5C1D4;
 Tue,  3 Mar 2020 18:45:58 +0000 (UTC)
Date: Tue, 3 Mar 2020 13:45:57 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <20200303184557.GV4440@habkost.net>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Marek Vasut <marex@denx.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B7beUYDqYB1g

On Tue, Mar 03, 2020 at 10:05:11AM +0000, Peter Maydell wrote:
> The CPUClass has a 'reset' method.  This is a legacy from when
> TYPE_CPU used not to inherit from TYPE_DEVICE.  We don't need it any
> more, as we can simply use the TYPE_DEVICE reset.  The 'cpu_reset()'
> function is kept as the API which most places use to reset a CPU; it
> is now a wrapper which calls device_cold_reset() and then the
> tracepoint function.
>=20
> This change should not cause CPU objects to be reset more often
> than they are at the moment, because:
>  * nobody is directly calling device_cold_reset() or
>    qdev_reset_all() on CPU objects
>  * no CPU object is on a qbus, so they will not be reset either
>    by somebody calling qbus_reset_all()/bus_cold_reset(), or
>    by the main "reset sysbus and everything in the qbus tree"
>    reset that most devices are reset by
>=20
> Note that this does not change the need for each machine or whatever
> to use qemu_register_reset() to arrange to call cpu_reset() -- that
> is necessary because CPU objects are not on any qbus, so they don't
> get reset when the qbus tree rooted at the sysbus bus is reset, and
> this isn't being changed here.
>=20
> All the changes to the files under target/ were made using the
> included Coccinelle script, except:
>=20
> (1) the deletion of the now-inaccurate and not terribly useful
> "CPUClass::reset" comments was done with a perl one-liner afterwards:
>   perl -n -i -e '/ CPUClass::reset/ or print' target/*/*.c
>=20
> (2) this bit of the s390 change was done by hand, because the
> Coccinelle script is not sophisticated enough to handle the
> parent_reset call being inside another function:
>=20
> | @@ -96,8 +96,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_typ=
e type)
> |     S390CPU *cpu =3D S390_CPU(s);
> |     S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
> |     CPUS390XState *env =3D &cpu->env;
> |+    DeviceState *dev =3D DEVICE(s);
> |
> |-    scc->parent_reset(s);
> |+    scc->parent_reset(dev);
> |     cpu->env.sigp_order =3D 0;
> |     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Queued, thanks.

However, if you want to do additional arch-specific work on top
of this patch, feel free to merge it through your tree.

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo

