Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1483689ejb;
        Mon, 23 Oct 2023 09:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJqh8a4xjQXXdawbycR7bctAuW0gzw6ATa7Pu3HbNS4Igo23jf6/1UE+Bf/bHFrqS2e0m4
X-Received: by 2002:a05:6214:e6c:b0:66c:fc76:7936 with SMTP id jz12-20020a0562140e6c00b0066cfc767936mr8434181qvb.48.1698078589583;
        Mon, 23 Oct 2023 09:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698078589; cv=none;
        d=google.com; s=arc-20160816;
        b=kIZtfpR8l9yvdPcGYjuuvwAzMd1b99I4cS05rCGP+kD7rhn3GRYCL1LqtdpqzvBg9N
         k67IHpzaQLRg31v9s1A9qERcs1FNnPsZf3wZ+pG5t4P4gs3TmffqewqOjc8zRyoIZYDA
         ynyBxdzAtW/xkHNgrSyb5Yjt4Dcibvg8Y1ej7lbtIWNAoewTfb/mHZopCrogloxgxNZ0
         0p+xgo7CxYeGC/NirxTNgxt9qvgNTb8ZEJZy++xL6a8NAF6cMnLuRHqshmA6v/JnN/5K
         Nh3TYldYq6KMrowBH9j6kIQYjAj2vGL7ke0/4zkmMaBeSCLzLQ2g+6v1He2WLkqJk6Xl
         S3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=j+S1oe8c6aSHirMXsKWZVm5ZrHQzDWrrjasdjCRlJQw=;
        fh=IbhD48sRtcT7MOugQFxwMYTU4DGWpwWoUnUetW2XHBY=;
        b=volcJHGABwYrDaglfHfnEYVCuaRqU47cAlMkHWzy5AGQIGh5xr+M775G9NfAlP7XwL
         EV4QbtAhOlYmPn8SDsm5d+VVRfQ2ZlUI/xNvEx7oVvHwCTvY1u4725ZpG8TROlIlRMZP
         lDH6uaXJYdGiilFr2Hx/O3J4oO5qePbT5yWLKPBJCyX/GG+Uk9xhRlFnFwrPh7Vjc6vf
         r3FUvCV4ONoB3gX9cP69fUswomhUdGHd03YebfIFKmipGE70RQ060MFCK8YjkI9XRW6O
         97InL67LoX+aIkK939MxOcTlVHkW1bGzWp9Ftyo6v8ZI+iCVEph0BE2DcrNjWN7g/zMl
         BTZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A07089uZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dj18-20020a056214091200b0066d14dca029si5772434qvb.555.2023.10.23.09.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 09:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A07089uZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quxo3-00071J-8u; Mon, 23 Oct 2023 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1quxo1-00070T-Pn
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 12:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1quxny-00052y-TS
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 12:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698078565;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+S1oe8c6aSHirMXsKWZVm5ZrHQzDWrrjasdjCRlJQw=;
 b=A07089uZwGNSfZ9Vu4H0P7o7192nsgjdJTpZW43bc87nsrVEFgAqL8hBhAMhAc2LS7DhRG
 lzdhtgzEoZhSW1lrQzDGryvLna3iZpSjuuxWg6YF82Bo+mj6RE8n7Ggm233Tz7iJgKTqLK
 fBTPoc9XjBg5P9efuLtiB/o49JKkjoY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-iYi-bJlhMUiAkaP-TFynvw-1; Mon, 23 Oct 2023 12:29:24 -0400
X-MC-Unique: iYi-bJlhMUiAkaP-TFynvw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so22057715e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 09:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698078563; x=1698683363;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUODFSYjipcgmzOC15MVxjEsAVqcfyFfniq3Ax+2nEQ=;
 b=cD70nKPDzpvSYN6yOqdK4hplpOlfXTq4su27nvuGO6FTSBEADpy28uFn33K5X0z/U5
 aVEMjNAMSvVoYGnTxXI+aFNoeu9ssHKhu39ak0lo8aIHZuA1Lm/Ia4Vc6bEPnsfK3kjK
 XQ7MNIoThW3+r0aj8xPV2jjSEg2Xpsw62KlwlNdM0oruxIvWl9ajsvvW8CEoeXkpi2fT
 Dq608n//VO2JYMJNSY8t8RSOa7R2B3A8frZ/DKaVkXm1cKY3SHUhK3X4Z2KL6oE78oqn
 Y8+3OLpU+RByhMwWlEacat7CI5YTWJJUSH0MtPK1uaWqsYWc7dcQtmZedgIFh4f2FHaj
 6ozw==
X-Gm-Message-State: AOJu0YwgngT/0S7Ns9k305/t0quSbeA+zToc9vXlzZx7zrnaVgnmYDha
 770dViClw80Rm6DyTzAmPu76IQCv1dYKwzLPdLz26CYedZg7e2G/+53FT/GUJVGy9pFOsy4zzPq
 SYXSTpVRIHZ8uVSRqqLKR
X-Received: by 2002:a05:600c:1c8d:b0:402:ea83:45cf with SMTP id
 k13-20020a05600c1c8d00b00402ea8345cfmr8228575wms.2.1698078563116; 
 Mon, 23 Oct 2023 09:29:23 -0700 (PDT)
X-Received: by 2002:a05:600c:1c8d:b0:402:ea83:45cf with SMTP id
 k13-20020a05600c1c8d00b00402ea8345cfmr8228534wms.2.1698078562660; 
 Mon, 23 Oct 2023 09:29:22 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b004065daba6casm14798055wms.46.2023.10.23.09.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 09:29:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Harsh
 Prateek Bora <harshpb@linux.ibm.com>,  David Hildenbrand
 <david@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Eric
 Farman <farman@linux.ibm.com>,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  David Gibson
 <david@gibson.dropbear.id.au>,  Corey Minyard <cminyard@mvista.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Peter Xu <peterx@redhat.com>,
 Corey Minyard <minyard@acm.org>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Halil Pasic <pasic@linux.ibm.com>,
 Leonardo Bras <leobras@redhat.com>,  John Snow <jsnow@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,  Jason
 Wang <jasowang@redhat.com>,  qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique
 Barboza <danielhb413@gmail.com>,  Stefan Weil <sw@weilnetz.de>,  Stefan
 Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v2 11/13] migration: Use vmstate_register_any() for audio
In-Reply-To: <3217207d-7b75-4354-8923-c637b19700fa@t-online.de> ("Volker
 =?utf-8?Q?R=C3=BCmelin=22's?= message of "Sat, 21 Oct 2023 16:55:59 +0200")
References: <20231020090731.28701-1-quintela@redhat.com>
 <20231020090731.28701-12-quintela@redhat.com>
 <3217207d-7b75-4354-8923-c637b19700fa@t-online.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Mon, 23 Oct 2023 18:29:21 +0200
Message-ID: <87o7gpb8v2.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wCoORr6mdWfc

Volker R=C3=BCmelin <vr_qemu@t-online.de> wrote:
> Am 20.10.23 um 11:07 schrieb Juan Quintela:
>> We can have more than one audio card.
>
> Hi Juan,
>
> I wouldn't use the term "audio card" here. In QEMU speak, Audiodev is an
> "audio backend".

Thanks.  Changed that.

> With best regards,
> Volker
>
>>
>> void audio_init_audiodevs(void)
>> {
>>     AudiodevListEntry *e;
>>
>>     QSIMPLEQ_FOREACH(e, &audiodevs, next) {
>>         audio_init(e->dev, &error_fatal);
>>     }
>> }
>>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  audio/audio.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index e9815d6812..f91e05b72c 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -1781,7 +1781,7 @@ static AudioState *audio_init(Audiodev *dev, Error=
 **errp)
>> =20
>>      QTAILQ_INSERT_TAIL(&audio_states, s, list);
>>      QLIST_INIT (&s->card_head);
>> -    vmstate_register (NULL, 0, &vmstate_audio, s);
>> +    vmstate_register_any(NULL, &vmstate_audio, s);
>>      return s;
>> =20
>>  out:

