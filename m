Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2899829lfm;
        Sun, 19 Apr 2020 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJdIZ4G+ChWvuX+vbFEqmbbKUtIyPz+rjYNwWXSS/9D85JBAjflBKV62QmTZhpyfvGXfnvz
X-Received: by 2002:a17:906:d1c4:: with SMTP id bs4mr12445211ejb.109.1587313918050;
        Sun, 19 Apr 2020 09:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587313918; cv=none;
        d=google.com; s=arc-20160816;
        b=GGnQb6KM3EvurlvQMDr2SAOiZp2qpVwSyRNsI+lwhRegvqFmVdXUxjk8LEHH/1PF81
         LpZwwz4I/iyIUBBRVkFBeEnKSmd6Cgfwixk26Z2Brta0cTKEgkpXWi+ys6z5sAC7j48Y
         JzA+Gr6DyNYO0GhP/Z5ROPtT0GYaYH/g8Gk77S1bi3HTy17wFfWebycfZPLnOPmo+MHn
         r7uHkOMl5Stk73WXaItehkTXYsxlMJtUKNmcokUqJ9nlKAMdz2l1n17RNhaAwdsYN0sZ
         +jmsN+7Q4gopkospDAnEUrDlteVstWZLUTNpS5jkmePMA2LB3sbpC7DZjYgehkUSj++b
         5biQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=pesQP7cRSpxsyS1fcfkJAP4LS9zAm+K6PXhY9VbHvhM=;
        b=rr8fcqN80a8jjFvhXn22OXivQdQtVdsrqKe0hZqpW2n7c3xt7bU7bXzLh9lZBwecCG
         kDP3blrFo3ExJMVXWoPStPOrj9tP/Kpwa4XvRHR6Ij4RzXpb0wh32n6Y/Gw/awAt2j1F
         U12o5S693Q10ELpyT2zsptOhKe2uw3zgkaKF0gtigpS26tOj9a2NLWjSHMCMCJ+9CZTC
         h9qg2YwLM6kOjuuweKQF+6XvSGa+XUJ0N1Tttz5lDxXRyfUFVJwgdMB1jiQMIPv4XNUu
         3wXiqrmPATV1isJGe2IkpT9Ugfh37WOzaZ7AgoA5lWiai69J2W6gEAY960ePX9zQH6HS
         atCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CWEZwK+G;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i17si18364169ejh.276.2020.04.19.09.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Apr 2020 09:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CWEZwK+G;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587313917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pesQP7cRSpxsyS1fcfkJAP4LS9zAm+K6PXhY9VbHvhM=;
	b=CWEZwK+Gnpzt60v8xdVLSTiS0Pw8EmKY87Ojjls0fvV8wm3BD8+/DBPt9qjYCFWr8yMD+F
	KgXQ8MIzxIQIKa1ZoOhATnhGz52x1u09hTG2ZTFlfGwp8nGR5Eki4NRd4j5t49ufoeQ9lE
	xNawlBXb38XLQ17nOGXithTnEqfxKXs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-7cTRCO2FOeuRO9HW8iIZDg-1; Sun, 19 Apr 2020 12:31:52 -0400
X-MC-Unique: 7cTRCO2FOeuRO9HW8iIZDg-1
Received: by mail-ed1-f70.google.com with SMTP id u6so2338361edq.11
        for <alex.bennee@linaro.org>; Sun, 19 Apr 2020 09:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mdx8uZoicdMAL3gsk4iw2tZTBBc5tNVnam1BJXq8JpA=;
        b=WwxnkHrgVq4SFd+5z/yujVrAlEGPTQYj/9HXMAobUdqS3QN9loyvKae2i3RDut0U47
         Q+MMRCY1LwUoSZkGzCKXvgPOxK3TyG2y58thsRJzpdIEsLKpo3AK3lkRd/toXT5Z9AQK
         zHNf1iSjFYzvEnoNCD8qW0Wl1vDdcYljjvLKhdQk/g5M6Gf4N8nN9QE2N7G4aLtwXK8A
         muqKfOU5rIT1mv5DhPqmA+zCW4BxR1mY5L4ocingtloF0J//8yT/QTJo8eV9vMQWd+Cm
         eP4Q/F3qbJ73Y1NBh45BmNF0kkGKXFg7jG5BDpmcvJ4kW5G1o7k9XC4kavr7xLA/cetP
         tesA==
X-Gm-Message-State: AGi0PuYZkAJ5Z+eIk0K4nPZWi0L3r4ioXG4GZHaisJ1KgQdK7PT32hkE
	R+N6WgXWnhd3kA8HRGvw4UuTvzK+XgYzt1pUrPdJefNz56OcnvNkGsH6DZsZTPYbZ+dXo/NSnH7
	W1RGKs7R81Y03XyHW
X-Received: by 2002:a17:906:2548:: with SMTP id j8mr12206222ejb.378.1587313911156;
        Sun, 19 Apr 2020 09:31:51 -0700 (PDT)
X-Received: by 2002:a17:906:2548:: with SMTP id j8mr12206211ejb.378.1587313910951;
        Sun, 19 Apr 2020 09:31:50 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id b8sm1799672edt.7.2020.04.19.09.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2020 09:31:50 -0700 (PDT)
Subject: Re: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as
 kvm_set_feature()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-2-philmd@redhat.com>
 <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org>
 <3dc0e645-05a5-938c-4277-38014e4a68a3@redhat.com>
Message-ID: <f4ee109e-b6fc-8e1b-7110-41e045e58c30@redhat.com>
Date: Sun, 19 Apr 2020 18:31:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3dc0e645-05a5-938c-4277-38014e4a68a3@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 0nVKIq9RGFs9

On 3/17/20 10:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/16/20 9:16 PM, Richard Henderson wrote:
>> On 3/16/20 9:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> +++ b/target/arm/kvm32.c
>>> @@ -22,7 +22,7 @@
>>> =C2=A0 #include "internals.h"
>>> =C2=A0 #include "qemu/log.h"
>>> -static inline void set_feature(uint64_t *features, int feature)
>>> +static inline void kvm_set_feature(uint64_t *features, int feature)
>>
>> Why, what's wrong with the existing name?

Peter suggested the rename here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg641931.html

>> Plus, with patch 2, you can just remove these.

Since they don't have the same prototype, they clash:

target/arm/kvm64.c:450:20: error: conflicting types for =E2=80=98set_featur=
e=E2=80=99
  static inline void set_feature(uint64_t *features, int feature)
                     ^~~~~~~~~~~
In file included from target/arm/kvm64.c:30:0:
target/arm/internals.h:30:20: note: previous definition of =E2=80=98set_fea=
ture=E2=80=99=20
was here
  static inline void set_feature(CPUARMState *env, int feature)
                     ^~~~~~~~~~~
target/arm/kvm64.c:455:20: error: conflicting types for =E2=80=98unset_feat=
ure=E2=80=99
  static inline void unset_feature(uint64_t *features, int feature)
                     ^~~~~~~~~~~~~
In file included from target/arm/kvm64.c:30:0:
target/arm/internals.h:35:20: note: previous definition of=20
=E2=80=98unset_feature=E2=80=99 was here
  static inline void unset_feature(CPUARMState *env, int feature)
                     ^~~~~~~~~~~~~
rules.mak:69: recipe for target 'target/arm/kvm64.o' failed
make[1]: *** [target/arm/kvm64.o] Error 1

>=20
> The prototypes are different:
>=20
>  =C2=A0 void set_feature(uint64_t *features, int feature)
>=20
>  =C2=A0 void set_feature(CPUARMState *env, int feature)
>=20
> Anyway you are right, I'll use the later prototype instead, thanks.

There are ~180 uses of set_feature(CPUARMState,...) and 10 of=20
set_feature(uint64_t,...) (kvm32:4 kvm64:6).

We are going to remove kvm32, so replacing 180 set_feature(env) by=20
set_feature(env->features) seems a waste.

If you prefer to avoid renaming as kvm_set_feature() another option is=20
to move the declaration in a local "features.h" header that would not be=20
included by kvm*.c.

The main problem is the use of the ARMHostCPUFeatures structure which=20
apparently was introduced similar to a CPUClass (commit a96c0514ab7)=20
then lost this in commit c4487d76d52.
