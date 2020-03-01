Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1555824lfg;
        Sun, 1 Mar 2020 10:02:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoYYWgMZB1n1LryMaEpuRwLzzquQTXyuA7qrXfVpP12AxIyvX85hQD3QM4r5s2gPjRqlu6
X-Received: by 2002:a37:4808:: with SMTP id v8mr11756561qka.263.1583085768107;
        Sun, 01 Mar 2020 10:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583085768; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXXN3LyeRObguwlrWBO/1X6pfPYUTuqqaf29N9MfJLDX8MLgpzuCZjl3DYnMWI+ICa
         nJok5T7JGONBa7v9mplQ3aasHyEkYMPmnZ9avKo0bZdh9bMbTBW69WlfodRJmmTijeCa
         2Y5uEbYsNHEL5sJlWoFQ9+K+0EnjyGnP2wm4OGIs9i5kD1YO9KeO6kTZzLuStaDsH9vn
         7hZBs5pa8JIyaxK3Darmy8Se9mRoyiTPg/UT2Gresa61GUUttf3MpI1FioPsDD9xUzRO
         xjE8MfUzftqq8vK1BaepKY6AM0gcVNY7YTlbrqNDOdr3cEmzYi/DQfCsJhOrQUy/rI/n
         4AVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LlzD60oAKSC1pVP/MvadAVwk3d13Ai9e2kxegP32/bs=;
        b=NM92133ItDgSV14N1gyJAhtFLp0eFNmOUx9m7BwwbGr43gDzH6B7q2lWxDzNdUa68q
         F9YLfR65wjxiHDObad4+lYAjmnhm71NIswWDGPwfeJV303ItCJcu5xRaqj/iDbW7Wt1x
         7e8PatHXLC1F9Cscq7O70OMEFmgTQnes0r9j2llOMnXslCjcFHYQn0JEQyKtJ9Y2c/DR
         Nmtf+zniafp1aC0vk7eFnkea3ZsUt2AkN7EByv5zYGu68TVtR99vW/4jRmVwNHJLY1AU
         IFn2QExwiuKVG3e1FviSX9/KB/UXt3JIZdEH7m4K23W2ZBPUn+20FioLEwegP11mKLx2
         r7CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TjaJVVic;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v35si4821593qtj.36.2020.03.01.10.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 10:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TjaJVVic;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8SvP-00032v-Ii
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 13:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8SvF-0002yq-98
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 13:02:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8SvD-0004Qx-Nw
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 13:02:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48842
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8SvD-0004Qo-K1
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 13:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583085754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlzD60oAKSC1pVP/MvadAVwk3d13Ai9e2kxegP32/bs=;
 b=TjaJVVicQl6YeGr4lNlZkBoIqJ1N+mmlgR/JpCEsZ1B5LeHa02wK+UzH0XeGNtQ9CC4kHQ
 jKAB4r4O9OYU5rWgMbyzsD9y4jSw02QAzLwRdZ8l3if4uOVD+McphN2wj9XgIhs82wy90k
 KQKTyQEIMmq050v4C9dIjpTwZU5TauQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-XsF9UwFTN1y11C579abZhg-1; Sun, 01 Mar 2020 13:02:31 -0500
X-MC-Unique: XsF9UwFTN1y11C579abZhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90C68017CC;
 Sun,  1 Mar 2020 18:02:29 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9297D48;
 Sun,  1 Mar 2020 18:02:27 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] hw/arm/virt: kvm: Check the chosen gic version is
 supported by the host
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-6-eric.auger@redhat.com>
 <30b6269e-e22f-347c-8e42-5af964bd14b7@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <165d40a0-8308-d4d2-e935-a7caf633462c@redhat.com>
Date: Sun, 1 Mar 2020 19:02:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <30b6269e-e22f-347c-8e42-5af964bd14b7@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2sCMFDLZ2rlh

Hi Richard,
On 3/1/20 6:56 PM, Richard Henderson wrote:
> On 3/1/20 2:40 AM, Eric Auger wrote:
>> +        /* Check chosen version is effectively supported by the host */
>> +        if (vms->gic_version == VIRT_GIC_VERSION_2 &&
>> +               !(probe_bitmap & KVM_ARM_VGIC_V2)) {
>> +                error_report("host does not support in-kernel GICv2 emulation");
>> +                exit(1);
>> +        } else if (vms->gic_version == VIRT_GIC_VERSION_3 &&
>> +               !(probe_bitmap & KVM_ARM_VGIC_V3)) {
>> +                error_report("host does not support in-kernel GICv3 emulation");
>> +                exit(1);
>> +        }
> 
> Indentation is wrong here.
OK
> 
>> +    case VIRT_GIC_VERSION_HOST:
>> +        error_report("gic-version=host requires KVM");
>> +        exit(1);
>> +    default: /* explicit V2/V3 are left untouched */
>> +        break;
>>      }
> 
> I'd prefer to just list V2 and V3 here explicitly, instead of the default.
> It'll be nicer with gic_version changed to an enum.
OK I will respin with those changes.

Thank you for the review!

Best Regards

Eric
> 
> With those changes,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 

