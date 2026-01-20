Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F3D2ECE9
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 14:16:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viCWC-0007fU-1c; Tue, 20 Jan 2026 09:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1viCW9-0007e8-EO
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 09:15:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1viCW7-0002Uo-SP
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 09:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768918534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4CuSSQ4Awm4TndAbQd6uDiLcUbniVehjpvOym9wDSL4=;
 b=cfzA+8gzDv0Cfenr9GfpmSYH+kFdfFsO+EBDMs2atV00hGMjw0va+JeGzCRhMTmJbkzLoH
 jnBaGK6zGXvwYFycD6B6knUYAht4EY+rHWo6o5sH3R3nLqhByTr1l1hhnbAkRMXFwJQnkn
 8NtK80yoHyiKU/4qwwwjayBPIB6sPAE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-Mspvivq4NtKdhi2Q2sU6bQ-1; Tue, 20 Jan 2026 09:15:33 -0500
X-MC-Unique: Mspvivq4NtKdhi2Q2sU6bQ-1
X-Mimecast-MFC-AGG-ID: Mspvivq4NtKdhi2Q2sU6bQ_1768918532
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430fcb6b2ebso4420503f8f.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 06:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768918532; x=1769523332;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CuSSQ4Awm4TndAbQd6uDiLcUbniVehjpvOym9wDSL4=;
 b=tgpDH2gigMivLvGQSMhlvonxUN5thxKAUnKCnNqI2r+o6s4srCCPKwdQZgmHvYha23
 +zhStCMhi6ta2aDS60nXiHpjF9ynv60A5XGjfHJEwawC/E/Ze2DEiQaLsQRcGfkhx/71
 Auvrevz68PsLMMmU7RNO1/QAh1ZDORghE01vhHSQhxTL3RL0h+MaZlQ1HHjW/ivtQxf9
 Bp0rYx/8+pVu4XwwY9AAX0CTGNPkOD9dy7kA4Em/Rs19JTZmGeD2nwNLPETgQe3XKHkS
 OK7lPsmCt54n26td1pM7Tb3/dKrQe3qL2uNNl/5TPsSL7iW3OUp8w7PUUiDskapyWi+p
 doeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMEedA/p/Rvfvfa9JeIDsSCKxBo9FQPhUlLFXcASG+d3LnT+zZBZQBj0hVyFrQI6EGqe5rqHSNnA==@nongnu.org
X-Gm-Message-State: AOJu0YzyfHkQuca2ncooaacWz/MoRj1/ys9U2/Ssj8f2626xRe4CuiXb
 qqaOV5BRInVEquKwzf/jWyWJ3KocxqSCNzb9hnDkKkC179BRwO3c2VxEhwh5kvbKhOzE+iKcHsL
 A12B/TQN0eXtXVaoO6EbKH1+jsTRs9QTxwXAKL+7IaEChu5wLTjkC0w==
X-Gm-Gg: AZuq6aLNlN9zxO0rxqEeW9rcoWJirVK6eqqGlOhzvhYhJUyYnmufsXZaHeYtucikQf3
 ZSBEo9RyK4fy2rDlxcgr6/8By/i3TQ8wDXaKPMfLC7mixMdSMTHwOJkKIJyY/NJrqGZ+dft4oio
 kVBUGlqX1lrzauAldxKRpus45JDjDk94ZJgq+BdKcPIoK5btGNq8yjY9lydZsQw74zRLAMWwt68
 3dT/riUF+jBXe8z6sFNL5vKCssYFaoHjMlZ99KK7QTOCSvJkKky1azcEJIutu7Hg0ZVJJ3o1D0f
 dIkY5dbSLaVhiGGdznBLLlXcZnFm7wnpaDt2dvRNYh3XnPEY5KvElV3G1IzuszXn0cFBEsL+NHh
 VIMqTVvg=
X-Received: by 2002:a5d:5f94:0:b0:431:1d4:3a8a with SMTP id
 ffacd0b85a97d-43569972d22mr18270629f8f.7.1768918530976; 
 Tue, 20 Jan 2026 06:15:30 -0800 (PST)
X-Received: by 2002:a5d:5f94:0:b0:431:1d4:3a8a with SMTP id
 ffacd0b85a97d-43569972d22mr18270576f8f.7.1768918530408; 
 Tue, 20 Jan 2026 06:15:30 -0800 (PST)
Received: from [192.168.0.9] ([47.64.112.255])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435924ae6f1sm3077820f8f.33.2026.01.20.06.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 06:15:30 -0800 (PST)
Message-ID: <791eac72-f4d2-48b5-9973-c64006e8ce13@redhat.com>
Date: Tue, 20 Jan 2026 15:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Move the "arm-cpu" compat settings out of
 hw/core/machine.c
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
References: <20260120122108.131708-1-thuth@redhat.com>
 <CAFEAcA8nzm+CEN_Dp+X+AggcTg57wAt8D43x-7oixLeNH4TDdA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA8nzm+CEN_Dp+X+AggcTg57wAt8D43x-7oixLeNH4TDdA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rI9Y2ju8M0Xz1gnR0BPQHMTq9N4D3ZiWv7XnYBdMaLw_1768918532
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.087,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 20/01/2026 13.55, Peter Maydell wrote:
> On Tue, 20 Jan 2026 at 12:21, Thomas Huth <thuth@redhat.com> wrote:
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> The hw_compat_* arrays in hw/core/machine.c should be used for generic
>> compat settings that might affect all (or at least multiple) machines.
>> Target specific settings should rather go into the target specific
>> source files instead. For arm/aarch64, the virt machine is the only
>> one that cares about compat settings, so move the "arm-cpu" related
>> switches to hw/arm/virt.c now.
> 
> I think it makes more sense for all the compat stuff to
> live in one place, rather than being scattered around,
> unless it is truly machine-specific (which this isn't).

It's only used by the arm virt machine, so it's IMHO machine specific.
If we will ever get other versionized arm machines, they won't use these 
config knobs, so this never will be shared with another machine.

> The hw/core arrays seem to be where we put compat
> props which are related to a particular device rather
> than a specific machine.

IMHO it makes sense if multiple machines use such config knobs, but if it is 
really only related to one machine ... not so much.

  Thomas


