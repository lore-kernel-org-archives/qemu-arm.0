Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3761129lfa;
        Mon, 2 Nov 2020 01:17:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB6N5n/fM7phnw154xAzvRijljLrVD32iuBCKzKsSgXxaTuZZCHcAVv7ly0ZX5d3+49L9l
X-Received: by 2002:a05:620a:818:: with SMTP id s24mr12162827qks.181.1604308630934;
        Mon, 02 Nov 2020 01:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604308630; cv=none;
        d=google.com; s=arc-20160816;
        b=kw5t0XTUqVWAwncHrFFFO5LqNprah1q5kbYmkzUpwfflO9Ff9vxyD2oc0xVweZE1eP
         JUdnUfSYnBvrV7nzv1oLdwpBT6/2C8YSyPYKXTqCdjzO7NOYM8SpaxYXlbrxfh8gLH1U
         w1oZnEqqqGKggpJUpPoc3aDJ0/hPikc/CS1E5epMwehdR3tQWb7lmkGQcZ0pMtSDiyQ+
         leAzIlmsVHTb9T7I6rkNbiGxqXhfsCYrf21WBzio6bwgFIIdxIZMb3rfGWVXwiMicsWI
         fjjvAt5tW6nwvmQxOd2Pp5v7Kg974Y+/c8Buouxkf9fKyvl2yw2ZHHhtP85ypMu78qWA
         sTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
        b=V4+m1e6NTNMc1S3NGUDT883YvpfiMjk+lVszwIFcyOKL7uBdSPTK83vTLhBYayHQsd
         XOkN+aQDZFLnKeJEZ8bCF7qGPlrofbk8cmfbUu/Lgiugg4eoy6z4NLTrDAndx7tgHTrc
         7CmbSNQgRiqlWICzkFZ+0nyWOUqtA0vbqjAa9Dy0uSs7hpUvsQ0fqSNfq9wCblnAth8K
         Hl+9XyGPTBd71EgkyNrxVvzPRZtoSFECM5gICT/bbzI2nVv0Dan5ClFIKApN4l+hqAK5
         Q+VxIygDZv70/vLQEror7Na/QRGhQD1Xy9dhCQ4/8X2/+ubQncJz3faHF6XG6KciJRXM
         59vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/wiRKMF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si8156423qtj.120.2020.11.02.01.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 01:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/wiRKMF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZVxe-00047w-DN
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 04:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZVxV-00047L-EX
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 04:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZVxT-0003T4-EE
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 04:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604308617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
 b=i/wiRKMFgR6rBUlNQpN+QwKgiJ4gnUnXTYhHAQe2KuOWO3wIEcIIsamhKxSLhDTjTmY8U/
 oQ3UWtM/zbYxUWzJgodRnE+Swhig9y+pXrQ6jxsaOrcsJeMX1UDjTPFVJVpHyU5OlRQS/T
 4I5SpCE4gm6wBktdZTBC3WwKaPdKyZA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-xyvguI87P2q8SCBiUhTbrA-1; Mon, 02 Nov 2020 04:16:56 -0500
X-MC-Unique: xyvguI87P2q8SCBiUhTbrA-1
Received: by mail-wm1-f71.google.com with SMTP id c10so2256425wmh.6
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 01:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
 b=gGIUcGI6N2cP2zOngSA/lnUKWlTa9JypzaUhnHDf3OUzbXgdSxGj5/61O//0+xorxq
 /LPEx/W6WJarlP106GXpU3wsZKolqXm9o6DtkT3JlT38TrU3MQc2ggG5id2MjbArwn2v
 n2MSSBMCuPQT8SoVA9to8RDQXYVfSS+cScGkGWcvjaem8/AhpE5ooNRj9OQjFsoYNwo/
 dZBJX36+Wl5B0lbo7uO9iYnOH2b6Dbt1ptBRM6Rsf2e9Rnk2nXczXc6oEiY1Nm42W4vH
 OogyW+x9jTMZMR8yniPYy+x1hnp1LxmjOGi81kvoZf1OjRz2T4jfpckazt7WqlSKgoSn
 T7hw==
X-Gm-Message-State: AOAM531/qR3FeD4boO06N3DPSS+qy8aYZMSZQ3w5RY0WGJAfsfg46XDZ
 p0lFOK5NZ6yc58byXL+QJF8724fY99g+lZDdYp4gNOXiYgFeo7ADj0WkdvTqUYy9faE1Mr3w7s6
 Se73k+HffMxBp
X-Received: by 2002:adf:fc07:: with SMTP id i7mr13825592wrr.223.1604308614951; 
 Mon, 02 Nov 2020 01:16:54 -0800 (PST)
X-Received: by 2002:adf:fc07:: with SMTP id i7mr13825565wrr.223.1604308614699; 
 Mon, 02 Nov 2020 01:16:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f7sm22434871wrx.64.2020.11.02.01.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 01:16:53 -0800 (PST)
Subject: Re: [PATCH V2] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>, Peter Maydell <peter.maydell@linaro.org>
References: <5F9F8D88.9030102@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
Date: Mon, 2 Nov 2020 10:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5F9F8D88.9030102@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EhKoizrRle0N

On 11/2/20 5:39 AM, AlexChen wrote:
> In exynos4210_fimd_update(), the pointer s is dereferinced before

Typo dereferinced -> dereferenced.

> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to global_width after checking that the s is valid.

Easier to read "after checking 's' is valid."

> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/exynos4210_fimd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

