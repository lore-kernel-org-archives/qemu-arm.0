Received: by 10.182.158.201 with SMTP id ww9csp883561obb;
        Sun, 29 Nov 2015 00:50:43 -0800 (PST)
X-Received: by 10.141.23.195 with SMTP id z186mr6583880qhd.52.1448787043469;
        Sun, 29 Nov 2015 00:50:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w76si13017338qka.0.2015.11.29.00.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Nov 2015 00:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2xgx-0007hb-3v
	for alex.bennee@linaro.org; Sun, 29 Nov 2015 03:50:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2xgv-0007hU-Ai
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:50:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2xgs-0001gS-33
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:50:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a2xgr-0001fW-Pa; Sun, 29 Nov 2015 03:50:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id BF9F58E22F;
	Sun, 29 Nov 2015 08:50:36 +0000 (UTC)
Received: from [10.36.112.28] (ovpn-112-28.ams2.redhat.com [10.36.112.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAT8oVfu022625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Nov 2015 03:50:33 -0500
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
	<BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
	<CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
	<CAFEAcA86U8yuTA7w_M5OsJOGdYm49+MqtXP7y09QDXTzKyVzkA@mail.gmail.com>
	<BLUPR0301MB2034372751CF518EE0A3067B9E050@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56573913.2020407@redhat.com>
Date: Thu, 26 Nov 2015 17:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <BLUPR0301MB2034372751CF518EE0A3067B9E050@BLUPR0301MB2034.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: =?UTF-8?Q?Gr=c3=a9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Jan_Petrou=c5=a1?= <jan.petrous@tieto.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] RFC: raspberry pi / pi2 /
	Windows-on-ARM support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OCkN4zV9NYGu



On 25/11/2015 19:14, Andrew Baumann wrote:
> How does this work out with object_property_add_alias? It can fail
> and returns an error, so it should be called from realize, but it
> adds a new property on the object, so the property won't be useful if
> it can only be set after realize has added it.

If you know it cannot fail, just pass &error_abort and call it from
instance_init.

Paolo
