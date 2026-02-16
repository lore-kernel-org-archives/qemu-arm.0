Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3179E81A25
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 15:09:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs0Dc-00055Z-AJ; Mon, 16 Feb 2026 10:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vs0Db-00055J-Ke
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 10:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vs0DZ-0001Gi-KS
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 10:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771254536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RliYNHxH05iddX24/vN6zp09+zPfzvcS3Dqdgica2gI=;
 b=ZZhD1XGzhYkeGRuJBJYi9EpJtI+SjovILlUt4LMnN1Cv7BMT3CVoRvlxC97PYcISq3qyxe
 IZXtkF6RsPVCPro/faTcZME4EFBemc9pGaDiz+fM6BjgkRNo6S3P9a6w7an+f7LCkQrlW8
 Zb4KKaeaorTkbZq0wupAPU/ycooq+Dw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-PmUQliLlMQuJlTXNoWWk4Q-1; Mon, 16 Feb 2026 10:08:54 -0500
X-MC-Unique: PmUQliLlMQuJlTXNoWWk4Q-1
X-Mimecast-MFC-AGG-ID: PmUQliLlMQuJlTXNoWWk4Q_1771254533
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48378df3469so18973765e9.1
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 07:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771254533; x=1771859333;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RliYNHxH05iddX24/vN6zp09+zPfzvcS3Dqdgica2gI=;
 b=ozdvOGdfkiX+BujhtI/H9TCseYVdk8/NA4CcVWPo/zWu+nkQcVuqHitTuAMFF4aB21
 i4DL3YANN1Ihde5rHQ5S5wZ+8ohJQ6/CrSzCPrubWDx6o3FfBx1+PhyXRcx/j0Wu4NiX
 SX35yDSCW0+QhxTE3KH6PI3AAhgttcu3THNgaIIyuxTassVhA98cWjZ8RPs8MSP9SdUA
 DvBk4JUH9GEmBkNiPAUvr3/sj4iFNBta+b/1VqCKCHPrPHLizpI4GkLcuLUG45vbHRVq
 p97SRRK8p319QnREgCuUma/jmMdhqrijL/9bIfvuVG/I2VQeoI++GG0GvxDGk2VzKmQl
 h8tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfjxryNtblxPjLFX6UUe+2CQnRaEdtvHJhsJxedg8lfEpfgb7I6EL8tYkI2SkaQiFE+6tV3Eo0QA==@nongnu.org
X-Gm-Message-State: AOJu0YzdIRfszHEn+Bo2UhYK2UEv7ExmD9KL39OIuU7VdQg8aba8QDm5
 6/KJWQ1PSAh64yO/UOslAwwv4cmM35L+mlJ9cmPWS8izQ1400BlDAbzxitoqvhiejA9kw6r/P36
 DipeeK9clP2S21Wpf6FSrDyiK4e2rkpxHMYNdbrToS8M9GmWNDp/JPA==
X-Gm-Gg: AZuq6aJPidRq0/VhlYFr8e59syItacVvb/sOn5hXz9aFauydUq6sKfeTny/DxMpcEKp
 dhWomGh3w1aBNzlcH9JAzITmbRSyIFL/zj2Kc5Gmt0WpsXN86CHLbN1q4B6rm9PKej4RGdqYDUT
 B3v/6mBfnS4HXfHmACJZO23VSVkoo3q2EDMrNOJwHD8hryaeE2l6cQxj9AgOl3UBBpF4uXx/M9F
 qvJKOLAhpFWJhfLKSJ3umcUgzbCdSJymwtdaZKxhEy5wJqE5ZwQk8ihqjGUM7uGMMN1tqILngxP
 b0+90am505Wi8e99RAyO1DWE1fZGW9b6NtDLW59hbJJ3uAA1M5qq4HxttoqMzMS3at1QHrDmFsE
 +IoKTxQUQWB33wTE0W6kZuVDkJR7M8FEy4ZJAZhsjP+LnCLp0voqIB1qbbnuw
X-Received: by 2002:a05:600c:1d10:b0:483:29f4:26b3 with SMTP id
 5b1f17b1804b1-48378d58838mr147654135e9.1.1771254533435; 
 Mon, 16 Feb 2026 07:08:53 -0800 (PST)
X-Received: by 2002:a05:600c:1d10:b0:483:29f4:26b3 with SMTP id
 5b1f17b1804b1-48378d58838mr147653505e9.1.1771254532924; 
 Mon, 16 Feb 2026 07:08:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836cd7af87sm318434615e9.1.2026.02.16.07.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:08:52 -0800 (PST)
Message-ID: <98898cd4-de19-41b7-b519-541c48b462ea@redhat.com>
Date: Mon, 16 Feb 2026 16:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 02/16] tests/functional: Add SDK tests with Linux 5.15
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Kane Chen <kane_chen@aspeedtech.com>
References: <20260212213955.2225662-1-clg@redhat.com>
 <20260212213955.2225662-3-clg@redhat.com>
 <CAFEAcA_oJgTc2SyRr11QTeTkmCPgvKiwngAaDiDNw5nUcTFA2w@mail.gmail.com>
 <CAFEAcA_9Np04vouA-m99xB8yU-JhduwxxLj_dTG0QM=AnDbHoQ@mail.gmail.com>
 <aZMwvfw4O5xeH-Gm@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <aZMwvfw4O5xeH-Gm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xoP5NvoGVDnMRZHMd2qnP9b2TRmV-O6v2sejinBGcWI_1771254533
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/16/26 15:59, Daniel P. Berrangé wrote:
> On Mon, Feb 16, 2026 at 11:17:38AM +0000, Peter Maydell wrote:
>> On Mon, 16 Feb 2026 at 11:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Thu, 12 Feb 2026 at 21:42, Cédric Le Goater <clg@redhat.com> wrote:
>>>>
>>>> Add functional tests for AST2500 and AST2600 machines using the
>>>> OpenBMC SDK v11.00 with Linux kernel 5.15. These tests complement the
>>>> existing SDK tests and verify that QEMU correctly boots older kernel
>>>> versions on these platforms.
>>>
>>>
>>>> +    ASSET_SDK_V1100_AST2600_515 = Asset(
>>>> +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v11.00/ast2600-default-515-obmc.tar.gz',
>>>> +        'ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c0f6')
>>>
>>> This asset file is over a gigabyte in size, it takes forever to
>>> download, and our functional test asset download framework has
>>> no mechanism for giving any kind of progress indication for
>>> downloads (or even for telling you the URL it is downloading
>>> until after the download is complete).
>>>
>>> Can we have a size limit for test assets please, at least until
>>> the framework can support large assets a bit better ?
>>
>> Followup: we have six test assets that are over 500MB in size,
>> and they are all aspeed tests. Please can you have a look at
>> slimming these down?
> 
> I see 2 big assets from aspeed only
> 
>    64d8926a7d01b649168be96c986603b5690f06391286c438a3a772c8c7039e93
>    ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c0f6
> 
> 
> what are the names of the other files in $HOME/.cache/qemu/download
> you have that are over 500 MB ?
> 
> With regards,
> Daniel

These are the files :

5732255d4617d98b76bbbc116d331d6ac89906fa212969eb8213fdc4aea86451  166M  ast2500-default-515-obmc.tar.gz
2768e2526bdd3f928df31341801cb6de3b9a40ca942b538a3d0800cd26fbdbfe  166M  ast2500-default-obmc.tar.gz
ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c0f6  1.1G  ast2600-default-515-obmc.tar.gz
64d8926a7d01b649168be96c986603b5690f06391286c438a3a772c8c7039e93  1.2G  ast2600-default-obmc.tar.gz
4f8778be176ece1b57d33c4aee13bb989be114c3e4703150eaeb6f996bd5587f  582M  ast2700-a1-dcscm-obmc.tar.gz
d5ceed511cd0dfefbb102fff2d731159e0472948a28066dc0d90bcd54be76525  520M  ast2700-a1-obmc.tar.gz
0e93f7976139da71fab9df7952a58bdd80650e23e7abf5853b0eb6695deb02d0  581M  ast2700-dcscm-obmc.tar.gz
e2b8f043fe8063dd3b6ded93422e38bd41914dc9c3202199507652df024de4dc  519M  ast2700-default-obmc.tar.gz

Thanks,

C.


