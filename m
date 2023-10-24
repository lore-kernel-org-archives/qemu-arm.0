Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1960367ejb;
        Tue, 24 Oct 2023 03:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX/U/hkAwtumQYGkBQ4R11dn59X/VlVvdER+ZRHQk/sfqIkDPrjgq5ja49NbflGdahQz21
X-Received: by 2002:a05:622a:551:b0:41c:c5bd:712 with SMTP id m17-20020a05622a055100b0041cc5bd0712mr16790559qtx.62.1698144981882;
        Tue, 24 Oct 2023 03:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698144981; cv=none;
        d=google.com; s=arc-20160816;
        b=wFvkbjbY7INRjHVnY6cOl0aS2juDPgSzEqcKSJlmc7mGAr2pQYZBVxBh4mHfHU+nA2
         4El1LlvVIIEepsL4qKnlzz6IN06SHFbEr1FlE+YDNJ5F+eHBxhFPfZC8paqr4AP7qZbE
         5mKRlioIUknoV4zy1bHLGz00fUGGvhSFInZ6qOph8gUvQFxVPuCZJnoiyjZvLkbwjQ26
         63cpprIQtGnAzXuyLVOL2sanERsgns0b8LDFhUIFDRS4tcb5F8stFAmB0GnLSunoaIHD
         uMPaiDkES8yGks+Q82zv06Rbi+X7RPmFn2VMiUJOQrq3sMfrRhuvGxJoeNywylYpjTuO
         SQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=WYEN7FH7IqZtZ+7M6b7K6o0KxuZIzcblLf/uIxLwAcE=;
        fh=IrnuumROS5lymupKr9JRiPyOh/kUaoKeQIFpoRSlvXY=;
        b=ZeCU4idklQ2/e8LSxInrwLYBwJ0riX+SGTuaBpkIKsgIzOq8HhsjG0hm0E97K5iouu
         F7x039YRFxX2ZsXpshn5Qp23OdVSllfzkWBSaLuP3EiBPy6nuuOKQBwbpj7zhAROo8xS
         Y1hA5Ah8phfUST5HiB0dsRlKfAYEIKL5qpciEA+J5G4ygTFWmyriYDzq/oxZOvVqO7bK
         dKg4kNL9bN/2J74DUSFe13/rrkvmvvExJoAtia6BQXPTwqbUa9qT422QCqlnFksV/Z/N
         Mv4xgWAl6t64QeTEIrg8mJ14ZSuPVzEbdnJpxjnnigER8YQICJW8RnXtn+yqp5gD/B/v
         grLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ddApUUZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05622a040d00b0041cbafcc5adsi6777150qtx.109.2023.10.24.03.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 03:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ddApUUZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvF4q-00075y-BX; Tue, 24 Oct 2023 06:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvF4o-00074u-3m
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 06:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvF4i-0002mm-QT
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 06:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698144951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WYEN7FH7IqZtZ+7M6b7K6o0KxuZIzcblLf/uIxLwAcE=;
 b=ddApUUZYa6TX5D0L7R95GDY/X385IqxhGYaakgaOdlNQEIvoQUGo0Brh6/GNiOqP4XsmmB
 SYwjr2tR8ZV0bplYw9vbXNBJ4TawPGEAUtATDkJJ7puiYwBdBziqflNJjDnrtifKB2djys
 HFAVD42NPspE/Kg0vSk4cOPSSXV5Xp0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-XHpzpVm-Ox2zJRMeIcYXJg-1; Tue, 24 Oct 2023 06:55:50 -0400
X-MC-Unique: XHpzpVm-Ox2zJRMeIcYXJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40853e14f16so24139285e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 03:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698144949; x=1698749749;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYEN7FH7IqZtZ+7M6b7K6o0KxuZIzcblLf/uIxLwAcE=;
 b=XGW7zoWXpnVxnkGlV9ocFk4WwZpPSuK8iFbMb2MrPZokczGtXBg34m9/01YfgQrmQr
 Ax9B7jBWj+XAJrkY70rGS8A+NJRRLstl2KqSuqmsVkdflk08Uvbks6iPI5Yp8bfw17r/
 oS/8TJDHqTSWnBIzACFpTcQP8HGcnBqJLrV83Rn8npgxh7YoBmN73vCgnUp/fyQKnKY9
 L++5FtF0Lde8zgexH/B6DoBY482rEAb96kUIjf1PJ8TVCOroU5zuNm8wu+Z4Q/5UXHT7
 IsEfdkdCnjnoBhCPvuFKGktVQtsuIxQSufT5sA0zggoJH+yf12f4dh2zvdw/dkiqkcEd
 1ZWw==
X-Gm-Message-State: AOJu0YxXUS918Nfgw941aBpgeEq20AYBM0Of3FyhKksJY7Z8XgNGMZy0
 bWZRGRnRewZyXvDXjzMk3ca1XzVHU3kfWzW46LkcXi7tH2yHZqWKoObJYO5F5qqVyAaUnE+0Bll
 MDMhHKRS+09tx
X-Received: by 2002:a05:600c:1992:b0:406:872d:7725 with SMTP id
 t18-20020a05600c199200b00406872d7725mr9307813wmq.1.1698144949643; 
 Tue, 24 Oct 2023 03:55:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1992:b0:406:872d:7725 with SMTP id
 t18-20020a05600c199200b00406872d7725mr9307790wmq.1.1698144949253; 
 Tue, 24 Oct 2023 03:55:49 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 dk18-20020a0560000b5200b0032dbf6bf7a2sm9729097wrb.97.2023.10.24.03.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 03:55:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,  Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  Gerd Hoffmann
 <kraxel@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  David Gibson
 <david@gibson.dropbear.id.au>,  Corey Minyard <cminyard@mvista.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Peter Xu <peterx@redhat.com>,
 Corey Minyard <minyard@acm.org>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Halil Pasic <pasic@linux.ibm.com>,
 Leonardo Bras <leobras@redhat.com>,  Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,  Jason
 Wang <jasowang@redhat.com>,  qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique
 Barboza <danielhb413@gmail.com>,  Stefan Weil <sw@weilnetz.de>,  Stefan
 Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v2 03/13] migration: Use vmstate_register_any() for isa-ide
In-Reply-To: <76272c6c-f7b6-4fbd-a457-8cf14048ddca@redhat.com> (Thomas Huth's
 message of "Mon, 23 Oct 2023 08:02:05 +0200")
References: <20231020090731.28701-1-quintela@redhat.com>
 <20231020090731.28701-4-quintela@redhat.com>
 <efef6d37-925c-415e-9a59-85e528eacb7b@redhat.com>
 <871qdpytau.fsf@secure.mitica>
 <76272c6c-f7b6-4fbd-a457-8cf14048ddca@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Tue, 24 Oct 2023 12:55:47 +0200
Message-ID: <87o7goz3v0.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /HdO3MPcftDa

Thomas Huth <thuth@redhat.com> wrote:
> On 20/10/2023 21.42, Juan Quintela wrote:
>> Thomas Huth <thuth@redhat.com> wrote:
>>> On 20/10/2023 11.07, Juan Quintela wrote:
>>>> Otherwise qom-test fails.
>>>> ok 4 /i386/qom/x-remote
>>>> qemu-system-i386: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=isa-ide, instance_id=0x0
>>>> Broken pipe
>>>> ../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
>>>> Aborted (core dumped)
>>>> $
>>>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>>> ---
>>>>    hw/ide/isa.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
>>>> index 95053e026f..ea60c08116 100644
>>>> --- a/hw/ide/isa.c
>>>> +++ b/hw/ide/isa.c
>>>> @@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>>>>        ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>>>>        ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>>>>        ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
>>>> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>>>> +    vmstate_register_any(VMSTATE_IF(dev), &vmstate_ide_isa, s);
>>>>        ide_bus_register_restart_cb(&s->bus);
>>>>    }
>>>
>>> Would it make sense to use another unique ID of the device instead? E.g.:
>>>
>>> diff a/hw/ide/isa.c b/hw/ide/isa.c
>>> --- a/hw/ide/isa.c
>>> +++ b/hw/ide/isa.c
>>> @@ -73,7 +73,9 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>>>       ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>>>       ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>>>       ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
>>> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>>> +    vmstate_register(VMSTATE_IF(dev),
>>> +                     object_property_get_int(OBJECT(dev), "irq", &error_abort),
>>> +                     &vmstate_ide_isa, s);
>>>       ide_bus_register_restart_cb(&s->bus);
>>>   }
>>>     Thomas
>> Ide is not my part of expertise.
>> But anything that is different for each instantance is going to be good
>> for me.
>
> It's not really my turf either ... ok, so unless the IDE maintainer
> speaks up, I think it's maybe best if you continue with your "_any"
> patch.

Ide maintainer can do your change if he likes it.  It is outside of my
understanding to accept it or not (and furthermore, it breaks migration
if you have only one device, with more than one it is already broken).

Later, Juan.

