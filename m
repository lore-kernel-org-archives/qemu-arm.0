Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9171617wrv;
        Fri, 9 Aug 2019 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdE1Ig2C7c4NlcMQ+mfVfx+0BPbvlTVHk+MdG3osuzAlR0iu94ALWFRBD/wLF/9ZnnC0uk
X-Received: by 2002:ad4:4562:: with SMTP id o2mr17945030qvu.116.1565355708030;
        Fri, 09 Aug 2019 06:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565355708; cv=none;
        d=google.com; s=arc-20160816;
        b=ba25o/4/WDPtC73vW5lFQyJXOz4xRG9bBdpnUlS8D19TzQEYH3mLIvbpkYZIdFkxu3
         +oVITd3bBZFl7Qi5rKilGXdvJyFVswK0m3akfKzVuzf/hN77o5jT8NrEoxxUQIxmJLci
         bexd/Sjc2KruUXWYsHnjhC4gEKDemJy/Lb1GobcxnVb7YAc6WkKFh7av8tT/CRfV49cC
         SRICDBAE9KydVurdHh3Oybvs4a7pEobbS7khX0hjt3WBcGzOyypF22wC3iHeK7DByI7n
         zSlEhKMeciUDLqezO5+ICOZqSy1jYYxuQcBRC5JcGYeCjfqNnP1tcPFQWbH8n1rgzOjC
         W4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from;
        bh=Nf/VpEjm8NvJZPO2w/RQ8ekLvwk31AoOPF2yZ8dLNpE=;
        b=0jdo0tABmMASHmTClRMfY/yIovnqqKP6GEthXu3w6TpIyEglOgB7477ECDS5Qeo+Fd
         yPwSfLJi638Cfmlz15ummUaelPGCT3dnF3HfXSDNTFVUVmIKw8v173FdMbcBvUb4IixF
         eulmz+54AUjUjkgKikFM49FaDdikpEn5D7Z2NQ1XJ5UHXQedF6ZNeKPV6uvXpYsvJYi9
         lB08MfvQbOz7m6+v3L6k1FzU5t1BEprOcduoT0bVHaDZfJYdyA/58gkRFY7eIysmloeX
         D2VydLc0zNguUijhhnKxlEWXDUIFCGt0RKq57uMdKYChf7y2Et6X3msq3Vf6m1jxyZu9
         eIBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e64si36480483qtb.388.2019.08.09.06.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 06:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw4Wg-00032P-Hn
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 09:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hw4WZ-0002zV-If
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 09:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hw4WY-0001Pv-IX
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 09:01:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1hw4WY-0001OX-D0; Fri, 09 Aug 2019 09:01:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0D63730BEBEE;
 Fri,  9 Aug 2019 13:01:36 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CDEC19C70;
 Fri,  9 Aug 2019 13:01:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-YjLA25wPBgWOB_c2fV2o7C8n=1-uUVe6xgiP=j5+Fgw@mail.gmail.com>
 (Peter Maydell's message of "Fri, 9 Aug 2019 11:32:51 +0100")
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-8-damien.hedde@greensocs.com>
 <CAFEAcA-W0SaaGbUnGZ0b61ngxKY8R9xjwGXeN+=MaUi4bMDgNg@mail.gmail.com>
 <20190808154219.GK2852@work-vm>
 <CAFEAcA8L2YVMCu3Gb+eQTDfCpgVwA_WwVPrqPLV2iQ9rZ4HuTA@mail.gmail.com>
 <f400248f-7a3b-83e9-3355-77de359e3f43@greensocs.com>
 <CAFEAcA-YjLA25wPBgWOB_c2fV2o7C8n=1-uUVe6xgiP=j5+Fgw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Fri, 09 Aug 2019 15:01:30 +0200
Message-ID: <87imr6332t.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 09 Aug 2019 13:01:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 07/33] automatically add vmstate for reset
 support in devices
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
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7ac2qmjedro

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 9 Aug 2019 at 11:29, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> One way to keep the feature without copy-pasting vmsd would be to add
>> a new vmstate_register with an additional argument to pass the base
>> class vmsd section and handle the whole thing there.
>
> If we have a vmstate section which contains no actual data,
> only subsections with 'needed' functions, is it migration
> compatible with previous versions in the same way that
> tacking a subsection onto an existing function is?

Not now, but we can make it happen.

Right now, we first send the VMSD "header", and then we sent whatever
data is in it.

We can it make work the way you want.  Not sure if that is the best way,
though.  Sections that can(or can't) be there make just reasoning about
the stream more difficult.

Later, Juan.
