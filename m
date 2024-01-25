Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp669908ejq;
        Wed, 24 Jan 2024 18:13:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoHzYcRZIhs5OftzmVfcz5RoHTf8aAeSuOm9RRjIvpiAT9QLN9EN02FH38S4FZWNBD5Wk1
X-Received: by 2002:a05:6830:2aa6:b0:6e0:f9b3:832c with SMTP id s38-20020a0568302aa600b006e0f9b3832cmr146154otu.53.1706148834540;
        Wed, 24 Jan 2024 18:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706148834; cv=none;
        d=google.com; s=arc-20160816;
        b=a/YWLrlBhwIthyxK0Q9vvnAr7b/8XjUp5ltWIcDd5B2fQu0mBuQtqyP5+FUOENGMlm
         Cd9GZ+D1JP9W8v8qo6pm0r44yMPf+Cv1jdVz8G3lZLTRVHULDt1RmVmcPhASOhXZybVK
         7uPdZec6gO3LIwJKjGZVL7aIjrrKyBPsGUB4BpaoPPZMJCbuvwXaMy6Ci8cCxvnoJuHR
         05JORC0BOSI/6vmaR0RefWTyVMrAzdwsSjpb0AfziyGGBKHBx6yRHRvK0Squ6pOBp4hT
         +r6x7LV402b2kUGo72UfCakiLMy9RMdeE+hW8T9BnBEEeK9Q8xenMDHbnU6UvpnCIYkL
         yRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tbOWVHLWrEllIjLWxH6N9QIFGu10xS+Eyveo/tRa8wE=;
        fh=39N9WEP22ZX5RpcHhH9m770ca1Njks1d53douB51LrA=;
        b=AjmmXdL6p26sxTG2UESVx9C+dR90PUUGCBDbvhb9kGIfPegSw1WN1PC02HZh4cnRG/
         lVM6H02kJ2hyBy62i9DEg2RX01WE1vIO1FkUaRG2eARKT4jwWxa6gdZ5DM1d7537XA+E
         Q43QhATj7gwx67nHdZI/o/00lR4W8qy/abXD3VB04kZqF7S7aduHe8qgV50vvLGrQxVL
         +95lOizNP/aQLt7IVPO0mHrBJMQjseXaPirwJDtUEiwUupBxIvd5MFTkwZzYVe2Yb+et
         j+OIVMQRZcA3i1y41CcEOpq9m/UyuHpLkrHOq1EL0NVXMsm/ivjeNAhnBDRzrXViWtQj
         Oh8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JGc3bjw8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a0cdc8a000000b006852904842csi11878018qvk.276.2024.01.24.18.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JGc3bjw8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpFM-0002X9-Gl; Wed, 24 Jan 2024 21:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpFJ-0002Vq-Op
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpFI-0005jY-C4
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706148815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbOWVHLWrEllIjLWxH6N9QIFGu10xS+Eyveo/tRa8wE=;
 b=JGc3bjw8u/B0lIfEn0tuZJciy1lCFebKXQQB/u5KDwKu7iRBBRPwqKnWkjBvBoE/KNY77P
 3Y0oz55r+/eS78j1ghHEys7GEowPVNXWV52hUscDELFl6/C2TcTX35yXxXy30e1AfUj/1F
 hp8JnMojQpalsJ1VTKLXmvtGjnftfMw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-GkNKn5KhMp6bAAYONXuAcg-1; Wed, 24 Jan 2024 21:13:34 -0500
X-MC-Unique: GkNKn5KhMp6bAAYONXuAcg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6ddd005c848so69567b3a.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706148813; x=1706753613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbOWVHLWrEllIjLWxH6N9QIFGu10xS+Eyveo/tRa8wE=;
 b=i31JLFMjYlu8IIVPiV4yOX51kz45BNv/Kzm6LlWqZKUbI7wJNcQRcJpqOXnotNytyz
 X7SiqhgDUjwEZJFUPtf4Zm5WSsLdlOOKOi9983LEucPGUS/uQFxIDCL/AjEaKP0h6Yl5
 dSDREfi5QXObrnGWTUUrXAVNd0Hvzzt2+gPTOs72hdHu0b2jVSkzQ+w1C5F4l/VcNnE/
 NyyS23zamh+gzqN810RryFqyCT6BEQJiZ41O/L7ElCHOyI7Lh5X3xLDCM7IX3WIt1IpB
 bMBdSJ1jYYj0bQuiqJyTk/1bjYziNzeWVmthIx+bk2n4zNUFCngUHnNHewe/ETqL6fnt
 ZG/w==
X-Gm-Message-State: AOJu0YxvDrL/MrYpLfhos7Qa9zu8cxNi8RM6gA6vjYHhPLoPv+UgvojE
 6lZSOl63gXrWEwkJRzp+wqlr04gHHkLQNDkXtnk/s6MMvkOy59PXiy5Mfpe9AoOJcsrPrGSlNPd
 Rhld0kcOHmWLdJm5dKKfWfUEa5nKwi/lYU1bBj+LtPRDaW3DXpg==
X-Received: by 2002:a05:6a00:2295:b0:6d9:8f6f:6b7e with SMTP id
 f21-20020a056a00229500b006d98f6f6b7emr168343pfe.56.1706148813195; 
 Wed, 24 Jan 2024 18:13:33 -0800 (PST)
X-Received: by 2002:a05:6a00:2295:b0:6d9:8f6f:6b7e with SMTP id
 f21-20020a056a00229500b006d98f6f6b7emr168323pfe.56.1706148812759; 
 Wed, 24 Jan 2024 18:13:32 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 b19-20020aa78713000000b006ddc661a619sm423036pfo.7.2024.01.24.18.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:13:32 -0800 (PST)
Message-ID: <4adbafc5-82c9-4182-bda2-0b3ebf2022ff@redhat.com>
Date: Thu, 25 Jan 2024 12:13:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] hw/arm/highbank: Add missing QOM parent for CPU
 cores
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-4-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123222508.13826-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fVpS9+4zkOXz

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> QDev objects created with qdev_new() need to manually add
> their parent relationship with object_property_add_child().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/highbank.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

