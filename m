Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3833957njc;
        Thu, 27 Mar 2025 01:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMQk+OIwoXjYr0MQJIxoCJTPlwuY1H96hJBJvExxjsqTaGclVMQobsff5TGYfJNXIyh43daubskUKdfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF7GgXom+99kBn9unxK0pFDsObY9YSecSUvCgcaWAa04xsx1cuMnenet+yxUKJAqbGBhYbs
X-Received: by 2002:a05:620a:3703:b0:7c5:5003:81be with SMTP id af79cd13be357-7c5eda64e43mr416788485a.43.1743062628207;
        Thu, 27 Mar 2025 01:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743062628; cv=none;
        d=google.com; s=arc-20240605;
        b=N4RzseeflkRztZbIXUIl5mU+DkcP7k/kopjAUcakTWqaiEvx3otkd4aQPFeZCkN4w0
         rY9+12j63KKw1242W95MMoITJB/LO4PSn2Or9RANCEaiu6huJ2zBoShS7bEBNdQTfe7/
         mAasSkAoqw87miuJ9ym9Vvyk1wWnsJp/tElHTQXA0TDXFnfskn2iyhOFxJ4gJHUIkIbM
         C/2Z0JDBm/y8zjer0wvVpCzfpvGb33vqd3xa+IxUssfOis2N71DvbpORqnxvFX9VZu0W
         /ak8pk4MrwSIFcm4EJZu7f+0++/Ie4luCW1kwskvdLpd/wagPfaj8Q3+N+e6C7Wx6Ad/
         XtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KqiZ8b0K7F3/LhHoQ8DE2457h5HuEEasSkiMMWavqyk=;
        fh=VvIWhYQ0nD3x16px2Sqgj7Y+irN4uqqh/osl//AA+Rc=;
        b=Qq8FG5VFYpsUN6QMhPEqo6gaPD5RChSHpJv0pGE3t6cH2JEzgx3ErPZKEOFQuFkrTJ
         j7ehinjYgFpxfB5wjYSRJtbt0R0SJ6ZtwqKuvblg0s0kEptTF/p/p/h4FIqrKp3v3TOr
         dJiiU3p8TMDdHpYguu+TS44WqZlPbD412vGlanH5mZemeIs+JIT+LnIS9QZNiQ0kc+nW
         4HAEXLY4XfqSRzWKK65M680mcQZXrso6x4zv4D0MgUCmF8nHt7WnelzLW75CAWD+VSsV
         pVarPj9XAzOgxISzCzL9QMNN8l2x/GltCAOCw4dESPZYjQrLOVTz/XKJJHjN2q+9BY9G
         U/aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHIWb6Px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9347fc6si1277744685a.205.2025.03.27.01.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 01:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHIWb6Px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txiD9-0006sX-Ch; Thu, 27 Mar 2025 04:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txiD7-0006sO-UZ
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 04:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txiD6-0005FD-Bu
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 04:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743062611;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqiZ8b0K7F3/LhHoQ8DE2457h5HuEEasSkiMMWavqyk=;
 b=fHIWb6PxB8an6AX6UsUP2YLVMfCM5kfAq65tEbe4biK/uko8691eij70pfS6zi3E4iwBbK
 m6AqXn0H5D/0yBX5qWKVzUHgdJBtNqDG12mfLUbfJsHSpNP4Wywe++kmCeHb1B2v1s6jzJ
 Pf9yh+9PirNQn1uP5TtwXJbkVoxWvCQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-_RGv-w02Mh6UAZL1DHYAgg-1; Thu, 27 Mar 2025 04:03:25 -0400
X-MC-Unique: _RGv-w02Mh6UAZL1DHYAgg-1
X-Mimecast-MFC-AGG-ID: _RGv-w02Mh6UAZL1DHYAgg_1743062604
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3913aaf1e32so347826f8f.0
 for <qemu-arm@nongnu.org>; Thu, 27 Mar 2025 01:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743062603; x=1743667403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KqiZ8b0K7F3/LhHoQ8DE2457h5HuEEasSkiMMWavqyk=;
 b=QYB0fmnj0eoLs/ZL3j5ZsWeNFkMUEPDTnUJ5OOFYUthUY5WjEwNY9eAp3i8BxtlEwC
 PLZTLfX46ylbPZkDjIT4Oeb/4uDVYCW9lkBV9DeK2D5EvSL/oA2vqFqpYrlIq6ZpHqYC
 njt+jyRcLCGz1bKh6eiK517j+WFgjJK0lRe/iBiXskECIbKcBEnTpb6imdFE5GXnzpHT
 RtzKtzw6Yvq3K+FjNArVkKoYu3zmE3RzSW6X3/Yv9SfBJ6lQoTNHe9vonMi/aHBM5ztd
 R8u12ROT1NItGQPIroYnYSH73Twf4vy5krhb4xs78lw2wN7Hq7NpAcsjfmBM9qZ6oYmn
 /uaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmcNzuhPLf4nkr7sxVmIJmE6a+Ofrtl7xo/IfZYzh18ml78eYds8NCT/TraICQ7GHoDEkwafGV3A==@nongnu.org
X-Gm-Message-State: AOJu0YytAF+zWlruoAiQstk1fsjA3y3ubGI1Dq3Pk9rnZCaU3kdXdJXA
 HNVqq9agJOxrrT7QwE+MOefFji+vK1KJQTkv9Hr/2DzFfH8uVuW6PqY7RgK4uJ0RApWgCn4Umj6
 ufWvEnhMSF+iiRvIAFOwfynMbclxcbBIt3gmQhfp3Z3ilqjvQCLgaZHh0vw==
X-Gm-Gg: ASbGncs4AXkXaxOR95qmOJq7/gxMSPZCj+yffjp93US1ejZOtm7B6nMZ7ICvuWlyfTq
 8ijUf0yIysCGhYTQimMX37FjE7Ey1Lausj2G22bsJNtzHBnwdRetobewnW2kvmv+nLWVNzbVd0t
 FXe+XwXJhXzXQBOLyLLB3US26wl0BTQPKVJOHxTHmX1BMjohfy3BsGQjOf6DDiLV7cnDw3OsBQX
 fgQkNUdgyDJvBmfyXVZBLszLIXhCefm2dIF7A4g7X8uvXxEP9ekwXGcfD6XJgB2QJZFpi2+tsvV
 p0c7wWm2NPBCaAnuEB3deKpSoZi3zql6qDMfPnOxQkon0fQBzc9zD0bjmMlYsR0=
X-Received: by 2002:a05:6000:4211:b0:391:12a5:3cb3 with SMTP id
 ffacd0b85a97d-39ad173d283mr2019548f8f.3.1743062603472; 
 Thu, 27 Mar 2025 01:03:23 -0700 (PDT)
X-Received: by 2002:a05:6000:4211:b0:391:12a5:3cb3 with SMTP id
 ffacd0b85a97d-39ad173d283mr2019508f8f.3.1743062603045; 
 Thu, 27 Mar 2025 01:03:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e64casm19147079f8f.73.2025.03.27.01.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:03:22 -0700 (PDT)
Message-ID: <8ccf83fd-0d32-4491-a812-f1d29d44f08c@redhat.com>
Date: Thu, 27 Mar 2025 09:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 15/20] hw/arm/smmuv3: Forward invalidation commands
 to hw
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-16-shameerali.kolothum.thodi@huawei.com>
 <af531bef-4597-4729-bdcc-f6b7e3647266@redhat.com>
 <Z+RVM8Cr+EcnhDaJ@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z+RVM8Cr+EcnhDaJ@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4lXnpCWD1yxw2dX5qlllc4GmnUdArcC3CtgTeLED6Yg_1743062604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: uWNnmXjGkiNe



On 3/26/25 8:27 PM, Nicolin Chen wrote:
> On Wed, Mar 26, 2025 at 03:16:18PM +0100, Eric Auger wrote:
>>> @@ -1395,6 +1403,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>  
>>>              trace_smmuv3_cmdq_cfgi_cd(sid);
>>>              smmuv3_flush_config(sdev);
>>> +
>>> +            if (smmuv3_accel_batch_cmds(sdev->smmu, sdev, &batch, &cmd,
>>> +                                        &q->cons, true)) {
>>> +                cmd_error = SMMU_CERROR_ILL;
>> I understand you collect all batchable commands all together (those
>> sharing the same dev_cache prop) and the batch is executed either when
>> the cache target changes or at the very end of the queue consumption.
>> Since you don't batch all kinds of commands don't you have a risk to
>> send commands out of order?
> Yes, that could happen. But would it have some real risk?

OK. I don't know but this needs to be studied.

Eric
>
> This practice has an assumption that the guest OS would group
> each batch with a proper CMD_SYNC like Linux does. So it could
> reduce the amount of ioctls. If we can think of some real risk
> when the guest OS doesn't, yes, I think we would have to flush
> the batch if any non-accel command appear in-between.
>
> Thanks
> Nicolin
>

