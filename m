Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp312096lfb;
        Fri, 15 May 2020 02:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR2MLm71j2rqxNbtUC4cWRJ9dcCtnuo1hkG+/v3ud82likhZHXlJPWrstBktzAnaawMTwh
X-Received: by 2002:ac8:1c3d:: with SMTP id a58mr2461895qtk.52.1589533558847;
        Fri, 15 May 2020 02:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589533558; cv=none;
        d=google.com; s=arc-20160816;
        b=EEQKWOgy+jYYG+vRTrl6YMDoefGRKSU1dOj5QiYkQGwgL6fWNqPNiz9mHcq3blE4gF
         h/W7xq5ix+rtxuY9bRk4Wyg50I38kot7rdIFwhwD09s7ab01DsgYjRA8IjK46ESC8BvF
         pgP3pKRVbO9Kcah0xgh9FMfHQ5vtcJH0tXsRCYq2M8EnAgkEnjF4jcO9+3VrF8Ltq5W9
         0HgmqzctRLo+1aH8njblicEtWcVf320gBdAvN4lmZI96b9Qeho6nN/MUyr4f7ynRHxrE
         oE8pqsnqYcrmhJ8EGsvXAGjFiNcrUK0CtLcLArD5MiUFapLtOPSowkzkmGRVuiGAQUFn
         nI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vLs7D00WQoY84ERVb/0Cm7IeiJVHNOoAofknN04FgX8=;
        b=OvRIqtFtd/NaXaEUrOeCVzkIdb1Fid5EUWi3xv5JnYpN8vzaGn4MEyDUYfAlUNzfUw
         wsRW+/XYLhlgH2jPNzWiKDo6dsdr2tshCbnxhvMGIN5I2VaeTVEbGEL2J7Yi/V4pzs+O
         OZfocaA/M4jba1W/sZEoNhKu6qetCmodQbMoRp9LdMCJgjJS3aciziIirBiw/I5VZZgt
         uJeHNPy4Lb53QCHSBp1dFbQbsxas9G6iEvUQ3YqyMaBUdHNz97eki11Cew7OoYbSanrW
         pMz5n0GO1xzZWBcJtz6D5/l09sFJSqyx8YoKKMz6SeOyjipyEQ49dShrWQUUKSuRsDHy
         9OsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eA6SrZY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cl9si643428qvb.192.2020.05.15.02.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 02:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eA6SrZY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZWI2-00076i-31
	for alex.bennee@linaro.org; Fri, 15 May 2020 05:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWHr-00074K-9O
 for qemu-arm@nongnu.org; Fri, 15 May 2020 05:05:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40665
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWHq-0002A7-JV
 for qemu-arm@nongnu.org; Fri, 15 May 2020 05:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589533545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLs7D00WQoY84ERVb/0Cm7IeiJVHNOoAofknN04FgX8=;
 b=eA6SrZY9gYjZj9/OfOG3VumuGJbF7iVucd42+NZxXpsCemFTW3oCU0H52iUYnZD+iqWPV4
 y+Mau8jwhMrK/5zqw2b/tf6NxFeQAhtTbgD2TO+u3c5nCkggHs/mBJ6vO6V5D1Jai9fDbm
 6ClLQemUGn4EowyUf0c01OuqN9pXDus=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-bMarozbMO9WjSgOhOWerjw-1; Fri, 15 May 2020 05:05:41 -0400
X-MC-Unique: bMarozbMO9WjSgOhOWerjw-1
Received: by mail-wm1-f69.google.com with SMTP id g10so876994wme.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 02:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vLs7D00WQoY84ERVb/0Cm7IeiJVHNOoAofknN04FgX8=;
 b=id4BYWgdNQezwEGS2jWFcKLRLy1ZZmlAp+jIIayCPohf26tbbn58rHR3L2Fe2MFnMl
 7Tps5LF2vg0kIyO3nZXsAjnR1JRC42ObayEXJPncoIi1jgWpEXVWu3yp9CTRkoUcMq2A
 zGDLfy2swrpBAP4qVuC3+9k23Nq2BTEIeCFq6vHW16UxaOcipfXrwC/Nu4EAoOH0OAyB
 3ZlHvDs9IC6pkxpazleO8UTzfuqk+jdIGl6f4KIzB7lD9lXC2aROjNgLB5Z8p06giQxa
 KUVYVc4v2Xy1CUB2uvmW6txf6GPBSKOnY2xiDUjN6ZvwcZwCIXYn5hLUnfQ0aZJL7Pjs
 WpGA==
X-Gm-Message-State: AOAM5318eMVMWkLx/+9VCmuvJ1xouH82hRc8Q4mKNR3RWf1ObScsEWJ7
 y61f5Sv9aBQQJKiLhodqea8rDw93X4005/YbCjiFOoPzVb5A20fry2m9ktDHSfLrAaU8dyoqCDq
 f5mSOtdC9weC+
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr3160061wrn.34.1589533540130; 
 Fri, 15 May 2020 02:05:40 -0700 (PDT)
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr3160045wrn.34.1589533539926; 
 Fri, 15 May 2020 02:05:39 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q5sm2828326wra.36.2020.05.15.02.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 02:05:39 -0700 (PDT)
Subject: Re: [PATCH 0/5] docs/system: Document some arm board models
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <CAFEAcA_p1x6S10yswHgOkMd=KrxcTGh9TD47+k1LRKM0xy5x+Q@mail.gmail.com>
 <567755c6-3bb1-b16e-af26-431dec4616ba@redhat.com>
 <CAFEAcA-67uGcwSu7mJ+w26xYqpTm4C0t3Yrr8gWCsA1VtHeaLg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <49f4fc6f-329b-9afc-92db-c59dd1ce67ea@redhat.com>
Date: Fri, 15 May 2020 11:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-67uGcwSu7mJ+w26xYqpTm4C0t3Yrr8gWCsA1VtHeaLg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hLwzbhgUf/sU

On 5/15/20 10:51 AM, Peter Maydell wrote:
> On Fri, 15 May 2020 at 09:03, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> However I'd rather see the board documentation in the source code, and
>> extract it when building. It'd be harder to miss updating the
>> documentation when modifying the code.
> 
> I definitely agree in principle; but for the moment at least
> we can have some documentation...

Yes, thank you very much for this effort!

> 
>> Another way (rather than using external program to extract from source
>> code) can be to add a method/field to MachineClass, and once a build is
>> finished, we could run 'qemu-system-arch -M gendoc' which go thru all
>> machines and display the documentation properly formatted.
> 
> The documentation needs to include all machines, not just
> the ones that got compiled into a particular binary, so
> I'm not sure this will work. I also would prefer it if
> we avoided having the docs build depend on doing a full
> binary build -- places like readthedocs will just do a docs
> build by invoking Sphinx directly, and we'd like the machine
> docs to be visible there.

Sphinx consumes docs/system/$arch/$machine.rst files committed to the 
repository, and we don't need to build various qemu-system-arch to 
generate the documentation.

If you work on a particular board, you might end up only building its 
corresponding qemu-system-ARCH. Maybe we can add an extra-pass once a 
binary is linked, and re-generate the docs/system/ARCH/$machine.rst 
files, so if you modified a board and its documentation placeholder in 
the code, when commiting your code change, you also have to commit the 
rst changes.

Just brainstorming an idea for now ;)

> 
> thanks
> -- PMM
> 

