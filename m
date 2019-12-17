Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5707880lff;
        Tue, 17 Dec 2019 00:55:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjIr5frjucW/4MY3ipkosN+PJa8Tk247L7eINdwC+5Du3M+4FxqPFWllxcSchw4byoTCcn
X-Received: by 2002:aed:20d0:: with SMTP id 74mr3452496qtb.39.1576572918238;
        Tue, 17 Dec 2019 00:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576572918; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsQS4jtidS51YBqcCB2TgsiasoXULPMxGDMZFhVPm8AUqncB912NHh36W5jxgF3YkQ
         TzZRTIioo6tCHnNJK2Vi9ljg0U0t0LA+K2AcJjCPJtb4atHvEN860U7ysRr1DkUm9mYo
         vJeXvoxYWOfddPRBoOaY0LofKZG77FVy+k8usN+FvZk11QKMP3D8gMorncw7n1u+fXsn
         TBlqIvazh4+yBzaHd2fIWHcV0DKqjekw2fqM7nNVLHU0rnRpdpk9cDeqGu5OT/wwv4vp
         Iu7aYqGPnjgtDKngs75F+a3zkGRrTF+XOr4q/uHdIe45hZ39HRITYQ22uqdOq0EdC6W2
         ufpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4cCzvUMPeYUWri5dkvEAVyVTWUXotoL4CI59FxQhSps=;
        b=H8C+TSqss/Kplrc+gxKybCrFr65anOZpB/yyY0dfohgdkQ9M7oPKyJEgiiWJSbNBpB
         SmR68a49HEiLd5LKauZbf4+k76NEMeK3HU72iX6QKmPruuO96PDUHWnO/Zovkf5nL1j4
         7XB6UzPLijiyJaypgP2jb//acg/ktdKXryArDkdkKv7yUPl2gyKVQ8hkOrVtwCCXuVOA
         wyDvbtahcIjBTrwqG4lMUHRGTkK/thNqwygioeYq5KvMLKj0aF0yM9+vqEtCfZQ9z3hH
         xJdRmt6Z05+VYhb3/xsYQy+Vi9m5Ryd/pHjwvx3LcPjqYNjkeRXIQo93LugL3dwkyQPj
         /5MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NcZNa7Vk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si11661429qtu.250.2019.12.17.00.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 00:55:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NcZNa7Vk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ih8dR-00023H-LG
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 03:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ih8dJ-000232-R8
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 03:55:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ih8dI-0006XQ-9U
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 03:55:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51742
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ih8dI-0006X4-3R
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 03:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576572907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cCzvUMPeYUWri5dkvEAVyVTWUXotoL4CI59FxQhSps=;
 b=NcZNa7Vknj9NIbes4BpFw3BmjBI0fPx4PLjrGUxVI9y+egpL3SIz5k7yr2OKTID1igAMsj
 r+3XgprsEjEoQH5dUy/llbuTRNuxKIEfCLAxX25VsXeW7rb36Mzc1f6CpAZYadmQyMn6Jm
 yewHloYn/hJMmcbLvtFoWerNbhmioo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-qGU9WmU4PJ6mX_u7VaknPA-1; Tue, 17 Dec 2019 03:55:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9127E18FF662;
 Tue, 17 Dec 2019 08:55:04 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10616106E;
 Tue, 17 Dec 2019 08:55:03 +0000 (UTC)
Subject: Re: [PATCH v3 2/6] hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
 <1576509312-13083-3-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9a0ca836-7c0c-d203-eb54-ca7e439f5e8d@redhat.com>
Date: Tue, 17 Dec 2019 09:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1576509312-13083-3-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qGU9WmU4PJ6mX_u7VaknPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nNJn1x2Gwtwv

Hi Simon,

On 12/16/19 4:15 PM, Simon Veith wrote:
> There are two issues with the current value of SMMU_BASE_ADDR_MASK:
> 
> - At the lower end, we are clearing bits [4:0]. Per the SMMUv3 spec,
>   we should also be treating bit 5 as zero in the base address.
> - At the upper end, we are clearing bits [63:48]. Per the SMMUv3 spec,
>   only bits [63:52] must be explicitly treated as zero.
> 
> Update the SMMU_BASE_ADDR_MASK value to mask out bits [63:52] and [5:0].
> 
> ref. ARM IHI 0070C, section 6.3.23.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmuv3-internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d190181..042b435 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -99,7 +99,7 @@ REG32(GERROR_IRQ_CFG2, 0x74)
>  
>  #define A_STRTAB_BASE      0x80 /* 64b */
>  
> -#define SMMU_BASE_ADDR_MASK 0xffffffffffe0
> +#define SMMU_BASE_ADDR_MASK 0xfffffffffffc0
>  
>  REG32(STRTAB_BASE_CFG,     0x88)
>      FIELD(STRTAB_BASE_CFG, FMT,      16, 2)
> 

