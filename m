Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp845932lfp;
        Wed, 29 Jan 2020 09:48:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJlW6pZMy5tTsP/bDP+EMMYd/ImQYNBrDFu4kbVeIGpHPkFU8ujov+zqFZiiz8XIHgbYGK
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr367807wmg.151.1580320113329;
        Wed, 29 Jan 2020 09:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580320113; cv=none;
        d=google.com; s=arc-20160816;
        b=aFqKXJxMrJuSJ3nnZpEuB6jLMFmfNo8P17+SA99Ytpg1zB56TwmYeo/q6imLJX0rMT
         qODHLkcmXOVAcloR9WrA7aZtH/n9OL7m2KnUCiayUMDepYaCLj8ZyCZIGaCjFmhZrm6b
         y/7LI2ifj4WuPdXG9yIZtzxA3bzx5XQyhsdaDqrxViKb4CytlheKPeSJloVuIxQFEQ99
         YWSmyk4IvDjFYfkoC3HqXExvxb1A/nLdlHSD+jgy6OIMB3Jsskxe3rowhfcKyAppSLun
         J7O0gC2l5745sTKkq/xTcDCb6tTJL0GxjBEzNTVq6JhtTiPEZfmsxkOLiboHoVZ0q08U
         SKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date;
        bh=JriAa+RdEu9YJ9X+dtgBXW4o8REx/oimq2eUKmFJbvk=;
        b=sHG1TO2Hq+eFwa18B+mIm+0bKKk/lwhILKarLU/cd9Lg9l0e7aAR9J/MLQEPeljqgm
         8ohGMw4bQ0yCyJTJOf9w/qaMhWaqJQMDvpTdHmmg91F11Aqef9w6t2p061tYuzhux9sh
         z6LdVJrTr2mfEDOrCRG2Qawv43V75M9YeKCDZ2723o5xK8K9Uwi/eObWW4eyhWz6/VUu
         jZ55JhnO7ScCr42MTI/kywEVfOXQ9X0Mo8fBFIjAjGa6U77JJZaRAjnevTNaWm+04V19
         FmT+SckEIhAtuT0Douc22CgPVdQcZiuDKakr0ndTvt7NoYYeMfqO1x3SZr0pUQ5FWzWj
         gTmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [152.66.115.2])
        by mx.google.com with ESMTPS id k17si2150461wmj.195.2020.01.29.09.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 09:48:33 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) client-ip=152.66.115.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E86E6747D5D;
	Wed, 29 Jan 2020 18:48:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 697A1747871; Wed, 29 Jan 2020 18:48:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 677437476D5;
	Wed, 29 Jan 2020 18:48:32 +0100 (CET)
Date: Wed, 29 Jan 2020 18:48:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
cc: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
    Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
In-Reply-To: <300bbdee-004a-9d1a-3692-f32793d44523@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2001291841260.40686@zero.eik.bme.hu>
References: <20200124170325.30072-1-thuth@redhat.com> <555bf60c-0d72-3ea3-f095-8c6c7a621deb@redhat.com> <300bbdee-004a-9d1a-3692-f32793d44523@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1156086865-1580320112=:40686"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.1.29.173917, AntiVirus-Engine: 5.70.0, AntiVirus-Data: 2020.1.29.5700002
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%
X-TUID: TG8mcjEth+ya

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1156086865-1580320112=:40686
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 29 Jan 2020, Thomas Huth wrote:
> On 27/01/2020 18.31, Wainer dos Santos Moschetta wrote:
>> On 1/24/20 3:03 PM, Thomas Huth wrote:
>>> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
>>> for various non-x86 machines. We can use them for a boot tests in our
>>> acceptance test suite.
>>>
>>> Let's also make sure that we build the corresponding machines in Travis,
>>> and while we're there, drop the superfluous --python parameter (python3
>>> is now the only supported version anyway).
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
> [...]
>>> +    def test_ppc_g3beige(self):
>>> +        """
>>> +        :avocado: tags=arch:ppc
>>> +        :avocado: tags=machine:g3beige
>>> +        """
>>> +        tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
>>> +        self.vm.add_args('-M', 'graphics=off')
>>> +        self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
>>
>> Hi Thomas, let me check one thing...
>>
>> The VM will be launched as:
>>
>> ----
>>
>> ppc-softmmu/qemu-system-ppc -display none -vga none -chardev
>> socket,id=mon,path=/tmp/tmpvdokyvs3/qemu-41146-monitor.sock -mon
>> chardev=mon,mode=control -machine g3beige -chardev
>> socket,id=console,path=/tmp/tmpvdokyvs3/qemu-41146-console.sock,server,nowait
>> -serial chardev:console -M graphics=off -kernel
>> /tmp/avocado_g3uccfo5/avocado_job_61gglyz3/02-tests_acceptance_boot_linux_console.py_BootLinuxConsole.test_ppc_g3beige/day15/invaders.elf
>>
>>
>> ----
>>
>> Note that it passes '[..] -machine g3beige [...] -M graphics=off [...]'.
>> I suspect you wanted '-machine g3beige,graphics=off'. am I right?
>
> No, the -M graphics=off was intended.
>
>> or
>> QEMU will interpret the -M option as a parameter of the already set
>> machine type?
>
> That's exactly the case.
>
>> or the -M overwrites -machine, and because  g3beige is the
>> default type it just works?
>
> No, the default machine of qemu-system-ppc is mac99.

I think you're wrong about the default machine type:

$ qemu-system-ppc -M help
Supported machines are:
40p                  IBM RS/6000 7020 (40p)
bamboo               bamboo
g3beige              Heathrow based PowerMAC (default)

g3beige is marked as default and seems to be created without any -M option 
but having two -M options e.g. -M mac99 -M graphics=off creates mac99 
machine so multiple options seem to work as you described.

Regards,
BALATON Zoltan
--3866299591-1156086865-1580320112=:40686--
