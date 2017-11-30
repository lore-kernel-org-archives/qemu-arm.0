Received: by 10.223.159.82 with SMTP id f18csp596294wrg;
        Thu, 30 Nov 2017 04:53:35 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaIpePL5OWCcmlEYFLxgyOyaW0JGxcLCOI6tBqzA1iutmVsGQYkfGjI1lhVMwyqUTHjfVHP
X-Received: by 10.129.68.38 with SMTP id r38mr1400404ywa.312.1512046415866;
        Thu, 30 Nov 2017 04:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512046415; cv=none;
        d=google.com; s=arc-20160816;
        b=sN8op+MCwXftdmP/r1BYXVqRW5Myf2bhaJzl2l9mlEG9jth4b/AvfpHgLQQULBoD27
         ar5e6lOODKlu+xV+TZIvCe+KiK9/Z7SPwrf0qDbkQcWAs9tzPrVrGgva4U7WVXoavTEM
         FqFbZwvz7dotRwljQgKi0nHXZFozpbgCVKHaW2CJrHjFxAAZbPt9HmPoheimLAdUDoDx
         4WgvPSjmC0A3akKJKJCBv21FTXboMkLBiwA5W3RcfHNt6ddkfv237IWtDrFB1n43CXXy
         UuhM4OLDfssHaWLUCTAsPvKollQbOkyU6kTuXpvQSp5lFjYhCXU7ewLLAHlQFOLxjub0
         stGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FSUxcQoxhHkR7UdbR9UVClutG0P0cBWwlWhMWlX4QpU=;
        b=yCNhGTyrpAMMMXo2pTyDn1mD2bZBBzBKU1Gg4+ltTujYoajUWcgKiikiVm5TkCmk2D
         TBhewtFGEhSw7oGh4HCRAT0noC1xK/wX14yDAw2up8Quyz4c0LvsQE1l0Ju87En9k9wg
         dNm3aQ3L//3OyUlbhZyepVw9nB5106VZFi90oRv9+VWJ+7yAYtQwsXdohS9KvhOY/00g
         pyLoTSZpJKgEMPuOawVZtq+5t9Smc3mVeGBkfKZ8GJJAzfl7b4wrRyTNH9Ec3gDPioPg
         yKJjzhmpAC8ShpG4r7Xqn27AkK0tMVkdmaQF2aqv8F52jEryBKOUoExkhBLNkXWDS/5S
         g/+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TbZnbrvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j62si770577ybg.754.2017.11.30.04.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 04:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TbZnbrvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKOLP-0006YC-Ct
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 07:53:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eKOJy-0005Nm-Kx
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:52:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eKOJx-00086X-Rx
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:52:06 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:43535)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eKOJx-00085p-MW
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:52:05 -0500
Received: by mail-ot0-x241.google.com with SMTP id y10so5955856otg.10
	for <qemu-arm@nongnu.org>; Thu, 30 Nov 2017 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FSUxcQoxhHkR7UdbR9UVClutG0P0cBWwlWhMWlX4QpU=;
	b=TbZnbrvAdEEB3VGJzrnWQzp3wZTAufMxoLJ32n1sgUW9cZtUNHmuhhtF3xeg8LaUuD
	yJVJaxKrTzciHkMwJRsiUT6yqiqqsmV5vBubQDWdHbzxhAJFaSnaInULslvI1WEjc10/
	qoiZIuogwst/Rzuwo7jnX1nb8aqDAHG8pevQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FSUxcQoxhHkR7UdbR9UVClutG0P0cBWwlWhMWlX4QpU=;
	b=WxBgaIKC3U0HnKbb9lbjs5CMN940N1F6wkrldK2jEfYwmSxoDHErrmPoBN51uF1Ov3
	w4lp+S2171wMlrKs5z4zXt2uaIizRbBVsQieGQJf2wsu+EwPRDX2eFZfBPXkN+ZbUXGD
	jYId9KnpwCsTeyGR+SC+8YjESRrdPmxsKTUwoZZTcf3+gwJDgJQeki/ui70jvkiiP/14
	J9481XMESnvheRRXU5MQrFexRVAdbibntwtI04W0YlQbW2rlCumsv7bpnt2dbpNJFOee
	SFyh77vnTxZPOkolCjEZxB8TiAi60wLCBdUSPxjUSrshUUiOGLlg4CFAdjDecvrmnEGN
	grhw==
X-Gm-Message-State: AJaThX7zria2T9lPrazpeHra2q1HNv3ShqgU7qNC9/7PV2wKDfirxLLO
	8AkMKJziopvF6y+APyRqJYfAIGJhOxWSlEWlHLBrlQ==
X-Received: by 10.157.13.168 with SMTP id 37mr5194927ots.197.1512046324695;
	Thu, 30 Nov 2017 04:52:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 30 Nov 2017 04:51:44 -0800 (PST)
In-Reply-To: <22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
	<CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
	<22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Nov 2017 12:51:44 +0000
Message-ID: <CAFEAcA_0W6AiBG_yqi_HAtZ5ChkOva3WWNRuQ6JbddVYH1sruA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 3/7]
 tests/boot-serial-test: Add support for the mcf5208evb board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 87fX6j+1sWXC

On 30 November 2017 at 12:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 30/11/2017 13:14, Peter Maydell wrote:
>> On 30 November 2017 at 08:53, Thomas Huth <thuth@redhat.com> wrote:
>>> +static const uint8_t kernel_mcf5208[] = {
>>> +    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
>>> +    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
>>> +    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     Enable TX */
>>> +    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   Print 'T' */
>>> +    0x60, 0xfa                              /* bra.s  loop */
>>> +};
>>
>> This approach doesn't seem to be scalable to me -- are we
>> really going to have 50 or more fragments of hand-coded hex in
>> this file to cover the various board models?
>>
>> I'd much rather see us have a framework for being able
>> to build test blobs from source using a cross compiler
>> setup (and docker or similar so anybody can rebuild
>> the test blobs). That will be much easier to maintain
>> and easier to extend to having tests that test other
>> parts of the board or other aspects of TCG emulation.
>
> It seems a bit overkill, as these snippets are ~16 bytes long.

They're 16 bytes long because that's about the limit of
what you can do with this approach. The consequence is that
they barely test anything at all. A more sensible framework
would allow:
 * better testing of TCG instructions more generally
 * writing your test cases in C
 * more interesting board dependent tests
 * "integration test" setups like 'boot entire kernel'
 * etc

thanks
-- PMM
