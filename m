Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F947FED2F3
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 09:25:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0cI5-0001JA-Q1; Thu, 12 Mar 2026 05:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0cI4-0001If-RU
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 05:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0cI1-0003Mi-0i
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 05:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773307507;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tZ+gsxk5L9BcFOplJGiHXgFCFYI0wFs498AuMgxzUM=;
 b=WEwhiZkDY33coAnDwUS80G6XGWDulbDBiLmBTqC9rwc1ltWLP1iqUKtizIi4clNlWLqP6J
 SiL6iGXQQalBvHUEe+Ncb7UqrwPt6a942VsK3+/HCDu9Hwmo5wnBmpqMxCukdDtXV7gs8V
 leQ3zU0vker7jQccSNGPZaFtUwJiqk4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-qe9rDRR9MYmifBLTNfQbVQ-1; Thu, 12 Mar 2026 05:25:05 -0400
X-MC-Unique: qe9rDRR9MYmifBLTNfQbVQ-1
X-Mimecast-MFC-AGG-ID: qe9rDRR9MYmifBLTNfQbVQ_1773307504
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48544725bdeso8789395e9.2
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 02:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773307504; x=1773912304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tZ+gsxk5L9BcFOplJGiHXgFCFYI0wFs498AuMgxzUM=;
 b=Pej6We2aXuXqtpOCBAXXOwweevEUOGFphn7D7atfOkIrUYjeOgtnBM6CiTMJx0BbQi
 MmNnPZaX93MxWXkrctAfCl1j7LOtvS6Rgc9zEV0N9OPs1wirBYUP3RbKs277+rwKYJwR
 5moi8IPsmcuQ6vo1hwAwsMLdmXt9JbGUX4jEvDDfyRyUSCPeeTwkxEv+yU7LDXkBGxrK
 HFyu/JTjv0MYaTIa3EUFUGLDVa4mv4qRDdi2qE+evsRcooORNQPxavJyv1/3zTq+Kg96
 3tIh8qfDa4F39tEMh8bn6bsheNQRtXH8nj7efGupc0GQcsRwbRDMB3XtFXbtAsFppbZr
 SrZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAGpCsFoH/aJ56r12mPS+qaJAIOqAbmUTcYtt0eaMSvPgzcK4w2dy6aMo4jqoDcVXbGuaw5ic1zg==@nongnu.org
X-Gm-Message-State: AOJu0Yysz2LxBIgSPs6EKBTv8VZBkVSQLYrN2mNTWNZ3bc4fjuomFqX3
 Kd5OfGx6h4PvS3vXRYxrZxVq/Y3LPPes8OX+u+xNx8W9UDc1ttpoD/ZVsldTJhuRuB5DCmP+K3g
 HqUfzLZsEJgW9U3ut7rPRCakIYEIJkGvbk5uC7QAh0DgVdd/3tKlwbw==
X-Gm-Gg: ATEYQzwfe41Xbq3oyzQeg3+EpzZlqOOVsl7rL1PKjsIHUINt/DTftQw8FzCqgVccvJd
 4gh0utlflrUuX+UIFmxQXLUhKdetsi8VG9Fg/402cGdAfIkVWeiaSyYaOY6yLw+6+tjw373FOif
 Wv6lTXTbpS8L07bz0WJAdyP9mxCnUJIrCbY9OTVTBF4DZGwP/de0mfoqb8ipsQN8wRF1lbbpEdR
 nkfO0hci28aK5KVVvq/a8zZesi+4MRK9ULj+toa77DOcPOfVD0LyRNSZA1mUeljWs7mfFpjyxOr
 RWCg+MhvYgFpgLEPosJm/Mo5D28pzFUlIRYXKV8XCC5CCngyCVmzUOotlwrWmPI4HbBy7e8Q3LL
 pviR5s6yosSfjZV5pAG8qbRnpboBgfyLd47F6z9TLkShb68wTxFEtsxpFLYXFKnYswohyGA==
X-Received: by 2002:a05:600c:8b45:b0:485:4006:960c with SMTP id
 5b1f17b1804b1-4854b12cf1emr78737075e9.16.1773307504213; 
 Thu, 12 Mar 2026 02:25:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8b45:b0:485:4006:960c with SMTP id
 5b1f17b1804b1-4854b12cf1emr78736545e9.16.1773307503739; 
 Thu, 12 Mar 2026 02:25:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19acc6sm6711092f8f.8.2026.03.12.02.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 02:25:03 -0700 (PDT)
Message-ID: <eb5280cc-ea00-40c3-9235-b0330d7fc6fe@redhat.com>
Date: Thu, 12 Mar 2026 10:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/8] hw/arm/smmuv3-accel: Introduce _AUTO support for
 ATS
To: Markus Armbruster <armbru@redhat.com>
Cc: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Yi Liu <yi.l.liu@intel.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
 <20260309192119.870186-3-nathanc@nvidia.com> <87pl5cnp06.fsf@pond.sub.org>
 <98e7dd71-6669-4a82-bec8-f1dae2d861c3@redhat.com>
 <0bdcf7d7-136e-42f4-9fa9-d31f6ae6e19f@nvidia.com>
 <fd34b7a2-65ac-486f-bc17-23dd4f96a3df@redhat.com>
 <87o6ktxwzn.fsf@pond.sub.org>
 <fbf594fe-dc8d-4747-94e7-7398749f03ef@redhat.com>
 <87y0jxwghz.fsf@pond.sub.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87y0jxwghz.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J2f0lTrx1pH_fJnTJxklmJobrCHp3jJEQaWyUH2tGRY_1773307504
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Nathan,

On 3/12/26 10:20 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> On 3/12/26 9:39 AM, Markus Armbruster wrote:
> [...]
>
>>> We promise to follow a certain process when changing external
>>> interfaces: docs/about/deprecated.rst.
>>>
>>> This is why I inquired about external access.  No external access, no
>>> compatibility worries.
>>>
>>> I specifically asked about JSON, because going from bool to OnOffAuto is
>>> mostly compatible in key=value syntax: values "on" and "off" keep
>>> working.
>>>
>>> Mostly compatible, because qapi_bool_parse() also recognizes "yes",
>>> "true", "y", "no", "false", and "n" for convenience, and these stop
>>> working.  We have a knack for inventing convenience features that later
>>> bite us.
>>>
>>> JSON breaks entirely, of course: all values stop working.
>>>
>>> Even with external access, compatibility worries start only after we
>>> shipped the interface in a release.  Did we?
>> those options were introduced in qemu 11.0. Fixing them in -rc is still
>> an option but it is a very tight schedule
> If it turns out to be too tight, rever them or declare them
> experimental?  Then you can revise them without process hassle in the
> next release.

Maybe Nathan, in a first step, you could just respin and convert the
options to the auto form, keeping the current default value and not
implementing the auto mode yet.
+ the ATS check fix? Shameer, Nathan, would that be sensible within the
qemu 11.0 -rc timeframe.

Eric
>
> [...]
>


