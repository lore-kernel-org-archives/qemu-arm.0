Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1820613wro;
        Sat, 27 Oct 2018 04:05:01 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eAzEn/+4YPX8LY6Y+5C4D937jsKgBR2FnPRSfu9CZ2o8yhuNdyT94ctUivULkJd4J8rMmV
X-Received: by 2002:a0c:a043:: with SMTP id b61mr6444348qva.57.1540638301064;
        Sat, 27 Oct 2018 04:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540638301; cv=none;
        d=google.com; s=arc-20160816;
        b=BHb6NVEdZKhutfYwvx3AlNPk+q9slPfs2FZMVRTH3AlnjtiqJywVReCOlJWFGKyQFu
         0BEtQTFFKDSI+xyD8fLX3raWUkqPm9fW34MSWF20XVWreI3y/um/ED4A8srX47iO2Fn5
         wMYaqK60QAMx188GX5vqyAVKjpKT+UhhujuguZiF79gzBd8wiAIwMZpuCZBUxweYATIj
         fwYlEqVin83J3cRrF1JuRe7iWpHYrgbbStD8pjFisA+D3tbpRMwx9H94rxJwV2jC1liJ
         gmQtr7uSSeobre+ffhmXTe+y+6v5twyPB8voFUuO10+C2pZbG6MMzW62m5sNECV08+w2
         HwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=M29wGlzVPbIji5V1TpW84JyrEwex+fMik723x3SwuIU=;
        b=MGvbssgIt2t/AkE9l6qsiGnWS2IlMExrEoCUSlta9OI5Smj/+H55FLPs/APRSS52d4
         vV2vi6C/OZlKRCcVMPxivq2i/1NUqjqYyZ+Ff4KUmYF6v0prhmNfHPpYuYDs1d6AOr+w
         rJJJGcV1IqddjpAWkyMFfpC+5ApKZ6HpZ5dU5QerZAt9SaacmGtNl2IUUsuU6lEFh5Nw
         uu7hK0RtOh3ABnhMRe6oPJDCN/IkjFO6qsuYUKod45WetZjvki6J+OB8l7bqK3v0IVpb
         YMd/vz/4lbLLWtkxzcKb3Spba9dx+1b7VO/m9ORDdaKcWXmtueI6PBY0kgQWBTFUOle0
         8+Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aE7uBB2T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k16-v6si2386788qtj.223.2018.10.27.04.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 04:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aE7uBB2T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGMOq-0001xh-Ko
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 07:05:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gGMON-0001xc-1d
	for qemu-devel@nongnu.org; Sat, 27 Oct 2018 07:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gGMOJ-00058p-Qu
	for qemu-devel@nongnu.org; Sat, 27 Oct 2018 07:04:30 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gGMOJ-00058Q-JL; Sat, 27 Oct 2018 07:04:27 -0400
Received: by mail-pf1-x442.google.com with SMTP id j23-v6so1773075pfi.4;
	Sat, 27 Oct 2018 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=M29wGlzVPbIji5V1TpW84JyrEwex+fMik723x3SwuIU=;
	b=aE7uBB2TFBa5Kwpt5TsAe3bijVBhW4SCvROnBUpU/QUL6Byk58DAbFjRl0YaI3fKYW
	t5TjX8hjgGDEmYICT+GJR78MGUfUedSfPeUHBPqE7InkgGDTFJwkGC06dw0XkUhQ+zkn
	xCSMu16vr1DRs1kygqjQho+hCVsWMrMXfmZzo9Bflkrxn5tjgKCZHY4C5+cMyKAFo4PA
	b1y4Xkkstz3WUr4k67EjLW+xCUfR6XK8UODf/VOQJwSPmcegF+rHSTuvqLtDEq8+9Eqc
	pm1ZgQpJzkPGLw4GCy7J9Kzh1kbG0hr3la9p1GbMc7ZZ4VJO6su1IDqkmVrLO5wWb4hF
	fe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M29wGlzVPbIji5V1TpW84JyrEwex+fMik723x3SwuIU=;
	b=TrvBfSrduADljqn2KE+CJQms6aP4T1ZMggFWsTMIWv1UcckJDOafUnnm7MXTmEc2k5
	rkyBIB3bbR8FZOy3mQe9hNdUyTc6NEl0/MWmJA34/32apyT/48hGDuQJ+svlP++NSTjU
	K0kRdoYHY6hHGXgHM6p4iHy6yxG5hsOSjNLdIhrInCNNhLIPwQskkL1Mq7R7M0XI+SrB
	YJua4hdn7/u7+Y4GTyjqnuNMdPgurhba9/wVyUWr4u/WsRKroBUQGXnQsohF8doY0BpF
	eosO0pFrtUYvHqczjNt2ednkBXcwN27qOIfmWYh/bQU9JfSAzK1Tca/sbKE2c77m3fTX
	7nFw==
X-Gm-Message-State: AGRZ1gJaUtoU8D1Ik4gvWlSR7OFF89BbSUhX3OLMfqMVyga0HeQ7p8t/
	skKTZZHPodqQtVEE5abTVas=
X-Received: by 2002:a62:6907:: with SMTP id
	e7-v6mr7414735pfc.238.1540638265721; 
	Sat, 27 Oct 2018 04:04:25 -0700 (PDT)
Received: from server.roeck-us.net
	(99-61-165-247.lightspeed.sntcca.sbcglobal.net. [99.61.165.247])
	by smtp.gmail.com with ESMTPSA id
	m10-v6sm27386296pfg.180.2018.10.27.04.04.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Oct 2018 04:04:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
Date: Sat, 27 Oct 2018 04:04:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH 0/2] Deprecate the "collie" machine and
 Strongarm devices
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UwhsYyIEmKsc

On 10/26/18 3:12 AM, Peter Maydell wrote:
> On 26 October 2018 at 11:06, Thomas Huth <thuth@redhat.com> wrote:
>> These files lack an entry in the MAINTAINERS file, and according to
>> the initial commits, the board and devices are incomplete. Since there
>> have hardly been any commits in the past to really improve them, we
>> should consider to mark them as deprecated now.
>>
>> Thomas Huth (2):
>>    hw/arm: Deprecate the "collie" board
>>    arm: Deprecate the Strongarm sa1100 and sa1110 processors
> 
> Hi Guenter; there's a proposal here to deprecate (and eventually
> remove) the 'collie' board (strongarm) from QEMU. Is that one of
> the ones you're currently using in your automated testing of Linux
> kernels on QEMU?
> 

Yes. I can run the test with older versions of qemu, so it is ok for me
if it is removed (as long as that removal is not backported).

Guenter

