Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1224697ejc;
        Tue, 26 Sep 2023 09:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHLYd/lK7xhuEF++GQUmzR7fsXn7GTN6+WUN2lcDavOzNlCM7EA7iSk5DZzO3RIQoIfygo
X-Received: by 2002:a0c:e44b:0:b0:65b:239f:6779 with SMTP id d11-20020a0ce44b000000b0065b239f6779mr2528663qvm.38.1695745706523;
        Tue, 26 Sep 2023 09:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695745706; cv=none;
        d=google.com; s=arc-20160816;
        b=cyEaHSlT8BPs3WxL/vlwwiTIIDnFVmsIyrTayboVcv42fEZw2kgTEffRCruHu8B+hm
         RepM/wlxK47zw2yWqdHFSNGn3Z1I37dx7ZvXzBbC2SNwS3/gZGwDtzBrFRWD/7BZRfnL
         cOwcMQYEBekMB6Dy21f4MmPMeI6FVjpSJhfbmdtWuU5DdnRyA68g2d9TOwow0qjX93QA
         0QsJMUOgpO2HlLf6nv3FdrIueMghw596kP4kmtBYjFgcm9/cpjUO4/EESQ3UYAgn1jzG
         dcpLgOWxr4MiW94RnBy+3oJ8L2Y2vaijtK2rkJv36/3WfTiJwZ6P4T512nyzY4wAOeDc
         SPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+NMgrCV0pikA+288IrDGd2zfa082XxI+sgoR3hk6tUM=;
        fh=1XT7MX/fQwmwz/nRaE0QXvABQ4zsw5r830646m5EJ6g=;
        b=CQyc1z66eu6Yuek/eoSNPAZdlObnRDrrfme4IBu3MDpKauTqIS5CXCua+0M5Hq8h24
         gX7fYy9yX316GLMOAIOmmKzrD49dVuZMilOlv2XrmlNc4rat8O9rJU1QtEIRgkxENs0Q
         Ykq1cQkJ/d2yCWQ25gPo1u9aVnYcmxYVXYeU9Dm5WnOtE+4UbxhVcBTt7GgNty94Ztkl
         ZBBG/q6Kk79RS47LgMmAVSUr5LoOAkeyGtNSW2YUDHA1KOCr/+v2TwT69sGycWcLQRN0
         mt5sKJgg8S5hdr5E9PLGNViejUH7QGLE4TUk1o5UXgT/FnxI5+SYMHLXz43pcHVn1j4j
         kikQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WcGOaz+9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a0cdb0d000000b0065af3377f4fsi4728543qvk.562.2023.09.26.09.28.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 09:28:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WcGOaz+9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlAv2-0000zu-Vr; Tue, 26 Sep 2023 12:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qlAv1-0000zc-V9
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 12:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qlAv0-00072O-G9
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 12:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695745694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NMgrCV0pikA+288IrDGd2zfa082XxI+sgoR3hk6tUM=;
 b=WcGOaz+9a+uAh66kzbsvmbwOR7ZmeevVh4ZlcaSHm5DW6ey5VNvacJ3RONZ6hAW5e+BiVT
 NmOK0W/pO5chcR9q99htz+W055LLo2Ecv1ssO5zU/SVwxpe8XzI5ryfdbziFvkizfDUfi/
 xoO0e7vbUtOuKtXGf4Ly5QbX6G90Zao=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-1PbXTOEuM0auzowbTaqqXw-1; Tue, 26 Sep 2023 12:28:11 -0400
X-MC-Unique: 1PbXTOEuM0auzowbTaqqXw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77435bbb71dso704992185a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 09:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695745691; x=1696350491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+NMgrCV0pikA+288IrDGd2zfa082XxI+sgoR3hk6tUM=;
 b=LVxzxTb0onqnJuxbHrQueCchBmxxSm8qk1drL1L20/hTEUI3sc+JZp9mrQty0bnCWq
 EC9yRrSBU6M6SPOsHwWD0UWglsIkF1vmqpOKMQRqKXn3pq1jhiCGioodHxVyposU7sAr
 qgj9p0cSIO5N+lwEkO55RBmpes12+r3A/GQTzssazlqqPITjEmBAlmrnnoeDGM36p+wm
 NtL4Qnx6RHwcHsJ6zgRKFcwiE0sFyYAqiuwEd98Va42rNSiTM1DMQGv5RgW4u1ofghsD
 L43fZQjLGcm1Dcmszv0bpOo1+T/GoX+UL/iBYIxXFF0JlDIfglIRgCHUcRWBk8NxZZcm
 FNdA==
X-Gm-Message-State: AOJu0YzkrmK7KWDpngILDdgmyWAP6ZVJ7qyYuEKpLGnVYTZDtHNEeeMD
 qL9sBiWVjPuyBot7ZjqDAy02dz9glNVMIKnCSMrJqGt4z9ItqWJAu4aS3jtdPM3XMm8qgrZBUW5
 gi95f20D31xkk
X-Received: by 2002:a05:620a:989:b0:76f:22f7:408f with SMTP id
 x9-20020a05620a098900b0076f22f7408fmr8895569qkx.34.1695745691210; 
 Tue, 26 Sep 2023 09:28:11 -0700 (PDT)
X-Received: by 2002:a05:620a:989:b0:76f:22f7:408f with SMTP id
 x9-20020a05620a098900b0076f22f7408fmr8895550qkx.34.1695745690878; 
 Tue, 26 Sep 2023 09:28:10 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-114-189.web.vodafone.de.
 [109.42.114.189]) by smtp.gmail.com with ESMTPSA id
 g20-20020ae9e114000000b00774652483b7sm1092317qkm.33.2023.09.26.09.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 09:28:10 -0700 (PDT)
Message-ID: <a68e35c7-fd0a-485f-c0c4-7093e879c91c@redhat.com>
Date: Tue, 26 Sep 2023 18:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/22] hw/m68k: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-13-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230904161235.84651-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LJGpD+VNJ0wb

On 04/09/2023 18.12, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>    hw/m68k/virt.c:263:13: error: declaration shadows a local variable [-Werror,-Wshadow]
>              BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
>              ^
>    hw/m68k/bootinfo.h:47:13: note: expanded from macro 'BOOTINFOSTR'
>          int i; \
>              ^
>    hw/m68k/virt.c:130:9: note: previous declaration is here
>      int i;
>          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/m68k/bootinfo.h | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

