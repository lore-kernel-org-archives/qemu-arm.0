Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1006968njc;
        Sun, 8 Jun 2025 22:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDynyZg7BKGQAkEM1+m5omprWs+ABVay3ZbatYDLvcGYPpUOPBdko+0lVDE04znWrP7psM/+MQda2XiA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIzqOSuWxestVIubapgZyElHvWymbp2549SVwnl1BjiNMUmODiXRJYOXSX4FIOGLJbivg7
X-Received: by 2002:ad4:5ae5:0:b0:6fa:c41e:ccae with SMTP id 6a1803df08f44-6fb08f5f7cfmr216853746d6.23.1749446211752;
        Sun, 08 Jun 2025 22:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749446211; cv=none;
        d=google.com; s=arc-20240605;
        b=P0kytVDBPcxWQ7tDoP7+KCJjlW369qjUs8yVFC4/2JfedXkxbKypnRVOgwsKc+4OdG
         WZIkJFnsqeJ6loblaW6DKNgqSi2J4jdk3Rr39gmAGZznS9/0pYcapQK2rDHKzrYSiJcZ
         rscs+HJ9LT9SAFlnqtD3BYnWzeG6Ufc6QqXlR6Z76p+aFkvVqNG/K4GCuZrpoSvl/eTh
         LP3q02ozV6zfKLKTWeKLt/Jh55Ja3sad9NsB06+ShqZrccrQvFCez3k9DfI0Rod22Y5p
         X3I2RSaaS/dOQ3XEuOcwZ3oD3oTd8mNj2RdTTorKsA3AJ5P61LH54l43g6XDU/qQnx+v
         WiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xIj3bwdK3xF5l0idjlHnLpavp2amLY/arr5aX2FHYIs=;
        fh=6oPwesARcyO6WK7jpzfCuBbIaU9h43UZgkSFHmhKYpY=;
        b=Mr91lMCSsa8MDPgzCViFwst15uoHxa+2Uwo/11qKcV2OzlgQTK9zdQPo2Tmm4zaD+0
         U+XgA7mS/Plv/pU29n1x04b1fAAfk6gyND/PTJ+7zelX7iO9xQKYEeHiUAaukPr0EE2K
         wg/T3IG/rQFtmwURtzfUnPgBhwVnQ++BZ+ttJC/eki0NREZZtnYs2pbnGIycYyZlyqPw
         MN16gj1iKLDNHXS40/6xIV8zEcp/ivUEDNAa1SmU186AehAeavc2KBmQ3B48CvLxeSiv
         TMR+fW2+z+LkJykxu4RLa2VQ7KMjl7XQThotFmvYYZd120Hi/Lt9ZKJ5D/VtZj4nNPhj
         to6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HCdwUZhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b26478si70076876d6.297.2025.06.08.22.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Jun 2025 22:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HCdwUZhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOUs3-0005E0-E2; Mon, 09 Jun 2025 01:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOUs0-0005Dg-5s
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 01:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOUrx-0006nX-5K
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 01:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749446184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIj3bwdK3xF5l0idjlHnLpavp2amLY/arr5aX2FHYIs=;
 b=HCdwUZhTvR3TeVTm5iHjvhuZVGbG7Y7UNnlU09TGGPGsVrO37JlXEnBs75+PeoMNrif0rM
 36q+YKtnz9DF/VfaYGuxTAesAglD7Dn0YZciteeqMYmENWQSIzE5LsKABFJPMlSZBxi4CH
 JHbwSCUO+6ftdYtZyGTkodsGTXEqX+g=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-3HwRRBb5PC2iA3vmSyRcAw-1; Mon, 09 Jun 2025 01:16:20 -0400
X-MC-Unique: 3HwRRBb5PC2iA3vmSyRcAw-1
X-Mimecast-MFC-AGG-ID: 3HwRRBb5PC2iA3vmSyRcAw_1749446180
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-234aceaf591so26408405ad.1
 for <qemu-arm@nongnu.org>; Sun, 08 Jun 2025 22:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749446179; x=1750050979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xIj3bwdK3xF5l0idjlHnLpavp2amLY/arr5aX2FHYIs=;
 b=t/HELLM5kl4JuDDub7WToXFZD5Ahrze4GnNBcDKjjTrNY6aGl9bVLMLVflxcw8KZ5k
 yoA4AkWHPf/AN6jiYDZphYd19j6RT+GtE0ZOeb+82Dh/u7RwmcMxi/bN8tWsLspsKwGg
 aDcz5hgJCWruF+1vHBzjYJ4Ejw53RZSMTCCTD7azhtgS6Z/vaOSSdkCTqa62e0ydNg35
 nb2upFbkihap648a/8j8yJbEc9JBhWESkF+bTyVXHzz9CuwZFcXCZ/xdr6NWIPgZmBa6
 fUZisx6JrlCL1FgzCgezS3F6JC5j8w3tjAfVmylfuCXcz/ltBrmmAywT90vN24BpIUJN
 9MTg==
X-Gm-Message-State: AOJu0YxMdQv4HhSyGwJFEULfBJj27+tZhhwYDgQB6Ph/l8wXoNG66FgV
 kqFYAYrK3uqugtEJzIW2Aqcdt5xbMWTKC+tdQTP0oABxCW9Rpg01X62Vs06c/6qYbA9X9gPeGIp
 6ysU6Bpd2LUuLcvygR0gLU98Jso8egTY1wQhEkhHpcNu51wD4R8zfIA==
X-Gm-Gg: ASbGncvt3Y7QKztBNwweGtlFy29wv+C3YBgtlWyj1S3XXSNaMvbD5tatC1Th9X6ICcO
 4CllVaATJ3Y0hvHddzJBHYbqCQeIAPV+ftDHpxbyIzj36EPQCrxgShew18tdbp9DV3zoLMfObbT
 +ORPrEqzVaVEaPsm13S1+UowVBHDOZH9v1VFvZjkL4Ww7qqdlrWCJJa+PrMx6yxSx6ii96jN+iz
 LjdLgMWn2OhtpRvYXxkl4040CjlZMctlx47OeRBhV7qpqjMc7ze2v8XVu0QSPInSDR0fKLb4u3v
 Krx+qwKTYcc9p1o=
X-Received: by 2002:a17:903:1107:b0:235:225d:3098 with SMTP id
 d9443c01a7336-23601debd84mr163972025ad.46.1749446179587; 
 Sun, 08 Jun 2025 22:16:19 -0700 (PDT)
X-Received: by 2002:a17:903:1107:b0:235:225d:3098 with SMTP id
 d9443c01a7336-23601debd84mr163971805ad.46.1749446179288; 
 Sun, 08 Jun 2025 22:16:19 -0700 (PDT)
Received: from [10.66.193.79] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603077fcbsm47245675ad.47.2025.06.08.22.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jun 2025 22:16:18 -0700 (PDT)
Message-ID: <c2e0ece0-1ee1-4867-b01c-20e847ef6af3@redhat.com>
Date: Mon, 9 Jun 2025 13:16:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ramfb: Add property to control if load the romfile
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20250606070234.2063451-1-shahuang@redhat.com>
 <aEKeNSc8mAZ8vhGj@redhat.com>
 <cf34f5b2-d422-453f-85d4-15938ae59e9f@redhat.com>
 <c373ee81-d094-4b40-93c9-5ece6e24e520@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <c373ee81-d094-4b40-93c9-5ece6e24e520@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qvhj1BT-_x6qeR3boa8UUze4zoWhdH7L5XRWAjJwf8Y_1749446180
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QVN+xXqnoQ+O



On 6/6/25 4:07 PM, Cédric Le Goater wrote:
> On 6/6/25 10:06, Cédric Le Goater wrote:
>> On 6/6/25 09:52, Daniel P. Berrangé wrote:
>>> On Fri, Jun 06, 2025 at 03:02:34AM -0400, Shaoqin Huang wrote:
>>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>>>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>>>
>>>> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
>>>> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
>>>> for ramfb, so they don't need to load the romfile.
>>>>
>>>> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
>>>> device, because the vfio display also use the ramfb_setup() to load
>>>> the vgabios-ramfb.bin file.
>>>>
>>>> After have this property, the machine type can set the compatibility to
>>>> not load the vgabios-ramfb.bin if the arch doesn't need it.
>>>
>>> Can you make this a series, with an additional patch that updates the
>>> current in-dev machine types to use this new property, so we're clear
>>> about the proposed usage.
>>
>> yes. And please change the vfio-pci property name to use underscores.
> 
> Sorry, to *not* use underscores : use-legacy-x86-rom

Thanks for pointing out it. Will fix it.

Thanks.

> 
> 
> Thanks,
> 
> C.
> 
> 

-- 
Shaoqin

