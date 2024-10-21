Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2232607njb;
        Mon, 21 Oct 2024 01:54:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+qtuoRguqyUZUGveuBT8c6se/nG19/IAajSRaL47cJ8zvd397Zrv0/JVllM9RbHiGbgpABXphS0GrLA==@linaro.org
X-Google-Smtp-Source: AGHT+IHRM5wWvKoDtQEvkKRswiqG4t/9kgp4N3Kwbc8FY8LUrV0bx+0pPtGTyaML81SnwC/1GDQE
X-Received: by 2002:a05:6102:c11:b0:4a4:8928:718d with SMTP id ada2fe7eead31-4a5d6a91eaamr9241536137.8.1729500851004;
        Mon, 21 Oct 2024 01:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729500850; cv=none;
        d=google.com; s=arc-20240605;
        b=Rloi+b7UHyrf17qxaJDFHK1iUq2c3mHEuUdCGNyGKFNVqH1OEhZaQir2aUvGMbxssD
         2ehCA9EKFWk3fXxKQZ+1drxMPmXrvb4hzRZwgqSSzwlcWnQOIVgKbXPtKm+uSxgba3EH
         M5W9Kui+353SEFNuGnId6cMxn7IW76gDxTk1G09GnM9aJi0M+TWjgJELHLNoRRO9GCCr
         aNt/AdJqzAH5tsoK96T4emQVuTQpfV/2vRGU/k5LOiigr9g7jkFE/vP1ub6GYYio6pZa
         GM723YcBL2WTsusdDf3DlOH0MvwyLaUxzqKqt9PmEYyFGhgmmERX6oMLHXpdrBfmpuxx
         dZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=pSyft37zKTsJu8mIKbb8XVLBAhQ26+vK65BHoG7p/JI=;
        fh=DW5/M5cjvE5Ndi/jh2s7QATA/9BuByW/DDiYFv/3hrk=;
        b=TNTXpFsvcVqGrp1sKZO8s7kyg04Opm1yMov6wAT/SvCxr5NzaA43773T3fpCdCltj1
         DfVDPPite4dER7tl+QiF3JW/a8mf1wQGGypxmdqBpM+9knmTcDPM90wlIXkuYhTC4K8N
         5ry0WJsc/BIFGmdrIlGGWtrmladxBzFCd8U4jn4OeEaJbJKVdtoSL4IW2AnK3sgABVx1
         kaNIj/0TRaRsmc/v+yfhQoIM/+BgEhPOOLwb+17/bj762Cqyiz7b3cd3GP4PjcaFnmbj
         TdxeuMMoehjHPmNBDUvdkwq/rCmTiLODl2uGZbWKSndb1oNeQeC2eGHbc0sQAXmkDCTe
         CtEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQoS0xIS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d150e7si37622891cf.470.2024.10.21.01.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 01:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQoS0xIS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t2oAm-0006uh-OP; Mon, 21 Oct 2024 04:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2oAl-0006tp-19
 for qemu-devel@nongnu.org; Mon, 21 Oct 2024 04:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2oAj-000762-N0
 for qemu-devel@nongnu.org; Mon, 21 Oct 2024 04:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729500833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pSyft37zKTsJu8mIKbb8XVLBAhQ26+vK65BHoG7p/JI=;
 b=DQoS0xISbkxFm2eHIkpFy0MjPzO890j+AgnnNSm4wg3MrCwdUQbY9ZmpZnizwBAVvZu4FI
 w834D5n3t60HWWzvY4uDjPr0XEfm8GnpNoX2MlF+2T1tchtSUbAlUpL1Yxz4ILX5jcWvPP
 jjqjsUrx/9qO7xkIejZ82Q97kBx4tNw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-4USrtljAMXyTNJSxby0edw-1; Mon, 21 Oct 2024 04:53:51 -0400
X-MC-Unique: 4USrtljAMXyTNJSxby0edw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4316138aff6so24293045e9.1
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2024 01:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729500830; x=1730105630;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSyft37zKTsJu8mIKbb8XVLBAhQ26+vK65BHoG7p/JI=;
 b=n+uuMR86ht8riErJwGMz8HBZU5EYFzILOH2ryDANMbonTxJlev9Twd4T7QJDh4Y5LW
 4k+OfSLleJaBkYM4vyZ6wt3fmamSEApiIQA/K3MbWanPCodW+XA17KO7Rw4+9lMM4YjS
 XbEr5Rzvyi/EQK4kv1J3WXFI6OmuHMqN+m94uUdBkRsTGGVqkceQS/vfcoWZ08l2jYtF
 QqBy5+1M4T6KNSGiewo/SljCoHYyGRNJEy+LZa2X20U2HEAWE8SHH0KCz+zMSG5g0N3h
 Ey3A79xjaczY3PHH8g64yEO3f77+YRGWuHUcYGPeUqCQ4VC+c1NjBtlY0IdDfope+HZW
 hb0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHQ23P7KFua2E7eAHxZUPeOmeAVGDnVEQ+z+/nSxmkaURrK8dQUVMAMH/96qfYN3XN6PlaBcvj4mOI@nongnu.org
X-Gm-Message-State: AOJu0YyRlht8upZ/pfM/IDKTi7PMpWiclCgAhh390+EmJuqKBYtpUjcf
 /WGrJInLHkAzZS7MbAtYEO6bB9d8uQdfMYu+oOE4VDh+YM1zIVnK6XvU1J1Qx92LPlEjito2Oxf
 BN2LAwrfpqxjl8kaTiKRKXDjs+Z5DQ2ZRrRNUY8Gmx52+YhjDop1H
X-Received: by 2002:a05:600c:1d27:b0:431:4e25:fe26 with SMTP id
 5b1f17b1804b1-4316169742fmr71862355e9.27.1729500830017; 
 Mon, 21 Oct 2024 01:53:50 -0700 (PDT)
X-Received: by 2002:a05:600c:1d27:b0:431:4e25:fe26 with SMTP id
 5b1f17b1804b1-4316169742fmr71862165e9.27.1729500829680; 
 Mon, 21 Oct 2024 01:53:49 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cb918sm49624265e9.41.2024.10.21.01.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 01:53:49 -0700 (PDT)
Message-ID: <f1249e0b-290e-4416-a776-3f5d6ada1ece@redhat.com>
Date: Mon, 21 Oct 2024 10:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/functional: Convert most Aspeed machine tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 berrange@redhat.com
References: <20241018071726.2723934-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241018071726.2723934-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.527,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hj6zhMYlekVW

On 18/10/2024 09.17, Cédric Le Goater wrote:
> This is a simple conversion of the tests with some cleanups and
> adjustments to match the new test framework. Replace the zephyr image
> MD5 hashes with SHA256 hashes while at it.
> 
> The SDK tests depend on a ssh class from avocado.utils which is
> difficult to replace. To be addressed separately.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---

  Hi Cédric,

I'm seeing errors when I try to run "make check-functional" with this patch 
multiple times, e.g.:

   File "/home/thuth/devel/qemu/tests/functional/test_arm_aspeed.py", line 
111, in test_arm_ast2400_palmetto_openbmc_v2_9_0
     image_path = self.ASSET_PALMETTO_FLASH.fetch()
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   File "/home/thuth/devel/qemu/tests/functional/qemu_test/asset.py", line 
104, in fetch
     raise Exception("Asset cache is invalid and downloads disabled")
Exception: Asset cache is invalid and downloads disabled

Could it be that the tests alter the file in the download cache?

  Thomas

