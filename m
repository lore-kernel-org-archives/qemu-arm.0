Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1589636lfm;
        Thu, 18 Jun 2020 05:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS3hp5v1ClsyKQHnbEVaGqsGRWQsvxfOUEsJlEGivnsbMTsjOJFoZxNiTJkJ+Qh+0RWyKm
X-Received: by 2002:a5b:342:: with SMTP id q2mr5945926ybp.64.1592483052096;
        Thu, 18 Jun 2020 05:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592483052; cv=none;
        d=google.com; s=arc-20160816;
        b=jjQCfMb5lar8ei6p2IveWUWcuvVWutEKupArc2n+JYbh4uiP85G4v4OH9hBIZZqqw9
         zPn6v9bPEDYbNyBB8KsqG/FOjlTwfMdg6z4tepMwjZM4jnL8zwMPYD03rUu4m1l9u7D0
         hzY0gzxpiKPZn4hJtR4SK2cZDAyNKRMtjc66L2hI+RNv39jH4NGPTU/OTfQRamJCJ7bl
         dZivsgGOuxV7lf/5J/a0JVBKGpUUyhwx1PsLs19OF/S5PSwpcx4wyyOo3PNkEXdNKhuw
         p5PHiKFm2awN3axHa13DynB4SO4hAnYI3MzlUE2nqRdPG6JUUoSlA9Q+Yr9dvNElZGv1
         7zTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Kz5tISaCr8JW6TKiu/3hqmm/CJ/vinGNMO+FowNE3QU=;
        b=HVEhcEGFLWXstHSjXrwaVkj/s65fwwJIxXqEp1LBUzKzocBNoXxtd3E3FjQjgqLnUI
         PhVP4gO3xarwBBSuNbBl3SC3mJTfb/JCfiwo//uUdZ1i9grWdw2ECtRkIjlKxtprt+82
         yE5YAydwwImXSHq48kjocmW5+s5ifUyRaPeG2TAnBVUYmGGoTXCzj7FLxVc7wOtPhFux
         pRX15Hc7vVWGUWWuzbKN+sdhEpvrI2RViiWDTOinyN6W4dPoT9RoU8upGQ6zaK49GyEF
         YHC6Plg2RlwEhksJUHKRRNLO9F+NteJER6gLu5J/Fy/jDOIPGyMJeQZwJ5sDQ9Pat7u+
         qdlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UuziBccx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d37si2622811ybi.96.2020.06.18.05.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 05:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UuziBccx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jltaV-0006hH-7j
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 08:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jltaN-0006fb-Nr
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 08:24:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28238
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jltaK-0002yh-J0
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 08:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592483039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kz5tISaCr8JW6TKiu/3hqmm/CJ/vinGNMO+FowNE3QU=;
 b=UuziBccx6lry4dVfKYjCHt2c/IZdasIzVIC9BLiHRjvDMRR56FsAwu0s8l6dyrp8Z9ig6G
 zY2nkBZE9sv/Iv+sM7ml8APgX9ShiCIR89btorepXXTtiwVIyEICq+/zFLM/qRx7Gq3YJs
 eYUB2zLzfx7PlfFz5zPVGV4ikw/VcIA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-UCD9L6H2PB2HqRkJeM3wSQ-1; Thu, 18 Jun 2020 08:23:54 -0400
X-MC-Unique: UCD9L6H2PB2HqRkJeM3wSQ-1
Received: by mail-wm1-f71.google.com with SMTP id t127so664260wmg.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 05:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kz5tISaCr8JW6TKiu/3hqmm/CJ/vinGNMO+FowNE3QU=;
 b=r0UpRHFPKeJe/K8gRt5aBvlEmTjGr8Apl3EWuprgy0G74G2QkMQ9DglvLfIy6XAe3f
 21z0Vv+NRXzeqnEh7NaUeKk7XYmlsIKPuq8p/1Yankj42qL2Ma9yR0XIza+Uwaq3R4u7
 xa5jWCI+YK4KOvrCiQuwP5hLjoY9FPMQDdYX5DFXvCzBv+fI3XRf8rpkY7sZjdL+U9Bl
 XXr8jbxZKvhOCnGWK1EwUVwXSAvPlhmS3JVd36A26YgXVIbp0HZKcdDJzJ0Dg2PY9PT5
 KSy7ja/EmzsQGG45NqJxUHrRxOyXGfw0v3Wl+Bhr1P1/vY4S4aye4jvN6F5wwTaMjeue
 wTNg==
X-Gm-Message-State: AOAM5321OttPewqmgBvXxeriNKnNatlrfNZZ/c6TGXQBAQfIG/zl+fAk
 52iXSIrTd4wn5/EyKgXeFoOp/7wha8WG9hiLbHonBB5c49ItfwCqGtMgLl6OOfsSBnil2Hid5aU
 dyrsmVkVmFW/6
X-Received: by 2002:a1c:c357:: with SMTP id t84mr3278505wmf.155.1592483033008; 
 Thu, 18 Jun 2020 05:23:53 -0700 (PDT)
X-Received: by 2002:a1c:c357:: with SMTP id t84mr3278478wmf.155.1592483032769; 
 Thu, 18 Jun 2020 05:23:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e1d2:138e:4eff:42cb?
 ([2001:b07:6468:f312:e1d2:138e:4eff:42cb])
 by smtp.gmail.com with ESMTPSA id o10sm3380558wrj.37.2020.06.18.05.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 05:23:51 -0700 (PDT)
Subject: Re: [PATCH 0/7] misc: Reduce QEMUTimer pressure by using lower
 precision when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6170c76-27d3-c3b2-e32f-427fea769350@redhat.com>
Date: Thu, 18 Jun 2020 14:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200616075121.12837-1-f4bug@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d+uvh18dIl6y

On 16/06/20 09:51, Philippe Mathieu-Daudé wrote:
> This series contains few patches resulting from the notes I
> took while reviewing Mark ADB series last Sunday, in particular:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg712078.html
> 
> I have another patch for hw/input/hid.c but I prefer to hold it
> to test it more.

This is in principle a very good idea; however, util/qemu-timer.c does
not use the scale to coalesce low-precision timers with nearby
high-precision ones.

Paolo

