Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4580396lfb;
        Tue, 17 Nov 2020 04:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjY/8VMjRgI+yHCTlIydDy5XvlJiZCUC6JS/aWd0qSzxKAjMH4SSxJks2U2hplbt4J/QLH
X-Received: by 2002:a25:c6d7:: with SMTP id k206mr31486980ybf.244.1605617349639;
        Tue, 17 Nov 2020 04:49:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605617349; cv=none;
        d=google.com; s=arc-20160816;
        b=HLWA5tiS6Jo+oclRh5QvA0IJAApvrcatxJbnxMs0zxYYl5KeAsVUMpBGIKo7jcnW8P
         EhUX2jEEfkicwWrwa+bRxZp1SHv2twAbk5ykJ5uuNo+XHhNpyTlEIbQd6opcmRPbSJBJ
         7qg+Nf3+NWGpwFPoZUy3Z+Pt7t6AvHoc+qRXpq05iz6D1yBy1DM9AgVIi6DwXPZfnBEk
         KWZsDdgSi4GlkA3r/+BwsE/sJlq5Lwe9RyUn0zhl9TwEH8J6+Z+couj/FSYwOMeKSNuR
         ITu+N208nPht9JVkLTV20Yyx0ZShm+yZf0R7HSwQNo5BzZr2TWUO09l8vgnVWFvHbTJR
         tDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ExyNjIbyYgPz8m5K9nXO++ZsLvNj801CX8TiAjP5uTY=;
        b=dn9oTVQHDg+HrbXkmYFBJODL5zx8V5ldjRC1vb3aV3LEjHCx8F6vROFDPV2d+PxQ2c
         0IrRpV/LgxIEYEe4fNWIp3et97+1H/TUW4xya4FZI1h7iZZlD6K/avOk+Rf9ZYNWqtpv
         p+awThhEkNB0NRadLtcD8iK5WyvKIHoYm9OJqnJyn+W+oYAGL3PlSIcZZPDRkm7jsJdD
         3G0BO0h914tNxl+HuP5otbG41JiNr7APkc6Pe4FV03YzBXJUrhBRoMpqSNrsH9/t2j61
         h//wi3AfGTzR8SkaM5bj3s2y7JFX0QuXk9oZf7BRpPbmRWvVLJFVlV/WqEhzQBGfrcND
         pBVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MXxcfzMd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si19646598ybp.210.2020.11.17.04.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 04:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MXxcfzMd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf0Q1-0001Wv-0F
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 07:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf0Pn-0001VS-JF
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 07:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf0Pk-00058v-HW
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 07:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605617328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExyNjIbyYgPz8m5K9nXO++ZsLvNj801CX8TiAjP5uTY=;
 b=MXxcfzMd6uTBDkcw3FXAU+mHbbw9n5bD2XwKdYmxxKFz69mtvmbzA8Sb/+jNMu/9ahlZf7
 X++OiE+2qa0b62boLIHXee7xe62SKE/89WZPiCvjhWA7dEpofyMd7CUmTby2FMcYxkAniR
 WtAbo8a2+qYVJHLeX7wrAzEmQHR9qnU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Sasf5FsXN-uBF3sSkGLJhA-1; Tue, 17 Nov 2020 07:48:46 -0500
X-MC-Unique: Sasf5FsXN-uBF3sSkGLJhA-1
Received: by mail-wr1-f70.google.com with SMTP id l5so12929904wrn.18
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 04:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ExyNjIbyYgPz8m5K9nXO++ZsLvNj801CX8TiAjP5uTY=;
 b=swRz2d++LPus4MIJCXFfO66CfYskGiKPed74aV+V1RxUxJr+A3h1rYwfcVMIJJN2Jq
 gmRio379Y/Nx9ddX7Ox6nuxvppvKGISM0PN4ohc4pyrjE9aJKEBxrY5MNlHh/rq/Q3Nz
 IR9y94MoocUFM5jTiRUrOWW9recW2uXbHHNSaKvSxdnicrnuQk3Sxfrne0WxH6pMyOem
 OCX5MlUuPip0WHD+Fr6i9FZxm1pR6OU0ZrCSVPGIxHEptNQf+7t9G7E78WDUc6VTmFfq
 hbjZ6CJpcAOIIk6qbvXYQsYDIoz9QfFhTH41qg6IfOOvfeBQMaDY5aV9EkmtETVuVpCd
 qFpQ==
X-Gm-Message-State: AOAM530GAMDQwT94XW5+B907PHZd9KvBOS71laOanIwcWCSRfh7Kory4
 2d8SJA3WPXqLCGJN1cYZ0vc/xqIF/FO/7d48d/0LUNp3sDre3ZiH+vwDQJrp2TdlfOY5vTCjDgL
 bJ1xAx/6HwcM1
X-Received: by 2002:adf:db8e:: with SMTP id u14mr23598304wri.233.1605617325299; 
 Tue, 17 Nov 2020 04:48:45 -0800 (PST)
X-Received: by 2002:adf:db8e:: with SMTP id u14mr23598267wri.233.1605617325082; 
 Tue, 17 Nov 2020 04:48:45 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k3sm7544564wrn.81.2020.11.17.04.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 04:48:44 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 1/5] tests/acceptance: Restrict
 virtio_check_params tests to X86 target
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0c591e28-659b-b30b-105c-e8ee3061b7bd@redhat.com>
Date: Tue, 17 Nov 2020 13:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102144245.2134077-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFUBQ31ZGuJM

ping?

On 11/2/20 3:42 PM, Philippe Mathieu-Daudé wrote:
> We disabled the virtio_check_params tests in commit 2d6a6e238a2
> ("tests/acceptance/virtio_check_params: Disable the test"),
> because these tests were making multiarch CI fail (virtio is
> multiarch).
> 
> We took the big hammer, as we can restrict the tests to the X86
> arch. Restore them on this single arch.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/acceptance/virtio_check_params.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/virtio_check_params.py
> index 87e6c839d14..fecf1c094b1 100644
> --- a/tests/acceptance/virtio_check_params.py
> +++ b/tests/acceptance/virtio_check_params.py
> @@ -42,6 +42,12 @@
>  
>  
>  class VirtioMaxSegSettingsCheck(Test):
> +    """
> +    This test should be multi-arch, however only X86 is implemented.
> +
> +    :avocado: tags=arch:x86_64
> +    """
> +
>      @staticmethod
>      def make_pattern(props):
>          pattern_items = ['{0} = \w+'.format(prop) for prop in props]
> @@ -117,7 +123,6 @@ def seg_max_adjust_enabled(mt):
>              return True
>          return False
>  
> -    @skip("break multi-arch CI")
>      def test_machine_types(self):
>          # collect all machine types except 'none', 'isapc', 'microvm'
>          with QEMUMachine(self.qemu_bin) as vm:
> 

