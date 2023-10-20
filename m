Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp987190ejb;
        Thu, 19 Oct 2023 22:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7oNK3s1yqruWBiLaSK6fAQfPaWXycFof5+GdEh2GuBV92Zx0YzDAB/T0l4FfZklQltoEt
X-Received: by 2002:a0c:df92:0:b0:66d:38e3:4ffd with SMTP id w18-20020a0cdf92000000b0066d38e34ffdmr945657qvl.5.1697778680724;
        Thu, 19 Oct 2023 22:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697778680; cv=none;
        d=google.com; s=arc-20160816;
        b=G3y12+iN7nhLrLyJ8dPFVtqr2/v5ZTgenKKRAvG+zTQ2SnuzAL5fj242NlI+AKEHAN
         eJfBmIP7dziw4Gw7gh/nIIwl+hQA0qxWcWAqTlxcyjaAhaPzKAJcykyNRq7iGeFSVY/3
         mBXH8mlRqU4kvsEZghUz3fX+JGHJZTdCDGCbzk77ck6CELA3HZeM92gK2OGF0YehfLHE
         2b3ZwnUgOEhlSE7jlMEVAppJzvnHmF85ObaK5ygao5WQ0x0+vLaork8en+Yd/3xEKjX4
         2fl+Za6LNE0Qn9d4Z2SWIIuQe/h0+MLAj0h2n0IGYztsXQ8gizeFCiehSgUbFE7sB6Rl
         0qWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Io22AlB6AmYiJqIE/pvw6w0VjuBmOEBWuqiH3e/uCd4=;
        fh=s2O/aolH5bf9QMOeGww6JJsADadz94xvxaYYr6rw3hk=;
        b=bWhiWXvmWpon4htxa9un+LN+GC6IAh4El0V1BUnbWXAesXMRle+1qKgyWIHA1pw3Az
         EuvJ3jJnyYSG2BEGc1A5KlXOSyJPcw8bD8zKKsaaElnekDvraRAnAVEZF87sYh+2EVle
         KuFQDnXgVK/HSwqv8CyNP2gQwyyUQMw3O8Wmuuj/tZDBeKHgA36fqBKkdYUh2Kb98lqw
         M6ggR6fPt3I+1vwo6LegzwUkyXZ/8y4maudDhZ8418l7iRS6BznqpuIa9NcRf5zNEh2D
         S7KCtEvmKv8FjI9lnqBIRTAg0PLDSznKO3fFpXf1wctV/PdqWCT428hUMXyb8zxlZrGw
         xuuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aPTjySM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lw11-20020a05621457cb00b0066d0038725csi828432qvb.598.2023.10.19.22.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 22:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aPTjySM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qthmc-0006G0-K3; Fri, 20 Oct 2023 01:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qthmZ-0006Cy-8u
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 01:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qthmX-0008Nt-Mb
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 01:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697778643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Io22AlB6AmYiJqIE/pvw6w0VjuBmOEBWuqiH3e/uCd4=;
 b=aPTjySM8/hVzYH4UbIo9jRAAJ0FP4mJnG8PoPXBf2izsi3OuNDyhQAF7b3aGXJsChD4t8G
 g0HCZCWXFqvIfxwPqHFIzXsVitybI7dgQfGvUudDlhFHPvennaZTTTcWgtS7epH/fyp/mU
 I9WR+QMpSTgtguG+EoaFCUHw2NNT1so=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-tUrHDvelOSutQy2csxEaJg-1; Fri, 20 Oct 2023 01:10:38 -0400
X-MC-Unique: tUrHDvelOSutQy2csxEaJg-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-778964b7c8bso45531285a.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 22:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697778638; x=1698383438;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Io22AlB6AmYiJqIE/pvw6w0VjuBmOEBWuqiH3e/uCd4=;
 b=n3svhVN7hoQ+Uoi6cdmypWQLW/s9bDMhjMmPJtxMhqIGn42cPiX/VqEJSQ/SclQbnB
 8/x0ORVkW4XQjhmjLVupa4iwJYltzXEAiom+n4d/pcAnxrhSxU+qhcYKFLAkrlDXAerr
 4lvOh73AS2p/RUOzUO44bpg11o0HST0lN8OiypsapvIbDvVF5BQ3Qbj5DtzQ1gFWDvpV
 /CIrl86cYP5qZvyDxqCHB2xGcdSzpa0j4ODlVSMcvMRKkkRPspRnb6MG0r8vApoHwswP
 XwMuJnQ5lyhwTjYdnRosY/39WvOuSvbCJ1i/xitSploULtrfyuO33HX3hoKgXZ+u73c1
 aM8Q==
X-Gm-Message-State: AOJu0Yyt+KVrlvWjy2jgNKWQXQSj1/ivW0QExTICA9F46vcVbs3ovRn3
 9+vVdAV2OuMpy8G5hn0himt2nACd39+Wmi6CGNNBuQIcGwNWrqlzVYvCToG566qnnIGyQkGl8Kw
 y7an5PUK1CsuC
X-Received: by 2002:a05:620a:254c:b0:774:106c:7df9 with SMTP id
 s12-20020a05620a254c00b00774106c7df9mr828648qko.11.1697778637913; 
 Thu, 19 Oct 2023 22:10:37 -0700 (PDT)
X-Received: by 2002:a05:620a:254c:b0:774:106c:7df9 with SMTP id
 s12-20020a05620a254c00b00774106c7df9mr828632qko.11.1697778637635; 
 Thu, 19 Oct 2023 22:10:37 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05620a090700b0076f124abe4dsm348676qkv.77.2023.10.19.22.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 22:10:37 -0700 (PDT)
Message-ID: <81b1bcb8-4217-4324-8bb5-8edde40a1838@redhat.com>
Date: Fri, 20 Oct 2023 07:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] RFC migration: icp/server is a mess
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Corey Minyard <minyard@acm.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-8-quintela@redhat.com> <20231019224935.03232495@bahia>
 <f5245b42-2a0a-430c-b10c-e9d3530af80b@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <f5245b42-2a0a-430c-b10c-e9d3530af80b@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: efVjegxDWC5D

On 19/10/2023 23.15, Cédric Le Goater wrote:
> On 10/19/23 22:49, Greg Kurz wrote:
>> Hi Juan,
>>
>> On Thu, 19 Oct 2023 21:08:25 +0200
>> Juan Quintela <quintela@redhat.com> wrote:
>>
>>> Current code does:
>>> - register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
>>>    dependinfg on cpu number
>>> - for newer machines, it register vmstate_icp with "icp/server" name
>>>    and instance 0
>>> - now it unregisters "icp/server" for the 1st instance.
>>>
>>
>> Heh I remember about this hack... it was caused by some rework in
>> the interrupt controller that broke migration.
>>
>>> This is wrong at many levels:
>>> - we shouldn't have two VMSTATEDescriptions with the same name
>>
>> I don't know how bad it is. The idea here is to send extra
>> state in the stream because older QEMU expect it (but won't use
>> it), so it made sense to keep the same name.
>>
>>> - In case this is the only solution that we can came with, it needs to
>>>    be:
>>>    * register pre_2_10_vmstate_dummy_icp
>>>    * unregister pre_2_10_vmstate_dummy_icp
>>>    * register real vmstate_icp
>>>
>>> As the initialization of this machine is already complex enough, I
>>> need help from PPC maintainers to fix this.
>>>
>>
>> What about dropping all this code, i.e. basically reverting 46f7afa37096 
>> ("spapr:
>> fix migration of ICPState objects from/to older QEMU") ?
> 
> I'd vote for removing the dummy ICP states for pre-2.10 pseries machines.
> Migration compatibility would be broken for these old versions but, with
> a clear error report, it should be more than enough. I doubt anyone will
> need such a feature now days.

In that case: Please also put the pseries-2.1 machine up to pseries-2.9 onto 
the deprecation list, so that they can finally get removed after two 
releases. It does not make sense to keep compat machines around if the 
compatibility is not available anymore.

  Thomas

