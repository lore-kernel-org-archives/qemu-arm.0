Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2890241njc;
        Tue, 5 Nov 2024 07:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdJDpI18ApI50P1ec6oLYVtR2DjQhxspJmGZAxw21tcDD60FmvIyF+gqOJLVqm0XUgnORuICZMSAi6Dg==@linaro.org
X-Google-Smtp-Source: AGHT+IFgHkUQNBHhy9eMkf71rfsPdg9BcgxiE5IWQsS50grpYQUHuQkFMvJmkUGy/9rz45NGSBYP
X-Received: by 2002:a05:6214:4387:b0:6cd:faea:9f78 with SMTP id 6a1803df08f44-6d35c0f3f77mr197852516d6.12.1730819328758;
        Tue, 05 Nov 2024 07:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730819328; cv=none;
        d=google.com; s=arc-20240605;
        b=Lm/Lv4qahUdUrSVf52oHJN6MWLzr0mqjt6NPcsEdXmoFYg9k61+P6LnCKFyaaOYt86
         uxtUw2kS/16fYZqCYEt5dQaBaRDO5hR81MLIqnor4pRzr+PjQkBdH+HsboIbuvXIChxV
         XwSuoqqCBgVPF0FrEegxaifw5nL9Wpvn5pTcrtunuF3o9ZdB2FDG+oHnbZPlvGYLjuU8
         GXThNIdHP31JLjlJS+aTpFkIikgYnomXiTj2e5/wsGIIlT4aarXaSjRKDsojogiM2D8m
         2euBc2+C+QlksrWt9eDyf0Jn9yRiO1p4kD6avQX2eura7OEikjf997SokGuWg4Y3iGgG
         4d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=phRVr3cLZ/yNRpp6CvC8iQFynTbwWlzfqHoIGEvS9+4=;
        fh=vR/m4EKO5ObaQ4iHOCL3PCKXcAyj3P3a9aXL3a61mt8=;
        b=JSlBoubQJFVlfT/cXJvC00eO3rNY+N1ia/63GLiD0uZGKggg62sRd7pTV5TSWMm3Sd
         NPdwRLiOx2m5d7wj9jSIL6d8Ln4hprRG2OfUpTg0Tbrv/oKbT0HT6Q77C00vo6VGTLCV
         Pb0F+bru1qGLKMgQpcNePLbz+r7HQih3VoG/Y4rlE57xPu4E3uicF7IsVdkoxxDMqNVq
         N2PgSO3hCSCbRA78UEBg7xGMX6kBQnfXYU+EPFHfTPHBJQyy0M/ITmn5UUKpSDvXtL9j
         8BU6UAIN/XaM6LNK9sm84fxWNOnpvll/FA/XQXF7FiCSjLnHOsnyKQaCPny4q91Xiozp
         e3hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A1wcrCOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3541b9975si145668226d6.548.2024.11.05.07.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A1wcrCOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8LAS-0005qk-7x; Tue, 05 Nov 2024 10:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t8LAN-0005qQ-8P
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 10:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t8LAL-0001Wt-Sk
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 10:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730819301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=phRVr3cLZ/yNRpp6CvC8iQFynTbwWlzfqHoIGEvS9+4=;
 b=A1wcrCOEi2aUQ+CuIJMUeWOJcWeJLOD2IKYmjFRzyHsAW5alMhOdXyklBNyHLyaTfx/K2g
 0btNWGX+pm/Az2Wj5HKrVsessWnrC894T/hqDNHzsVf4IGC8ZEsAQrsEQzSMuLmRSsea6H
 cNakPOxbS4GwDgSXjaGhdGKSI/Og/Z0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-LYLdZCIkN8ytK_DE5zr6Fg-1; Tue, 05 Nov 2024 10:08:20 -0500
X-MC-Unique: LYLdZCIkN8ytK_DE5zr6Fg-1
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-718163ef43dso3186446a34.2
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2024 07:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730819299; x=1731424099;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phRVr3cLZ/yNRpp6CvC8iQFynTbwWlzfqHoIGEvS9+4=;
 b=KicxyD1xOmzZ/7ddD4X7KHs6/W5OLafrTgiAY9T8M+Y/3bRkfNe6f0AjYTDm/HEFik
 bjWOadsk4uZg7k/niyEdKAabecu0Ih5e6tkgKwW/FfROYlLGMERu5YRROk7YJC+X4TZq
 h0SI4xTKHVtXTetWDqwxBoFlhD3Vm3QLBJ1qYzg/jEsdLQ9vpLPNFfiSKTJm55TK1lLE
 uGOynul6qpGJnfajP1ImbbMDS+QgCeQJZHY+1jfTXlMx2rhpueIGca+dqaFkEagKi6LE
 WOOuwfl2XFVFui9DPbc3oEI4pMgEoAqGaKlhGr9JClwXch/DuL5/p7LGxlfRsDX6QMRi
 XIsg==
X-Gm-Message-State: AOJu0YzOUAmUNDo6rmBUIe6qoLz5bVpXorR3sU1YdO5QAssm67RtKHk6
 WTpNEO6wDp5tbdN1js90602+7CZJdc2QLFo8T9sc5OBOYyeU1Gwpn8HqOhtr+t0oS7/eqOAyd+R
 s7JL2/tcz6IiXC6w1al1nxCnFQujqjS/QO3TS8+7LrmOPOfV0vFpw
X-Received: by 2002:a05:6830:25d6:b0:717:f707:cb92 with SMTP id
 46e09a7af769-719ca25e885mr15935942a34.28.1730819299136; 
 Tue, 05 Nov 2024 07:08:19 -0800 (PST)
X-Received: by 2002:a05:6830:25d6:b0:717:f707:cb92 with SMTP id
 46e09a7af769-719ca25e885mr15935905a34.28.1730819298853; 
 Tue, 05 Nov 2024 07:08:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:ecac:5b28:cd98:868a?
 ([2a01:e0a:280:24f0:ecac:5b28:cd98:868a])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec704e4fc7sm2253624eaf.15.2024.11.05.07.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:08:18 -0800 (PST)
Message-ID: <88a703df-359f-408c-9b0c-221497843cc5@redhat.com>
Date: Tue, 5 Nov 2024 16:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] test/functional: Fix Aspeed buildroot tests
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20241105132339.2967202-1-clg@redhat.com>
 <CAFEAcA9yP3=C5=wuXbBDQ0bSGonjGAyJ387=KsAcPS09Kn4pHg@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CAFEAcA9yP3=C5=wuXbBDQ0bSGonjGAyJ387=KsAcPS09Kn4pHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rf204jXuKGHu

On 11/5/24 15:38, Peter Maydell wrote:
> On Tue, 5 Nov 2024 at 13:23, Cédric Le Goater <clg@redhat.com> wrote:
>>
>> Since commit 786bc2255256, cached asset files are read-only. Adjust
>> the QEMU command line for buildroot tests to reflect the new
>> constraint on the flash drive.
>>
>> Fixes: f04cb2d00d5c ("tests/functional: Convert most Aspeed machine tests")
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   tests/functional/test_arm_aspeed.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
>> index 9761fc06a454..19853161b267 100644
>> --- a/tests/functional/test_arm_aspeed.py
>> +++ b/tests/functional/test_arm_aspeed.py
>> @@ -125,7 +125,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
>>       def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
>>           self.require_netdev('user')
>>           self.vm.set_console()
>> -        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw,read-only=true',
>>                            '-net', 'nic', '-net', 'user')
> 
> There are a couple of other places in this file where we add
> a '-drive' option pointing to a file -- do they also need
> read-only=true adding ?

The other tests use an OpenBMC drive image which is modified at boot
and so they have a '-snapshot' option on the command line.

The buildroot drive image shouldn't be modified although 'rw' access
is required. I am not sure why.

Thanks,

C.




