Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3809927wrq;
        Fri, 25 Oct 2019 06:29:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1X/whmJ6EcuILmhDKxXOB2U61YD6ZyRm2L1A0Kk8i6gHQ0Iacc/Q7wW6kYZoz5Xllp5LQ
X-Received: by 2002:a0c:a8ea:: with SMTP id h42mr3158555qvc.130.1572010196650;
        Fri, 25 Oct 2019 06:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572010196; cv=none;
        d=google.com; s=arc-20160816;
        b=HPcuE5eYAwkYMqeHOELyWecyk1IaIai86OoGG1Wv0kG5q41BhGTCg3StCbVvqpBCVj
         eGnQs41yRsAtE3y7JxPvFjULQ/Z3XaOgXTJR7Pj3N19aDHfhaixM0/hI8ToF0uwlYFbZ
         kL8tOUr9V3H0+D/ouL7lxAJe0g1rwBRufkt+7GVvAd2H8oYgwqPNLAbjsmsDnlLAJWss
         Qz0SbrHJglZQk77XA5gT2CLqSDuKpacEADLFgXibFSdpi3DyuhSzVBoNtk4Y3Ym+FyN+
         AlRVHA3KJnZO1/ENZxvfugeSzj5bO+zMPRFFgWGLC0d8BPtcaweT9T7dcKNr6bSGzvwO
         L2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=TXoeupEoqztpAAd5CgTj1cBSD9Wcv3BgFKcqST9xO2c=;
        b=EDyJsGbxEDRYuYkznArom0Oaa77R755x/XKp6c3y+RugBfINczqK5oD3/IAG4SQCCl
         qDMh8XlWVImJLo9A433cOwiPvLeA99uTvpAs5Lh8hQkfC23h70UQbgsu2om3VjlDPrKe
         oW90RYxFyU3obRWhsNG6aFd96+xeXZzYFMI68JEBLAgrd+RCYhW0o4DI7iFRdmsV9y16
         PdmDON1fcMn2HMz4YBnWeB7MkITtsZmxzXEe+2Gvrx+2aWEhNJHIPG2YK15YR3ZDcUlO
         SVz2iEXPXnZjU1GFs1U75uNnCmcOrwQ/HTpE34YP1BGcWb6DpRc5b68w1J+DQsBKrHQS
         XXBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i4TEQpw5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si1295885qtj.4.2019.10.25.06.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 06:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i4TEQpw5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNzf9-0001Tx-DH
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 09:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iNzY4-0007U0-6y
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iNzY0-00059p-5H
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:22:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42185
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iNzXy-00058X-BW
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 09:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572009747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXoeupEoqztpAAd5CgTj1cBSD9Wcv3BgFKcqST9xO2c=;
 b=i4TEQpw5C4+lbVzdAOUrkK4Tt3SZS0ceMMogQpK1mNpb6lgi8QEyyWt5kRp/2W5w5Kp+6w
 Wyn9J5f0S/ttsgRv3ohdN8KJAhfIYtsBXkL6SSstdRJ6KWIKWRyLTkmlF80Um678i7FuvV
 ZCLF9f35LklqQGBliVrR29Tq3i0665c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-GczJZsPlMUmnpCLSWxkQUA-1; Fri, 25 Oct 2019 09:22:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 567FD1800DCA;
 Fri, 25 Oct 2019 13:22:22 +0000 (UTC)
Received: from localhost (ovpn-116-62.gru2.redhat.com [10.97.116.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D053760BFB;
 Fri, 25 Oct 2019 13:22:16 +0000 (UTC)
Date: Fri, 25 Oct 2019 10:22:15 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Jiri Denemark <jdenemar@redhat.com>
Subject: Re: [PATCH 7/7] cpu: Add `machine` parameter to query-cpu-definitions
Message-ID: <20191025132215.GC6744@habkost.net>
References: <20191025022553.25298-1-ehabkost@redhat.com>
 <20191025022553.25298-8-ehabkost@redhat.com>
 <8736fhmius.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <8736fhmius.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GczJZsPlMUmnpCLSWxkQUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 David Hildenbrand <david@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WcP8gtFwKH9X

CCing libvir-list.

On Fri, Oct 25, 2019 at 08:36:59AM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> > The new parameter can be used by management software to query for
> > CPU model alias information for multiple machines without
> > restarting QEMU.
[...]
> > @@ -317,9 +321,17 @@
>    ##
>    # @query-cpu-definitions:
> >  #
> >  # Return a list of supported virtual CPU definitions
> >  #
> > +# @machine: Name of machine type.  The command returns some data
> > +#           that machine-specific.  This overrides the machine type
>=20
> "that is machine-specific"
>=20
> > +#           used to look up that information.  This can be used,
> > +#           for example, to query machine-specific CPU model aliases
> > +#           without restarting QEMU (since 4.2)
> > +#
> >  # Returns: a list of CpuDefInfo
> >  #
> >  # Since: 1.2.0
> >  ##
> > -{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo']=
,
> > +{ 'command': 'query-cpu-definitions',
> > +  'data': { '*machine': 'str' },
> > +  'returns': ['CpuDefinitionInfo'],
> >    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_=
I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
>=20
> I'm afraid the doc comment is less than clear.  Before I can suggest
> improvements, I have questions.
>=20
> Looks like @alias-of is the only part of the return value that changes
> when I re-run query-cpu-definitions with another @machine argument.
> Correct?

Yes.

>=20
> How is this going to be used?  Will management software run
> query-cpu-definitions for each machine type returned by query-machines?
> Or just for a few of them?

I don't know.  I'll let Jiri and other libvirt developers answer
that.

--=20
Eduardo

