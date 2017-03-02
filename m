Received: by 10.25.0.147 with SMTP id 141csp349946lfa;
        Thu, 2 Mar 2017 08:05:28 -0800 (PST)
X-Received: by 10.31.201.66 with SMTP id z63mr2721427vkf.16.1488470728386;
        Thu, 02 Mar 2017 08:05:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h15si3334669uab.121.2017.03.02.08.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:05:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTEL-0003eu-Tn
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTEF-0003ei-Lx
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:05:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTED-0005nS-Ux
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:05:19 -0500
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:34848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTED-0005mM-OX
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:05:17 -0500
Received: by mail-wr0-x22f.google.com with SMTP id g10so55720951wrg.2
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Kbj9JkJ3tV5bC5sEK72AMkdBrlIHulCVJnqYub7Q6h4=;
	b=Zc7qVzkOtTzlpsMEIAtt1yyUwt9dLMBDD+4jNJEiuuNOCf3/TFHXRztVFEFFmB9OpV
	LiMuFy5Qvqi8ChF4/DQNE9HiIv5qcNpMDRnkokr7XMgnmWHqPB+/gf6IVEAYwtf+YMhW
	T6A6g/ranZtGLGnXtbhK18N5gzu+LUscWN2FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Kbj9JkJ3tV5bC5sEK72AMkdBrlIHulCVJnqYub7Q6h4=;
	b=QZ3Wkr1GFKbAMkVZ7an4MQVZTMpF73uq6nwxvc8dpZzQQYixDsE27M72NNdB/VwAYH
	v+KCiMmkVSjV6eYtWnGQ3mn7BigyXWd3n0hCXXYH7egwsnuBw25pPk3txyPyZ1HRqyIi
	RbH04MVEeAY/MW7GeYNkhAWq2NjQGJzZgQaKbdzSEe7FjXacGcsn77eadZbdVFSVG8sV
	sLAVXARqgUi4gvDYvzhOYYFdMXbEWqledhAdorOER/+3bsn/hH+y89BGZf7F3bTO4Zy/
	la1QHYW3fJ4m9RXvNdcVjAodedZ9FP/cXVNv2zz0Fkv2W+7WMA17sh9a0NY860r3cVer
	hQnw==
X-Gm-Message-State: AMke39mwcp7D4/ItsUIgaCFtpAPnGtzT3jyzqSt35Cs0Hxrme1DWK9RmLF4L33z4+QB64hTu/me70LmHnV1bAW69
X-Received: by 10.223.169.45 with SMTP id u42mr12478438wrc.187.1488470716418; 
	Thu, 02 Mar 2017 08:05:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:04:55 -0800 (PST)
In-Reply-To: <DM5PR03MB28272ACE93520F5462B9EAB19E560@DM5PR03MB2827.namprd03.prod.outlook.com>
References: <20170228215801.10472-1-Andrew.Baumann@microsoft.com>
	<148832000677.258.3665878022537430417@0e2666bad730>
	<DM5PR03MB28272ACE93520F5462B9EAB19E560@DM5PR03MB2827.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:04:55 +0000
Message-ID: <CAFEAcA91A+RcpBts7dR-puzT6LTpY-GQ_5q=agDe+P6vkmX=0w@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] misc aarch64 fixes for
 Windows
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"famz@redhat.com" <famz@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lFR/KKF17hCq

On 28 February 2017 at 22:22, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: no-reply@patchew.org [mailto:no-reply@patchew.org]
>> Sent: Tuesday, 28 February 2017 14:13
>>
>> Hi,
>>
>> This series failed build test on s390x host. Please find the details bel=
ow.
> [..]
>> /var/tmp/patchew-tester-tmp-64adnjjr/src/target/arm/helper.c:931:23:
>> error: =E2=80=98pmreg_access_ccntr=E2=80=99 defined but not used [-Werro=
r=3Dunused-
>> function]
>>  static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
>>                        ^~~~~~~~~~~~~~~~~~
>> /var/tmp/patchew-tester-tmp-64adnjjr/src/target/arm/helper.c:917:23:
>> error: =E2=80=98pmreg_access_selr=E2=80=99 defined but not used [-Werror=
=3Dunused-function]
>>  static CPAccessResult pmreg_access_selr(CPUARMState *env,
>>                        ^~~~~~~~~~~~~~~~~
>
> Oops, these need to be protected with #ifndef CONFIG_USER_ONLY... will be=
 fixed in v2, but I'll wait for any other feedback.

I fixed up this nit applying the patch to target-arm.next.

thanks
-- PMM
