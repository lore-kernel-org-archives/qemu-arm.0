Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp295607lfm;
        Tue, 21 Apr 2020 23:58:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypItiA5b8QToNmW0Y6+NCH/Thx7ebuDjIAAwy95ezcjF5Hi44MDgyzm/wLYH6lc+6/R+zZaa
X-Received: by 2002:ad4:446a:: with SMTP id s10mr23639269qvt.31.1587538733056;
        Tue, 21 Apr 2020 23:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587538733; cv=none;
        d=google.com; s=arc-20160816;
        b=Ic0LBJEl0Skj+PR2QNYTcsn4e4DRM0ymLobUOtQFeICAF9KqrPALxnOd7K+6c6o1Vc
         1MaRCood5ZB1Lq3F4rYeBSQaFcfpnwN7OmzeOKRIONkwX7965l8XI7NH9bEc+blAkuNW
         EFurcoF8qx6E7EbHIldlHFF81ZWwj69i8gXBEmYPxaMlCKlYzxoiTdTN2J3XvAmnRtZE
         qsZHNSOrjBlV6Yk+wSWPQ9KnplMMmF86QErMrlww1XERKuxJ0p7GeatvuzQ1EurUKy/3
         vkOdN8NcNs7q/dZQZRPmaMwWMlNOFvhjAViQJAo8kyVVmSUM3SJeT2fuIEfgRG0+3n3c
         LluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hFYbiQ5L/SH7Njt9bWYLCjD+5eQBCYeOi1syYvcfuXI=;
        b=ZYtNsqveFJ2w6rQt2KNuJU8sMfbqBv2mfhNWV28m8KlA7oqgS6i4StOM8lNdn/V9Lc
         0rGRi9cNlaUmq896d9kUo9twQJAdITw4UsL9F7N1aH68Tb+HQeVa1AoNvWu0wGPxOLaZ
         5o7Tcq4QZLKDOF23JgGDXZtODc4v1mZ/V0zvuOWgClnUpnEl03ozPyeGKNkGaawCoJPB
         SScjXEX95Pq9kJeBo96qJKbWzpaNqxZE/YFwqXRkROUdTZeur5brdHySqIdZqpwQ0PBr
         gjDV1BBne6xvFBDKhItbYmcZ5B0ALAlyTxU6ZPj6s1Lv0UlE7K0T315iQkiYZMB0/951
         SByg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B0jIPwC+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si2608143qtr.392.2020.04.21.23.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 23:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B0jIPwC+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR9LQ-0004Jc-AB
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 02:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jR9LF-0004Fv-06
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 02:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jR9LE-0004gY-Cc
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 02:58:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27486
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jR9LE-0004g3-0Z
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 02:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587538719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFYbiQ5L/SH7Njt9bWYLCjD+5eQBCYeOi1syYvcfuXI=;
 b=B0jIPwC+bTCOlQVPw4eecQilXjDiLoaUtPSG04NxTwFngBnzGwY/I7UqwCNosr9v/yPfJC
 6KmlLPt4npcYeW14R33EkfW7oKCN+tdw7QgcI5x06Oqu2jykv4XTNZVbCBqw/14EiRymRP
 Q+bJRJ+SFO0mL+nBE+NHAqViY3oWxkQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-uag1VTpnMviv0fXnmLNRTg-1; Wed, 22 Apr 2020 02:58:37 -0400
X-MC-Unique: uag1VTpnMviv0fXnmLNRTg-1
Received: by mail-wr1-f69.google.com with SMTP id d17so581049wrr.17
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 23:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f/3TwOTQCSnbkIKSE4Jn0yjpvFJq/W4VDJUOm/m0kQ0=;
 b=Cve6p01oaD10GCDaFbsmU92eYXuGg7BxGVZQfBOQC4DWU1BZdX2J9biSC76z9YkhFM
 K00kF898mxiSp0WNCxRcC7CzowojPqhUHGe1c7/RQjaSp9ZOjkJ6S3SdB2ae4SNqrRSM
 ji/xQbjIRDsrsfoaTJXLnliLEZlC2XNiwxpTw8yW9BExFEmVxp0k5vh/XWbZdtLK+4tv
 DvAAOab/ij4VUvyqUpz/LvJEh0QXc+mhXy99uR4sAasWOsKarYm7LpSUodDcgw+bxx5u
 +mXZJGC9eFEIGAi9VJ3FXtyIvu35OVfzmg6tBpIGzI9pUoxdjdKewDwQ8Esn8/nIICjC
 Qgng==
X-Gm-Message-State: AGi0PuYyL1gqDk4WDAMnKnFrVWVYi7GQBV11vh6zRl6tSnpq6gT6duoT
 4At1uB/y9UDfx6hWUx1jQv/+Xss0IcxHlQf6MFnTDUYw7tWjf+RS7HNCNhYLFKAiF4/3rgOlnth
 pbhZyDlP41XDx
X-Received: by 2002:a05:600c:2157:: with SMTP id
 v23mr8242782wml.149.1587538715980; 
 Tue, 21 Apr 2020 23:58:35 -0700 (PDT)
X-Received: by 2002:a05:600c:2157:: with SMTP id
 v23mr8242767wml.149.1587538715776; 
 Tue, 21 Apr 2020 23:58:35 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id q143sm6804308wme.31.2020.04.21.23.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 23:58:35 -0700 (PDT)
Subject: Re: [PATCH 6/6] target/arm: Restrict TCG cpus to TCG accel
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200421131926.12116-1-philmd@redhat.com>
 <20200421131926.12116-7-philmd@redhat.com>
 <e2864e76-90a7-03f6-7bf0-e409980a2900@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <54a52306-1e7a-768f-637d-dd29f48196ce@redhat.com>
Date: Wed, 22 Apr 2020 08:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e2864e76-90a7-03f6-7bf0-e409980a2900@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:04:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/ipUJGc0h7U

On 4/22/20 6:24 AM, Richard Henderson wrote:
> On 4/21/20 6:19 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> A KVM-only build won't be able to run TCG cpus.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> This patch review is funnier using:
>> 'git-diff --color-moved=3Ddimmed-zebra'
>> ---
>>   target/arm/cpu.c         | 634 -------------------------------------
>>   target/arm/cpu_tcg.c     | 663 +++++++++++++++++++++++++++++++++++++++
>>   target/arm/Makefile.objs |   1 +
>>   3 files changed, 664 insertions(+), 634 deletions(-)
>>   create mode 100644 target/arm/cpu_tcg.c
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thank you Richard for reviewing 6 different time the same code movement...!

