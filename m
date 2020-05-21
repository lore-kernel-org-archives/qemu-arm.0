Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1436079lfb;
        Thu, 21 May 2020 03:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLyn9lcRQuacenwHsPsk6txWp3cr196keanz+M5kxD5S43Z1/y7d9aimq6P6ThPC1vDbW+
X-Received: by 2002:ac8:47c4:: with SMTP id d4mr10129316qtr.110.1590057463133;
        Thu, 21 May 2020 03:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590057463; cv=none;
        d=google.com; s=arc-20160816;
        b=BXoQCAsfcWjNvzTtlB828Qc/scMGrMaSiGCyrx5sjtl1gnHEvCz2AzEBT5Wy/J3Ka1
         9eYuxtboWYOyVqJUtoiribRwabL7Ao4rbUt7WfZ3TdLW49GtGNsqnBsqtM5WOxbqNv7M
         h+ve7DliMgwTMV9+0xDcoK4whzsqt05FoVG3GDiMCTGEL8mGQ1ECPeSd3TnGCLWeLp7a
         RI3NwZB2i+SdMNUoCOf1EP8RsrBpb7RP2VjIMliIMqiz8kRPLp+gSQ7fWzJWCPcZ7QWQ
         6vB4ZIQmlcEoS6k9tndNmBYTobkq32I7RqyOFQMFaxhPadAgT5FQCtnLc7JttWiEoVbB
         SUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=+2fs3cG+8vtlMMq9nJxJkMA+F7IRdFgVKcZa1gOqxJo=;
        b=PXOh8wd7Sbn7rdk2VPSL7EEAsaS3oQ9r9DoJQK3idyibidwx4TtzSJU0qy7wW/14Tp
         D7qBAHlZiHqaolbOdd8d+7UNH7NX0wtEvWzbvsQ2qh5bGCiurl5J3eW/sKTQvtIz6R1w
         oXe6qhPtBQXm9Pwj/AC/AvsQlCUckwufg1Aa6Qe2perhgXJpNu+rcXUI6Ew63ksuZ6FZ
         T6tnNHOytg4IbDOyqes2P+P21pt7OWDcK9/JitOowNEaaYfTqQmTUCuZxoEIv7CR2BAa
         JK2LNQeS6LcEKaiLMyea5NnEMiD13X8JbWrgAA4qAlZJpv2PWR8u9a6onPIThoS0ynrK
         VwSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I6eyEqHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 75si3114182qvc.160.2020.05.21.03.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 03:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I6eyEqHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbia6-0006G6-Kk
	for alex.bennee@linaro.org; Thu, 21 May 2020 06:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiZE-0005I9-UX
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:36:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23082
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiZE-0004vR-7W
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590057407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2fs3cG+8vtlMMq9nJxJkMA+F7IRdFgVKcZa1gOqxJo=;
 b=I6eyEqHaf3igrdh0YnbA9Wb+NCMQAEFE/3YDewXE077+K96qOLn/bA61x/AkNp6qB5wFrP
 ip1pCqMInZhe773e6DqU62UevyoLtV2XXSS7mZFxCI08EYfIhDGe7iAD8VA5Aab8Zt9z99
 QdUbNbRxf71y5rfmnC2ZLZkhbRFYndo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-pK472VI4NHOmn_r8zP5zbw-1; Thu, 21 May 2020 06:36:44 -0400
X-MC-Unique: pK472VI4NHOmn_r8zP5zbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8E41872FE1;
 Thu, 21 May 2020 10:36:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B44A79592;
 Thu, 21 May 2020 10:36:29 +0000 (UTC)
Date: Thu, 21 May 2020 12:36:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 22/22] [RfC] acpi: flip default to off for microvm
Message-ID: <20200521123624.4f50fcf7@redhat.com>
In-Reply-To: <20200520132003.9492-23-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-23-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sX6Ezg84iij/

On Wed, 20 May 2020 15:20:03 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 602c6a8f75f3..b5c445b5403b 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -517,6 +517,7 @@ static void microvm_machine_initfn(Object *obj)
>  static void microvm_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    X86MachineClass *x86mc = X86_MACHINE_CLASS(oc);
>  
>      mc->init = microvm_machine_state_init;
>  
> @@ -537,6 +538,9 @@ static void microvm_class_init(ObjectClass *oc, void *data)
>      /* Machine class handlers */
>      mc->reset = microvm_machine_reset;
>  
> +    /* acpi is off by default */
> +    x86mc->acpi_default = false;

Since we don't care about compat stuff for microvm yet,
I'd preffer default 'on', as in long run it allows to boot larger range of guests
without need for tuning QEMU and guest configuration
(i.e. it's the least troublesome case for ordinary user)

> +
>      object_class_property_add(oc, MICROVM_MACHINE_PIC, "OnOffAuto",
>                                microvm_machine_get_pic,
>                                microvm_machine_set_pic,

