Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE019CAC592
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Sep 2025 08:28:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzWSt-00065W-1e; Fri, 19 Sep 2025 04:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzWSr-00064x-C3
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 04:27:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzWSo-0008MM-4q
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 04:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758270448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/pkpFz8pDV3eXrZRhelNM7fHJTWL2KlpugVUJ776aNQ=;
 b=IvutPQbFyQN0bcZaWMWZN9DDQcrX2uvPylUhQqttRavpu99+3ccl8YwO9rnuzH8s454w5r
 P48Kvgjx4+xTT8nRHpUgLCwtrvxWVUfi8ZQKi+lLt6GkhjvEcRvMvrPQAECnicp9hvfPrB
 V3j9I5oVKclrMwCQRnjVg/ezP8vJbec=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-MZfQnARTNkqQyBB8yB4ocw-1; Fri, 19 Sep 2025 04:27:25 -0400
X-MC-Unique: MZfQnARTNkqQyBB8yB4ocw-1
X-Mimecast-MFC-AGG-ID: MZfQnARTNkqQyBB8yB4ocw_1758270444
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45ceeae0513so13898175e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Sep 2025 01:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758270444; x=1758875244;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/pkpFz8pDV3eXrZRhelNM7fHJTWL2KlpugVUJ776aNQ=;
 b=P+5oLN6AW3RT6raCmzZ9XOZpu/O9b7DFiwpTKSbrb3SFy2xwVJ++7IW53JCS5Tbhh7
 AhkwaSpX0qCNgwHTZYASKVO8P+HOPIoR8OT2PkPCWgwkMLqbQGV66kALVcz+lzL7GGh4
 tVm8LGE9vozXpXykW+n6yetATyB75VRt/dHCszgoe4N8BL8TkuVWW71iZUjRExcmrwH9
 7dkOGsSG4YZplNVeI/hwilDuh/wCeXJGBJTQgu9KC5i+QBNCE2A6U7BPHsaaZtSGRkQz
 /BDISjG76o4K8p21OIPFp1LB0i15z20f4ggNNDqdiegvgO9JUrTL6iuC9es5nkzxYGNf
 uItw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVttEXYUpjnzrLo4MCMKVOc15FogHXbRb7iJMZPTO3beLikpKFZSvrAUboU/Kai/SSvUkj/EN4J0g==@nongnu.org
X-Gm-Message-State: AOJu0YzlsOWIIuFLcOgbVkCa//HTlW63oPHDol7fHVUPLzTngDQaTfWV
 BTrciHUOtVPCHxo7955YLhT59o4zVpr6ZOhYxBwJUW1CQPj1+oejfo9SYZTG1wARzOXiaVxPAbU
 MAuj3ZDY8d9wZV4P2L2VINxVGPwUloqBNRgM+Wha3Oagh+qMDppTUlw==
X-Gm-Gg: ASbGnct2UezY+OiQn4N9LFkkqeOe4GDc2AYkgh79VIIlhFG6tcKEQsQ61Ata2OBqk1B
 o3SyyrDuF7FcX5cxHPxQy+06ADO7hQ64/GsjtftosuIzCPKrkLMamWl+c3gIO5pSo7Oca/mM+kA
 szhGrsQhLTBVq+h7QaudodcvFUE3m9Q5YBmaTOBqta7jhHi+CN3GSgNCIe1Nbevfzt4jsMmBHfL
 4WuKj4mXs2mSbRy+mgSVUiIA5an2JaK9Onb1aC7HOwNVK3r5GM/9SFYDQBGShUBqAvVfh7RVRpi
 EkGoykyT/HC+UvLLnBBVUaC1V08eRoFZVYI7i1+Ya35RPAVoDq02TKO1eK8ZlGFj6OUwSSihsN0
 nsTA=
X-Received: by 2002:a5d:5d88:0:b0:3ee:15bb:72c1 with SMTP id
 ffacd0b85a97d-3ee88b04ed2mr1687553f8f.52.1758270443942; 
 Fri, 19 Sep 2025 01:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZRqVpbv+G4xMypUi0IGPf+mxGmAuj0jHfwdX3ExHMWt5qjFI6Eyh868tcqDOyf0Q/SYaZHA==
X-Received: by 2002:a5d:5d88:0:b0:3ee:15bb:72c1 with SMTP id
 ffacd0b85a97d-3ee88b04ed2mr1687522f8f.52.1758270443495; 
 Fri, 19 Sep 2025 01:27:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf1d35sm7483451f8f.55.2025.09.19.01.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:27:22 -0700 (PDT)
Message-ID: <e77f8aa9-8c19-41f5-b8b3-073c02092180@redhat.com>
Date: Fri, 19 Sep 2025 10:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Aspeed backlog (was Re: [SPAM] [PATCH v3 00/14] Support PCIe RC to
 AST2600 and AST2700)
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "wuhaotsh@google.com" <wuhaotsh@google.com>,
 "titusr@google.com" <titusr@google.com>
References: <20250918031348.3991681-1-jamin_lin@aspeedtech.com>
 <2e5f260b-dafa-42ab-953d-f0781cd3601f@kaod.org>
 <SI2PR06MB5041C7EE49F5A61C6E8B2DE3FC16A@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <ef4f4cd4-6efc-4176-9043-4bca04e5da4f@kaod.org>
 <SI2PR06MB5041840F757BD2DED8342164FC11A@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI2PR06MB5041840F757BD2DED8342164FC11A@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9XdTIF48JGApgOgb-nT9Y-2r6lnu1KvCbsPz0C-4TIk_1758270444
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hello Jamin,

>> One last thing, the list of PCI capabilities reported on real HW is a little
>> different. See below. When you have time, it would be good to adjust the
>> model if possible. It can come later.
>>
> 
> Thanks for the suggestion and for reporting this issue. I’ll add it to my working queue.
> Here are the tasks currently in my queue:
> 
> 1. Control coprocessor reset for AST2700
> https://patchwork.kernel.org/project/qemu-devel/cover/20250717034054.1903991-1-jamin_lin@aspeedtech.com/

This needs a rework of the co processor models. This should be QEMU 10.2
material IMO.

> 2. Analyze issue "func-arm-aspeed_ast2500 test occasionally times out"
> https://gitlab.com/qemu-project/qemu/-/issues/3117
> 3. Adjust PCIe capabilities
> 3. Support AST2700 IPC model(may require refactoring the INTC model if needed)
> 4. Support AST2700 A2 (planned for end of this year or Q1 next year)
> 5. Support AST2700 boot from BootMCU(RISC-V) instead of vbootrom, if a single binary ready.

It would be great if Troy (?) could resend the models, it's good to have
since single binary is making progress.



Also, these changes may be of interest, they need review :

   - usb/uhci: Add UHCI sysbus support, and enable for AST (Guenter Roeck)
     https://lore.kernel.org//qemu-devel/20241112170152.217664-1-linux@roeck-us.net

     Looks really good. Needs reviewers and stakeholders.

   - i3c: aspeed: Add I3C support (Joe Komlodi)
     https://lore.kernel.org//qemu-devel/20250613000411.1516521-1-komlodi@google.com

     Looks good overall. Needs reviewers and stakeholders.

   - Add Aspeed GPIO test and Support Nuvoton Serial GPIO (Coco Li)
     https://lore.kernel.org//qemu-devel/20250903213809.3779860-1-lixiaoyan@google.com

     Needs reviewers

   - hw/arm/aspeed: AST1700 IO expander support for (Kane-Chen-AS)
     https://lore.kernel.org//qemu-devel/20250917013143.1600377-1-kane_chen@aspeedtech.com

     Needs rework. I will comment more when time permits
     

Thanks,

C.


