Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp96098ejr;
        Tue, 10 Oct 2023 05:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvo+iP0pYG5kwOA+LORFdXck09c2g1aoh/sQayzgxbEqCDLsWsXWHoKS9JB/L4LFw1WNHs
X-Received: by 2002:a05:620a:4086:b0:76d:95d0:c80a with SMTP id f6-20020a05620a408600b0076d95d0c80amr21053357qko.3.1696941016973;
        Tue, 10 Oct 2023 05:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696941016; cv=none;
        d=google.com; s=arc-20160816;
        b=Whm+pB3ffZR+Aa1YRTeq595D/JylX5sfH7wUooR3q1xuySlYzK5CdgU+GZJ8e/oLEU
         AxKt9bxcirtguVoP47xHpfhWj327d29QkgmLpRBNxNiPOrTz7exbn1XfuC/hii2gBtGF
         wE72IPnLWf5lpDG5qOp1xEHXGqWhGMs240hZE2g4kLiNQjjBTAlSbGYe3GBTD+rQWFNw
         KC+NqB6LS5UYs5lb6J6lroXgv9JD0teZoPkjYHXlTmmjV/EKazxKl+1wC6uRE/1ovret
         PCWWZu47GbeT+OBDti09eoij2COphBZk8xNYAclcwuOgO8qfdFKLdinnVuG1/lLKeVDA
         Gkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=wJR4xC9606co7dSQlfPW5jDHWljPr+m3uMn45BJj0E4=;
        fh=wCeULhrNsm+4bwIA5o1huR6iEhWuKio5Uqtnu7dGbKk=;
        b=D/JfuubVBhwHBWYmsgmoKEy7SXBALlyHeS0Hld4fmmJVs8qtE3IhHZz/9REbXUztEx
         MPVGtXawk7BTVCjG/3ZkR+BWjJxclfiXbl/B6wGL3l2LXbWzZ5kn2BVnmfQNTrIIukb6
         tKF9pdR7+TepwHXRBJELxuT+A3PjHgiWJdBLWztIxpOSe+Tg72ODrrYP/HqBqgj1L4iU
         tWu9fSRmwk0k+tpn2SFLHC/xWRPvNthReT20AiBN4gdIIUgPlKX4xodZpeVnF6nyLTQv
         WCj9mXPgf82Sttbvud6FizPUfOAtTLop5jmfXo8TQrUMPp8vsmdEJWIk5jPI43QqJlh+
         3L5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05620a245100b0076cb7c7d9d1si7582546qkn.637.2023.10.10.05.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 05:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqBsB-0004tg-Mk; Tue, 10 Oct 2023 08:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qqBs9-0004qg-6w; Tue, 10 Oct 2023 08:30:01 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qqBs6-0007px-3T; Tue, 10 Oct 2023 08:30:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A6B27748FF4;
 Tue, 10 Oct 2023 14:29:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7457C745681; Tue, 10 Oct 2023 14:29:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 71E797456AA;
 Tue, 10 Oct 2023 14:29:00 +0200 (CEST)
Date: Tue, 10 Oct 2023 14:29:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 16/18] hw/sm501: allow compiling without PIXMAN
In-Reply-To: <6365e1f5-bffe-ef11-7e9e-55077e66c4d0@eik.bme.hu>
Message-ID: <cf0800be-046c-8073-96ce-023dd02469df@eik.bme.hu>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
 <20231010073830.606570-17-marcandre.lureau@redhat.com>
 <6365e1f5-bffe-ef11-7e9e-55077e66c4d0@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0ISPCImOF92M

On Tue, 10 Oct 2023, BALATON Zoltan wrote:
>> @@ -2169,8 +2195,10 @@ static void sm501_pci_class_init(ObjectClass *klass, 
>> void *data)
>> 
>> static void sm501_pci_init(Object *o)
>> {
>> +#ifdef CONFIG_PIXMAN
>
> Do you still need the ifdef here if we keep the property even with !PIXMAN?

Maybe you intended to remove this help message because the option does not 
work as documented here. In that case maybe add an #else with help saying 
not effective without PIXMAN, always 0 or similiar.

Regards,
BALATON Zoltan

>>     object_property_set_description(o, "x-pixman", "Use pixman for: "
>>                                     "1: fill, 2: blit, 4: overlap blit");
>> +#endif
>> }
>> 
>> static const TypeInfo sm501_pci_info = {
>

