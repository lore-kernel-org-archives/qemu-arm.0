Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91952CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 13:16:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSx4b-0001Wc-Hn; Fri, 29 May 2026 09:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wSx4D-0001VX-3n
 for qemu-arm@nongnu.org; Fri, 29 May 2026 09:16:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wSx49-0004dN-Jq
 for qemu-arm@nongnu.org; Fri, 29 May 2026 09:15:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so1205031f8f.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 06:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1780060556; x=1780665356; darn=nongnu.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNZuWO14/hYrfF1FbYBmYNjTR26OQiJxBVDHKZXrrH4=;
 b=GqMb71e2AyYG4fRU9Xfa9EBel8NZATpmLbL2jQI3r6IcQmfvzOgEWYMkHHsSEot8gn
 Hk9HzWJsqnZ7Rbxl9K9XksNmT8X9s+NGwnlsaF7J3JzNKtmXw5evu/BnkLrMHWiT/Txi
 NKjqnhP7lOFadxLroXlyac1NZ53ZqLzP7YRHUVxWKrAFiyx6U8Bup4SXr4HCIlN8zqn3
 VogFUfGw06ltnbEQfHoxo5b9JFVpDtTkrl1CHgJCAzds6yJOqzPKhLQ3NH6r+143W6un
 rFutJFElOq/a1agpZOEj6NKrVCnXRmJspJhwNZo9w0Uwk/fysduGWoXO1EYDaP8WNuD7
 Gqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780060556; x=1780665356;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PNZuWO14/hYrfF1FbYBmYNjTR26OQiJxBVDHKZXrrH4=;
 b=GFojMdNyGeJIs8yMfN+Zpjdr9zp8H4S8L/+jhAGad24u4XYd7kQS8JvnhkQ03UxPzc
 PBev4E5SjqFv6mJHWVK2tUAUQalIoE3kIkNTgd/cXPVD6iVph0YJgQ5IoDl/voq9EU0D
 aeEwUfJIwXnhe1yZYLGfrFnH+s6QMSrCvbQ/Jb74hop9Uk9ZNCRkyD9jvlLgK2RuHsef
 BPIj149PVR7UFj8W0gtJ3WEwbC7AkrjDydZt+Dv7tkBDkXCauArS3Ft1EAh27i2CefA4
 5n6AvWdplB1OSVHdagfaYR0Ewiu7QmQaCXFRqQTmchfNnqsdCgTP6YWOqme8hU2m2LHf
 bzmw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kxYn49TjEwkwhuv2DZqDk/rZza1Jx4Y67uI/yrS9fh/TYxzfUYYSKNKNCHuBKfjyjNUjmAC0Owg==@nongnu.org
X-Gm-Message-State: AOJu0YzV4YH1+3VubwTw3JzcLjOICJHhZ+3ZHZS6ysh9QK5XMeDxegXB
 NSMynxtvbf4gl+UR/Ne+PwM8sncYIq+9dGNVhgCRe5+zRin5Z7fCAQ2BkiQtpFg9fV8=
X-Gm-Gg: Acq92OHKlX0beN2f+lWpVA9V5cxeoHF4lOGfkDGVxTjeahRnzB4ovdKIZQWLHLUh9rO
 JXIcJKLND+hcjeY9Xv7uS82Zu3vdX/3poIztAQ3KTW4JH0dX9j//sUGv8g6en0ulhogkFLBmSEP
 GDoiNy18h//ppMgyuXjnf8fARCDwRKzwiXrLc6YBvZcPxV0Y+2ul3uY0HQ84JQqmdL32v+8n9uX
 tCMQUmo3cupy+lqaL4wCjNftPJjiQur7dkUz3vdqPJRHvJexaACXnsfQrgdL+pENZWAG9Z3lSdj
 0+2UHtasacjX2GgpHdLiaENqZvmiDnppmdaC0iuAqt/Gjwpmb3RtcaqPsNxWAbvXCr3rkwzpcAC
 b2Y7sLLoXpVw+PGApP/5MI7PtC4ZWqf16GHLRLCd4c27THPNYqY9iv1ZPm1DfoIoR/e/6f9CLCY
 fn4Y/bL+Wxsn290Hspk3cdz01YsqK+ykblyhn8kQoguTEILojsdDLLWjRbyL8dER5T8jKP2FVVY
 6EImtjn7cIhRic84mwwmWlDR9HWx9Vk0SYBYQ==
X-Received: by 2002:adf:e00b:0:10b0:45e:98ed:bde5 with SMTP id
 ffacd0b85a97d-45ef143edf4mr3809894f8f.24.1780060555593; 
 Fri, 29 May 2026 06:15:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5c81:9f00:b51d:3606:8cce:d388?
 ([2a02:8071:5c81:9f00:b51d:3606:8cce:d388])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm4016286f8f.16.2026.05.29.06.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 06:15:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FUORgOBfGxIswJCvs3NVuKmW"
Message-ID: <8b7ee02e-fe95-40db-9f2e-2d47262d6020@9elements.com>
Date: Fri, 29 May 2026 15:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] hw/sensor: support MAX11615
To: Jonathan Cameron <jic23@kernel.org>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260515150610.381066-1-alexander.hansen@9elements.com>
 <20260515150610.381066-5-alexander.hansen@9elements.com>
 <20260529133919.3194636b@jic23-huawei>
Content-Language: en-US
From: Alexander Hansen <alexander.hansen@9elements.com>
In-Reply-To: <20260529133919.3194636b@jic23-huawei>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alexander.hansen@9elements.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is a multi-part message in MIME format.
--------------FUORgOBfGxIswJCvs3NVuKmW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jonathan, i just sent out a v5 which should address at least some of 
the comments you had for MAX11615 on v3 of this patchset.

I do appreciate the detailed feedback, apparently you know a lot about 
this device.

Overall i did underestimate the difficulty of making a good emulation 
for any of these 3 devices i am targeting as part of yv4 support. Maybe 
i should have started with only MAX31790, but i needed all 3 of those 
for my OpenBMC development use-case.

I would still like to continue the work on these. Iterating on 3 devices 
at the same time can be challenging for someone starting out,
so most of my focus is on getting machine + functional test in, then 
MAX31790, then the others.

 > So what is the purpose of limited emulation vs just not emulating it 
at all. My use-case for these devices is to support firmware 
development, specifically OpenBMC development on that platform.
For that purpose it is already sufficient since the drivers probe and 
provide readings. If i find gaps later, i can address them.

Of course if someone else wants a specific feature of the sensor 
supported or finds a bug in any of these patches i am happy
to implement these things :)

Thanks again for reviewing,

Alexander

On 5/29/26 14:39, Jonathan Cameron wrote:
> On Fri, 15 May 2026 16:58:01 +0200
> Alexander Hansen<alexander.hansen@9elements.com> wrote:
>
>> Product: [1]
>> Datasheet: [2]
>>
>> Sensor readings can be provided upon creation of the device. In case no
>> readings are provided the ADC reads a pre-defined arbitrary value.
>>
>> root@yosemite4:~# cat /sys/bus/iio/devices/iio:device2/name
>> max11615
>> root@yosemite4:~# cat /sys/bus/iio/devices/iio:device2/in_voltage0_raw
>> 1922
>> root@yosemite4:~# cat /sys/bus/iio/devices/iio:device2/in_voltage_scale
>> 0.500000000
> As I mentioned on v1 a lot of the standard linux driver operations with this
> device will not work. The emulation doesn't deal with multi channel
> scans for example.
>
> So what is the purpose of limited emulation vs just not emulating it at all.
> (which will fail a couple more things obviously!)
>
> I'm not sure what the standard expectations are for this when the
> features that aren't emulated are not discoverable (i.e. the driver can't
> tell it should not use them).
>
> Jonathan
>
>> trace:
>> less /tmp/qemu-trace.log | grep -i max116
>> max11615_realize i2c_addr: 0x33
>> max11615_realize i2c_addr: 0x33
>> max11615_event i2c_addr: 0x33, event: 0x01
>> max11615_write_setup i2c_addr: 0x33, data: 0xd2
>> max11615_write_config i2c_addr: 0x33, data: 0x0f
>> max11615_event i2c_addr: 0x33, event: 0x03
>> max11615_event i2c_addr: 0x33, event: 0x01
>> max11615_write_setup i2c_addr: 0x33, data: 0xd2
>> max11615_write_config i2c_addr: 0x33, data: 0x0f
>> max11615_event i2c_addr: 0x33, event: 0x03
>> max11615_event i2c_addr: 0x33, event: 0x01
>> max11615_write_setup i2c_addr: 0x33, data: 0xd2
>> max11615_write_config i2c_addr: 0x33, data: 0x61
>> max11615_event i2c_addr: 0x33, event: 0x03
>> max11615_event i2c_addr: 0x33, event: 0x00
>> max11615_recv i2c_addr: 0x33, reg_addr: 0x00
>> max11615_recv_return i2c_addr: 0x33, returns: 0xfa
>> max11615_recv i2c_addr: 0x33, reg_addr: 0x00
>> max11615_recv_return i2c_addr: 0x33, returns: 0xd2
>> max11615_event i2c_addr: 0x33, event: 0x04
>> max11615_event i2c_addr: 0x33, event: 0x03
--------------FUORgOBfGxIswJCvs3NVuKmW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Jonathan, i just sent out a v5 which should address at least
      some of the comments you had for MAX11615 on v3 of this patchset.<br>
      <br>
      I do appreciate the detailed feedback, apparently you know a lot
      about this device.<br>
      <br>
      Overall i did underestimate the difficulty of making a good
      emulation for any of these 3 devices i am targeting as part of yv4
      support. Maybe i should have started with only MAX31790, but i
      needed all 3 of those for my OpenBMC development use-case.<br>
      <br>
      I would still like to continue the work on these. Iterating on 3
      devices at the same time can be challenging for someone starting
      out, <br>
      so most of my focus is on getting machine + functional test in,
      then MAX31790, then the others.<br>
      <br>
      &gt; <span style="white-space: pre-wrap">So what is the purpose of limited emulation vs just not emulating it at all.

</span>My use-case for these devices is to support firmware development,
      specifically OpenBMC development on that platform.<br>
      For that purpose it is already sufficient since the drivers probe
      and provide readings. If i find gaps later, i can address them.<br>
      <br>
      Of course if someone else wants a specific feature of the sensor
      supported or finds a bug in any of these patches i am happy<br>
      to implement these things :)<br>
      <br>
      Thanks again for reviewing,<br>
      <br>
      Alexander<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 5/29/26 14:39, Jonathan Cameron
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20260529133919.3194636b@jic23-huawei">
      <pre wrap="" class="moz-quote-pre">On Fri, 15 May 2026 16:58:01 +0200
Alexander Hansen <a class="moz-txt-link-rfc2396E" href="mailto:alexander.hansen@9elements.com">&lt;alexander.hansen@9elements.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Product: [1]
Datasheet: [2]

Sensor readings can be provided upon creation of the device. In case no
readings are provided the ADC reads a pre-defined arbitrary value.

root@yosemite4:~# cat /sys/bus/iio/devices/iio:device2/name
max11615
root@yosemite4:~# cat /sys/bus/iio/devices/iio:device2/in_voltage0_raw
1922
root@yosemite4:~# cat /sys/bus/iio/devices/iio:device2/in_voltage_scale
0.500000000
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As I mentioned on v1 a lot of the standard linux driver operations with this
device will not work. The emulation doesn't deal with multi channel
scans for example.

So what is the purpose of limited emulation vs just not emulating it at all.
(which will fail a couple more things obviously!)

I'm not sure what the standard expectations are for this when the
features that aren't emulated are not discoverable (i.e. the driver can't
tell it should not use them).

Jonathan

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
trace:
less /tmp/qemu-trace.log | grep -i max116
max11615_realize i2c_addr: 0x33
max11615_realize i2c_addr: 0x33
max11615_event i2c_addr: 0x33, event: 0x01
max11615_write_setup i2c_addr: 0x33, data: 0xd2
max11615_write_config i2c_addr: 0x33, data: 0x0f
max11615_event i2c_addr: 0x33, event: 0x03
max11615_event i2c_addr: 0x33, event: 0x01
max11615_write_setup i2c_addr: 0x33, data: 0xd2
max11615_write_config i2c_addr: 0x33, data: 0x0f
max11615_event i2c_addr: 0x33, event: 0x03
max11615_event i2c_addr: 0x33, event: 0x01
max11615_write_setup i2c_addr: 0x33, data: 0xd2
max11615_write_config i2c_addr: 0x33, data: 0x61
max11615_event i2c_addr: 0x33, event: 0x03
max11615_event i2c_addr: 0x33, event: 0x00
max11615_recv i2c_addr: 0x33, reg_addr: 0x00
max11615_recv_return i2c_addr: 0x33, returns: 0xfa
max11615_recv i2c_addr: 0x33, reg_addr: 0x00
max11615_recv_return i2c_addr: 0x33, returns: 0xd2
max11615_event i2c_addr: 0x33, event: 0x04
max11615_event i2c_addr: 0x33, event: 0x03
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------FUORgOBfGxIswJCvs3NVuKmW--

