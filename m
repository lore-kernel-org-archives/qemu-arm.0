Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp184430njf;
        Tue, 13 Aug 2024 09:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcjH6CLLZuZVINfQMZiBJZqh1LkM0Fl7CnK8LYKjVYdf+ne8s9qYpGHjfp+ywDr3MCDz1m+DrlVu5EjW7o6SYKfYCXYXm0
X-Google-Smtp-Source: AGHT+IHHOHCmTK+Jq1X2StIR4bgumvTFSNkWVJgGmS1drXpu4MF9Pg/fj1+p4TQSWzD+1AAihYn8
X-Received: by 2002:a05:6102:e0e:b0:492:9ef9:9d1b with SMTP id ada2fe7eead31-497599d9241mr168699137.22.1723565389313;
        Tue, 13 Aug 2024 09:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723565389; cv=none;
        d=google.com; s=arc-20160816;
        b=UIj5HjVZjigNCl/aV2DgoFfqbKXPV7aszITt/Zm/h/D+8ZUxYiaOK6uWTdPolUMQRt
         QOfnKR1b4U66WtitAWFf82cVkNgNykW+AO11G5kJnpg+CbPzxbXDGNremAgSXApqbTQu
         T0vDzN/EjQWNAk7OkItrKEKinDIRSDTy+idDdlpD5VbrrrRi1vNzYC3SaiGgGOUzNYL6
         LD8T+/Pw1CIHgq15z9o2zb+J2ASJ1GqruhW384hfhRn768aOHQSGQqRc0qccCrpGQOvX
         PT78XGYvnkERrPTMTaBYdDIi/je/Of0xo3gZYHL6M64xFaaOqV0mZ+9BXHI42dA73gyM
         oCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qVAVpyas4xXT0chItzS34DPuEZHElpSVb9SbyKoorik=;
        fh=jKMKH+yX48QI/FiD231fjOU969Cy8UENm8+YPqLuYvo=;
        b=ses/4DuDXRFF1X2pKxcaNpSb69DqkuYsUYJijbV8Dptfwa1rg2qS1EI8uLbir1lUN9
         EcrwK0CpMHpoyIe19gGQ5DzU/BAmJ7syScAEbk+PKvCGZl+UmXK7+TFTylLChe7+Tb+3
         gmExp8/gz/3QN3y3X10g24/L9SSPazag9Wae/o5zgxzuCEV9WkUT9V8HKsPEWwARb5El
         bpEUa5JBmh8GWIOH3CxTYH0X/WxMowSYhQ6NVEL3LdeQQNp5SY7ij7Nu9H4wyw6uIZQn
         gHoK78HflvViDHEjOjBpvyepXXnR6wGUFmBskSejA5ZJbcVGR8sYBGI2XkUuMPpzpyvu
         5ZfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=amJgDe7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4970a0e9e6dsi1338665137.244.2024.08.13.09.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 09:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=amJgDe7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdu5W-0007Su-4K; Tue, 13 Aug 2024 12:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sdu5S-0007RZ-06
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 12:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sdu5P-0003Sq-A8
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 12:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723565365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVAVpyas4xXT0chItzS34DPuEZHElpSVb9SbyKoorik=;
 b=amJgDe7Lx7H8IwXaGYjv1YdFAQ6HORl/nW7nh5GD5vLQOJ+nbjZltZygrhDE/tXa0QlxWe
 WEOZDQbTARAyiknXQRTsb5XJehwd3okipWwOQV+IQUYkTUqgPN1JR3wXFxSqB2Cl5ePHNA
 vB5BSaDLGHdGQ+n4ZnwscDKVySRjMZY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-lyDonvXXPUaDvTPn5I9heA-1; Tue, 13 Aug 2024 12:09:22 -0400
X-MC-Unique: lyDonvXXPUaDvTPn5I9heA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52efcb739adso6132409e87.2
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2024 09:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723565360; x=1724170160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVAVpyas4xXT0chItzS34DPuEZHElpSVb9SbyKoorik=;
 b=g8aNt15KV9je+5f6QQlcBoVwwMqG6CWnRkN1UhEbFVOEbjMQkCUD74qN3RObaGGEzv
 XvaoRjsD/bGHqhJV3zMPgBlXIpb+oSUSl1scW74bUyBsLgxP2H3pjtJJB/A3P42Kx+Zu
 ijB8rZErmtS1d77ZNmBS/ubfgKP2dNhO/LqF21X358li5sxDKltwBhucb0ae4PICGQnZ
 pP3Flx831Jj3ydbjzSoP2SK/2wuwqLMtM5lj8yVDdo3D4AfiMhVwhEZvhlDMm4zuQKRd
 t9iOAmwNAeoh0BqW81/ZtsuC78w6KYqK//U3bjjANewv5XFo5kEQ7xzCiLbPnCATi/7p
 HeNQ==
X-Gm-Message-State: AOJu0YyndsRFM2QJA4cIduIAkQGy5haCxXnqHXrZfwPGK/50JjYNLsVb
 O9oNXl60tZlFNV3TY9yYZ8u92CvZcq9dNwIn8hNxUnNgWce8vZzzQtpspmslgclRVO2F181GtR5
 JKCp0WJng6QCWzEGYg1rcyUzWjrmgP/DIu4JPM3wXh0mI8Qm2tHfUFFW6Wz1Z
X-Received: by 2002:a05:6512:2351:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-532136a3035mr2250509e87.56.1723565359602; 
 Tue, 13 Aug 2024 09:09:19 -0700 (PDT)
X-Received: by 2002:a05:6512:2351:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-532136a3035mr2250486e87.56.1723565359000; 
 Tue, 13 Aug 2024 09:09:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4e51eb3csm10778187f8f.69.2024.08.13.09.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 09:09:18 -0700 (PDT)
Message-ID: <ef1e5fd3-0121-4b00-8917-09d8bf688333@redhat.com>
Date: Tue, 13 Aug 2024 18:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1] docs: Fix some typos (found by typos) and grammar
 issues
To: Stefan Weil <sw@weilnetz.de>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Eric Blake <eblake@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240813125638.395461-1-sw@weilnetz.de>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240813125638.395461-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yOsKKHQnzmd+



On 8/13/24 14:56, Stefan Weil via wrote:
> Fix the misspellings of "overriden" also in code comments.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  docs/devel/migration/uadk-compression.rst | 4 ++--
>  docs/interop/qemu-ga.rst                  | 2 +-
>  docs/tools/qemu-vmsr-helper.rst           | 4 ++--
>  hw/arm/smmu-common.c                      | 2 +-
>  include/exec/memory.h                     | 2 +-
>  qapi/rocker.json                          | 4 ++--
>  qga/main.c                                | 2 +-
>  7 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/docs/devel/migration/uadk-compression.rst b/docs/devel/migration/uadk-compression.rst
> index 3f73345dd5..64cadebd21 100644
> --- a/docs/devel/migration/uadk-compression.rst
> +++ b/docs/devel/migration/uadk-compression.rst
> @@ -114,7 +114,7 @@ Make sure all these above kernel configurations are selected.
>  
>  Accelerator dev node permissions
>  --------------------------------
> -Harware accelerators(eg: HiSilicon Kunpeng Zip accelerator) gets registered to
> +Hardware accelerators (eg: HiSilicon Kunpeng Zip accelerator) gets registered to
>  UADK and char devices are created in dev directory. In order to access resources
>  on hardware accelerator devices, write permission should be provided to user.
>  
> @@ -134,7 +134,7 @@ How To Use UADK Compression In QEMU Migration
>    Set ``migrate_set_parameter multifd-compression uadk``
>  
>  Since UADK uses Shared Virtual Addressing(SVA) and device access virtual memory
> -directly it is possible that SMMUv3 may enounter page faults while walking the
> +directly it is possible that SMMUv3 may encounter page faults while walking the
>  IO page tables. This may impact the performance. In order to mitigate this,
>  please make sure to specify ``-mem-prealloc`` parameter to the destination VM
>  boot parameters.
> diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> index 9c7380896a..11f7bae460 100644
> --- a/docs/interop/qemu-ga.rst
> +++ b/docs/interop/qemu-ga.rst
> @@ -50,7 +50,7 @@ Options
>  .. option:: -c, --config=PATH
>  
>    Configuration file path (the default is |CONFDIR|\ ``/qemu-ga.conf``,
> -  unless overriden by the QGA_CONF environment variable)
> +  unless overridden by the QGA_CONF environment variable)
>  
>  .. option:: -m, --method=METHOD
>  
> diff --git a/docs/tools/qemu-vmsr-helper.rst b/docs/tools/qemu-vmsr-helper.rst
> index 6ec87b49d9..9ce10b9af9 100644
> --- a/docs/tools/qemu-vmsr-helper.rst
> +++ b/docs/tools/qemu-vmsr-helper.rst
> @@ -17,8 +17,8 @@ driver to advertise and monitor the power consumption or accumulated energy
>  consumption of different power domains, such as CPU packages, DRAM, and other
>  components when available.
>  
> -However those register are accesible under priviliged access (CAP_SYS_RAWIO).
> -QEMU can use an external helper to access those priviliged register.
> +However those registers are accessible under privileged access (CAP_SYS_RAWIO).
> +QEMU can use an external helper to access those privileged registers.
>  
>  :program:`qemu-vmsr-helper` is that external helper; it creates a listener
>  socket which will accept incoming connections for communication with QEMU.
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index d73ad62211..3f82728758 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -674,7 +674,7 @@ error:
>  
>  /*
>   * combine S1 and S2 TLB entries into a single entry.
> - * As a result the S1 entry is overriden with combined data.
> + * As a result the S1 entry is overridden with combined data.
>   */
>  static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
>                          dma_addr_t iova, SMMUTransCfg *cfg)
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 02f7528ec0..296fd068c0 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1852,7 +1852,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
>   * memory_region_unregister_iommu_notifier: unregister a notifier for
>   * changes to IOMMU translation entries.
>   *
> - * @mr: the memory region which was observed and for which notity_stopped()
> + * @mr: the memory region which was observed and for which notify_stopped()
>   *      needs to be called
>   * @n: the notifier to be removed.
>   */
> diff --git a/qapi/rocker.json b/qapi/rocker.json
> index 6950ca9602..73c7363b16 100644
> --- a/qapi/rocker.json
> +++ b/qapi/rocker.json
> @@ -42,7 +42,7 @@
>  ##
>  # @RockerPortDuplex:
>  #
> -# An eumeration of port duplex states.
> +# An enumeration of port duplex states.
>  #
>  # @half: half duplex
>  #
> @@ -55,7 +55,7 @@
>  ##
>  # @RockerPortAutoneg:
>  #
> -# An eumeration of port autoneg states.
> +# An enumeration of port autoneg states.
>  #
>  # @off: autoneg is off
>  #
> diff --git a/qga/main.c b/qga/main.c
> index b8f7b1e4a3..50186760bf 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -257,7 +257,7 @@ QEMU_COPYRIGHT "\n"
>  "\n"
>  "  -c, --config=PATH configuration file path (default is\n"
>  "                    %s/qemu-ga.conf\n"
> -"                    unless overriden by the QGA_CONF environment variable)\n"
> +"                    unless overridden by the QGA_CONF environment variable)\n"
>  "  -m, --method      transport method: one of unix-listen, virtio-serial,\n"
>  "                    isa-serial, or vsock-listen (virtio-serial is the default)\n"
>  "  -p, --path        device/socket path (the default for virtio-serial is:\n"

