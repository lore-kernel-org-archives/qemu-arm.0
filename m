Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp232680nji;
        Wed, 11 Sep 2024 09:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZq1hIje9T4ibSdVfpBLUsdRE+V2hW5WGrHN0NlpOizK9dZH7Uh21YJ88ehcZLT9MTAYktGp270RMbXQ==@linaro.org
X-Received: by 2002:a05:6870:b48c:b0:261:1aad:2c03 with SMTP id 586e51a60fabf-27b8300130dmr17481310fac.43.1726073760889;
        Wed, 11 Sep 2024 09:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726073760; cv=none;
        d=google.com; s=arc-20160816;
        b=AkF1dlW9e8oqXCEUhfeV9P4MZjFAuXvj9ieVWtuVadCFjm0py2Qgz+rH65q1O7HWAh
         hkNn2y9eqzedaRM3omRRJDLczsOhVBgEFtCWhnT8mHp3fT0ZvAn4xQn1D/cfePa6NMcd
         X7mBzcsUL2Y8d2/mEdpz6LU7QBdSo0ntyGb/Uu8g8aIVjpJxA5z6l9Qu8GdyYQNFnvfn
         /HcQLbb6sSzK5VT5X1sulvgEf3YNRwclGnyU8PK9f+7MK/KzCp2EunrgnE4Dp0Vdh8ap
         BSGLzscBaJPaHiH3EEyWt3hqXK+sK14CWpXd4mygz2EciGpxwi1B8dVcf1MAFd5VQfRz
         l9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jT2yfHOKQil4uehZcIK/2WmRn/qwChXA7I64h0o8Rrg=;
        fh=rFSqW8Skl2zp8disbSyL9zKaAeFWWdBtc0jf3nY/1pk=;
        b=NWuLLCZQANBrEPlWJNAlMmB00hrOBKYXY2mQb8vBqeR//eJc85lS61dSMFq4JPIJeN
         t/b4OUyXYsUTXy11tTZwKqcoVNgejPNKk7fItMzB/7reElRUKzoLTEdrf2msSEtLUV/6
         LDXZEJVzMCMddusWSAPqdi8cuTUcpAMAQ+3d4lagonzJmej+PhIDONray1yKr7K3Hask
         wc6STx4c+7Uf1cPj1DHSKPJskJYchByrFXyCWU+R9gr5P0KKzJ9ih2Uv6x1dacwR+P7a
         Lb0KWob+oBNIHWataF5hwE9EdSNcRX+qsjxT13DzgaUOmrY8RhV6n7e/sSc1b8VUxUS5
         NYRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SHYt/TGw";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-27ba3f4fecasor1867244fac.12.2024.09.11.09.56.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 09:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SHYt/TGw";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726073760; x=1726678560; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jT2yfHOKQil4uehZcIK/2WmRn/qwChXA7I64h0o8Rrg=;
        b=SHYt/TGw3uQjMkkhDAplHCEdkSeDIEouWCA9X30FBxsxVSyygPs/FKA6B42a4Nqsc8
         VzwH6OrxOVUL82u0QvpRgYooNCZDX0At2obsbb4bGqBLDVxg26/bppwXF477gTkln8Vb
         yaVqjVrhhlnxhNOaG6Q8y+gjYGDsLoTlNqYJdfyY2GqfSiQaZ27EZfLNzH+icj+PEOdw
         B3q918Kz661rrz4ZnHyvnZeeWX9MZ5uQY5DIJphJWiwSHF/T2B1kyg2vf5PO19OX89hT
         zHMskD+1OG8D+Cc6ydyB7RkG6JaA1YMGJGaShx8cyMCQNOOYQOTu16yBz+fxxEUtM39V
         WnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726073760; x=1726678560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jT2yfHOKQil4uehZcIK/2WmRn/qwChXA7I64h0o8Rrg=;
        b=Dh7Zb1EBOLg86rtDS61SdNyNoULBFIFojsG8DOwZ0LFy2eOUIsGbYWQjKgCryypxx+
         laNrIR9SFP5Qd+hq8AeLZ4MZssKpR63pykuDJCItm9Be9ZPPv7q1ADFU+SstM4R5GbD5
         9po0uj6ogrEpj1UR11sNrEbtFyt2BikXlbuAcK1eobUIIHtHlQN2pKDUue5RTUB9x5p7
         +dMtqV+VvqSttDwMfXTZZFqvQc06TBgRXBUVFD9Chpz9r78vThZOYm2fbPAVsJMLqSAc
         ftzvDJRqlNz+iTN5NMY2mZe76MVX9IIgj6JP8HHeA03hMuyysm3qL+Bs1ZP/0L1G1imC
         uKxA==
X-Forwarded-Encrypted: i=1; AJvYcCXwq6V+7wq4Kn0mwKMy+EPw1ObDfUF2KRR4Cb6bjED/bbQboUM2wXiB3adc133+XuzMDxRljCmYSbtccQ==@linaro.org
X-Gm-Message-State: AOJu0YzBbCCvLLydZOXhQwV6exMPxx7bRCmVloyQAE48442PrGd+j8DH
	xwnmgWpWfHxBcxxcT+8cZJyNlFTFlDmoDRixG74WWpyrmmYeA6ZS3nTso8pOxDy6tw==
X-Google-Smtp-Source: AGHT+IHm6lZ+zYd6OLElv1nSKeE8E+EcYdnIUsM2//Be/MFCqecYcYkqJpKvjCJcxFiRHPU1Pk0c9g==
X-Received: by 2002:a05:6870:df48:b0:27b:b2e0:6a5 with SMTP id 586e51a60fabf-27bb2e00bd5mr7219953fac.3.1726073760261;
        Wed, 11 Sep 2024 09:56:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5414sm210156a12.23.2024.09.11.09.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 09:55:59 -0700 (PDT)
Message-ID: <e9bac0e4-ee34-4634-a6a2-73854a45d7d6@linaro.org>
Date: Wed, 11 Sep 2024 09:55:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] docs/spin: replace assert(0) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Keith Busch <kbusch@kernel.org>, WANG Xuerui <git@xen0n.name>,
 Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Rob Herring <robh@kernel.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
 <zkyoryho5alnyirnl7ulvh5y6tkty6koccgeygmve42uml7glu@37rkdodtlx4f>
 <bwo43ms2wi6vbeqhlc7qjwmw5jyt2btxvpph3lqn7tfol4srjf@77yusngzs6wh>
 <10d6d67a-32f6-40fc-aba9-c62a74d9d98d@maciej.szmigiero.name>
 <20240911125126.GS1450@redhat.com>
 <6818337d-ba58-4051-8105-05f679f71b88@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6818337d-ba58-4051-8105-05f679f71b88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9dY//yp4rjlK

On 9/11/24 08:25, Pierrick Bouvier wrote:
> On 9/11/24 05:51, Richard W.M. Jones wrote:
>> Although it's unlikely to be used on any compiler that can also
>> compile qemu, there is a third implementation of g_assert_not_reached
>> that does nothing, see:
>>
>> https://gitlab.gnome.org/GNOME/glib/-/blob/927683ebd94eb66c0d7868b77863f57ce9c5bc76/ 
>> glib/gtestutils.h#L269
>>
>> Rich.
>>
> 
> Interesting.
> At least gcc, clang and msvc are covered, this should be ok for most of the builds.

All of that is inside #ifdef G_DISABLE_ASSERT, which we will never set.


r~
