Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1111891lfa;
        Fri, 23 Oct 2020 22:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaAo+cvCrZ+HPXrma9yvd8y4Y1+hijspix0afOz3n4qKKX/jYivmBO9nszWv70uhkD08ju
X-Received: by 2002:a5b:4d2:: with SMTP id u18mr7557469ybp.56.1603517200309;
        Fri, 23 Oct 2020 22:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603517200; cv=none;
        d=google.com; s=arc-20160816;
        b=pyVJOSKZyiUp7oGcwzT0KV+NSRiFDLhp7EFaa4HtkzTSEBiIvyNPcmj2h03azP83XR
         RX2gB7gD/iK66L88jKyLzTX3vXWB+tcqQJlCD36Akm/SfDhITwUmER/kbbWkH/BUq8cW
         9H2o1kmvXDLKrkkuUR14TxfnAAdhzB13nnsQtU/5DPsdtJaI5Twc8d5v4LSyBVDlRi4h
         txPGQOMJgbYC8uL8vh67uVO0Qz++7Qd8TPQ4E1FHL/jJYhjHMZ1c/QEItblnfF1ZOilG
         FCB6F8kQdrl1X87COmE8JlcWCLBGdV9zZ8rTWhbG8aVJrdpAm3Yxz99/9jfEG3Bj+yJe
         2vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lOGTFE09pGpLyr331BROyMAqUTZY/Wsr29mTAIe+dSA=;
        b=kL99VaBJ3UaGaFpzl0Q1TYfRHoz7qqy/clY4iUwqqdAfxB1jUFMzU0va2980TIbbgh
         lzs+pWQiHp8xTv6/bmbVvIxtpwdJ74Bv7QevCuK4aHpaRrWQvRlsKvj4ETqeNgGUM4F/
         AwH9JGWUT/+GnkPDy2bKWRSbHzzzNjLOGrw2mxVxFns2TNpWYtRacFqyghikPlIKaTl8
         +5YxzOX4jVRzO6O9VFmAlrE6oCAHcZA7ILGABA0mWOgrRODz+GybzQ3Z47CCADzm5WBj
         Ba77ltHMsJzSTKJKqZX4sqalZiPydD9P2kut4y+xQ17ddB1q8dMA+hT9bQ45l4e9NQtl
         j8PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PVa4/ann";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r124si3983228ybc.380.2020.10.23.22.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 22:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PVa4/ann";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWC4d-00015a-Le
	for alex.bennee@linaro.org; Sat, 24 Oct 2020 01:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWC4U-000146-0W
 for qemu-arm@nongnu.org; Sat, 24 Oct 2020 01:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWC4S-0006RU-Ea
 for qemu-arm@nongnu.org; Sat, 24 Oct 2020 01:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603517187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOGTFE09pGpLyr331BROyMAqUTZY/Wsr29mTAIe+dSA=;
 b=PVa4/annoKwaXSh+Gk5B4c27bNiT3mhv/1JQH8H6L2jWUG0Ygelnu/E++2c9i2yyrW5wyy
 KV+6PKBxQhsH3vjY05yv84sAeHgCJFqAvT4mOy3sOITreEWKW5vBDVy9k5p7C8RoFg/MD4
 Y/icmUHI6i41I9Yf9Y3i+fdPzpckvI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-7IxUYwLRNp-qBPuPuJj-EA-1; Sat, 24 Oct 2020 01:26:19 -0400
X-MC-Unique: 7IxUYwLRNp-qBPuPuJj-EA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12D964144;
 Sat, 24 Oct 2020 05:26:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 954CB5B4BC;
 Sat, 24 Oct 2020 05:26:14 +0000 (UTC)
Subject: Re: [PATCH v3 1/6] tests/qtest: Make npcm7xx_timer-test conditional
 on CONFIG_NPCM7XX
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-2-hskinnemoen@google.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <952a179b-0d80-4f4c-9a1a-7cbc5910f9ef@redhat.com>
Date: Sat, 24 Oct 2020 07:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023210637.351238-2-hskinnemoen@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 01:26:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nR6DyXNL26S0

On 23/10/2020 23.06, Havard Skinnemoen wrote:
> This test won't work if qemu was compiled without CONFIG_NPCM7XX, as
> pointed out by Thomas Huth on a different patch.
> 
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  tests/qtest/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 28d4068718..7e0ecaa2c5 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -133,12 +133,13 @@ qtests_sparc64 = \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>    ['prom-env-test', 'boot-serial-test']
>  
> +qtests_npcm7xx = ['npcm7xx_timer-test']
>  qtests_arm = \
>    (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
> +  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    ['arm-cpu-features',
>     'microbit-test',
>     'm25p80-test',
> -   'npcm7xx_timer-test',
>     'test-arm-mptimer',
>     'boot-serial-test',
>     'hexloader-test']
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

