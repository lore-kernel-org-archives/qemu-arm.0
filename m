Received: by 10.182.158.201 with SMTP id ww9csp2582504obb;
        Wed, 25 Nov 2015 01:11:52 -0800 (PST)
X-Received: by 10.31.130.6 with SMTP id e6mr31381599vkd.97.1448442712796;
        Wed, 25 Nov 2015 01:11:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k145si22703310vke.91.2015.11.25.01.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 01:11:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:43995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1W7E-000311-FC
	for alex.bennee@linaro.org; Wed, 25 Nov 2015 04:11:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1W6w-0002Vi-01
	for qemu-arm@nongnu.org; Wed, 25 Nov 2015 04:11:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1W6v-0007Qj-8o
	for qemu-arm@nongnu.org; Wed, 25 Nov 2015 04:11:33 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1W6v-0007QY-0X
	for qemu-arm@nongnu.org; Wed, 25 Nov 2015 04:11:33 -0500
Received: by vkha189 with SMTP id a189so30317703vkh.2
	for <qemu-arm@nongnu.org>; Wed, 25 Nov 2015 01:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JAWaijSbYYcNoAVhEY8cTG4foFWMnKvnYi4ztr3tPwc=;
	b=aXClIEnVGkJdf8EkN+QwIZtEHVIBhUtjaIv/bHa2n9yQfnBjQyTVjWIOLQJxhgIOK+
	1uCJwxWyo+xlzxoXYxojo5UHx2FJybtpdbc0D4U7wWuI2mX+mkbJ4G9cGLv+IM7p6C2H
	xjUNA/BYXzp+FzYX5dt00ZxjtR+hG+AcnQ3tpQhlsjEU9gC6An3njyxPHXrp5DxAbWVg
	JJnhNSws2TRpsJ1/+TeylvQGREKHjTP0OyXsbPyQDUE1qeNJmBIH940LwVPfNuDW8B+I
	R9DpHNU78ucEjmPYbHrU3VTcrOK9Ommwe4rCoe05h/mxEklF8Y700E7DFwqDH3NEfcq3
	3l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JAWaijSbYYcNoAVhEY8cTG4foFWMnKvnYi4ztr3tPwc=;
	b=Ymk63CBTRssoRzEPykO78jDYiPg272EuQQr5ALAzctGMVxGUOZLxM+QF7OSSmproaq
	3kPNrJZ6FmMQ0dEAshuFQq4NGandpYZYPeFzYcDf0AWmhT1+yxQV/tDKNhN+OxBIVHxL
	WtlaMgkxcFPjUZm4YAHQZE2bmPW1VTbjx/vLcL9stpzHX4frke40CKX7Jb259tHwfpar
	KiMIzZzEmZ4UAhHV1YyTXMpZdUHvM38MSZE/XIutGghcJgNAfj3a2malJbH4u0+JrhqP
	uhj3mkP36VutIpkk7tWIo8aWHs6GBOzScsiqMFxSlbYcu5vY1FFRqAChlfBp0KVWkOEU
	6ZAQ==
X-Gm-Message-State: ALoCoQmn0AhJ1bSWwOX0EbyKnT68RLr3pJClQ0hOFotG+3loJN9g7Joipuwsc4YvgJHnSQTisIWT
X-Received: by 10.31.194.201 with SMTP id s192mr32342027vkf.92.1448442692577; 
	Wed, 25 Nov 2015 01:11:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 25 Nov 2015 01:11:13 -0800 (PST)
In-Reply-To: <CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
	<BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
	<CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Nov 2015 09:11:13 +0000
Message-ID: <CAFEAcA86U8yuTA7w_M5OsJOGdYm49+MqtXP7y09QDXTzKyVzkA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::234
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>
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
X-TUID: mO8UibwRF3UA

On 25 November 2015 at 06:04, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Tue, Nov 24, 2015 at 4:00 PM, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
>>In general, what's the guidance on what belongs in object init vs. the realize method?
>
> If it doesn't depend on property values, it goes in init. If it does
> realize. Top level connectivity (e.g. connecting to UARTs are initing
> drives) generally are realize.

Also, realize has a mechanism for reporting errors (the Error** argument)
and instance init does not, so anything that might fail must go in
realize.

thanks
-- PMM
