Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5089378wrp;
        Tue, 17 Sep 2019 04:01:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLnvw4zxTL4LsXC7v3rbJHmTsUEAOBsI5WZb+ti9ksm6WOBBTTpXSUfHXLydgrNdoUuEkl
X-Received: by 2002:a50:9fce:: with SMTP id c72mr4021812edf.166.1568718076195;
        Tue, 17 Sep 2019 04:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568718076; cv=none;
        d=google.com; s=arc-20160816;
        b=DpqqupPgDIbkHa/2HX8cDNijL+UiLPoVl6dqedeLQc//CaggPyUstxnD8qm8bHkgT9
         19ymtk7Tgw7lciliePBEZNMud1m5AinJcpjR48rVZCn9qdIQ0PLphsCl1vsiBnYEsUrF
         awCwWF8S3YGMK7ctZI8C/uC9WvDCIjBLNgljlPfcGSV687kVfyT39KRyLaVn5KpfnCvE
         R74ZboVfw3zP029hnvCpoOowxMSCosLop3HPZzAIXlhTK3GpAkJU5/4eMWICxWufaDJH
         yA7Kr3eTfyq988EEUu6kgxlg0KUjR7uL4mzQWs6EkuiRriKJ0kNldx87eNj8u7axCq3B
         GVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=XbSaIn7JS0lItl2+6ikN4fzNiVtuz3ELWXGjpEgGj28=;
        b=OiB060Cz7s+x0YAHFd9cIwMb/DHwmZaGdL3PhhELFyEXPBiD46Ys4q4JD7DnS7jOQP
         cRaDyCRZ+zcmgOzKlZEk4cm8phJ5lrdKZ/1Ift3NOCxM7bRIEdv0jYMF6CFu19z/zKz6
         wzNNE6ZCPLWeEwWsLi/TyiyR3nsHB4qM4Ksb7mfrnNNUf+A447mFLAEnz6ES9J3yDUuI
         /U+qHphK0BoKh2W7fYR1Fx6mHNQ2IBrsGga23p7Ibf4cews4dE/FBfI9Rddp5mcNdT5t
         IsU2oj0K1M3GB393bA9+TdIZT/LFxXjOuWHvzYqNtibDcyvWNvDZRbE23uEmZNS3DPOt
         5MkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si855546ejw.399.2019.09.17.04.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iABEP-0001cG-IN
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iABDx-0001Yq-QM
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:00:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iABDv-0004SS-Uh
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:00:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59816)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iABDv-0004RR-J8
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:00:43 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E8E537E80
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 11:00:42 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id j2so1181297wre.1
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 04:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wSzNTKefRTNv6dxVX888ROxgz8neOc/3d2LLBCrP1Zo=;
 b=apurFV5Rd2CjbezfoBKu6NQ3eoxQK9BL7kPDidkzNDjrhKO+VKqJ2vSvfyQGFenFSX
 7pqGv92usJ7B1OlKb3aQliLX0qhBERkXwm7NRh9ljXBMg00oB6n0SprwtsrToTeMsS7a
 I7EQ0fSy1R9dQj4UNp6uPvie3O2omt4dEl1i+CcuA9bECdyWA+pKNmaxmbuqxS/TIgBj
 WmgIwB3eERt7eIvAnWUWo7n9/digPXVkp9XC183EhrUYsHHCghElmU+avuIzEtZ0LSCd
 PuouNXgaWDWIqigw1URzbkZ1gPG9+yQ+HrASHtekNRQ15CRoxZFS7QZFhqkRHsqDeVMN
 kU0g==
X-Gm-Message-State: APjAAAUCLYwyflUPVFTDcMmg/mJesiYJNyBfuAs/+1+J6pVhlYbkpKmP
 u+27ReJTS2J6xqnsE2UcozzwaAVvbKNKM0MmPg4XhILn4cQS5gBAGvuaKuULbrzirn73ywEb3UY
 tOMjut8Z+D0Pg
X-Received: by 2002:a1c:7914:: with SMTP id l20mr3023776wme.155.1568718040917; 
 Tue, 17 Sep 2019 04:00:40 -0700 (PDT)
X-Received: by 2002:a1c:7914:: with SMTP id l20mr3023730wme.155.1568718040640; 
 Tue, 17 Sep 2019 04:00:40 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id h7sm2074263wrt.17.2019.09.17.04.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2019 04:00:39 -0700 (PDT)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <551745c2-2579-9ce5-4aa4-536c37a1ce45@redhat.com>
Date: Tue, 17 Sep 2019 13:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/17] Fix usage of
 error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FF+dutwDPnq9

For some reason your email client escaped incorrectly Daniel's email:

  "Daniel P. Berrang=C3=A9\" <berrange@redhat.com>

Which makes my email client very unhappy (Thunderbird):

There are non-ASCII characters in the local part of the recipient
address "Daniel P. Berrang=C3=A9 <berrange@redhat.com>,
qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
qemu-s390x@nongnu.org"@d06av23.portsmouth.uk.ibm.com. This is not yet
supported. Please change this address and try again.

Neither is MTA:

An error occurred while sending mail. The mail server responded:
5.1.2 The recipient address <qemu-s390x@nongnu.org@d06av22.portsmouth.uk.=
ibm
5.1.2 .com> is not a valid RFC-5321 address. r28sm2465872wrr.94 - gsmtp.
 Please check the message recipient
""qemu-s390x@nongnu.org"@d06av22.portsmouth.uk.ibm.com" and try again.
