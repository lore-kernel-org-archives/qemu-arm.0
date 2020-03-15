Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2210347lfc;
        Sun, 15 Mar 2020 15:16:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt4ulV89aj80VzywcBQl8cC51Laum6PePnkjKhhi+H7fHc+gw296XumIq+1ZiLkQM0O7bX6
X-Received: by 2002:a05:6402:176a:: with SMTP id da10mr23784205edb.195.1584310605923;
        Sun, 15 Mar 2020 15:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584310605; cv=none;
        d=google.com; s=arc-20160816;
        b=KHDtmmoH+BYUDFCzWPR2Qe1u2/kauPsJhYpGWXxNvV3npN03gjnsF37AfmyPT5WVC4
         hrlqT3Vua1Km0MxwNfppfk2PU/yle9JRCM29pmhH2EPb25hfgu7rUTImPisCE3uTD/52
         UXOsA9Jht9l2uUSHUx9RZdtVEykOb5QFUSYlwjQcy3YefDPziKcMlFwNHv9TIZkBZ4W/
         Ud3rJROXriqt6SqrzYm/irqedT9T0DBBeL1O+knj7PksxIhmYOL7/pqZakVPtcE9mWKv
         0KPSfLbX1AdO75mJw8V6AW5IrSygHlLC3n3n4okfVxki9C58yZaHQmbLixa313wi0Ldj
         1ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JVq0jzVMd22wrFGV6AGs0YUGbFRod6Ol4uSuY4S5wO0=;
        b=MUnq/SGiCe7uFPVFTKYs//EmBRBEJgKTT4YkQZFgCz2ls2NjJ8j2umHXgYgfpiHL7r
         59HS4tqkJUV8uRmn7rF6vO8doMARvo5wvrtqqcHGQ+jrFA57b3AQcLhDakqDOAc/Q7F0
         iHItbdocz2lGjUnNR7SFLk51OOJZq5VHY7i9+I4/ml5xWWNa0Ea1WI9WczK7AGUS2jLf
         46qFNvzbjxtsZdgV5RIuTlCzT6PcghYFb94BsOvcGINr3mA8vN7JklpGYSNFE8mKmTOX
         7kQKCwPFnI/EcKahWEu6RFEhpfXTTsNyDcKvK5j77EO3UL0PptrLNGNF2k458ITOnoQW
         aPbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T7GAaOpa;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id p6si9584159ejx.44.2020.03.15.15.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Mar 2020 15:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T7GAaOpa;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584310604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVq0jzVMd22wrFGV6AGs0YUGbFRod6Ol4uSuY4S5wO0=;
	b=T7GAaOpaxLaLx2IPzp8aW37rhQ3rC0zC6M6IbH+gCVzQzbHFxvHCKuAXakK9CXMXYGdGgd
	vp4Ht1vUzjkYi8QwCNcwPSSkti5H0qd73yOs7/yEXg0tKydr12Mj19NKV3Pf4AdpjMC3KD
	hag44n8VIqE+i8hMkgiTLGQh1QA1OaM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-Z1qqthw9PyiMd5qJVTYUQg-1; Sun, 15 Mar 2020 18:16:43 -0400
X-MC-Unique: Z1qqthw9PyiMd5qJVTYUQg-1
Received: by mail-wr1-f72.google.com with SMTP id c6so213617wro.7
        for <alex.bennee@linaro.org>; Sun, 15 Mar 2020 15:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iRHW7+jG/l3gvTxinmkE5xtvg/1Q8eGX49Sjbci+aqU=;
        b=k05rQvBCvNLiQBha202IaooET5m4SrU4IQxbcRzveDpKOqRMilQb4bpjJWJdBIy5vZ
         m94fZgysy+hBHImkekvdCI//x8LsUqs+569xTRjEIzdXZxx2n/M98xIcDlmLfx13XnOG
         KVJ1pTY7zbod+8GFly75T7M7U4H80MSzdN1bbmyrEtKTMGatnS/j9IhtmNv/top+2wmu
         zxjateI17lmH87jGV4OYY/VZ0HrxRmsDQGP3ebNsmuImUcD8C6xNZSB+0N7Oo7T409Qj
         xWYQ3fgDQqDEUSNqfM6SkOowTTJUDHFG4vgjw0qigNyFj161xV3VqDYJPr0TOGKZjuAJ
         HXoQ==
X-Gm-Message-State: ANhLgQ1vmAfRJ31yPqnzHM4sVXLWwbSOlXp255J6eG8NzeHkGP2aNgyJ
	pABsT0HVEbhpJm5ZZf5nmr5WoRZPrSFBx5aUes33GGWFCIeH+BSsd4sGqrWzmTwFAcjzmXrRvhe
	pDLTPiXENkJmfc3SS
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr23419063wmj.176.1584310601938;
        Sun, 15 Mar 2020 15:16:41 -0700 (PDT)
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr23419039wmj.176.1584310601749;
        Sun, 15 Mar 2020 15:16:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.40] (191.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.191])
        by smtp.gmail.com with ESMTPSA id d15sm89324337wrp.37.2020.03.15.15.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 15:16:40 -0700 (PDT)
Subject: Re: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is
 enabled
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-2-philmd@redhat.com>
 <8f73d608-d28e-b896-b1f0-f95d599502f0@vivier.eu>
 <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <29d183c5-6dc5-39a0-e8be-fa2e7f37d331@redhat.com>
Date: Sun, 15 Mar 2020 23:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d9b29b2b-58ff-512c-c426-0ffe7bcad295@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: TyPIS4+Q39R3

On 3/15/20 8:40 PM, Richard Henderson wrote:
> On 3/13/20 3:28 PM, Laurent Vivier wrote:
>>>   ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
>>> -HELPERS-y +=3D virtiofsd$(EXESUF)
>>> -vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
>>> +HELPERS-$(CONFIG_SOFTMMU) +=3D virtiofsd$(EXESUF)
>>> +vhost-user-json-$(CONFIG_SOFTMMU) +=3D tools/virtiofsd/50-qemu-virtiof=
sd.json
> ...
>>
>> Why don't you do that instead?
>>
>>    ifeq
>> ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yy=
yy)

This was my first option but checkpatch complained because it is 80=20
chars long...

I also tried:

ifeq \
($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_SOFTMMU),yyyy)

which is uglier and still too long.

Following qemu-bridge-helper syntax I also tried:

ifeq ($(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yy)
HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) +=3D virtiofsd$(EXES=
UF)

which is also too long =C2=AF\_(=E3=83=84)_/=C2=AF

If you accept checkpatch complain I can use the form you prefer :)

>=20
> Seconded.
>=20
> r~
>=20
