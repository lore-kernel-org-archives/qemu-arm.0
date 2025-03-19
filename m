Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp414020njc;
        Wed, 19 Mar 2025 10:41:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4XnJVeC+oBBgqq9bqILXKUJeCVcoG30hSp0I9tMqET8ONy1gHiN406Q+8vplAm0UpR6OsafGWp9aVZg==@linaro.org
X-Google-Smtp-Source: AGHT+IGMbZsBCM/yoafOZBRSud2keLDvWzVNlLydY25E2PAwHB7isja87CgmS9MD7YYrqstSenWG
X-Received: by 2002:a05:622a:248e:b0:476:ac73:c3f6 with SMTP id d75a77b69052e-477082e1df1mr67469641cf.4.1742406117400;
        Wed, 19 Mar 2025 10:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742406117; cv=none;
        d=google.com; s=arc-20240605;
        b=KCpu0O/PkkyzLt0Ma3j1xef6b/KpJbGwweFG8lU5QH/CuaiI/UJKWCjY9lRTheZiMp
         AseVZwjU6FG2wFmh0A+X2nrWTSmx8faNahcwCvbyo+xDehVn3N+UtpE6sEBek0TFNgYK
         Mx7PPP9btr3Ppf+bSj/KN0abooBik8Lc4g/1OnO2QhMsZYNXKG6xcJvFLJ3kKSP5/IhX
         +BavCkjyFaawE9r7QdBjkyZtUydzyIHeMprdqUdEeP0v13s6h2l3rKqEUn971yOgt3eL
         CLCBjoAU4oAwgm4DQCskdZK1ETdjCrqMkaAzD6QNM5l3wpS8xJ38uHWsc6MbPOIyZ54Q
         qBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=afKwMH3Ahotwp7v2I6DY6rbyXWrTqYfCiVPwabqxEe0=;
        fh=7Ik4UXzcG0L3TgVFSNcZETWAaSUYwW9X6EeXwUNgYmY=;
        b=iLGTRNkLcF0XCTwFDMbEW0geOmZheYPGzx084n5KS4HPhHyyobbq+42oh67glaUCW4
         fCds/i09zwXce5A1b1cEXoPU3k0vnExzm9yeiQ7Q2bJ80kcnJZ72eWvWfuGV9pB2UTmx
         G0V5Gd4wjPfVuz9lxSYGa66PHvAjVj6noJothRLr3j2z4JBi8paxNxQFpMhuTmYL/Bxp
         jPY7Kk6T41r4y+rbdv1ZvsLF/5TrRPsEYZhEM+gt0ZugGxv+ce/jJR0L0wDUHh/o3jCi
         3uyKhonyLRsNe5++3Jsz2ElG64p67yapSLF5SXV56HIuTM5frT0ABGbt+Xnz+yvyGU0c
         zslQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AMtl/kHK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb64caa0si138679331cf.189.2025.03.19.10.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AMtl/kHK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuxQN-0005xt-Oc; Wed, 19 Mar 2025 13:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxQ9-0005wE-Ct
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tuxQ5-0007fa-AX
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 13:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742406092;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afKwMH3Ahotwp7v2I6DY6rbyXWrTqYfCiVPwabqxEe0=;
 b=AMtl/kHKvkFqBx0p+gx8rwONhYF0plkUzk9DZGMORZGgKcwAbyr73tKUU+B+iV/ZOsigo+
 NFv7w3IilQWA/6dE7d049z22k6Xvhj2mtexSB1ahdRtih2MAqrhjfc19axlATxgxI0O91R
 J1jfmHrv0lklIfEr6WXDZNHqfmFFYOE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-9tc3LPtxMASF3Yo3_sCS6g-1; Wed, 19 Mar 2025 13:41:31 -0400
X-MC-Unique: 9tc3LPtxMASF3Yo3_sCS6g-1
X-Mimecast-MFC-AGG-ID: 9tc3LPtxMASF3Yo3_sCS6g_1742406090
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3913b2d355fso3101458f8f.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 10:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742406090; x=1743010890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=afKwMH3Ahotwp7v2I6DY6rbyXWrTqYfCiVPwabqxEe0=;
 b=ZLf1Ip3bKMnrtp402H8ibdXKqQl/DT4emG60Y64c6z9ODELPs8RdJ2bdv1bQScFBJA
 EJSXEfQSOh5okDm/yYDDiDJiUHOqVNegtChicuRNSDYa9Ka5D+xnjf8BIGosS74Lxwlk
 6aNBpBXdvZG+BBiNRqE8XrFWnfxlQCgrHZpHGzUaJe46eml6pry6x60p5yCu7cHqv3JZ
 YYH2pb9EEYw4radW///9YpA1RjDBmxezzgyz9JDHE5WUW+yx6NPdPwYxsPu/ESbjwaza
 29X8dyEym5G55EfFVpEhp03Z4afpufwZ1v2o9KCNtlhp3YgaII4Dj3HkQw0C9r3RjKQc
 9k4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvsMHxEPeM+ZlyQTdiJzSLuDTcYTKX53wxkjFac6/jj8T3rSYEQuEVOd7EJCF0vPaY4EOIUUTubw==@nongnu.org
X-Gm-Message-State: AOJu0YylpbcLWpzmN9NAljL6OZr/cwYTOw0MXXdjr6IIryh9iSYpvlHP
 Wo2RMTvkmow3c0sTGo9iLCnYk0rvGqFJYsqZZ03qjHvHtQvC3JnIbB0CM6XMCPfZgO6Rt0dRM8u
 OHbDwj9izWF2ziUI78V59RMlWBejPaCPcWNMBpgNGDswh4ZcYnw==
X-Gm-Gg: ASbGncsOMxExv/WJVmYyLJz15o5CnE9aAXKW2Mzk4DrFxoVQbgcQh/z6mBggDbgfGND
 NApVs+w7ivJRo/5RpNACwMb2tpjzauzoKQkQLsSo0nAHaIF+kuaHrkX3+YhG/ukhqDqOY/OwLMv
 kxqJwk9TQExBO0msoabNswyaNpD/EkVDcpfhjoXlOYnYW1VAw1iGrKevuj3v3UHvaj5Z1TqLPIj
 eRFqz8C76Gskrcu8d0GRaXA7es1q8kU/EH/Vl46k6iQnPZBR8TDW/FB8MFpCQKzTnOImavESY31
 r+Tkjnxu3pQClSpMZCvaTB5N1kYHHOOdcl+3pT+/8F7fQU5q68Tq64iZ5MzqFHA=
X-Received: by 2002:a05:6000:1448:b0:391:39fc:6664 with SMTP id
 ffacd0b85a97d-399739b4dafmr3659341f8f.6.1742406090109; 
 Wed, 19 Mar 2025 10:41:30 -0700 (PDT)
X-Received: by 2002:a05:6000:1448:b0:391:39fc:6664 with SMTP id
 ffacd0b85a97d-399739b4dafmr3659319f8f.6.1742406089739; 
 Wed, 19 Mar 2025 10:41:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b2bsm21102774f8f.26.2025.03.19.10.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:41:29 -0700 (PDT)
Message-ID: <79bd70c8-a0bc-429f-bc25-7bc5daa90c04@redhat.com>
Date: Wed, 19 Mar 2025 18:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/20] hw/arm/smmuv3-accel: Add initial
 infrastructure for smmuv3-accel device
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-4-shameerali.kolothum.thodi@huawei.com>
 <d75feb00-72d3-4d79-a7ac-2548eadb6a77@redhat.com>
 <Z9hh8MIAQNQcvNlG@Asurada-Nvidia>
 <71b73212-3d8f-4c9d-93a4-bf07c0f169e3@redhat.com>
 <Z9hzmzHfWw18OyGO@Asurada-Nvidia>
 <11895c78-d6ab-40c8-a500-4abed1565234@redhat.com>
 <a1a62689da8c43ca98a4379773db241c@huawei.com>
 <5a273945-3557-43f6-a235-1517d5db9b48@redhat.com>
 <20250319173444.GN9311@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250319173444.GN9311@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2pPAJbWEMKqjANXuKSm9uzHLfWi8Bw4ACQZtbK_fu1Y_1742406090
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fXuSSk1ctU6T




On 3/19/25 6:34 PM, Jason Gunthorpe wrote:
> On Wed, Mar 19, 2025 at 06:26:48PM +0100, Eric Auger wrote:
>> Effectively with ASID invalidation you potentially need to do both qemu
>> IOTLB invalidation and host invalidation propagation.
>> but this code is already in place in the code and used in vhost mode:
> Let's not forget the focus here, the point of the accel mode is to
> run fast, especially fast invalidation.
>
> Doing a bunch of extra stuff on hot paths just to support mixing
> virtual devices with physical doesn't seem like a great direction..
fair enough. Then let's disable the internal caches if we are in accel mode.

Eric
>
> Jason
>

