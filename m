Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp353060ejb;
        Fri, 26 Apr 2024 05:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEei2BICK02OJWWaq5NrRuEcc+cTwO4f05mwRR6hv6jY1zlC4PDcXXQWqVCFSpfVfHWev5OqqYqXo1VMu/9oPSsQzAbjSL
X-Google-Smtp-Source: AGHT+IFB4LanCy/pBPmdQp22DOpCiUEQoDtTRef0lYSCc87KCSTrduUuop5q2TUhxsgUjdj73fmD
X-Received: by 2002:adf:eed2:0:b0:34a:687a:8f66 with SMTP id a18-20020adfeed2000000b0034a687a8f66mr1950704wrp.45.1714135092859;
        Fri, 26 Apr 2024 05:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714135092; cv=none;
        d=google.com; s=arc-20160816;
        b=nehXS8DrJzToZJRVD5gbN7CWM5xyJXg+2GCHHha9mB2FtuCNp9VdWko2P/eD97jwIR
         tsaaFK/EP3EABVYjAEzlxE0VryzH0urYfrcuUOgzIkZ1UcypMf5lC3TjbpvNZTMrXKDI
         HMNh05uhO2nPNEM8HerXyrRN/YOubN6fgU/t9y/X6NWjbJPjy69jd3Q2x5u5ZVRJWYur
         N4CLQ9bH9VYN1P2Q4NK3gpYdZDfZ5ZL0I/g3ZTfsxrpl65hmcha2P5BBKr9uChMRHv2z
         JSYHVt8cCaEg8KYy5Jp88OjJLNtfi2BdYRNxz737BCrZiUVWMBzv4NIe9LvCJtm8HT0B
         jdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=84KvDHn/TfmhiUjTSsZnlfjC1UfE24BmSKedho87RP0=;
        fh=mtHrwQv9X3UYwST+rGP8ujb+po9QkcKBCKEpDNSm7nk=;
        b=KDy47I3LZSm8O9lhRH700bybXxpAqheIsANq/edZ3OCBRQTBv6DkE65m2MYmTQLUkF
         CsXmi+Ns6fsojtPUpHSAP9yP4jyYsV+oN3ydfRH9oQI6+ZiCPIE50obNjkOU2KUmEWfQ
         E0WGjEw+e/AzG2wPJF/b2z6zUnxikS/3Z5Mga+AzFy+NAIz4dM+jAFIqLUvUTCduXjKb
         FpYDDDUZgJTLaeULwNscAcwrbd0yGp8jXRxk1XXe9ZhYV4cA0DkWXlaJFkMsP/tEJbdT
         reccAf3H488igBMqTgIIxKDB6XS1JRH8IGODfVIHOTgKgJjdf6db9/DGX9YX57GJACWE
         GqeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zrBJ29a+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020adfff83000000b00343e89672f7si9685977wrr.58.2024.04.26.05.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 05:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zrBJ29a+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0Kpt-00087o-U3; Fri, 26 Apr 2024 08:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1s0Kps-00086Z-AA
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 08:37:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1s0Kpp-00089L-8V
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 08:37:52 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1e50a04c317so11693125ad.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1714135067; x=1714739867;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84KvDHn/TfmhiUjTSsZnlfjC1UfE24BmSKedho87RP0=;
 b=zrBJ29a+C6CtU2Iu5/wnvq4rzzOlJtVQ9MqVJ48JfyeOP15EvNDy4vo5egcAdOS7o6
 KLR7zr46RFYHqUInfjLUdyXoTfyYOfbJu+L2P5BNc+iTlHkUrNKKkCazrfXN+y+qL7Gm
 T2wO5CIOkIa0dg9hNQ5w/BQ9rz6wIKUe3zIMtY4c1L792rT94ldAP8sXVszM2v3e0jNN
 E5iap3RJCFKqCDobIC1J0tbjslM7V/PmaPeqGDhUV5nZJogUmu7fC7dwNOjC3++7C78e
 TulfKETWNK2752kDnOsOWUjxuy3YOh7Q8zDfnFRhhx97fqJ/1DieBScBDOmABM/b0fK+
 a0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714135067; x=1714739867;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84KvDHn/TfmhiUjTSsZnlfjC1UfE24BmSKedho87RP0=;
 b=BhJDOUFidcFz79Q3XxJZQ0r37k0z4K9rQnpDpmnhZZnv1bSE6aEi8/YtJz0CICWG+N
 qlpQGG/Q46CgWVyg+qIl6YTu1ZkqdQtbEfMgtRM5N2JD9ZOXdMdpaH1GCAxRC6MQaKXK
 iJYr1SmqhY/lIAn3uMM6g9SfWAgxrIVemXwJq/aDLjTyWXXgaHAAn26xjmeqrHIJZbZS
 WxSjyjw1pmihjscvKFFiL2s4akJ/hDHFL79XkztpCOnJFYxnxgJHj53lWLCyHFJPA8CA
 HNpxbRlyLItFUr/LCR+sECQdfwCtMfYVG+nXTde8m6LS9LXtB4sivOlEym/WNJe/f5bl
 KWZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkBT8OEr3zjuwGHOriTMwAKhsmQjixKEewq5/e5kjUFoN5TVCJLVlL9i1CxPoGIoz8JW+uNz7+X95TQwTPWc3mdt0L
X-Gm-Message-State: AOJu0YxMi+tkTk46djS4n8HFp9Z0nE437qw7ykz93WdAdkc5GsamgmvQ
 /csYKcuWzrph0qorDVTtzPmZsIVd4r2/BMnV4rDOgi6bSuv5x7LEHG2e4/UBJiM=
X-Received: by 2002:a17:903:11c3:b0:1e5:5bd7:87a4 with SMTP id
 q3-20020a17090311c300b001e55bd787a4mr2751334plh.16.1714135067327; 
 Fri, 26 Apr 2024 05:37:47 -0700 (PDT)
Received: from [157.82.202.162] ([157.82.202.162])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a17090320cc00b001eab1258197sm3094392plb.144.2024.04.26.05.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 05:37:47 -0700 (PDT)
Message-ID: <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com>
Date: Fri, 26 Apr 2024 21:37:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to qemu_new_nic()
Content-Language: en-US
To: Thomas Huth <th.huth@posteo.de>, Prasad Pandit <pj.pandit@yahoo.in>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
 <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
 <1497808863.2030924.1713955286878@mail.yahoo.com>
 <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: a063gih18/X+

On 2024/04/24 21:32, Thomas Huth wrote:
> On 24/04/2024 12.41, Prasad Pandit wrote:
>> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe 
>> Mathieu-Daudé wrote:
>>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>>> device is engaging in I/O. The network device backend needs to 
>>>> update it
>>>> when delivering a packet to a device.
>>>> In preparation for such a change, add MemReentrancyGuard * as a
>>>> parameter of qemu_new_nic().
>>>
>>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>>> any clue?
>>
>> * CVE-2021-20255 bug: infinite recursion is pointing at a different 
>> fix patch.
>>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
>>
>> * And the this patch below has different issue tagged
>>    
>> -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>>    Fixes: CVE-2023-3019
>>
>>
>> * They look different, former is an infinite recursion issue and the 
>> latter is a use-after-free one.
> 
> I assume the eepro reentrancy issue has been fixed with:
> 
>   https://gitlab.com/qemu-project/qemu/-/issues/556
>   i.e.:
>   https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3

I agree. Commit c40ca2301c7603524eaddb5308a3 should be what fixed 
CVE-2021-20255, not this patch.

Regards,
Akihiko Odaki
