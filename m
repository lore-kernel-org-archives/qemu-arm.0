Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2435898njn;
        Tue, 14 Jan 2025 06:13:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3uEL0avpjYaRUTuOndW+fVy5djHNkf147pWmOrFY4/kUgZ8rTFYRK5SfhEmwZvIAeijBG42xljBl6rA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4M1vhbAk+cQDJB2heHEvmXjPormpb6YA4E3gz+RU/Vad7t1bFtGMpAyM+egmJuqCbsbPV
X-Received: by 2002:a05:620a:244f:b0:7b9:c4bb:271e with SMTP id af79cd13be357-7bcd97554admr4040694885a.27.1736863992331;
        Tue, 14 Jan 2025 06:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736863992; cv=none;
        d=google.com; s=arc-20240605;
        b=AE0PITOZRwKOXKpyBzA8XWi+kbYgO6DrsRjddJguhRvULXn0grUQDNP+ACs9U4bk7n
         FrU5Z6hUvKimM6hVDuZyx+X5U+APTwWJIo9CtMZ0657/Qi7lzFD+C7GsWjqjchGyLQT8
         xQ+LnM1mWfnTDh4RF8kERnxUsYnoJNV4HRDLZiG1AVxzIR7aKRUk7Z0AQT8TQqG5wuuT
         JlLuZ+XZQLmbM8BIxDaEEMWqh6/Eyn0XwiNycHrnVp5T7pU70H31S7QbeZqGubVXhJ15
         4L1yRS3DbehZADwNZMAa3sCSSq2p2nX5s7k5VxMdraS6m9SbVaCQFAWnuSIXoHo+I0sz
         c4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wrhM9Ztf7j0OqIoSmoHcycqKlZfh9DXw7/bTdUpQFVU=;
        fh=bajA0QySX2we5Ju9zmKY0E+gKWtjfeLO4vqkLHdSRV0=;
        b=HZ0h5xnU2pdd9m8MSWpmZ7aeFEisg+MNjw5llnZMunIHHd8WgT3gOxG0YsQBy1tSip
         9QDyhUZkwpVJWP1mW+WSwYGAufVrWarjsKmiqJKBB/rYt/u8bkhzW5O7keg8TQVsIkuX
         6FOmWMPxIAmZrNx9JgForH7iXhWgBS7Sq86R4slQZHZZE9E/ismit1296IDtOlrnAlIR
         au+FMadwvgWz3urHB0v9RaTPWjshxQ0K4itS3i0JxYprZ5SbIanOLdBWpveyeINydbz2
         4XeNyCuwXfvFK4xWhnpAZSNan4yzlYKaakX/+dPpqHPcMbGZoXAPNUrTxy2BVfK2yajm
         nmFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VXUXscIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce34fccf9si1341526085a.423.2025.01.14.06.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 06:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VXUXscIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXheq-0006FK-V9; Tue, 14 Jan 2025 09:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tXhep-0006Eb-83
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 09:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tXhen-0005fM-3n
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 09:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736863955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wrhM9Ztf7j0OqIoSmoHcycqKlZfh9DXw7/bTdUpQFVU=;
 b=VXUXscIOknT9RnMoCZHLs1bFzOFOiUKuB0H06fVHGeHba65ZLl8eEHuLUIcLvzfTON28Pw
 ZZyZRIY4QmGTgEwqXCztu9imzylFkhKRxK292LAo6QxV3zz7d5bzWhmaBc/8HgLYlbm7xF
 m0+2simg3jdHA9Ip+B6Qo7XsKIqQnwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-Xcl6CfzbM4SVvpOAcfh9sA-1; Tue, 14 Jan 2025 09:12:34 -0500
X-MC-Unique: Xcl6CfzbM4SVvpOAcfh9sA-1
X-Mimecast-MFC-AGG-ID: Xcl6CfzbM4SVvpOAcfh9sA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38a9118c486so3429980f8f.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2025 06:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736863953; x=1737468753;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wrhM9Ztf7j0OqIoSmoHcycqKlZfh9DXw7/bTdUpQFVU=;
 b=Fd45mv0OuRElL40qFDDmL9axNQJpuLdTSFoA8HJouHviwWbcyaYqZ9aQzwQ8UgHoHg
 62CfECsh5PlIWJ4ivdA1SdfDI0QugNLttFGM9VQ4k5TwTJuAaOvohw8f7UCNmSRMIau+
 0sKbqBs9+HR3AY+e6l+H5ELZyb0CBiJnedKvpp0T0dKfAetwcwvGRJgvjyFmT6ZM8Btr
 dB3/FD5mlnCIqp9s1P+5+lTJpPhPuNTOH/eM5LkjEEyh7whn/Ajm0mGYY8Uu+N/v4y2l
 NlkrH1FWSsOakJl+Ijgxe7t7oa0q8yrsJkWvysxPw1PYbsaSfiunu+/dhJJVNstW/J5+
 HRTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEm252mzd0OsUlOPzJfHnS+sUkNKeuC4jEXb/9Q2eFDsGj9FsEMW6acJl43iRay0up4i/qPMm6+A==@nongnu.org
X-Gm-Message-State: AOJu0Yy2di89uOqG9eiF0UBsQ7Oar5My6xvPQJOePTOr1yf6SW9sL+IY
 Mt1WsJH69dwCb2CvfRvq9AwozGjqrXEi0iOKSCB7xi2dyeZwEi6BPKdLUuDcL6Qch6ldhjosudP
 x0aK2etUZhlcT95jR1zvaSI1cDkoYek5MBfJ3MPceylew9A6xDA==
X-Gm-Gg: ASbGncuJzUATWhexvU7wl/s1OqvA52pE1/ZP5PfD9hcnS0j0iTf1n0FLZJimoLGr7xm
 FLNXYH+kzNGQ+YN3WUiHBNE66sriC9q1A/nxo7bi2RbJ/GBvR2ltejBIQ+xZgF/2ZVT05npChkb
 ZnGPkJsTLdxWu4jTd1jJqCehhQhTNn45EcWMskgPL5MqXgwLxO2RgNdEpQGEAHCedWt5uNLsy3K
 SIlO4iWJtsvsIavuqSFlkVDFzFDuFnfkC0NIsWgqWIjXE8EJ0jHjBUr1KFGtrWjn/Q5cLq2rdD0
 gbQLQRPttW+SenBaTd1I2YtyqqzctjtOGbtnpaAeGquxqkjLA2p3cbI8r4quTNoS5BkzoEAvxNN
 VXRkhNclE
X-Received: by 2002:adf:c04d:0:b0:38a:88ac:ed0d with SMTP id
 ffacd0b85a97d-38a88acee1dmr14379498f8f.12.1736863953037; 
 Tue, 14 Jan 2025 06:12:33 -0800 (PST)
X-Received: by 2002:adf:c04d:0:b0:38a:88ac:ed0d with SMTP id
 ffacd0b85a97d-38a88acee1dmr14379475f8f.12.1736863952658; 
 Tue, 14 Jan 2025 06:12:32 -0800 (PST)
Received: from ?IPV6:2003:cb:c738:3100:8133:26cf:7877:94aa?
 (p200300cbc7383100813326cf787794aa.dip0.t-ipconnect.de.
 [2003:cb:c738:3100:8133:26cf:7877:94aa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b81a4sm15278188f8f.68.2025.01.14.06.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:12:32 -0800 (PST)
Message-ID: <7d2765c1-8efb-485e-936b-ea047be7018e@redhat.com>
Date: Tue, 14 Jan 2025 15:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Poisoned memory recovery on reboot
To: =?UTF-8?Q?=E2=80=9CWilliam_Roche?= <william.roche@oracle.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <cf587c8b-3894-4589-bfea-be5db70e81f3@redhat.com>
 <20250110211405.2284121-1-william.roche@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250110211405.2284121-1-william.roche@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gJqraLNa-35gu8EXhkoYuHo-JVlYBIJus9SCwYq-nXs_1736863953
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.794,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 2kQHDVWmiinj

On 10.01.25 22:13, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> Hello David,
> 
> I'm keeping the description of the patch set you already reviewed:

Hi,

one request, can you send it out next time (v6) *not* as reply to the 
previous thread, but just as a new thread to the ML?

This way, it doesn't all get buried in an RFC thread that a couple of 
people might just ignore.

-- 
Cheers,

David / dhildenb

