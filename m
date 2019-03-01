Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp654152wrx;
        Fri, 1 Mar 2019 05:59:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4sxW4dMXoDvg9nGwQPi1sax9QsnoXexAZFIW5EecCO3iSWjFgyN77k11Bzghy3Il1DtOk
X-Received: by 2002:a0d:c644:: with SMTP id i65mr3685166ywd.68.1551448762764;
        Fri, 01 Mar 2019 05:59:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448762; cv=none;
        d=google.com; s=arc-20160816;
        b=wPM9ka6/OFa4eRh3s2rB9iL3e79b0Qf+2KLS0spC9OdKPNL8uZwTlodXCQJ7+SwFHL
         wOXzTeDvmdshIgB2ZfOw/78+n4Iumu03R9Hu1w1VxftDorimZ2GRpisbWTBoSEEW0Nvg
         kiDucQNn/a0KSOOi1BbP4ZllFwJDO8b1n+kuTvys0+qTkdYDOnwlmMUSQIfza2AAU6Bj
         /AnbNHj9AgJoS0PSBQamS/98UTaJOTadhSa0EUAqf71xhsdJrL4uDdmscWEXlxuKdf9w
         0F4GazYrKO/swSenpCNCW03cu/gk/13T/1vHd/WwNVj2W7wk8OckSrDqQEx0BLAIXBSV
         wAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=C8GFkDn4VJ8s0Bo9Slkhp7pLPq65+cmfhznWhnswo94=;
        b=iLBW39zk1H8jYeopTbB/FI/uPrzP+PAvzH/vpw1LVBYWNoMczucv99s4VbH7Sd661z
         S2IvoqfP9Wy1L6kEVSP9SwTplwD3tO6TnGZyzrvyGi3cMnCWI5YCoYUCkz3t9DLV9eKq
         TjFW0+zZLfui94rjW6RjAgDRKYuTWNeLDa0/ia4QEPpx+Wy5b57CfdxOufLhgp7LMVmK
         ukuLgDSb1QxslLBIyJ/LkVL1R6EE8Edt0cA+DxiNOUaLhg5eRfboIX2TDlNq2cW7bPdg
         bH7NveWIPBiRKtEWXGT8ZO6KX+CRnfF3bXAGnvwoy+RpDLe/PSCgb5u0IUi1H+hm+sN4
         O6Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si6144137ybb.13.2019.03.01.05.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:59:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzih8-0003no-7K
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gziY2-0004eF-B4
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gziY1-00047R-E5
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:49:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1gziXz-00045q-MR; Fri, 01 Mar 2019 08:49:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61D1B306D625;
	Fri,  1 Mar 2019 13:49:54 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-56.rdu2.redhat.com
	[10.10.120.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF5BC611D4;
	Fri,  1 Mar 2019 13:49:51 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Auger Eric <eric.auger@redhat.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
	<892e3eb7-66f5-92a3-5891-de8665fc984a@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D6875@lhreml524-mbs.china.huawei.com>
	<d3c99948-2fdb-f345-8b22-03a7e181122c@redhat.com>
	<6f4276b4-c79c-00a0-530e-be72c8093ad1@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D778D@lhreml524-mbs.china.huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f5d04d6d-6e99-ba52-c903-6f59d83eff6c@redhat.com>
Date: Fri, 1 Mar 2019 14:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392D778D@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 01 Mar 2019 13:49:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5tZkW+JnTonR

On 02/28/19 15:02, Shameerali Kolothum Thodi wrote:

> Ah..I missed the fact that, firmware indeed sees an update in the blob =
len here
> (rounded or not) after reboot. So don=E2=80=99t think x86 has the same =
issue and padding
> is not the right solution as Igor explained in his reply.
>=20
> I will try to debug this further. Any pointers welcome.

How about this.

(1) The firmware looks up the fw_cfg file called "etc/table-loader" in
the fw_cfg file directory (identified by constant selector key 0x0019,
FW_CFG_FILE_DIR).

(2) The directory entry, once found, tells the firmware two things
simultaneously. The selector key, and the size of the blob.

(3) The firmware selects the selector key from step (2).

(4) QEMU regenerates the ACPI payload (as a select callback).

(5) The firmware reads the number of bytes from the fw_cfg blob that it
learned in step (2).

Here's the problem. As long as QEMU used to perform step (4) only for
the purpose of refreshing PCI resources in the ACPI payload, step (4)
wouldn't *resize* the blob.

However, if step (4) enlarges the blob, then the byte count that step
(5) uses -- from step (2) -- for reading, is obsolete.

Thanks
Laszlo
