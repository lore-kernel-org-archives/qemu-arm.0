Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp476194wru;
        Wed, 25 Jul 2018 02:13:19 -0700 (PDT)
X-Received: by 2002:a24:98d6:: with SMTP id n205-v6mr3660101itd.44.1532509999013;
        Wed, 25 Jul 2018 02:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509999; cv=none;
        d=google.com; s=arc-20160816;
        b=KU8Y0YGVk4eid/4UjuNrj9oJQqa2yhdFf8c0s/cv9Pq1r75p8Wrs/aoDqLvChpoJ6Z
         YIGYVPfJaLdwRJ6k/vBR8Ym86fjghtKUBlAxj4GjACiVf2aIfG/Mjrj8rdpgwmE7ie3d
         mAyiZpzfGYVmFmkK1g+Y2a+XlPyHAJT4RIdero34TB4f3DxVdF6zssEbop5ays1/U2qW
         wAfTdLPj1d3TlZE3hPNnWNkaeaPf4A2t3CQeb2a3eQnox/81JZzbjuLYgGjOHbgUwOHt
         PiQjb0nh0xBPqjKdyZvZbvZe+7C8nCRSXJ8CfIrr0RvG01ql0cnDt5JUQLQp+X1soL83
         FGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NZ8OVj2uouoUmo+JFNRZs7S3Ohug2RV/x9NKJ9YKN8U=;
        b=x+oNLLAfbqufSF4Scenrq8IdIrDYOpucsRDlmKbRl/PHkXGPR6O3f87XbWNVZiPiau
         PFHeh4KlqLymLk+guyDwiVW4MEkBDJ2xCBn5+iUrDVr0gSiH6z2f00IN7sS+31dp4b/R
         UlenpdXxXq9zTgMVBZh6raAuxtqB2S/cBaAwFkVPfUSGK3FeOIweCaFXx6DMaPMlq7Gr
         5eHDDrGrRV3pHlhb2WSRzjH5FkKLLAtdPAPhMV3GRUEN8sjqJTuWciz0QobhWYmhn6B5
         YS+iGS3IMmaH4eIfpPxRIO6wBu2IMbpUDD2Wok6VJskomS6R+ZLqvQjX8hzAQQ840YrC
         jrtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eB9ZBTV0;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 143-v6sor1524402iti.10.2018.07.25.02.13.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eB9ZBTV0;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NZ8OVj2uouoUmo+JFNRZs7S3Ohug2RV/x9NKJ9YKN8U=;
        b=eB9ZBTV0TU2YSAwhDHR+2dNhgh/LCr6+EVbU6DgbKI6TUaAyYn7zBlsLIXrbAMacFW
         G2Ofkh6ymV6Zyk8ozXps8A8hZERIUH6AMrFnR7qIxlmDw9nVEQChBo3saHZXpNS1y6Ji
         9o2hoiM/VZi1kjsrYN8EqEghhRwWQAiP5r2h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NZ8OVj2uouoUmo+JFNRZs7S3Ohug2RV/x9NKJ9YKN8U=;
        b=UyJMyiQ8JeE0aHci8TqWC45SEfhIQi6Tznm/eJkGTHawmTxFw5ZkwKQXjjAl4Pcm9i
         j7S8FIpxZbtqlgkiT55IS524goLCONbLV5lakNYaaGEenwTNmlow0YH8v2YlgA7CZYnY
         1oqOJnh+NhhIbQRcz9Vm/iLVyhWrQnMuiU37gYnAaDivAzCWJNrVRyHHpaszY3gjxf55
         MG+fg98ORJcbhOTQxQQp8f8gbjBznf/LaNvu+WQBnC7Vc2u1intOIv+ANMUNj31jVBBZ
         ZoBMeXw+7EBUv7gdp6VO0zJJ19mFO0S9v8ETmkrBctkYPV7fadaUVn6SQE6zuAsKVILa
         lLfA==
X-Gm-Message-State: AOUpUlFM1qes3vLvsqD2nvOzNCyFramLFa5AngM2fk7O9NJ2K3vfQQC7
	yuMoAbV4fo/f5nxmaZpX0siQs+n8jOpVzHvGJWriaq5p
X-Google-Smtp-Source: AAOMgpdT8sHhnRwL1U44a8q8rnvXgZ7ZlCCCuaUSoNuf05zSwHlUDp53Jh3bTXZj4HW/dUMwGunV0WlSWXIVoQXwu1k=
X-Received: by 2002:a24:d7c5:: with SMTP id y188-v6mr5508484itg.50.1532509998657;
 Wed, 25 Jul 2018 02:13:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:13:18
 -0700 (PDT)
In-Reply-To: <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 11:13:18 +0200
Message-ID: <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3iwxggfA2FfS

On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrot=
e:
>> On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>>>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>>>> run on KVM and execute virtualization workloads, but we need an
>>>> environment as faithful as possible to physical hardware, for supporti=
ng
>>>> firmware and OS development for pysical Aarch64 machines.
>>>>
>>>> This patch introduces new machine type 'Enterprise' with main features=
:
>>>
>>> The 'enterprise' name is really awful - this is essentially a marketing
>>> term completely devoid of any useful meaning.
>>>
>>> You had previously called this "sbsa" which IIUC was related to a real
>>> world hardware specification that it was based on. IOW, I think this ol=
d
>>> name was preferrable to calling it "enterprise".
>>>
>>
>> I couldn't agree more. However, IIUC this change was made at the
>> request of one of the reviewers, although I wasn't part of the
>> discussion at that point, so I'm not sure who it was.
>>
>> Hongbo, could you please share a link to that discussion?
>>
>> Thanks,
>> Ard.
>>
>
> V1 discussion here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
>

So who asked for the sbsa -> enterprise change?
