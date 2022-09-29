Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1092988ocs;
        Thu, 29 Sep 2022 08:14:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ANYk7PspDiLJ1WV+2JkugtyXwqPizutNu3S1nt6/xrQmLGggQ7kyIeK4+LvFd9E5pg9x6
X-Received: by 2002:ac8:5a83:0:b0:35c:d945:6442 with SMTP id c3-20020ac85a83000000b0035cd9456442mr2763351qtc.57.1664464491796;
        Thu, 29 Sep 2022 08:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664464491; cv=none;
        d=google.com; s=arc-20160816;
        b=sXuo+rQwzLBRD6GBMIAbD/2Nskw73QQusuRkZ4pXMjfyKZ+RYK28YnBb2DVwcLwnxT
         JgxLTA/ZGvpD4Vvm89eWBgr4wtX6NbaC3tQUAz1ybPUvL8eP6v0fr2qvfFedBcH6UdJU
         WQr8tr99Ktqa28XAbpO3Hi8DfbuCqTbDINyNRyVzRmBHxoyShZjQckGZlyvLrGInOglo
         ToZkmfWcLGn1tE/xEfffXdCVJ+USMQ/wtDYFqUISZgfg8fcE7SAjg3yJts7D6uMYylDd
         uyxx/8MvB+NHZJU0nE4jI6NI8uo9XpxcKDcSYgqsDdk5YqnUb7ZWNEW9YZendwzUssCR
         TPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xUixK7iSOWY7PZIXZ+ZaYv5P682/FMi+bq784o9+HQ0=;
        b=wmU5CzImRbnijWdPcuIqghJDB2IW30LhBgdEKS+BIwtzjmbyltkShHzG1py7jKOEJU
         6GkrdKsdgGLd3fSOMohwVeXgN4eNJ/EGWKgA1om/ZE7Thwb5LlHdlTgONNimrRKItm/C
         yIF6+mIfZbI4gZZzg1Qc1bigWArgCd6NTJYZOnByaOvcdUPKWcSB/v/GRdfo+sJBA6Pb
         +mCbZ0h3RLoOAYB+iw2Gexfx+EZ5csoz9zWKM2DxQhqqFL+UUpv+OwGk9fjyshaLNYPT
         zpZFWrxq1YppfiEOYqh7A2GRQtTsXUu5aT80GnR4Ph4O0ZdOQzZPn5Bpuzrb97H90rdX
         YsMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UVfkRNNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85945000000b0035c12b79c9fsi1792259qtz.605.2022.09.29.08.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 08:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UVfkRNNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odvFT-0005nZ-9x
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 11:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odtPK-0004G9-Th
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 09:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odtPH-0001nG-Aw
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 09:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664457410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUixK7iSOWY7PZIXZ+ZaYv5P682/FMi+bq784o9+HQ0=;
 b=UVfkRNNfwr6INWngGwTJ0fn7+u5HdzWALhu1YFmoUZLStfmFWQ9/B6CS8B50JD7N8uLcvY
 tHKMx8Q3qc6LC/muMTKkLMoPcLBNB7ypv/rPPs1KP0Rk1q+2H2B2XYpQ+L0PunIBx1wGOE
 Kjo5v833rMfoVBxqhcUsM79/YV2Dcfo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-gT-ExDrkNjidYY-zoSdHPQ-1; Thu, 29 Sep 2022 09:16:49 -0400
X-MC-Unique: gT-ExDrkNjidYY-zoSdHPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so421584wmi.0
 for <qemu-arm@nongnu.org>; Thu, 29 Sep 2022 06:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xUixK7iSOWY7PZIXZ+ZaYv5P682/FMi+bq784o9+HQ0=;
 b=vDMdYOzUzqWoyPpV6anfvz3R9uuC6ckpCVm82iKHzesL6dN+jKQM4Isb3/eSXQMCWP
 0eUiWDiAd5rRQwnIuf5G5sHRSinnDCLUnQFhNpjzJ9BvmNO4d8J7v/MHapw5CP+ujtME
 KYEUgwW56UnLDhFiTTnqJEucvjW0x1SIYwt+Ea5r1U4h49n2E+lQpbbAJvER/LRqgFnf
 UwgoCKWMP7rGsTdVF/foreM6mOiC/Cn/3C0GOUpRC7IJlt3AaLneoFeurf5irOGOBNhE
 laVJ7CNsBlrIWY0n0ByqVxFvZm/frEr7AFzRz2Kgdvj5ktB8faJDjjKaQC7G49sZLjUO
 ZrYg==
X-Gm-Message-State: ACrzQf3M6Hnm5+xvk2gLA8iFvMFNCsVWEls1x1xYaVOrsRjVUYt/r+1R
 ntxcn+sLIWrgWBCLkIp9G9KraDLva+5BxOdZVrJ7tugHI0Z/OjgVNmHB6tW04Zgp4mPdOiR5Ofd
 sbQT161f3DGe4
X-Received: by 2002:a05:600c:4256:b0:3b4:7cfc:a626 with SMTP id
 r22-20020a05600c425600b003b47cfca626mr10890404wmm.187.1664457408237; 
 Thu, 29 Sep 2022 06:16:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4256:b0:3b4:7cfc:a626 with SMTP id
 r22-20020a05600c425600b003b47cfca626mr10890366wmm.187.1664457407910; 
 Thu, 29 Sep 2022 06:16:47 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056000128d00b0022afcc11f65sm6673957wrx.47.2022.09.29.06.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:16:47 -0700 (PDT)
Message-ID: <9535cb0b-8684-c189-6779-971882b9bd62@redhat.com>
Date: Thu, 29 Sep 2022 15:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
 <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
In-Reply-To: <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4o8I8s9Y3BGs

On 29/09/2022 15.01, Stefan Hajnoczi wrote:
> I still don't know what the failures from the Avocado tests are:
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466535
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466546
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466539
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466548
> https://gitlab.com/qemu-project/qemu/-/jobs/3100466537
> 
> There are lots of logs and I don't know what to look for.
> 
> Any ideas?

These are likely the ones I reported here:

https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00234.html

Should be fixed by Peter's patches here:

https://lore.kernel.org/qemu-devel/20220923123412.1214041-1-peter.maydell@linaro.org/T/

  HTH,
   Thomas

