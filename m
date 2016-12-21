Received: by 10.25.205.13 with SMTP id d13csp3300394lfg;
        Wed, 21 Dec 2016 09:47:18 -0800 (PST)
X-Received: by 10.55.134.1 with SMTP id i1mr5896401qkd.219.1482342438359;
        Wed, 21 Dec 2016 09:47:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14si15540432qtc.42.2016.12.21.09.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Dec 2016 09:47:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJkyx-00027v-UA
	for alex.bennee@linaro.org; Wed, 21 Dec 2016 12:47:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cJkyq-0001yW-Tl
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 12:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cJkyn-0001q4-0H
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 12:47:08 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cJkym-0001pf-Q9; Wed, 21 Dec 2016 12:47:04 -0500
Received: by mail-wm0-x241.google.com with SMTP id g23so31857252wme.1;
	Wed, 21 Dec 2016 09:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=W9Ty5fIwaDxxx1R0p6pyAtasQf9szxpfAy2T26zvK3o=;
	b=ZIUrzEIz1DsSK9ar41mthudubcuAl/QCoAcaVDlmhyKTdVgpvr3K5PS1li2E1/CHcZ
	Wf+HR/XgVWpbXGN2HPgqTUODXp4OeQhzFWtjU++sD2ijnPisegM37Xu04zUiMFCIX4AV
	OAJW13yWBSOPWXN6ExvjEBEfDtCZBCN5/9b4cgreyGuRUvYdqpaQOgTaNrlsi7hgKofo
	yeEqSIUurqX6y89KzbBGH5TDkKj8aMnI1IV7syhuZBThv8AIb6KwtaIRFase2T85fS2m
	BHXzRcrOSvsBaQamrf5XrgCAaXUtnb+QEoBaLlixXvOPeVo0kfgBVgLP7yDMVT5A+/0j
	8WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=W9Ty5fIwaDxxx1R0p6pyAtasQf9szxpfAy2T26zvK3o=;
	b=LSrLagKD80VqcQzrxyZz69/+Pp9mlfsohtH+s8O9nQydI1EGmn7dCjdJ1k/Ppj7Qvs
	ozq3QQeg2Nhqv8EIoDHp3OMrf3b7Z7VN+cAsjw+Te6P+6uwBLCFo507lEcJ9YI9tXXEe
	mY3xsB8ZQ5Xg7dkTMrQAXVezlcxGokpB4rEPTb+fHl67cxLaG0ZwWnYncIjSdCwIdRCn
	XxJbiJ4CyR9YPcr4Wyo4tkGK9hXfWiq/+fPsGrAyc9IOFwEbQnKbQu5IxKkK1RqcsFO5
	uiYt6pfrEyBXe6gBENlHNud7rd6aBVuNtRt31I43wj9CVzKBBrmzJ787CDCUoqpO8ywn
	j1GA==
X-Gm-Message-State: AIkVDXKmRxCBcYFRd2oI8+KAEHpjbFez8fgCmu9CUSH2o7SunjZo18RP91L0EkYVPjA/Lw==
X-Received: by 10.28.12.84 with SMTP id 81mr6144204wmm.51.1482342423629;
	Wed, 21 Dec 2016 09:47:03 -0800 (PST)
Received: from [192.168.10.165] (94-39-147-242.adsl-ull.clienti.tiscali.it.
	[94.39.147.242]) by smtp.googlemail.com with ESMTPSA id
	ua15sm31645939wjb.1.2016.12.21.09.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Dec 2016 09:47:02 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20161201170624.26496-1-lersek@redhat.com>
	<148227487620.73.10055858460424473693@790289a7ca88>
	<20161221152226.GH3808@thinpad.lan.raisama.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <70b42a58-381d-7011-7eef-2120af178f91@redhat.com>
Date: Wed, 21 Dec 2016 18:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161221152226.GH3808@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] checkpatch.pl false positive (was Re: [PATCH v4 0/7]
 q35: add negotiable broadcast SMI)
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
Cc: peter.maydell@linaro.org, famz@redhat.com, mst@redhat.com, somlo@cmu.edu,
	Markus Armbruster <armbru@redhat.com>, michael@walle.cc,
	qemu-arm@nongnu.org, kraxel@redhat.com, zhaoshenglong@huawei.com,
	imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zriPEJCTmUQ1



On 21/12/2016 16:22, Eduardo Habkost wrote:
> On Tue, Dec 20, 2016 at 03:01:17PM -0800, no-reply@patchew.org wrote:
> [...]
>> Checking PATCH 4/7: hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cfg file slots...
>> ERROR: Macros with multiple statements should be enclosed in a do - while loop
>> #126: FILE: include/hw/compat.h:4:
>> +#define HW_COMPAT_2_8 \
>> +    {\
>> +        .driver   = "fw_cfg_mem",\
>> +        .property = "file_slots",\
>> +        .value    = stringify(0x10),\
>> +    },{\
>> +        .driver   = "fw_cfg_io",\
>> +        .property = "file_slots",\
>> +        .value    = stringify(0x10),\
>> +    },
>>
>> total: 1 errors, 0 warnings, 119 lines checked
>>
>> Your patch has style problems, please review.  If any of these errors
>> are false positives report them to the maintainer, see
>> CHECKPATCH in MAINTAINERS.
> 
> It is a false positive, but how exactly can we fix it? Should it
> become a warning instead of an error?

It should already be treated as an exception:

                        my $exceptions = qr{
                                $Declare|
                                module_param_named|
                                MODULE_PARAM_DESC|
                                DECLARE_PER_CPU|
                                DEFINE_PER_CPU|
                                __typeof__\(|
                                union|
                                struct|
                                \.$Ident\s*=\s*|       # <---- see here
                                ^\"|\"$
                        }x;
                        #print "REST<$rest> dstat<$dstat> ctx<$ctx>\n";
                        if ($rest ne '' && $rest ne ',') {
                                if ($rest !~ /while\s*\(/ &&
                                    $dstat !~ /$exceptions/)
                                {
                                        ERROR("Macros with multiple statements should be enclosed in a do - while loop\n" . "$here\n$ctx\n");
                                }


so I guess the first step is debugging it. :)

Paolo
