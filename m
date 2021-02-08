Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1502727lfc;
        Mon, 8 Feb 2021 13:12:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz96XjHlo0FKaWaF+dLUaFxRcBpjdIqg35RIFbzjO+8yTbHye2cvVlukikPsZSg2SRteHpS
X-Received: by 2002:a25:d94:: with SMTP id 142mr25774639ybn.424.1612818776621;
        Mon, 08 Feb 2021 13:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612818776; cv=none;
        d=google.com; s=arc-20160816;
        b=GQWDjPUZMmvJ07rqVz8zgMHBsK/Q/Jm4GAMvD7/l0Z++YQHvxu4N4w/u/MdATgkuiL
         Kr5X68FUDgIqSZ7jdP7Oyan53V9eQMJ3RMOxWjVVNrM1xkRLTZrE7eQxG3S/4HXEW95b
         EX1XQNfuXhFZwgE0H5yENfW6gu7XTFqJlgXjJOkt7+BZMteFxNyk2AhxL9suJzOuQJPz
         Nb4F8q8FW9cy0NCUyuOrDV9wmEbGJBFnLAPdplpB8Ro8IIkm/33ZN7eDv8fTLwW4acNW
         zoaL5eKkHCuiXVW7oAoeoZ22YaURwp+CVcWhdbJY19a+z0HZDU6MeQEWDg8pSkrWS5X4
         aOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dVZM1CEKI0Yr27syAVOhG4nel2XpNRY8DCyJDIXFwBM=;
        b=t399SNnii732DXF5lmn2PSqwO/5fFJQ6enAEerj+ftnSImG0c8+cUwSA0XZIoRnPmx
         6j9znn8Jzic/Jdy7631XRPQDjd+V5EpdrbU9uDIWY+ZKATmUWCoS4SPVYKIq1BFGIvk3
         S7Au5Mb8VOukkNzCYsCd/vFO0UiXge2XkrUE/nZ3E2Ahx945C8bI96ljs22E6fPENHLb
         JNsYJQmWt6zWRTWmRXdON5LoMV8kUHb03bHPru96TOw3yzxC5fKo3ZYrWwEDQdUR7y6C
         ERpFlzzbmbLkC7BKhn+Dw5/EZ1iyHZ09j+uj4boTLEtvnf5hagwVVqgATUiyIgzIeZ9J
         UXYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZaGxCU2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a191si22416882ybg.312.2021.02.08.13.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 13:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZaGxCU2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Dq3-0008Kq-VK
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 16:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9AOt-0005bZ-NO
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 12:32:39 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9AOr-0003di-DO
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 12:32:39 -0500
Received: by mail-pj1-x1035.google.com with SMTP id fa16so8228840pjb.1
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dVZM1CEKI0Yr27syAVOhG4nel2XpNRY8DCyJDIXFwBM=;
 b=ZaGxCU2Q3Rncg7XMYmRZUXgWdIXfjqQsJ8A7A2dcddxtabwzhQl8fiGxHr2+ibu0LE
 95v3sGLOeL9qTO2CoROEp4RZWksN+Q9+nc9uUPE6i4lpby57hbhVsn6PCr8nu/XHlulD
 htvQqJxrZWrCPsxmR3T4jkOO62l++oVOOtrMQ8aECYq5t8O2PyLwTc4A5LOI1nktyNR3
 +1kbJ9UpWr3hyNo3z1fuDoeSZJsb7PkKFWCQH/LpQmaTZtJ5s77CRNjdsfVFmgZsBccF
 35oIkxwLRo07AcRRSopGET3MMlxhJDg9blnLj1u0gWYBh/o+R1G5HzUr6V2PctKOSiMk
 SCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVZM1CEKI0Yr27syAVOhG4nel2XpNRY8DCyJDIXFwBM=;
 b=YL4nwI2DtJoSK+qp0gchiuXCnF+gMCz9yyDIXRSWNzQZTgrx2ScOyhzi57h34RcDbK
 mvLvKlhb8I0ZUDmIEDbKYbPu4YGx22aRiNhZE0dWMRtO+eYDdgDLmnwXhwT0ecoaMcxZ
 hzY2LS/b12fLJPSw92mcEz7CPLlkdF5IguTmdTrNEHvYWtwg9VHzuQKUNamdXvfHWp+r
 ++ae4HWw4rerRht2OGOzeCHFUHdQcvNKjEyTGQYJOcJGqy1sn+ii+QnUe3TaL1Te9cZZ
 NlTKEiyH2X00OjLF/67l5yKpRo7UuLiKYhMTVvXsuU93B42pbTg57YNbdISbr6nqYBPc
 hDTQ==
X-Gm-Message-State: AOAM533zgLg5PuHmvNErgyFLzckO1uWzv2yK/rGPVIRYVs5SfHfe2ijX
 L1ikqLIhjVzprv4Tp2t+B0UO+dUkmyLBbw==
X-Received: by 2002:a17:90a:bf10:: with SMTP id
 c16mr17700023pjs.101.1612805553771; 
 Mon, 08 Feb 2021 09:32:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 ep14sm2955014pjb.53.2021.02.08.09.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:32:32 -0800 (PST)
Subject: Re: [PATCH v5 19/31] linux-user: Handle tags in lock_user/unlock_user
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-20-richard.henderson@linaro.org>
 <CAFEAcA9e7XhcLma7tz6hfn6fbukZXbKt1yw-DEemV6vQ=SxQow@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c1b4785-4c19-5b71-fa8a-68a71d8309aa@linaro.org>
Date: Mon, 8 Feb 2021 09:32:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9e7XhcLma7tz6hfn6fbukZXbKt1yw-DEemV6vQ=SxQow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D5I2Y2j1H6KU

On 2/8/21 5:57 AM, Peter Maydell wrote:
>>  void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
....
>> -    if (len > 0) {
>> -        memcpy(g2h_untagged(guest_addr), host_ptr, len);
>> +    if (len != 0) {
>> +        memcpy(host_ptr_conv, host_ptr, len);
>>      }
> 
> Why the change from checking >0 to checking !=0 ? I'd rather not
> have to go through and audit all the callsites to confirm none
> of them pass a "length-or-negative-errno" value here...

The comparison change should have happened with the type change to unsigned in
the previous patch.


r~
