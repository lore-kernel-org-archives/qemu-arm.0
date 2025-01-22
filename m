Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp612331njc;
        Tue, 21 Jan 2025 23:38:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE1tIaFd986VolGVzIBJH0qAttRYz76vX5I+7TEeQWMVIq1qWeZ7wYQ2CxvNeMjWdKDeBowOPtQG5SnQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHzWnlWX7kb1vTZjbmAhjnlUb2cnxjw2B+Ac1aN21ebKmwO/x+Vh19lgHxCpwFZIr0aybvO
X-Received: by 2002:a05:620a:f01:b0:7b6:e207:c8a2 with SMTP id af79cd13be357-7be63288238mr3514699285a.55.1737531491840;
        Tue, 21 Jan 2025 23:38:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737531491; cv=none;
        d=google.com; s=arc-20240605;
        b=GJ93TZCfIpHNdmwAJtTJAKYKBzh4QR3Y/9h7cHNeOetyRAOsRoeyz4pkffJyeUupuh
         JBGiUiY+idni4NfkR12XSz5dCfZJ8jb8JKGq0qxJRZj/zy01dtfDtxiV6G0fbI0qSr3i
         GMoETyo6B8EYKPqbGCcacYcthPpN8CA0aeiVk3PglVZG/Hc0h798U9gwmG/6X4eMELlk
         OK6QjTVS0qnCYPTU5VVkst9Hu2Sv47biCZcWcSn3vSCDULkP9zLR3IiCTuY1BU+L7IB5
         iQsY3VeEPrCC/B1JP3CPNLIU4PAP4AMyxAVIFOJy2mz6JtUKUkb1t5R2mmsIm+pI08H+
         QB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=JpX22bMwZ7uKfI6ptKwXi2HQWN8LXPebIGIRCOU9Kvg=;
        fh=K71lhu5FSyNjf73RCijzNS2yyF9JPUcmwydr6g7+INk=;
        b=iMuI5zr7V1Eqi33J5ouxE0oMvMmSLTtGWeFPo5ijI9XZa/KMRQySanQqsYtYeS4UJK
         zL1ayCMpv/gdQUgAUqVGYd107am5FxFIPJCikrC07AvxVotrdQ4TGT6pHTZDGgr9mMAM
         4Rr6oCqbIlS612HDmiMfmSqSlwQG/SFhe8+1VTgJQO7eO6QuxS0X+eNTwdfd9fRwoC0N
         6+V72X9PDTWU5lICjmoVG+BhJcLw0B26RHdpDkvL3zcr7+caJCRMGDiH59aSD/xmWQM5
         +PKh3j3M9NpoNLG9xwOtoBuexvTL/IwWedlhU2MJAdFLRJ3JsPs/dX0EDPjPpMa8+rN7
         TqQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KmXkBA+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614ed656si1471171085a.529.2025.01.21.23.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KmXkBA+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taVJH-0004zM-TP; Wed, 22 Jan 2025 02:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taVJG-0004z0-33
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taVJE-0007iS-2y
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737531473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JpX22bMwZ7uKfI6ptKwXi2HQWN8LXPebIGIRCOU9Kvg=;
 b=KmXkBA+U2uYwyoBgU7cl+XaOYlbfNxLv6RLHdQ5dQFTXz6A3TUb8yvWezMbVlw3pOSXPYh
 gfmLz4raYBMjwFbtojj3fIVu0J+ROKMRcim9uZ36ZkJLS9uoVcOFp1DRlMTPrMpBDrjhA9
 k4gIXQP9NvnH1eqB3gh+xRYhd6CuqNg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-m7g09FIJPaaq-QHypur10g-1; Wed, 22 Jan 2025 02:37:52 -0500
X-MC-Unique: m7g09FIJPaaq-QHypur10g-1
X-Mimecast-MFC-AGG-ID: m7g09FIJPaaq-QHypur10g
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3862b364578so253761f8f.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 23:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737531471; x=1738136271;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JpX22bMwZ7uKfI6ptKwXi2HQWN8LXPebIGIRCOU9Kvg=;
 b=hfxS6Ar9nhFMI0pJF9/g0Rh2Jadi3f/DcTtxgG7d2vZqaiXK+n9xOV7YXQA8Zjrm30
 PXJ3FpFXWk/0vgA+2qWFLFJBvfVY+PUCTGGq5V4S1Po7eetDbUO6wTLxvT643v9aRrGU
 MLmfmhPdAhIDkjCag4E42cAh/wSZA9az6sTHk3rXg/kJvK5jzPXtcjbTEBmn24IqHg0q
 O9uhho7OYqrGilOqMIUxa7a0BP78zugRxKs41a6f95ASpy07oS876onyL9+nRXrsAQz2
 tlzfrlJJdvVi1h+Sv9s0AMFZ9fSPdGnmzA1mtAaPTgA/Dim84AD0B3qFAKiqVlZP18JJ
 GiuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnCaX6IU7N8q6QGvN730UXEk41wZhdckVo6ZKG/QQn+razMeHUPQGu+lE4w0O98l4Q6FbYZkR2Iw==@nongnu.org
X-Gm-Message-State: AOJu0YwWZa9KD61gZkekfOCrJSj94tyXCQYnaqsW81sJiuiKsggokSl1
 XF2z9oPuKAyJuUpCiXKuZZN2fo7RNrLr3o09q84IgKV7mS7lCdIKINd/eJGHbMjWi/Pzw6rgZ8S
 hcxulboah//AyKG96CTRoHXMleUctE8/CM1g+yUUUPfB19TK/iQ==
X-Gm-Gg: ASbGncv7zhcrc2lEX6ULeH5wzeUlHdBAXetvmK3YkOfzEx8UUnnVLt6xiTjb/Gi1zSO
 ql/KXvV8I1Ky1CfRkZFgeebMmpA++b1B6zLyVIKjMUA40JFznjJzVXOwNfIQq/gIwEhWjhzqMWq
 FC1rPW7JfEN8QDAGoSmnY8izXmjzLZjoApH78eJzI6vwTTeAGOKXOSksQxawDv/Smy0mdf6w4jG
 dGpoPaa8Bk3xSY0XPmIiOBw379RTHlScb4bKwNJXOqPsdkckAfHIja3n67MMX1K+Enu1LcT/S53
 keMXkpHCp3PqIH+9F11TUsQmPVhWGHEX
X-Received: by 2002:a05:6000:1a88:b0:386:3672:73e7 with SMTP id
 ffacd0b85a97d-38bec4fb6abmr20469952f8f.9.1737531471275; 
 Tue, 21 Jan 2025 23:37:51 -0800 (PST)
X-Received: by 2002:a05:6000:1a88:b0:386:3672:73e7 with SMTP id
 ffacd0b85a97d-38bec4fb6abmr20469932f8f.9.1737531470936; 
 Tue, 21 Jan 2025 23:37:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322ad74sm15688974f8f.56.2025.01.21.23.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 23:37:49 -0800 (PST)
Message-ID: <80de6b2a-c0e5-4484-925a-b4de081c5d6a@redhat.com>
Date: Wed, 22 Jan 2025 08:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] test/functional: Update the Aspeed aarch64 test
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
References: <20250122070909.1138598-1-clg@redhat.com>
 <20250122070909.1138598-8-clg@redhat.com>
 <SI2PR06MB5041EE7E3762D569F0E13B2EFCE12@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI2PR06MB5041EE7E3762D569F0E13B2EFCE12@SI2PR06MB5041.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _PrpfRpN5p-r2TLYAgG0-LudyG8zXRjXzrV4AdvZTfc_1737531471
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-TUID: +SbQQ7tmEd1l

On 1/22/25 08:28, Jamin Lin wrote:
> Hi Cedric,
> 
>> From: Cédric Le Goater <clg@redhat.com>
>> Sent: Wednesday, January 22, 2025 3:09 PM
>> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: Joel Stanley <joel@jms.id.au>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Troy Lee <troy_lee@aspeedtech.com>;
>> Jamin Lin <jamin_lin@aspeedtech.com>; Steven Lee
>> <steven_lee@aspeedtech.com>; Cédric Le Goater <clg@redhat.com>
>> Subject: [PATCH 7/9] test/functional: Update the Aspeed aarch64 test
>>
>> Bumped SDK version to v09.03. v09.04 is available but not yet supported in
>> QEMU.
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   tests/functional/test_aarch64_aspeed.py | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/functional/test_aarch64_aspeed.py
>> b/tests/functional/test_aarch64_aspeed.py
>> index 141d86385936..6a9ae2a34956 100755
>> --- a/tests/functional/test_aarch64_aspeed.py
>> +++ b/tests/functional/test_aarch64_aspeed.py
>> @@ -27,14 +27,14 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>>           wait_for_console_pattern(self, '## Loading kernel from FIT Image')
>>           wait_for_console_pattern(self, 'Starting kernel ...')
>>
>> -    ASSET_SDK_V902_AST2700 = Asset(
>> -
>> 'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.02/ast
>> 2700-default-obmc.tar.gz',
>> -
>> 'ac969c2602f4e6bdb69562ff466b89ae3fe1d86e1f6797bb7969d787f82116a7')
>> +    ASSET_SDK_V903_AST2700 = Asset(
>> +
>> 'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast
>> 2700-default-obmc.tar.gz',
>> +
>> +
>> '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77'
>> )
>>
>>       def test_aarch64_ast2700_evb_sdk_v09_02(self):
> Do we need to change v09_03?

Indeed ! Will fix.

> 
> Others looks good to me.
> 
> Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>

Thanks,

C.


