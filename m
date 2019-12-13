Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp437995lff;
        Thu, 12 Dec 2019 23:11:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzd8U8k0nTOhlVKPx4355LD8hwjFlSgefRAriZK+XDjam5xfiG6Sej7SD+JcikOTkvjz5KA
X-Received: by 2002:ad4:5144:: with SMTP id g4mr12102718qvq.179.1576221076732;
        Thu, 12 Dec 2019 23:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576221076; cv=none;
        d=google.com; s=arc-20160816;
        b=lIIdS8Md9zJqropMmBKSn9vs493nZw1q4xq3BpoC9ah9JYiOp1Y5O2VXjjq/TYG5ug
         YILGAfT3NIwPAvQ6K3Ut6aHCpupU6EmExCXk9RW8WNyQ5FVfdXei0bJ9p9dkaDbV3Z2C
         XY+wRcWaI/cZO3CD5FF3itS44zZUGfkZDIGcrn5MSJnxexv1cWA7iFwnplr4GHnLL+N+
         p80gVkiQy73lX0I4MiVUWej+75d9Kf1eJGWRYi9x9L+G3yk+X2H3x4dpSGA7+HDWTyH7
         MiQNG21mGHVE2gkOiLh67PBd5N8eYXymal9B14yAjd56nLAuvxQUis6rKRkNXmzUnp+B
         jqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=8Z9481crTfuDxmQqSMOjo03EDWmMJej6UDt1Ym4TNGM=;
        b=yYIbDY5+u+oofPGxUtHZmQ/C7+lAdJ/Nvj+qfksnrOs/pJBcf6o/BfnnV79K0hI88h
         gRJojts4pMF+1JLXQ0x154fd/jNmf4j6hT0HC56uzaf4nNUdwvtyPrhTyCnZaUGhExbs
         F4JH8gwZBZaOOAwzco16i9pbq5Z3XlqZ9hqgkpoBZ3XmK+v+QYWzOLMNjywKTAqZxXXo
         Fg8IGj0jLowtE/hpGh4vglKctPMkH9s6UmCwFESxCXUZiWmxM9mtRtlnfTm1ty9zk14W
         DG/MCSeoa1pkmtnfiOhmeocQXnhUmjTYU4wBwh1YXtz6ipFe8P6qrm/7Voco7gdquJUp
         fvTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B+3bUnua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si4120009qtp.218.2019.12.12.23.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 23:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B+3bUnua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iff6a-0005x4-4H
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 02:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iff6Q-0005vL-Gu
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:11:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iff6N-0001KE-OT
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:11:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59308
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iff6N-0001Ic-5u
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 02:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576221062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z9481crTfuDxmQqSMOjo03EDWmMJej6UDt1Ym4TNGM=;
 b=B+3bUnuaaimNMxBWNX9DmtDJqbhW4M6Tj+iOOYG/61EVj05/3s0dHHLOPvQZkU46ZCrAEe
 WI+0X6hHpEJGmb9ox7dSt0mxJTD2Yl7IJGcfoymKIvXmdPDIv6uYRIdfXx5kWsHm5aWRYe
 jGZkuwzi5izSdLhkDFxypJPOwRckvFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-vFNZT84jOtOlevkhw20ZoA-1; Fri, 13 Dec 2019 02:10:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38444100550E;
 Fri, 13 Dec 2019 07:10:56 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-204-115.brq.redhat.com
 [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5CC160474;
 Fri, 13 Dec 2019 07:10:44 +0000 (UTC)
Date: Fri, 13 Dec 2019 08:10:40 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] hw: add compat machines for 5.0
Message-ID: <20191213071040.mc52d5mnezedyc54@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-2-drjones@redhat.com>
 <20191212192419.GB498046@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20191212192419.GB498046@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: vFNZT84jOtOlevkhw20ZoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com,
 David Hildenbrand <david@redhat.com>, maz@kernel.org,
 Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 guoheyi@huawei.com, "open list:sPAPR" <qemu-ppc@nongnu.org>,
 msys.mizuma@gmail.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1BZCnY6KmahM

On Thu, Dec 12, 2019 at 04:24:19PM -0300, Eduardo Habkost wrote:
> On Thu, Dec 12, 2019 at 06:33:16PM +0100, Andrew Jones wrote:
> > Add 5.0 machine types for arm/i440fx/q35/s390x/spapr.
> >=20
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> >=20
> > ---
> >=20
> > Hi Eduardo,
> >=20
> > If we need to do something special for i440fx and q35, as
> > 9aec2e52ce9d ("hw: add compat machines for 4.2") implies, then
> > I'll need guidance as to what.
>=20
> Keeping default_cpu_version=3D=3D1 in pc-*-5.0 (like you did) is
> correct.
>=20
> However, you might want to use Cornelia's patch (which is
> probably already queued in the s390 tree) instead:
> https://patchew.org/QEMU/20191112104811.30323-1-cohuck@redhat.com
>

Drat. I did search the mailing list for a posting from someone else first,
but I made the mistake of searching subjects for 'machine type' rather
than 'compat machines'. Certainly we should use Cornelia's. Mine is
just noise.

Thank you reviewers, and sorry for the duplicated effort.

drew

