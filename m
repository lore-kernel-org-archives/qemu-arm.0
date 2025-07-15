Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E37C83F21
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 09:25:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbuS-0004AD-FB; Tue, 15 Jul 2025 05:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbuP-000480-Nj
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbuN-0002lw-Mc
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752571506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=buIRkHnvb4fSBDO8wBdvc7FHno8E6FZPFPoKmrJoMY0=;
 b=U6sad1tLYn/9w9QC2IBxNz2ZG7gdbIxQA/VgKuOXc2LxSvDYbPKlOyJF2ugTpJgMz1ETiU
 M/bd99Rh9Iz/sJUYByCrHaonpRhDe2yDEbQAoCsn+O7GZK0rrfmv/gaSMKMfW1Nx/jZ4Z6
 wbpxfFS8knhD8WY/+4PNivjLX+xKOEs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-a8qZwt6JNs6xQ1uXwv5c1w-1; Tue, 15 Jul 2025 05:25:04 -0400
X-MC-Unique: a8qZwt6JNs6xQ1uXwv5c1w-1
X-Mimecast-MFC-AGG-ID: a8qZwt6JNs6xQ1uXwv5c1w_1752571503
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso30781185e9.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 02:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752571503; x=1753176303;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buIRkHnvb4fSBDO8wBdvc7FHno8E6FZPFPoKmrJoMY0=;
 b=Jt9msVDiyUqs0mSYApdtrR1l9hAnHf38/cfgY2ebrJX4v6khpyar013NwL6u+uwDpB
 I9IU/lqt9P0z+we7qdp8g9k4/HdzKEhjLfV5wGpNsqpmz/kHzM79z/GlFtP0ypsdwboW
 sv0OM4EiR8uy3liKnQVyiub4oKOH+yy0VlcwRpaARnIDMfK0GX99p2Qce+YtNPyvSnJb
 1t1hd/ql7vRPBffbz95kMrk0ZdfDS2VBqri9onmo1NG6PwDmAdyQk2j7Z3crvB3j2uSK
 Ifz0nG2y7wiv8P20pSe5uhLlEJ2jsusRab1JwnQDOzf1wT3FGM6Z8nvyc/GIw32JWEk6
 /uXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXSl0oOININJz3Pt+vWSdjihBAWGpvh3sBOeWiv5sscOr7dQY3IrPjsrT8T4oCIl12gWVuJxTk8A==@nongnu.org
X-Gm-Message-State: AOJu0Yxg3CZLChZUqLET5GbvGAKTv2oTW9tCbzCVfBV1zxFzdx4/kC5A
 g31XjCnxLJSxKxh9LHxIJ/Q9u6jZtB0exdeI2VC7o5mdR4OWLfKx7tHuznxomIZvotNe5vM6lOo
 0RzfhfSDdyEmACpNP6lnaxTZ9dfbxSQl+xb58Mifh/yMXAcOr5bFoOg==
X-Gm-Gg: ASbGncvOVaKVHZNLNQi7TlSFC3At+n2hUgO31KVEFUhvSNTRYFKianzzgelTHmO3Tgk
 iIfIeyMCYu36UX1WLygBBaYpsbq6EgFEzoeW/bSUsWHEgxVpH7N77WGRjDqccKEeyHRHFndP9jh
 olteSQptcu+hXmtgvUaij0bwPnHJE8CwYrtrL3Vwm2XirZmz4i66GI6vc50Rzzb7uwjagX/Tfmw
 2t4CI+nedvwOaknYN/0Ezmggbr6u7c4IJxvoKOO8C18LjKzR9yh6QSUddzIjmWk5Y45M1Q10nLn
 rNfP/f2VHNgGq3QH3reU+BbhE4tJrzq5RsUSeKZdBKaMGNRulSXCdE594VetvGMVRr69Bs7J9Nc
 =
X-Received: by 2002:a05:600c:1d8a:b0:456:1122:8342 with SMTP id
 5b1f17b1804b1-45625e2a951mr22749485e9.5.1752571502826; 
 Tue, 15 Jul 2025 02:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoyb+TyS3zO0+/QabBse5zMuxXT/dibI8V2KoJ7FdylmlN49PvPazGBgSwbA7f3vFLMZncaQ==
X-Received: by 2002:a05:600c:1d8a:b0:456:1122:8342 with SMTP id
 5b1f17b1804b1-45625e2a951mr22749185e9.5.1752571502422; 
 Tue, 15 Jul 2025 02:25:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:266c:b13b:afd7:40fd?
 ([2a01:e0a:165:d60:266c:b13b:afd7:40fd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd538b63sm157339755e9.19.2025.07.15.02.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 02:25:01 -0700 (PDT)
Message-ID: <b87ed404-4214-4d83-9912-95609903eba6@redhat.com>
Date: Tue, 15 Jul 2025 11:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] VFIO multifd device state transfer patches for QEMU
 10.1
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Avihai Horon <avihaih@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <59a87a67-9283-4dd0-a29b-dae58fffe9ea@maciej.szmigiero.name>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <59a87a67-9283-4dd0-a29b-dae58fffe9ea@maciej.szmigiero.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N30ENxycjUtvB6IigmElQB_bTksLOg07SokzA2bO1Xg_1752571503
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/14/25 11:46, Maciej S. Szmigiero wrote:
> On 24.06.2025 19:51, Maciej S. Szmigiero wrote:
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> When VFIO multifd device state transfer support was merged in QEMU 10.0
>> some of patches were separated for the future QEMU release after the
>> spring cleanup.
>>
>> Since QEMU 10.1 code freeze is getting closer let's have them reviewed
>> now.
>>
> 
> Hey Cédric,
> 
> I see these patches in your "vfio-10.1" GitHub tree

vfio-x.y is the branch I use for vfio-next candidates.


> but I don't see them
> as a pull request on the qemu-devel mailing list.
> > Are you going to post them? - the soft code freeze is tomorrow.

We still have some time. Let's see how v2 looks like.

I would prefer to have some feedback from the virt-arm team or
a Tested-by at least.

Thanks,

C.



