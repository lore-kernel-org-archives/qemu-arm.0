Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp672802ejq;
        Wed, 24 Jan 2024 18:22:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9rP6JSStA7Q8eT5/dlajPCxZHWOrVXTOPBeV5t7MImzN1ACsaX2CIoIrZbykhTexZZ3Hu
X-Received: by 2002:a0c:e30f:0:b0:681:8cca:d2f4 with SMTP id s15-20020a0ce30f000000b006818ccad2f4mr897458qvl.25.1706149341982;
        Wed, 24 Jan 2024 18:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706149341; cv=none;
        d=google.com; s=arc-20160816;
        b=bMy0NdCqWuKZ9ml+Y3OO7dZJmDTn6ARItLsr4fJOg/U6P6AXFpEeqd7rIBg3yP47S4
         4S20q5yt3Bwzbu834255F4KeUMEhMaWCxY0oJtYHgg66cORLoLzN+HnVZxprynAuHhgN
         sx3erzxL6uOhQLkSo422nCH2v7+l3Y0ZoppozsRZKqTrzMCo8O8OCjbcDB2CZiIpfsno
         e1h+HQjx/cH6ySFXJftcPqqvnlZUshs2wOjRtCUT/lFKNlPviiWfNfJGgE0xc5KJrHrI
         ChO7t7J8+qIU1UR4ANOXbwNd4IJW8HlBw3fiTFY93ZxaFSvJdcaPFgW9CviB6JQTHmzX
         eFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lEOrxI9RFs6RU5kpgER0lGSy8A1ollOCifMGkiBWO34=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=l9gZAR43vvFVIK+sDvZhk7cSEu0vc0czCo9PL/nPLUzVG5ZS9YA8XD0rYJYuzIoqvp
         Zd8uaVtUxVViFRN0/c38bi6HNxVeeBsBvYH+0ho37Yg4ltZQ+dzVWvpFK7po3FXFOWfh
         LvEA192rObZQAJ10UO2ip3v9XSrluF5/ec8l7muOeulKW0D6QqCQHNqXrkuSy4Tatezj
         U7nZ+akkQpFdns2CnX+Zjx6irIFvbiAg4LPcbSjNLrN6EQziuhLMrRGqWff/TFMdjnS3
         hXAMwU+jYKL4D0EEmk8bfNN8gnmis4Xd7w4aHVsSRxp1CrCow0szdUyMwIUIQtzO0gnA
         MgiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VdTOcQO5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a056214224500b00686f96cdafcsi552436qvc.311.2024.01.24.18.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VdTOcQO5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpNW-0006FN-0d; Wed, 24 Jan 2024 21:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpNT-00065n-1F
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:22:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpNR-0007cG-Iw
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706149321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEOrxI9RFs6RU5kpgER0lGSy8A1ollOCifMGkiBWO34=;
 b=VdTOcQO5sKsu4ConuPO+im1rQ2jim+EcQWPfmJefl8v2stLDPWuMS5/65fltUpgOyoddYw
 8WU08eHurtgecvl8cneEACGbRwcb/gN46+pZbLYOZQehT9138cE1CRte5DQRgMH3PES2pi
 F4S8Vh2FMQl+vPlIfdY4eA5bokvlbOs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-uNpBQ4TmO-yRX09_JyN-PA-1; Wed, 24 Jan 2024 21:21:59 -0500
X-MC-Unique: uNpBQ4TmO-yRX09_JyN-PA-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6db0c931f7cso228569b3a.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706149318; x=1706754118;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lEOrxI9RFs6RU5kpgER0lGSy8A1ollOCifMGkiBWO34=;
 b=pm168KgmWvb+kgVgo3Erk+vA9ATkcm0cSt/C0VOpxWQFaYqwDNFbEeZuO4OZdYrumz
 JKnCyBM8uBTQWtxg2k2BFdj1oYX5wT585yMCgTNfMx0DaGkGFEob4SL8hU44Uqj7/b+h
 6sg1Okt70UOdRXk42Bjh9DbniQe1hzNJipEM0MmKQuk02IoDnhgy3FZSCxMskFUXK3rF
 CWYv8+N3O+ioZGxlWWHBTJwl9U19GjyPyavwe/IeqghRntNfeaO5LNcAvvQDyspFCSrQ
 PPkHNzMbYuNk3i9Vc6SaB+BVFT4auWMZBsO/E9eUrE7IJRvLGYUXIAS/s3s7Adtb2wXz
 fajQ==
X-Gm-Message-State: AOJu0YwYe7R2CajnT6lWhsXSoBU7MQQJPimk9HPGyVGHh/fbtQz7Alhq
 epoMnYtz6Fu5/IgG5EcWilWriaXUQuklQskCumMo2elGZ0xvcGM3DrgG05PFOAHkXRiSQ2Dxeo2
 NHIVexAs+HBjuk3MOswixjWefGQbiWSOx9t22cfIBYdxjCQ+Okw==
X-Received: by 2002:a05:6a20:7352:b0:19a:9973:2b22 with SMTP id
 v18-20020a056a20735200b0019a99732b22mr311441pzc.40.1706149318302; 
 Wed, 24 Jan 2024 18:21:58 -0800 (PST)
X-Received: by 2002:a05:6a20:7352:b0:19a:9973:2b22 with SMTP id
 v18-20020a056a20735200b0019a99732b22mr311429pzc.40.1706149318011; 
 Wed, 24 Jan 2024 18:21:58 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 e25-20020aa78c59000000b006dd8300c68csm3469882pfd.186.2024.01.24.18.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:21:57 -0800 (PST)
Message-ID: <07c7838f-0a8b-4e9c-b96a-464fcb42eab7@redhat.com>
Date: Thu, 25 Jan 2024 12:21:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hw/arm/aspeed: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-2-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123224842.18485-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: LnO0ON8DWzC2

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> Remove copy/paste typo from commit 6c323aba40 ("hw/arm/aspeed:
> Adding new machine Tiogapass in QEMU").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 1 -
>   1 file changed, 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

