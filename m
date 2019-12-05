Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1732040lff;
        Thu, 5 Dec 2019 00:37:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgFTh6h+NjwPb8/E4HQBSx5TBP/BEdVJyxDNc93yr8FOXZSoWKxqQpM6HdFlZp6TEPTuQ+
X-Received: by 2002:aca:5487:: with SMTP id i129mr5941136oib.167.1575535071482;
        Thu, 05 Dec 2019 00:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575535071; cv=none;
        d=google.com; s=arc-20160816;
        b=VZpIT+Dcql+a35IPplWf/kvPie4spNPoOXYEtRYlVIioOqKU5nrylglEsZGEeR3fCD
         OQq2VPYIx4A0tWjoBl/CES1mxYYxtX+Up9x3r8o0HUtkQJ0YFdLR1uB8E8MC2Czul8/B
         zYNPhTlm1qUCqHqGmsFcvzx4qXjsp/xrHa4KP1orCrAyhAQK/1Tsiquro5EYD+d/TB7b
         e68bVJjvvTt0PHM1fEuK1bYwaRiHG8++Q1LOaoPlV0AZsPG7vpV9/Zn5LnfsigedHU2I
         0pSAfo9k0/apggiWKMNk0HRRptaeQAgKC5IWEkrfaZuPdHF5Rjm+211SVYVK6iyiVA93
         3XEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gjAx9qo7unBhZw8XOGVCMog1QrLyKDuC1ZKnNfrR6Ic=;
        b=JXAD2ULoPeq4ESODFihRrlR4j4hPJJBps+/e/L9wDG1xjET9tQD/tgozzqkm3yiSgB
         DeymFKDPulsXKv2aERg4c/TY/4igaubQSALvSLs33xZ2Eu0SsGjoNC08AT04tS58hyfX
         KlbChIlQXjzi/YrsQt9pJSTJMjahWoU8S7gICrlrUX27W6YAM2XAyeHuhkFsQxAFniXg
         XUE96FoQIaThzwB61r/Hw7W9S+2If5AvASDtm4BFBJZJ+AoKtjicWsHjpK5W3XH7GW1v
         MzlnLOdsQ3/LmxHHqvQyPik8yALzdHjmD/DgiZ3IHx6ysIzlyZiKAUYVrdu7utkU3UO2
         SGXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DVqcGIHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 46si4723349otu.11.2019.12.05.00.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 00:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DVqcGIHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icmdy-0005md-Mq
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 03:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1icmdk-0005hr-Ic
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1icmdj-0007Ys-Dz
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:37:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54164
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1icmdi-0007Q9-6b
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575535053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjAx9qo7unBhZw8XOGVCMog1QrLyKDuC1ZKnNfrR6Ic=;
 b=DVqcGIHJWtKbaTpkjVYQzoiUk5xIKKErUcsmSlZ4E5uGlE13o2RouHBUGPQTgxDrulo4jc
 Iv2Y2QvKsisyhfkMf0TgVRc++Vffztp8Ea1ECtUJZMZkJpRa18KrAHY60ma2nMY28QDVh+
 rXwGPOPK1fFtFf9txKc/Fr93D8Afdfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-KrgiRwe-O-WdUIogmUeZOw-1; Thu, 05 Dec 2019 03:37:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46541005502;
 Thu,  5 Dec 2019 08:37:28 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C13B517AA3;
 Thu,  5 Dec 2019 08:37:27 +0000 (UTC)
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Use correct bit positions in
 EVT_SET_ADDR2 macro
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
 <1575467748-28898-5-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <56987d35-a6cc-e9dc-b216-efae755a9fe0@redhat.com>
Date: Thu, 5 Dec 2019 09:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1575467748-28898-5-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: KrgiRwe-O-WdUIogmUeZOw-1
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
X-TUID: 84rRKrLoClQL

Hi Simon,

On 12/4/19 2:55 PM, Simon Veith wrote:
> The bit offsets in the EVT_SET_ADDR2 macro do not match those specified
> in the ARM SMMUv3 Architecture Specification. In all events that use
> this macro, e.g. F_WALK_EABT, the faulting fetch address or IPA actually
> occupies the 32-bit words 6 and 7 in the event record contiguously, with
> the upper and lower unused bits clear due to alignment or maximum
> supported address bits. How many bits are clear depends on the
> individual event type.
> 
> Update the macro to write to the correct words in the event record so
> that guest drivers can obtain accurate address information on events.
> 
> ref. ARM IHI 0070C, sections 7.3.12 through 7.3.16.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/smmuv3-internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d190181..eb275e2 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -461,8 +461,8 @@ typedef struct SMMUEventInfo {
>      } while (0)
>  #define EVT_SET_ADDR2(x, addr)                            \
>      do {                                                  \
> -            (x)->word[7] = deposit32((x)->word[7], 3, 29, addr >> 16);   \
> -            (x)->word[7] = deposit32((x)->word[7], 0, 16, addr & 0xffff);\
> +            (x)->word[7] = (uint32_t)(addr >> 32);        \
> +            (x)->word[6] = (uint32_t)(addr & 0xffffffff); \
>      } while (0)
>  
>  void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
> 

