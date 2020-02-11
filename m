Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5085743lfp;
        Tue, 11 Feb 2020 05:22:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqze/jGTYW66c/Ocpx4/L7LO4bS8AOLJRquOdTH5WcHdFUqb1ItD+qF8DNowrTx7kX4XajLD
X-Received: by 2002:ad4:4a69:: with SMTP id cn9mr2909615qvb.218.1581427342092;
        Tue, 11 Feb 2020 05:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581427342; cv=none;
        d=google.com; s=arc-20160816;
        b=oo33f/l/fO085Uz1jimaVz/07m2OQS81fdhA3WCuWwa3WD2Fj+3SWLHjJctD8r+cJ4
         E4+ovNgNUcKmN4n4lImjW9li2bMEX+YlUCZ9a8oQVdd0AXn0Y9SxU4O4RciB2kDWEnr6
         BG5vQIn3i7ju4pmngbcB1JH0HlwwL3PSJ4gtaX1+Xg2yVQGTbL/YSLTU1+DYI9+5ylDg
         Daw10mo32x+7YsULDJ+ilAEY/Ps1pm5hgoQv2i++o90+z5IiSy6rd4I6DQvKUPf9m4y2
         ICYq0Zr9ShcIyzSVKb5vIBH1LfhiSjAho+AnA1qtz2hihh+kq6GUMEOlffL9IsRmLvTj
         wagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uMUT90L3M0xQPN7orCe2kyL1JTF22Xnvhs+pYaON+CM=;
        b=lOii1KhyEHlvOKFeFQgzp5My47NkUDU4rMrF1mDSum1wzCMn04gUL9SHDh780qcG/Z
         pRz8noseUJ9t3PJJDoaMG7dVOXIKZSUS/wc+9k+uJcNpNoW9e9GuOlqhqUBX29JXIfW6
         pvYykikpNJkG4YJRB3WEkb5LTRXpxProIk8eHCGiSpRXbTnkVkdN7pc0QBQv119y02fa
         hFL1H+EZ9YriHOCvOK1/9XjKfDRe8bDI9iNo+Vxl9IOWZI8FV1hVHa0A4rD2iavHtpgl
         KNdPKka6rf5dyy/0YAwwnSASMawzl3qdsg2f4PWJy3bvWNgSebNdWCBdF/kSmaXMB2Rp
         ieHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XEQ0XEa/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k63si1971099qke.379.2020.02.11.05.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 05:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XEQ0XEa/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1VUb-00015I-F3
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 08:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j1VUQ-00012b-4k
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 08:22:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j1VUP-0002Ad-3I
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 08:22:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35418
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j1VUO-00028O-Vm
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 08:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581427328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMUT90L3M0xQPN7orCe2kyL1JTF22Xnvhs+pYaON+CM=;
 b=XEQ0XEa/23MvI9RlS9w1S/GwISIbL/JtMg0FgKN45SW2yO4qJY/H5fpy4EIQu4v/u39LP4
 +P83usC0cDtn74QFEBd/sqDt/P4BmMBkOXSt5xq/A+GGoHeVSRx5KG0mbb46UWwWI3bD74
 tPnRrAHzfeXUtVcxFVMvMUYguSoZ2+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-M4X-ewZmPUefhn-WbH6l6Q-1; Tue, 11 Feb 2020 08:22:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC6F213E5;
 Tue, 11 Feb 2020 13:22:05 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F56A26FA3;
 Tue, 11 Feb 2020 13:21:56 +0000 (UTC)
Subject: Re: [RFC 1/2] tpm: Let the TPM TIS device be usable on ARM
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200210131523.27540-1-eric.auger@redhat.com>
 <20200210131523.27540-2-eric.auger@redhat.com>
 <5cbd1960-6138-f4d0-948f-1983cb0f93b0@redhat.com>
 <e69f69c5-40f5-1fe5-f298-129324cc7055@redhat.com>
 <CAFEAcA_TJ5gDMRNK=O-iaqksYL_aQFu7repo7wKi7pGb-A9cYQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <33a8885f-8367-b37a-a18b-564fa73f0504@redhat.com>
Date: Tue, 11 Feb 2020 14:21:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TJ5gDMRNK=O-iaqksYL_aQFu7repo7wKi7pGb-A9cYQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: M4X-ewZmPUefhn-WbH6l6Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, ardb@kernel.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZFqszdjtPRsu

Hi Peter,

On 2/11/20 11:56 AM, Peter Maydell wrote:
> On Tue, 11 Feb 2020 at 08:35, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Philippe,
>>
>> On 2/11/20 9:25 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> You don't need much to remove the RFC tag:
>>>
>>> - rename TYPE_TPM_TIS as TYPE_TPM_TIS_ISA
>>> - rename TPMState as TPMCommonState, add an abstract TYPE_TPM_TIS
>>> parent, let TYPE_TPM_TIS_ISA be a child
>>> - add TYPE_TPM_TIS_SYSBUS also child.
>> Yes I tried my luck without too much hopes ;-)
>=20
> There should be a few existing examples in the tree
> of devices that we provide in a sysbus and also
> an isa or pci flavour, that you can use as templates
> for how to structure the device.
Yes I found some. Thank you.

Eric

>=20
> -- PMM
>=20

