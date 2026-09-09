Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF3BC79FB6
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Sep 2026 17:35:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4MCP-00059e-5G; Wed, 09 Sep 2026 13:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x4MCN-00059O-Ih
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 13:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x4MCL-00089s-Gx
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 13:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788975299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JjM3jZlo+n0ZcdtLbalOopLGr6sWQIexfKkHiEKWpYk=;
 b=UTXf4wTB7YbGFgvE0MnfGjKP1jjn0rOLAmSCh0p9qa3UI99U9+Vo+eGIVwqsoFkF8ENDDK
 y6hzMS7UORc4G3B4KWv2jjq5NzKD9ETuiKJjrqGARCyWZLnf1nRyJcH5bQojLIzYNYOOxE
 SAZIzd6Szw6HYsLT16U1XF4BromvgYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-EfQF6b2cOVq3XJ0vvioFsg-1; Wed, 09 Sep 2026 13:34:58 -0400
X-MC-Unique: EfQF6b2cOVq3XJ0vvioFsg-1
X-Mimecast-MFC-AGG-ID: EfQF6b2cOVq3XJ0vvioFsg_1788975297
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-482e2541c30so53224f8f.1
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2026 10:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788975297; x=1789580097;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JjM3jZlo+n0ZcdtLbalOopLGr6sWQIexfKkHiEKWpYk=;
 b=dGtdkkV1fQUTH04ZCY6FfsHqNRFa5Zc9ezAgjYDrgz8zpo7CvxkB5xmh05oQGnozCw
 dFB5MfDjGoXu7ddJI5dXZsV+ltK2S3JXLmUW4pn4woAoawECOHmWAJvRjXqGgQOl0k1p
 bOXbK7TF6I7DoOHwDGqzDmxD206RPAvIRM2FNvmwqpxX8xxT89We5d7uyBOg4xwhEu8A
 yoSjMGXBFmqXiRw7X5uFM36I5HI0g48xinGmQVAeVIwHflblGjFwS0VAvTpdoDQ0p5Fm
 c4nzD3bN5QtzzSua/yaifzt6xHfJBxU0DcnI2qVMcyVZhSnFBj9CyeMZRz4nHI2sCEme
 ufww==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRMaakDjC2/zW5sHl17PyKX5Xprw5J4xFMwld+W67LSBLvKNDrGh4LRIV8p8ywyWfTL3hvFC5gqg==@nongnu.org
X-Gm-Message-State: AFuF++mufVOxiGgHb6afWvMll8KUHYVKtQ3c7NuOyVpUf5iAfAXMU3T0
 /dIwJuXvxCNCozX380CN8lgSjkFFIpMD066PosZL3GcfahGcuCVRvo5FiYr6EVVWiFfWV8f6nqq
 vcPC/DHWcabaoIWVivwVv3qPhcV16ynjMrpZj72wOnDbNgj+x6DrSPQ==
X-Gm-Gg: AYBFou25mXuo1GI8Njb1zKORB7E6pgB1fotpIWbxGbnLjL/HhfthjKE9PaxT62LF7O7
 ndilt6/8dE1mUJ7TIcyte/h49HR9kiPQWr37MHReUlbGHoL7TVfQ0wNMCwBl+2x7f2Qyaila53f
 OUy8Z4WkRV4UQtOA0Qi7H+MgvW1Mi8HEBQPB9C3hKkcZSMMdXNK9F9rF9F9IXbjU1A/EdCPDZzg
 X3q1PUKrhbTpnHyYBo4PoMHo7udubAXNn8o7PkNIm35e5f2z4ROcmT7RKAykTIueLRjpzHaOMt6
 mHWq4ZCyfHa6LNRhmn9y99DYWAP+ldbtWvwNS+tccfKL2qdOPMzqT3MzsHrBgzrCrFHygN8fTtz
 kkI2JtOXoZIJspEuIM22VvL3Tbb2j7cQlAd66LW0Ynw==
X-Received: by 2002:a05:6000:1885:b0:485:8224:1a46 with SMTP id
 ffacd0b85a97d-486e0facecemr452990f8f.23.1788975296866; 
 Wed, 09 Sep 2026 10:34:56 -0700 (PDT)
X-Received: by 2002:a05:6000:1885:b0:485:8224:1a46 with SMTP id
 ffacd0b85a97d-486e0facecemr452959f8f.23.1788975296451; 
 Wed, 09 Sep 2026 10:34:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1292:d530:578a:3c67:6721:1232?
 ([2a01:e0a:1292:d530:578a:3c67:6721:1232])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858dd90e1fsm48304539f8f.28.2026.09.09.10.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 10:34:55 -0700 (PDT)
Message-ID: <ebcdc24e-c05b-4414-bbe3-9b36fbe362ab@redhat.com>
Date: Wed, 9 Sep 2026 19:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm: Add /machine/labels container for Aspeed
 machines
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, kane_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260904050424.4049984-1-clg@redhat.com>
 <20260904050424.4049984-2-clg@redhat.com>
 <2f7465ed-9945-48e6-81dd-d7aaafd249ed@nutanix.com>
 <50c3fb43-8965-4cde-a3b8-a01d067991db@kaod.org>
 <fb87ffff-d56e-4c47-8fd4-c30589886d85@nutanix.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <fb87ffff-d56e-4c47-8fd4-c30589886d85@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4M7Ztg9AcgJvGB0DC0Z96I6pmFqRxZ4kxoF-pRhBAyc_1788975297
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

>> Any device in the QOM tree could have an alias. Why would you want
>> to limit the possible aliases? a part from dynamic ones.
> 
> I was thinking in terms of automatically populating some entries e.g. for PCI buses, but from below I see this is not considered a good idea :)

Ah. I imagine that once the container is available, the machine, the SoC,
buses, devices could populate it however they see fit.

> When you say any *device* above, are you thinking of a specific restriction to devices, since I can see this would be useful for some buses too?

The const link should apply to any QOM object I think. Give it a try :)

>>> which ones are added automatically, 
>>
>> That's dangerous. I would say none.
> 
> Fair enough. Should we enforce some basic rules e.g. all lower-case, no spaces, mandatory index suffix to try and keep things a bit consistent? (basically as they would appear in Open Firmware).

I don't think QEMU necessarily needs to follow the naming convention
of Open Firmware specification. A PPC or ARM machine could make sure
the names are compatible though or would you like the machine_add_alias()
helper to implement some dt fixup ?

> Perhaps these should be enforced programmatically?

Well, if it is a key requirement for a machine, perhaps it can be
implemented at the machine level. What do you have in mind ?

Cheers,

C.


