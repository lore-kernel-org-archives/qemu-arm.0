Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2084013ejy;
        Tue, 20 Sep 2022 16:04:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OWR+lXYssxcBlclrz/EVqmfe0UyrlDdxBbIg0IgGOdg7BzPIo6/N8S1t9D3lTOqmox8wy
X-Received: by 2002:a17:90a:9b12:b0:203:9b0:284e with SMTP id f18-20020a17090a9b1200b0020309b0284emr6363495pjp.116.1663715044453;
        Tue, 20 Sep 2022 16:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663715044; cv=none;
        d=google.com; s=arc-20160816;
        b=BmPlbXqCVf73C+Lufx17IeUYiyve8mKH9Hyra3+CtaT+6xJAsHTAU95YZySkz181+g
         k0aYvHfRPgf6bdjbnTYQbKjT/ZB2mS928NvekcuyZ5ky35dpJgZO86uDPxyspBbrWIKM
         L34NiRPb5+4EzQ6Tdua7U7NQ1awUsHyh4+w0E0a2wzEaKCeoCXFSUYLoXDa/Tps/4r7J
         CFw+iuj9t95FeORQl1LEPYXYg2G5g/uGhdbCiPgnEhUtab5/Y6i+2T+ApF5A7Ula3T48
         4k7Y60QKbaNTbA87ISfs8lSpVQDOl9JyuTolog0a5DP6WNfUZgrg/DQWjRiSh1dLyNg7
         P96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :message-id:references:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=PxKeXBgXDwhU6B1ik/sUia4kvwdWE2K6hWQ95wE2Drk=;
        b=ZCLlIUzNp4YYWYA6/4XfhdW1sTtzM0AzlB6iTy7muD6abYTGM9xhaVLca1WCef5N9G
         fKnStPSTPEvOSvCabaX8bYbGhOjNWKcnIBCtsyM5QrGYtiVcMIaHvT3u12d52T3TZ9mf
         w/rAPXAX/0dadfxaPl6C+CJOz6L+4tjL73Q/ei5luCIcTvyHiSPcbP8Mp3+41oJYEGwC
         +BQMcIK09UUtFn5tsvsiTfr7gazFkS3GJ5HpnGyse2PhncbEDv9KWdFfgke6G0GhkibL
         TD0LxEWxdrZdlxJn3a1rXIwZaL74y7l+aEhc2P5nhBn7Rx+98dBky5ruVUmNfwqGDeal
         k8uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HEjiVh9w;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id f9-20020a63f109000000b00429d2838aa5si1006043pgi.635.2022.09.20.16.04.04;
        Tue, 20 Sep 2022 16:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HEjiVh9w;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiITXEC (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Tue, 20 Sep 2022 19:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiITXEA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Sep 2022 19:04:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3842C2B27C
        for <kvm@vger.kernel.org>; Tue, 20 Sep 2022 16:03:59 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id 13so9756178ejn.3
        for <kvm@vger.kernel.org>; Tue, 20 Sep 2022 16:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=PxKeXBgXDwhU6B1ik/sUia4kvwdWE2K6hWQ95wE2Drk=;
        b=HEjiVh9w/3uCTeKWv5xTLYFpaViWsk1vtcDV5uQGkSAxseV3doz8CMX3FWw2WdZCHR
         RcYX/eRukcl9SLItOd8D1rCIKwttT7lhGff2RwC7ww60l1XOfWWmLKzBYHGUeV7pPFsd
         P6QdGWOYlxu4X8tnvMr7B+LQXRg5qP3SnC1gIWLJ5g7+BYCYhv4PWiOReQpR2NqO04s6
         ncY0vtK8AjDW/NwmHfxb2t82Lq8SPDtde4ij2gGlDjf5vewhZZg+mS1Wl6X2X+rTl900
         QNyrUQhD4kT+8PNRDeXGczO8mxCYzv5qaZoZCd2YXXoBhhst+vNWlk3So56OtpqodqAY
         VXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PxKeXBgXDwhU6B1ik/sUia4kvwdWE2K6hWQ95wE2Drk=;
        b=vZTQTKkLuW6e2GdEquXOaMmnOXEShhVnBAvJyrbaHA/qeB4EiKvtUraTHjxE4M1NbS
         ThFn2EqZbQt0PG7l2AvRzHSCZary45WXUgLWmMw40sKGGOsvJoXAYGf2/WcZ/M9QSQUj
         NpYAEnZBd+XWtNzB0mrGKMzCB7mU9QrBvAV8SXU87SmQqT6s1JXFHQemWOIY+7OkUeCm
         Ub1wDHchXAkdJPupYUBrq9RKnfMxIag5rfQGlml5+Tratgswk+v8lHuoWzW1RaNxF/LG
         4U+EJcRlJZB9IZwgHdyLqYXETf4GARfTyTn+maTD0MtwblOc6QpqNGkEX5DHMykhroqi
         jpVA==
X-Gm-Message-State: ACrzQf22LyQ9AKTnTAjcMiSUY7+ObWkV0hFf5/QD8B1fDk1hJDkHfKd9
        3I+BwE7da+ifuVIJHVFXkCc=
X-Received: by 2002:a17:906:6a14:b0:774:a998:d9a2 with SMTP id qw20-20020a1709066a1400b00774a998d9a2mr18208772ejc.496.1663715037704;
        Tue, 20 Sep 2022 16:03:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de. [78.54.6.55])
        by smtp.gmail.com with ESMTPSA id x16-20020aa7dad0000000b004548dfb895asm662307eds.34.2022.09.20.16.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 16:03:56 -0700 (PDT)
Date:   Tue, 20 Sep 2022 23:03:49 +0000
From:   Bernhard Beschow <shentey@gmail.com>
To:     =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Bandan Das <bsd@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Sergio Lopez <slp@redhat.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Xiaojuan Yang <yangxiaojuan@loongson.cn>,
        Cameron Esfahani <dirty@apple.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Song Gao <gaosong@loongson.cn>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Greg Kurz <groug@kaod.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Markus Armbruster <armbru@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
        Eduardo Habkost <eduardo@habkost.net>,
        =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
        qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Helge Deller <deller@gmx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Havard Skinnemoen <hskinnemoen@google.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Alexander Graf <agraf@csgraf.de>,
        Thomas Huth <thuth@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Eric Farman <farman@linux.ibm.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Alexander Bulekov <alxndr@bu.edu>,
        Yanan Wang <wangyanan55@huawei.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        xen-devel@lists.xenproject.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Snow <jsnow@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
        Qiuhao Li <Qiuhao.Li@outlook.com>,
        John G Johnson <john.g.johnson@oracle.com>,
        Bin Meng <bin.meng@windriver.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Alistair Francis <alistair@alistair23.me>,
        Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 2/9] exec/hwaddr.h: Add missing include
In-Reply-To: <3fcb707c-47c3-7696-86ec-62048e39bfe1@amsat.org>
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-3-shentey@gmail.com> <3fcb707c-47c3-7696-86ec-62048e39bfe1@amsat.org>
Message-ID: <AAFF4CBF-E710-4E08-A5AE-E8DF8CB02F63@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: OiV2uFRzn4RV

Am 20=2E September 2022 04:50:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<f4bug@amsat=2Eorg>:
>On 20/9/22 01:17, Bernhard Beschow wrote:
>> The next commit would not compile w/o the include directive=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/exec/hwaddr=2Eh | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/include/exec/hwaddr=2Eh b/include/exec/hwaddr=2Eh
>> index 8f16d179a8=2E=2E616255317c 100644
>> --- a/include/exec/hwaddr=2Eh
>> +++ b/include/exec/hwaddr=2Eh
>> @@ -3,6 +3,7 @@
>>   #ifndef HWADDR_H
>>   #define HWADDR_H
>>   +#include "qemu/osdep=2Eh"
>
>NAck: This is an anti-pattern=2E "qemu/osdep=2Eh" must not be included
>in =2Eh, only in =2Ec=2E
>
>Isn't including "hw/qdev-core=2Eh" in "include/hw/boards=2Eh" enough in
>the next patch?

Yes, this works just fine indeed! This patch could be dropped if in the ne=
xt iteration, if any=2E

Thanks,
Bernhard
