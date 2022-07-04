Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3044182lft;
        Mon, 4 Jul 2022 01:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCNdc9G2imXPQNPIK2b04x1mCIdjpo9nlW+H9wtLrhnvArYC9CBh0e9EP2ZXCFEgWvVwFx
X-Received: by 2002:a25:8891:0:b0:669:b561:8c87 with SMTP id d17-20020a258891000000b00669b5618c87mr29950187ybl.29.1656923009035;
        Mon, 04 Jul 2022 01:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656923009; cv=none;
        d=google.com; s=arc-20160816;
        b=UoEfoKxCEommL4GySo/+5SjSM0k9Ul4/IGqm/vUjYaiHDhOAWLnv5bn+6V4w4VQmKV
         ZjQr8xaMrQcC/oq8MFgejrk9kZPYgjlKkj0OIA3PTUB6QNX/xEZCZqouqVy8NSi6Wbs4
         SnZxZ3rr0ZGRPLu0hocV4HkyiNs9APnwD3Sl+0Gnniv6QZfskAXt5XxR2ffzFnBjvPsB
         53Tv+n4zMugtVfuf9T0WxnECh56/ZXU5uHFx+jCWGBKXcx/iZJq2pJnIdKuvrCKz42dj
         dv0N5HkKh8OPMpEjCvnUCeCP2Df9w0eWtioggpUHLI+KA8qKpXjUftXPyV4LKnMUX48k
         451Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jd90bjIwXtBxKbpLUSO00FGYBYD+Sif4KE7tDDTji3c=;
        b=RyI1EfWf/VNW/+FpikmbXPLRqnHyI4oM2FjMVF5abKFloI+p+X4iJhKCjIrdCux7bH
         2QtF7i3/3kHA99RcOrJM98jIoqlkDIp6lZ+LJmi1vCbnCRl8CmquUCUemQzsjL/7wSZU
         FaGIwQW9FVcxt0+S0VjlXmiWDFkst2enkATmsOTDdR4nRtrObanNPMX6/OAgxdDzpGup
         DcFZRlf0v2N8Dq+fxOgP8WDGqqUffpO9GePMUk6qAfZ4QJ4Z51IUI7hRB8XQ5AWLeC1z
         rLmHlDLBBxSIap850mv7l3xEum/v8/2rIJnt1p4dUZ0K5V+Bpje7idL7CEu9NHA+sAsW
         8EXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SYv6bUbR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f75-20020a25384e000000b0066e31f5b2c9si6468362yba.342.2022.07.04.01.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 01:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SYv6bUbR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8HMe-0002AV-EX
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 04:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8HMM-00028C-2s
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8HMJ-0002ok-C3
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656922986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jd90bjIwXtBxKbpLUSO00FGYBYD+Sif4KE7tDDTji3c=;
 b=SYv6bUbRxHui7QQcrMpF47cnd8srXOcls9UWilJZQOM7bDa6AU5fSR4DaT76p+1y2mqs6P
 4ILuuYzV7mtRoHLr6fq/d1fkfDtKanUa40eEOlK7r+/FSC55MbTSeb3YNXfyFMIlamyQgi
 1z8X1HZ9Z91vTlyv98oDr0nWp9ksVbE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-uZ6_CPwMPlGTBTl8cAKsSA-1; Mon, 04 Jul 2022 04:23:05 -0400
X-MC-Unique: uZ6_CPwMPlGTBTl8cAKsSA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so4976940wms.6
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 01:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jd90bjIwXtBxKbpLUSO00FGYBYD+Sif4KE7tDDTji3c=;
 b=YkNzs8Rpsxac6/gutwfwF8wVACPxbTJbrRNkmVvo7x0cAF7wMtGQp6BO1mVqGceXoN
 XspbnbWR0Tclf7B/+vX7oWLN+fS98zqj/hP/Vv8wZdDV5QOA2Rdk3mr7SQ931zOugarW
 CN+/Feel0Jd1rkJkRjOqoP1ptUcH6QgvKpRA2AVfvLIc6WxUME5ezQ4Z2uhPPxAlcbOI
 aUc0zUAq76WV7w1ig03l2xTfiiGbwZVecGXuRt0nJox1pJ07hMa5HyWwqNdOZtNsj9dl
 iOk++aNqopcsujNY16aKwsh9AYpxRIUq3JPFOGv2aevwM3Rym0/P2EPGCJdH2o+5hYJI
 PTGA==
X-Gm-Message-State: AJIora+0UFU+EbZre0RRyyEkubXSFZPIESuFXp+kvUX12+vUc/Oy0RNG
 d4OyLBC2JhEgn54VxKAraNb5AU/m9DVDWvbeMYUR5uzm1rPy/WKb3rvM1KjTWyC2uRGOAaYbILq
 fXbhO9EzXV1nc
X-Received: by 2002:adf:f20a:0:b0:21d:6661:41e9 with SMTP id
 p10-20020adff20a000000b0021d666141e9mr6237452wro.604.1656922984704; 
 Mon, 04 Jul 2022 01:23:04 -0700 (PDT)
X-Received: by 2002:adf:f20a:0:b0:21d:6661:41e9 with SMTP id
 p10-20020adff20a000000b0021d666141e9mr6237411wro.604.1656922984368; 
 Mon, 04 Jul 2022 01:23:04 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-243.web.vodafone.de.
 [109.43.178.243]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b0039ee391a024sm14508862wms.14.2022.07.04.01.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:23:03 -0700 (PDT)
Message-ID: <2358e820-654b-fcf4-1da5-03eccde5efd0@redhat.com>
Date: Mon, 4 Jul 2022 10:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3qLXjbvEzgm

On 04/07/2022 09.26, Stefan Hajnoczi wrote:
> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The edk2 sources are bigger than the sources of QEMU - so they double the
>> size of our release tarballs if we include them. Fortunately, edk2 has a
>> permissive license, so there is no need for us to do this as long as we
>> continue to distribute the edk2 license information in our release tarball.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   scripts/make-release | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/scripts/make-release b/scripts/make-release
>> index 05b14ecc95..f79ed7a2ae 100755
>> --- a/scripts/make-release
>> +++ b/scripts/make-release
>> @@ -20,19 +20,34 @@ git checkout "v${version}"
>>   git submodule update --init
>>   (cd roms/seabios && git describe --tags --long --dirty > .version)
>>   (cd roms/skiboot && ./make_version.sh > .version)
>> -# Fetch edk2 submodule's submodules, since it won't have access to them via
>> -# the tarball later.
>> +
>> +# Fetch edk2 submodule's submodules to get their license information.
>> +# Edk2 is distributed under permissive licenses, so we don't have to
>> +# include the full source tree here (which is bigger than QEMU's sources)
>> +# as long as we provide the license information in the tarball.
>>   #
>>   # A more uniform way to handle this sort of situation would be nice, but we
>>   # don't necessarily have much control over how a submodule handles its
>>   # submodule dependencies, so we continue to handle these on a case-by-case
>>   # basis for now.
>> -(cd roms/edk2 && \
>> -    git submodule update --init -- \
>> +cd roms/edk2
>> +git submodule update --init --depth 1 -- \
>>           ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
>>           BaseTools/Source/C/BrotliCompress/brotli \
>> -        CryptoPkg/Library/OpensslLib/openssl \
>> -        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
>> +        CryptoPkg/Library/OpensslLib/openssl
>> +mv ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
>> +   License-softfloat.txt
>> +mv BaseTools/Source/C/BrotliCompress/brotli/LICENSE License-brotli.txt
>> +mv CryptoPkg/Library/OpensslLib/openssl/LICENSE License-openssl.txt
>> +edk2rev=$(git rev-parse --short=12 HEAD)
>> +rm -r $(ls | grep -v License) .[a-z]*
>> +cat > sources.txt <<EOF
>> +The edk2 sources can be downloaded from:
>> +
>> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
> 
> Please use QEMU's edk2 mirror:
> https://gitlab.com/qemu-project/edk2
> 
> QEMU mirrors all dependencies so that even if upstream projects go
> offline we can still rebuild all of QEMU from source.

Sure, that makes sense, indeed. I'll wait a little bit longer for other 
comments, then I'll respin the series with the URLs updated (also in the 
second patch).

  Thomas

