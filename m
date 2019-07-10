Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4487256wrb;
        Tue, 9 Jul 2019 22:18:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpuI7ivJamjODfhwhJ4803axobmgdtW7HgD2FyqWecSLylXu2iwJg+nRQAI4Ip7UWArv5C
X-Received: by 2002:a50:89a6:: with SMTP id g35mr30147115edg.145.1562735893820;
        Tue, 09 Jul 2019 22:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562735893; cv=none;
        d=google.com; s=arc-20160816;
        b=kxJ/mNq4DEE2NEAbI+8dzI3l8OUaTxmdRFfRdF/8Fb4NbIE98oiCzYd4XaYZc8p6s+
         NAH7AmJQ1ZAyTIVebW4+WO96aHnMvQdVMdqJTMT9ITQNjAxIL/aY8r0uOqCv7D6t3oyQ
         y3S8WJGBiAV+9CKnzZQLGqgEjBXwsBrGZFnKb6qTudMeyxCNbG0Y6IygS7OzKLMJNSRi
         aZ5vSEnaYLS48y5RQYRBW9M5qUJIdMjuGa+gTqv+YPI0usuT63w/ZleEPF2lhNoQ6Iw5
         MdqiWGSAlJfmMAd0mctKSmWlk2cffYyAzJ6QXj7Vt079dViu4fGZ6YnWA/hR5JchmWI4
         yNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=jvXgVgHwU5VN3XdGoyLLLJeBT/9qkkJah9Go9SvGdt8=;
        b=eSpIY+irS04JKQNLMdSGE6WtF6mt5+6PX3fVr4ilA1ltTteY89V7nB6K2/BlgisRk5
         Q1rmOcCQlb3i2aS+ghC7fM60onYQrfpwRT1t0KsHYuYVZCFP082fKuBwQg2HYmWl3gve
         hXXFwSfIhrZT907sMq7ikTRZ9ofdj/k9AbVRYVPNsQ+AFsGCb00dJdoqQxeKa4avt9ba
         9lR0kpJcYyS7CK+QwQSkOA+1lMBl3P5iWq1/ULCeroz23lZwF25IS/7nyyLmCl00ai+A
         bbQc1PnFgcyoYb0UblW4gx+SbIFDrugp1MuY8wsCDcXEwWd+70PLUBS7T+t7eHUdXmwk
         WIMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f28si724089edb.80.2019.07.09.22.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 22:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hl4zc-0005h6-VI
	for alex.bennee@linaro.org; Wed, 10 Jul 2019 01:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46819)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hl4yi-0005gv-Cs
 for qemu-arm@nongnu.org; Wed, 10 Jul 2019 01:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hl4yg-0007se-68
 for qemu-arm@nongnu.org; Wed, 10 Jul 2019 01:17:15 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hl4yd-0007h0-BZ
 for qemu-arm@nongnu.org; Wed, 10 Jul 2019 01:17:11 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so3870791wmd.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2019 22:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvXgVgHwU5VN3XdGoyLLLJeBT/9qkkJah9Go9SvGdt8=;
 b=V4MsqrBaSw4rIB1kKZoR0abM7lYwP7ByDxLALZnZbCis0ZmGWSmmG3dO9oEC1t7viV
 M+c46vpMSEuGez7xGY99HyY7qQCiMbPn60K2KGJu8E8F8Uc/WS5av/6+6lC8e9v7CNwq
 s/tXeAj4YpRXP2haQdKy+oVBuJv/ePqLjqtTSx7ypuJdf9FIYba7SxMjdu82v7PIr09R
 S60oTYjUEGgLGl8xw6Ae3ogYOiJNGYiDhRSAujHRKmWkf0ywRN+tebA6dnm5Dt8igrwT
 P52jjNAkdjHNbxJHF5EP9vnHzY/cROc9noGhg7QZsH2f3+lVCwyGMYpZRl+y+asbEXtQ
 na4g==
X-Gm-Message-State: APjAAAWvoa2k0A0RGgq0DjKDfE2UlWRpyV5Rvme5dE9bMr9ss1pOAFaQ
 3fDb60w/jjUf9S6wLrA10mEzYQ==
X-Received: by 2002:a1c:c005:: with SMTP id q5mr3097838wmf.59.1562735823791;
 Tue, 09 Jul 2019 22:17:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:19db:ad53:90ea:9423?
 ([2001:b07:6468:f312:19db:ad53:90ea:9423])
 by smtp.gmail.com with ESMTPSA id s10sm1000053wmf.8.2019.07.09.22.17.02
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 22:17:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190709143912.28905-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dc709a38-b858-8611-986e-52be36696609@redhat.com>
Date: Wed, 10 Jul 2019 07:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709143912.28905-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH for-4.1] pl031: Correctly migrate state when
 using -rtc clock=host
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
Cc: Russell King <rmk@armlinux.org.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d+YE9VW2msf6

On 09/07/19 16:39, Peter Maydell wrote:
> Reported-by: Russell King <rmk@armlinux.org.uk>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think this is correct, and it makes the "rtc clock should
> not stay still across a save/reload" work, but I feel like
> there might be some subtlety I've missed here. Review
> definitely needed...

Yes, this looks good.

Paolo
