Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp41223dye;
        Wed, 25 Jun 2025 23:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFeA3LnuU5l7rHX+7Ne6/kI0HIW9qRuZodR2gAT0TPKewxvfwKScT+l0Pb0mvrkpH8YkCKZgWowUqtyA==@linaro.org
X-Google-Smtp-Source: AGHT+IH2TAEAvftJaDh73WUD4vu5kg1l94BZWqHZZZzi+0ktSw5W/pVS2c53mceNRo4K2GA/Z7J2
X-Received: by 2002:a5d:5f01:0:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a6ed652db1mr4475074f8f.55.1750917727287;
        Wed, 25 Jun 2025 23:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750917727; cv=none;
        d=google.com; s=arc-20240605;
        b=DND6OEnOFoxBtMMlSeSYZkXJ21jhj1Ngnlgfo56+KRICxoGXr6WvqMj2M7Srwtm4wn
         6tt2R2CWQX8erRBTCCF+zeMCN4ac74jyZJZm9CgmVYTeu5zAgXTozGc3X1d96NqCkQHw
         LbGwZVjCOh5ruMK/x3CYMSQXfBPGviujyq1B2IVdSPpArLsJ70bRYmEXCfK1BgfZRdDC
         rPz9N7dJaMK6bU6F1eB8jREV8lV4YMlL8fus6TSoU2V2F/v2NP6Dkdy9P+xnRvpkkDCI
         egcqo//MNbyDyon8QHFIvyfk74nkzhcDRBJxL2RQw0BCe/6KzvCkTpwyQG46ATlFfEQN
         Ok+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q1jWGIOyAoDc81Q1gUvVIux0jXH0jqzlqnZ7CJjPgEM=;
        fh=KGUtmIJb20GdH2eESSk62R8aHwmYzbcTRuKZe0fnpLM=;
        b=gKWFFWFcdwlO9CuWsleBxTYL/XA1We5CqkmQoL+caRTUNVrhS6O6Nz5rkyUgmdiBCf
         QsF3P9/zdYSATqQHuVmLFKlvFGndnXGLvIATrefYhR02i6k6XK8vDzBELiIcL2auuAa2
         pzXy+zK5RaGO/jX0ytLgwf/jkhs/dXZigHOu7Ddt2/ZeDwZ+2IDSPwR6Oop35obXrkSs
         uUqNsg4LN8+AuYPRuhqdVEHiZXgIt1xiCVtivDa6qGTFia5lS8YFpO74X2e00hzIJQmr
         GR1jdQl0ZoiJ0z3ff3AyRSHgEFWfQzaKPH0hH1qJg91KTaziGEjR4Spwj3maL2yCsXAt
         eEZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TgKwsiI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80e23d7si4444485f8f.255.2025.06.25.23.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jun 2025 23:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TgKwsiI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUfgI-0006Un-DX; Thu, 26 Jun 2025 02:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uUfg8-0006Ln-3I
 for qemu-arm@nongnu.org; Thu, 26 Jun 2025 02:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uUfg6-0002Mz-2H
 for qemu-arm@nongnu.org; Thu, 26 Jun 2025 02:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750917700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q1jWGIOyAoDc81Q1gUvVIux0jXH0jqzlqnZ7CJjPgEM=;
 b=TgKwsiI9Ja7CFxst9LNNSryesdZiRpn9fs1wuI5nx3wdWCHPzrIDFvWwUkv8ImKy4JYMVR
 RxS6WqvAeQ5SsO785rCBAPmXLC55bpUVFOEugxgTh5QOjWm/AQbrPeXXUdtlEIOygtIzVL
 ONKCVDVxXFIcLUI5GvhMwiHn/QPZznc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-rIl-Td4nP9idKOD-sBKxHg-1; Thu, 26 Jun 2025 02:01:38 -0400
X-MC-Unique: rIl-Td4nP9idKOD-sBKxHg-1
X-Mimecast-MFC-AGG-ID: rIl-Td4nP9idKOD-sBKxHg_1750917697
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450df53d461so4126275e9.1
 for <qemu-arm@nongnu.org>; Wed, 25 Jun 2025 23:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750917697; x=1751522497;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q1jWGIOyAoDc81Q1gUvVIux0jXH0jqzlqnZ7CJjPgEM=;
 b=USG6LNxK+Am+1RKUh6JLZEd0VpKvK1/eJ08IUfDndslfyUELOP9mpQcAMOMl3OMD9s
 bjMuDOVf5eKskSLYwn/id9HvQqbUfTroYOHxpu97GzPRTOdkV/K49XXefyJlM9fHdKcr
 p785ONj5DRxJWgNy6D7ZPHV7uadSYFv3ajKhMJaPpJAriUlIBD383fiCYeLFRnOmzB+I
 MaF3pbgZ2Z6s3HZM4VWoGifeqI8l2jh8YpvtH6XcIXTU/g7v33yVCp8nIZ9ba6Q56qY4
 k3ZLZZI9P24FdeFSo1xd3HbV47qbfrXhH5tRF3glFbrWE0H8VoHGTiLVMSyVRF7X6z8z
 bEIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuxefuIzwJMyNy/9L46VV7N9lq5lebdfiQlpo48pDi8wSS8nocayUSwgsbjwS7oS+JG3z/bKhqGQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxqg7nptShfK6eu5FqWTrGXYxqQ4PW1QXODS97NLrrHZue0sjwn
 cda7DItn2xkMgO5Z2Gd+F6YnA8ApzQt9yuHdezYvtxjDuZakLYLbSdaxzuplmuyD0B/YSL8iwAB
 dzU/OZTOX8XFvMT3reIL5UB7p1oVLAFdnwqb8I3D4X5QNqohNP+l8cg==
X-Gm-Gg: ASbGncu/xU/iY7FezFD/4qTpJb7/omqWLVQr63GD6pMJzhK7cURZB8Ncq2DjW9lt7gX
 2W5Eli3llUIoDrq7sSG1bAWC6jDNicjDU5E7Lrq/dB24GPB8My4HwURNwEwBMu1v4+80Sb+nYVY
 EkfwJytUURugGrdBUizNJAqGnIq0ILovdhTV9sycegKzarPwA90561OpwRUAzxoAlFDdPy7caVc
 Kgoil3w3yrl11csYhlwFk0LPxpbAckUbpVA1iitsXIrRRG8MaNjZXm0r7SbA0+Sowrn3qv2I47E
 A4Mryo75hfQPQUC95e6CCDrlwi9yZX7TJZkxdb/Is5rO32SUxLMxokS6Pld/eMo=
X-Received: by 2002:a05:6000:2207:b0:3a4:dfa9:ce28 with SMTP id
 ffacd0b85a97d-3a6ed5b880amr4756316f8f.5.1750917696873; 
 Wed, 25 Jun 2025 23:01:36 -0700 (PDT)
X-Received: by 2002:a05:6000:2207:b0:3a4:dfa9:ce28 with SMTP id
 ffacd0b85a97d-3a6ed5b880amr4756282f8f.5.1750917696436; 
 Wed, 25 Jun 2025 23:01:36 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-115-198.pools.arcor-ip.net.
 [47.64.115.198]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80695efsm6214837f8f.40.2025.06.25.23.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 23:01:35 -0700 (PDT)
Message-ID: <5088018f-cfb5-4256-9f70-6a578a2d53b7@redhat.com>
Date: Thu, 26 Jun 2025 08:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FreeBSD 14.1 aarch64 iso URL is down
To: Warner Losh <imp@bsdimp.com>, Stefan Hajnoczi <stefanha@gmail.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAJSP0QU=v_jN5oBDBefg0mB=Qv3SvD4ZdJzz2LT-cu5ZL7pK0Q@mail.gmail.com>
 <CAJSP0QXe1L2P24oUrABO1eUzn1JFc=BJWEfakrQ5u3Ek5LkfKg@mail.gmail.com>
 <CANCZdfqfFNAYcF3BEDucyR3YN1PXwyEmzE5LPcJCyshCXwhe6Q@mail.gmail.com>
 <9bac4585-255a-4805-b24d-b3b75d2ca9c3@redhat.com>
 <CANCZdfq6+R=VgyYdcdJCmDBTCgLSxDJuqd8h=ehb5F+v-HPT+g@mail.gmail.com>
 <CAJSP0QWSVhAYBtxKV+WDubmif2m=jxTYd-BK=d7ExZXWUNUYXA@mail.gmail.com>
 <CANCZdfqTKUMLbrT9HEXa-O7pyHqfcMWMmYx7iCq=ZU_ewgCaag@mail.gmail.com>
 <CAJSP0QUKx+eLjF5J2+JGrry_x-jx1p5HStCOTfOgQg+3nOpSeg@mail.gmail.com>
 <CANCZdfrxE=GScjtcd87cd-fgRf3uk87T=Ow718cFrB24=iC8iQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CANCZdfrxE=GScjtcd87cd-fgRf3uk87T=Ow718cFrB24=iC8iQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8QHWNKJ9dlna5WV7j0TdGWCEzucvFdTZp9-K49VqJo_1750917697
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: EBu0UZnhd3F7

On 26/06/2025 04.53, Warner Losh wrote:
> [...] What's the
> anticipated load, measured in downloads per day say, this testing
> generates?

Ideally, the functional tests download the assets once and then cache them. 
However, it's currently broken in the non-shared CI runners of the 
qemu-project (it's working in forked repos with the shared runners), so 
expect a fistful of downloads per day (I guess 5 downloads per day would be 
a reasonable number to expect).

> Speaking of which, has someone done the update? I'm a bit behind on my
> qemu stuff and haven't been paying attention.

AFAICT nobody has sent a patch yet, so it's currently still broken.

  Thomas

