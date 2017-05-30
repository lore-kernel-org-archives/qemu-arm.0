Received: by 10.25.0.6 with SMTP id 6csp1834748lfa;
        Tue, 30 May 2017 07:06:12 -0700 (PDT)
X-Received: by 10.28.165.210 with SMTP id o201mr1810419wme.8.1496153172108;
        Tue, 30 May 2017 07:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496153172; cv=none;
        d=google.com; s=arc-20160816;
        b=iWL8F6a20ii33i2zzM92ogDfZSj0S7P51TU78qbEW5zkSYJiwKvXX2uVo8gA/jZqn1
         PoSyF/5z01BA61jci5j41/Zu509kPz3gP1QuhM1vQ4r85PNvH0f3OtpDdYbNiCkXZa4W
         6ogMzx+qaizkEzqAYsmGR4jue8hHByIUf23TQTVIo1ZBG/xt8RBd3capF5znWBxOSIme
         NNYe4KZc4vVRo9XSgZ1qdYbHBja4TV6+FbNfgWxnaZwSpARzHsXK9ax6gKIK9KnsxFMv
         RbVVJFYul9eYNk6RbaVf3kOTXDAx7TOrhZN01mUwVUzVnyxnuo27h76L+/BCMdSmnTqX
         yYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ikI8DIsdIRtT4C6Xk9xueT4yaZn967Mi/MthX/tgmHk=;
        b=e3sk0xnXNKjvuyZBvGCNsobgJufNZaHpyrIFm9H1Fl4P+m7ycwsV02tjTZHRd1sh1a
         CnDwPoeohFdYcwu1b02eVd4KvyzBNW2qm8FZa9hXHvccqjCkC4UXfuDFHMKz0A6w5dHm
         L2E+cAVXOgEzR8lxBVqs/SMqAN/SftJUZ52WEvrFLoOJGku7JOyTGH/d4lVOHcpB78yY
         69/hsGF80tSp5najicXKoz+BnfgOt2KRWjyQ5dHxdQJPaIh0z999/n4e5QEyzwdm+/D1
         nx7H+WBmNG5GzGjovMX4y3VcAmfofWnu7McCx8PDC5FGRHSMjQW0UeGOEUusd5Uxm4ED
         Jj2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id 2si1628606wro.164.2017.05.30.07.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2017 07:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id e127so101676001wmg.1
        for <alex.bennee@linaro.org>; Tue, 30 May 2017 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ikI8DIsdIRtT4C6Xk9xueT4yaZn967Mi/MthX/tgmHk=;
        b=PXl2HfH014DrEQ3OMIGOUaQjRZ0ll2xnxwxZ8RPCUcQBrriY2+uPF3KnFCQLS96i5C
         kjTc0SFeHbkNrNynMUHse7vI6fQizyrJe/846E3Qy/tAyrBN4YLdD12V1E33rIasn1IX
         cchFer340anMDWHpsAj50uOd7uCf6IucNx9wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ikI8DIsdIRtT4C6Xk9xueT4yaZn967Mi/MthX/tgmHk=;
        b=UxZ7lDdvD4+CcTsAoKA9UEreL6B4/r5kUctsp7giC+0KuLjuReAo0SwgvX+0TRIuvz
         ZUxmHfFaUGOHsYh2hIyVq4scCTJGMVsh23xub+f1BeM/a3h+eNk0v3UAljtNBnLiskwj
         Pm+0a8Y6uklzhyn8PTA+23KBrD5NMjmAAkb6bviGbjJcE13PZwsQMc2+7iqw+wbxGYqh
         P7QmMTF/vyexxLfjqErEByyU6rH9G6N44uMXD3tQd2HK4lo/+qvox0/Z8QKo3LNHQUgD
         iYEExF9HOCuySG8LJ3GB3WJ0KQSDAoaYnoJY1My6pTRoElzmcIz+7D9R07gfXJEEMy6t
         J5ZQ==
X-Gm-Message-State: AODbwcDjnlVHRdYmBR1LMNsn2iMG1Sf8eDQLcWvHh2l1Bus0BhYur2kA
	bdZxuvvUntHh3PGrrtvdaZL3RhSgx2BrQvs=
X-Received: by 10.28.66.23 with SMTP id p23mr1777128wma.38.1496153171833; Tue,
 30 May 2017 07:06:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 07:05:51 -0700 (PDT)
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 15:05:51 +0100
Message-ID: <CAFEAcA9mo3HgVxG3OGAcMQLa4iwsHKofQ8CA8mZik5J2fm6jgQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 00/13] armv7m: Implement MPU support
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>, "patches@linaro.org" <patches@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: eK7nYCWUYj3E

On 25 April 2017 at 13:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset implements support for the MPU in our v7M cores.
> Support is on the same level as that for the R profile MPU: it works,
> but regions smaller than 1K in size are not supported. It likely
> has some missing corner-case features.

> I wanted to get this patchset out to the list before I go off
> on my break; I will come back and follow up on review comments
> when I get back in June.

The patchset has had review for about half the patches, and
no this-needs-fixing comments on the others, so I propose to
put it into target-arm.next.

Let me know if anybody would prefer me to hold off so they
can review the remaining patches in the set (2, 3, 9, 11, 12, 13).

thanks
-- PMM
