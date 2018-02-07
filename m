Received: by 10.28.71.27 with SMTP id u27csp208866wma;
        Tue, 6 Feb 2018 19:59:53 -0800 (PST)
X-Google-Smtp-Source: AH8x225MUEIOAC1NCPReX+ybKQS19Q06na3Mp0ZncC90RFUW9GLezEIqeI6GFC5SvZ+PTSJe6MDj
X-Received: by 10.37.145.12 with SMTP id v12mr3155627ybl.134.1517975993765;
        Tue, 06 Feb 2018 19:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517975993; cv=none;
        d=google.com; s=arc-20160816;
        b=knbpIs0m+oVNR2li7u4AzUBQ4Daw1+EFbS9gKba7FX+mMy7sm6dkhoOoP3trRoHHw9
         cnBkbC46bkCoqTRd+Flo3IFBsqQ3npMUrAPUa+QrSu5hMrTncqXkIruAZtC1JBnFY0S6
         nHq0W2quK1hPCERTiGSND9Mmd/EYGNTu8mK3h68uG19kKdkLTJoYKAQldKzQ2IlHO4r4
         fQJj+cz0Yqx+hBrCqMzD87OBlsQbH5Y0f2aunwPw7waYfdsK+wyCPMMGTgMXLb30M+bD
         3L4UfJVJ3hWLq+mRRS7JNe7vEIW/Yf4590gmezOE7BC1s5h148u2/uvY63JTDaOc3dkX
         bvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=bWgAIgfG3X61MCxr01v/8ZsMFOLYARvBa0OfaEn8ZA0=;
        b=mzT8wRyrajWKTv+FbdbtIh/JeUugMgr4LXid6yeJPnD5zQ3J0cJRIu41i5Ci9eTsEn
         7rjZg//gmH+hIOtH+Di90Nzz+6RvdztAxJs0ttmDPGPZVi5pVL585YQK2XbUJGtoH6MH
         ik+rck4DLDjplcm6QqOc17R3lNSkRys4Y9ZNr37JQI7lasax81Qd0MOZJEJGPFLXIH8A
         JIhIIL7K5MRSBNa1gurAJsXTFQo8AU1V078JZ2iW9yQ5igZJ/rP7mw+JLpNUCIrcXz8h
         U47NYWgRtRJ3/DrpVaOkMlhl6lJFQdXP7KOjZ8fD2zunTnmBCQCITO3pkoGTWJZjjQH2
         z5Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZvxKjroU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si97690ywf.683.2018.02.06.19.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 19:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZvxKjroU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejGtl-0004N2-83
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 22:59:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejGtZ-0004Mh-Q2
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 22:59:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejGtY-000582-NQ
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 22:59:41 -0500
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:38728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejGtY-00057y-JK; Tue, 06 Feb 2018 22:59:40 -0500
Received: by mail-qt0-x22f.google.com with SMTP id z10so5262656qti.5;
	Tue, 06 Feb 2018 19:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bWgAIgfG3X61MCxr01v/8ZsMFOLYARvBa0OfaEn8ZA0=;
	b=ZvxKjroUj99KYz3Hl/lElSETvEY8bAXV1+YvYTFN+e+w57MQGqm2rU2oNuFmKE8cHt
	RTvHi5QfGQtgRhYAJuI26KY8R8inRY1TB4kKjg9y6e5s20bdJMD0kQO7tp1Gevr4lwC/
	AmajHfb4Fy+hdPtgHCdCqvMJZmiXhhRBg4rWlFCH5hBDGFrGj0ctxXFm9egk3LvLvkls
	ln45EyoPKJfAnHOltOiBGj2QQSzY3H+aHvoMS37TfWbUj0q5vblYEvBgxybEZU7tUswL
	80XUhep0KapqOn5KT1tE1ijYmZDZlkkTbxDX9hWHvOk034qm3hgBXuoIhhm3L6QTW2Bw
	gdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bWgAIgfG3X61MCxr01v/8ZsMFOLYARvBa0OfaEn8ZA0=;
	b=hc9IbbBbPqORtoZXpInZL/W2bDWmPXYkw18ImnJKVWNnpk5oDZc7ifRyjdOzMQxzJf
	Vqg7lYvbCf30M2WFmSemU9tSJFOU0H8yySDq/K4/AnMQm5xxTHaZQzYTTjG2qI0OhRzX
	A5T6mJO74LC3RtOs5hARay51D9cNyIMBVEcScHUCSrY9qdge5kcJMTdFHFZrMvbpa1f4
	hkfwt2LbaHMA675k1YwdLEXvqh7YayAFB9s21oMKyAUbpX4S++WNSmnpo/phyWR13tI4
	W1XtNk9cFJMfa18djirqtDj3OUbxD+8mNnjIA8a56/1m5v8280b727FXTCJRhhl3DWBZ
	7BHQ==
X-Gm-Message-State: APf1xPCeviTZSrORVFYeDztawKmRTGArBHNmkr7UilYJb+W52oL49uwA
	sx7duDd5ddcSOw3ij0k/g2b+8DD1KIDMuxrnyTg=
X-Received: by 10.200.57.3 with SMTP id s3mr7477906qtb.328.1517975979726; Tue,
	06 Feb 2018 19:59:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Tue, 6 Feb 2018 19:59:39 -0800 (PST)
In-Reply-To: <11f684c4-9159-0e4e-5990-635194b32d65@amsat.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<11f684c4-9159-0e4e-5990-635194b32d65@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 6 Feb 2018 19:59:39 -0800
Message-ID: <CAHQ1cqG85MfZpSxUMDxrZj9sCmKizghQZmFsotpPgq+ZwWuEag@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: Re: [Qemu-arm] [PATCH v4 00/14] Initial i.MX7 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F/JIgR07jrgf

On Wed, Jan 31, 2018 at 9:03 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Peter, Andrey.
>
> On 01/15/2018 10:36 PM, Andrey Smirnov wrote:
>> Hi everyone,
>>
>> This v4 of the patch series containing the work that I've done in
>> order to enable support for i.MX7 emulation in QEMU.
>>
>> *NOTE*: Patches 1 and 2 are provided for the sake of completness and
>>       are going to have to be adapted once Philippe's SD changes
>>       land in master. As such, they are NOT ready to be
>>       accepted/merged.
>
> Peter:
> Since my series are taking longer, if this series is ready it is
> probably easier to apply Andrey series first and I'll adapt my SDHCI
> series after.
>
> Andrey:
> I only plan to keep the sdhci.c file generic (dealing with quirks) and
> split out the imx usdhci code, similar to this patch:
> https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg01265.html

Yes, I understand that, but I still am not clear how you propose
dealing with the fact that i.MX specific read/write functions need to
call similar functions from parent SDHC class. Are you planning on
adding overridable read()/write() methods to SDHCICommonClass?

Thanks,
Andrey Smirnov
