Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp218138nji;
        Wed, 11 Sep 2024 09:09:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhOW1p69W7ozM+D/0Td0Uj4L4XDrML+K+lT+rg+RFEAiOBi4Ve21WMusJ/mwm61eHV0s46kQMTnBZCXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEFi84iQbeMHn28nYHWek8XBoxjkeYK4g93TKH+UT0WYMUY872cShWXn4v+Y8Y/I3x6Mpc4
X-Received: by 2002:a5d:5708:0:b0:374:c1cc:2eb7 with SMTP id ffacd0b85a97d-3789269fe90mr8971308f8f.35.1726070942927;
        Wed, 11 Sep 2024 09:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726070942; cv=none;
        d=google.com; s=arc-20240605;
        b=As6yjNx3yDRb1TVrnL8YUuLfSkkrpfTP8F5b/BueoPUTSco+SdRRCqWLlenX+NkQPp
         8xgTKXIPV2thkH+6KoB4fnCkTJHEJx/6qr/+yPPrJfXh/QFe52i5kZv/LjPd7Ah2xEd5
         TKnQYFusMW6lNT9VjtSnEw7hEI9P8EwxRNpR8iqjR8SnqFM81wb7pQXTZuhkjnLeUmQf
         +WEqn0RJe7KJ9Ip0E1A5cNKMRpMlaJYuikwPImozuBA+DUebzAAA8Wi9dLqCsuOSHjyg
         NHq/5S6HLwvA+XAdA7lrMsLgXoD2YCRG63YWrWNCRhqqQ0Ahb44rHlL7bAOWnFl/tY5u
         amsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=FRYB6McB3AUxUo1QBpFrUOTNJqg4IisCvozbFd6iWjY=;
        fh=ThzAFcxpKYYXHGiXorBIu5NZ/0yAViBK4PV296HouOE=;
        b=VKsbDldF6tiQtRKxONI9xpcyHSwEXsVdaDxC5TQqSA3clKBv+EN/b1TvsaXYXOdhLA
         Dc2Awg6ozdZpJOpykTx9/EWmAWqdSCTBytX0+pQ8JzzjgaxyaZvNL+TlDm2ThlEoIkqg
         oUemufqC0rPEBz7WNRZCZ94HoGq+0qIIRcjPCVg1Ln8V4CNsp3ocLB/z7pxfFOgiEAw3
         /qvrONoeEoldvDVi56iImzP5Lzdg3WyNIuEuGhH9vFFFw6xFZWgzxa+pU3nlQ3GhW2Ro
         /njQUBVK3/MD4G5nrhllBsFWQpnYjK2rBxoMd0ZIEYmddfmWuMxil6DtdT2RhYVjj2zR
         cCVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [152.66.115.2])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378956b92dcsi4252282f8f.616.2024.09.11.09.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 09:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) client-ip=152.66.115.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 2B05C4E601D;
	Wed, 11 Sep 2024 18:09:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 2AWBOJKeRs3H; Wed, 11 Sep 2024 18:08:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id B61AD4E6004; Wed, 11 Sep 2024 18:08:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id B2618746F60;
	Wed, 11 Sep 2024 18:08:59 +0200 (CEST)
Date: Wed, 11 Sep 2024 18:08:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
    "Richard W.M. Jones" <rjones@redhat.com>, Joel Stanley <joel@jms.id.au>, 
    Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    qemu-arm@nongnu.org, Corey Minyard <minyard@acm.org>, 
    Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
    Keith Busch <kbusch@kernel.org>, WANG Xuerui <git@xen0n.name>, 
    Hyman Huang <yong.huang@smartx.com>, 
    Stefan Berger <stefanb@linux.vnet.ibm.com>, 
    Michael Rolnik <mrolnik@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
    Markus Armbruster <armbru@redhat.com>, 
    Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, 
    Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
    Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org, 
    Hanna Reitz <hreitz@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>, 
    Rob Herring <robh@kernel.org>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org, 
    "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Harsh Prateek Bora <harshpb@linux.ibm.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
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
Subject: Re: [PATCH 20/39] hw/ppc: replace assert(false) with
 g_assert_not_reached()
In-Reply-To: <45c6a39b-9c16-4580-ad6b-99973b5e6b0f@linaro.org>
Message-ID: <cb4298a0-eb1f-be02-18d5-b9ce87a4c550@eik.bme.hu>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org> <20240910221606.1817478-21-pierrick.bouvier@linaro.org> <232858c7-6270-f763-adfc-b6c8259bf021@eik.bme.hu> <45c6a39b-9c16-4580-ad6b-99973b5e6b0f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: Nl9iG9O2rJp8

On Wed, 11 Sep 2024, Pierrick Bouvier wrote:
> On 9/11/24 07:10, BALATON Zoltan wrote:
>> 
>> 
>> On Tue, 10 Sep 2024, Pierrick Bouvier wrote:
>> 
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>> hw/ppc/spapr_events.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>>> index cb0eeee5874..38ac1cb7866 100644
>>> --- a/hw/ppc/spapr_events.c
>>> +++ b/hw/ppc/spapr_events.c
>>> @@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, 
>>> uint8_t hp_action,
>>>          /* we shouldn't be signaling hotplug events for resources
>>>           * that don't support them
>>>           */
>>> -        g_assert(false);
>>> +        g_assert_not_reached();
>>>          return;
>>>      }
>> 
>> If break does not make sense after g_assert_not_reached() and removed then
>> return is the same here.
>> 
>> It may make the series shorter and easier to check that none of these are
>> missed if this is done in the same patch where the assert is changed
>> instead of separate patches. It's unlikely that the assert change and
>> removal of the following break or return would need to be reverted
>> separately so it's a simple enough change to put in one patch in my
>> opinion but I don't mink if it's kept separate either.
>> 
>> Regards,
>> BALATON Zoltan
>
> Mostly done this way because it's easy for creating many commits.

As I said I don't mind either way. Now that part of this series is queued 
it's easier to add another patch to remove the return.

Regards,
BALATON Zoltan
