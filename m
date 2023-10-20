Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1256726ejb;
        Fri, 20 Oct 2023 07:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUgcsXt/9kokAirl5hDfcFSqUteCL2RSE9UFCC6ReKUvJv9TTr9D1R8zRd63DmFTw5+Hqi
X-Received: by 2002:a0c:b41d:0:b0:66d:1ca1:cb86 with SMTP id u29-20020a0cb41d000000b0066d1ca1cb86mr1912307qve.60.1697811206827;
        Fri, 20 Oct 2023 07:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697811206; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGW9pzCXx0Mmz/XWLtVMwh14aK/MtKRXiGLPKLQEFTzGOs9yNQraOKvoflHqHH5/yT
         0/gSqZt4uQpvhknGLGMXDG3e5p65hGKkYF+yfGK10V25S3skfUzoKTogiKs4vc7OljKN
         wXdbW2+DQgLvhwP9JnGD5xPia5STGh0wm6/d3AiOxUMn6VuA8/2pwZN/GQFZ9Ez78dlN
         Suw9DvGspvKxpkAHdCVGgC6quRqdtnkRNgB5ZmW5Mw6BFel6vLJ5CxfJRwWb+9qvhP+B
         QO2tml02c9BP86heMfXkvgzVhAePry3JosHZ017MbW65Fe4mAWjT5MUjsV7ZMIZVxU0+
         GsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=GfNJ1RcyONE40af+Mtv2F3mzSF8JblXxRtaiBi1+DJE=;
        fh=aaqPnSD6tstDYOi4iE3lVjgOjq/ySCPz+jgy9Piw17A=;
        b=ylD3S23zovU3oI8W3U90MeB2bshLztxh9VE/MQt3yzecXXPAikZxQA3wHO1jPvyipp
         55Cd336XXFBJQuBZ5hjo5w1AvliL+lYR1xyMCUzrhONVes0kLdr/LIQdHSMsJuKsLQqe
         lsn5XBNI1cLe5DLWXs8813jzolowTadNBOIwkGGwsfbO0gNfFaMY9E9gR5wDeIM682mh
         TTiaRxqcBQ0g1GsZic3TE4awb8FIAK3iuBzkQ67NRNPYkgdnsEF0wuVtbtYLa+D+Yzm5
         DvtPE4e2WD43tEu+MAsIrCOj8VDBDt9pvWLp/R+qkXteEtspJbNUHb5JroUXp7Ga5wRA
         zLvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=id9JTfdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee3-20020a0562140a4300b00655e555f3f8si1392170qvb.566.2023.10.20.07.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 07:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=id9JTfdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtqFG-00076B-MH; Fri, 20 Oct 2023 10:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtqFF-00074A-BO
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 10:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtqFC-0002Zi-6H
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 10:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697811173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GfNJ1RcyONE40af+Mtv2F3mzSF8JblXxRtaiBi1+DJE=;
 b=id9JTfdESbOqSPoJm//DboOSGVfuJ2UtT+/VfSVUtWQFV3aHh9O/RE2CXIP1TQ65FG+xrJ
 as7C2klyh20i544j2yswU8gGqHg/nLDKFzOmjzjQqnge1bg0asD+tylcVZWIW+/dyOU4Ty
 8QDcjfrVhIAlBcovbROmbPu/PmRUEdk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-S9Bq_NxhMPmIwYg15qwL7w-1; Fri, 20 Oct 2023 10:12:51 -0400
X-MC-Unique: S9Bq_NxhMPmIwYg15qwL7w-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-41cb7904d5aso9023161cf.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 07:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697811171; x=1698415971;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfNJ1RcyONE40af+Mtv2F3mzSF8JblXxRtaiBi1+DJE=;
 b=Vf2KLgl1yndGpE0LM4bELlzlQdvTm78hUIWfOn8fH0JJWdxBN5QKZ/dJqKOc1B9DY0
 aSjspFSWD/W2oARV/zxtKYhx8l0BdWAFsnmjd+HqDXgNfrzwD4ihUYP+I4jA3AZP6hsg
 mtbKTioLEm1ns0e/CCE2BuvmdLjr9yr4JxcbT6LUrOp/ZbKvDXh2OOj/AIEDzS+aP3yq
 nROM7GxMvD+Gb4r2TTcoIpQnA+iX0sZlKfL3Ooep97/OQyIxQuMKOMz6NJ2wLloPYmAP
 JG2qz9/9wQRLp0nl8p/vCkp7MOPDZolV+ZhzLmnURXazoXZzUVqXXScbIgkPMjZiXQRJ
 qopQ==
X-Gm-Message-State: AOJu0YxzE3EYlIwlUWFLJYB6V/p6NQM5oUSjlJLVt5hvt1lQgOa5sh52
 pgGrcQWuproeH66s9UCBiJOenyaMEV9C6pOucIfDGJcVdH084eU/jYY/HqS1538ndzgT9ECVuqp
 faz1TmxJSxm0p
X-Received: by 2002:a05:622a:13c9:b0:41c:c631:3fab with SMTP id
 p9-20020a05622a13c900b0041cc6313fabmr2252234qtk.20.1697811171352; 
 Fri, 20 Oct 2023 07:12:51 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:41c:c631:3fab with SMTP id
 p9-20020a05622a13c900b0041cc6313fabmr2252200qtk.20.1697811170950; 
 Fri, 20 Oct 2023 07:12:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 w10-20020ac84d0a000000b0041803dfb240sm624739qtv.45.2023.10.20.07.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 07:12:50 -0700 (PDT)
Message-ID: <efef6d37-925c-415e-9a59-85e528eacb7b@redhat.com>
Date: Fri, 20 Oct 2023 16:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] migration: Use vmstate_register_any() for isa-ide
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
 Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Leonardo Bras <leobras@redhat.com>,
 John Snow <jsnow@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Stefan Weil
 <sw@weilnetz.de>, Stefan Berger <stefanb@linux.ibm.com>
References: <20231020090731.28701-1-quintela@redhat.com>
 <20231020090731.28701-4-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231020090731.28701-4-quintela@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TcROoQh2wAmT

On 20/10/2023 11.07, Juan Quintela wrote:
> Otherwise qom-test fails.
> 
> ok 4 /i386/qom/x-remote
> qemu-system-i386: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=isa-ide, instance_id=0x0
> Broken pipe
> ../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted (core dumped)
> $
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   hw/ide/isa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
> index 95053e026f..ea60c08116 100644
> --- a/hw/ide/isa.c
> +++ b/hw/ide/isa.c
> @@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>       ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>       ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>       ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
> +    vmstate_register_any(VMSTATE_IF(dev), &vmstate_ide_isa, s);
>       ide_bus_register_restart_cb(&s->bus);
>   }

Would it make sense to use another unique ID of the device instead? E.g.:

diff a/hw/ide/isa.c b/hw/ide/isa.c
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -73,7 +73,9 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
      ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
      ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
      ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
-    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
+    vmstate_register(VMSTATE_IF(dev),
+                     object_property_get_int(OBJECT(dev), "irq", &error_abort),
+                     &vmstate_ide_isa, s);
      ide_bus_register_restart_cb(&s->bus);
  }
  
  Thomas

