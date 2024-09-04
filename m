Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp62315njb;
        Wed, 4 Sep 2024 03:11:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVESiKGP6Albxvx4W6DsiFy8FJbAIUBBSAda9iJz0k2/7M2mnXJD1y0Pul5WsR8NtbUaq2+qzsOO2AQEg==@linaro.org
X-Google-Smtp-Source: AGHT+IGYKYa28KIkWaNuY4IeRCp89tc9Umj4LNzBah8wxY6UeJE9HIv0rrkxHVH2s1KKmjgKp0aC
X-Received: by 2002:a05:622a:400e:b0:43f:edde:7a55 with SMTP id d75a77b69052e-4570ec43629mr162936881cf.28.1725444709514;
        Wed, 04 Sep 2024 03:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725444709; cv=none;
        d=google.com; s=arc-20160816;
        b=qmtGy4hLgZHV4FQHCf9WYjIS34PWsJ/2csZ0kUFLWO0lgr1nn0YU1akDrRwfgdgh+b
         FEqHqcE/jY7VfzoMyjhaUQ7qTBuug3VMsOfgTYEj1C5uOSBe7Pd2O9I54PM9/wqVKFXY
         mslghElVSl52NKjoac+rUAbrg8L4hwnfhu3dcg2BzR0PQQa/vcdfCvtwx7epgZ04witf
         7YAa78IhngCt+7bcFseV3c8XGZtMzRSMexD8ReXY68yLDQ/cm4OPnAQHtw4OQniRzLYZ
         h0kQccBS6VzMHz6wHdCyPv92nAPToWuPThrwWMLJKpewZTcfko3MRDY/+egpfS717zr8
         hN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2ZPdNciBE65ElgRIxJc7LxDi4AspYkkrfuaGnmXwUQE=;
        fh=hfb0j9ySj4YdMGUJZyoLGb4sdcqriCrn/q1BgLluqrM=;
        b=LH8cF0ZoBCJZHhyUJ/hfzEjxZmGtVN9RlAOjDtC2vUCdEAxGY9ugU4FcC2tBlq1gRP
         sHyHLlgi2+9H4yMAsK0lqOkqz1sY/Q6VbUwGrzD4VfKDzPrfvRSA3gE2CVi12x1BWqJx
         vkYDV4WqrVujSrqtkCg5/Zrx6boQdu04fmoU2v3Vr8xpwYMG5j3pdpCDZUAxPphW7gEp
         j2tpkFiruYxDnyzD6jqPXOacMqTPKgvstD0P3KB274DKf2XcMaD2Y16m0CssUCovv2Lw
         vptjYv8kD2V4tJWa+PE3Sn3JDCmw9ARc/WfqZ+jj7JQ9+MtrHQRpYgd4GH1RMkvjuy1G
         eLcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gk+LWuwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-456866a2040si139505521cf.752.2024.09.04.03.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gk+LWuwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmyw-0006Rk-Tv; Wed, 04 Sep 2024 06:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmyq-00061l-L3
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmyp-0001S9-2L
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725444673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2ZPdNciBE65ElgRIxJc7LxDi4AspYkkrfuaGnmXwUQE=;
 b=gk+LWuwNBIYfi+jTwH/v3KbqXQJt2tuj9b4T4VOjbdYVor7UryhgkNM9Xf4TuY+nNGi2fZ
 IZGBObIa+/JlxpDofuvAgFnVCPP1c/h9yUHN0SleJ9kO92IzS66ATPVPP90fwUptEOQKaq
 Mg+Y1kpmQXA54Q/+oclj8wXN0v1Omjs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-AkPVCfhzPECHvaEH9wENnA-1; Wed, 04 Sep 2024 06:11:12 -0400
X-MC-Unique: AkPVCfhzPECHvaEH9wENnA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c9b0daf3so1897852f8f.1
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 03:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444671; x=1726049471;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZPdNciBE65ElgRIxJc7LxDi4AspYkkrfuaGnmXwUQE=;
 b=Y8Gn3dt+ICXfK/5Qi7Rhdm3OO8vXELUjDOX3y2wFchW2eY2+osop9KAiLioOBkrc5a
 ipSTOGNq7ph6ncXJdhdYLScfUd5kuOC4H7Tc/1IEegq0Wz7w+xGDBnFHoxQr/Fvpo33y
 uNlNU57dA1D3zMfEUVQqphHjnO8drcLj3ZNEs0+FwVG8nwyow12fneQEI4SkqclWdil+
 U+s0xYzmOwJLvPHgxFqYaIunRmP5jEzimK9wm0ahtioEjJ14YSdppA4dWsea8dKFX6aw
 LgpG88gkW7AsmnO661Db88P+TCNQiWYU67YFs/ioRVsVMyF7zax3yVvHbu9ZoQ2p5OCV
 XDIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8j06AIhqOVgA+4QH+cqvmNgDlZPLWc4mOQCjr+9D+1NewML8HVGDd9n+mQQk0dzIKSTw0LvQ/Xw==@nongnu.org
X-Gm-Message-State: AOJu0YxnI1K2T71MRILbWSBrPpXNOFZMDDTz0qGiYxEFKfqbzjLlbI9b
 akHxbeEMOeCX2UIvmcQBRoaV5BVwy5mBvbYof7R9CWzhWsJTd+2lEQH1706IFkG5hBM5u8pWmTr
 vx1qSew7+Un1+IbwpHAIuRQLdISjdPJOZAkBH8RQmR5JcpCzbpA==
X-Received: by 2002:adf:f7c8:0:b0:374:c122:e8b8 with SMTP id
 ffacd0b85a97d-374c122e9e6mr7834459f8f.11.1725444671513; 
 Wed, 04 Sep 2024 03:11:11 -0700 (PDT)
X-Received: by 2002:adf:f7c8:0:b0:374:c122:e8b8 with SMTP id
 ffacd0b85a97d-374c122e9e6mr7834435f8f.11.1725444670975; 
 Wed, 04 Sep 2024 03:11:10 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-375f59f3d5esm4537053f8f.96.2024.09.04.03.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:11:10 -0700 (PDT)
Message-ID: <c63302c2-be1d-498d-8d81-fce6d068e08b@redhat.com>
Date: Wed, 4 Sep 2024 12:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 34/53] hw/usb: Remove MUSB USB host controller
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-35-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-35-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4i8VUHPDBL71

On 03/09/2024 18.07, Peter Maydell wrote:
> Remove the MUSB USB2.0 OTG-compliant USB host controller
> device model. This was only used by the tusb6010 USB
> controller in the n800/n810 machines.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/usb/hcd-musb.h |   49 --
>   hw/usb/hcd-musb.c         | 1553 -------------------------------------
>   hw/usb/Kconfig            |    4 -
>   hw/usb/meson.build        |    1 -
>   4 files changed, 1607 deletions(-)
>   delete mode 100644 include/hw/usb/hcd-musb.h
>   delete mode 100644 hw/usb/hcd-musb.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


