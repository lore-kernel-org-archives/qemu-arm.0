Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3476170lfb;
        Mon, 13 Sep 2021 01:56:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh2gEWb/fuQDUJRniEyc7vvjb00LfLqWbBIQ/W96YGJ5lQ72KHwoza/CApUvI2JwcTmCOo
X-Received: by 2002:a25:7108:: with SMTP id m8mr13515235ybc.246.1631523413981;
        Mon, 13 Sep 2021 01:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631523413; cv=none;
        d=google.com; s=arc-20160816;
        b=mIxJgBybGxg4G52qVDd/xVtHuvlUH8faqbXPXblfRj7uaL2i5f0f60SclR033qAGEM
         PYcOPS5KN6YVtQbZ9svniaV9YMIMtfYiRyWIS+hjv83DH5gtG6N6zwMc7crqdteeqFgC
         zXx8lTycb7AuJy8aQUv4r8RtZU/iHMStatuj3Rl+0rZGiEJK1UJ12lomhUasWw3niZm0
         WAVF8nRAPoUm3r87VJKmrXhVxCn+lzNK4LurYtnptwK46QQAI1oAbGH4iVQe2JVD8PPT
         hdClt/kwEiPiEOp1ujuF/OKgGYRzPIZ8bpKyg3zo7BZ5Rx8TMjsUSlR3JcHecvOGQuZ6
         tEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=E5hFUVs24VYsA3vfOE9B0IObPKU5ObfXxWNqtDFASms=;
        b=nUBgLK4L2GaEbdnu4dT2MK3+AKyBT+e+PNZThffLtPkdWjAXfIskU3YfrfWq9KpI7O
         ndeYsHb0YIInZDgku0PPMrtQ2/fB7Syuu+md7Pw9zFJVQTrqdIRwej6CvwkEyUPZfHLv
         NbsJorWMqBRMDExUaMMeXvoatib5KRKkmui28aRUwJz1Xok59g5HdKfOrr0hZgEDug+V
         m++F0hXON7WoT+uGJ4A84XQNkPPKCqwtxfcG054Rfc9b5QfWmUJ+Nkju/HXzXrzmyFDh
         3QRDeUzQOgdhBeWG7atyWCLPCmeAiQ5Cch1ut2dNy9oi86auxopxU/WcIAB1w9YWmtT8
         YH+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BkwcIzGh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l79si193009ybl.346.2021.09.13.01.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 01:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BkwcIzGh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPhlj-0001uJ-Lt
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 04:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPhjh-0008KO-Ph
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPhjb-0001UV-8c
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631523277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5hFUVs24VYsA3vfOE9B0IObPKU5ObfXxWNqtDFASms=;
 b=BkwcIzGhDBZHOZWM+vlPjbFydQKY9x8Nb/oSDGmk+MGyyKTlDkoIbWNoKYmn1ooB5vsUuE
 5AAxAWpDE3PUshw1l6gsfy4+D88MX8JcQRuoT9MNq1zc1xHc14hrTZ+40GIi2K60nC46/E
 4CeH2Yj7e2SCjcQE32DlQeC4cSTFLLE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-lUw--bkDMcG-pAomg3uN6Q-1; Mon, 13 Sep 2021 04:54:36 -0400
X-MC-Unique: lUw--bkDMcG-pAomg3uN6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so2427152wrs.7
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E5hFUVs24VYsA3vfOE9B0IObPKU5ObfXxWNqtDFASms=;
 b=fkNOZ9UFTDACGL6jsc/GGToGjPE+aeSYuK+si2zif9fc97pR+kel+fZAZeZOXaCkBg
 J+6jlA1VLZbFmfeK1MvIQdmurHJDjis7Tyl1EKnKGwnMECxhGUswR79c9Mr69c3rMkfJ
 rpWmDiJa5L+LabzVLsRgY2cx70DjCNNz2qoxUGM7fkfAcC4e+VW1LU0Aeg7Jo34ytGMN
 eEHIlfyWiMfVLkLD5UfpDUcTMtR6w1KaTbkcIpUNtJ3+hsz6vgQf0gQKJywx4YWjx+31
 CZqh2nVb6ES+CQOgGEPr4McWhbUSVWaLRLh9il80FyVYHB0SMTmUu7875yffq5tqmtAt
 aeaQ==
X-Gm-Message-State: AOAM531a4KVs4wnzrA35C3nOUENB4C67w1KZO2owKI7uer2SsrUKgaM1
 9uenevIaR+6K6fTzBN5m1nWaIaRwRmye09GSzhmnHM2If2HJ2az7dF1m4TK1iUDp/LKuc5RKBpw
 8nIDvK/bLA6mE
X-Received: by 2002:a5d:5003:: with SMTP id e3mr11423662wrt.118.1631523275220; 
 Mon, 13 Sep 2021 01:54:35 -0700 (PDT)
X-Received: by 2002:a5d:5003:: with SMTP id e3mr11423647wrt.118.1631523275029; 
 Mon, 13 Sep 2021 01:54:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d24sm6223556wmb.35.2021.09.13.01.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 01:54:34 -0700 (PDT)
Subject: Re: [PATCH v9 06/11] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-7-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3a43615c-4367-86f0-f226-2be6eafad3cd@redhat.com>
Date: Mon, 13 Sep 2021 10:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912230757.41096-7-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LlQLbC/l8kbi

On 9/13/21 1:07 AM, Alexander Graf wrote:
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
> 
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

> ---
>  target/arm/cpu.c     |  9 ++++--
>  target/arm/cpu.h     |  2 ++
>  target/arm/hvf/hvf.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/hvf_arm.h | 19 +++++++++++
>  target/arm/kvm_arm.h |  2 --
>  5 files changed, 104 insertions(+), 4 deletions(-)
>  create mode 100644 target/arm/hvf_arm.h
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c

> @@ -2058,15 +2059,19 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  #endif /* CONFIG_TCG */
>  }
>  
> -#ifdef CONFIG_KVM
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>  static void arm_host_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>  
> +#ifdef CONFIG_KVM
>      kvm_arm_set_cpu_features_from_host(cpu);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>      }
> +#else
> +    hvf_arm_set_cpu_features_from_host(cpu);
> +#endif

Could be cleaner as ARMCPUClass::set_cpu_features_from_host()?

