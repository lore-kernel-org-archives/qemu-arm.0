Received: by 10.223.159.82 with SMTP id f18csp604885wrg;
        Thu, 30 Nov 2017 05:02:30 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa08WkZF2DFTL0UH6g18Zx8h3nLriCX4LkEjcuKQO9h8akLVRB9U4F5D3SK2Uk4Dk3bWUZ/
X-Received: by 10.129.33.130 with SMTP id h124mr1521214ywh.211.1512046950497;
        Thu, 30 Nov 2017 05:02:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512046950; cv=none;
        d=google.com; s=arc-20160816;
        b=Hq0d5O0wG1gI2m8BjF7u5pYqjClyVqJH9qTXL1at9YrH5nGUU2mdWwaQzW/Fi0RalV
         bU1DVHGz6SWKq230c6TJUxeIK8Y8/fKeK8twrOMIdVpsquQiHbJjnQMVT8cOjvl+k8dx
         IPntf+JshxLvkYz9+0ex7S6jiIClQDN6Zk7Re5gtkS/24iphVN1G2zflRZ3kTEt+fc2x
         mwM1EorGfspWAHN5VrbVCiNzKAgZOto9tafBYnd4fAExBgXPsKsvlQQlKw0PEg0Xwa/k
         W/u9eb6pedWsTKyCvMXk2Swa/DHnllEytH6fMTBNnb1erAnna+khEKAgum5+nRA7YZIj
         +tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=fXib2txoWPtx0MPbbx6RPqQv7AfKFVxv0kTG5/gq7ng=;
        b=THMccsEbLTHWMk1XmbhAtqSUf7Mr7m8hFc09WJj4NwCAdKkt+Lm1pbrpXAd+PCD6si
         XOyuE3w8exv8TixsBueZLWWDh3nybyxki3nTwK3N4CWXYU1Q59SWFP0fPoPS0mG41W8g
         bq8vUCtp3ep2kTRJUnxCrtWsDyJgfZ3to3JKhVdFFD7YYVRD+VNix/aGPhDLGYPpdaRo
         c1mcwoOzsAkrCHIQWKwVJE8yM3k5G4fromcYl2vuXWZb0SysWNfWqd174AnfQ85b0o0X
         UboIbb2AnDPaiZGXhTKNNGDIh/uqEH5iHqMQU8brh1+uYiGqkvZzWG1ovViOSAFArVo9
         xQrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g27si768510ybe.463.2017.11.30.05.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 05:02:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKOU1-0006Ne-S2
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 08:02:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eKOTk-0006It-Eg
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 08:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eKOTe-0007yd-Fz
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 08:02:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eKOTe-0007xo-9w; Thu, 30 Nov 2017 08:02:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AF26C059741;
	Thu, 30 Nov 2017 13:02:05 +0000 (UTC)
Received: from [10.36.117.126] (ovpn-117-126.ams2.redhat.com [10.36.117.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C9C5C893;
	Thu, 30 Nov 2017 13:02:03 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
	<CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
	<22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
	<CAFEAcA_0W6AiBG_yqi_HAtZ5ChkOva3WWNRuQ6JbddVYH1sruA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ebd7a7f7-00d2-fc5f-631f-f5d07571648b@redhat.com>
Date: Thu, 30 Nov 2017 14:01:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0W6AiBG_yqi_HAtZ5ChkOva3WWNRuQ6JbddVYH1sruA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 30 Nov 2017 13:02:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: CPIcfguMp1jb

On 30/11/2017 13:51, Peter Maydell wrote:
> On 30 November 2017 at 12:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 30/11/2017 13:14, Peter Maydell wrote:
>>> On 30 November 2017 at 08:53, Thomas Huth <thuth@redhat.com> wrote:
>>>> +static const uint8_t kernel_mcf5208[] = {
>>>> +    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
>>>> +    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
>>>> +    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     Enable TX */
>>>> +    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   Print 'T' */
>>>> +    0x60, 0xfa                              /* bra.s  loop */
>>>> +};
>>>
>>> This approach doesn't seem to be scalable to me -- are we
>>> really going to have 50 or more fragments of hand-coded hex in
>>> this file to cover the various board models?
>>>
>>> I'd much rather see us have a framework for being able
>>> to build test blobs from source using a cross compiler
>>> setup (and docker or similar so anybody can rebuild
>>> the test blobs). That will be much easier to maintain
>>> and easier to extend to having tests that test other
>>> parts of the board or other aspects of TCG emulation.
>>
>> It seems a bit overkill, as these snippets are ~16 bytes long.
> 
> They're 16 bytes long because that's about the limit of
> what you can do with this approach. The consequence is that
> they barely test anything at all.

Certainly they are an awful test for boards, but they are a great smoke
test for TCG changes that require modifications in all target/
subdirectories.

The infrastructure you want for integration tests is already provided by
kvm-unit-tests, which satisfies at least bullets 2-4 from your list
below (the first is unclear to me).

Thanks,

Paolo

> A more sensible framework
> would allow:
>  * better testing of TCG instructions more generally
>  * writing your test cases in C
>  * more interesting board dependent tests
>  * "integration test" setups like 'boot entire kernel'
>  * etc
> 
> thanks
> -- PMM
> 

