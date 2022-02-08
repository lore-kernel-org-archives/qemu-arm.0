Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp267464lfk;
        Tue, 8 Feb 2022 09:17:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKUtxWcRvR9wZSrDUvjPLyW4+wfLI2OZlajVQxI+9X4ib9diR38c0dQ+daRIfZ3g81icp4
X-Received: by 2002:a81:5c82:: with SMTP id q124mr5611248ywb.326.1644340627509;
        Tue, 08 Feb 2022 09:17:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644340627; cv=none;
        d=google.com; s=arc-20160816;
        b=NwvcyAk0SAlws44dp2v5ssk7K++0ock1X/sX6X56kyGMOD0YYoHKTsD13gTtmf+aS3
         5JzoPXGYrRoHoJ6ExtMy+k1UoZVTVEujtWNfJE6JziYaQAbGDs9TDBpYN/nsdjizx7n9
         7o87LZ7Sh37kFBr2JVZ6AtbbBbepF6sXK+BazMaz+CTUwuthy/cBY5NW8ERzjfdr4HSw
         iaY9UYZEeG63aOJFOmLuOGXa+0qJsyb5zR1aaIsC8b1y4PAhVdwF6R5ZypO5WWsmRMnI
         2p0mUPSGLXDRwB14j526J2U4BqzDurP1K+0kGVEtW+uZ4NHB/Nbcpxws0GFu6Mu6NgMv
         VtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=P/ZHQXMp0xOKdm03n4+685zIErIl3urKp6icCG1QC2c=;
        b=ceTtMdWs3KsFdn3XCvhXMrDBU0lMbo1tUhBN6/A7Ez1JD7ceoXbGNhhmcxRNgqt9is
         3+YLQFtaXbH1HSRmAIoooJNUyVwoDLeYq6GMuCTSUAWH0dTXE1wAf0VQYaVGqyIcLLNN
         WIP4QC0VI27NZKmXMTXgiVrwqPmBVwZ7wETieQNQ11CdG9aGTxXtfDQk3YtKEg+Entzm
         ap2tYnW1GyXLlVUr0aFgJfSjVqAlshkN0dpwgn73rnzGUj/ynTxKXfbv1U1qVwZ69jIr
         mCR/cM5UJpOdWSIBlqCJ8kDezWA+VUJnqnLMcUdHnk29ubqqDOnPRJyurRiwaexN9ij3
         RMAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X8e3X81p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p185si10286494ywf.308.2022.02.08.09.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 09:17:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X8e3X81p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHU70-0003cB-Tz
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 12:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTEe-0006hq-2H
 for qemu-arm@nongnu.org; Tue, 08 Feb 2022 11:20:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHTEc-0001x8-2x
 for qemu-arm@nongnu.org; Tue, 08 Feb 2022 11:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644337253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/ZHQXMp0xOKdm03n4+685zIErIl3urKp6icCG1QC2c=;
 b=X8e3X81pG9U78XKqObd//1+t6yRGi2q6Rfk97GO7fZggb76p45CxAfpRVZfYyrZTJYg6C/
 5c23EVJFEU+I9+yttS/3CCOYtJ5J7CF3v6Dvb8DMWBTCMhIjxUuIMsWUJm+XR5/KLAGmWj
 uBUnD0Ng8IpfcLIbkKv/P2IgF5UBMTs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-_gUgSOvpODegdtQF3QK5zA-1; Tue, 08 Feb 2022 11:20:52 -0500
X-MC-Unique: _gUgSOvpODegdtQF3QK5zA-1
Received: by mail-ed1-f69.google.com with SMTP id
 u24-20020a50d518000000b0040f8cef2463so2491375edi.21
 for <qemu-arm@nongnu.org>; Tue, 08 Feb 2022 08:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P/ZHQXMp0xOKdm03n4+685zIErIl3urKp6icCG1QC2c=;
 b=lp/cZ0JWVkQQhL5dJENoYTC6MLXkfJmM7hBYjyrslz0ZBZPyQteGSATC/YkB8CI+Mv
 CoKTViM/7aaIIvdxwXqo7IzkSfhUaJNFRCxIjCV0ITkaOjk2/sVoFLnnhO7b4XtmiubT
 spC9wFDV7SHx6Vucli2wVer70oGc8rW75PwF5j4IHmAKVfUiI4WDMlMmViy41XIWuivh
 28H8D5ChZilcdb1/YJpUSTycs8J/U6JglE9uhTzuO5dTDSLIsAXDqAx0OHtKITIq414g
 QNblcQ4+3TIpm06UNEa0jbU8GajkkaioERhttvAMrGRd8yL5GjuVYRytiRugnQ/XLOPd
 WTJA==
X-Gm-Message-State: AOAM5337Ot2/AURX2VnSl5qaHl4eavWtoApn82U9gBOOvX+4kFAjpZoB
 dVFm2svVVXlNwyDf9LjGYFVQgiMr/VWGV4SEzty+4OYLuNZlh9pHYxyaJeWtWF85WR4sAjcHrac
 UAF8j26PpJzln
X-Received: by 2002:a05:6402:14c5:: with SMTP id
 f5mr5320265edx.122.1644337250769; 
 Tue, 08 Feb 2022 08:20:50 -0800 (PST)
X-Received: by 2002:a05:6402:14c5:: with SMTP id
 f5mr5320246edx.122.1644337250524; 
 Tue, 08 Feb 2022 08:20:50 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id i1sm2052241ejh.208.2022.02.08.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 08:20:49 -0800 (PST)
Message-ID: <687ca4ab-eef3-56f6-2cc1-a6d98d77d304@redhat.com>
Date: Tue, 8 Feb 2022 17:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] Kconfig: Add an I2C_DEVICES device group
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220208155911.3408455-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K7YFlXUQBCTB

On 2/8/22 16:59, Peter Maydell wrote:
> This patchset adds a new Kconfig "device group" for I2C devices which
> a user might reasonably want to plug in to an arbitrary i2c bus via
> the command line.  This follows the approach we use for PCI devices:
> generally-usable i2c devices have
>         default y if I2C_DEVICES
> and board models with user-accessible i2c buses have
>         imply I2C_DEVICES
> 
> This means that when building a board model that pulls in the device
> group, the devices are all compiled in and available for use.
> (Previously they would happen to be present and usable only if some
> other board that explicitly pulled that device in happened to also be
> built into the same QEMU binary.)
> 
> I have been fairly conservative in marking devices as being in the
> group and in marking board models as pulling in the group; feel free
> to suggest changes.
> 
> In particular I've only added 'imply I2C_DEVICES' to arm boards.
> Grepping through Kconfig files I only found the PPC boards e500 and
> ppc44x that enable some kind of i2c controller anyway.
> 
> The immediate motivation here is that the recently added lsm303dlhc
> magnetometer isn't currently built unless the user manually adds it
> to their config, because as it happens no boards have it as a
> hard-wired device.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> thanks
> -- PMM
> 
> Peter Maydell (2):
>    Kconfig: Add I2C_DEVICES device group
>    Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus
> 
>   docs/devel/kconfig.rst |  8 ++++++--
>   hw/arm/Kconfig         | 10 ++++++++++
>   hw/i2c/Kconfig         |  5 +++++
>   hw/rtc/Kconfig         |  2 ++
>   hw/sensor/Kconfig      |  5 +++++
>   5 files changed, 28 insertions(+), 2 deletions(-)
> 

