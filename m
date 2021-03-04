Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6143461lfg;
        Thu, 4 Mar 2021 03:13:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjjW+tLCjAGEYKN6WV2C/8fZQl690A89y4PLAqFWs+Jb8UlNY8BpZoAhJ9XDzQ8npUDKLh
X-Received: by 2002:a5d:81d1:: with SMTP id t17mr3101618iol.208.1614856438257;
        Thu, 04 Mar 2021 03:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614856438; cv=none;
        d=google.com; s=arc-20160816;
        b=SwJjToxI7uLgsD6weGlMOdodwXvQpBm/FUJoQcLyqJiBeFuuZl1AxpOwlJiP2aSNOD
         Ywwl1xBmFjS8PEtUdoSiAZtYOI0glHellQ7dqBNfD0NM0DFGNncurIgdQBiahjqwsRDV
         BdOiBK5g+ZrMwaVzVyTt8tHjJC+fQ24cioZLsVFWE5yo0wokiHOlGWcAgl+9EzU4J5aO
         ZF1VHV2oN8w6R3wusHyb804CdQBcCEqqP0FuBLFELBBHW3x4nn1TiTP5zk+BUi0OEHvk
         9r480w34O/XevSxt4JIhT2iRwqh6mOr2Y9gZInbDOFB8WnmWD/oDgk65+NyXy6DWupjo
         lfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=85Aj1OVLyENoDDrzM8Atac+VlUtdXxUHWABNzA0gktc=;
        b=i6ApVAYrQp2mJ6gyn4BcMLtvv3Csav0sqOVNV/9V1mrsLt65NXCxe8MIJh2ZEuqoEj
         MxiV4zoUt0C8xMpaWn9nfBBkrn+IJBQlLSYMWgyXp0Zm4a07N1diGp9KYv8xoFBW4vIz
         ENTNXzEa5ryoeTcVKHYNJgmATQgKi+H9n4AFvhFpn/ws4mkwtoboUevx9wPxUfzWIF99
         vBpmELa1ir7v4tNCBz99MGy2TVxE78G6006aXxwiEP0Q/ultRCC8FX4AP3eoe8w21FBy
         wjg6GQ2YPElXPu8g14bStem0m//0YGgdAZkMiF/khIsR4m24LosxzgNehFYQS0a3v2Dx
         Ps3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si22982218jak.55.2021.03.04.03.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 03:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHlvZ-0002q4-Is
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 06:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lHlvO-0002on-MP; Thu, 04 Mar 2021 06:13:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:35238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lHlvJ-0002Bc-Qd; Thu, 04 Mar 2021 06:13:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7ECD2AE1F;
 Thu,  4 Mar 2021 11:13:39 +0000 (UTC)
Subject: Re: [PATCH 0/9] hw/arm/virt: Improve CPU help and fix testing under
 KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0b4ebd66-fb40-f2fc-6295-ab8b9faa29c2@suse.de>
Date: Thu, 4 Mar 2021 12:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iShq2/dqsW7u


On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
> Yet again bugfixes and cleanup patches noticed while
> rebasing my "Support disabling TCG on ARM (part 2)" series.
> 
> Sending them independently as they aren't directly dependent
> of it so don't have to be delayed by other unanswered questions.
> 
> Please review,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (9):
>   tests/qtest/arm-cpu-features: Remove Cortex-A15 check
>   tests/qtest: Restrict xlnx-can-test to TCG builds
>   tests/qtest/boot-serial-test: Test Virt machine with 'max'
>   tests/qtest/cdrom-test: Only allow the Virt machine under KVM
>   hw/arm/virt: Improve CPU name in help message
>   hw/arm/virt: Display list of valid CPUs for the Virt machine
>   hw/arm/virt: Do not include 64-bit CPUs in 32-bit build
>   hw/arm/virt: Restrict 32-bit CPUs to TCG
>   tests/qtest/arm-cpu-features: Restrict TCG-only tests
> 
>  hw/arm/virt.c                  | 20 +++++++++++++++++-
>  tests/qtest/arm-cpu-features.c | 37 ++++++++++++++++++++++++++--------
>  tests/qtest/boot-serial-test.c |  2 +-
>  tests/qtest/cdrom-test.c       |  5 ++++-
>  tests/qtest/meson.build        |  2 +-
>  5 files changed, 54 insertions(+), 12 deletions(-)
> 

Hi Philippe, Markus,

I encountered an issue where device-introspect-test.c gets me a qemu-system-aarch64 launched as:

./qemu-system-aarch64 -qtest ... -display none -nodefaults -machine none -accel qtest

and results in an attempt to create a device "ast2400-a1",
which tries to create a arm926-arm-cpu, which fails because it is a "TCG" cpu, that is not built in my kvm-only build.

Any ideas why this happens?

Thanks,

Claudio
