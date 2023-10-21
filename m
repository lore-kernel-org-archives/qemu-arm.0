Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp356902ejb;
        Sat, 21 Oct 2023 07:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAzftcHau7T3h77eCWnAluTQUdM7HvBBTHH+bOzHsPzHnZquGVMAX5VcHJRp5JZscYCOk+
X-Received: by 2002:a05:6122:a03:b0:49a:c339:11b9 with SMTP id 3-20020a0561220a0300b0049ac33911b9mr4819878vkn.11.1697900247958;
        Sat, 21 Oct 2023 07:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697900247; cv=none;
        d=google.com; s=arc-20160816;
        b=waj/ltUb2X4MFEkiHTVlSxoWSt9XTlNGO/YV1Ml2VGIhj90SskAs7VCdWpSzfkwrIR
         KSIm7NK0uPYdX81QqZqmFgPys7fZ/ZMa6eXnX2U9APKF8idU5wbDJ9cnQ+w1lzfG9lW3
         3zz2ApUejvCGptw2xJaunSRy8eHDF5MnDt0obA6Lg5O73GPXXRu3Q9qLSFzqAhf36Sa0
         V52UG/mMfcE62EbzKyO3NemE6lI1a64YzioNsbThg+4y6bkCmIpNzLLunnQ2tqIYSrze
         65G8AOd6U0VJjfLDm9nf1TtrWmcCKIWFDgJFKJxOs4tA6v89cejZIIzBz+rVMpZ3bWXr
         Xm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=cv8y8BSeR3cDAPiJ1eGlaFjU36+RorcttIEYDwiVWyc=;
        fh=Q33VWDre5RMfqSbFI+qXa/jPkeJtPHqxjnwtqxUBcqU=;
        b=Q76KRnqYquvnJmGjhD1OoHyNGwdJszfTGwZ5juPRwQbcLyRWVLSf8ibX7kUQTs5pLW
         kIlAhdP10YQH3wtyQfyZL8EEoXyfGb9lmAiZ32O7zHXmH8srWOfDqDCRMn+XOIB7oTgZ
         mhMrpVBZr3dsT9CyxypM72rGwFjyDnUHbEJPStCH1f3Sg/97dh9tFacrDXyA07khMZgr
         g9gPL3fCQwPUrMk1NTQmKxNM1/uTwQxshIllWG4HrBibvblLenIsQZazyttjK6M4oOb+
         WbUgTELQKtTnKxSr4JNk2FeqqgEfWnZXGTpRJ4jf73f8c3N0f7sykITWGyobreDJoZMd
         fVPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14-20020ac87f4e000000b0041cb4580e9asi2929940qtk.674.2023.10.21.07.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 07:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quDOm-0004Jv-3z; Sat, 21 Oct 2023 10:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1quDOh-0004Ib-Uw; Sat, 21 Oct 2023 10:56:15 -0400
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1quDOc-0003Lm-Fq; Sat, 21 Oct 2023 10:56:15 -0400
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id B94528F25;
 Sat, 21 Oct 2023 16:56:01 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.16.231]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1quDOS-0Wph3p0; Sat, 21 Oct 2023 16:56:01 +0200
Message-ID: <3217207d-7b75-4354-8923-c637b19700fa@t-online.de>
Date: Sat, 21 Oct 2023 16:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] migration: Use vmstate_register_any() for audio
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 David Gibson <david@gibson.dropbear.id.au>,
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
 <20231020090731.28701-12-quintela@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20231020090731.28701-12-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1697900161-EFFFCD63-7E963AA8/0/0 CLEAN NORMAL
X-TOI-MSGID: cf83e3da-6fa2-4273-bb2a-6a3fc8781b9c
Received-SPF: pass client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mgK4kelaIo4A

Am 20.10.23 um 11:07 schrieb Juan Quintela:
> We can have more than one audio card.

Hi Juan,

I wouldn't use the term "audio card" here. In QEMU speak, Audiodev is an
"audio backend".

With best regards,
Volker

>
> void audio_init_audiodevs(void)
> {
>     AudiodevListEntry *e;
>
>     QSIMPLEQ_FOREACH(e, &audiodevs, next) {
>         audio_init(e->dev, &error_fatal);
>     }
> }
>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  audio/audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index e9815d6812..f91e05b72c 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1781,7 +1781,7 @@ static AudioState *audio_init(Audiodev *dev, Error **errp)
>  
>      QTAILQ_INSERT_TAIL(&audio_states, s, list);
>      QLIST_INIT (&s->card_head);
> -    vmstate_register (NULL, 0, &vmstate_audio, s);
> +    vmstate_register_any(NULL, &vmstate_audio, s);
>      return s;
>  
>  out:

