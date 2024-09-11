Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp175201nji;
        Wed, 11 Sep 2024 07:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/YIayqQk6KOYMln/4SU5yVHYYufx5MMOjGofwcJt0TU27HjiE3Wcp3EDKgiinFpeKXDOQtbhcgflgPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEhhR/8Bxhz0x5+/mCcGpH+/vDntwZLZmeRY/SCpPqBMGhgHvag7UBcaVsPz8tdx+gfUhrX
X-Received: by 2002:a5d:5081:0:b0:374:c9f0:7533 with SMTP id ffacd0b85a97d-3789243fbb9mr12267507f8f.41.1726063810924;
        Wed, 11 Sep 2024 07:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726063810; cv=none;
        d=google.com; s=arc-20240605;
        b=kGrwb1Mw/edFjPvLi+hUESZBe/tXckDJ5HuQq3hE7F5TbXsM/pv9lyvKqCnnwZw9Yk
         17VBcpATQk4D5vRDzqGl0Y9GtHLtKKUMPsppOf75p9P3Rkk8e12+4477m4blOd/H/9qI
         iHIU3TVvTqZYbzpiPHjJEx/EdrGojrW+nLAp577cuPLCoB+WrGNoXqLOLpkcsXqBm2Wu
         XrBIxRkPszAmJUyzwHVeMqYi9QkB4GuuJYlI7rppH2aDKWG92sPb4aWkVdE5LA+Xdxpv
         6Je7zZBYXgROFyHs/JvESk6jrHhyuPHl/5T4brXEkc2uyH/KQvPhjwq787pX/3I1koUX
         pL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=rae1bHAI1Txiez0T0BLU2jDx3lKBEyr+KcOpjd+mSpY=;
        fh=ThzAFcxpKYYXHGiXorBIu5NZ/0yAViBK4PV296HouOE=;
        b=flBN3ik6C1g7i1V+WiPcjsrfo/TMsCDOyT23xBEkU7ewz3BXT8KVE/DUoW3KoP3w+i
         wAI6p1rCrhtB++FL10wpkYAQLW8ks1FO4ctE9gI7o3evgKPQGlcZYJQTwuAqw3LHuZ0c
         yxnYFgOViogNtxdSftxK7bS6OX8A+NStLnEOMUZ5MADDNzXozA+7C7YMTQLVTwdmNwR/
         bxMVWGlKnibF/ld9NiLsg0G+p8sOTkQqsds4CVFU4ZoH91zefQv6zhpaPOFfjegwoWug
         rSucYzy9nyqTK5b/+zU7ImrHiV9kDWUvYy1hc6h35tYu8LYVdOXTyFw09md/VkZWnSew
         n0HA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [2001:738:2001:2001::2001])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378956d8c71si4070154f8f.1054.2024.09.11.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) client-ip=2001:738:2001:2001::2001;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id CE1A04E601D;
	Wed, 11 Sep 2024 16:10:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 2a5-7Dj__MKk; Wed, 11 Sep 2024 16:10:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 7534F4E600E; Wed, 11 Sep 2024 16:10:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 7180A746F60;
	Wed, 11 Sep 2024 16:10:07 +0200 (CEST)
Date: Wed, 11 Sep 2024 16:10:07 +0200 (CEST)
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
In-Reply-To: <20240910221606.1817478-21-pierrick.bouvier@linaro.org>
Message-ID: <232858c7-6270-f763-adfc-b6c8259bf021@eik.bme.hu>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org> <20240910221606.1817478-21-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: lFWfkS6uLGfu



On Tue, 10 Sep 2024, Pierrick Bouvier wrote:

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
> hw/ppc/spapr_events.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index cb0eeee5874..38ac1cb7866 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
>         /* we shouldn't be signaling hotplug events for resources
>          * that don't support them
>          */
> -        g_assert(false);
> +        g_assert_not_reached();
>         return;
>     }

If break does not make sense after g_assert_not_reached() and removed then 
return is the same here.

It may make the series shorter and easier to check that none of these are 
missed if this is done in the same patch where the assert is changed 
instead of separate patches. It's unlikely that the assert change and 
removal of the following break or return would need to be reverted 
separately so it's a simple enough change to put in one patch in my 
opinion but I don't mink if it's kept separate either.

Regards,
BALATON Zoltan
