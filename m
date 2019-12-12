Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1084814lff;
        Thu, 12 Dec 2019 11:24:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/aM4Tou8M4mrdrH/7ru5HM+679VwfxWdk0aLpwA4OuMEjJYXZJopq+Ny+MHtazVz+9dL2
X-Received: by 2002:ae9:e887:: with SMTP id a129mr9494054qkg.465.1576178684502;
        Thu, 12 Dec 2019 11:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576178684; cv=none;
        d=google.com; s=arc-20160816;
        b=c8IDgunrT5B8AiZQkoPoVrBYl+hUk8LcPBg8zgL8OBzX5b2gm1TERvOmJpuDoF9k8f
         VYSfkalV6U6ZXdMC+2OVl0USsfuOTDc2OwRqk4HoJMuD1XZDUdbplHwxiZTrhSi0kRlA
         YPUrbafUDXw1XZ1444QjnA0GNCgsXCrgJvxkv46BkqoMCw7e6Qdpfq17IxsmiUH6DZAL
         MWL5g7YzcnfW5Fp9f8vHhRxlzjcvM+AXZXYpzjgH246o+qppg5PbGeMbvFzc9aVOVe3j
         d7oN/Dgl8GoV+AnMRX1l411Ra4Pg31WJEscsYM1yAltpt66IVu9JHvDg7de5RyrzTulT
         ayew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ZaMMktr1w2w1L85b8GArQ5TfvVL+4OikUsN0TdF5oAs=;
        b=pPhmK5HEMr3LqStNt8gGQ3llTRNPWWmohpcmV09RLz4/3l2Ko0ESBa/IhK5kbeordM
         WPlYHz9QRsYdscgRr6DSQecuHQcGt+H0ubjPZrERINqQi9iiYbDdGbnXmropn24aU+8p
         VRiugowWhyzyRELKOBQkJpMZf0FVZflq9HehOF6ov4ygP+onKyxUzZ47QP9zslpvCYxa
         GtljGLFZuWgPGpdVWVP4QXzhUrvziqtNnbd5dsfsZ2kyjcXLMgDiejgDnyfBbkYZGdTj
         rkfONFgl5rfpXSMiq2pjqqeAG1o544/CXtM6F0jlAk6Hr/lAdwfHmsieHeZTPSDIypNq
         C3dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LuHjU8Y5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si3447125qtq.61.2019.12.12.11.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 11:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LuHjU8Y5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifU4p-0001dd-JR
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 14:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1ifU4g-0001dB-PV
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 14:24:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1ifU4e-0006ij-98
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 14:24:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31333
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1ifU4d-0006dk-Rl
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 14:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576178670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZaMMktr1w2w1L85b8GArQ5TfvVL+4OikUsN0TdF5oAs=;
 b=LuHjU8Y5awuDv8JgMVQZ/IooMITjbGENlYgRxy29cAKMJnxcUon5E2s3wZhkqiwxO0934D
 NfsPdmqd0KXA5hB5sEJ9IOKyG8tnnZvpHujeXvFgmjjh4/kf0Bak2t4kKbEB+gGLc+Ekk/
 ibwt7nxRy4c46/t1ekJHgrWiClVub9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-s7sOpm61NjuN6GKZbrLnhw-1; Thu, 12 Dec 2019 14:24:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACB61005502;
 Thu, 12 Dec 2019 19:24:25 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6E260BB9;
 Thu, 12 Dec 2019 19:24:20 +0000 (UTC)
Date: Thu, 12 Dec 2019 16:24:19 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] hw: add compat machines for 5.0
Message-ID: <20191212192419.GB498046@habkost.net>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-2-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212173320.11610-2-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: s7sOpm61NjuN6GKZbrLnhw-1
X-Mimecast-Spam-Score: 0
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
Cc: peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 bijan.mottahedeh@oracle.com, "Michael S. Tsirkin" <mst@redhat.com>,
 maz@kernel.org, David Hildenbrand <david@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 "open list:sPAPR" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, guoheyi@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, msys.mizuma@gmail.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0B1hkb64KGkc

On Thu, Dec 12, 2019 at 06:33:16PM +0100, Andrew Jones wrote:
> Add 5.0 machine types for arm/i440fx/q35/s390x/spapr.
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>
>=20
> ---
>=20
> Hi Eduardo,
>=20
> If we need to do something special for i440fx and q35, as
> 9aec2e52ce9d ("hw: add compat machines for 4.2") implies, then
> I'll need guidance as to what.

Keeping default_cpu_version=3D=3D1 in pc-*-5.0 (like you did) is
correct.

However, you might want to use Cornelia's patch (which is
probably already queued in the s390 tree) instead:
https://patchew.org/QEMU/20191112104811.30323-1-cohuck@redhat.com

--=20
Eduardo

