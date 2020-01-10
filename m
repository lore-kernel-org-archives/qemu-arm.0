Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp542825lff;
        Fri, 10 Jan 2020 03:09:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqywKQ/FeacoPsi/WenUCQiaz+BAlXl9qfQZt49Y5Z+XeMrlyFJr7vP3Be3BvAJ4QlNzAlq0
X-Received: by 2002:ad4:46ce:: with SMTP id g14mr2174282qvw.67.1578654559302;
        Fri, 10 Jan 2020 03:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578654559; cv=none;
        d=google.com; s=arc-20160816;
        b=gbTTJXcPrz9oGk2ke3YOwBbNX9F4inCzGSq0EzLGExQwY1zPLfvWdOwTgNu884mU2x
         YOvld5HlVHfqXcJlYhMTGUkH8vKyg8XWOz8zhA3CXfJFyH8aNMhwwBPpw2t1oKfPdfsQ
         ZozlTC0FxKqA51AjZmLcBubar52kPAcxu+W3F55/7o/VjL/TOz46WfF7KmuwQ0UBvX9w
         87L3luXNPERkpbAZLOCdPrSgR6pYb90RWLAbbXizYZO3VQzU1G23vTB2k4zGHRG0UWOc
         wWUxnID3e1qsipkg6fZcEVtz5yKKXPDkzCPxPvyoZZGIAM3VXu+PoYtVbnmWl/7o3O6Z
         T25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Le9wtY+NLWxTc/wkKiRhQg2HGbwvpYuwrgxSkTIU2dw=;
        b=t5PFo83srEZ0zCwoJj43Zm8JaMwxyiy0HWt3pPKL06xwKSPWS1p9nt9tgnRoLHn792
         xeQT4v/V6qWlTu/R5ZpLXKpuYikONC4fV6hpPN6njVlyb+QEbizf0NasQQ4c+hzIEsvf
         tFVSxj1ottm1a48YUOkG31R4Mx/hPpOvO4gH8m0512Q74fdWgpgC/z2Qt+ZXmBlZoRSt
         vyFIFhijIxtuO5UZdyXNxHEm9NfwT8Ee8fl6+xkIbmv6oY6HWa9F6EEYrcvUIERDgay+
         nikw5o0XiJ7cIsSDf2idO5Xor0fjKx3wppTAOlUp4F0PKa5bolcgmn0HrAA+w8GJxYrf
         UKYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KNXcafCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k27si1049766qvh.69.2020.01.10.03.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 03:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KNXcafCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipsAI-00051T-LJ
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 06:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ipsA8-00050g-TZ
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 06:09:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ipsA7-0002ZR-OJ
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 06:09:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37989
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ipsA7-0002XH-JJ
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 06:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578654547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Le9wtY+NLWxTc/wkKiRhQg2HGbwvpYuwrgxSkTIU2dw=;
 b=KNXcafCvlkrg8m6mwtb+Fmw5QlDRaX9WtO7zlaht9h9nRoK5aslPdfOAh7JLNiJeFGwsGG
 soezKQGVrOXeMfNtpnvK+AFCmJpTHkNPfuNwiZ2TiLe1a++tPghsym0EZ3436zP9hOoWmM
 +9Gf+hpZPhfRtaAOUZeGNOhIGk0rB8M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-YdDZ4_oCN6C_RqePrhGLlg-1; Fri, 10 Jan 2020 06:09:03 -0500
Received: by mail-wr1-f72.google.com with SMTP id i9so753876wru.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 03:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Le9wtY+NLWxTc/wkKiRhQg2HGbwvpYuwrgxSkTIU2dw=;
 b=epfG+WnwKlChdxu2ZyLhvKGGTwvpt8cBYusp2HjkEg3BW8UtqDMFq9qJPoXHzdN5i8
 5rJCrhjzGiVKZUHrZ6IQ66xhLYGh8PXeTPVkqZufuFjiUHjTNslUR2kfM0OADY2a2Evt
 LuOHOClXZDMIrderif2YULq9OAm/GTk0riqRQe+Krs0pQIdytZp5rTiyD7AeXjKZ6YeB
 K2K3iiBlkUKNriSQmiESQ9SvK0DCIUCQzSX87SOXfsb7zebiMCB/YDaQkOBxXSLbLnSN
 oBdDVE4QzPD2q16ijI/AZN+T6jpGnPbLzmkUmgOMoeZPBiWbfUMLH/2wzi0qsKSQ8ttU
 mIcg==
X-Gm-Message-State: APjAAAVoh0mulXafrGzXYjU2JTB9WZiDymoN4T/roLOYYx78MEBxYg3o
 Zq5PI9cHufWcidurjPXTbzx2xB4pqNHzu80WYD3Bf5jODjPRRbpxGVgSlPxK5o3BCOep+YeDw0+
 ZcyiGk4kiA5oZ
X-Received: by 2002:adf:a746:: with SMTP id e6mr3003615wrd.329.1578654542794; 
 Fri, 10 Jan 2020 03:09:02 -0800 (PST)
X-Received: by 2002:adf:a746:: with SMTP id e6mr3003585wrd.329.1578654542536; 
 Fri, 10 Jan 2020 03:09:02 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id n187sm1867629wme.28.2020.01.10.03.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 03:09:01 -0800 (PST)
Subject: Re: [PATCH v2 0/5] aspeed: extensions and fixes
To: qemu-devel@nongnu.org, clg@kaod.org
References: <157865360186.14299.5035230619156976945@37313f22b938>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4da562d6-6f1b-2892-2941-234072fa543b@redhat.com>
Date: Fri, 10 Jan 2020 12:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <157865360186.14299.5035230619156976945@37313f22b938>
Content-Language: en-US
X-MC-Unique: YdDZ4_oCN6C_RqePrhGLlg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijCWNfiwRbPF

On 1/10/20 11:53 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200110102518.4233-1-clg@kaod.org/
> 
> attempt to add duplicate property 'emmc' to object (type 'ast2600-a0')
> Broken pipe
> /tmp/qemu-test/src/tests/libqtest.c:149: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> ERROR - too few tests run (expected 6, got 5)
> make: *** [check-qtest-aarch64] Error 1

Yay patchew is back \o/

Happy new year patchew!

