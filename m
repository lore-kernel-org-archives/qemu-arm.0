Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp216538lfy;
        Fri, 14 Aug 2020 00:37:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLuO2cygewZNjqvVQk2IxS0CEZOWsrP/6kegHQpf5yc5IEab27z3iPOaG4dc7MQoGS49eM
X-Received: by 2002:a25:dc85:: with SMTP id y127mr1904303ybe.462.1597390664145;
        Fri, 14 Aug 2020 00:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597390664; cv=none;
        d=google.com; s=arc-20160816;
        b=dSMU7ICDPyWgQHsod9tS+lav0dclwgAv4hL2qYFu+2aDaQHujB06l42OYTZH0YcBC2
         2vxhsT+OwFLX/W1p+AaGXvVsqBi4AC5zqPqLgmLCx8Rx9Uwcc6h/FZy5aBKu/5iOtcD/
         lVIWqXDRpHZUGelgszqKbuaLHTOVPcsChR4Me8XJvgql6AifcKkBGXOZ3+bTzjpTXTug
         HmtbMmGU92Bz+Au1h6eP4j13MFqknLqOmj1XFYAheEA8TgM934njoKFITZ60PQpomuaM
         PGqYQlXuiQAS+iiKJ34HHEZOBY31xj2wZNdCYAaj2coEIlrMMItLo8ETpZpSg/JPmIIb
         T/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=ff8yorX7FNLt+LfNRH5luQzB00S3Pa/2+2gEHrz+wAQ=;
        b=e+klyhzxOCg9daKo2bMHTfA0p5EBtMLEpMErJi/4fEKzLNP6bIizEA6ncNcC57wYW2
         p1yx0/WT5ugDPRxGy2VFmby0plJ22HgcW+Ll2lHwmT05E0blAUTSa8p6ssumB6lLSsj0
         6AMA9W1e/L7RtSPBFa1CLP3BYiFOoYCaDg6XVUj3mcxHVNIIE25k4IsvyJTBH27wHVsj
         TWoXysNQPbWt+gSgR2Kek6yeCgRbQjEmRPmKXPnA2kxOPat4vSHPIiKxC8fxi4PbeqVr
         nnwRECKQgqprgErvwfmLHvTJ+lR1MHes/Ra0P7yTaacaMftF1m8mrZ4jzBEHIpedAK3/
         2y+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ioa+GvQN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i125si7797170ybg.95.2020.08.14.00.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 00:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ioa+GvQN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6UHX-0001Vz-HK
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 03:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k6UHP-0001Um-B5
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 03:37:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47550
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k6UHM-00075A-7W
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 03:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597390650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ff8yorX7FNLt+LfNRH5luQzB00S3Pa/2+2gEHrz+wAQ=;
 b=ioa+GvQNSVxkQuo93w5TEVlbIu5MFeH6SFNNUuOvQN0JtbdnBtX8L5/rJ7Nl4M4NO9piNt
 +lPzx89MvpxpmQKXUdMsw70leq9qB2FKOguDUqIqOwnT5LBIWEGHXyNhOaPFo+FebxkAqO
 WLnVkp5CuDx6lnYRQ2zkLuFdVzUduuI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-QsN675QSPGu7RPQxUtjC1A-1; Fri, 14 Aug 2020 03:37:29 -0400
X-MC-Unique: QsN675QSPGu7RPQxUtjC1A-1
Received: by mail-wm1-f72.google.com with SMTP id z1so2965008wmf.9
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 00:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ff8yorX7FNLt+LfNRH5luQzB00S3Pa/2+2gEHrz+wAQ=;
 b=PebaG+xvHiWSZ9/h9sP7FixLwWTbcQg4BVoBg8Ug12NwTVH+1gOxcuaAqDv9KEXklp
 Je9prUSwYSRHLy4E1IVPSk6uOILfZQpLlsxEhrATt/K3YIH+LEC/pz9FijLvszxJKz+Q
 k8sg/YUSqmZbwYF9ISP5mzQXjbN3ApW5mzHU63QTTC9LCJt9rLZFCx4d/2f6Bu9IfGlE
 6Ar5aieuuXNj2JUrpOpcM5i3lhPkSH52rAeJxMcQvE770x+XQxUfjMygQsb87Yigy27d
 s6RLWu/EAT+bkYAvT0aBZb4snC+siFjwPqD/cSk1OHfFcPwQV8fgRgZF7oVGf1FQoUfi
 hIBQ==
X-Gm-Message-State: AOAM532RHVOsAgc14Zi2BAwb4j6EPTMlCocH97OyincrdjnTTgxCtT5S
 YlaM7UmE3OJ6iw4D1iUHmo3popEr1ZKJuGpch3RLdZfLpB1xUkcty10OnLm7mjq1u5a79VUGmD+
 Bbk5DtOIUm3+L
X-Received: by 2002:adf:c983:: with SMTP id f3mr1488650wrh.348.1597390647913; 
 Fri, 14 Aug 2020 00:37:27 -0700 (PDT)
X-Received: by 2002:adf:c983:: with SMTP id f3mr1488627wrh.348.1597390647574; 
 Fri, 14 Aug 2020 00:37:27 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id v8sm13207759wmb.24.2020.08.14.00.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 00:37:26 -0700 (PDT)
Subject: Re: [PULL 3/3] configure: Allow to build tools without pixman
To: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
References: <20200724164258.24886-1-kraxel@redhat.com>
 <20200724164258.24886-4-kraxel@redhat.com>
 <f1fbe9b9-575e-b55f-8596-754a82654b5c@redhat.com>
 <2abe330a-37e2-fda6-d531-79fb5805afc7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <8ccd0dc6-05e7-1d6a-6b7a-e7366550d079@redhat.com>
Date: Fri, 14 Aug 2020 09:37:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2abe330a-37e2-fda6-d531-79fb5805afc7@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 03:37:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Rafael Kitover <rkitover@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tGFR+AlZFrsb

On 8/13/20 9:07 PM, Thomas Huth wrote:
> On 12/08/2020 18.26, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 7/24/20 6:42 PM, Gerd Hoffmann wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> If pixman is not installed, it is currently not possible to run:
>>>
>>>  .../configure  --disable-system --enable-tools
>>>
>>> Seems like there was a dependency from one of the required source
>>> files to pixman in the past, but since commit 1ac0206b2ae1ffaeec56
>>> ("qemu-timer.c: Trim list of included headers"), this dependency
>>> should be gone. Thus allow to compile the tools without pixman now.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> Message-id: 20200723141123.14765-1-thuth@redhat.com
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>> ---
>>>  configure | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/configure b/configure
>>> index 4bd80ed507aa..2acc4d1465f8 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -4065,7 +4065,7 @@ fi
>>>  ##########################################
>>>  # pixman support probe
>>>  
>>> -if test "$want_tools" = "no" && test "$softmmu" = "no"; then
>>> +if test "$softmmu" = "no"; then
>>>    pixman_cflags=
>>>    pixman_libs=
>>>  elif $pkg_config --atleast-version=0.21.8 pixman-1 > /dev/null 2>&1; then
>>>
>>
>> This commit broke my '--disable-system --disable-user --enable-tools' build:
>>
>> $ make vhost-user-gpu
> 
> Yes, there is already a patch on the list to fix this. Look for:
> "configure: Require pixman for vhost-user-gpu". I hope Gerd can pick it
> up for his next pull request.

Thanks! I'll test it. Too bad it misses the release :(

> 
>  Thomas
> 

