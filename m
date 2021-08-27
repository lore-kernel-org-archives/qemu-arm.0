Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1707459lfb;
        Fri, 27 Aug 2021 08:51:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq2TSACttL1o8nt5joVYnfGnNaD50QZFMECrBjGj3wFPF1hHyl3CVsBbAyVIFxjuRH2FWT
X-Received: by 2002:ab0:209a:: with SMTP id r26mr7547685uak.14.1630079482145;
        Fri, 27 Aug 2021 08:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630079482; cv=none;
        d=google.com; s=arc-20160816;
        b=VWHgGjYOUsk+nSse1gFha91X62baRCF/VVIMUV0wLLDim9CgkVnhFapFN+lw7CCOm2
         XgLHVZ7celMGGXTdm3vXXPLvsFpFYzkcsBAf+AFAzrzbeErbWzPeDiYm1UPKHnDXU+Zi
         uPrNIadAxXElLI/lGmwOhMfNftOOY6wlgOvq/k1xFMckqxGlIjFVeyHSPS1XutyHqKVO
         ATyRIttcnx/UgBLWCyJhczM2gFmeTe1hR6R1v6q5pjqFwRSDCLsFBzaSweBFNU3KM99K
         BlGrYml/kEt05tbjg6cb9fBmWzgP3kEC9i+NVvREgtkgP69J6nnTd0cIB37R2nSiWC2S
         Y9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AVXPcUpaM7EsaIiaWnM1MAa8KIKcgFARZPli8KEmoEs=;
        b=ZephLOla8mCK2BbVZxa40OC0Q/Biwe2PS367S7b8IWWv4yGm5cDcbmrmAjcr1Cc4aj
         6TiTMJSjCNJG5i/9uZqxxNP1wXZzCs6hnXwd19QXhehqA5d2zmHjZOOVC+N6U4/HZ4BN
         63+nAX7bZqGNMQuTQo+8/IjubvEav9s2hTB0PymOfpVIxqxFIHaK+7h/v/EjVhxkAMEV
         AxkLcHQSIZCLTWCexhNfu6Uz1IAus0ehdn3IgB+hL1Rk0/7kNhfstbGlZfgRKzqzmhKN
         KWs6XVuWbuo1iimkysdS5xyWv/UJyL03r69AuqMLIn2nLKzzCRvEmJH+UO54ww3AI2o5
         zp7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IMrG0Dax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si3136776vsp.278.2021.08.27.08.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 08:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IMrG0Dax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJe8X-0007Bn-Ck
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 11:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJe75-0005Ta-A5
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJe71-0007wq-Qx
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630079387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVXPcUpaM7EsaIiaWnM1MAa8KIKcgFARZPli8KEmoEs=;
 b=IMrG0Dax45bdOUJLCEzxzvBFYc92wwzZvp8+iMeKsGOKuGGerE4TtRwaI8QogAnPq7t59F
 eb2lo/AsB6dpR41/3AKvcqEIXZMJo9/zBvbNedShRbIUuDnJNLXn4PmWznpvaDy1QWvZMr
 o1mRmz7vblxsIG8zA8DZ8XuHi4vKi4M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-M2IDxM7BPwiIQf30T_ycxg-1; Fri, 27 Aug 2021 11:49:43 -0400
X-MC-Unique: M2IDxM7BPwiIQf30T_ycxg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so6060509wmd.2
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 08:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AVXPcUpaM7EsaIiaWnM1MAa8KIKcgFARZPli8KEmoEs=;
 b=HmyyZC6SOZZf5IHe+3U9z4qeOmSJRTYP+rce+GzKoCnR7RO6wO6/8keHvWjt1Pj2q5
 MYgz+f2Ck9vpOqARGwIkjzR/ZDO9AjofrMzJK1q0CzfOfy4aGaJ0blm6Hvcp+7Q3pWTZ
 sOVLx/PfgxFMfnWVmB3WHBv04zz1xkUHut85ycq4QtoJ+PLdHSubOMfV23F1YgmcBsnb
 w85298O1NOXIkxts5Jepznf0WHCLHLWWZpUKRF2w1JVR1CmxVBb0sUKnIIcVj/voQOXP
 QZH3H77P0fFKEwx1Nx62nkznxcQVxCrbrZKq7J1pIjYCw7tXivHmBSPFFILfLxtM9ksN
 2TZQ==
X-Gm-Message-State: AOAM532QWVEBZe6lh7F/Jnr7aEiolAcAO0alm8mgtrDXuDEp2T9UmzUW
 WhvpB49vshFdgs9lU5qIk0lxSVWWrsi9TO+AosFtNZ75eMVS+obJEhtuZ+di/FQtSMBvuCU/5ct
 7crq5E+oOooE6
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr11079328wrw.366.1630079382585; 
 Fri, 27 Aug 2021 08:49:42 -0700 (PDT)
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr11079309wrw.366.1630079382362; 
 Fri, 27 Aug 2021 08:49:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o34sm11696364wms.10.2021.08.27.08.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:49:42 -0700 (PDT)
Subject: Re: [PATCH 4/3] gitlab-ci: Don't try to use the system libfdt in the
 debian job
To: Thomas Huth <thuth@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20210827151718.178988-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a5703232-ed43-3f15-9b47-bd0d7bbcf704@redhat.com>
Date: Fri, 27 Aug 2021 17:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827151718.178988-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.437,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WFkUPY+uXNnz

On 8/27/21 5:17 PM, Thomas Huth wrote:
> libfdt in Debian is too old to be usable for QEMU. So far we were
> silently falling back to the internal dtc submodule, but since
> this is wrong, let's remove the --enable-fdt=system switch here now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Sorry, I just noticed this after sending out the first three patches already
> 
>  .gitlab-ci.d/buildtest.yml | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Philippe Mathieu-Daudé <philmd@redhat.com>

