Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp191726lfa;
        Thu, 3 Jun 2021 05:39:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1ucbH1e333HoO6gjZ7+nGOBYBMjoiAHz9XrAvxp1XvoRyauMo44C8bPWBuAlOIiPMPHs2
X-Received: by 2002:a4a:625a:: with SMTP id y26mr1099311oog.38.1622723993813;
        Thu, 03 Jun 2021 05:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622723993; cv=none;
        d=google.com; s=arc-20160816;
        b=Zkeb9rIOSPpRPVfXYVK6ff0OB68pDYKOwFPHRMYRjXZnchB+FZde5tebWfBmrd57fR
         dcnARwP8omHac0lE3Z36/YP35RRvQDMLK4OEkW9JE3/2LVgG/kVqNhxOpGbUz3Ioqv+6
         sHGgVe5odGV26SPfaSehmhgV6DtZ14OOA/JW+va3Eg+aRb9xQpxwl04Fed5/JBlwd0am
         CsTQ4IliPIvUh1A06GPdRzX4EFXkYW53HboY35PxI5BTMEZ4p7RZs4UWywKM+Eur3Hpe
         Koff0kR9br+qMQ37+8h7xu6MbVgP9Xabb/tnZss9N8UPQGak77ls39apWcEHpFOsMNoN
         gEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tdqHVmVflfqyxt27O1b6+VXH2djfui6Z/YNcJOL9zrU=;
        b=EFsBZMpWcg6dngZGD1/vLoUe3+VSlSY5X9hrP/EPO4vvsTjRDN2QxNrgU4xaoi2LTi
         57RdYKJbt6SPogesUBu8YoF5D6tlkbEy/pT1/taavsX+9ixwe2Xr2STYoXe9Qf3iSwOL
         97P894C0JZsGEtj57axRo+DLdnrWCa6zUAjnfRJvG15ItDe+KAuukaM9P6+p9t/PLi+W
         9gV9fuIK7lR1LGWih1L7MWKc1vVCgkKijwZdM4YqmLpj0yG5NraGaert9uMjlH/6lAmH
         xAThQJJgnL4cr1SVxF4ZzN3ubB7gywB563qy1rhnWzYJnWNg8MrwpDq+NkwzCBD6OId4
         nIlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RYk6UORX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si228243oig.184.2021.06.03.05.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 05:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RYk6UORX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lomdd-0006W5-4t
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 08:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lomdU-0006VF-Vf
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 08:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lomdO-0001wv-Dl
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 08:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622723975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdqHVmVflfqyxt27O1b6+VXH2djfui6Z/YNcJOL9zrU=;
 b=RYk6UORXnH6UrwDROa6etv+/LYqUIvT/SeOtrLi1kDVJEVASzRM/UH7Vw+rDBkAvGVnGO4
 ay/cGKbL03W9FRnUh1l9Qr0aKbmRXwbgjXjkEXZHERDawTa1weOuqEsM56zi/fSUxAovB6
 t1pwUL2lM/zCb3ntGIffNjgYL9tX6K4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-XfypQmAdMBqXOeARCUbIJw-1; Thu, 03 Jun 2021 08:39:34 -0400
X-MC-Unique: XfypQmAdMBqXOeARCUbIJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 f12-20020a056402150cb029038fdcfb6ea2so3175209edw.14
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 05:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdqHVmVflfqyxt27O1b6+VXH2djfui6Z/YNcJOL9zrU=;
 b=MevkOax1rBmpOJLvJ3/W0xOjcKtY6RAUYnk54LQ2uYO2hUNdVF+4z9NEGxkdeXB/Nn
 3qekdvYiqakYvV/tYRiX7Lmdi5qaiVhezxXHCIDOHlyC4Do2UPxW0lg8YXoANzKTZpNR
 9gu2M9tqyxdV791EHI87MqAfsK/lnhuqvbhqO2foT3qtZYjcocniwDYe/8btjGw/HQAb
 ox6wIFNzJWCCY8URBB8RnzV5x14F8jqsoXi00JYpgTlaHhSUmoQlbUSisuZxCzoZpFc3
 edp6qURR3hfoTWx4woEsgyeCvEZjNVZkjcfAw+Ybos403mw6RxNcJDUcu3xl9p1jewGW
 /YWA==
X-Gm-Message-State: AOAM531eDggU0fisvO/U2eKXDICN94XjbEfxZy54Gmx6kp2ymRzwZnps
 dA778vvldi3fTxtzh2MxBwRHv/9XxiueFXJ42u5ujTCsrudCnBZ46mToeZtNA+OTAA7RKIVdfhI
 MTNwTCvnLjiqP
X-Received: by 2002:a17:907:1ca9:: with SMTP id
 nb41mr39071029ejc.279.1622723973188; 
 Thu, 03 Jun 2021 05:39:33 -0700 (PDT)
X-Received: by 2002:a17:907:1ca9:: with SMTP id
 nb41mr39071011ejc.279.1622723972852; 
 Thu, 03 Jun 2021 05:39:32 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a97sm1763578edf.72.2021.06.03.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 05:39:32 -0700 (PDT)
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
References: <20210603110012.1182530-1-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <31c4e422-5451-3c0a-f5e6-df75559c9a9b@redhat.com>
Date: Thu, 3 Jun 2021 14:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603110012.1182530-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AJaSEIdBzhft

Hi Jean-Philippe,

On 6/3/21 1:00 PM, Jean-Philippe Brucker wrote:
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
> 
> It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
> unconditionally write EOIR for all interrupts that it manages. This now
> causes QEMU to abort when running UEFI on a VM with GICv3. Although it
> is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
> seems a little harsh, especially since icc_eoir_write() already
> tolerates writes of nonexistent interrupt numbers. Simply ignore
> spurious EOIR writes.
> 
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 81f94c7f4a..1d0964c9bf 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          }
>          break;
>      default:
> -        g_assert_not_reached();
> +        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */

A qemu_log_mask(LOG_GUEST_ERROR, ...) call here could be useful,
do you mind adding it?

> +        return;
>      }
>  
>      icc_drop_prio(cs, grp);
> 

