Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3226089wrq;
        Mon, 9 Jul 2018 23:51:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdU0dZqMDysGleslXyF8wig9VhC1oXtWxHfXO10//KCAdd+dWMguvmGjw0LoO4lTLHXuhtw
X-Received: by 2002:a37:4792:: with SMTP id u140-v6mr20644573qka.100.1531205490081;
        Mon, 09 Jul 2018 23:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531205490; cv=none;
        d=google.com; s=arc-20160816;
        b=I2JaZGLm1cTJ7FF+CxKddjnuTGEdofyUmSKjPQFcDfTo/M/A8kDCi7IF7ugreygVGf
         uA97ohd6OTxIBqwW53Znt6cSayQFBtKHNNsiwF7rBgfoEupYSZ9L0RqWpaRmH2CwkZRg
         1V0nrDkrwiyAf1BJFeIzYamiWslwwYIueUyuZ4ZdW+0HMagBzWl0VGm15f18EQNvFKFD
         MJiZPloU+hXPgrHbEzS62UVuSTMCJh4jb/As7GqQ2evrtktLmI/UjZBgJeQoVSln+sdj
         TKdKPlM/ZqRzg5t3D3H8bwquXzkgbmUTciziggTISgRPvyI5PSCFkOmXflii5g/Q3LWW
         pTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9D/+KBu6F5JBWEB5ZSUi+fk1f+60kJEL9lAg2dbUccM=;
        b=GckBHIgK7qsi7Qwfa4/UoZ49If3WNJfDfwyTZ3KJbSTfSJMVzV2Eb7pCsY68H+4aBP
         OMSG6URwjCuTzvDIs5Pk4CtVqa5n53juMRGg+gpN/wyBjqRJ4Dh0GEJIqW1SrK52C3Rq
         HANYQPdOWkkZKlCFjpdHnxwDM9VpmvLa2/AxEgrT3CbXC2EirtZ0c9+yq6E1T5OOU9+Q
         BTcnl0m+1jTFTF1nhS1b/OBOtTuNLsVFWEVrBdvQFgOmJWpt99Pu+gRVPL7DuGzX67Id
         D6+/bisvvn9/xvo1y35iMAwiu5QoA5yhvN7+zscgVj9M/ZsX2MQ2sp1YqTdkFgMwxcPU
         Cl6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RZb66qaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6-v6si15868052qkd.167.2018.07.09.23.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 23:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RZb66qaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcmUj-00035I-Iv
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 02:51:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcmUa-00034P-Eu
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 02:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcmUZ-0006mS-JF
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 02:51:20 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43842)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcmUZ-0006m3-C2
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 02:51:19 -0400
Received: by mail-oi0-x244.google.com with SMTP id b15-v6so40565719oib.10
	for <qemu-arm@nongnu.org>; Mon, 09 Jul 2018 23:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9D/+KBu6F5JBWEB5ZSUi+fk1f+60kJEL9lAg2dbUccM=;
	b=RZb66qaaOZQYrXIjr/5/DB4H8cjpDdYzxi6+Vye31xtMlDl0nvjNhsYv3mJXtSRUdg
	XTwu+C7nRoANpuQlIjZzytehSOBitABVv+5X4J67AjRoEqu47U2/efNi3uqJqKuqbHOt
	Ula4UeV77HUtSensSW7g5QyjiS+rskmOsPXM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9D/+KBu6F5JBWEB5ZSUi+fk1f+60kJEL9lAg2dbUccM=;
	b=uD6k4TkyVO9AO/QNnuQtILG+Pnd8fBj12xIjuP1lmLJtkVLXxOQ5vYdGvcIHKAYs6n
	4tdkPlgA3eTQX/P/FE01c8fN+fGLjUJRigKz1k8884C6e6e8pNBucdb2RN+9nssCXdm0
	ATv23HV+n/IJ2XbNiVxO96T2tlD/ZKXR7GSyhLeeAZGIknSYLwACTUB6FghiTQO1nXRq
	qLJulzI6Lwo6CSRzL/BjH0roCFl6IVefOvCzsk67u26UbFz3B7X3C5jC6c9PmCWmzwq5
	aSu7R27TmSeIdyGsW3YiEPqFbHPsvSj2MU3C2WPkAwED7XJiYaeY/fDVIdze7QrtxR2J
	iPhQ==
X-Gm-Message-State: APt69E2BSuBayRWp+36+luvUXREczaP6fA/7DFwNaL/Sr+B43EtTi8/2
	HMHC8q2j91yeIFiMZFQC22xlvlUzielmMXNE8M+seQ==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr27827940oig.13.1531205478471; 
	Mon, 09 Jul 2018 23:51:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 23:50:57 -0700 (PDT)
In-Reply-To: <5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jul 2018 07:50:58 +0100
Message-ID: <CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4H0fY3zvu/Vv

On 9 July 2018 at 23:03, Thomas Huth <thuth@redhat.com> wrote:
> On 09.07.2018 23:42, Peter Maydell wrote:
>> On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
>>> When trying to "device_add bcm2837" on a machine that is not suitable for
>>> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
>>>
>>> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>>>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>>>  "'arguments': {'command-line': 'info qtree'}}" | \
>>>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
>>>
>>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>>>  "package": "build-all"}, "capabilities": []}}
>>> {"return": {}}
>>> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>>>  hotplugged on this machine"}}
>>> Segmentation fault (core dumped)
>>>
>>> The problem is that qdev_set_parent_bus() from instance_init adds a link
>>> to the child devices which is not valid anymore after the device init
>>> failed. Thus the qdev_set_parent_bus() must rather be done in the realize
>>> function instead.
>>
>> Yuck. The real problem here is that we're still requiring the
>> code that creates these QOM devices to manually set the parent
>> in the first place. It's not surprising that we don't get it right
>> (either parenting in the wrong place or not at all). I'd much
>> rather see us fix that properly than keep papering over places
>> where we get it wrong.
>
> Sorry, I'm still not an expert in all this QOM stuff yet ... so what do
> you exactly recommend to do instead?

I'm not clear either, but I don't think that what we're
currently doing can be right.

thanks
-- PMM
