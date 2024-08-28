Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp471817nji;
        Wed, 28 Aug 2024 05:35:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKBSQ87TQH6yCB3xUnE16zu2iXACLuE+z6xViyliaz209DQb0qqCq5jy6c/kTNVxzwxY2B4C0oUvU/ow==@linaro.org
X-Google-Smtp-Source: AGHT+IEur9uI7B6bloAd1ffjP7tGar3IB1eYxP27C2VZNgA8PAcLSG4AnjoKTzTs40/V/Meyn4Ka
X-Received: by 2002:a05:6214:3106:b0:6c1:6e39:d8de with SMTP id 6a1803df08f44-6c3362be15bmr20985036d6.2.1724848520673;
        Wed, 28 Aug 2024 05:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724848520; cv=none;
        d=google.com; s=arc-20160816;
        b=rgA+PFv4dnFbljcENvwWUBjTbIHW4rlkws2Wg7ovr9mjOBcpv9ZfFWi+6g/Z+7RhSY
         AZCFFW9QKruIOki3e8d7egdcQFQyHDLEIQONXipzJSpdO+gsMA+QhD929uabpkkbqKkn
         gA/YBm9+aZQFk5O189kLg75rKocfvIf5U9T8cQ1gcZ84wGJA9IFH4WwWqQUgCwYaqvh9
         Q+cpckv1sd/okWHYUuPnztlgGhZapUyLQq4bs0HpAASOnmw711J9QOzQwYGqc+/+Iul0
         8x9YtotveMPl16fUH8Qo9QlbEUjI1j2cS/+8NtXMaS8MFZt/OnmhwfVayseXqsyaK7ta
         B0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0bktHROW/eeK6KIiYmxl5H0JjE5rD5n4UGGYZUC/j2c=;
        fh=X1uXDNS3CVGBdW6R1BqR8daGVf13cPHGzH8O2/MCgr4=;
        b=C14rKtYB40OV+Xg7b95w8MVNNaQ6VVgHzmek5Rq7SpQTnrBkXFGmfatjj0b8niVWtT
         StHDqow+yyWomhRhxZNTAj6BBBKLBhlqXB3XA90VpMg2n51g/9ZAUzdZTER91u4+P9y8
         oJ/ZAG+tnYIq+s1Plf94fH9E01jMq9t2yMs7CASOHcNT+O9J7D/NgKLoohjPufUDKkQp
         7V7LBgYeMp3usIFaHb7otxaBMyR6oI1gRLDQ9NkT5T8ZSINCxk0srTqGSmx3qRbJ2mRn
         7UZWoJbxw95XH03lUToS78jHW6nXoiGmUc8QO57cZnpPhSbLRTOg8Wkr8cyWCqpUUG+I
         Fd8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cnc06ngf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162dd8fc8si160776526d6.343.2024.08.28.05.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2024 05:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cnc06ngf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjHtL-0003Gw-S6; Wed, 28 Aug 2024 08:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sjHtG-0002zu-EM
 for qemu-arm@nongnu.org; Wed, 28 Aug 2024 08:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sjHtE-00032n-Hc
 for qemu-arm@nongnu.org; Wed, 28 Aug 2024 08:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724848506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bktHROW/eeK6KIiYmxl5H0JjE5rD5n4UGGYZUC/j2c=;
 b=Cnc06ngfabKCO0wBw1xM6GIkQ47JYTFUpnGmCKvf1WmvJaiZ8E/EIveZhtY70D/NmPaVLL
 n9gk3h8u6UNVFEy3CmFV7UW8gPP95BJYE4AWEv2dTsKHKIahh/M+nNWUonS6cUIp+bUCQa
 fyfCyQQXAcI0Qk9jsZ3dwEPp4aYQF7A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-mnTQuj2BM1OUCN-6z_24pw-1; Wed, 28 Aug 2024 08:35:05 -0400
X-MC-Unique: mnTQuj2BM1OUCN-6z_24pw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-44fe92a34d2so99906211cf.0
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2024 05:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724848505; x=1725453305;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0bktHROW/eeK6KIiYmxl5H0JjE5rD5n4UGGYZUC/j2c=;
 b=io2iq0S+Nxze/flUG7Myrs30N7RgCHXZ0DYBWuhqMAWLp5EWajizEfzcYC0+Z6jksr
 hgz3tE1kAH+PWHLjBT0vzu8+Wh5WZN7Uyt3vuOYiDZi/lpu6aiXV9JTpSAUgwUek0AX9
 +9HC496JdDjerwIc9sfOOYf70U8oHATNBLDC3Kwa18tDsGTnj1vyYGxPcly8CLwtpmTk
 R6LqcaQRmB33quW0HObUbI0LkpNNrgyqcp+W6iQ3FgQOxsQUXsV254KmLZIgq/jRXyhG
 Q+r0JjUpTT52USvveBSMB337+h7P/E3rdzWJEj5Hqlt8bNGz6WPCYgrZjb3GM0Q+9TXw
 BSrA==
X-Gm-Message-State: AOJu0YyGEt+motcCAKkdendoUwY922xwJwcERbco+TYAxQltFEvoW6QA
 S/O5JYiIqBWNkDqm5RizoF8ZEQkQou04weEbMx1HqSDVcl2eRGJDGU+hPW91gRMJL0JR6i7Szu3
 P1CbYVEAgVz/TyAaYFTiwERh4fkCYV3IYUtbcwdoW47O0uDi0hw==
X-Received: by 2002:a05:622a:4895:b0:453:7706:759a with SMTP id
 d75a77b69052e-4566e59da5dmr23124611cf.3.1724848504844; 
 Wed, 28 Aug 2024 05:35:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4895:b0:453:7706:759a with SMTP id
 d75a77b69052e-4566e59da5dmr23124271cf.3.1724848504409; 
 Wed, 28 Aug 2024 05:35:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:3f78:514a:4f03:fdc0?
 ([2a01:e0a:280:24f0:3f78:514a:4f03:fdc0])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4567d226c35sm428161cf.31.2024.08.28.05.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 05:35:04 -0700 (PDT)
Message-ID: <8d1fd867-647b-4827-a2b2-a239618a7743@redhat.com>
Date: Wed, 28 Aug 2024 14:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aspeed: Deprecate the tacoma-bmc machine
To: Guenter Roeck <linux@roeck-us.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240625070830.492251-1-clg@redhat.com>
 <4e04f930-e7af-4084-99a8-2a3139e2bf43@roeck-us.net>
 <5fb7342b-fa67-4cb2-b6fd-2241b7b76d03@redhat.com>
 <f70cb39f-3567-4322-b1c4-1bc5991d91fa@roeck-us.net>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <f70cb39f-3567-4322-b1c4-1bc5991d91fa@roeck-us.net>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Rs7X/fEItcsB

On 8/26/24 20:50, Guenter Roeck wrote:
> Hi,
> 
> On 8/26/24 02:58, Cédric Le Goater wrote:
>> Hello Guenter,
>>
>> On 8/9/24 00:05, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Tue, Jun 25, 2024 at 09:08:30AM +0200, Cédric Le Goater wrote:
>>>> The tacoma-bmc machine was a board including an AST2600 SoC based BMC
>>>> and a witherspoon like OpenPOWER system. It was used for bring up of
>>>> the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
>>>> machine which is part of a real product offering.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>>
>>> I have been using tacoma-bmc to test tcg,tpm-tis-i2c functionality
>>> on arm. rainier-bmc doesn't support that, and other IBM BMCs which
>>> do support it (bonnell, everest, system1) are not supported in qemu.
>>>
>>> Do you have a suggested alternative ?
>>
>> Could you use the ast2600-evb machine instead ? as done in
>> machine_aspeed.py, see routine test_arm_ast2600_evb_buildroot_tpm.
>>
> 
> Unfortunately, that does not work for me because that requires instantiating
> the tpm chip from the CLI by writing into the new_device sysfs attribute,
> and I can not do that in my test environment.

Ah. too bad.

>> We can't add a "tpm-tis-i2c" device to the tacoma-bmc machine init
>> routine because a TPM backend is required.
>>
> 
> Not sure I understand; tacoma-bmc instantiates the TPM chip through its
> devicetree file which is what I was looking for.

I meant at the "HW" board level in QEMU.

We can not instantiate the TPM I2C chip device model in the tacoma-bmc
machine init routine and attach it to the I2C bus because of the required
TPM backend. This means that the device is necessarily defined on the QEMU
command line and this makes the ast2600-evb and tacoma-bmc machine very
similar in terms of HW definitions.
  
> I solved the problem by adding support for IBM Bonnell (which instantiates
> the TPM chip through its devicetree file, similar to tacoma-bmc) to my local
> copy of qemu. 

Hmm, did you copy the rainier-bmc machine definition ?

> It isn't perfect since I don't know the correct HW pin strapping
> and reused the strapping from Rainier, but it works for me.

Keeping the tacoma-bmc machine is fine if there is a use for it. Testing
the TPM I2C device driver is certainly a good use but we should reflect
that in QEMU also (so that we don't forget). Could we change the test in
machine_aspeed.py to use the tacoma-bmc machine instead ? and revert the
deprecation patch of course.

Thanks,

C.



