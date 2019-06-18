Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3603940wrg;
        Tue, 18 Jun 2019 04:31:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxTyxGOmaG8zhdvTEab1VOx9OzQUwPHzZyA54H6xpeXHR4w+nIYfBGkV/0kA7GYgFgZxkn
X-Received: by 2002:a17:906:7801:: with SMTP id u1mr60615931ejm.250.1560857502674;
        Tue, 18 Jun 2019 04:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560857502; cv=none;
        d=google.com; s=arc-20160816;
        b=J2rGDM1EwtjSjskjcpOHFRqlW3/fQ/vBNCodw8FtGNleNnOXrybLUI7/KcWxMuRavY
         w5OuAyt4sxEhqpCRblRjPnZUEvSLaq75WucuWgTOBXI++2wEBwyczpEA8JwSJbCZCwxZ
         bL56LAnFqJUVWcJIPwj8mN8/M1K407e9cZH3OiWgK2z4WjQ41TMSO4o4ECjKbhy3f+Lh
         NbRDHc0l73NXXZgv0PNj0IgtxQd411GASEz8Qz0L+9n7h+rXU3KjhSwGKgK4aGOYEU69
         EZjM8ERKZr7Mg8Sm0OPQlDrovycOVWFL4ygxAC/3cK9FRm5O0UWuly8eAlZtkS+P3C4W
         iDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=sWAUzTVZTd1N0vgARBpJ2iBRKFKmWFK8xlcTWblFbF4=;
        b=YSt5KH1WwajLeBdbUJuAfRPOriGVfdsnQIxv+w4OD2PXmsyWmqrvHLgdnmjJ4jcfxK
         asiuSA5uDNIwqQGOvbffrxMQ1wghTs+EvuGKmhX3R2K8U5to14K/c0ZLIRBb1lAHGsMY
         kEOecmISf40bxeCJ9fZND+8xWa9mRK3YrhCgDTfn2P60apt4DeCc8ZhFPPUlMVKkbWnB
         /F/fZIpAMMXEdraRTgK1OwLV9NQGHjv9Gf3Op47XCnu7JNROX7ipsWO8Qysqfna26Fn1
         7kR1+M3FDJN9HQcnggHCrDJoZCK0TFK6qt/QptO0iF70B98zphnttQbD0wD2F4NEi9SX
         KRpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si8955364eje.223.2019.06.18.04.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 04:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdCKz-0007Sh-Mo
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 07:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdCKq-0007S3-Ow
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdCKp-0006Nb-IT
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:31:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hdCKp-0006MP-CZ
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:31:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so2850469wma.1
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 04:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sWAUzTVZTd1N0vgARBpJ2iBRKFKmWFK8xlcTWblFbF4=;
 b=o816N0bouvNnbggjsGu19LbsSZT2uDFVBJtwco1am6jG29+dtQzMrlRzSnGAfltB60
 0ZkMLF1J/HAL7U3fBtdATO5Be09h+fUwD85+5plV60Blp6JgKA0wvqU3f9jkLkRV0G3m
 qA7kpC1ZJz64YH7OLsJHeO/KDiFYQ6ZrL7YG+xXdFIs55ywHpOHqv7IrNoEjS64YFfU+
 MvKOa084MUFatrmOY387oMfVL2vGwT+qJMZT0bwxztHGe7WzvcOgKhN1m94ybnG9b7SM
 +4i7Dtx+lVXAdCGDc5hu84pWxi7zYzDMVIHO1bz215GqyHkoAI8T1nD6lGcAFUz6nCGx
 ko4g==
X-Gm-Message-State: APjAAAUT9de4SChLMtNJhzeY61jxJbQ4ZHyOyu9JAV25kW3d+fd+FLC+
 6HkxSN7Kaxw3v38eE4nuRqpQoQ==
X-Received: by 2002:a1c:ef0c:: with SMTP id n12mr3039033wmh.132.1560857490353; 
 Tue, 18 Jun 2019 04:31:30 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id n3sm9987742wro.59.2019.06.18.04.31.29
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 04:31:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20190618083442.10407-1-drjones@redhat.com>
 <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <61cad4d2-61bc-00f1-d86a-d88b9e926ad2@redhat.com>
Date: Tue, 18 Jun 2019 13:31:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel
 boot setup
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
X-TUID: 5Dkm4E0H/pUl

On 6/18/19 1:02 PM, Peter Maydell wrote:
> On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
>>
>> We need to check ram_end, not ram_size.
>>
>> Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
>> DTB off the end of RAM")
>> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>> ---
>>  hw/arm/boot.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index b2f93f6beff6..8a280ab3ed49 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>>                               info->initrd_filename);
>>                  exit(1);
>>              }
>> -            if (info->initrd_start + initrd_size > info->ram_size) {
>> +            if (info->initrd_start + initrd_size > ram_end) {
>>                  error_report("could not load initrd '%s': "
>>                               "too big to fit into RAM after the kernel",
>>                               info->initrd_filename);
>> --
>> 2.20.1
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I think I missed this because my test case doesn't have an
> initrd -- direct kernel boot works fine if all you're
> passing to QEMU is the kernel... I think we could clarify
> the commit message a little:
> 
> hw/arm/boot: fix direct kernel boot with initrd
> 
> Fix the condition used to check whether the initrd fits
> into RAM; this meant we were spuriously refusing to do
> a direct boot of a kernel in some cases if an initrd
> was also passed on the command line.
> 
> ?
> 
> (if you agree I can just fix up the commit message when I apply it.)
> 
> thanks
> -- PMM
> 
