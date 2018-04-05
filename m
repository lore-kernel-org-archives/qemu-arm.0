Received: by 10.28.71.155 with SMTP id m27csp5895545wmi;
        Thu, 5 Apr 2018 03:52:55 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/n/N3PBHUa8VxqQwx69fotaa0lu2HdEVE2sCfDGSMjZ7/ivCdPi0dBPkckPfrk9H4BUBXR
X-Received: by 10.55.170.67 with SMTP id t64mr27903921qke.54.1522925575046;
        Thu, 05 Apr 2018 03:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522925575; cv=none;
        d=google.com; s=arc-20160816;
        b=oblfg4g8afBMXH6OQ23qnfqMCRKNqzT6FvSySpgWoPWOHK1gTyzDSouVCgA6Aq5gR/
         IbuDbqjplslHATljD0rIVMtuNES/rSir9vyaYxptzHcEJYSXaSEGKX/2bL+rBmU9GMJp
         ZFSWBNt8QL36uNDs5mjQkDsNqgvvyHiQmY3XoviUiKGVMqb+L7dKGmjg14ZXynWhI4H4
         sKHeBiLlWIIFwLgCXJkggP86RBXWHXNih2XpOT1aANKmDecmdk+SZcGMhV8X96mQahsb
         boKq8+x2fSVuOxAYPsKatx591GY/S3mB0AB54hnfrH29gf6FfHY4Zq5ky8RpJ8sc+fwh
         woVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ypEFuVTB3VTCysDcP9O+Bcap6++kz+uGqYSjjCtaaVE=;
        b=hFNHp/xiAZf0PbnX7ZJXwF40Dwd7OA3Ss6EMSRB1zv1mMnXIRA9OFtc0TaOZ+lzej5
         ZlwtVKFSCA5705BXKBCBFJIuwqRTVOi5LwyNEzaNCefhErCwoNfDZyTl1KDkdAzJyXdX
         pkdIvuo7xgG/IuTxAPFyfXLdipRXHFGXgTvBrzMvZHD1B3o0jm2hE51Q4ube064dncGG
         xIkbSCZ9FweLOp/cc67uAKPpmtbecftawm+B0+1VOrSmdAtsBMZrmZpWc6RJ4+ZuYedK
         vrnf7w5s8CFG17ApYDpLEg7ieNxCOxYNzykyK56Dr2p9hdRhOuJu1CDRyT973mpI9eni
         m3KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eq65PN/f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e77si844189qkj.345.2018.04.05.03.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 03:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eq65PN/f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f42Vi-0004JC-Ix
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 06:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f42VH-0004H7-JG
	for qemu-devel@nongnu.org; Thu, 05 Apr 2018 06:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f42VG-0004qV-Ol
	for qemu-devel@nongnu.org; Thu, 05 Apr 2018 06:52:27 -0400
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:40609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f42VG-0004qF-IW
	for qemu-devel@nongnu.org; Thu, 05 Apr 2018 06:52:26 -0400
Received: by mail-ot0-x233.google.com with SMTP id j8-v6so19147856ota.7
	for <qemu-devel@nongnu.org>; Thu, 05 Apr 2018 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ypEFuVTB3VTCysDcP9O+Bcap6++kz+uGqYSjjCtaaVE=;
	b=eq65PN/fIOM0hcMFBRvZXnQwfXK8239SL1+czeXScmHERasdUZcvJ3fRua+dQgfLKH
	eS3W0kGsDoShNyuuF4xxtf5q8XG/fIGCJwZsRsWBmV9ERfybDINFcaoP8y1sAq5US8e+
	/x9Hudy8p64vpLR8MN5oapTYE8uE2Ih5xbbgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ypEFuVTB3VTCysDcP9O+Bcap6++kz+uGqYSjjCtaaVE=;
	b=s9aILbgqgigypSHP5bVVhVu4gnhkV7PMRmHCy9bzDau498tTC7GC8HOATcpWOv+JoY
	M4JhZ/vzEyIasqm2RFp0cHF6FxDEVP5DTAGWsJRM9/x9Pxh/uBGfukepbst+kxUB8iio
	bQeazCALexN3SiqWLTL6Jch6woJ6GccrTv6+x/4Kf2ZCH5n/5cHsMJ23NUkwJ+c5Oo19
	ynMcx15ykrvdzGQcZDF8QHOPtgM6/EaxoklL8xsUm7FQOz08kWb5fDy9yH7ph4DZxIxC
	BM6Mnm8CZwljjMs6HOj5+RNLPoov8mz1g1w91QV7t1TpVaF/+QXjmMrZw4xVbsJtfOsc
	a03g==
X-Gm-Message-State: ALQs6tCEbUa7cKMsanGUedDRsXmXdn9x0MEvG2D7ZJih3ToYKQUxui76
	2shq0xXAaoveP/DM1/W8h69ybopRCbci6wwh3Sx9Yg==
X-Received: by 2002:a9d:5cc1:: with SMTP id
	r1-v6mr12642936oti.258.1522925545801; 
	Thu, 05 Apr 2018 03:52:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 03:52:05 -0700 (PDT)
In-Reply-To: <1522906473-11252-1-git-send-email-thuth@redhat.com>
References: <1522906473-11252-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 11:52:05 +0100
Message-ID: <CAFEAcA_n_QzDhbVCSknpNSR2zcM86oba8Ou+=NPC8y7AEH58Lg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-devel] [PATCH v2] hw/arm/integratorcp: Don't do things
 that could be fatal in the instance_init
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FBuenG/qlHBj

On 5 April 2018 at 06:34, Thomas Huth <thuth@redhat.com> wrote:
> An instance_init function must not fail - and might be called multiple ti=
mes,
> e.g. during device introspection with the 'device-list-properties' QMP
> command. Since the integratorcm device ignores this rule, QEMU currently
> aborts in this case (though it really should not):
>
> echo "{'execute':'qmp_capabilities'}"\
>      "{'execute':'device-list-properties',"\
>      "'arguments':{'typename':'integrator_core'}}" \
>      | arm-softmmu/qemu-system-arm -M integratorcp,accel=3Dqtest -qmp std=
io
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> RAMBlock "integrator.flash" already registered, abort!
> Aborted (core dumped)
>
> Move the problematic code to the realize() function instead to fix this
> problem.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
