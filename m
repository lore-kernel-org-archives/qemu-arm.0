Received: by 10.28.91.67 with SMTP id p64csp2461244wmb;
        Mon, 19 Mar 2018 03:59:32 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsiKCKMKgMRnkY/UCa6uvU9Ojfp+L6TRZ0lFWRhXQ4j07mkFNNI/GN+mmc+d5UQvpzYHX2j
X-Received: by 10.200.49.99 with SMTP id h32mr17264757qtb.299.1521457172092;
        Mon, 19 Mar 2018 03:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521457172; cv=none;
        d=google.com; s=arc-20160816;
        b=pik9HVNg09auC/zEFw/X+QMhBdzR13ToJPqb6L1X/yD5u0eOcYGIYlEmirTWIXU1ya
         mLeQRQGANAzk4LCnNUpQaSpOXk1kW6tfdDTuSqn74HtcGwbK1k5vgJJv/ianGuVoFjLo
         9VHdaq+dAKyKZiMpB7ky5MPo8pQWZ38h2HnLC3DO+g0y8XwmzH8kcYCkCNwcWDrrS5cn
         hxT6KLj47Ae1eZND2rxOEmHTJsCEdthsr89HUCTW3MZzHbaYFuZzT4OSOOOJnBJyxuGO
         sWWOiWgbTGdpqrr5c+Fjj8MNcFtrd0hh4lGjiIrS4Ask3sFz1MHUc1azA56Zjpb9Qrwg
         wIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=TbvQowtBr/Zz8rWPTfOYrVjJvCyLJChPj7XRgfl6UXQ=;
        b=Pjv9fhQ9G+cX7erwlGYPqi/sWH2WHbb4HQOBfdst/wAZHGlR8uJA//X+97fvDZocvU
         iecrd7qQj7nO2nD2PAVCpm0iQPmkLAGVggMZ1xdCIMhsyE3DNOEJiBr5s+4K3I203xuV
         PUreai8Rkvhg6shTM5iTvSm+aTYGQddce4zj+EXMNAH+N/PZ+xekQK3cfdw61wc/rBNB
         wWiC6YD7NuhhVj19M5IMGhy3aGPseJOFsNkAX9b+vqqGnVW9jDkX0Lu55Y+gCpCE+7s/
         QTN8WXAbYjaFV/LgDmkm3lGkxZ1vaMJrn0OAFHDTC1qAUTi075cMGur6STueX9R+NRJW
         bbaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cUBzbQpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29si2526850qtp.474.2018.03.19.03.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 03:59:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cUBzbQpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exsVn-0000NF-Id
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 06:59:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exsVd-0000N0-0j
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 06:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exsVc-0005Oe-61
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 06:59:21 -0400
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:35011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exsVc-0005OS-1X
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 06:59:20 -0400
Received: by mail-ot0-x230.google.com with SMTP id r30-v6so16917429otr.2
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TbvQowtBr/Zz8rWPTfOYrVjJvCyLJChPj7XRgfl6UXQ=;
	b=cUBzbQpkJOoRvXlprA+crEHXXR5pfJcVjyLkY6fJh/HS8GLbejAcDvy4ICwaZCrJBM
	tvfRt/sL6BreU5Opb1FgXbylbfRyoJQUKLr47zawJEDqh+FjVYQDGMiBNyyqCcIqtOBe
	BSo4agUMuwAu46c5OaU/C0I6Zr0rlkh04DiPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TbvQowtBr/Zz8rWPTfOYrVjJvCyLJChPj7XRgfl6UXQ=;
	b=GRIZ4eUkM3ULQJgwt8sxffmqNhGyobkomWA2uKOzjAfZ9CQYGGQwJddHGVuR1ZRjGA
	v/p+I5imEa7KKkv+ql8FfL+lWgfNg2d8HIALYqzLuVTqv9QPX91o8mlVOGEt4BSBXvnL
	E7awB54hyvXFDrczy+WKsR1eqoHDAmJHhguCgUHQaT43wdEpc/0RVw3coUMnclwoIYmI
	FtFt3Xy+81N74JNn4aCyNfQOPNezunGA70AQv801gAQ9XW5o3rFezPGt+v0Sw2cMj2kZ
	EMxaLTIWPYbEJDoOzvaP7+LvapTRSyMBtJ+iCqldCY7gbYcmn4mMBSdNDEMhQZEk8QjR
	czEg==
X-Gm-Message-State: AElRT7Et+7sGaCBTGMcCmvNLpw3zHWSs26Cu8BnmqimonSbkPi1e/S/A
	PIrhh7+j5VQzVwUgF+qkH7DC4RaYg6yPipkaXt7xdg==
X-Received: by 2002:a9d:40ee:: with SMTP id
	t43-v6mr4324057oti.258.1521457157540; 
	Mon, 19 Mar 2018 03:59:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 03:58:57
	-0700 (PDT)
In-Reply-To: <837c5be7-a153-5a7e-8e2c-dccdb9945a4e@amsat.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
	<CAFEAcA8O7EEhoS83eRLH5bVmog_Qu1tAgUzR6NsE+GD2a7FsDw@mail.gmail.com>
	<837c5be7-a153-5a7e-8e2c-dccdb9945a4e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 10:58:57 +0000
Message-ID: <CAFEAcA974GJpqTCit4wwcC0DESAGtga34pLNnrvZ6kDZ4zaUpQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode
 correct CPU type
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3m0qezZY7gW

On 13 March 2018 at 23:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> On 03/13/2018 06:09 PM, Peter Maydell wrote:
>> On 13 March 2018 at 16:55, Andrew Baumann <Andrew.Baumann@microsoft.com>=
 wrote:
>>> At some point I remember seeing a patch to change this to cortex-a7. Is=
 there a reason we didn't make that change?
>>>
>>> (Background: the real Pi2 has an A7. When I first implemented the machi=
ne model there was no A7 emulation in QEMU, so I used the A15 which was the=
 closest equivalent.)
>>
>> Yeah, we should do that. I'd forgotten about that, I think
>> things just got lost in the shuffle of having several
>> patchsets that tried to change the same things at once.
>>
>> I guess the simplest thing is to add a patch at the end of
>> the series that fixes the cpu type for bcm2836.
>
> Peter, here is the patch Andrew remembered (maybe can be applied at the
> end):
> http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg04286.html

Thanks for finding that. It doesn't apply after this refactoring,
but I'll send out a patch which does the equivalent thing in the
new code. In the meantime I'm going to apply this patchset to
target-arm.next since I'm going to send out a pullreq with bugfixes
for rc0 today.

thanks
-- PMM
