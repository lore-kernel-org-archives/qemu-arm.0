Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37563EE2084
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 10:41:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voJGT-00073y-El; Fri, 06 Feb 2026 05:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1voJGS-00073q-Io
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 05:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1voJGR-0000Ok-6d
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 05:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770374438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aDFt0StFY6EM6WEWGptQd47wDVUzrk7ZHNZ50TuZHo=;
 b=gdQ4u1Z43FG6GQ/olpT/3gA9xidtdBmIedEo+8XSiBjLDb+oTOpEc1r4tgTcO/ARZ68CUN
 eMChbKf17r8FxDX8mh3smCmfuZbMloAjP2JgQrOEsoPQUk3CawHscrqTsLEx0TDTyAVUaW
 lhIILokkOcBH9R4I3Rb6KXH8FQ4SB2s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-yDA7SSdjPfOLsdO6B64BgA-1; Fri, 06 Feb 2026 05:40:24 -0500
X-MC-Unique: yDA7SSdjPfOLsdO6B64BgA-1
X-Mimecast-MFC-AGG-ID: yDA7SSdjPfOLsdO6B64BgA_1770374423
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4806cb47edaso19549165e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 02:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770374423; x=1770979223;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aDFt0StFY6EM6WEWGptQd47wDVUzrk7ZHNZ50TuZHo=;
 b=cjYKWgack84ONGJvk7tF0rRSGW4Rf+YeugVpYZFgMVRB48pfODauTkgLbeLbIGwxMm
 vRz4anCvOZDYoFWcd0ggHlSkmN/fL9VyU08TFEwKUSFlWUaTBOdO8FMR9+BKaMlDmdHZ
 0L4s5KoUbw5rhidp5ZWjMP9rIfQsY7g99l7D+rC/Gbdn2y/5A/f8kZ0iPXcF64klvmo1
 OjqoisvPQK7Z5LaUNqauoqE2evtPRa/Cq/D1s+0pnv0VeD1DPF43ml5dglMQXNI1preq
 IGubMn0CQFzns4vyVjZ7JR2qMb/80yPl+q9wSErVqRz1qlPw6OynZTOXfVG2A+gco3QY
 wWxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVts4DwxxuBecx5g2amiG83yfA1XH2KQ9pYeszwO3mrSDYZUtOHh1LbQb1YV1czFKXYOrktQQG+pg==@nongnu.org
X-Gm-Message-State: AOJu0YzRYoXbNwaIwS4Ksxn3XIx4AXQn51zaJ8hu8Z5SgfInsX690RJ/
 VIP7W7jVst8FsIqCt3lR1+UPR/RmLSm5RVAjeduxMEWcyEtuew6esGubBL+SMh5TgVsEgwkCc8V
 doimT7JUGoYpFDm83heKRaE6xHkW2U9gsGi3OCey/OOcxqOBxscHAsA==
X-Gm-Gg: AZuq6aK5V/Wr38fqX8NXJwPkfQ2vvXyfyx5AASSBkaAnFxpl30QXPNKt/7z3hMwturg
 AsATrM4rY6lAv6sshdAi72AXDR24vCrweVeVuv7xbhMYi1agdAZAg66X24pq5H4BHGFQl3/TxpQ
 c6P9LcvyP4+MadCff+Xs2iP5h2kVzoK2rZWqSW6qi2tRa5FFJDEsLRUXfdQs87v/VXzJHaXEsjO
 IaEl9hF3er0i4a/wl/Hpsy6CPP/p1yoWOPCenZ+JRJp5kESqlrk94uOMYqxmCv7ujYax2sc9mdk
 9+9C4Ck2fk/KL1At4EAcchnsBvwAnzCJipfCkuiUzU5e9FKEY/DVaaxJlalQk+V/93qO7+D2LRc
 PvGaYUWQ=
X-Received: by 2002:a05:600c:c84:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-483203d54ffmr30701645e9.13.1770374423488; 
 Fri, 06 Feb 2026 02:40:23 -0800 (PST)
X-Received: by 2002:a05:600c:c84:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-483203d54ffmr30701445e9.13.1770374423021; 
 Fri, 06 Feb 2026 02:40:23 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.203])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d33f5fsm121897675e9.5.2026.02.06.02.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 02:40:22 -0800 (PST)
Message-ID: <a6757611-32d0-4451-be0e-724648e1654f@redhat.com>
Date: Fri, 6 Feb 2026 11:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] tests/functional/aarch64/test_aspeed_ast2700:
 Add AST2700 A2 EVB functional tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260206053340.3716041-1-jamin_lin@aspeedtech.com>
 <20260206053340.3716041-10-jamin_lin@aspeedtech.com>
 <83d409cf-868c-4a2d-b1c9-5741d3e36adc@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <83d409cf-868c-4a2d-b1c9-5741d3e36adc@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zm6jTWb6FkB_4jE4npGm8hhkmply8UOLTATR3IyjCcw_1770374423
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

On 06/02/2026 11.11, Cédric Le Goater wrote:
> + Thomas
> 
> On 2/6/26 06:33, Jamin Lin wrote:
>> Add functional coverage for the AST2700 A2 EVB machine by introducing
>> test cases that boot and validate an OpenBMC SDK v11.00 image on
>> "ast2700a2-evb".
> 
> I wonder if we need to test both machines. The test is already quite long.
> 
> On my test system :
> 
>    qemu:func-aarch64-aspeed_ast2700             OK              119.68s   3 
> subtests passed
> 
> With both machines :
> 
>    qemu:func-aarch64-aspeed_ast2700             OK              219.79s   6 
> subtests passed

If the machines are very similar, it's maybe better to mark one of the tests 
with a decorator (skipSlowTest maybe), so we don't have to execute it by 
default, but we still have the test around if we need it.

  Thomas


