Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2035853lfq;
        Mon, 14 Sep 2020 00:28:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcWFs1+gWWxU77QOcJqoWT31Pygd+QuPyg9PqfwcghJJbJc8d7LkpL0O5oRsRuxOsO/Asj
X-Received: by 2002:ac8:76d0:: with SMTP id q16mr12266560qtr.164.1600068499360;
        Mon, 14 Sep 2020 00:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600068499; cv=none;
        d=google.com; s=arc-20160816;
        b=NyAWtOusKDfOY71uZQo4WbYDaTNtCXw2oLRiUCaVag7ZHl4Q06DcCntAd2TzuzXf/0
         eExNYPcNynK062Zvsu7r96vVKFJ/qxQg7FFcRrgNgq2BRiXLCVj0zqgp5me+Z5k49Eo+
         qfP+BJlgMYo1F3DtMV0a24p6UePiVpTkZ3FGPjHVeRub87YMWSws1nfsw9IRR7sO6AV+
         +E6ILvV3OH2V4+omBC47yRthj4n/n5ZP38YcO5m04qj3fFWgQFyLHr4jSPWT1g6H2TcC
         smWzD6MfSFqbzkivHX1ebZX0d9j/8p3ZWngUVHojArheTPhEsEf+kIW0QD93YGBdc2oD
         b5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=Pp3duOLj+QZDkrMVrRjQt+WxyDMKP0kNo1sXYzolC6M=;
        b=bBf7X7dWBwZH6e4gcttIDKhZinCUEONq8mxrrBglIAMx7tfVmLYWro1v5/sxB5Hzdk
         IrxEOE7p6vV9CytOw/c1qixCd9t5KIzRdAbXQvPwDw0Tiw9dpm2zb8zjNFkoy036mWpw
         XhkiaTV12PHk3ojnr/+SsfRzXAy+YuqS8Yrbpqe7sh8ybXKRdW6izKb8mXiNmApp27NB
         sQ2YBl68610qlO0nbboLOIW8SHrVHfojRsTK5VkZcDe8A2FaCfDyn7VJpcMBuy4tSslE
         IK+JUiJ5ck2KvxEEwwQVvYgdT7YMH+zJ9n7+s9EMU7kbcHiEhW0N5bsBclKRzppI5BHm
         mdEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YTvjya6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si6119459qkj.272.2020.09.14.00.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 00:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YTvjya6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHiuQ-0005VV-Pa
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 03:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kHiu7-0005Uf-K9
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 03:27:59 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42214
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kHiu5-0003Fy-QH
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 03:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600068477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pp3duOLj+QZDkrMVrRjQt+WxyDMKP0kNo1sXYzolC6M=;
 b=YTvjya6q0YvEMUvQoEGGHSYszNEzJQbRfLh1KM5b2ucvmYrHBY+9pWei8ovEv3SZ/TXsja
 9wferKJw94+E6Og8FFBoJ3PzFeOZZ6IMUxeHCN09957iVDmGEJi/yySe6bEX8l6UNoy7C5
 iJK7YkMQx35rM5fbe+xZEf7f565vR0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-H32sLhDyNRGRrFy-8fHSXQ-1; Mon, 14 Sep 2020 03:27:53 -0400
X-MC-Unique: H32sLhDyNRGRrFy-8fHSXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C7F6409B;
 Mon, 14 Sep 2020 07:27:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F3367CEF;
 Mon, 14 Sep 2020 07:27:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39F30113865F; Mon, 14 Sep 2020 09:27:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 2/7] hw/misc/led: Allow connecting from GPIO output
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-3-f4bug@amsat.org>
 <071b68a6-58e4-0d68-e056-ee7ae19e2227@linaro.org>
 <db55f80e-ca2d-d432-134b-a05333a7e124@amsat.org>
Date: Mon, 14 Sep 2020 09:27:26 +0200
In-Reply-To: <db55f80e-ca2d-d432-134b-a05333a7e124@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 12 Sep 2020 10:50:49
 +0200")
Message-ID: <87imcg4y3l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:33:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2lenuxpRp7Qg

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Eduardo is already in Cc, adding Markus.
>
> On 9/12/20 12:44 AM, Richard Henderson wrote:
>> On 9/10/20 1:54 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Some devices expose GPIO lines.
>>>
>>> Add a GPIO qdev input to our LED device, so we can
>>> connect a GPIO output using qdev_connect_gpio_out().
>>>
>>> When used with GPIOs, the intensity can only be either
>>> minium or maximum. This depends of the polarity of the
>>> GPIO (which can be inverted).
>>> Declare the GpioPolarity type to model the polarity.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  include/hw/misc/led.h  |  8 ++++++++
>>>  include/hw/qdev-core.h |  8 ++++++++
>>>  hw/misc/led.c          | 17 ++++++++++++++++-
>>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
>>> index f5afaa34bfb..71c9b8c59bf 100644
>>> --- a/include/hw/misc/led.h
>>> +++ b/include/hw/misc/led.h
>>> @@ -38,10 +38,16 @@ typedef struct LEDState {
>>>      /* Public */
>>> =20
>>>      uint8_t intensity_percent;
>>> +    qemu_irq irq;
>>> =20
>>>      /* Properties */
>>>      char *description;
>>>      char *color;
>>> +    /*
>>> +     * When used with GPIO, the intensity at reset is related
>>> +     * to the GPIO polarity.
>>> +     */
>>> +    bool inverted_polarity;
>>=20
>> Why are you not using the GpioPolarity enum that you added?
>
> Because it is migrated...
>
> Using DEFINE_PROP_BOOL() is simpler that adding hardware specific
> enum visitor in hw/core/qdev-properties.c (which is included in
> user-mode builds because pulled by the CPU type).

Yes.

You could also use DEFINE_PROP_UINT8(), and use it with your enumeration
constants.

I'd be tempted to ditch the enum entirely.  Matter of taste, no big deal
either way.

> A sane cleanup would be to make get_enum(), set_enum()
> and set_default_value_enum() public (prefixed with 'qdev_')
> in include/hw/qdev-properties.h.

Purpose?  To be able to define enum properties outside
qdev-properties.c?

> Out of the scope of this series, but might be worth it.
>
> Eduardo, Markus, what do you think?
>
> Thanks Richard for reviewing this series!
>
> Phil.

